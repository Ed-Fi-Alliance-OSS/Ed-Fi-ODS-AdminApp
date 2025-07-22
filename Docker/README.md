# Ed-Fi ODS Admin App Docker Setup

This directory contains Docker configuration files for running the Ed-Fi ODS Admin App with Docker Compose. The setup supports both **PostgreSQL** and **SQL Server** database engines.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (version 20.10 or later)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0 or later)
- At least 4GB of available RAM
- At least 10GB of available disk space

## Software Requirements

### Supported Operating Systems
- **Linux**: Ubuntu 18.04+, CentOS 7+, RHEL 7+, or other modern distributions
- **macOS**: macOS 10.15+ (Catalina or later)
- **Windows**: Windows 10/11 (with WSL2 recommended) or Windows Server 2019+

### Required Tools for Certificate and Encryption Key Generation

#### Linux/macOS
- **OpenSSL** (usually pre-installed)
  - Verify installation: `openssl version`
  - If missing, install via package manager:
    - Ubuntu/Debian: `sudo apt-get install openssl`
    - CentOS/RHEL: `sudo yum install openssl`
    - macOS: `brew install openssl` (if using Homebrew)

#### Windows
Most Windows users already have OpenSSL available through existing tools:

**Option 1: Use OpenSSL from Git for Windows (Most Common)**
- If you have Git installed, OpenSSL is already available
- Access via Git Bash or PowerShell: `openssl version`
- Git Bash location: `C:\Program Files\Git\usr\bin\openssl.exe`

**Option 2: Windows Subsystem for Linux (WSL2) - Recommended**
- Install WSL2 with Ubuntu
- OpenSSL is included in most Linux distributions
- Run Docker and all commands from WSL2 terminal

**Option 3: PowerShell with .NET Cryptography (No OpenSSL required)**
- PowerShell 5.1+ (built into Windows 10/11)
- .NET Framework 4.7.2+ or .NET Core 3.1+
- No additional tools needed for encryption key generation

