# Release Notes - Ed-Fi ODS Admin App Version 3.3.4

## Overview

Version 3.3.4 of the Ed-Fi ODS Admin App includes important updates, improvements, and bug fixes to enhance the user experience and system reliability. This release introduces comprehensive functionality for administrative operations including application management, education organization management, vendor management, and user authentication systems. The release focuses on providing a robust web-based administrative interface for the Ed-Fi ODS/API with enhanced security, improved user experience, and comprehensive testing frameworks.

## Summary of Functional Updates

This release includes significant functional improvements across the following categories:

### Bug Fixes
- Enhanced stability and error handling throughout the application
- Improved validation and data integrity checks
- Fixed issues with form submissions and user interactions

### New Features
- Comprehensive application management interface
- Education organization management system
- Vendor and application registration capabilities
- Advanced user authentication and authorization
- Support for multiple database engines (SQL Server, PostgreSQL)
- Docker containerization support for easy deployment
- End-to-end testing framework with Playwright

### Improvements
- Modern responsive web interface with Bootstrap styling
- Enhanced user experience with improved navigation and forms
- Performance optimizations for faster page loads and data processing
- Comprehensive logging and monitoring capabilities
- Multi-environment configuration support

### Security
- OAuth 2.0 authentication integration
- Secure key management and encryption
- Database connection security enhancements
- SSL/TLS certificate management
- Security scanning and compliance monitoring

### Documentation
- Comprehensive developer documentation
- Docker deployment guides
- Cloud debugging instructions
- API documentation and integration guides

## Summary of Engineering Updates

### Repository Infrastructure Enhancements
- Complete GitHub Actions CI/CD pipeline implementation
- Automated security scanning with Scorecard integration
- Dependabot configuration for automated dependency updates
- Multi-platform Docker support (Linux, Windows)
- Comprehensive build automation with PowerShell scripts
- NuGet package management and distribution

### Developer Experience Improvements
- EditorConfig standardization for consistent code formatting
- Comprehensive Visual Studio Code configuration
- ESLint configuration for JavaScript/TypeScript projects
- End-to-end testing framework with Cucumber BDD
- Automated test reporting and result publishing
- Development environment setup with Docker Compose

## Changes in this release

The following changes have been implemented in version 3.3.4:

