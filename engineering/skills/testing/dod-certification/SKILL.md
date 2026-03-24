---
name: dod-certification
description: Use when validating Definition of Done for completed work — SET validates quality gates before Agent0 accepts work
---

# Definition of Done Certification

## Purpose

This skill provides the operational procedure for SoftwareEngineerInTest to validate the Definition of Done checklist against completed work.

**Read the canonical testing / handoff policies first**: `engineering/policies/TESTING-POLICY.template.md`, `product/policies/HANDOFF-POLICY.template.md`

---

## When to Use

- Agent0 requests DoD validation for completed work
- A SQUAD agent reports task completion
- Before accepting a PR for merge
- At sprint end, before releasing work

---

## Validation Procedure

### Step 1: Establish Context

```bash
# Check what work is being validated
yarn bd show <task-id>

# Identify changed files
git diff <base-branch>...HEAD --name-only
```

**Output**: List of changed files, task description, acceptance criteria.

---

### Step 2: Quality Gates Validation

#### 2.1 Test Coverage Check

**Frontend (JavaScript/TypeScript):**
```bash
# Run coverage for affected workspace
yarn workspace <workspace-name> run test:coverage

# Check coverage thresholds
# Look for: statements 80%+, branches 75%+, functions 80%+, lines 80%+
```

**Backend (Java):**
```bash
# Run tests with coverage
./mvnw verify -Pcoverage

# Check JaCoCo reports
# Look for: Line coverage 80%+, Branch coverage 75%+
```

**Criteria:**
- [ ] Coverage meets minimum thresholds (80% line, 75% branch)
- [ ] No coverage regressions (current >= baseline)
- [ ] New code has tests (not just legacy coverage)

---

#### 2.2 Test Execution

**Frontend:**
```bash
# Run all tests
yarn workspace <workspace-name> run test

# Run E2E if applicable
yarn test:e2e
```

**Backend:**
```bash
# Run unit tests
./mvnw test

# Run integration tests
./mvnw verify -Dit
```

**Criteria:**
- [ ] All unit tests pass
- [ ] All integration tests pass (if applicable)
- [ ] All E2E tests pass (if applicable)
- [ ] No test skips or ignores without documented reason

---

#### 2.3 Build Verification

**Frontend:**
```bash
# Verify build succeeds
yarn workspace <workspace-name> run build
```

**Backend:**
```bash
# Verify package succeeds
./mvnw package -DskipTests
```

**Criteria:**
- [ ] Build completes without errors
- [ ] No new warnings introduced
- [ ] Bundle size acceptable (if frontend)

---

#### 2.4 Code Quality

**Linting:**
```bash
# Frontend
yarn workspace <workspace-name> run lint

# Backend
./mvnw spotless:check
```

**Criteria:**
- [ ] No linting errors
- [ ] Style guide compliance
- [ ] License headers present

---

### Step 3: Requirements Validation

**Review acceptance criteria from task description:**
- [ ] All BDD scenarios pass (if defined)
- [ ] Functional requirements met
- [ ] Non-functional requirements met (performance, accessibility)

**Manual testing (if needed):**
- [ ] Start the application
- [ ] Exercise the changed functionality
- [ ] Verify behavior matches specification

---

### Step 4: Document Findings

**If ALL criteria pass:**
```markdown
## DoD Certification: PASSED ✅

### Quality Gates
- ✅ Test coverage: [X]% statements, [Y]% branches
- ✅ All tests pass: [N] tests, 0 failures
- ✅ Build succeeds: No errors
- ✅ Code quality: Linting clean

### Recommendations
- [Any optional improvements or observations]

**Status**: Ready for Agent0 acceptance.
```

**If ANY criteria fail:**
```markdown
## DoD Certification: BLOCKED ❌

### Failed Criteria
- ❌ [Specific criterion] - [Details]
- ❌ [Specific criterion] - [Details]

### Required Actions
1. [Action to fix first failure]
2. [Action to fix second failure]

**Status**: BLOCKED - Cannot accept until criteria met.
```

---

## Reporting to Agent0

Use `SendMessage` to report findings:

**Passed:**
```
SendMessage:
  to: "team-lead"
  message: "DoD certification PASSED for task <id>. All quality gates met. Ready for acceptance."
  summary: "DoD certified - ready for acceptance"
```

**Blocked:**
```
SendMessage:
  to: "team-lead"
  message: "DoD certification BLOCKED for task <id>. Failed: [list]. Required actions: [list]."
  summary: "DoD blocked - action required"
```

---

## Authority

**You have authority to:**
- Block completion if quality gates not met
- Require additional tests or coverage
- Request fixes for test failures
- Validate against DoD checklist

**You do NOT have authority to:**
- Override other COE vetoes (Security, UX)
- Change DoD criteria without Agent0 approval
- Skip validation steps without escalation

---

## Hard Gates

> **HARD-GATE**: The coverage thresholds (80% statements, 75% branches) are **minimums**, not targets. Work below these thresholds MUST be blocked.

> **HARD-GATE**: Test failures MUST be fixed before acceptance. No "merge now, fix later" except for documented hot fixes with Agent0 approval.

> **HARD-GATE**: Never estimate or assume coverage — measure it. Always run the actual coverage tools.

---

## When to Escalate

- Coverage cannot meet threshold due to legacy code (discuss exception with Agent0)
- Test infrastructure failures block validation
- Disagreement on whether DoD is met
- Time pressure conflicts with quality standards

**Always escalate rather than compromising quality gates.**
