#!/usr/bin/env bash

set -euo pipefail

# ==========================================
# Dependency check
# ==========================================

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required but not installed."
  exit 1
fi

RALPH_REPO="https://github.com/snarktank/ralph.git"
CLAUDE_CODE_REPO="https://github.com/anthropics/claude-code.git"

RALPH_TEMP="$(mktemp -d)"
CLAUDE_TEMP="$(mktemp -d)"

# ==========================================
# Cleanup handler
# ==========================================

cleanup() {
  rm -rf "$RALPH_TEMP" "$CLAUDE_TEMP"
}
trap cleanup EXIT


# ==========================================
# START: Ralph installation
# ==========================================

echo "Installing Ralph..."

git clone --depth 1 "$RALPH_REPO" "$RALPH_TEMP"

# Create required directories
mkdir -p scripts/ralph
mkdir -p .claude/skills

# Copy main Ralph files
cp -f "$RALPH_TEMP/ralph.sh" scripts/ralph/
cp -f "$RALPH_TEMP/prompt.md" scripts/ralph/
cp -f "$RALPH_TEMP/CLAUDE.md" scripts/ralph/

# Replace existing Ralph skills
rm -rf .claude/skills/prd
rm -rf .claude/skills/ralph
cp -r "$RALPH_TEMP/skills/prd" .claude/skills/
cp -r "$RALPH_TEMP/skills/ralph" .claude/skills/

# Clean up temporary Ralph directory
rm -rf "$RALPH_TEMP"

# ==========================================
# END: Ralph installation
# ==========================================


# ==========================================
# START: Claude Code devcontainer setup
# ==========================================

echo "Installing Claude Code devcontainer..."

git clone --depth 1 "$CLAUDE_CODE_REPO" "$CLAUDE_TEMP"

# Create .devcontainer directory
mkdir -p .devcontainer

# Copy devcontainer files
cp -f "$CLAUDE_TEMP/.devcontainer/Dockerfile" .devcontainer/
cp -f "$CLAUDE_TEMP/.devcontainer/devcontainer.json" .devcontainer/
cp -f "$CLAUDE_TEMP/.devcontainer/init-firewall.sh" .devcontainer/

# Clean up temporary Claude directory
rm -rf "$CLAUDE_TEMP"

# ==========================================
# END: Claude Code devcontainer setup
# ==========================================

echo "Setup completed successfully."
