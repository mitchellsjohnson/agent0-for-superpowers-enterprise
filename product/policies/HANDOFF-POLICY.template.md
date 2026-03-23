# {{COMPANY_NAME}} Handoff Policy

## Purpose

This policy defines what must be documented when handing off completed work to Product, stakeholders, or other teams.

## Required Handoff Sections

Every handoff document must include:

### 1. What Was Built

**Requirements (BDD Format)**:
```gherkin
Given [context]
When [action]
Then [outcome]
```

Document all acceptance criteria as implemented. Not what you intended to build - what you actually built.

### 2. How to Verify

**Test Evidence**:
- [ ] Unit test results ({{COVERAGE_THRESHOLD}}% minimum)
- [ ] Integration test results (where applicable)
- [ ] E2E test results for critical paths
- [ ] Manual testing checklist completed

**Screenshots/Videos**:
- Attach screenshots of UI changes
- Attach video walkthrough for complex flows
- Show both happy path and error states

### 3. UX Spec (For UI Changes)

**Design Adherence**:
- [ ] Component: [Name from design system]
- [ ] Accessibility: WCAG compliance verified
- [ ] Responsive: Tested on [list breakpoints]
- [ ] Browser support: [list tested browsers]

**UX Review**:
- [ ] UX-Engineer review completed
- [ ] Design system patterns followed
- [ ] Accessibility audit passed

### 4. Security Certification (For Security-Sensitive Features)

**Security Review**:
- [ ] Security-Engineer review completed
- [ ] SAST scan: {{COMPANY_SAST_TOOL}} results attached
- [ ] Dependency scan: {{COMPANY_DEPENDENCY_SCANNER}} results attached
- [ ] No Critical or High vulnerabilities (or approved waivers documented)

**Security Checklist**:
- [ ] Authentication/authorization implemented correctly
- [ ] Input validation on all user inputs
- [ ] Secrets management follows policy
- [ ] Error messages don't leak sensitive data

### 5. Definition of Done

**Technical Completion**:
- [ ] Code reviewed and approved
- [ ] Tests passing in CI/CD
- [ ] Documentation updated (API docs, README, etc.)
- [ ] No known bugs or technical debt (or tracked in backlog)

**Deployment Readiness**:
- [ ] Feature flag configured (if applicable)
- [ ] Rollback plan documented
- [ ] Monitoring/alerting in place
- [ ] Runbook created (if operational impact)

### 6. Known Issues & Limitations

**What We Didn't Build**:
- Document scope decisions ("We built X but not Y because...")
- Document technical limitations
- Document future work needed

**Known Bugs**:
- List any known issues with priority and tracking links
- Note: No P0/P1 bugs allowed in handoff

## Handoff Templates by Type

### Feature Handoff Template

```markdown
# Feature: [Name]

## What Was Built

[BDD-style requirements]

## Test Evidence

- Unit tests: [link to report]
- Integration tests: [link to report]
- Coverage: [percentage]
- Screenshots: [attach here]

## UX Verification

- Component used: [name]
- Accessibility: [WCAG level]
- UX-Engineer sign-off: [name/date]

## Security Verification

- SAST scan: [attach results]
- Dependency scan: [attach results]
- Security-Engineer sign-off: [name/date]

## DoD Checklist

[Complete checklist above]

## Known Issues

[List any issues]
```

### Bug Fix Handoff Template

```markdown
# Bug Fix: [Title]

## Original Issue

[Link to bug report]

## Root Cause

[Brief explanation]

## What Was Fixed

[Specific changes made]

## Test Evidence

- Regression test: [link]
- Manual verification: [checklist]
- Coverage impact: [before/after]

## DoD Checklist

[Complete checklist above]
```

### Refactoring Handoff Template

```markdown
# Refactoring: [Title]

## Why This Was Done

[Business or technical rationale]

## What Changed

[High-level summary]

## Test Evidence

- All existing tests passing
- Coverage maintained or improved: [percentage]
- Performance impact: [benchmarks if relevant]

## Migration Guide (if breaking changes)

[How to migrate existing usage]

## DoD Checklist

[Complete checklist above]
```

## Who Approves Handoffs

| Work Type | Requires Approval From |
|-----------|------------------------|
| New features | Product-Manager, UX-Engineer (if UI), Security-Engineer (if security-sensitive) |
| Bug fixes | Software-Engineer-In-Test |
| Refactoring | Software-Architect |
| Security changes | Security-Engineer |
| Infrastructure | DevOps-Engineer |

## Handoff Automation

**Superpowers + Agent0 automate handoff creation:**

1. Engineer completes work
2. Superpowers invokes `/handoff` or similar
3. Agent0 spawns relevant specialists (Product-Manager, SET, Security-Engineer, UX-Engineer)
4. Specialists provide their section templates and requirements
5. Superpowers generates handoff document with all sections
6. Engineer fills in details (test links, screenshots, etc.)
7. Specialists review and approve

**Result:** Consistent, complete handoffs every time.

## Anti-Patterns

❌ **"It works on my machine"** - no test evidence attached
❌ **"I tested it manually"** - no automated tests
❌ **"Security said it's fine"** - no scan results attached
❌ **"Acceptance criteria are in the ticket"** - not in handoff doc
❌ **"UX approved in Slack"** - no formal sign-off documented

## Tools

- **Handoff template generator**: [Tool/script location]
- **Test report collector**: [Tool/script location]
- **Screenshot/video tool**: [Tool/script location]

## Examples

See `examples/handoffs/` for real handoff documents that follow this policy.
