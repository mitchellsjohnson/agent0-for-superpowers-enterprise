# Superpowers Integration Guide

This document explains how {{COMPANY_NAME}}'s Agent0 specialists integrate with Superpowers workflow skills.

## Overview

**Superpowers orchestrates workflows** (brainstorming, planning, TDD, execution, verification, handoff).

**Agent0 provides specialist context** when Superpowers needs domain expertise.

**Integration is automatic** - Superpowers reads `AGENT-INDEX.md` and spawns specialists when needed.

## Workflow Integration Points

### 1. Brainstorming (`/brainstorm` or superpowers:brainstorming)

**When:** Start of feature work, exploring designs, refining requirements

**Superpowers automatically spawns:**
- **Security-Architect** - When security concerns identified
- **UX-Engineer** - When UI/UX patterns needed
- **Product-Manager** - When acceptance criteria needed
- **Software-Engineer-In-Test** - When testing strategy required

**What specialists provide:**
- Security: Threat model, secure patterns, compliance requirements
- UX: Design system components, accessibility requirements, interaction patterns
- SET: Testing strategy, coverage requirements, Definition of Done criteria
- Product: Acceptance criteria, user stories, success metrics

**Example:**
```
User: "/brainstorm - I need to add user authentication"

Superpowers spawns:
- Security-Architect (threat modeling, OAuth vs session-based, secure storage)
- UX-Engineer (login form component, error states, accessibility)
- Product-Manager (acceptance criteria template)

Result: Feature designed with security, UX, and product input from the start
```

### 2. Planning (superpowers:writing-plans)

**When:** Creating detailed implementation plans

**Superpowers automatically spawns:**
- **Security-Architect** - For security-sensitive features
- **Software-Architect** - For technical architecture decisions
- **Software-Engineer-In-Test** - For test plan structure

**What specialists provide:**
- Security-Architect: Architecture security review, integration patterns
- Software-Architect: Technical patterns, technology choices, performance considerations
- SET: Test plan structure, coverage approach, testing strategy

**Example:**
```
Superpowers: "Creating implementation plan for authentication"

Spawns:
- Security-Architect (OAuth flow, token storage, session management)
- Software-Architect (where to put middleware, state management pattern)
- SET (test structure: unit tests for each middleware, integration tests for flow)

Result: Plan includes security requirements, architectural patterns, and testing approach
```

### 3. Implementation (superpowers:test-driven-development)

**When:** Writing code (TDD cycle: test → implement → verify)

**Superpowers automatically spawns:**
- **Security-Engineer** - For security-sensitive code
- **UX-Engineer** - For UI components
- **Software-Engineer-In-Test** - For complex testing scenarios

**What specialists provide:**
- Security-Engineer: Secure coding patterns, input validation, vulnerability checks
- UX-Engineer: Component usage examples, accessibility implementation
- SET: Test design, edge cases, coverage guidance

**Example:**
```
Superpowers: "Implementing password reset flow"

Spawns:
- Security-Engineer (token generation, expiry, rate limiting patterns)
- UX-Engineer (form validation patterns, error message UX)
- SET (test cases: expired token, invalid token, replay attacks)

Result: Implementation follows security/UX/testing best practices
```

### 4. Verification (superpowers:verification-before-completion)

**When:** Before committing, before creating PR, before merging

**Superpowers automatically spawns:**
- **Security-Engineer** - Run scans, verify compliance
- **Software-Engineer-In-Test** - Verify coverage, certify DoD
- **UX-Engineer** - Accessibility audit (if UI changes)

**What specialists provide:**
- Security-Engineer: Lifecycle/SAST scan results, policy compliance check
- SET: Coverage report, DoD certification checklist
- UX-Engineer: Accessibility audit results, design system compliance

**Example:**
```
Superpowers: "Ready to commit authentication feature"

Spawns:
- Security-Engineer (runs dependency scanner, verifies no Critical/High vulns)
- SET (confirms 80% coverage, all tests passing, DoD checklist complete)
- UX-Engineer (runs accessibility audit, confirms WCAG AA compliance)

Result: Feature verified before merge, not after
```

### 5. Code Review (superpowers:requesting-code-review)

**When:** Preparing PR for review

**Superpowers automatically spawns:**
- **Security-Engineer** - Security review checklist
- **Software-Engineer-In-Test** - Testing verification checklist
- **UX-Engineer** - UX review checklist (if UI changes)

