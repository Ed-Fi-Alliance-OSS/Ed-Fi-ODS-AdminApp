# Ed-Fi ODS Admin App Docker Setup

This directory contains Docker configuration files for running the Ed-Fi ODS Admin App with Docker Compose. The setup supports both **PostgreSQL** and **SQL Server** database engines.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (version 20.10 or later)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0 or later)
- At least 4GB of available RAM
- At least 10GB of available disk space

## Quick Start

### 1. Environment Configuration

Copy the example environment file and configure your settings:

```bash
cp .env.example .env
```

Edit the `.env` file and set the required values:

```bash
# Required: Generate a secure encryption key
ENCRYPTION_KEY=$(openssl rand -base64 32)

# Required: Set PostgreSQL password
POSTGRES_PASSWORD=your_secure_password_here

# Required: Set API health check tests
ADMINAPP_HEALTHCHECK_TEST="curl -f http://localhost/health"
API_HEALTHCHECK_TEST="curl -f http://localhost/health"

# Required: Set API internal URL
API_INTERNAL_URL=http://api
```

### 2. Start with PostgreSQL (Default)

The default configuration uses PostgreSQL:

```bash
docker-compose up -d
```

### 3. Access the Application

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
```bash
# Build and run with dev Dockerfile
docker-compose -f docker-compose.yml up --build adminapp
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

1. Place your SSL certificates in `Settings/ssl/`:
   - `server.crt` (certificate file)
   - `server.key` (private key file)

2. Update your `.env` file if using custom hostnames:
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
docker-compose ps

# View health check logs
docker-compose logs adminapp
docker-compose logs api
```

## Logs and Debugging

### View Logs

```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f adminapp
docker-compose logs -f api
```

### Log Files

Application logs are persisted in the `./logs/` directory (configurable via `LOGS_FOLDER`).

## Troubleshooting

### Common Issues

#### 1. "Encryption key is required"
```bash
# Generate and set encryption key
echo "ENCRYPTION_KEY=$(openssl rand -base64 32)" >> .env
```

#### 2. Database connection failures
- Verify database containers are healthy: `docker-compose ps`
- Check PostgreSQL credentials in `.env` file
- Ensure databases have finished initializing (may take 2-3 minutes on first run)

#### 3. SSL certificate issues
- Ensure certificates are present in `Settings/ssl/`
- Check certificate permissions and format
- Review nginx logs: `docker-compose logs nginx`

#### 4. Port conflicts
- Default ports: 80, 443, 6432
- Change exposed ports in `docker-compose.yml` if needed

### Reset Environment

To completely reset the environment:

```bash
# Stop and remove containers
docker-compose down

# Remove persistent volumes (WARNING: destroys data)
docker volume rm vol-db-admin vol-db-ods

# Rebuild and restart
docker-compose up --build -d
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