# {{COMPANY_NAME}} Security Policy Reference

> **IMPORTANT**: This file is NOT the security policy itself. {{COMPANY_NAME}}'s official security policies are maintained in Confluence.

## Official Security Policy Location

**The authoritative {{COMPANY_NAME}} security policy is located in Confluence:**

- **[Security Program](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/417529857/Security+Program)** - Comprehensive security program overview
- **[Security Policies & Procedures](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/225837188/Security+Policies+Procedures)** - Complete security policies and procedures

### For Machine Agents

If you are an AI agent working on this codebase, you MUST retrieve and reference the actual security policy from the Confluence pages above. Use an MCP server with Jira/Confluence access to fetch the current policy content. Do not rely solely on the quick reference below.

### For Human Operators

Access the Confluence pages linked above to review the complete security requirements. The content below is only a quick reference guide and may not reflect the latest policy updates.

---

## Quick Reference Guide (Not Official Policy)

The following is a high-level reference for common security requirements. **This does not replace or supersede the official Confluence documentation.**

---

## 1. Secure Development {{COMPANY_DEPENDENCY_SCANNER}}

### Pre-Development
- Threat modeling for new features
- Security review of design documents
- Dependency analysis before adding libraries

### During Development
- Input validation on all user inputs
- Output encoding for XSS prevention
- Parameterized queries for SQL
- Authentication/authorization checks

### Pre-Release
- {{COMPANY_DEPENDENCY_SCANNER}} scan (no new Critical/High)
- {{COMPANY_SAST_TOOL}} SAST scan review
- Security team sign-off for sensitive features

---

## 2. Vulnerability Management

### SLAs by Severity

| CVSS Score | Severity | Remediation | Escalation Path |
|------------|----------|-------------|-----------------|
| 9.0-10.0 | Critical | {{CRITICAL_SLA_DAYS}} days | {{CRITICAL_ESCALATION}} |
| 7.0-8.9 | High | {{HIGH_SLA_DAYS}} days | {{HIGH_ESCALATION}} |
| 4.0-6.9 | Medium | {{MEDIUM_SLA_DAYS}} days | Tech Lead |
| 0.1-3.9 | Low | Best effort | None |

### Waiver Process
1. Document business justification
2. Identify compensating controls
3. Set remediation date
4. Obtain Security team approval
5. Review waivers quarterly

---

## 3. Authentication & Authorization

### Authentication Requirements
- Multi-factor authentication for admin access
- Session timeout: 30 minutes inactive
- Password complexity: 12+ chars, mixed case, numbers, symbols
- Account lockout after 5 failed attempts

### Authorization Patterns
- Principle of least privilege
- Role-based access control (RBAC)
- Audit logging for privilege changes

---

## 4. Data Protection

### Classification

| Level | Examples | Requirements |
|-------|----------|--------------|
| Confidential | Customer data, credentials | Encryption at rest and transit |
| Internal | Business documents | Access controls |
| Public | Marketing materials | None |

### Encryption
- TLS 1.2+ for all network traffic
- AES-256 for data at rest
- No custom cryptography

---

## 5. Secrets Management

### Approved Methods
- Environment variables (for containers)
- HashiCorp Vault (for production)
- AWS Secrets Manager (for cloud)

### Prohibited
- Secrets in source code
- Secrets in logs
- Hardcoded credentials
- Secrets in client-side code

---

## 6. Security Tools

### Guide MCP (Mandatory for Dependencies)

All dependency decisions require Guide MCP verification before code is pushed to remote.

```
Guide MCP tools:
  - getComponentVersion: Check component vulnerabilities, license, quality
  - getLatestComponentVersion: Find latest version with security data
  - getRecommendedComponentVersions: Get safe upgrade recommendations
```

See `shared/mcp/GUIDE-MCP.md` for detailed usage.

### Security Skills

Agents should use these skills for security work:

| Skill | Location | Purpose |
|-------|----------|---------|
| `lifecycle-scan.md` | `shared/skills/security/` | SCA scanning and remediation |
| `sast-scan.md` | `shared/skills/security/` | Static analysis (placeholder) |
| `threat-modeling.md` | `shared/skills/security/` | STRIDE threat modeling |
| `secure-coding.md` | `shared/skills/engineering/` | Secure coding patterns |

---

## 7. Incident Response

### Classification

| Type | Examples | Response |
|------|----------|----------|
| Data Breach | Customer data exposed | SEV1, notify legal |
| Vulnerability | Active exploitation | SEV1-2, patch immediately |
| Access Issue | Unauthorized access attempt | SEV2-3, investigate |

### Contacts
- Security Team: security@sonatype.com
- On-call: #security-oncall Slack
