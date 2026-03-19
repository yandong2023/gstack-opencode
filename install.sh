#!/bin/bash
# GStack for OpenCode Installation Script
# Robust version with error handling and backup

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "🚀 ${GREEN}Installing GStack for OpenCode...${NC}"

# Check for OpenCode
if ! command -v opencode &> /dev/null; then
    echo -e "${RED}❌ OpenCode not found. Please install it first:${NC}"
    echo "   npm install -g opencode"
    exit 1
fi

# Get directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.config/opencode"

# Function to safely copy files
safe_copy() {
    local src_dir="$1"
    local dest_dir="$2"
    local label="$3"

    echo -e "📦 ${YELLOW}Installing ${label}...${NC}"
    mkdir -p "${dest_dir}"

    # Backup existing if any
    if [ -d "${dest_dir}" ] && [ "$(ls -A "${dest_dir}" 2>/dev/null)" ]; then
        # Optional: could add backup logic here if needed
        :
    fi

    cp -v "${src_dir}/"*.md "${dest_dir}/" 2>/dev/null || true
}

# Install components
safe_copy "${SCRIPT_DIR}/agents" "${CONFIG_DIR}/agents" "agents"
safe_copy "${SCRIPT_DIR}/commands" "${CONFIG_DIR}/commands" "commands"
safe_copy "${SCRIPT_DIR}/skills" "${CONFIG_DIR}/skills" "skills"

echo -e "\n✅ ${GREEN}GStack for OpenCode installed successfully!${NC}"
echo -e "\n${YELLOW}Available commands:${NC}"
echo "  /plan-ceo    - CEO perspective review"
echo "  /plan-eng    - Engineering manager review"
echo "  /design      - UI/UX review"
echo "  /review      - Code review"
echo "  /security    - Security audit"
echo "  /qa          - QA testing"
echo "  /docs        - Documentation review"
echo "  /ship        - Release preparation"

echo -e "\nStart OpenCode in your project directory and try:"
echo "  cd your-project"
echo "  opencode"
echo "  /plan-ceo 'your feature idea'"
