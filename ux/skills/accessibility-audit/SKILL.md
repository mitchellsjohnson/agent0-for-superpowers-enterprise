---
name: accessibility-audit
description: Use when building or reviewing any UI component, form, modal, or interactive element — required before UX approval sign-off
---

# Accessibility Audit

## Instructions

### WCAG 2.1 AA Checklist

For every UI component, verify:

**Perceivable**
- Color contrast ratio >= 4.5:1 for normal text, >= 3:1 for large text
- Non-text content has text alternatives (`alt`, `aria-label`)
- Content is readable without CSS (semantic HTML structure)
- No information conveyed by color alone

**Operable**
- All interactive elements reachable by keyboard (Tab/Shift+Tab)
- Focus order is logical (follows visual layout)
- Focus indicators are visible (outline or ring)
- No keyboard traps (user can always Tab away)
- Skip links available for repeated navigation

**Understandable**
- Form inputs have visible labels (not just placeholders)
- Error messages identify the field and suggest correction
- Required fields are indicated (both visually and programmatically)
- Language attribute set on `<html>` element

**Robust**
- Valid HTML (proper nesting, closed tags)
- ARIA attributes used correctly (roles, states, properties)
- Components work with screen readers (VoiceOver, NVDA)

### Common Violations

| Issue | Fix |
|-------|-----|
| Missing `aria-label` on icon button | Add `aria-label="Close dialog"` |
| Low contrast text | Use design system color tokens |
| Missing form label | Associate `<label>` with `htmlFor` |
| Focus not visible | Add `:focus-visible` styles |
| Images without alt text | Add descriptive `alt` attribute |
| Click handler on `<div>` | Use `<button>` or add `role="button"` + `tabIndex` |

### Testing Approach

1. **Keyboard navigation**: Tab through entire page, verify all controls reachable
2. **Screen reader**: Test with VoiceOver (Mac) -- all content announced correctly
3. **Zoom**: 200% zoom -- no content loss or overlap
4. **Contrast**: Check all text and interactive elements meet ratios

### Reporting

```markdown
## Accessibility Audit: [Component Name]

**WCAG Level**: AA
**Result**: [Pass/Fail]

| # | Issue | WCAG Criterion | Severity | Fix |
|---|-------|---------------|----------|-----|
| 1 | [description] | [e.g., 1.4.3 Contrast] | [Critical/Major/Minor] | [specific fix] |
```

> **HARD-GATE**: No UX sign-off without accessibility audit. Every UI component must pass WCAG 2.1 AA before the UXAgent approves.
