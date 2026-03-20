# Migration from agent0-pdlc-sonatype

## What Changed?

This framework is a **focused subset** of `agent0-pdlc-sonatype`, designed to work **with Superpowers** rather than replace it.

### Before: agent0-pdlc-sonatype (Monolithic)
- ✅ Agent0 orchestration (team management, CRIT framework, sprint planning)
- ✅ Agent definitions (Security, UX, SET, Engineering, Product)
- ✅ Skills (workflows, security, testing, UX)
- ✅ Policies (security SLAs, testing standards)
- ✅ Hooks (SessionStart, TaskCompleted, etc.)
- ✅ MCP integrations

### After: agent0-for-superpowers-* (Focused)
- ❌ **No Agent0 orchestration** (Superpowers handles workflows)
- ✅ Agent definitions (specialists only)
- ✅ Skills (domain-specific only)
- ✅ Policies
- ❌ **No hooks** (not needed with Superpowers)
- ✅ MCP integrations

## Why the Split?

**Problem**: `agent0-pdlc-sonatype` duplicates workflow orchestration that Superpowers already provides (brainstorming, TDD, planning, debugging).

**Solution**: Two focused plugins working together:
- **Superpowers**: Workflow orchestration (brainstorming, TDD, planning, executing plans)
- **Agent0 for Superpowers**: Domain expertise (Security, UX, Testing, Product specialists)

## Architecture

```
┌─────────────────┐
│   Superpowers   │  Workflows: brainstorming, TDD, planning, debugging
└────────┬────────┘
         │ Spawns specialists when needed
         ▼
┌─────────────────┐
│ Agent0-Company  │  Domain expertise: Security-Engineer, UX-Specialist, SET
└────────┬────────┘
         │ Enforces company policies
         ▼
┌─────────────────┐
│ Compliant Code  │  Built right from the start
└─────────────────┘
```

## Migration Paths

### Path 1: Keep Using agent0-pdlc-sonatype (No Change)
If you're happy with the current setup, **no action needed**. `agent0-pdlc-sonatype` continues to work as-is.

### Path 2: Migrate to Superpowers + Agent0 (Recommended)
1. Install Superpowers plugin
2. Install `agent0-for-superpowers-sonatype` (or your company's fork)
3. Use Superpowers workflows (`/brainstorm`, `/tdd`, `/plan`)
4. Superpowers spawns your company's specialists automatically

### Path 3: Fork for Your Company (Enterprise)
1. Fork this repo (`agent0-for-superpowers-enterprise`)
2. Replace `{{COMPANY_NAME}}` placeholders with your values
3. Customize agents with your tools (SAST, dependency scanner, etc.)
4. Install as a Claude Code plugin
5. Use with Superpowers

## What You Get with Superpowers + Agent0

**From Superpowers**:
- Systematic brainstorming with design approval gates
- Test-driven development workflow
- Implementation planning with task breakdown
- Systematic debugging
- Code review requests
- Git worktree management

**From Agent0 (your company's fork)**:
- Security-Engineer with your SLAs and tools
- UX-Specialist with your design system
- Software-Engineer-In-Test with your coverage requirements
- Product-Manager with your roadmap
- On-demand specialist knowledge (no wait time)

## Installation

### Prerequisites
- Claude Code installed
- Superpowers plugin installed

### Install This Framework
```bash
# If using the public enterprise framework (customize first)
git clone https://github.com/sonatype/agent0-for-superpowers-enterprise.git
cd agent0-for-superpowers-enterprise
# Replace {{PLACEHOLDERS}} with your values
claude plugin install .

# If using Sonatype's instance (Sonatype employees only)
claude plugin install git@github.com:sonatype/agent0-for-superpowers-sonatype.git
```

### Use It
Superpowers automatically discovers and spawns specialists via `AGENT-INDEX.md`:

```
User: "Let's build a login feature"
Superpowers: Uses brainstorming skill, spawns Security-Engineer for threat modeling
Security-Engineer: "Here's what to watch for: session management, CSRF..."
```

## Key Differences from agent0-pdlc-sonatype

| Feature | agent0-pdlc-sonatype | agent0-for-superpowers-* |
|---------|---------------------|--------------------------|
| Orchestration | Agent0 (`/agent0`) | Superpowers |
| Team Management | Agent0 (CRIT framework) | Superpowers |
| Workflows | Agent0 skills | Superpowers skills |
| Specialists | ✅ Included | ✅ Included |
| Hooks | ✅ SessionStart, TaskCompleted | ❌ Not needed |
| Use Case | Standalone orchestrator | Works with Superpowers |

## Benefits of Migration

**Before** (agent0-pdlc-sonatype alone):
- One plugin does everything
- Some workflow duplication with Superpowers
- Harder to share generic patterns

**After** (Superpowers + Agent0):
- Best-in-class workflows from Superpowers
- Company-specific expertise from Agent0
- Generic framework any company can fork
- Specialists available on-demand (eliminates bottleneck)

## Compatibility

**Can I use both?**
- ✅ `agent0-pdlc-sonatype` continues to work standalone
- ✅ `agent0-for-superpowers-*` works with Superpowers
- ❌ Don't install both at once (namespace conflicts)

## Support

- **Enterprise framework**: https://github.com/sonatype/agent0-for-superpowers-enterprise/issues
- **Sonatype instance**: Contact #agent0 Slack channel
- **agent0-pdlc-sonatype**: https://github.com/sonatype/agent0-pdlc-sonatype/issues

## Timeline

- **Now**: Both systems coexist
- **Future**: Superpowers + Agent0 becomes recommended path
- **agent0-pdlc-sonatype**: No deprecation timeline yet - it stays available
