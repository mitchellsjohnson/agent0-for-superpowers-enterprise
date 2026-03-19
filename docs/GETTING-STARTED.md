# Getting Started with Agent0 for Superpowers

## Prerequisites

- Claude Code CLI installed
- Superpowers plugin installed
- Git and GitHub/GitLab access

## Step 1: Fork This Repository

```bash
# Fork on GitHub, then clone
git clone git@github.com:YOUR-ORG/agent0-for-superpowers-YOUR-COMPANY.git
cd agent0-for-superpowers-YOUR-COMPANY
```

## Step 2: Customize for Your Company

See [CUSTOMIZATION-GUIDE.md](CUSTOMIZATION-GUIDE.md) for detailed instructions.

Quick checklist:
- [ ] Update plugin.json with your company name
- [ ] Fill in policy templates with actual SLAs and requirements
- [ ] Customize agents with your company's tools and processes
- [ ] Update AGENT-INDEX.md with your actual specialists
- [ ] Add skills for your company-specific tools

## Step 3: Install as Plugin

```bash
# From your company repo directory
cd /path/to/agent0-for-superpowers-YOUR-COMPANY

# Install locally for testing
/plugin install .

# Or publish to your company's plugin marketplace
```

## Step 4: Verify Installation

Start Claude Code and check:

```bash
# List installed plugins
/plugin list

# Should show: agent0-for-superpowers-YOUR-COMPANY
```

## Step 5: Test Integration

Create a test project and ask Superpowers to build something:

```
"Let's build an authentication feature"
```

Superpowers should automatically consult your Security-Engineer agent during design.

## Updating

When you update your agent library:

```bash
cd /path/to/agent0-for-superpowers-YOUR-COMPANY
git pull
/plugin update agent0-for-superpowers-YOUR-COMPANY
```

## Next Steps

- Read [CUSTOMIZATION-GUIDE.md](CUSTOMIZATION-GUIDE.md) for detailed customization instructions
- Read [ARCHITECTURE.md](ARCHITECTURE.md) to understand how it works with Superpowers
- See [WHY.md](WHY.md) for the problem statement and value proposition
