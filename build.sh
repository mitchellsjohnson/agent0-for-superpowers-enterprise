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
# Use source dirs without trailing slashes so each domain becomes plugin/<domain>/
# (security/ + plugin/ would merge children into plugin/ on BSD/macOS cp)
cp -R security data engineering product ux plugin/
cp -r .claude-plugin/ .cursor-plugin/ AGENT-INDEX.md plugin/

# 3. Load config.yaml and perform substitutions
echo "🔧 Applying config.yaml substitutions..."

# Parse YAML and apply substitutions (simple implementation using sed)
# Read config values
COMPANY=$(grep "^company:" config.yaml | sed 's/company: *//')
COMPANY_SHORT=$(grep "^company_short:" config.yaml | sed 's/company_short: *//')
PLUGIN_ID=$(grep "^plugin_id:" config.yaml | sed 's/plugin_id: *//' | tr -d " '\"")
if [ -z "$PLUGIN_ID" ]; then
  PLUGIN_ID="agent0-for-superpowers-$(echo "$COMPANY_SHORT" | tr '[:upper:]' '[:lower:]')"
fi

# Security
SAST_TOOL=$(grep "^  sast_tool:" config.yaml | sed 's/.*sast_tool: *//')
SCA_TOOL=$(grep "^  sca_tool:" config.yaml | sed 's/.*sca_tool: *//')
SECRETS_SCANNER=$(grep "^  secrets_scanner:" config.yaml | sed 's/.*secrets_scanner: *//')
CRITICAL_SLA=$(grep "^    critical:" config.yaml | sed 's/.*critical: *//')
HIGH_SLA=$(grep "^    high:" config.yaml | sed 's/.*high: *//')
MEDIUM_SLA=$(grep "^    medium:" config.yaml | sed 's/.*medium: *//')
SECURITY_POLICY_MAIN=$(grep "^    main:" config.yaml | sed 's/.*main: *//')
SECURITY_POLICY_AUTH=$(grep "^    authentication:" config.yaml | sed 's/.*authentication: *//')

# Testing
COVERAGE=$(grep "^  coverage_threshold:" config.yaml | sed 's/.*coverage_threshold: *//')
TEST_FRAMEWORK_JAVA=$(grep "^    java:" config.yaml | sed 's/.*java: *//')
TEST_FRAMEWORK_JS=$(grep "^    javascript:" config.yaml | sed 's/.*javascript: *//')
MUTATION_TESTING=$(grep "^  mutation_testing:" config.yaml | sed 's/.*mutation_testing: *//')

# UX
DESIGN_SYSTEM=$(grep "^  design_system:" config.yaml | sed 's/.*design_system: *//')
DESIGN_SYSTEM_URL=$(grep "^  design_system_url:" config.yaml | sed 's/.*design_system_url: *//')
ACCESSIBILITY_STANDARD=$(grep "^  accessibility_standard:" config.yaml | sed 's/.*accessibility_standard: *//')
FIGMA_WORKSPACE=$(grep "^  figma_workspace:" config.yaml | sed 's/.*figma_workspace: *//')

# Product
ISSUE_TRACKER=$(grep "^  issue_tracker:" config.yaml | sed 's/.*issue_tracker: *//')
PROJECT_KEY=$(grep "^  project_key:" config.yaml | sed 's/.*project_key: *//')
ROADMAP_URL=$(grep "^  roadmap_url:" config.yaml | sed 's/.*roadmap_url: *//')

# Engineering
REPO_HOST=$(grep "^  repo_host:" config.yaml | sed 's/.*repo_host: *//')
CI_CD=$(grep "^  ci_cd:" config.yaml | sed 's/.*ci_cd: *//')
ARTIFACT_REGISTRY=$(grep "^  artifact_registry:" config.yaml | sed 's/.*artifact_registry: *//')

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
    -e "s|{{security.policy_urls.main}}|${SECURITY_POLICY_MAIN}|g" \
    -e "s|{{security.policy_urls.authentication}}|${SECURITY_POLICY_AUTH}|g" \
    -e "s|{{testing.coverage_threshold}}|${COVERAGE}|g" \
    -e "s|{{testing.frameworks.java}}|${TEST_FRAMEWORK_JAVA}|g" \
    -e "s|{{testing.frameworks.javascript}}|${TEST_FRAMEWORK_JS}|g" \
    -e "s|{{testing.mutation_testing}}|${MUTATION_TESTING}|g" \
    -e "s|{{ux.design_system}}|${DESIGN_SYSTEM}|g" \
    -e "s|{{ux.design_system_url}}|${DESIGN_SYSTEM_URL}|g" \
    -e "s|{{ux.accessibility_standard}}|${ACCESSIBILITY_STANDARD}|g" \
    -e "s|{{ux.figma_workspace}}|${FIGMA_WORKSPACE}|g" \
    -e "s|{{product.issue_tracker}}|${ISSUE_TRACKER}|g" \
    -e "s|{{product.project_key}}|${PROJECT_KEY}|g" \
    -e "s|{{product.roadmap_url}}|${ROADMAP_URL}|g" \
    -e "s|{{engineering.repo_host}}|${REPO_HOST}|g" \
    -e "s|{{engineering.ci_cd}}|${CI_CD}|g" \
    -e "s|{{engineering.artifact_registry}}|${ARTIFACT_REGISTRY}|g" \
    -e "s|{{COMPANY_NAME}}|${COMPANY}|g" \
    -e "s|{{plugin_id}}|${PLUGIN_ID}|g" \
    -e "s|{{PLUGIN_NAME}}|${PLUGIN_ID}|g" \
    -e "s|{{COMPANY_SAST_TOOL}}|${SAST_TOOL}|g" \
    -e "s|{{COMPANY_SCA_TOOL}}|${SCA_TOOL}|g" \
    -e "s|{{COMPANY_DEPENDENCY_SCANNER}}|${SCA_TOOL}|g" \
    -e "s|{{COMPANY_SECRETS_TOOL}}|${SECRETS_SCANNER}|g" \
    -e "s|{{CRITICAL_SLA_DAYS}}|${CRITICAL_SLA}|g" \
    -e "s|{{HIGH_SLA_DAYS}}|${HIGH_SLA}|g" \
    -e "s|{{MEDIUM_SLA_DAYS}}|${MEDIUM_SLA}|g" \
    -e "s|{{COVERAGE_THRESHOLD}}|${COVERAGE}|g" \
    -e "s|{{COMPANY_CI_CD_TOOL}}|${CI_CD}|g" \
    -e "s|{{COMPANY_ARTIFACT_REPO}}|${ARTIFACT_REGISTRY}|g" \
    -e "s|{{CRITICAL_ESCALATION}}|VP Engineering|g" \
    -e "s|{{HIGH_ESCALATION}}|Engineering Manager|g" \
    "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

# 4. Apply overrides
if [ -d "overrides/" ]; then
  echo "🎨 Applying overrides..."
  cp -rf overrides/* plugin/
fi

echo "✅ Plugin built successfully in plugin/"
