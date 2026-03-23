---
name: coverage-analysis
description: Use when assessing test health before a release, after adding new features, or when coverage drops are detected
---

# Coverage Analysis

## Thresholds

| Metric | Minimum |
|--------|---------|
| Statements | 80% |
| Branches | 75% |
| Functions | 80% |
| Lines | 80% |

## Focus Areas (Priority Order)

1. Business logic (hooks, utilities, state)
2. Error handling (catch blocks, error boundaries)
3. Edge cases (empty arrays, nulls, boundaries)
4. User interactions (forms, clicks, navigation)

> **HARD-GATE**: The thresholds (80% statements, 75% branches, 80% functions, 80% lines) are **minimums**, not targets. Work below these thresholds cannot be merged. Work that drops existing coverage cannot be merged.
