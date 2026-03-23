#!/bin/bash
set -e

echo "🔨 Building plugin..."

# Check if config.yaml exists
if [ ! -f "config.yaml" ]; then
  echo "❌ config.yaml not found. Copy config.yaml.example and customize it."
  exit 1
fi

# 1. Clean and prepare
echo "📦 Preparing plugin directory..."
rm -rf plugin/
mkdir -p plugin/

# 2. Copy base templates
echo "📄 Copying base templates..."
cp -r security/ data/ engineering/ product/ ux/ plugin/
cp -r .claude-plugin/ .cursor-plugin/ AGENT-INDEX.md plugin/

# 3. Load config.yaml and perform substitutions
echo "🔧 Applying config.yaml substitutions..."

# Parse YAML and apply substitutions (simple implementation using sed)
# Read config values
COMPANY=$(grep "^company:" config.yaml | sed 's/company: *//')
COMPANY_SHORT=$(grep "^company_short:" config.yaml | sed 's/company_short: *//')
SAST_TOOL=$(grep "^  sast_tool:" config.yaml | sed 's/.*sast_tool: *//')
SCA_TOOL=$(grep "^  sca_tool:" config.yaml | sed 's/.*sca_tool: *//')
SECRETS_SCANNER=$(grep "^  secrets_scanner:" config.yaml | sed 's/.*secrets_scanner: *//')
CRITICAL_SLA=$(grep "^    critical:" config.yaml | sed 's/.*critical: *//')
HIGH_SLA=$(grep "^    high:" config.yaml | sed 's/.*high: *//')
MEDIUM_SLA=$(grep "^    medium:" config.yaml | sed 's/.*medium: *//')
COVERAGE=$(grep "^  coverage_threshold:" config.yaml | sed 's/.*coverage_threshold: *//')
DESIGN_SYSTEM=$(grep "^  design_system:" config.yaml | sed 's/.*design_system: *//')
DESIGN_SYSTEM_URL=$(grep "^  design_system_url:" config.yaml | sed 's/.*design_system_url: *//')
ISSUE_TRACKER=$(grep "^  issue_tracker:" config.yaml | sed 's/.*issue_tracker: *//')

# Apply substitutions to all markdown files (cross-platform sed syntax)
find plugin/ -type f -name "*.md" | while read -r file; do
  sed \
    -e "s|{{company}}|${COMPANY}|g" \
    -e "s|{{company_short}}|${COMPANY_SHORT}|g" \
    -e "s|{{security.sast_tool}}|${SAST_TOOL}|g" \
    -e "s|{{security.sca_tool}}|${SCA_TOOL}|g" \
    -e "s|{{security.secrets_scanner}}|${SECRETS_SCANNER}|g" \
    -e "s|{{security.slas.critical}}|${CRITICAL_SLA}|g" \
    -e "s|{{security.slas.high}}|${HIGH_SLA}|g" \
    -e "s|{{security.slas.medium}}|${MEDIUM_SLA}|g" \
    -e "s|{{testing.coverage_threshold}}|${COVERAGE}|g" \
    -e "s|{{ux.design_system}}|${DESIGN_SYSTEM}|g" \
    -e "s|{{ux.design_system_url}}|${DESIGN_SYSTEM_URL}|g" \
    -e "s|{{product.issue_tracker}}|${ISSUE_TRACKER}|g" \
    "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

# 4. Apply overrides
if [ -d "overrides/" ]; then
  echo "🎨 Applying overrides..."
  cp -rf overrides/* plugin/
fi

echo "✅ Plugin built successfully in plugin/"
