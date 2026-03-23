---
name: test-strategy
description: Use when planning tests for a new feature or sprint — before any implementation begins
---

# Test Strategy

## Coverage Thresholds

| Type | Minimum | Target |
|------|---------|--------|
| Unit | 80% | 90% |
| Integration | Critical paths | All endpoints |
| E2E | Happy paths | Critical flows |

## For Every Feature

1. Unit tests for all business logic, hooks, utilities
2. Integration tests for API endpoints
3. Component tests for React components
4. E2E tests for critical user flows

## Test Naming

```typescript
describe('ComponentName', () => {
  it('should [behavior] when [condition]', () => {});
});
```

## Quality Gates

- All new code has unit tests
- API hooks have integration tests
- Forms have validation tests
- No test regressions
- Coverage meets threshold

> **HARD-GATE**: Establish a coverage baseline BEFORE implementing any new feature. You cannot measure improvement without a starting point. Never estimate coverage — measure it.
