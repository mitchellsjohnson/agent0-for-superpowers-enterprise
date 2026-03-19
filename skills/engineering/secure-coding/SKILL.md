---
name: secure-coding
description: Use when implementing authentication, authorization, input handling, data storage, or any security-sensitive code path
---

# Secure Coding Standards

## Input Validation

- Validate all user input server-side
- Use allowlists over denylists
- Validate type, length, format, range

## Output Encoding

- Encode output based on context (HTML, JS, URL)
- React auto-escapes JSX (use it)
- Never use `dangerouslySetInnerHTML` without sanitization

## Authentication

- Use framework auth (Shiro for Nexus, Spring Security elsewhere)
- Session timeout: 30 minutes
- Constant-time comparison for secrets

## SQL/Data Access

- Parameterized queries only (MyBatis mapped statements)
- Never concatenate user input into SQL

## Secrets

- No secrets in code, logs, or client-side
- Use environment variables or vault

> **HARD-GATE**: SecurityEngineer must review any code touching auth, crypto, or user data before merge. Self-review is not sufficient.
