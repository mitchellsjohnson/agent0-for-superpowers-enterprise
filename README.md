# Agent0 for Superpowers: Enterprise Context Layer

**Superpowers is amazing** for orchestrating development workflows - brainstorming, planning, TDD, execution. It puts tremendous power in the hands of engineers.

**But garbage in = garbage out.** Without access to your enterprise's specialist knowledge (Security, UX, Product, Testing standards), even the best workflows can't guarantee compliant, beautiful, easy-to-use software.

**Agent0 provides the missing context layer** - a structured knowledge graph of your enterprise specialists, their skills, and your policies. This makes Superpowers truly "Superpowered for the enterprise."

## What This Framework Provides

- **Generic agent templates** for common enterprise roles (Security Engineer, UX Specialist, SET, Product Manager, DevOps)
- **Generic skill patterns** for security scanning, testing, accessibility, design systems
- **Policy templates** with placeholders for your company's actual requirements
- **Integration guides** for connecting your company's tools

## Migrating from agent0-pdlc-sonatype?

See [MIGRATION.md](MIGRATION.md) for detailed comparison and migration paths. For the **org-first directory layout** and build model, see [MIGRATION-GUIDE.md](MIGRATION-GUIDE.md).

## Quick Start

**See [INSTALLATION.md](INSTALLATION.md) for detailed step-by-step instructions with verification and testing.**

### TL;DR Install

```bash
# 1. Fork this repo to your company's GitHub
# https://github.com/mitchellsjohnson/agent0-for-superpowers-enterprise

# 2. Clone and customize
git clone https://github.com/YOUR-ORG/agent0-for-superpowers-YOUR-COMPANY.git
cd agent0-for-superpowers-YOUR-COMPANY

# 3. Configure and build (recommended)
cp config.yaml.example config.yaml
# Edit config.yaml: company, plugin_id, tools, SLAs — must match plugin.json "name"
./build.sh
# Output: plugin/ directory ready to install

# 4. (Alternative) Manual placeholder replacement — see PLUGIN-BUILD.md

# 5. Update plugin metadata if needed
# Edit .claude-plugin/plugin.json and .cursor-plugin/plugin.json (name must match config plugin_id)

# 6. Commit and push
git add -A && git commit -m "feat: customize for Acme" && git push

# 7. Install in Claude Code (from repo root or point at plugin/)
claude
/plugin install superpowers
/plugin install git@github.com:YOUR-ORG/agent0-for-superpowers-YOUR-COMPANY.git

# 8. Test it works
/plugin list  # Should show both plugins
"What company specialists are available?"  # Should list your agents
```

### First Test

```bash
cd ~/test-project
claude
/brainstorm

"I need to add user authentication"
# Should spawn YOUR Security-Engineer + UX-Engineer
# With YOUR company's SLAs, tools, standards
```

## How It Works

```
Developer → Superpowers (workflows) → Agent0-YourCompany (specialists) → Compliant software
```

- Superpowers orchestrates development workflows (TDD, brainstorming, planning)
- When it needs domain expertise, it spawns a specialist from your Agent0 library
- Specialist provides guidance based on your company's actual policies
- Software is built compliant from the start, not fixed after review

## The Real Problem: Specialist Bottleneck

Specialists need to be involved **continuously** through brainstorming, planning, and development - not just at the end for review. But they're scarce and shared:

**The ratios are brutal:**
- 1 Security Engineer : 100 Software Engineers
- 1 UX Engineer : 25 Developers (even in design-forward orgs)
- 1 Product Manager should spend 75%+ time in field, not managing delivery

**GenAI makes this worse:**
- More engineering capacity
- Same specialist capacity
- Bigger bottleneck

**Traditional approach fails:**
- Specialists define requirements upfront (doesn't work - real world is messy)
- Engineers implement without specialist involvement
- Late-stage review catches problems
- Expensive rework, long wait times
- Specialists burn out from constant context-switching

**What's actually needed:**
- Specialists involved during brainstorming ("What's the right UX pattern?")
- Specialists involved during planning ("What security risks exist?")
- Specialists involved during development ("Does this meet standards?")
- Specialists involved during handoff ("Here's proof this is complete")
- But human specialists can't scale to that level of involvement

**The handoff problem:**
Developers are great at implementing features and writing tests. But the handoff to Product/stakeholders is critical:
- "Here's my BDD (requirements as implemented)"
- "Here's my UX spec (what was actually built)"
- "Here's my completed acceptance criteria"
- "Here's my Definition of Done checklist"

Superpowers and the engineer can automate creating great handoffs. **But they need guidance from enterprise specialists:**
- What does Product need to see?
- What does UX need documented?
- What does Security need certified?
- What format? What level of detail?

Without this guidance, handoffs are inconsistent and incomplete.

## The Solution: Agent0 + Superpowers

**Superpowers gives you the orchestration:** brainstorming, planning, TDD, execution, handoff automation.

**Agent0 gives you the enterprise context:** security requirements, UX patterns, testing standards, product strategy, **and handoff templates**.

**Together, they enable continuous specialist involvement at scale - from design through delivery:**

**Without Agent0:**
```
Superpowers: "Let's build login"
Engineer: "I'll use basic form, password in localStorage..." (no context)
→ Build → Wait 3 days for Security → "No! Use OAuth, encrypt secrets..." → Rework 3 days
→ Wait 2 days for UX → "No! Use design system, add accessibility..." → Rework 2 days
Total: 10+ days (5 days rework, 5 days waiting)
```

**With Agent0:**
```
Superpowers: "Let's build login" → spawns Security-Engineer + UX-Engineer + Product-Manager
Security-Engineer: "Use OAuth, here's the approved library, encrypt at rest"
UX-Engineer: "Use LoginForm component, here's accessibility checklist"
Product-Manager: "Here's the acceptance criteria template to complete"
Engineer: Builds it right the first time

Superpowers: "Ready to hand off" → spawns SET + Security-Engineer + Product-Manager
SET: "Here's DoD checklist: ✅ 80% coverage, ✅ all tests passing"
Security-Engineer: "Here's security certification: ✅ Lifecycle scan clean, ✅ OAuth implemented"
Product-Manager: "Here's handoff template: fill acceptance criteria, attach UX screenshots"
Engineer: Creates complete handoff document with all required sections
Total: 2 days (zero rework, zero wait time, professional handoff)
```

**Specialists manage their agents/skills/policies** - Security team maintains Security-Engineer with handoff requirements, UX team maintains UX-Engineer with what they need documented, Product team maintains acceptance criteria templates. They encode their knowledge once, benefit everywhere.

## ROI: $56K-104K Saved Per 10 Projects

- Eliminate rework cycles: $4,800-8,000 saved per project
- Eliminate wait time: $2,400-4,000 saved per project
- Preserve specialist capacity for novel problems
- Scale teams without proportionally scaling specialists

## Documentation

- **Org-first layout**: `security/`, `data/`, `engineering/`, `product/`, `ux/` — each has `agents/`, `skills/`, `policies/`, `tools/`
- **Policies**: e.g. `security/policies/`, `engineering/policies/`, `ux/policies/`, `product/policies/` (templates use `.template.md` until finalized)
- **Build**: `config.yaml.example`, `build.sh`, and [PLUGIN-BUILD.md](PLUGIN-BUILD.md)
- **Integration**: See `integrations/` for MCP server setup and CI/CD patterns
- **Agent index**: `AGENT-INDEX.md` — how Superpowers discovers specialists (paths listed there)

## License

MIT License - see LICENSE file for details

## Contributing

This is the generic framework. For company-specific implementations, fork and customize.
For framework improvements, submit PRs to this repository.
