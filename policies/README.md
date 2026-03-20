# Policy Templates

These templates define enterprise standards. Customize with your company's actual requirements.

## Available Templates

- **SECURITY-POLICY.template.md**: Security SLAs, vulnerability management, secrets management
- **TESTING-POLICY.template.md**: Coverage requirements, testing standards, DoD
- **UX-STANDARDS.template.md**: Design system, accessibility, UX patterns
- **TECH-STACK.template.md**: Approved languages, frameworks, tools

## Customization

1. Copy each `.template.md` file, removing `.template` extension
2. Replace all `{{PLACEHOLDERS}}` with your company's actual values
3. Delete templates after customization (or keep for reference)

### Common Placeholders

| Placeholder | Example Value |
|-------------|---------------|
| `{{COMPANY_NAME}}` | Acme Corp |
| `{{CRITICAL_SLA_DAYS}}` | 7 |
| `{{HIGH_SLA_DAYS}}` | 30 |
| `{{MEDIUM_SLA_DAYS}}` | 90 |
| `{{CRITICAL_ESCALATION}}` | VP Engineering |
| `{{HIGH_ESCALATION}}` | Engineering Manager |
| `{{COVERAGE_THRESHOLD}}` | 80 |
| `{{COMPANY_SAST_TOOL}}` | Fortify, SonarQube |
| `{{COMPANY_DEPENDENCY_SCANNER}}` | Lifecycle, Snyk |

## After Customization

Your `policies/` directory should contain:
- `SECURITY-POLICY.md` (no .template)
- `TESTING-POLICY.md`
- `UX-STANDARDS.md`
- `TECH-STACK.md`
- `README.md` (this file, updated with your company name)
