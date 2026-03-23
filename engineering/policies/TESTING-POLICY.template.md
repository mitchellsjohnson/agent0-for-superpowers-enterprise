# {{COMPANY_NAME}} Testing Policy

This policy defines testing requirements for all {{COMPANY_NAME}} applications.

---

## 1. Testing Pyramid

```
        ╱╲
       ╱  ╲
      ╱ E2E╲         Few, critical paths only
     ╱──────╲
    ╱  Integ ╲       API contracts, integrations
   ╱──────────╲
  ╱    Unit    ╲     Most tests here
 ╱──────────────╲
```

### Distribution
- Unit: 70% of tests
- Integration: 20% of tests
- E2E: 10% of tests

---

## 2. Coverage Requirements

### Minimum Thresholds

| Type | Minimum | Target | Measured By |
|------|---------|--------|-------------|
| Line Coverage | {{COVERAGE_THRESHOLD}}% | 90% | Jest/JaCoCo |
| Branch Coverage | 75% | 85% | Jest/JaCoCo |
| Critical Paths | 100% | 100% | E2E tests |

### Exclusions
These may be excluded from coverage:
- Generated code
- Configuration files
- Test utilities
- Index/barrel files

---

## 3. Test Types

### Unit Tests

**Purpose**: Test individual functions/components in isolation

**Requirements**:
- Mock all external dependencies
- Test both happy path and error cases
- Test edge cases and boundary conditions
- Fast execution (< 100ms per test)

**Frameworks**:
- Frontend: Jest + React Testing Library
- Backend: JUnit 5 + Mockito

### Integration Tests

**Purpose**: Test component interactions and API contracts

**Requirements**:
- Test API endpoints end-to-end
- Test database operations
- Test external service integrations
- Use test containers where applicable

**Frameworks**:
- API: REST Assured, Supertest
- Database: Testcontainers

### E2E Tests

**Purpose**: Test critical user flows in real browser

**Requirements**:
- Cover critical business paths
- Use realistic test data
- Run in CI on every PR
- Parallel execution where possible

**Framework**: Playwright

---

## 4. Test Quality Standards

### Naming Convention

```typescript
describe('ComponentName', () => {
  describe('methodName', () => {
    it('should [expected behavior] when [condition]', () => {
      // Arrange
      // Act  
      // Assert
    });
  });
});
```

### AAA Pattern
All tests should follow Arrange-Act-Assert:

```typescript
it('should return filtered results when search term provided', () => {
  // Arrange
  const items = [{ name: 'foo' }, { name: 'bar' }];
  const searchTerm = 'foo';
  
  // Act
  const result = filterItems(items, searchTerm);
  
  // Assert
  expect(result).toHaveLength(1);
  expect(result[0].name).toBe('foo');
});
```

### Test Independence
- Tests must not depend on execution order
- Each test sets up its own data
- Tests clean up after themselves

### No Flaky Tests
- Flaky tests must be fixed or quarantined within 1 week
- Use explicit waits, not arbitrary sleeps
- Retry transient failures at infrastructure level, not test level

---

## 5. Test Data

### Factories
Use factories for creating test data:

```typescript
// Good
const user = UserFactory.build({ name: 'Test User' });

// Bad
const user = { id: 1, name: 'Test', email: 'test@test.com', ... };
```

### Fixtures
- Store large fixture data in `__fixtures__/` directories
- Keep fixtures minimal and focused
- Document fixture purpose

### Production Data
- NEVER use production data in tests
- NEVER copy production databases for testing
- Use anonymized/synthetic data only

---

## 6. CI/CD Integration

### PR Checks
All PRs must pass:
- Unit tests
- Integration tests
- E2E tests (critical subset)
- Coverage thresholds

### Main Branch
- Full test suite runs on merge
- Nightly full E2E suite
- Performance benchmarks weekly

### Test Reporting
- JUnit XML format for CI
- Coverage reports to Codecov
- Flaky test tracking enabled

---

## 7. Performance Testing

### When Required
- New API endpoints
- Database query changes
- Significant UI changes
- Before major releases

### Benchmarks
| Metric | Target |
|--------|--------|
| API Response (p95) | < 200ms |
| Page Load | < 3s |
| Database Query | < 100ms |

---

## 8. Security Testing

### Static Analysis
- Fortify SAST on all code
- ESLint security rules enabled
- Dependency scanning via Lifecycle

### Dynamic Testing
- OWASP ZAP on staging
- Penetration testing quarterly
