# Skills Library

Generic enterprise skills organized by domain.

## Directory Structure

- **security/**: Security scanning, threat modeling, requirements
- **testing/**: Test strategy, coverage, Definition of Done
- **ux/**: Accessibility, design system
- **engineering/**: Secure coding, development practices

## How Skills Work

Skills are invoked by agents or directly by Superpowers:

```python
# Invoke a skill
Skill("agent0-for-superpowers-YOUR-COMPANY:sast-scan")
```

## Customization

1. Replace `{{COMPANY_*}}` placeholders with your tools
2. Update thresholds and standards to match your company
3. Add company-specific skills as needed

See individual skill directories for detailed customization instructions.
