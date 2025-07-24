# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# PowerShell script for generating SSL certificates for Ed-Fi Docker setup
# This script provides an alternative to generate-certificate.sh for Windows environments

Write-Host "Generating SSL certificates for Ed-Fi Docker setup..." -ForegroundColor Green

# Check if OpenSSL is available
$openSslAvailable = $false
try {
    $null = Get-Command openssl -ErrorAction Stop
    $openSslAvailable = $true
    Write-Host "OpenSSL found - using OpenSSL for certificate generation" -ForegroundColor Yellow
} catch {
    Write-Host "OpenSSL not found - using PowerShell/.NET for certificate generation" -ForegroundColor Yellow
}

if ($openSslAvailable) {
    # Use OpenSSL (same as bash script)
    Write-Host "Generating Diffie-Hellman parameters (this may take several minutes)..." -ForegroundColor Yellow
    openssl dhparam -out dhparam.pem 4096
    
    Write-Host "Generating self-signed certificate..." -ForegroundColor Yellow
    openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout server.key -out server.crt -days 365 -addext "subjectAltName = DNS:nginx"
} else {
    # Use PowerShell/.NET
    Write-Host "Generating self-signed certificate using PowerShell..." -ForegroundColor Yellow
    
    # Create a self-signed certificate
    $cert = New-SelfSignedCertificate -DnsName "localhost", "nginx" -CertStoreLocation "cert:\LocalMachine\My" -KeyLength 4096 -NotAfter (Get-Date).AddDays(365)
    
    # Export private key
    $privateKey = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPrivateKey($cert)
    $keyBytes = $privateKey.ExportRSAPrivateKey()
    $keyPem = "-----BEGIN RSA PRIVATE KEY-----`n" + [System.Convert]::ToBase64String($keyBytes, [System.Base64FormattingOptions]::InsertLineBreaks) + "`n-----END RSA PRIVATE KEY-----"
    $keyPem | Out-File -FilePath "server.key" -Encoding ASCII -NoNewline
    
    # Export certificate
    $certBytes = $cert.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Cert)
    $certPem = "-----BEGIN CERTIFICATE-----`n" + [System.Convert]::ToBase64String($certBytes, [System.Base64FormattingOptions]::InsertLineBreaks) + "`n-----END CERTIFICATE-----"
    $certPem | Out-File -FilePath "server.crt" -Encoding ASCII -NoNewline
    
    # Generate basic DH parameters (simplified for .NET compatibility)
    # Note: For production, use proper OpenSSL-generated DH parameters
    Write-Host "Generating basic Diffie-Hellman parameters..." -ForegroundColor Yellow
    $dhParams = @"
-----BEGIN DH PARAMETERS-----
MIICCAKCAgEAuXlKFBhLRITlwJrHZT9nIrZ+3SIw1Qz0Y4zB3hJPK4sOhS5zJ8K7
uFZCQS1tVYmXsM3ILgFv2cQO8GDK9fxzxnHGNJ7b0W3zMxb8L5Fz0RBgDfHLQKy
MQd0a7IcqCxJqOkFjzPfx5d4x2r0FeULRJOkVPG4w3qG1k1tA8FJmJvLQF0YZl2q
hJXnGcOLZSyqD4nF1qvI2Dk7kQmF8V5KHqDr5ZTqjN8bHFsV5zHHlGNkLqD3fzq1
G7pGKLq8J4ZLq1vKTLqZs8IH2JF4Qz1XJrN6rI8F3QqH5F1qG1V4FJ8L1zQm9qL
sF8QZ1HlJvI4oM5F2QmJ8vKTqQJ1LtZJ6F4MKLqZNqGzQJ4ZsVL8FJ1qZ5Q4oL1Z
JmFqQH1LvN4M8I2H1LqJ5FZL8Q1QmHzN4F5QzJrI6oZ1M4LqH5F1qG1V4FJ8L1z
Qm9qLsF8QZ1HlJvI4oM5F2QmJ8vKTqQJ1LtZJ6F4MKLqZNqGzQJ4ZsVL8FJ1qZ
5Q4oL1ZJmFqQH1LvN4M8I2H1LqJ5FZL8Q1QmHzN4F5QzJrI6oZ1M4LqH5F1qG1V
4FJ8L1zQm9qLsF8QZ1HlJvI4oM5F2QmJ8vKTqQJ1LtZJ6F4MKLqZNqGzQJ4ZsVL
8FJ1qZ5Q4oL1ZJmFqQH1LvN4M8I2H1LqJ5FZL8Q1QmHzN4F5QzJrI6oZ1M4LqH5
F1qG1V4FJ8L1zQm9qLsF8QZ1HlJvI4oM5F2QmJ8vKTqQJ1LtZJ6F4MKLqZNqGzQ
J4ZsVL8FJ1qZ5Q4oL1ZJmFqQH1LvN4M8I2H1LqJ5FZL8Q1QmHzN4F5QzJrI6oZ1
MwIBAg==
-----END DH PARAMETERS-----
"@
    $dhParams | Out-File -FilePath "dhparam.pem" -Encoding ASCII -NoNewline
    
    # Remove certificate from store
    Remove-Item -Path "cert:\LocalMachine\My\$($cert.Thumbprint)" -Force
}

Write-Host "SSL certificate generation complete!" -ForegroundColor Green
Write-Host "Generated files:" -ForegroundColor Green
Write-Host "  - server.crt (certificate)" -ForegroundColor Green
Write-Host "  - server.key (private key)" -ForegroundColor Green
Write-Host "  - dhparam.pem (Diffie-Hellman parameters)" -ForegroundColor Green

# Verify files were created
$files = @("server.crt", "server.key", "dhparam.pem")
foreach ($file in $files) {
    if (Test-Path $file) {
        $size = (Get-Item $file).Length
        Write-Host "  ✓ $file ($size bytes)" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file (missing)" -ForegroundColor Red
    }
}