# Installation Guide - Agent0 for Superpowers (Enterprise Framework)

**For companies creating their own Agent0 implementation**

## Two Guides

This installation guide has two parts:

1. **[PLUGIN-BUILD.md](PLUGIN-BUILD.md)** - How to fork this repo, customize it for your company, and build it into a plugin ⭐ **Start here**
2. **This file** - How engineers install your customized plugin once it's built

## Quick Navigation

- **Building your plugin?** → See [PLUGIN-BUILD.md](PLUGIN-BUILD.md) for complete fork/customize/build instructions
- **Installing an existing plugin?** → Continue reading below

---

## Overview

This is a **generic framework**. Your company will:
1. Fork this repo (see [PLUGIN-BUILD.md](PLUGIN-BUILD.md))
2. Customize with your company's values
3. Build as a plugin
4. Your engineers install it (instructions below)

## Step-by-Step

### 1. Fork and Customize

```bash
# Fork this repo on GitHub to your organization
# Then clone your fork:
git clone https://github.com/YOUR-ORG/agent0-for-superpowers-YOUR-COMPANY.git
cd agent0-for-superpowers-YOUR-COMPANY
```

### 2. Replace Placeholders

**Find all placeholders:**
```bash
grep -r "{{" . --include="*.md" | grep -v ".git"
```

**Common replacements:**
```bash
# Replace company name
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i 's/{{COMPANY_NAME}}/Acme/g' {} +

# Replace security values
find . -type f -name "*.md" -not -path "./.git/*" -exec sed -i '' \
  -e 's/{{CRITICAL_SLA_DAYS}}/7/g' \
  -e 's/{{HIGH_SLA_DAYS}}/30/g' \
  -e 's/{{MEDIUM_SLA_DAYS}}/90/g' \
  -e 's/{{COVERAGE_THRESHOLD}}/80/g' \
  -e 's/{{COMPANY_SAST_TOOL}}/SonarQube/g' \
  -e 's/{{COMPANY_DEPENDENCY_SCANNER}}/Snyk/g' \
  {} +
```

**See `policies/README.md` for full list of placeholders.**

### 3. Remove .template Suffix

```bash
cd policies/
for f in *.template.md; do
  mv "$f" "${f%.template.md}.md"
done
```

### 4. Update Plugin Metadata

**Edit `.claude-plugin/plugin.json`:**
```json
{
  "name": "agent0-for-superpowers-acme",
  "description": "Acme's implementation of Agent0 for Superpowers",
  "author": "Acme Corp",
  "homepage": "https://github.com/acme/agent0-for-superpowers-acme",
  ...
}
```

**Edit `AGENT-INDEX.md`:**
```markdown
# Acme Agent Index

Spawn via `Agent(subagent_type="agent0-for-superpowers-acme:<agent-name>")`.
```

### 5. Commit Your Customizations

```bash
git add -A
git commit -m "feat: customize for Acme Corp"
git push
```

### 6. Install in Claude Code

**Important:** This builds a **Claude Code plugin**. For Cursor, you would need to create a separate Cursor-specific plugin following Cursor's plugin structure.

```bash
claude

# Inside Claude Code:
/plugin install superpowers
/plugin install git@github.com:acme/agent0-for-superpowers-acme.git

# Verify:
/plugin list
# Should show:
#   - superpowers
#   - agent0-for-superpowers-acme
```

**Or from local directory (for testing):**
```bash
/plugin install /path/to/agent0-for-superpowers-acme
```

### 7. Using in Cursor

**Note:** This framework builds **Claude Code plugins**. To use in Cursor, you would need to:

