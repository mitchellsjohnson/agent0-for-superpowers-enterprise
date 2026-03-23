# Typography

## Purpose
Defines how we use Radix `Text` and `Heading` components for typography across the application. Single source of truth for text sizing, weight, and color conventions.

## Font
**Inter** — used across the whole application. [Google Fonts specimen](https://fonts.google.com/specimen/Inter)

## Trigger Conditions
- When adding or styling `Text` or `Heading` components
- When choosing text size, weight, or color
- When structuring page titles, card titles, labels, or body content
- When setting heading hierarchy for accessibility (`as` prop)

## Reference
**Related:** `shared/skills/ux/design-system/badge.md` — Badge patterns that use typography. Form labels and help text. Empty and error state typography.

---

## Heading Sizes by Context

| Context | Size | Example |
|---------|------|---------|
| Page title | `size="6"` | Main page heading (always 6, never 7) |
| Section / card title | `size="4"` | Card headings, form titles, list item titles, subsections |

---

## Heading Hierarchy (Accessibility)

**Required:** Use the `as` prop on every `Heading` to indicate semantic hierarchy for screen readers. The `as` prop is purely semantic and does not affect visual appearance.

- **One `as="h1"` per page** — the page title only.
- **All other headings** — use `as="h2"`, `as="h3"`, etc. to match content structure. Do not skip levels (e.g., h1 → h3).

```tsx
{/* Page title — always size 6, only h1 on the page */}
<Heading as="h1" size="6">Component Details</Heading>

{/* Section title — h2 under page */}
<Heading as="h2" size="4">Settings</Heading>

{/* Card title within section — h3 */}
<Heading as="h3" size="4">Policy Compliance</Heading>
```

---

## Text Sizes by Context

| Context | Size | Weight | Color | Example |
|---------|------|--------|-------|---------|
| Body text | `size="2"` | default | default | Main content, descriptions |
| Labels / metadata | `size="2"` | default or `weight="bold"` | `color="gray"` for secondary | "Ecosystem:", "License:" |
| Help text / description | `size="1"` | default | `color="gray"` | Form help, empty state descriptions |
| Large metric / stat | `size="8"` | `weight="bold"` | default or semantic | Dashboard numbers (1,247) |
| Small metadata | `size="1"` | default | `color="gray"` | Timestamps, counts |

```tsx
{/* Body content */}
<Text size="2">Content</Text>

{/* Labels (secondary) */}
<Text size="2" color="gray">Ecosystem:</Text>

{/* Large stat */}
<Text size="8" weight="bold">1,247</Text>

{/* Help / description */}
<Text size="1" color="gray">Brief description or instruction</Text>
```

---

## Text Colors

| Use Case | Color | When |
|----------|-------|------|
| Primary text | default | Body content, titles |
| Secondary / metadata | `color="gray"` | Labels, descriptions, timestamps |
| Error | `color="red"` or `var(--red-9)` | Validation, error messages |
| Success | `color="green"` | Positive feedback |
| Links | `color="blue"` | Interactive text |

---

## Common Patterns

### Dashboard Stat Card

```tsx
<Text size="2" color="gray">Total Components</Text>
<Text size="8" weight="bold">1,247</Text>
```

### Metadata Row

```tsx
<Text size="2" color="gray">Ecosystem:</Text>
<Text size="2" color="gray">License:</Text>
```

### Card with Title and Description

```tsx
<Heading as="h2" size="4">Title</Heading>
<Text size="2">Content</Text>
```

### Form Labels (see form skill for full patterns)

- **Field label:** `Text size="2" weight="bold" mb="2"`
- **Help text:** `Text size="1" color="gray" mb="2"`
- **Form header:** `Heading as="h2" size="4" mb="2"` + `Text size="2" color="gray"` (use `as` to match page structure)

### Empty State (see ui-state skill)

- **Title:** `Text size="3" weight="medium"`
- **Description:** `Text size="1" color="gray"`

---

## Rules

- Use Radix `Text` and `Heading` components. Do not use raw HTML (`<p>`, `<h1>`, etc.) for styled text.
- **Font:** Inter — used across the whole application.
- **Heading `as` prop required** — every `Heading` must include `as="h1"` through `as="h6"` to indicate semantic hierarchy for screen readers. One `as="h1"` per page (the page title); all other headings follow content structure.
- **Size 2 is standard** for body text and labels. Size 1 for help/description. Size 8 for large metrics.
- **Gray for secondary** — labels, metadata, descriptions use `color="gray"`.
- **Heading hierarchy** — page title (size 6 only) > section/card (size 4). Use size 4 for all card titles and section headings.
- **Spacing** — use `mb` (margin-bottom) for vertical rhythm: `mb="2"` between label and content, `mb="4"` between sections.

---

## Related

- **Badge:** `shared/skills/ux/design-system/badge.md` — Badge typography patterns
- **Layout:** Spacing and structure
- **Forms:** Form labels & typography
- **UI States:** Empty state, error state typography
