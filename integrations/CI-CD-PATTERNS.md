# CI/CD Integration Patterns

Generic patterns for CI/CD integration. Customize for your company's pipeline tools.

## Pre-Commit Checks

**Pattern**: Run fast checks before commit
- Linting
- Formatting
- Unit tests (fast subset)

**Implementation**: Git hooks

```bash
# .git/hooks/pre-commit
npm run lint
npm run format:check
npm run test:fast
```

## Pre-Merge Checks

**Pattern**: Run comprehensive checks before merge
- Full test suite
- SAST scan
- Dependency vulnerability scan
- Coverage check

**Implementation**: CI/CD pipeline (GitHub Actions, GitLab CI, Jenkins)

### Example: GitHub Actions

```yaml
name: Pre-Merge Checks
on: pull_request

jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Tests
        run: npm test
      - name: Check Coverage
        run: |
          COVERAGE=$(npm run coverage:report | grep "Coverage" | awk '{print $2}')
          if [ "$COVERAGE" -lt {{COVERAGE_THRESHOLD}} ]; then
            echo "Coverage below threshold"
            exit 1
          fi

  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: SAST Scan
        run: {{COMPANY_SAST_TOOL}} scan
      - name: Dependency Scan
        run: {{COMPANY_DEPENDENCY_SCANNER}} scan
      - name: Block on Critical/High
        run: |
          if [ "$CRITICAL_COUNT" -gt 0 ]; then
            echo "Critical vulnerabilities found. Blocking merge."
            exit 1
          fi
```

### Example: GitLab CI

```yaml
stages:
  - test
  - security

test:
  stage: test
  script:
    - npm test
    - npm run coverage:check

sast:
  stage: security
  script:
    - {{COMPANY_SAST_TOOL}} scan
    - exit_on_critical_vulns.sh

dependency_scan:
  stage: security
  script:
    - {{COMPANY_DEPENDENCY_SCANNER}} scan
    - exit_on_critical_vulns.sh
```

## Post-Merge Automation

**Pattern**: Automate after merge to main
- Deploy to staging
- Run integration tests
- Update documentation

```yaml
name: Post-Merge
on:
  push:
    branches: [main]

jobs:
  deploy-staging:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy
        run: deploy-to-staging.sh
      - name: Integration Tests
        run: npm run test:integration
      - name: Notify
        run: slack-notify.sh "Deployed to staging"
```

## Deployment Pipeline

**Pattern**: Progressive rollout to production

```
Merge → Staging → Integration Tests → Canary Deploy → Full Deploy
```

**Best Practices**:
- Blue-green or canary deployments
- Automated rollback on failure
- Health checks before routing traffic
- Monitoring and alerting

## Customization

Replace placeholders:
- `{{COMPANY_SAST_TOOL}}` → Your SAST tool command
- `{{COMPANY_DEPENDENCY_SCANNER}}` → Your dependency scanner command
- `{{COVERAGE_THRESHOLD}}` → Your required coverage percentage

Adapt pipeline syntax for your CI/CD platform:
- GitHub Actions: `.github/workflows/`
- GitLab CI: `.gitlab-ci.yml`
- Jenkins: `Jenkinsfile`
- CircleCI: `.circleci/config.yml`