1. Install **Superpowers** from Cursor Marketplace (available at https://cursor.com/marketplace)
2. Build a **Cursor-specific version** of your agent plugin following Cursor's plugin structure: https://cursor.com/blog/marketplace

Cursor and Claude Code use different plugin systems:
- **Claude Code**: Uses `.claude-plugin/` directory structure
- **Cursor**: Uses different plugin structure (see Cursor documentation)

This repo is structured for Claude Code. A Cursor version would need to be built separately with Cursor's requirements.

### 8. How It Works
1. **Superpowers orchestrates** development workflows (brainstorming, planning, TDD, verification)
2. **At session start**, Superpowers reads your `AGENT-INDEX.md` (~500 tokens, cached)
3. **When specialist needed**, Superpowers spawns via `Agent(subagent_type="agent0-for-superpowers-acme:Security-Engineer")`
4. **Agent provides context** from your company's policies, tools, standards
5. **On-demand loading**: Only load full agent definitions when actually spawned

**Example flow:**
```
You: "/brainstorm - Add payment processing"
Superpowers: [Reads AGENT-INDEX.md from agent0-for-superpowers-acme]
             [Spawns Security-Engineer + UX-Engineer based on index]
Security-Engineer: "For PCI compliance, use approved payment gateway.
                    Critical vulns: 7-day SLA per your SECURITY-POLICY.md"
UX-Engineer: "Use PaymentForm component from your design system."
Superpowers: [Continues brainstorming with your company context]
```

## Testing Your Installation

### Test 1: Agent Discovery

```bash
claude
# Ask: "What company specialists are available?"
```

**Expected:** Lists your customized agents (Security-Engineer, UX-Engineer, etc.) with your company name.

### Test 2: Brainstorm with Specialists

```bash
cd ~/test-project
claude
/brainstorm

"I need to add user login"
```

**What should happen:**
1. Superpowers starts brainstorming
2. Spawns your Security-Engineer (with your SLAs, tools)
3. Spawns your UX-Engineer (with your design system)
4. They provide YOUR company-specific guidance

**Verify they mention:**
- Your SAST tool (e.g., "SonarQube scan")
- Your dependency scanner (e.g., "Snyk scan")
- Your SLAs (e.g., "7-day fix for Critical")
- Your coverage threshold (e.g., "80% coverage")

### Test 3: Implementation Guidance

```bash
claude
"Let's implement the authentication"
```

**Verify specialists provide:**
- Your approved technologies (from TECH-STACK.md)
- Your security patterns (from SECURITY-POLICY.md)
- Your testing standards (from TESTING-POLICY.md)

## Maintaining Your Plugin

### Specialist Teams Own Their Agents

**Security team maintains:**
- `agents/security/Security-Engineer.md`
- `agents/security/Security-Architect.md`
- `skills/security/` (if you add security skills)
- `policies/SECURITY-POLICY.md`

**UX team maintains:**
- `agents/ux/UX-Engineer.md`
- `agents/ux/Technical-Writer.md`
- `skills/ux/` (if you add UX skills)
- `policies/UX-STANDARDS.md`

**SET team maintains:**
- `agents/engineering/Software-Engineer-In-Test.md`
- `skills/testing/` (if you add testing skills)
- `policies/TESTING-POLICY.md`

### Updating Content

```bash
# 1. Specialist edits their agent/policy
cd agent0-for-superpowers-acme
vim agents/security/Security-Engineer.md

# 2. Commit and push
git add agents/security/Security-Engineer.md
git commit -m "security: update approved auth libraries"
git push

# 3. Engineers update their plugin
claude
/plugin update agent0-for-superpowers-acme
```

## Troubleshooting

### Placeholder Still Showing

**Issue:** Seeing `{{COMPANY_NAME}}` in agent responses

**Fix:** Placeholder not replaced. Run:
```bash
cd agent0-for-superpowers-acme
grep -r "{{COMPANY_NAME}}" . --include="*.md" | grep -v ".git"
# Shows files still with placeholders
# Replace them and reinstall plugin
```

### Generic Guidance Instead of Company-Specific

**Issue:** Security-Engineer says generic "run SAST" instead of "run SonarQube"

**Fix:** Your customizations didn't get installed. Verify:
```bash
/plugin show agent0-for-superpowers-acme
# Should show your company name, not {{COMPANY_NAME}}
```

### Specialists Not Spawning

**Issue:** Superpowers doesn't spawn your specialists

**Debug:**
```bash
# Check plugin installed
/plugin list

# Check AGENT-INDEX.md syntax
# Should say: Agent(subagent_type="agent0-for-superpowers-acme:Security-Engineer")
```

## Real World Usage

Once verified working:

```bash
# On every project
cd ~/acme/my-project
claude

# Start working, specialists available on-demand
/brainstorm "Build payment processing"
# Or just: "Let's implement payment form"
```

**Benefits you should see:**
- Consistent guidance across all engineers
- Company standards enforced automatically
- No waiting for human specialists to be available
- Human specialists freed for novel problems

## Support

Create issues in your fork's GitHub repo for:
- Questions about customization
- Bugs in agent definitions
- Requests for new agents/skills

## Next Steps

1. **Roll out to pilot team** - 2-3 engineers test first
2. **Gather feedback** - What's accurate? What's missing?
3. **Iterate** - Specialists update their agents based on feedback
4. **Scale** - Roll out to entire engineering org
5. **Maintain** - Specialists keep agents updated as policies evolve

## Example: Acme Corp

Here's what Acme Corp's customization looked like:

**Before (generic):**
```markdown
**Role**: Security Engineer for {{COMPANY_NAME}}

Run {{COMPANY_DEPENDENCY_SCANNER}} scan before merge.
Critical vulnerabilities must be fixed within {{CRITICAL_SLA_DAYS}} days.
```

**After (Acme-specific):**
```markdown
**Role**: Security Engineer for Acme Corp

Run Snyk scan before merge.
Critical vulnerabilities must be fixed within 7 days.
```

**Result:** Every Acme engineer gets consistent, Acme-specific security guidance automatically.