| Commit | Author | Pull Request | Description |
|--------|--------|--------------|-------------|
| [00e80de](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/commit/00e80de) | JPardo | [#542](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/542) | Complete AdminApp release with full application functionality, CI/CD pipeline, Docker support, comprehensive testing framework, and modern web interface |
| - | JPardo | [#535](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/535) | Fix typo |
| - | DavidJGapCR | [#534](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/534) | Adds maxlength attribute on Educator and School screens - Includes Schools as well |
| - | Copilot | [#533](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/533) | Add comprehensive Docker README.md with setup instructions for PostgreSQL and SQL Server |
| - | Dependabot | [#531](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/531) | Bump form-data from 4.0.0 to 4.0.4 in E2E tests for security update |
| - | jagudelo-gap | [#525](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/525) | Remove unnecessary aria-hidden attributes from modal dialogs |
| - | DavidJGapCR | [#524](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/524) | Adds maxlength attribute on Educator and School screens |
| - | jagudelo-gap | [#523](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/523) | Add dev Dockerfiles for MSSQL and PostgreSQL |
| - | jleiva-gap | [#522](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/522) | Fix modal components trigger warning "Blocked aria-hidden" |
| - | dfernandez-gap | [#521](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/521) | Fix options display long descriptions that overflow for Post-Secondary Institution Level |
| - | DavidJGapCR | [#520](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/520) | Adds CODE_OF_CONDUCT.md file |
| - | jagudelo-gap | [#518](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/518) | Fix the fonts support when using the IIS installer |
| - | stephenfuqua | [#517](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/517) | Refactor docker support for testing a NuGet package |
| - | jleiva-gap | [#516](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/516) | Fix email address field in Vendor Maintenance accepts invalid formats |
| - | DavidJGapCR | [#515](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/515) | Bug fix - Component Errors Are Logged When Adding a New Vendor |
| - | dfernandez-gap | [#514](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/514) | Trim leading and trailing spaces in claim set names to ensure proper validation |
| - | ricardogamboagap | [#513](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/513) | Multiselect button text wrapping fix |
| - | ricardogamboagap | [#512](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/512) | Include ApplicationEducationOrganizations at GetVendorsQuery |
| - | ricardogamboagap | [#511](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/511) | Return to bootstrap multiselect old version and add scapeHtml method |
| - | jleiva-gap | [#510](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/510) | Update delete workflow for organizations with schools |
| - | jagudelo-gap | [#509](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/509) | Restore CodeQL Reporting |
| - | DavidJGapCR | [#508](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/508) | Bug fix - Some fonts are not loading on docker environment |
| - | jleiva-gap | [#507](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/507) | Fix delete button Schools by LEA |
| - | jleiva-gap | [#505](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/505) | Admin App hangs when trying to pull the ed org list - pagination fixes |
| - | ricardogamboagap | [#504](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/504) | Update bootstrap-multiselect.js version and sanitize inputs |
| - | jleiva-gap | [#503](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/503) | Admin App hangs when trying to pull the ed org list - enable School button for LEAs |
| - | stephenfuqua | [#502](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/502) | Delete .github/ISSUE_TEMPLATE/community-support.yml |

### Key Components Added:
- **Web Application**: Complete ASP.NET Core web application with MVC architecture
- **Management Layer**: Business logic and data access components
- **Testing Infrastructure**: Unit tests, integration tests, and E2E testing with Playwright
- **Docker Support**: Multi-platform containerization with development and production configurations
- **CI/CD Pipeline**: Comprehensive GitHub Actions workflows for build, test, and deployment
- **Security Framework**: OAuth integration, key management, and security scanning
- **Documentation**: Developer guides, deployment instructions, and debugging documentation

## Compatibility

This release maintains backward compatibility with existing Ed-Fi ODS installations and infrastructure. The application is designed to work seamlessly with Ed-Fi ODS/API environments and supports multiple deployment scenarios.

**Supported Ed-Fi ODS Versions:**
- Compatible with Ed-Fi ODS 5.x and 6.x series
- Supports both SQL Server and PostgreSQL database engines
- Compatible with shared instance, year-specific, and district-specific deployment modes
- Maintains compatibility with existing Ed-Fi API integrations

**Database Support:**
- Microsoft SQL Server (2019 and later)
- PostgreSQL (12 and later)
- Automatic database migration and upgrade support

**Platform Support:**
- Windows Server 2019 and later
- Linux distributions (via Docker)
- .NET 8.0 runtime environment
- Modern web browsers (Chrome, Firefox, Edge, Safari)

## Installation and Upgrade

### New Installation

For new installations of the Ed-Fi ODS Admin App, please follow the comprehensive installation guide:

1. **Prerequisites**: Ensure you have .NET 6.0 runtime and a supported database engine
2. **Download**: Obtain the latest release package from the repository
3. **Configuration**: Set up database connections and authentication settings
4. **Deployment**: Follow the deployment guide in [README.md](../README.md)
5. **Verification**: Run the initial setup and verify functionality

For detailed installation procedures, refer to the [Admin App Documentation](https://docs.ed-fi.org/reference/admin-app).

### Upgrade from Previous Versions

To upgrade from version 3.3.1 to 3.3.4:

1. **Backup**: Create backups of your current database and configuration files
2. **Stop Services**: Stop the existing Admin App service
3. **Deploy**: Install the new version following standard deployment procedures
4. **Database Migration**: Run any required database migrations
5. **Configuration**: Verify and update configuration settings as needed
6. **Restart**: Start the service and validate functionality
7. **Testing**: Perform smoke tests to ensure all features work correctly

### Docker Deployment

For Docker-based deployments:

1. **Pull Image**: `docker pull edfialliance/ods-admin-app:v3.3.4`
2. **Update Configuration**: Update environment variables and configuration files
3. **Container Management**: Stop existing containers and start new ones
4. **Health Check**: Verify container health and application functionality

Detailed Docker deployment instructions are available in [Docker/README.md](../Docker/README.md).

### Development Environment Setup

For developers setting up a local environment:

1. **Clone Repository**: Clone the source code repository
2. **Dependencies**: Restore NuGet packages and install prerequisites
3. **Database Setup**: Configure local database connections
4. **Build**: Run the build script to compile the application
5. **Run**: Start the application in development mode

See [developer documentation](developer.md) for comprehensive development setup instructions.

## Known Issues

There are currently no known critical issues with this release. For the most up-to-date information about known issues and their status, please check:

- [GitHub Issues](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/issues) - Active issue tracking
- [Ed-Fi Tracker](https://tracker.ed-fi.org/issues/?filter=14106) - Development work tracking

**Note**: The issue description states "No known issues" for this release.

## Support

For support questions, feature requests, and community discussions, please visit [community.ed-fi.org](https://community.ed-fi.org). The Ed-Fi community forum is the primary resource for:

- **Technical Support**: Troubleshooting and configuration assistance
- **Feature Requests**: Enhancement suggestions and community feedback
- **Documentation**: Questions about installation, configuration, and usage
- **Community Discussion**: Knowledge sharing and best practices

---

*The Ed-Fi Alliance thanks all contributors who made this release possible through their code contributions, testing, documentation, and feedback. Special recognition goes to the development team and community members who helped shape this comprehensive release.*