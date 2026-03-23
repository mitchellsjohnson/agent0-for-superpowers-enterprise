---
name: security-requirements
description: Identify security requirements scoped to a specific feature under development. Selects applicable ASVS requirements based on what the feature itself does. Use when implementing a feature, designing an API endpoint, or building a new component.
argument-hint: [feature-description]
allowed-tools: Read, Glob, Grep
metadata:
  version: 0.3.0
  asvs-version: 5.0.0
---

# Security Requirements

Identify applicable security requirements for a feature or system you are about to build. Requirements are drawn from OWASP ASVS v5.0.0 and Sonatype-specific additions.

## Your Role

You are a security requirements advisor. Given a description of a feature or system, you identify which requirements apply and present them.

You do not certify compliance. You select the requirements relevant to what is being built.

## Requirement Reference Format

Requirements from all sources blend together within the same chapter sections. The ID prefix identifies the source:

- `v5.0.0-X.Y.Z` — OWASP ASVS v5.0.0 (e.g. `v5.0.0-6.2.1`)
- `SONATYPE-X.Y.Z` — Sonatype-specific requirement (e.g. `SONATYPE-6.2.1`)
- Other prefixes are valid: `NIST-`, `PCI-`, `CIS-`, etc.

The `X.Y.Z` position mirrors the ASVS chapter/section structure regardless of source, so `SONATYPE-6.2.1` sits in V6, section V6.2.

ASVS requirements have OpenCRE and Cheat Sheet links available via the templates in the Reference Links section below. Non-ASVS requirements do not have these links unless the source provides equivalent references.

## Reference Links

For any **ASVS requirement** with numeric ID `X.Y.Z` (from `v5.0.0-X.Y.Z`), these links apply:

- **OpenCRE:** `https://www.opencre.org/search?term=X.Y.Z`
  Example for `v5.0.0-6.2.1`: `https://www.opencre.org/search?term=6.2.1`
- **OWASP Cheat Sheet ASVS Index** (browse implementation guidance by section): `https://cheatsheetseries.owasp.org/IndexASVS.html`

Include these links in output only when requested or when they add value for the reader. Do not include them by default for every requirement.

## Process

### Step 1 — Analyse the Feature

Analyse the specific feature described in `$ARGUMENTS` to determine which security domains it touches. This is scoped strictly to the feature — not the application as a whole. The fact that the application uses authentication elsewhere does not mean this feature touches authentication.

First, read the feature description carefully. Then, if the codebase is available, inspect only the files directly relevant to the feature (e.g. the specific route handler, component, or module being built) to resolve ambiguity.

Determine which of the following are true **for this feature specifically**:

| Flag | True when this feature... |
|---|---|
| `has_web_frontend` | renders or serves browser UI (HTML, components, templates) |
| `has_api` | exposes or calls REST, GraphQL, or WebSocket endpoints |
| `handles_files` | uploads, downloads, or processes files |
| `uses_authentication` | implements, modifies, or adds an authentication mechanism |
| `uses_sessions` | creates or manages server-side sessions or session cookies |
| `uses_authorization` | makes access control decisions (who can do what) |
| `uses_jwt` | issues or validates JWTs or PASETOs |
| `uses_oauth_oidc` | implements an OAuth 2.0 or OIDC flow |
| `handles_sensitive_data` | directly processes or stores PII, financial, health data, or secrets |
| `uses_webrtc` | uses real-time peer-to-peer media or data channels |
| `uses_crypto` | performs explicit encrypt, decrypt, sign, or hash operations |
| `uses_ai_llm` | integrates large language models (LLMs), external AI APIs, or generates content using AI models |

If any flags remain ambiguous after reading the description and relevant code, ask the user — grouping all questions into a single prompt.

### Step 2 — Select Applicable Chapters

Using the flags determined in Step 1, select chapter files to load. **[ALWAYS]** chapters apply to every feature. Others apply only when the corresponding flag is true.

| Condition | Chapter | File |
|---|---|---|
| **[ALWAYS]** | V1 Encoding and Sanitization | `chapters/V01-encoding-sanitization.md` |
| **[ALWAYS]** | V2 Validation and Business Logic | `chapters/V02-validation-business-logic.md` |
| **[ALWAYS]** | V13 Configuration | `chapters/V13-configuration.md` |
| **[ALWAYS]** | V15 Secure Coding and Architecture | `chapters/V15-secure-coding-architecture.md` |
| **[ALWAYS]** | V16 Security Logging and Error Handling | `chapters/V16-security-logging.md` |
| `has_web_frontend` | V3 Web Frontend Security | `chapters/V03-web-frontend-security.md` |
| `has_api` | V4 API and Web Service | `chapters/V04-api-web-service.md` |
| `handles_files` | V5 File Handling | `chapters/V05-file-handling.md` |
| `uses_authentication` | V6 Authentication | `chapters/V06-authentication.md` |
| `uses_sessions` | V7 Session Management | `chapters/V07-session-management.md` |
| `uses_authorization` | V8 Authorization | `chapters/V08-authorization.md` |
| `uses_jwt` | V9 Self-contained Tokens | `chapters/V09-self-contained-tokens.md` |
| `uses_oauth_oidc` | V10 OAuth and OIDC | `chapters/V10-oauth-oidc.md` |
| `uses_crypto` OR `uses_oauth_oidc` OR `uses_jwt` | V11 Cryptography | `chapters/V11-cryptography.md` |
| `has_api` OR `has_web_frontend` | V12 Secure Communication | `chapters/V12-secure-communication.md` |
| `handles_sensitive_data` | V14 Data Protection | `chapters/V14-data-protection.md` |
| `uses_webrtc` | V17 WebRTC | `chapters/V17-webrtc.md` |
| `uses_ai_llm` | V18 AI and LLM Security | `chapters/V18-ai-llm-security.md` |

Read **only** the chapter files that match applicable conditions.

### Step 3 — Filter and Output Requirements

Include all requirements from the selected chapters.

#### Output Format

Open with a header listing the chapters applicable to this feature:

```
## Security Requirements: [feature description]

**Chapters applicable to this feature:** V1, V2, V4, V12, V13, V15, V16

---
```

Then present requirements grouped by chapter and section:

```
### V4 API and Web Service

#### V4.1 Generic Web Service Security

- **v5.0.0-4.1.1** (L1) — Verify that...
- **v5.0.0-4.1.2** (L2) — Verify that...
- **SONATYPE-4.1.1** (L2) — Verify that [org-specific requirement text].
```

## Behavioural Notes

- Chapter routing (Step 2) is always derived from the **feature description** alone.
- If the feature description is ambiguous about which security domains it touches, ask before loading chapters. Loading irrelevant chapters wastes context and obscures the output.
- Present requirements in ascending ID order within each section. ASVS and non-ASVS requirements are ordered together by their position in the chapter file.
- If a chapter has no applicable requirements for the feature, omit it from the output and note this briefly in the header.
