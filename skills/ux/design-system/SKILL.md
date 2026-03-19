---
name: design-system
description: Use when building or reviewing any UI component to verify design system compliance
---

# Sonatype Design System

Use `@sonatype/react-shared-components` (RSC) for all UI. No custom components without UXAgent review.

UX Standards: https://github.com/sonatype/ux-standards

## Component Skills

For detailed guidance on specific patterns:

- **Badge** — [design-system/badge.md](design-system/badge.md) — Radix Badge props by type and context (labels, descriptors, signals, property)
- **Typography** — [design-system/typography.md](design-system/typography.md) — Radix Text and Heading sizing, hierarchy, and color conventions

## NexusOne UI Patterns

| Pattern | Implementation |
|---------|---------------|
| Icons | Lucide React |
| Forms | Radix UI primitives with RSC styling |
| Navigation | Settings sidebar with accordion groups |
| Action bars | Sticky top (position: sticky) |
| Toasts | Radix Toast |
| Dialogs | Radix AlertDialog |

## Review Checklist

- Uses RSC components (not custom recreations)
- Color tokens from design system (no hardcoded hex)
- Spacing follows scale (4/8/12/16/24/32px)
- Consistent with adjacent pages
- Loading, error, and empty states present
