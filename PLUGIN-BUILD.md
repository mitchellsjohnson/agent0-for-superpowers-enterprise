# Building Your Company's Plugin

This guide explains how to fork this generic framework and build it into a plugin for your company that works with **both Claude Code and Cursor**.

## Overview

This repo is a **generic template**. To use it:

1. **Fork** this repo to your company's GitHub
2. **Customize** with your company's values (replace `{{PLACEHOLDERS}}`)
3. **Configure** plugin metadata
4. **Install** as a plugin from your fork

The repo structure is already plugin-ready - you just need to customize the content.

## Step 1: Fork and Clone

```bash
# 1. Fork on GitHub
# Go to: https://github.com/mitchellsjohnson/agent0-for-superpowers-enterprise
# Click "Fork" → Create fork in your company org

# 2. Clone your fork
git clone git@github.com:YOUR-COMPANY/agent0-for-superpowers-YOUR-COMPANY.git
cd agent0-for-superpowers-YOUR-COMPANY
```

## Step 2: Replace Placeholders

### Find All Placeholders

```bash
grep -r "{{" . --include="*.md" | grep -v ".git"
```

### Common Replacements

```bash
# Company name
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i '' 's/{{COMPANY_NAME}}/Acme/g' {} +

# Security values
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i '' \
  -e 's/{{CRITICAL_SLA_DAYS}}/7/g' \
  -e 's/{{HIGH_SLA_DAYS}}/30/g' \
  -e 's/{{MEDIUM_SLA_DAYS}}/90/g' \
  -e 's/{{COVERAGE_THRESHOLD}}/80/g' \
  -e 's/{{COMPANY_SAST_TOOL}}/SonarQube/g' \
  -e 's/{{COMPANY_SCA_TOOL}}/Snyk/g' \
  {} +
```

**See `policies/README.md` for full list of placeholders.**

### Remove Template Files

```bash
cd policies/
for f in *.template.md; do
  mv "$f" "${f%.template.md}.md"
done
```

## Step 3: Configure Plugin Metadata

You need to update plugin metadata for **both Claude Code and Cursor**.

### Edit `.claude-plugin/plugin.json` (for Claude Code)

```json
{
  "name": "agent0-for-superpowers-acme",
  "version": "1.0.0",
  "description": "Acme's implementation of Agent0 for Superpowers - specialist agents with company standards",
  "author": "Acme Corp",
  "license": "MIT",
  "homepage": "https://github.com/acme/agent0-for-superpowers-acme",
  "repository": {
    "type": "git",
    "url": "https://github.com/acme/agent0-for-superpowers-acme.git"
  },
  "keywords": [
    "superpowers",
    "acme",
    "security",
    "compliance"
  ],
  "claude": {
    "minVersion": "1.0.0"
  }
}
```

**Key fields to update:**
- `name`: `agent0-for-superpowers-YOUR-COMPANY`
- `description`: Your company name and tools
- `author`: Your company name
- `homepage`: Your fork's GitHub URL
- `repository.url`: Your fork's git URL
- `keywords`: Your company name

### Edit `.cursor-plugin/plugin.json` (for Cursor)

```json
{
  "name": "agent0-for-superpowers-acme",
  "version": "1.0.0",
  "description": "Acme specialist agents for Superpowers",
  "author": {
    "name": "Acme Corp"
  },
  "license": "MIT",
  "homepage": "https://github.com/acme/agent0-for-superpowers-acme",
  "repository": {
    "type": "git",
    "url": "https://github.com/acme/agent0-for-superpowers-acme.git"
  },
  "keywords": [
    "superpowers",
    "acme",
    "security",
    "compliance"
  ]
}
```

**Key fields to update:**
- Same as Claude Code version (name, description, URLs, keywords)

### Edit `.claude-plugin/marketplace.json`

```json
{
  "displayName": "Agent0 for Superpowers - Acme",
  "tagline": "Acme specialist knowledge on-demand: [Your tools], [Your standards]",
  "description": "Provides Acme-specific specialist agents...",
  "category": "productivity",
  "icon": "shield-check",
  "tags": [
    "acme",
    "security",
    "compliance",
    "ux",
    "testing"
  ],
  "screenshots": [],
  "documentation": "https://github.com/acme/agent0-for-superpowers-acme#readme",
  "support": "https://github.com/acme/agent0-for-superpowers-acme/issues"
}
```

**Key fields to update:**
- `displayName`: Your company name
- `tagline`: Your tools/standards
- `description`: Your company's value proposition
- `tags`: Your company name
- `documentation`: Your fork's README URL
- `support`: Your fork's issues URL

### Update `AGENT-INDEX.md`

Change the spawn syntax:

```markdown
# Acme Agent Index

Spawn via `Agent(subagent_type="agent0-for-superpowers-acme:<agent-name>")`.
```

Replace `acme` with your actual plugin name from `plugin.json`.

## Step 4: Commit Your Customizations

```bash
git add -A
git commit -m "feat: customize for Acme Corp"
git push
```

## Step 5: Install Your Plugin

### Option A: Install from GitHub (Recommended)

**For Claude Code:**
```bash
claude
/plugin install git@github.com:acme/agent0-for-superpowers-acme.git
```

**Advantages:**
- ✅ Private repo (GitHub controls access)
- ✅ Works for both Claude Code and Cursor users
- ✅ Easy updates: `/plugin update` (Claude Code) or git pull (Cursor)
- ✅ Version control via git
- ✅ Team collaboration

**Cursor users install the same repo:**
```bash
# Clone once, works for both environments
git clone git@github.com:acme/agent0-for-superpowers-acme.git

# Cursor users symlink to local plugins
mkdir -p ~/.cursor/plugins/local
ln -s /path/to/agent0-for-superpowers-acme ~/.cursor/plugins/local/agent0-for-superpowers-acme
```

