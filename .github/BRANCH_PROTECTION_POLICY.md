# Branch Protection Policy

## Overview
This document outlines the branch protection policies for the Ed-Fi ODS AdminApp repository to ensure code quality, security, and proper review processes.

## Protected Branches

### Main Branch (`main`)
- **Purpose**: Primary development branch
- **Required reviewers**: 2
- **Status checks**: Required and must be up-to-date
- **Code owner review**: Required
- **Admin enforcement**: Yes
- **Force push**: Disabled
- **Deletion**: Disabled

### Release Branches (`v*.*.*-*`)
- **Purpose**: Hotfix and release preparation
- **Required reviewers**: 2
- **Status checks**: Required and must be up-to-date
- **Code owner review**: Required
- **Admin enforcement**: Yes
- **Force push**: Disabled
- **Deletion**: Disabled

## Review Requirements

### Code Owners
- All changes must be reviewed by designated code owners
- Code owners are defined in `.github/CODEOWNERS`
- Different areas of the codebase have different owners

### Pull Request Process
1. All changes must go through pull requests
2. Minimum 2 approving reviews required
3. Stale reviews are dismissed when new commits are pushed
4. All status checks must pass
5. Branch must be up-to-date with target branch

## Exceptions
- Emergency hotfixes may be granted temporary bypass with proper documentation
- Security patches may require expedited review process
- All exceptions must be documented and reviewed post-merge

## Enforcement
- These rules apply to all contributors, including administrators
- Violations should be reported to the security team
- Regular audits of branch protection settings will be conducted

## Updates
This policy is reviewed quarterly and updated as needed to reflect best practices and organizational requirements.