**What specialists provide:**
- Security-Engineer: Security review checklist (input validation? secrets? encryption?)
- SET: Testing checklist (coverage? edge cases? integration tests?)
- UX-Engineer: UX checklist (accessibility? design system? responsive?)

**Example:**
```
Superpowers: "Creating PR for authentication feature"

Spawns specialists to generate PR description sections:
- Security-Engineer: "Security Checklist: ✅ OAuth implemented, ✅ tokens encrypted, ✅ Lifecycle scan clean"
- SET: "Testing: ✅ 85% coverage, ✅ 47 tests passing, ✅ DoD complete"
- UX-Engineer: "UX: ✅ LoginForm component used, ✅ ARIA labels added, ✅ keyboard navigation"

Result: PR has complete context for reviewers
```

### 6. Handoff (superpowers:finishing-a-development-branch)

**When:** Feature complete, ready to hand off to Product/stakeholders

**Superpowers automatically spawns:**
- **Product-Manager** - Acceptance criteria verification, handoff template
- **Security-Engineer** - Security certification
- **Software-Engineer-In-Test** - DoD certification
- **UX-Engineer** - UX verification documentation (if UI changes)

**What specialists provide:**
- Product-Manager: Handoff template (BDD format, acceptance criteria checklist)
- Security-Engineer: Security certification (scan results, compliance verification)
- SET: DoD certification (coverage report, test summary)
- UX-Engineer: UX verification (accessibility audit, screenshots, component list)

**Example:**
```
Superpowers: "Authentication feature complete, ready to hand off"

Spawns:
- Product-Manager (generates handoff doc: "What Was Built", acceptance criteria)
- Security-Engineer (attaches: Lifecycle scan PDF, Fortify report)
- SET (attaches: coverage report, test summary)
- UX-Engineer (attaches: accessibility audit, component screenshots)

Result: Complete handoff package with all certifications
```

## Specialist Responsibilities by Workflow Stage

| Specialist | Brainstorming | Planning | Implementation | Verification | Code Review | Handoff |
|-----------|---------------|----------|----------------|--------------|-------------|---------|
| **Security-Architect** | Threat model, patterns | Architecture review | - | - | - | - |
| **Security-Engineer** | - | - | Secure coding | Scan verification | Security checklist | Certification |
| **Software-Architect** | - | Technical architecture | - | - | - | - |
| **UX-Engineer** | Design patterns | - | Component usage | Accessibility audit | UX checklist | UX verification |
| **SET** | Testing strategy | Test plan | Test design | DoD certification | Testing checklist | DoD report |
| **Product-Manager** | Acceptance criteria | - | - | - | - | Handoff template |

## Integration Principles

**Agent0 specialists are passive context providers** - they don't drive the workflow, Superpowers does.

**Superpowers drives:**
- Workflow orchestration (brainstorm → plan → implement → verify → handoff)
- When to spawn specialists
- Task sequencing

**Agent0 provides:**
- Specialist knowledge on-demand
- Company-specific context (policies, tools, standards)
- Templates and checklists
- Compliance verification

## Example End-to-End Flow

```
1. User: "/brainstorm - Add payment processing"

2. Superpowers: Reads AGENT-INDEX.md, spawns specialists
   → Security-Architect: "PCI compliance required, use Stripe, tokenize cards..."
   → UX-Engineer: "Use PaymentForm component, show security badges..."
   → Product-Manager: "Here's acceptance criteria template..."

3. User: "Looks good, let's plan it"

4. Superpowers: Invokes writing-plans, spawns specialists
   → Security-Architect: "Store tokens not cards, webhook signature verification..."
   → Software-Architect: "Payment service layer, idempotency keys..."
   → SET: "Test: successful payment, failed payment, webhook replay..."

5. Superpowers: Executes plan (TDD cycle)
   → Security-Engineer: "Validate amount, check for injection..."
   → UX-Engineer: "Disable submit during processing, show spinner..."
   → SET: "Test edge case: network timeout during charge..."

6. Superpowers: "Ready to commit, running verification"
   → Security-Engineer: "Lifecycle scan: ✅ clean, Stripe SDK: ✅ latest"
   → SET: "Coverage: ✅ 82%, DoD: ✅ complete"

7. User: "Create PR"

8. Superpowers: Invokes requesting-code-review, spawns specialists
   → Security-Engineer: "Security checklist: ✅ PCI compliant, ✅ tokens encrypted"
   → SET: "Testing checklist: ✅ unit tests, ✅ integration tests, ✅ webhook tests"

9. User: "PR merged, ready to hand off"

10. Superpowers: Invokes finishing-a-development-branch, spawns specialists
    → Product-Manager: "Handoff doc: Payment processing feature complete..."
    → Security-Engineer: "Security cert: PCI compliant, scan clean..."
    → SET: "DoD cert: 82% coverage, all tests passing..."
```

