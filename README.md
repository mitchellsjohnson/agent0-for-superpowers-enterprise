# Agent0 for Superpowers: Enterprise Context Layer

**The Problem**: Superpowers builds non-compliant software because it has no access to your enterprise's specialist knowledge (UX, Security, Testing, Product standards). Engineers wait days for specialist reviews, then do expensive rework.

**The Solution**: Agent0 for Superpowers makes specialist knowledge available on-demand to every developer, eliminating specialist bottlenecks and shifting compliance left.

## What This Framework Provides

- **Generic agent templates** for common enterprise roles (Security Engineer, UX Specialist, SET, Product Manager, DevOps)
- **Generic skill patterns** for security scanning, testing, accessibility, design systems
- **Policy templates** with placeholders for your company's actual requirements
- **Integration guides** for connecting your company's tools

## Quick Start

1. **Fork this repository** for your company
2. **Customize** agents, skills, and policies with your company's specifics:
   - Replace `{{COMPANY_NAME}}`, `{{CRITICAL_SLA_DAYS}}`, etc. with your values
   - See `policies/README.md` for full list of placeholders
   - Customize `.template.md` files and remove `.template` suffix
3. **Install** as a Claude Code plugin alongside Superpowers
4. **Use** - Superpowers automatically consults your specialists when needed

## How It Works

```
Developer → Superpowers (workflows) → Agent0-YourCompany (specialists) → Compliant software
```

- Superpowers orchestrates development workflows (TDD, brainstorming, planning)
- When it needs domain expertise, it spawns a specialist from your Agent0 library
- Specialist provides guidance based on your company's actual policies
- Software is built compliant from the start, not fixed after review

## The Problem: Specialist Bottlenecks

Nobody in your enterprise knows all the rules. That's why you have specialists:
- **UX Specialists** know design systems, accessibility standards
- **Security Engineers** know security policies, SLAs, compliance
- **Software Engineers in Test** know testing standards, Definition of Done
- **Product Managers** know product strategy, roadmap alignment

These specialists are **shared resources** - one Security Engineer supporting 5 teams, one UX Specialist reviewing 10 projects. They become bottlenecks:
- Work waits days/weeks in review queues
- Expensive late-stage rework after specialist review
- Specialists burn out from constant context-switching

## The Solution: On-Demand Expertise

Agent0 makes specialist knowledge available to every developer without waiting for the human specialist:

**Traditional flow:**
```
Engineer → Build → Wait 3 days for UX → Rework 2 days → Wait 5 days for Security → Rework 3 days
Total: 15 days (5 days rework, 8 days waiting)
```

**With Agent0:**
```
Engineer → Consult UX-Agent during design → Consult Security-Engineer during implementation
Total: 2 days (compliance built in, zero rework, zero wait time)
```

## ROI: $56K-104K Saved Per 10 Projects

- Eliminate rework cycles: $4,800-8,000 saved per project
- Eliminate wait time: $2,400-4,000 saved per project
- Preserve specialist capacity for novel problems
- Scale teams without proportionally scaling specialists

## Documentation

- **Policies**: See `policies/` for security, testing, UX, and tech stack templates
- **Agents**: See `agents/` for agent definitions (Engineering, Security, UX, Product, SET)
- **Skills**: See `skills/` for reusable workflows (security scanning, testing, accessibility)
- **Integration**: See `integrations/` for MCP server setup and CI/CD patterns
- **Agent Index**: See `AGENT-INDEX.md` for how Superpowers discovers specialists

## License

MIT License - see LICENSE file for details

## Contributing

This is the generic framework. For company-specific implementations, fork and customize.
For framework improvements, submit PRs to this repository.
