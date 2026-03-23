# {{COMPANY_NAME}} UX Standards Reference

> **IMPORTANT**: This file is NOT the official UX standards. {{COMPANY_NAME}}'s official UX standards are maintained in a dedicated repository.

## Official UX Standards Location

**The authoritative {{COMPANY_NAME}} UX standards are located in the ux-standards repository:**

- **[sonatype/ux-standards](https://github.com/sonatype/ux-standards)** - Complete UX standards, design system, patterns, and guidelines

### For Machine Agents

If you are an AI agent working on this codebase, you MUST clone or access the [ux-standards repository](https://github.com/sonatype/ux-standards) to retrieve the current UX standards and design guidelines. Use these standards as context when implementing user interfaces or reviewing UX decisions. Do not rely solely on the quick reference below.

**To access the repository:**
```bash
git clone https://github.com/sonatype/ux-standards.git
```

### For Human Operators

Access the [ux-standards repository](https://github.com/sonatype/ux-standards) to review the complete UX requirements, design system documentation, component guidelines, and patterns. The content below is only a quick reference guide and may not reflect the latest standards.

---

## Quick Reference Guide (Not Official Standards)

The following is a high-level reference for common UX requirements. **This does not replace or supersede the official ux-standards repository.**

---

## 1. Design System

### Component Library

All {{COMPANY_NAME}} applications MUST use `@sonatype/react-shared-components`:

```bash
yarn add @sonatype/react-shared-components
```

Documentation: [Internal Storybook](https://storybook.sonatype.com)

### When to Use Custom Components

Custom components require UX team approval when:
- No equivalent exists in the shared library
- Significant modification to existing component needed
- Application-specific interaction pattern required

Process:
1. Check shared library first
2. Propose to UX team in #ux-review Slack
3. Get written approval before implementation
4. Consider contributing back to shared library

---

## 2. Accessibility (a11y)

### Requirements

All {{COMPANY_NAME}} applications MUST meet **WCAG 2.1 Level AA**.

### Key Standards

| Category | Requirement |
|----------|-------------|
| Color Contrast | 4.5:1 for normal text, 3:1 for large text |
| Keyboard Navigation | All interactive elements accessible via Tab |
| Screen Readers | All content readable by screen readers |
| Focus Indicators | Visible focus state on all interactive elements |
| Error Messages | Associated with form fields via aria-describedby |

### Testing Tools
- axe DevTools browser extension
- WAVE evaluation tool
- VoiceOver (macOS) / NVDA (Windows)

### Common Issues to Avoid
- Images without alt text
- Form inputs without labels
- Non-semantic HTML (div instead of button)
- Color as only indicator of state

---

## 3. Responsive Design

### Breakpoints

| Name | Width | Target |
|------|-------|--------|
| Mobile | < 768px | Phones |
| Tablet | 768-1024px | Tablets, small laptops |
| Desktop | > 1024px | Desktop browsers |

### Requirements
- Mobile-first approach
- No horizontal scrolling at any breakpoint
- Touch targets minimum 44x44px on mobile
- Text readable without zooming

---

## 4. Performance

### Targets

| Metric | Target | Maximum |
|--------|--------|---------|
| First Contentful Paint | < 1.5s | 2.5s |
| Time to Interactive | < 3s | 5s |
| Cumulative Layout Shift | < 0.1 | 0.25 |
| Largest Contentful Paint | < 2.5s | 4s |

### Best Practices
- Lazy load images and non-critical components
- Code split by route
- Optimize images (WebP, appropriate sizing)
- Minimize bundle size

---

## 5. Branding

### Colors

| Name | Value | Usage |
|------|-------|-------|
| {{COMPANY_NAME}} Blue | #1E8DCB | Primary actions, links |
| Dark Navy | #0B1F3A | Headers, text |
| Success Green | #2ECC71 | Success states |
| Warning Orange | #F39C12 | Warnings |
| Error Red | #E74C3C | Errors, destructive actions |

### Typography
- Primary: Inter (sans-serif)
- Monospace: Source Code Pro
- Base size: 16px
- Line height: 1.5

### Logo Usage
- Minimum clear space: 16px
- Do not distort or recolor
- See brand guidelines for full rules

---

## 6. Patterns

### Navigation
- Primary navigation in left sidebar
- Breadcrumbs for deep hierarchies
- Clear back buttons/links

### Forms
- Labels above inputs
- Inline validation on blur
- Clear error messages
- Disable submit until valid
- Show loading state during submission

### Tables
- Sortable columns where applicable
- Pagination for large datasets
- Row actions on hover or in column
- Empty state messaging

### Feedback
- Toast notifications for async actions
- Inline messages for form feedback
- Loading spinners for async operations
- Skeleton screens for initial load

---

## 7. Review Process

### UX Review Required For
- New pages or major features
- Changes to navigation structure
- New component patterns
- Accessibility-sensitive changes

### How to Request
1. Post in #ux-review Slack with:
   - Screenshots or Figma link
   - User flow description
   - Accessibility considerations
2. UX team responds within 2 business days