**Result:** Feature shipped with security, UX, testing, and product compliance built in from start to finish. Zero rework. Zero wait time. Complete documentation.

## How Superpowers Discovers Specialists

1. **Session start**: Superpowers reads `AGENT-INDEX.md` (~500 tokens, cached)
2. **Specialist needed**: Spawns via `Agent(subagent_type="{{PLUGIN_NAME}}:Security-Engineer")`
3. **Agent loaded**: Full agent definition loaded on-demand (only when spawned)
4. **Agent provides context**: Returns guidance based on company policies
5. **Superpowers continues**: Uses specialist guidance to inform next steps

**Efficiency:** Only AGENT-INDEX.md loaded upfront, full agents loaded only when needed.

## Tools Superpowers Uses

Agent0 specialists have access to the same tools as Superpowers:

- **Read** - Read files
- **Write** - Write new files
- **Edit** - Edit existing files
- **Bash** - Execute shell commands
- **Glob** - Find files by pattern
- **Grep** - Search file contents
- **Agent** - Spawn additional specialists
- **Skill** - Invoke skills
- **Task tools** - TaskCreate, TaskUpdate, TaskList
- **AskUserQuestion** - Interactive questions

Specialists can read policies, scan code, run tools, and generate artifacts.

## Skills Specialists Use

Specialists invoke skills for their domain work:

**Security-Engineer:**
- `{{PLUGIN_NAME}}:lifecycle-scan` - Dependency scanning
- `{{PLUGIN_NAME}}:threat-modeling` - STRIDE threat modeling
- `{{PLUGIN_NAME}}:secure-coding` - Secure patterns

**Software-Engineer-In-Test:**
- `{{PLUGIN_NAME}}:dod-certification` - Definition of Done verification
- `{{PLUGIN_NAME}}:test-strategy` - Test planning
- `{{PLUGIN_NAME}}:coverage-report` - Coverage analysis

**UX-Engineer:**
- `{{PLUGIN_NAME}}:accessibility-audit` - WCAG compliance check
- `{{PLUGIN_NAME}}:design-system-check` - Component compliance

**Product-Manager:**
- `{{PLUGIN_NAME}}:acceptance-criteria` - BDD criteria generation
- `{{PLUGIN_NAME}}:handoff-template` - Delivery documentation

## Best Practices

**For Specialist Teams (Security, UX, SET, Product):**
- Maintain your agent definitions with current policies
- Update skills as tools/processes evolve
- Review agent guidance quarterly
- Add new skills as needed

**For Superpowers Users:**
- Trust the specialists - they have your company's policies encoded
- Answer specialist questions during brainstorming
- Review specialist checklists before merge
- Use handoff templates for delivery

**For Engineers:**
- Let Superpowers orchestrate, don't try to manually spawn specialists
- When specialist guidance conflicts with your intuition, ask why
- Update policies if specialist guidance is wrong/outdated
- Provide feedback to specialist teams

## Troubleshooting

**Specialist not spawning:**
- Check AGENT-INDEX.md syntax
- Verify plugin installed: `/plugin list`
- Restart Claude Code: `exit` then `claude`

**Generic guidance instead of company-specific:**
- Check plugin name in AGENT-INDEX.md matches plugin.json
- Reinstall plugin: `/plugin uninstall` then `/plugin install`
- Verify placeholders replaced in agent files

**Specialist gives wrong guidance:**
- File issue in plugin repo
- Tag specialist team (Security, UX, SET, Product)
- They'll update agent definition and you'll get fix via `/plugin update`

## Getting Help

- **Installation issues**: See INSTALLATION.md
- **Agent guidance wrong**: File issue in this repo, tag specialist team
- **Superpowers questions**: https://github.com/anthropics/claude-code
- **Integration questions**: Create issue in this repo
