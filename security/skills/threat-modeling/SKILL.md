---
name: threat-modeling
description: Use when designing features involving authentication, authorization, data handling, external integrations, or changes to trust boundaries
---

# Threat Modeling

## Instructions

### When to Model

Threat modeling is required for:
- New authentication/authorization flows
- New API endpoints handling sensitive data
- External service integrations
- Data storage or encryption changes
- Changes to trust boundaries

### STRIDE Framework

Evaluate each component against STRIDE:

| Threat | Question | Mitigations |
|--------|----------|-------------|
| **S**poofing | Can an attacker impersonate a user or service? | Authentication, certificates, MFA |
| **T**ampering | Can data be modified in transit or at rest? | Integrity checks, signing, encryption |
| **R**epudiation | Can actions be denied? | Audit logging, timestamps, signatures |
| **I**nformation Disclosure | Can data leak to unauthorized parties? | Encryption, access controls, data classification |
| **D**enial of Service | Can the service be made unavailable? | Rate limiting, resource quotas, redundancy |
| **E**levation of Privilege | Can an attacker gain higher access? | Least privilege, RBAC, input validation |

### Process

1. **Identify assets**: What data/systems need protection?
2. **Map trust boundaries**: Where do privilege levels change?
3. **Enumerate threats**: Apply STRIDE to each boundary crossing
4. **Assess risk**: Rate likelihood and impact (use CVSS if applicable)
5. **Define mitigations**: Specify controls for each threat
6. **Document**: Record in Jira ticket or Confluence page

### Output Format

```markdown
## Threat Model: [Feature Name]

### Assets
- [List protected data and systems]

### Trust Boundaries
- [List where privilege changes occur]

### Threats and Mitigations
| # | Threat | STRIDE | Risk | Mitigation | Status |
|---|--------|--------|------|------------|--------|
| 1 | [description] | [S/T/R/I/D/E] | [H/M/L] | [control] | [Open/Mitigated] |
```
