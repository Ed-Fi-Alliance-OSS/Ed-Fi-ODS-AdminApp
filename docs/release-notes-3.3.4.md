# Release Notes - Ed-Fi ODS Admin App Version 3.3.4

## Overview

Version 3.3.4 of the Ed-Fi ODS Admin App is a patch release that includes important bug fixes, accessibility improvements, and enhancements to improve the user experience and system reliability. This release builds upon version 3.3.1 with targeted fixes and improvements based on community feedback and testing.

## Summary of Changes

This patch release focuses on the following areas:

### Bug Fixes
- Fixed modal components triggering "Blocked aria-hidden" warnings
- Resolved font loading issues in Docker environment
- Fixed email address field validation in Vendor Maintenance
- Corrected delete button functionality for Schools by LEA
- Fixed application hanging when pulling education organization lists
- Resolved component errors when adding new vendors
- Fixed options display overflow for Post-Secondary Institution Level

### Accessibility Improvements
- Removed unnecessary aria-hidden attributes from modal dialogs
- Improved accessibility compliance across the application

### User Interface Enhancements
- Added maxlength attributes on Educator and School screens
- Fixed multiselect button text wrapping issues
- Improved pagination handling for education organization lists
- Enhanced validation and trimming for claim set names

### Security Updates
- Updated bootstrap-multiselect.js version with input sanitization
- Bumped form-data dependency to address security vulnerabilities
- Restored CodeQL security reporting

### Development and Operations
- Added comprehensive Docker README with setup instructions
- Refactored Docker support for NuGet package testing
- Added development Dockerfiles for MSSQL and PostgreSQL
- Added CODE_OF_CONDUCT.md file
- Restored CodeQL security scanning

## Changes in this release

The following bug fixes and improvements have been implemented in version 3.3.4:

| Pull Request | Author | Description |
|--------------|--------|-------------|
| [#535](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/535) | JPardo | Fix typo |
| [#534](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/534) | DavidJGapCR | Adds maxlength attribute on Educator and School screens - Includes Schools as well |
| [#533](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/533) | Copilot | Add comprehensive Docker README.md with setup instructions for PostgreSQL and SQL Server |
| [#531](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/531) | Dependabot | Bump form-data from 4.0.0 to 4.0.4 in E2E tests for security update |
| [#525](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/525) | jagudelo-gap | Remove unnecessary aria-hidden attributes from modal dialogs |
| [#524](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/524) | DavidJGapCR | Adds maxlength attribute on Educator and School screens |
| [#523](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/523) | jagudelo-gap | Add dev Dockerfiles for MSSQL and PostgreSQL |
| [#522](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/522) | jleiva-gap | Fix modal components trigger warning "Blocked aria-hidden" |
| [#521](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/521) | dfernandez-gap | Fix options display long descriptions that overflow for Post-Secondary Institution Level |
| [#520](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/520) | DavidJGapCR | Adds CODE_OF_CONDUCT.md file |
| [#518](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/518) | jagudelo-gap | Fix the fonts support when using the IIS installer |
| [#517](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/517) | stephenfuqua | Refactor docker support for testing a NuGet package |
| [#516](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/516) | jleiva-gap | Fix email address field in Vendor Maintenance accepts invalid formats |
| [#515](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/515) | DavidJGapCR | Bug fix - Component Errors Are Logged When Adding a New Vendor |
| [#514](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/514) | dfernandez-gap | Trim leading and trailing spaces in claim set names to ensure proper validation |
| [#513](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/513) | ricardogamboagap | Multiselect button text wrapping fix |
| [#512](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/512) | ricardogamboagap | Include ApplicationEducationOrganizations at GetVendorsQuery |
| [#511](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/511) | ricardogamboagap | Return to bootstrap multiselect old version and add scapeHtml method |
| [#510](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/510) | jleiva-gap | Update delete workflow for organizations with schools |
| [#509](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/509) | jagudelo-gap | Restore CodeQL Reporting |
| [#508](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/508) | DavidJGapCR | Bug fix - Some fonts are not loading on docker environment |
| [#507](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/507) | jleiva-gap | Fix delete button Schools by LEA |
| [#505](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/505) | jleiva-gap | Admin App hangs when trying to pull the ed org list - pagination fixes |
| [#504](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/504) | ricardogamboagap | Update bootstrap-multiselect.js version and sanitize inputs |
| [#503](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/503) | jleiva-gap | Admin App hangs when trying to pull the ed org list - enable School button for LEAs |
| [#502](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/pull/502) | stephenfuqua | Delete .github/ISSUE_TEMPLATE/community-support.yml |

## Compatibility

This patch release maintains full backward compatibility with version 3.3.1. No breaking changes have been introduced.

**Supported Ed-Fi ODS Versions:**
- Compatible with Ed-Fi ODS 5.x and 6.x series
- Supports both SQL Server and PostgreSQL database engines
- Compatible with shared instance, year-specific, and district-specific deployment modes

**Database Support:**
- Microsoft SQL Server (2019 and later)
- PostgreSQL (12 and later)

**Platform Support:**
- Windows Server 2019 and later
- Linux distributions (via Docker)
- .NET 8.0 runtime environment
- Modern web browsers (Chrome, Firefox, Edge, Safari)

## Installation and Upgrade

### Upgrade from Version 3.3.1

To upgrade from version 3.3.1 to 3.3.4:

1. **Backup**: Create backups of your current database and configuration files
2. **Stop Services**: Stop the existing Admin App service
3. **Deploy**: Install the new version following standard deployment procedures
4. **Restart**: Start the service and validate functionality
5. **Testing**: Perform smoke tests to ensure all features work correctly

### Docker Deployment

For Docker-based deployments:

```bash
docker pull edfialliance/ods-admin-app:v3.3.4
```

Update your Docker Compose files or container configurations to use the new image tag.

### Documentation

For detailed installation and upgrade procedures, refer to the [Admin App Documentation](https://docs.ed-fi.org/reference/admin-app) and [Docker deployment guide](../Docker/README.md).

## Known Issues

There are currently no known critical issues with this patch release. For the most up-to-date information about known issues and their status, please check:

- [GitHub Issues](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-AdminApp/issues) - Active issue tracking
- [Ed-Fi Tracker](https://tracker.ed-fi.org/issues/?filter=14106) - Development work tracking

## Support

For support questions, feature requests, and community discussions, please visit [community.ed-fi.org](https://community.ed-fi.org). The Ed-Fi community forum is the primary resource for technical support, troubleshooting assistance, and community knowledge sharing.

---

*The Ed-Fi Alliance thanks all contributors who made this patch release possible through their code contributions, testing, documentation, and feedback.*