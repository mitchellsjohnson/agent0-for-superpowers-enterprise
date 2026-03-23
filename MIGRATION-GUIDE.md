# Migration guide: entity-first → org-first layout

This document is for maintainers who customized **agent0-for-superpowers-enterprise** (or a fork) before the org-first restructure.

## What changed

**Before (entity-first):**

- `agents/<domain>/` — all agent markdown in one tree
- `skills/<domain>/` — all skills in one tree  
- `policies/` — flat policy files at repo root

**After (org-first):**

- `security/`, `data/`, `engineering/`, `product/`, `ux/` — each domain owns `agents/`, `skills/`, `policies/`, and optional `tools/`
- Top-level `agents/`, `skills/`, and `policies/` are removed after migration
- **`config.yaml`** + **`./build.sh`** produce a generated **`plugin/`** directory (optional for template users; required for the fork + CI model)

## Why

- **Ownership**: CODEOWNERS and GitHub teams map cleanly to `/security/`, `/engineering/`, etc.
- **Fork workflow**: Companies fork enterprise, set `config.yaml`, add `overrides/`, and CI builds `plugin/` without hand-editing dozens of files.
- **Clearer navigation**: Everything for a domain lives under one prefix.

## Breaking changes

| Area | Old | New |
|------|-----|-----|
| Security agents | `agents/security/*.md` | `security/agents/*.md` |
| Security skills | `skills/security/*` | `security/skills/*` |
| Security policy | `policies/SECURITY-POLICY*.md` | `security/policies/` |
| SET / testing | `agents/engineering/`, `skills/testing/` | `engineering/agents/`, `engineering/skills/testing/` |
| Product policy | `policies/HANDOFF-POLICY*.md` | `product/policies/` |
| UX policy | `policies/UX-STANDARDS*.md` | `ux/policies/` |
| Discovery doc | Paths in docs pointed at `agents/` | See `AGENT-INDEX.md` path table; spawn uses `{{plugin_id}}` when using the build |

**Orchestration:** `agents/orchestration/` is removed from the enterprise template; Superpowers is the orchestrator.

## How to migrate an existing fork

1. **Add upstream** (if not already):

   ```bash
   git remote add upstream https://github.com/mitchellsjohnson/agent0-for-superpowers-enterprise.git
   git fetch upstream
   ```

2. **Merge or cherry-pick** the org-first commits from `upstream/main`, or manually move files to match the table above.

3. **Move your customizations** into the matching domain folder (e.g. your security agent edits → `security/agents/`).

4. **Introduce `config.yaml`** (copy from `config.yaml.example`). Set `plugin_id` to match `.claude-plugin/plugin.json` `name`.

5. **Run `./build.sh`** and commit updated **`plugin/`** if you rely on the generated install tree or CI.

6. **Update internal docs** or bookmarks that referenced old paths (`agents/security/...`, `policies/...`).

## Placeholders and build

The build substitutes both **dotted** tokens (e.g. `{{security.sast_tool}}`) and **legacy** tokens (e.g. `{{COMPANY_NAME}}`, `{{COVERAGE_THRESHOLD}}`) in markdown under `plugin/`. See `build.sh` and `config.yaml.example` for the full set.

## Deprecation

There is **no** continued support for the old top-level `agents/` / `skills/` / `policies/` layout in the enterprise template. Forks should migrate on their next merge from upstream.

## Questions

Open a discussion or issue on [agent0-for-superpowers-enterprise](https://github.com/mitchellsjohnson/agent0-for-superpowers-enterprise).
