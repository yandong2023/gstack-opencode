#!/bin/bash
set -e

echo "🚀 Installing GStack for OpenCode..."

# 检查 OpenCode 是否安装
if ! command -v opencode &> /dev/null; then
    echo "❌ OpenCode not found. Please install it first:"
    echo "   npm install -g opencode"
    exit 1
fi

# 获取安装目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.config/opencode"

# 创建配置目录
mkdir -p "${CONFIG_DIR}/agents"
mkdir -p "${CONFIG_DIR}/commands"
mkdir -p "${CONFIG_DIR}/skills"

# 复制 agents
echo "📦 Installing agents..."
cp "${SCRIPT_DIR}/agents/"*.md "${CONFIG_DIR}/agents/" 2>/dev/null || true

# 复制 commands
echo "📦 Installing commands..."
cp "${SCRIPT_DIR}/commands/"*.md "${CONFIG_DIR}/commands/" 2>/dev/null || true

# 复制 skills
echo "📦 Installing skills..."
cp "${SCRIPT_DIR}/skills/"*.md "${CONFIG_DIR}/skills/" 2>/dev/null || true

echo ""
echo "✅ GStack for OpenCode installed successfully!"
echo ""
echo "Available commands:"
echo "  /plan-ceo    - CEO perspective review"
echo "  /plan-eng    - Engineering manager review"
echo "  /review      - Code review"
echo "  /qa          - QA testing"
echo "  /ship        - Release preparation"
echo ""
echo "Start OpenCode in your project directory and try:"
echo "  cd your-project"
echo "  opencode"
echo "  /plan-ceo 'your feature idea'"