### Option B: Publish to Marketplaces (Public)

**Only if you want public distribution:**

**For Claude Code:** Review `.claude-plugin/marketplace.json` and follow Claude Code publishing process

**For Cursor:** Follow https://cursor.com/blog/marketplace publishing guide

**Note:** Publishing makes your company policies/tools public. Usually better to keep private on GitHub.

## Step 6: Test Your Plugin

```bash
# In Claude Code
claude
/plugin list
# Should show: agent0-for-superpowers-acme

# Test discovery
"What company specialists are available?"
# Should list YOUR company's agents

# Test brainstorming
/brainstorm
"I need to add user authentication"
# Should spawn YOUR Security-Engineer with YOUR tools/SLAs
```

## Maintaining Your Plugin

### Version Management

Update version in `plugin.json` when making changes:

- **1.0.0 → 1.0.1**: Bug fixes, typos
- **1.0.0 → 1.1.0**: New agent, policy update
- **1.0.0 → 2.0.0**: Breaking changes

```bash
# 1. Make changes
vim agents/security/Security-Engineer.md

# 2. Bump version
vim .claude-plugin/plugin.json
# Change "version": "1.0.0" to "1.1.0"

# 3. Commit and push
git add -A
git commit -m "security: update SAST requirements"
git push

# 4. Engineers update
/plugin update agent0-for-superpowers-acme
```

### Specialist Team Ownership

**Who maintains what:**
- Security team → `agents/security/`, `policies/SECURITY-POLICY.md`
- UX team → `agents/ux/`, `policies/UX-STANDARDS.md`
- SET team → `agents/engineering/Software-Engineer-In-Test.md`, `policies/TESTING-POLICY.md`
- Product team → `agents/product/`, `policies/HANDOFF-POLICY.md`

**GitHub permissions:**
- **Write**: Specialist teams (can update their domains)
- **Read**: All engineers (can install plugin)

### Testing Changes Locally

```bash
# Test before pushing
/plugin uninstall agent0-for-superpowers-acme
/plugin install /local/path/to/agent0-for-superpowers-acme

# Test the changes
/brainstorm "Test feature"
# Verify agent has updated content

# If good, push
git push
```

## Distribution to Your Team

### Internal Distribution (Private Repo)

**Share installation instructions with your team:**

```markdown
# Installing Acme Agent0 Plugin

## Claude Code
\```bash
claude
/plugin install git@github.com:acme/agent0-for-superpowers-acme.git
\```

## Cursor
1. Go to Extensions in Cursor
2. Search "agent0-for-superpowers-acme" (if published internally)
3. Or install from local clone

Verify by typing: "What company specialists are available?"
You should see Acme's Security-Engineer, UX-Engineer, SET, etc.
```

### Updating Engineers

When you push updates:

1. **Announce in team chat:**
   ```
   📢 Agent0 plugin updated to v1.1.0
   - Security-Engineer: Updated SAST requirements
   - All engineers: Run /plugin update agent0-for-superpowers-acme
   ```

2. **Engineers update:**
   ```bash
   /plugin update agent0-for-superpowers-acme
   ```

## Customization Checklist

Before rolling out to your team:

- [ ] All `{{PLACEHOLDERS}}` replaced
- [ ] `.template.md` files renamed and customized
- [ ] `plugin.json` updated (name, description, URLs)
- [ ] `marketplace.json` updated (display name, tagline)
- [ ] `AGENT-INDEX.md` spawn syntax updated
- [ ] Tested locally (agents spawn, provide company-specific guidance)
- [ ] Committed and pushed to your fork
- [ ] Team installation instructions prepared
- [ ] Specialist teams know how to maintain their domains

## Common Issues

**Issue:** Agents still say "{{COMPANY_NAME}}"

**Fix:** Placeholders not replaced. Run find/replace again:
```bash
grep -r "{{" . --include="*.md" | grep -v ".git"
```

**Issue:** Wrong spawn syntax

**Fix:** Update `AGENT-INDEX.md` to match `plugin.json` name:
```markdown
Agent(subagent_type="YOUR-PLUGIN-NAME:Security-Engineer")
```

**Issue:** Plugin not found

**Fix:** Check GitHub URL in install command matches your fork:
```bash
/plugin install git@github.com:YOUR-ORG/YOUR-REPO.git
```

## FAQ

**Q: Can we mix generic and company-specific agents?**
A: Yes! Keep generic agents as-is, add company-specific ones to `agents/`.

**Q: Should we publish to public marketplace?**
A: Usually no - keep private on GitHub. Only publish if you want to share with the world.

**Q: How do we handle multiple products/divisions?**
A: Option 1: One plugin with all divisions. Option 2: Fork per division.

**Q: Can engineers customize their local version?**
A: Yes, but changes won't sync to team. Better to submit PR to specialist team.

**Q: How often should we update?**
A: When policies change, tools change, or feedback indicates agent guidance is wrong.

## Next Steps

1. **Pilot with 2-3 engineers** - test on real work
2. **Gather feedback** - what's accurate? What's missing?
3. **Iterate** - specialist teams update based on feedback
4. **Roll out** - share with entire engineering team
5. **Maintain** - keep updated as company evolves

## Support

- Create issues in your fork for questions/bugs
- Specialist teams monitor and respond
- Reference this guide when onboarding new engineers

## Related Documentation

- **INSTALLATION.md**: How engineers install the plugin
- **SUPERPOWERS-INTEGRATION.md**: How Superpowers spawns specialists
- **agents/README.md**: How to add new agents
- **policies/README.md**: List of all placeholders
