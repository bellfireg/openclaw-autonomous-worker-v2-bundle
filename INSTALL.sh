#!/bin/bash
# Autonomous Worker V2 Bundle — Auto-Installer
# This script installs all skills in the bundle automatically.

set -e

echo "🎁 Autonomous Worker V2 Bundle — Auto-Installer"
echo "================================================"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running in correct directory
if [ ! -f "INSTALL.sh" ]; then
    echo -e "${RED}❌ Error: Run this script from the bundle directory${NC}"
    echo "Usage: cd ~/.openclaw/workspace/skills/autonomous-worker-bundle && bash INSTALL.sh"
    exit 1
fi

# Check OpenClaw workspace
OPENCLAW_WS="$HOME/.openclaw/workspace"
if [ ! -d "$OPENCLAW_WS" ]; then
    echo -e "${RED}❌ Error: OpenClaw workspace not found at $OPENCLAW_WS${NC}"
    exit 1
fi

SKILLS_DIR="$OPENCLAW_WS/skills"

echo -e "${GREEN}✅ OpenClaw workspace found${NC}"
echo ""

# Step 1: Create symlinks or copy files
echo "📦 Installing skills..."
echo ""

# Function to install skill
install_skill() {
    local skill_name=$1
    local source_dir="$PWD/$skill_name"
    local target_dir="$SKILLS_DIR/$skill_name"
    
    if [ -d "$target_dir" ]; then
        echo -e "${YELLOW}⚠️  $skill_name already installed, skipping${NC}"
    else
        if [ -d "$source_dir" ]; then
            cp -r "$source_dir" "$target_dir"
            echo -e "${GREEN}✅ Installed: $skill_name${NC}"
        else
            echo -e "${RED}❌ Failed to install: $skill_name (directory not found)${NC}"
        fi
    fi
}

# Install all skills
install_skill "autonomous-worker-v2"
install_skill "agency-agents"
install_skill "superpowers"
install_skill "web-research"

echo ""
echo -e "${GREEN}✅ All skills installed!${NC}"
echo ""

# Step 2: Verify installation
echo "🔍 Verifying installation..."
echo ""

verify_skill() {
    local skill_name=$1
    local skill_file=$2
    local target="$SKILLS_DIR/$skill_name/$skill_file"
    
    if [ -f "$target" ]; then
        echo -e "${GREEN}✅ $skill_name/$skill_file${NC}"
        return 0
    else
        echo -e "${RED}❌ $skill_name/$skill_file (missing)${NC}"
        return 1
    fi
}

# Verify core worker
verify_skill "autonomous-worker-v2" "SKILL.md"
verify_skill "autonomous-worker-v2" "README.md"

# Verify agency agents
verify_skill "agency-agents" "README.md"
verify_skill "agency-agents/ai-engineer" "SOUL.md"
verify_skill "agency-agents/backend-architect" "SOUL.md"
verify_skill "agency-agents/code-reviewer" "SOUL.md"

# Verify superpowers
verify_skill "superpowers" "README.md"
verify_skill "superpowers/test-driven-development" "SKILL.md"
verify_skill "superpowers/systematic-debugging" "SKILL.md"
verify_skill "superpowers/writing-skills" "SKILL.md"

# Verify web research
verify_skill "web-research" "SKILL.md"

echo ""
echo -e "${GREEN}✅ Installation verified!${NC}"
echo ""

# Step 3: Configure Discord (optional)
echo "💬 Discord Configuration (Optional)"
echo "===================================="
echo ""
read -p "Do you want to configure Discord notifications? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Enter Discord channel ID: " DISCORD_CHANNEL
    
    if [ -n "$DISCORD_CHANNEL" ]; then
        # Update SESSION-STATE.md
        if [ -f "$OPENCLAW_WS/SESSION-STATE.md" ]; then
            echo "" >> "$OPENCLAW_WS/SESSION-STATE.md"
            echo "## Discord Configuration" >> "$OPENCLAW_WS/SESSION-STATE.md"
            echo "- Channel ID: $DISCORD_CHANNEL" >> "$OPENCLAW_WS/SESSION-STATE.md"
            echo "- Notifications: Event-driven (Phase 1, 2, COMPLETE, BLOCKED)" >> "$OPENCLAW_WS/SESSION-STATE.md"
            echo -e "${GREEN}✅ Discord configured${NC}"
        else
            echo -e "${YELLOW}⚠️  SESSION-STATE.md not found, skipping Discord config${NC}"
        fi
    fi
fi

echo ""

# Step 4: Test basic functionality
echo "🧪 Testing basic functionality..."
echo ""
echo -e "${YELLOW}Note: This is a basic file check. Full functionality test requires OpenClaw session.${NC}"
echo ""

# Check if OpenClaw is running
if pgrep -f "openclaw" > /dev/null; then
    echo -e "${GREEN}✅ OpenClaw is running${NC}"
else
    echo -e "${YELLOW}⚠️  OpenClaw is not running${NC}"
    echo "   Start with: openclaw gateway start"
fi

echo ""

# Step 5: Print next steps
echo "🎉 Installation Complete!"
echo "========================="
echo ""
echo "📚 Next Steps:"
echo ""
echo "1. Read the documentation:"
echo "   - Bundle README: ~/.openclaw/workspace/skills/autonomous-worker-bundle/README.md"
echo "   - Worker Guide: ~/.openclaw/workspace/skills/autonomous-worker-v2/README.md"
echo "   - Examples: ~/.openclaw/workspace/skills/autonomous-worker-v2/EXAMPLES.md"
echo ""
echo "2. Start using:"
echo '   In your OpenClaw session, say:'
echo '   "Activate autonomous-worker-v2 mode — check my system info"'
echo ""
echo "3. For complex tasks:"
echo '   "Activate autonomous-worker-v2 mode — build a RAG system with AI Engineer agent"'
echo ""
echo "4. Join the community:"
echo "   - GitHub: https://github.com/bellfireg/openclaw-autonomous-worker-v2-bundle"
echo "   - Submit issues, PRs, share your examples!"
echo ""
echo -e "${GREEN}Happy autonomous working! 🚀🐋${NC}"
echo ""
