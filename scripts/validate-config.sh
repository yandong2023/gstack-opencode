#!/bin/bash
# GStack Configuration Validator
# Checks if OpenCode is installed and if configuration files exist

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}🔍 Validating GStack for OpenCode Configuration...${NC}"

# 1. Check OpenCode installation
if ! command -v opencode &> /dev/null; then
    echo -e "${RED}❌ OpenCode CLI is not installed.${NC}"
    echo "Please install it: npm install -g opencode"
else
    echo -e "${GREEN}✅ OpenCode CLI found: $(which opencode)${NC}"
fi

# 2. Check Global Config
GLOBAL_CONFIG="${HOME}/.config/opencode/opencode.json"
if [ -f "$GLOBAL_CONFIG" ]; then
    echo -e "${GREEN}✅ Global config found at $GLOBAL_CONFIG${NC}"
else
    echo -e "${YELLOW}ℹ️ No global config found at $GLOBAL_CONFIG${NC}"
fi

# 3. Check Project Config
if [ -f "opencode.json" ]; then
    echo -e "${GREEN}✅ Project-specific config found in current directory.${NC}"
else
    echo -e "${YELLOW}ℹ️ No project-specific opencode.json found.${NC}"
fi

# 4. Check Agents installation
CONFIG_AGENTS_DIR="${HOME}/.config/opencode/agents"
if [ -d "$CONFIG_AGENTS_DIR" ] && [ "$(ls -A "$CONFIG_AGENTS_DIR" 2>/dev/null)" ]; then
    echo -e "${GREEN}✅ GStack Agents are installed in $CONFIG_AGENTS_DIR${NC}"
else
    echo -e "${RED}❌ GStack Agents are missing. Please run 'make install'.${NC}"
fi

echo -e "\n${GREEN}Validation complete!${NC}"
echo "If you are having issues with domestic models, ensure you have configured a custom provider in opencode.json."
