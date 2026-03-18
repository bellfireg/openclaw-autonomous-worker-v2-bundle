# Quick Start — Autonomous Worker V2 Bundle ⚡

**Get started in 5 minutes!**

---

## ⏱️ 5-Minute Setup

### Step 1: Install (1 minute)

```bash
# Navigate to bundle directory
cd ~/.openclaw/workspace/skills/autonomous-worker-bundle/

# Run auto-installer
bash INSTALL.sh
```

**What it does:**
- ✅ Copies all skills to correct locations
- ✅ Verifies installation
- ✅ Configures Discord (optional)
- ✅ Tests basic functionality

---

### Step 2: Verify (1 minute)

```bash
# Check skills are installed
ls ~/.openclaw/workspace/skills/ | grep -E "(autonomous|agency|superpowers|web)"

# Expected output:
# autonomous-worker-v2
# agency-agents
# superpowers
# web-research
```

---

### Step 3: Test (3 minutes)

**In your OpenClaw session:**

```
"Activate autonomous-worker-v2 mode — check my system info"
```

**What to expect:**
1. ✅ Worker activates
2. ✅ Gathers context (OS, tools, etc.)
3. ✅ Sends Discord notification (if configured)
4. ✅ Returns system info

**Success!** You're ready to use autonomous worker! 🎉

---

## 🎯 Common Tasks

### Simple Tasks (Core Worker)

```
# System check
"Activate autonomous-worker-v2 mode — check my system info"

# File organization
"Activate autonomous-worker-v2 mode — organize my downloads folder"

# Quick research
"Activate autonomous-worker-v2 mode — research Python best practices"
```

### Complex Tasks (With Agents)

```
# Build a dashboard
"Activate autonomous-worker-v2 mode — build a PC resource dashboard with AI Engineer agent"

# System design
"Activate autonomous-worker-v2 mode — design a microservices architecture with Backend Architect agent"

# Code review
"Activate autonomous-worker-v2 mode — review this PR with Code Reviewer agent"
```

### Web Research

```
# Fetch papers
"Activate autonomous-worker-v2 mode — research latest AI papers on arXiv"

# News monitoring
"Activate autonomous-worker-v2 mode — monitor financial news about crypto"
```

---

## 📨 Discord Notifications

**If configured, you'll receive:**

```
🚀 PHASE 1 COMPLETE
Context gathered for: system info check
Next: Creating plan...

🚀 PHASE 2 COMPLETE
Plan created: 3 steps
Next: Executing...

✅ TASK COMPLETE
System info collected
Time: 2 minutes
```

**To configure Discord:**
```bash
# Run installer again
bash INSTALL.sh

# When prompted, enter channel ID
# Or edit SESSION-STATE.md manually
```

---

## 📚 Learn More

### Full Documentation
- **Bundle README:** `autonomous-worker-bundle/README.md`
- **Worker Guide:** `autonomous-worker-v2/README.md`
- **Examples:** `autonomous-worker-v2/EXAMPLES.md`
- **Installation:** `autonomous-worker-bundle/INSTALL.md`

### Skill-Specific Docs
- **Agency Agents:** `agency-agents/README.md`
- **Superpowers:** `superpowers/README.md`
- **Web Research:** `web-research/SKILL.md`

---

## 🐛 Troubleshooting

### Worker Not Activating

**Try:**
```bash
# Restart OpenClaw
openclaw gateway restart

# Verify skill exists
ls ~/.openclaw/workspace/skills/autonomous-worker-v2/SKILL.md
```

### Agents Not Spawning

**Check:**
```bash
# Verify agent files
ls ~/.openclaw/workspace/skills/agency-agents/*/SOUL.md
```

### Need More Help?

- **GitHub Issues:** https://github.com/bellfireg/openclaw-autonomous-worker-v2-bundle/issues
- **Documentation:** See README.md
- **Examples:** See EXAMPLES.md

---

## 🎉 You're Ready!

**Start with simple tasks, then scale up to complex projects!**

```
Simple: "Check system info"
Medium: "Organize my files"
Complex: "Build a full-stack dashboard with AI Engineer agent"
```

**Happy autonomous working!** 🚀🐋

---

**Quick Start Version:** 1.0  
**Last Updated:** 2026-03-19  
**Time to Complete:** 5 minutes
