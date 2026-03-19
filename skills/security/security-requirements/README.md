# /security-requirements

Identifies applicable security requirements for a feature or system you are about to build. Requirements are grounded in [OWASP ASVS v5.0.0](https://asvs.dev/) and extended with Sonatype-specific additions.

## Usage

```
/security-requirements [feature-description]
```

Examples:

```
/security-requirements implement a password reset flow
/security-requirements add file upload support to the user profile page
/security-requirements build a GraphQL API with JWT authentication
```

## What It Does

1. **Analyses the feature description** to determine which security domains it touches
2. **Inspects relevant code** if the codebase is available, to resolve ambiguity
3. **Asks follow-up questions** only for flags that remain unclear
4. **Loads applicable ASVS chapters** based on the feature's flags
5. **Outputs filtered requirements** from the selected chapters

## Requirement Chapters

18 chapter files in `chapters/`, organized to mirror the ASVS v5.0.0 structure. Only chapters relevant to the feature are loaded.

| Chapter | Topic |
|---|---|
| V1 | Encoding and Sanitization |
| V2 | Validation and Business Logic |
| V3 | Web Frontend Security |
| V4 | API and Web Service |
| V5 | File Handling |
| V6 | Authentication |
| V7 | Session Management |
| V8 | Authorization |
| V9 | Self-contained Tokens |
| V10 | OAuth and OIDC |
| V11 | Cryptography |
| V12 | Secure Communication |
| V13 | Configuration |
| V14 | Data Protection |
| V15 | Secure Coding and Architecture |
| V16 | Security Logging and Error Handling |
| V17 | WebRTC |
| V18 | AI and LLM Security |

### Requirement IDs

Requirements from different sources blend together within sections. The ID prefix identifies the source:

- `v5.0.0-X.Y.Z` — OWASP ASVS v5.0.0
- `SONATYPE-X.Y.Z` — Sonatype-specific requirement
- Other prefixes (`NIST-`, `PCI-`, `CIS-`, etc.) are valid for requirements drawn from other frameworks

The `X.Y.Z` position follows the ASVS chapter/section structure regardless of source.

## Sonatype-specific Requirements

`SONATYPE-X.Y.Z` requirements are derived from Sonatype's internal information security policies and standards. The table below lists every current Sonatype requirement, its source document, and the Confluence page for reference.

| Requirement ID | Chapter | Source Document | Confluence Page |
|---|---|---|---|
| SONATYPE-11.2.1 | V11 Cryptography | Encryption Standard | [Encryption Standard](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/713162780) |
| SONATYPE-11.4.1 | V11 Cryptography | Encryption Standard | [Encryption Standard](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/713162780) |
| SONATYPE-15.1.1 | V15 Secure Coding and Architecture | Vulnerability Management Standard | [Vulnerability Management Standard](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/878706861) |
| SONATYPE-15.2.1 | V15 Secure Coding and Architecture | Secure Software and Systems Development Policy | [Secure Software and Systems Development Policy](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/662339715) |
| SONATYPE-16.2.1 | V16 Security Logging and Error Handling | Logging and Monitoring Standard | [Logging and Monitoring Standard](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/712802454) |
| SONATYPE-16.3.1 | V16 Security Logging and Error Handling | Logging and Monitoring Standard | [Logging and Monitoring Standard](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/712802454) |
| SONATYPE-16.3.2 | V16 Security Logging and Error Handling | Logging and Monitoring Standard | [Logging and Monitoring Standard](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/712802454) |
| SONATYPE-18.1.1 | V18 AI and LLM Security | AI Acceptable Use Policy | [AI Acceptable Use Policy](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/1429733438) |
| SONATYPE-18.1.2 | V18 AI and LLM Security | AI Acceptable Use Policy | [AI Acceptable Use Policy](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/1429733438) |
| SONATYPE-18.1.3 | V18 AI and LLM Security | AI Acceptable Use Policy | [AI Acceptable Use Policy](https://sonatype.atlassian.net/wiki/spaces/SEC/pages/1429733438) |

## Editing Chapter Files

The chapter files in `chapters/` are Sonatype-owned. To add, update, or remove a requirement, edit the relevant chapter file directly:

- To **add** a Sonatype requirement, place it in the appropriate section with a `SONATYPE-X.Y.Z` ID and an L1/L2/L3 level marker, then add a row to the traceability table above with the source document and Confluence link.
- To **update** an ASVS requirement, find it by its `v5.0.0-X.Y.Z` ID and edit the text in place.
- To **remove** an ASVS requirement that does not apply, delete it or comment it out with a note explaining why.

