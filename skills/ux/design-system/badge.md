# Badge

## Purpose
Defines which Radix Badge props to use by badge type and context. Single source of truth for badge styling.

## Trigger Conditions
- When adding any Badge component
- When choosing badge variant, color, radius, or size

## Reference
**Examples page:** `src/app/examples/badges/page.tsx` — visual matrix of all badge types and variants (nexusone-ux-prototype).

---

## Badge Categories by Context

| Type | Description | Card Props | Table Props | Page heading line Props |
|------|-------------|------------|-------------|-------------------------------|
| Label | Attribute/category names (Vulnerabilities, License, Malware, Stage, etc.). | text (no badge) | column header (no badge) | — |
| Descriptor | Contextual metadata (Ecosystem, Category, Role, Status). | soft, default radius, gray, size 1 | text (no badge) | soft, default radius, gray, size 2 |
| Property | Structural (Direct/Transitive). | solid, size 1, default radius | solid, size 1, default radius | solid, size 1, default radius |
| Signal | Decision-impacting (CVSS, trust score, policy compliance). | solid, full radius, size 1 | solid, full radius, size 1 | solid, full radius, size 2 |

---

## Badge Colors

| Use Case | Color | Category |
|----------|-------|----------|
| Descriptor | gray | Descriptor |
| Critical (9–10) | red | Signal |
| Severe (7–8.9) | orange | Signal |
| Moderate (4–6.9) | yellow | Signal |
| Low (0.1–3.9) | gray, solid | Signal |
| None (0) | gray, outline | Signal |
| Positive / Compliant | green | Signal |
| Warning / Review | yellow | Signal |
| Negative / Malware | red | Signal |
| Direct | indigo | Property |
| Transitive | purple | Property |
| Count badges | gray | Signal |

---

## Category Logic

**Labels** — attribute/category names (Vulnerabilities, License, Malware, Stage, etc.). Never badges. Always text (gray, smaller size). In cards: left side of a row. In tables: column header.

**Signals** — decision-impacting (CVSS, trust score, policy compliance). Always badges, usually solid, full radius. Color by risk/value.

**Descriptors** — contextual metadata (Ecosystem, Category, Role, Status). Badge in cards (soft, gray, default radius), text in tables. Never risk colors. Status (Active, Invited, Inactive) in user/role contexts is a descriptor — no decision needs to be made.

**Urgent descriptors** — Malware badges (MALWARE, INFECTED, Clean) and KEV badges (EXPLOITED, KNOWN EXPLOITS). Core category is Descriptor. Solid variant beside page title or in summary card; soft variant in page content, or card or table within page tabs. Default radius (never full) — Malware is never the primary signal.

**Property** — structural (Direct/Transitive). Badge everywhere, solid, default radius. Same variant in cards and tables.

---

## Exceptions

- **DTS Sub-Score:** Use soft variant so the colored dot remains visible against the badge background. Fixed minWidth when stacked in a column so sub-scores align visually.
- **Direct/Transitive:** Fixed width (e.g. width/height 20px) for D/T badges in tables so columns align when rows mix Direct and Transitive.
- **Certification (Gold/Silver):** Reserved — no current plans; optional for future use. Gold=amber, Silver=gray when implemented.
- **CVSS/Severity de-emphasis:** None (0) uses `variant="outline"` and Low (0.1–3.9) uses `color="gray"` solid to reduce visual weight for lower-priority items.
- **CVSS card pattern:** When the number is displayed prominently elsewhere (e.g., large score in card body), use a badge with only the severity label (Critical, High, Medium, Low, None). Badge in top-right of card, color by severity.
- **Vulnerability cards:** CVSS and Exploited (KEV) badges can appear together. CVSS is the core signal (full radius). Exploited is urgent descriptor (default radius).
- **Policy compliance cards:** Show all signals (Vulnerabilities, License, Malware, etc.).
- **Malware badges (urgent descriptors):**
  - **Core category:** Descriptor. **Exception:** Solid variant when beside page title or in summary card (urgent — malware means automatic infection). Soft variant in page content, or card or table within page tabs.
  - **Radius:** Default (never full) — Malware is never the primary signal.
  - **Badges:** MALWARE (beside CVE/vulnerability title), INFECTED, Clean.
  - **Placement:** Beside page title or in summary card: MALWARE badge, solid, default radius, size 2. In page content, or card or table within page tabs: INFECTED or Clean, soft, default radius, size 1. Clean never appears beside a title — we only warn if there is malware.
  - **Label vs. badge:** When Malware is a row label in a Policy Compliance card (alongside Vulnerabilities, License), use text: `<Text size="2" color="gray">Malware</Text>`. Labels are never badges. Only the status (Clean/INFECTED) is a badge.
- **KEV Status badges (urgent descriptors):**
  - **Badges:** EXPLOITED (beside title), KNOWN EXPLOITS (in page content), Not in KEV Catalog: No known exploits.
  - **Placement:** Beside page title or in summary card: EXPLOITED, solid, default radius, size 2. In page content, or card or table within page tabs: KNOWN EXPLOITS or Not in KEV Catalog, soft, default radius, size 1.
  - **EXPLOITED tooltip:** When EXPLOITED appears beside a title, wrap in `<Tooltip content="This component has known exploits (is listed in the KEV catalog)">`.

---

## Rules

- **Labels are never badges.** Attribute/category names (Vulnerabilities, License, Malware, Stage, etc.) are always text.
- Prefer Radix props only. Exceptions: fixed width/height for Direct/Transitive in tables (column alignment); fixed minWidth for DTS sub-scores when stacked in a column.
- Size 1 in cards/tables; size 2 when inline with page title.
- Descriptors: badge in cards, text in tables; default radius (omit `radius` prop).
- Property badges: default radius (omit `radius` prop).
- **Tooltips:** Any badge whose meaning is not self-evident from its content alone requires a Tooltip. If it would be ambiguous without column headers, adjacent labels, or page context, add a tooltip. Wrap in `<Tooltip content="…">` so the meaning is available on hover. Examples: numbers without context (CVSS 9.8, threat level 10, filter counts), icons, abbreviations (D/T). Use concise tooltip text (e.g., `Threat Level: 10 Critical`).
- **Using icons in badges:** Badges may include icons only in these cases: (1) Status badges — checkmark or X for meets/fails (Compliant, Not Compliant). The icon may appear alone (with a tooltip) or next to the label. (2) DTS signal badges — thumb up, sideways, or down for DTS trend. All other badges must be text-only. Do not use icons in descriptor badges (Latest, Best, Ecosystem, Category, Role, Status), property badges (Direct/Transitive), or other signal badges (CVSS, severity, policy compliance status, etc.).
