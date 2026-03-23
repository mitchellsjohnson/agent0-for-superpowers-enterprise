# Customization Guide

This guide walks you through customizing the generic framework for your company.

## Overview

The framework uses **placeholders** that you replace with your company's specifics:
- `{{COMPANY_NAME}}` → Your company name
- `{{CRITICAL_SLA_DAYS}}` → Your actual SLA for Critical vulnerabilities
- `{{HIGH_SLA_DAYS}}` → Your actual SLA for High vulnerabilities
- `{{COVERAGE_THRESHOLD}}` → Your required test coverage percentage
- `{{COMPANY_TOOL}}` → Your company's tool names

## Step 1: Update Plugin Manifest

Edit `.claude-plugin/plugin.json`:

```json
{
  "name": "agent0-for-superpowers-YOUR-COMPANY",
  "description": "YOUR_COMPANY domain expertise for Superpowers",
  "version": "1.0.0",
  "author": {
    "name": "YOUR_COMPANY"
  },
  "repository": "https://github.com/YOUR-ORG/agent0-for-superpowers-YOUR-COMPANY",
  "keywords": ["superpowers", "enterprise", "YOUR-COMPANY"],
  ...
}
```

## Step 2: Customize Policy Templates

Policy templates live under each domain, e.g. `security/policies/`, `engineering/policies/`, `ux/policies/`, `product/policies/`. Replace placeholders:

### Example: SECURITY-POLICY.template.md

**Before:**
```markdown
| Severity | Remediation Time | Escalation |
|----------|------------------|------------|
| Critical | {{CRITICAL_SLA_DAYS}} days | {{CRITICAL_ESCALATION}} |
| High | {{HIGH_SLA_DAYS}} days | {{HIGH_ESCALATION}} |
```

**After** (your company's actual SLAs):
```markdown
| Severity | Remediation Time | Escalation |
|----------|------------------|------------|
| Critical | 7 days | VP Engineering |
| High | 30 days | Engineering Manager |
```

Rename to `SECURITY-POLICY.md` (remove `.template`)

Repeat for all policy templates.

## Step 3: Customize Agents

Each agent under `*/agents/` references `{{COMPANY_*}}` placeholders (or use `config.yaml` + `./build.sh` to substitute them in `plugin/`).

### Example: security/agents/Security-Engineer.md

**Before:**
```markdown
You use {{COMPANY_SAST_TOOL}} for static analysis and {{COMPANY_DEPENDENCY_SCANNER}} for vulnerability scanning.
```

**After:**
```markdown
You use Fortify for static analysis and Snyk for vulnerability scanning.
```

Update all agents with your company's actual tools and processes.

## Step 4: Add Company-Specific Skills

Create skills under the matching domain, e.g. `security/skills/`, `engineering/skills/`:

### Example: security/skills/vulnerability-scan/

```
skills/security/vulnerability-scan/
├── SKILL.md (skill definition)
└── README.md (usage guide)
```

See generic skills for examples.

## Step 5: Add Tool Integrations

Document how to integrate your company's tools in `integrations/`:

### Example: integrations/YOUR-COMPANY-SCANNER-MCP.md

```markdown
# YOUR-COMPANY Scanner MCP Server

Connection details, authentication, available operations.
```

## Step 6: Update AGENT-INDEX.md

Replace the generic agent index with your company's actual specialists:

```markdown
# YOUR-COMPANY Agent Index

**Available Agents**:
- **Security-Engineer**: YOUR-COMPANY security policies, Fortify, Snyk scans
- **UX-Engineer**: YOUR-COMPANY design system, accessibility standards
- ...
```

## Step 7: Test Locally

Install and test before deploying:

```bash
/plugin install .
# Test in a project
```

## Step 8: Deploy to Team

Push to your company's GitHub/GitLab and add to plugin marketplace.

## Common Placeholders Reference

| Placeholder | Example Value | Where Used |
|-------------|---------------|------------|
| `{{COMPANY_NAME}}` | Acme Corp | All files |
| `{{CRITICAL_SLA_DAYS}}` | 7 | SECURITY-POLICY |
| `{{HIGH_SLA_DAYS}}` | 30 | SECURITY-POLICY |
| `{{MEDIUM_SLA_DAYS}}` | 90 | SECURITY-POLICY |
| `{{CRITICAL_ESCALATION}}` | VP Engineering | SECURITY-POLICY |
| `{{HIGH_ESCALATION}}` | Engineering Manager | SECURITY-POLICY |
| `{{COVERAGE_THRESHOLD}}` | 80 | TESTING-POLICY |
| `{{COMPANY_SAST_TOOL}}` | Fortify, SonarQube | Agents, Skills |
| `{{COMPANY_DEPENDENCY_SCANNER}}` | Snyk, Lifecycle | Agents, Skills |
| `{{COMPANY_ARTIFACT_REPO}}` | Artifactory, Nexus | Agents |
| `{{APPROVED_LANGUAGES}}` | Java, Python, TypeScript | TECH-STACK |
| `{{APPROVED_FRAMEWORKS}}` | Spring, React, FastAPI | TECH-STACK |

## After Customization

Your `policies/` directory should contain:
- `SECURITY-POLICY.md` (no .template)
- `TESTING-POLICY.md`
- `UX-STANDARDS.md`
- `TECH-STACK.md`
- `README.md` (updated with your company name)

Your agents should reference your actual tools (not placeholders).

Your `AGENT-INDEX.md` should list your company's actual specialists with your company's tools.

## Maintenance

As your company's policies, tools, and standards evolve:

1. Update the relevant policy, agent, or skill files
2. Commit and push changes
3. Users update via `/plugin update agent0-for-superpowers-YOUR-COMPANY`

Keep your fork up to date with the upstream enterprise framework for bug fixes and improvements:

```bash
git remote add upstream git@github.com:mitchellsjohnson/agent0-for-superpowers-enterprise.git
git fetch upstream
git merge upstream/main
```
