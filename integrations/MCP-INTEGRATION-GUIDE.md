# MCP Integration Guide

How to integrate your company's tools via Model Context Protocol (MCP) servers.

## What is MCP?

MCP allows Claude Code to interact with external tools and services. Use MCP to connect:
- Issue trackers (Jira, Linear, GitHub Issues)
- Code repositories (GitHub, GitLab, Bitbucket)
- Internal tools (vulnerability scanners, artifact repositories, etc.)

## Creating an MCP Server

1. **Define operations** your tool provides
2. **Implement MCP server** following Claude MCP spec
3. **Document usage** in an integration guide for agents

## Example: Vulnerability Scanner MCP

`integrations/YOUR-SCANNER-MCP.md`:

```markdown
# YOUR-SCANNER MCP Server

## Operations

- `scan_project(path)`: Scan project for vulnerabilities
- `get_scan_results(scan_id)`: Retrieve scan results
- `suppress_vulnerability(vuln_id, reason)`: Suppress false positive

## Usage in Skills

\`\`\`python
# In skills/security/scanner-scan/SKILL.md
result = mcp.your_scanner.scan_project(".")
if result.critical_count > 0:
    raise BlockingIssue("Critical vulnerabilities found")
\`\`\`

## Configuration

Add to `.mcp.json`:
\`\`\`json
{
  "servers": {
    "your-scanner": {
      "url": "https://scanner.yourcompany.com",
      "auth": "token"
    }
  }
}
\`\`\`
```

## Best Practices

- Document all MCP operations clearly
- Include error handling examples
- Provide authentication setup instructions
- Reference MCP docs in agent definitions

## Common MCP Integrations

- **Security tools**: SAST scanners, dependency checkers, secrets detection
- **Issue trackers**: Jira, Linear for task management
- **Code repos**: GitHub, GitLab for PR/commit info
- **Artifact repos**: Nexus, Artifactory for package management
- **Documentation**: Confluence, Notion for policy retrieval
