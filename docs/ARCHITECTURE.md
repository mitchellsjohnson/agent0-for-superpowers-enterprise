# Architecture: Agent0 for Superpowers

## Integration Pattern

```
┌─────────────────────────────────────────────┐
│ Superpowers Plugin                          │
│ • Domain-agnostic workflows                 │
│ • Brainstorming, TDD, Planning, Debugging   │
└──────────────────┬──────────────────────────┘
                   │ Needs domain expertise
                   ↓
┌─────────────────────────────────────────────┐
│ Agent0-YOUR-COMPANY Plugin                  │
│ • Reads AGENT-INDEX.md (~500 tokens)        │
│ • Spawns specialist agent when needed       │
└──────────────────┬──────────────────────────┘
                   │ Agent loads context
                   ↓
┌─────────────────────────────────────────────┐
│ Specialist Agent (e.g., Security-Engineer)  │
│ • Loads policies, skills, standards         │
│ • Provides expert guidance                  │
│ • Exits (context freed)                     │
└─────────────────────────────────────────────┘
```

## Discovery Mechanism

**AGENT-INDEX.md** is the lightweight discovery file (~500 tokens):
- Cached by Claude Code
- Lists available specialists and when to consult them
- Superpowers reads this to decide when to spawn agents

Example:
```markdown
# YOUR-COMPANY Agent Index

**Security-Engineer**: Post-implementation security reviews, vulnerability remediation
**UX-Specialist**: Component design, accessibility reviews, design system
```

## Agent Spawning

When Superpowers needs expertise:

```python
# Superpowers recognizes security context
Agent(
  subagent_type="agent0-for-superpowers-YOUR-COMPANY:Security-Engineer",
  description="Review for security compliance",
  prompt="Review this authentication code against YOUR-COMPANY security policies..."
)
```

Agent loads:
- `policies/SECURITY-POLICY.md`
- `skills/security/*`
- Agent definition with tools/processes

Agent provides guidance, then exits (context freed).

## Skill Invocation

Superpowers can also invoke domain-specific skills directly:

```python
Skill("agent0-for-superpowers-YOUR-COMPANY:vulnerability-scan")
```

This runs your company's vulnerability scanning workflow.

## Cost Model

**Lightweight discovery, heavy execution**:
- AGENT-INDEX.md: 500 tokens (cached, one-time per session)
- Library of 50 agents/skills: 0 tokens (not loaded until needed)
- Spawn Security-Engineer: 4K tokens (loaded on-demand)
- Agent exits: 0 tokens (freed)

**Scales with usage, not library size**: A 100-agent library costs the same as a 10-agent library until you spawn an agent.

## Plugin System

Claude Code's plugin system allows multiple plugins to coexist:
- Superpowers provides workflows
- Agent0-YOUR-COMPANY provides domain expertise
- Both register agents and skills
- Superpowers can spawn agents from any installed plugin

## File Organization

```
agent0-for-superpowers-YOUR-COMPANY/
├── AGENT-INDEX.md          ← Discovery file (Superpowers reads this)
├── agents/                 ← Specialist definitions (spawned on-demand)
├── skills/                 ← Domain workflows (invoked on-demand)
├── policies/               ← Standards (agents read these)
└── integrations/           ← Tool guides (agents reference these)
```

## Workflow Integration

### During Brainstorming

Superpowers is brainstorming a new feature:
1. Recognizes security implications
2. Checks AGENT-INDEX.md: "Security-Architect for pre-implementation design"
3. Spawns Security-Architect agent
4. Security-Architect loads threat modeling skill and security policies
5. Reviews design, provides threat analysis
6. Exits (context freed)
7. Superpowers incorporates security feedback into design

### During Implementation

Developer is implementing authentication:
1. Superpowers recognizes need for security review
2. Spawns Security-Engineer agent
3. Security-Engineer loads security policies and secure-coding skills
4. Reviews implementation against policies
5. Flags violations (e.g., "Session tokens must use approved storage method")
6. Exits (context freed)
7. Developer fixes issues before merge

### Before Merge

Superpowers finishing feature:
1. Recognizes merge requires scans
2. Invokes `vulnerability-scan` skill
3. Skill runs company's scanning tools
4. Returns results
5. Blocks merge if Critical/High vulnerabilities found

## Agent Context

Each agent definition includes:
- Role and responsibilities
- Tools and processes they know
- Policies they enforce
- Skills they can invoke
- When to consult them

Example Security-Engineer agent structure:
```markdown
# Security-Engineer

You are a Security Engineer for {{COMPANY_NAME}}.

## Your Responsibilities
- Post-implementation security reviews
- Vulnerability remediation guidance
- SAST/dependency scan interpretation

## Your Tools
- {{COMPANY_SAST_TOOL}} for static analysis
- {{COMPANY_DEPENDENCY_SCANNER}} for dependencies

## Policies You Enforce
- SECURITY-POLICY.md (Critical: {{CRITICAL_SLA_DAYS}} days)
- Compliance requirements

## Skills You Use
- skills/security/threat-modeling/
- skills/security/secure-coding/

## When Superpowers Consults You
- Before merge: security policy compliance
- Code review: secure coding patterns
- Vulnerability triage: severity assessment
```

## Separation of Concerns

**Superpowers (Workflows)**:
- How to work (TDD, brainstorming, planning)
- When to ask for help
- How to coordinate work

**Agent0-YOUR-COMPANY (Domain Knowledge)**:
- What your company requires (policies)
- Who can help (specialists)
- How your tools work (integrations)

**Result**: Superpowers stays domain-agnostic, your company's knowledge is portable and maintainable.
