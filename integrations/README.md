# Integration Guides

How to connect your company's tools and workflows to the Agent0 framework.

## Available Guides

### [MCP Integration Guide](MCP-INTEGRATION-GUIDE.md)
Connect your company's tools via Model Context Protocol (MCP) servers:
- Issue trackers (Jira, Linear, GitHub)
- Security scanners (SAST, dependency scanners)
- Artifact repositories
- Documentation systems

### [CI/CD Patterns](CI-CD-PATTERNS.md)
Generic CI/CD pipeline patterns for:
- Pre-commit checks
- Pre-merge security gates
- Post-merge automation
- Progressive deployment

## Customization Workflow

1. **Copy templates** - Clone this repo as your starting point
2. **Replace placeholders** - Search for `{{PLACEHOLDERS}}` and replace with your values
3. **Test integrations** - Verify MCP servers connect, CI pipelines run
4. **Document custom patterns** - Add your company-specific guides to this directory

## Common Placeholders

| Placeholder | Example |
|-------------|---------|
| `{{COMPANY_NAME}}` | Acme Corp |
| `{{COMPANY_SAST_TOOL}}` | Fortify, SonarQube |
| `{{COMPANY_DEPENDENCY_SCANNER}}` | Lifecycle, Snyk |
| `{{COMPANY_ARTIFACT_REPO}}` | Nexus, Artifactory |
| `{{COVERAGE_THRESHOLD}}` | 80 |

See `policies/README.md` for full placeholder list.