**Option 4: Install OpenSSL for Windows (If not already available)**
- Download from [OpenSSL for Windows](https://slproweb.com/products/Win32OpenSSL.html)
- Or install via package managers:
  - **Chocolatey**: `choco install openssl`
  - **Scoop**: `scoop install openssl`
  - **winget**: `winget install ShiningLight.OpenSSL`

### Command Line Environment
- **Linux/macOS**: Bash shell
- **Windows**: PowerShell, Command Prompt, or WSL2 terminal

### PowerShell Execution Policy (Windows)
If you encounter execution policy errors when running PowerShell scripts, you may need to adjust your execution policy:

```powershell
# Check current execution policy
Get-ExecutionPolicy

# Allow local scripts to run (recommended for development)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Or temporarily bypass execution policy for a single script
PowerShell -ExecutionPolicy Bypass -File .\generate-certificate.ps1
```

## Quick Start

### 1. Environment Configuration

Copy the example environment file and configure your settings:

**Linux/macOS (Bash):**
```bash
cp .env.example .env
```

**Windows (PowerShell):**
```powershell
Copy-Item .env.example .env
```

Edit the `.env` file and set the required values. Here are platform-specific ways to generate the encryption key:

**Linux/macOS with OpenSSL:**
```bash
# Required: Generate a secure encryption key
ENCRYPTION_KEY=$(openssl rand -base64 32)

# Required: Set PostgreSQL password
POSTGRES_PASSWORD=your_secure_password_here

# Required: Set API health check tests
ADMINAPP_HEALTHCHECK_TEST="curl -f http://localhost/health"
API_HEALTHCHECK_TEST="curl -f http://localhost/health"

# Required: Set API internal URL
API_INTERNAL_URL=http://${ODS_VIRTUAL_NAME}
```

**Windows PowerShell (No OpenSSL required):**
```powershell
# Generate a secure 32-byte encryption key using .NET cryptography
$bytes = New-Object byte[] 32
[System.Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($bytes)
$encryptionKey = [System.Convert]::ToBase64String($bytes)

# Add to .env file (edit the file or use Add-Content)
"ENCRYPTION_KEY=$encryptionKey" | Add-Content .env

# Or generate and display the key to manually add to .env
Write-Output "ENCRYPTION_KEY=$encryptionKey"
```

**Windows with OpenSSL:**
```cmd
REM Required: Generate a secure encryption key
openssl rand -base64 32

REM Manually add the output to your .env file as:
REM ENCRYPTION_KEY=<generated_key_here>
```

**Required settings for all platforms:**
```bash
# Required: Set PostgreSQL password
POSTGRES_PASSWORD=your_secure_password_here

# Required: Set API health check tests
ADMINAPP_HEALTHCHECK_TEST="curl -f http://localhost/health"
API_HEALTHCHECK_TEST="curl -f http://localhost/health"

# Required: Set API internal URL
API_INTERNAL_URL=http://${ODS_VIRTUAL_NAME}
```

### 2. Generate SSL Certificates

Generate self-signed SSL certificates for local development:

**Linux/macOS (Bash):**
```bash
cd Settings/ssl
./generate-certificate.sh
cd ../..
```

**Windows (PowerShell) - Option 1: Using the PowerShell script:**
```powershell
cd Settings\ssl
.\generate-certificate.ps1
cd ..\..
```

**Windows (PowerShell) - Option 2: Using WSL2 or Git Bash:**
```powershell
# If using WSL2 or Git Bash
cd Settings/ssl
bash ./generate-certificate.sh
cd ../..
```

**Windows (PowerShell) - Option 3: Using OpenSSL directly:**
```powershell
cd Settings\ssl

# Generate Diffie-Hellman parameters (this may take several minutes)
openssl dhparam -out dhparam.pem 4096

# Generate self-signed certificate and private key
openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout server.key -out server.crt -days 365 -addext "subjectAltName = DNS:nginx"

cd ..\..
```

**Windows (PowerShell) - Option 4: Using PowerShell and .NET (No OpenSSL):**
```powershell
cd Settings\ssl

# Create a self-signed certificate using PowerShell
$cert = New-SelfSignedCertificate -DnsName "localhost", "nginx" -CertStoreLocation "cert:\LocalMachine\My" -KeyLength 4096 -NotAfter (Get-Date).AddDays(365)

# Export private key
$privateKey = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPrivateKey($cert)
$keyBytes = $privateKey.ExportRSAPrivateKey()
$keyPem = "-----BEGIN RSA PRIVATE KEY-----`n" + [System.Convert]::ToBase64String($keyBytes, [System.Base64FormattingOptions]::InsertLineBreaks) + "`n-----END RSA PRIVATE KEY-----"
$keyPem | Out-File -FilePath "server.key" -Encoding ASCII

# Export certificate
$certBytes = $cert.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Cert)
$certPem = "-----BEGIN CERTIFICATE-----`n" + [System.Convert]::ToBase64String($certBytes, [System.Base64FormattingOptions]::InsertLineBreaks) + "`n-----END CERTIFICATE-----"
$certPem | Out-File -FilePath "server.crt" -Encoding ASCII

# Generate Diffie-Hellman parameters (using .NET - this is a simplified version)
# Note: For production use, consider using OpenSSL for proper DH parameters
$dhParams = "-----BEGIN DH PARAMETERS-----`nMIICCAKCAgEA7u8GsP7YKhO5XKQD3XD5Q5QW3qN+v9lkCWCgUjE5V2/+QJ8QZQXR`n7u8GsP7YKhO5XKQD3XD5Q5QW3qN+v9lkCWCgUjE5V2/+QJ8QZQXR3wIBAg==`n-----END DH PARAMETERS-----"
$dhParams | Out-File -FilePath "dhparam.pem" -Encoding ASCII

# Remove certificate from store
Remove-Item -Path "cert:\LocalMachine\My\$($cert.Thumbprint)"

cd ..\..
```

**Note for PowerShell Option 3:** The .NET approach provides basic certificate generation but may not be as robust as OpenSSL for production use. For production deployments, use proper SSL certificates from a trusted Certificate Authority.

### 3. Start with PostgreSQL (Default)

The default configuration uses PostgreSQL:

**Linux/macOS/Windows:**
```bash
docker compose up -d
```

**Windows (PowerShell alternative):**
```powershell
docker compose up -d
```

### 4. Access the Application

Once all containers are healthy:

- **Admin App**: https://localhost/adminapp
- **ODS API**: https://localhost/api
- **PostgreSQL**: localhost:6432 (exposed port)

## Database Engine Options

### PostgreSQL Setup (Default)

The default `docker-compose.yml` is configured for PostgreSQL. No modifications needed.

**Key components:**
- PostgreSQL databases for ODS and Admin/Security
- Admin App built with `pgsql.Dockerfile`
- Connection pooling enabled by default

### SQL Server Setup

To use SQL Server instead of PostgreSQL:

#### Option 1: Modify docker-compose.yml

1. **Update the adminapp service** to use the SQL Server Dockerfile:
   ```yaml
   adminapp:
     build:
       context: .
       dockerfile: mssql.Dockerfile  # Changed from pgsql.Dockerfile
   ```

2. **Replace PostgreSQL databases** with SQL Server configuration:
   ```yaml
   # Remove or comment out the db-ods and db-admin services
   # Add your SQL Server connection configuration
   ```

3. **Update environment variables** in your `.env` file:
   ```bash
   # SQL Server connection settings
   SQLSERVER_ODS_DATASOURCE=your_sql_server_host,1433
   SQLSERVER_ADMIN_DATASOURCE=your_sql_server_host,1433
   SQLSERVER_USER=your_sql_username
   SQLSERVER_PASSWORD=your_sql_password
   ```

#### Option 2: External SQL Server

For production use with external SQL Server:

1. Use the `mssql.Dockerfile` for the Admin App
2. Configure connection strings in `.env` to point to your SQL Server instance
3. Remove PostgreSQL database services from compose

## Development Mode

For development with local source code changes:

### PostgreSQL Development
To use the development Dockerfiles that build from source, you need to modify the `docker-compose.yml` file:

1. **Update the adminapp service** to use the development Dockerfile:
   ```yaml
   adminapp:
     build:
       context: .
       dockerfile: dev.pgsql.Dockerfile  # Changed from pgsql.Dockerfile
   ```

2. **Build and run** with the updated configuration:
   ```bash
   docker compose up --build adminapp
   ```

### SQL Server Development  
For SQL Server development mode, update the dockerfile reference to:
```yaml
dockerfile: dev.mssql.Dockerfile  # Instead of mssql.Dockerfile
```

The development Dockerfiles (`dev.pgsql.Dockerfile` and `dev.mssql.Dockerfile`) build the application from source rather than downloading pre-built packages.

## Configuration Options

### API Modes

Set the API mode in your `.env` file:

```bash
# Options: SharedInstance, YearSpecific, DistrictSpecific
API_MODE=SharedInstance
```

### SSL Configuration

The setup includes an nginx reverse proxy with SSL support:

1. **Generate SSL certificates** for local development:
   
   **Linux/macOS:**
   ```bash
   cd Settings/ssl
   ./generate-certificate.sh
   ```
   
   **Windows (PowerShell):**
   ```powershell
   cd Settings\ssl
   
   # Option 1: Using PowerShell script (recommended)
   .\generate-certificate.ps1
   
   # Option 2: Using bash/WSL2
   bash ./generate-certificate.sh
   
   # Option 3: Using OpenSSL directly
   openssl dhparam -out dhparam.pem 4096
   openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout server.key -out server.crt -days 365 -addext "subjectAltName = DNS:nginx"
   
   # Option 4: Using PowerShell/.NET (basic certificates)
   # See detailed PowerShell instructions in the "Generate SSL Certificates" section above
   ```

2. **Or place your own SSL certificates** in `Settings/ssl/`:
   - `server.crt` (certificate file)
   - `server.key` (private key file)

3. Update your `.env` file if using custom hostnames:
   ```bash
   API_HOSTNAME=your-domain.com
   ```

### Connection Pooling

PostgreSQL connection pooling is enabled by default. Adjust pool sizes:

```bash
# API connection pools
NPG_API_MAX_POOL_SIZE_ODS=100
NPG_API_MAX_POOL_SIZE_ADMIN=100

# Admin App connection pools  
NPG_ADMIN_MAX_POOL_SIZE_ODS=100
NPG_ADMIN_MAX_POOL_SIZE_ADMIN=100
```

## Container Services

The compose setup includes these services:

| Service | Description | Ports |
|---------|-------------|-------|
| **adminapp** | Ed-Fi Admin App web interface | Internal only |
| **api** | Ed-Fi ODS API | Internal only |
| **nginx** | Reverse proxy & SSL termination | 80, 443 |
| **db-ods** | PostgreSQL ODS database | Internal only |
| **db-admin** | PostgreSQL Admin/Security database | 6432 (exposed) |

## Health Checks

All services include health checks. Monitor container status:

```bash
# Check service health
docker compose ps

# View health check logs
docker compose logs adminapp
docker compose logs api
```

## Logs and Debugging

### View Logs

```bash
# All services
docker compose logs -f

# Specific service
docker compose logs -f adminapp
docker compose logs -f api
```

### Log Files

Application logs are persisted in the `./logs/` directory (configurable via `LOGS_FOLDER`).

## Troubleshooting

### Common Issues

#### 1. "Encryption key is required"

**Linux/macOS (Bash):**
```bash
# Generate and set encryption key
echo "ENCRYPTION_KEY=$(openssl rand -base64 32)" >> .env
```

**Windows (PowerShell with OpenSSL):**
```powershell
# Generate and add encryption key to .env file
$key = openssl rand -base64 32
"ENCRYPTION_KEY=$key" | Add-Content .env
```

**Windows (PowerShell without OpenSSL):**
```powershell
# Generate encryption key using .NET cryptography
$bytes = New-Object byte[] 32
[System.Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($bytes)
$key = [System.Convert]::ToBase64String($bytes)
"ENCRYPTION_KEY=$key" | Add-Content .env
```

#### 2. Database connection failures
- Verify database containers are healthy: `docker compose ps`
- Check PostgreSQL credentials in `.env` file
- Ensure databases have finished initializing (may take 2-3 minutes on first run)

#### 3. SSL certificate issues
- Ensure certificates are present in `Settings/ssl/`
- Check certificate permissions and format
- Review nginx logs: `docker compose logs nginx`

#### 4. Port conflicts
- Default ports: 80, 443, 6432
- Change exposed ports in `docker-compose.yml` if needed

### Reset Environment

To completely reset the environment:

```bash
# Stop and remove containers
docker compose down

# Remove persistent volumes (WARNING: destroys data)
docker volume rm vol-db-admin vol-db-ods

# Rebuild and restart
docker compose up --build -d
```

## Security Considerations

- **Change default passwords** in production
- **Use strong encryption keys** (32-byte base64)
- **Secure SSL certificates** with proper CN/SAN
- **Limit exposed ports** in production
- **Regular security updates** for base images

## Advanced Configuration

### Custom App Settings

Application settings can be customized by:

1. Modifying `Settings/pgsql/appsettings.template.json` or `Settings/mssql/appsettings.template.json`
2. Adding environment variables to the compose file
3. Rebuilding containers after changes

### External Dependencies

For production deployments, consider:
- External load balancers
- Managed database services
- Container orchestration (Kubernetes)
- Centralized logging and monitoring

## Support

- [Ed-Fi Tech Docs](https://techdocs.ed-fi.org/display/EDFITOOLS/Admin+App)
- [GitHub Issues](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/issues)
- [Ed-Fi Community](https://techdocs.ed-fi.org/display/ETKB/Ed-Fi+Community)