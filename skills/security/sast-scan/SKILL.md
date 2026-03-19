---
name: sast-scan
description: Run Static Application Security Testing (SAST) scan
---

# SAST Scan

Run SAST scan using {{COMPANY_SAST_TOOL}} to identify security vulnerabilities in source code.

## When to Use

- Before merge to main/master
- On pull requests
- During security reviews
- When adding/modifying security-sensitive code

## How to Run

```bash
# Run SAST scan (customize for your tool)
{{COMPANY_SAST_TOOL}} scan --path . --output results.json
```

## Interpreting Results

**Critical**: Must fix before merge
**High**: Must fix before merge (or get security approval)
**Medium**: Should fix, can be deferred with tracking
**Low**: Nice to fix, optional

## Common Issues

- **SQL Injection**: Use parameterized queries
- **XSS**: Sanitize user input, use proper escaping
- **Hardcoded Secrets**: Use environment variables or secrets manager
- **Insecure Crypto**: Use approved cryptographic libraries

## Integration

Add to CI/CD pipeline:
```yaml
sast:
  runs-on: ubuntu-latest
  steps:
    - name: Run SAST
      run: {{COMPANY_SAST_TOOL}} scan
    - name: Block on Critical/High
      run: |
        if [ "$CRITICAL_COUNT" -gt 0 ]; then exit 1; fi
```
