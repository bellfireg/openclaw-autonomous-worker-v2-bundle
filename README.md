# Autonomous Worker V2 — Complete Bundle 🎁

**All-in-one autonomous worker package for OpenClaw.**

This bundle includes **everything you need** for autonomous task execution:
- ✅ **Autonomous Worker V2** — ReAct loop + event-driven notifications
- ✅ **Agency Agents** — 3 specialized workers (AI Engineer, Backend Architect, Code Reviewer)
- ✅ **Superpowers Skills** — 3 discipline skills (TDD, Debugging, Writing)
- ✅ **Web Research** — Unified web workflow + security pipeline

**No dependencies to install separately** — everything included!

---

## 🎯 What's Included

### Core Worker
- **autonomous-worker-v2** — Main autonomous worker with 5-phase ReAct loop

### Specialized Agents (Can be spawned for complex tasks)
- **AI Engineer** — ML/AI implementation specialist
- **Backend Architect** — System design specialist
- **Code Reviewer** — Code quality specialist

### Discipline Skills (Automatically used by worker)
- **test-driven-development** — Write tests first, always
- **systematic-debugging** — Find root cause before fixing
- **writing-skills** — TDD for documentation

### Web Tools (For research tasks)
- **web-research** — Unified web workflow
- **searxng** — Local search engine (no API keys)
- **scientific-research** — Academic paper fetching

---

## 🚀 Quick Installation

### One-Command Install

```bash
# Clone the complete bundle
git clone https://github.com/bellfireg/openclaw-autonomous-worker-v2-bundle.git \
        ~/.openclaw/workspace/skills/autonomous-worker-bundle

# Or download ZIP and extract to ~/.openclaw/workspace/skills/autonomous-worker-bundle
```

### Verify Installation

```bash
# Check all skills are present
ls -la ~/.openclaw/workspace/skills/autonomous-worker-bundle/

# Expected:
# autonomous-worker-v2/   # Core worker
# agency-agents/          # Specialized agents
# superpowers/            # Discipline skills
# web-research/           # Web tools
# README.md               # This guide
# INSTALL.sh              # Auto-installer script
```

---

## 📦 Bundle Structure

```
autonomous-worker-bundle/
├── autonomous-worker-v2/
│   ├── SKILL.md              # Core worker definition
│   ├── README.md             # Usage guide
│   ├── EXAMPLES.md           # Real examples
│   └── INSTALL.md            # Installation guide
│
├── agency-agents/
│   ├── README.md             # Agents overview
│   ├── ai-engineer/
│   │   └── SOUL.md           # AI Engineer agent
│   ├── backend-architect/
│   │   └── SOUL.md           # Backend Architect agent
│   └── code-reviewer/
│       └── SOUL.md           # Code Reviewer agent
│
├── superpowers/
│   ├── README.md             # Skills overview
│   ├── test-driven-development/
│   │   └── SKILL.md          # TDD skill
│   ├── systematic-debugging/
│   │   └── SKILL.md          # Debugging skill
│   └── writing-skills/
│       └── SKILL.md          # Writing skill
│
├── web-research/
│   └── SKILL.md              # Web research workflow
│
├── INSTALL.sh                # Auto-installer script
├── README.md                 # This guide
└── QUICKSTART.md             # 5-minute quickstart
```

---

## ⚡ Auto-Installer Script

**Run this to install everything automatically:**

```bash
cd ~/.openclaw/workspace/skills/autonomous-worker-bundle/
bash INSTALL.sh
```

**What it does:**
1. ✅ Copies all skills to correct locations
2. ✅ Verifies installation
3. ✅ Creates symlinks (optional)
4. ✅ Tests basic functionality
5. ✅ Provides next steps

---

## 🎯 Usage Examples

### Simple Task (Core Worker)

```
"Activate autonomous-worker-v2 mode — check my system info"
```

**What happens:**
- Worker gathers context (OS, tools, infrastructure)
- Sends Discord notification (Phase 1 complete)
- Creates plan
- Sends Discord notification (Phase 2 complete)
- Executes and tests
- Sends final report (COMPLETE)

---

### Complex Task (With Specialized Agents)

```
"Activate autonomous-worker-v2 mode — build a RAG system with AI Engineer agent"
```

**What happens:**
- Worker spawns AI Engineer agent for ML implementation
- AI Engineer uses TDD skill automatically
- Worker coordinates, tracks progress
- Sends milestone notifications
- Delivers complete system

---

### Web Research Task

```
"Activate autonomous-worker-v2 mode — research latest AI papers on arXiv"
```

**What happens:**
- Worker uses web-research skill
- Fetches papers via SearXNG (no API keys)
- Summarizes findings
- Saves to memory
- Sends report

---

## 🔧 Configuration

### Discord Notifications

**Edit `SESSION-STATE.md`:**

```markdown
## Discord Configuration
- Channel ID: YOUR_CHANNEL_ID
- Notifications: Event-driven (Phase 1, 2, COMPLETE, BLOCKED)
```

### Custom Working Directory

**Default:** `~/.openclaw/workspace/tmp/[project-name]/`

**To change:**
```bash
export AUTONOMOUS_WORKER_TMP="/your/custom/path"
```

---

## 📚 Documentation

### Core Worker
- **README.md** — Main usage guide
- **EXAMPLES_GALLERY.md** — Real examples with GitHub code links ⭐
- **INSTALL.md** — Installation guide

### Agency Agents
- **agency-agents/README.md** — Agents overview
- **agency-agents/[agent]/SOUL.md** — Agent definition

### Superpowers
- **superpowers/README.md** — Skills overview
- **superpowers/[skill]/SKILL.md** — Skill definition

### Web Research
- **web-research/SKILL.md** — Web workflow

### Bundle
- **QUICKSTART.md** — 5-minute quickstart
- **INSTALL.sh** — Auto-installer

---

## 🐛 Troubleshooting

### Skills Not Loading

**Check:**
```bash
# Verify all skills exist
ls -la ~/.openclaw/workspace/skills/autonomous-worker-bundle/

# Restart OpenClaw
openclaw gateway restart
```

### Agents Not Spawning

**Check:**
```bash
# Verify agent files
ls -la ~/.openclaw/workspace/skills/autonomous-worker-bundle/agency-agents/*/SOUL.md

# Check OpenClaw logs
tail -f ~/.openclaw/logs/openclaw.log
```

### Web Search Not Working

**Check:**
```bash
# Verify SearXNG is running
curl http://localhost:8080/search?q=test

# If not running, start SearXNG
docker start searxng
```

---

## 🎁 What Makes This Bundle Special

### ✅ All-in-One
No need to install skills separately — everything included!

### ✅ Pre-Configured
Skills are pre-configured to work together seamlessly.

### ✅ Documented
Comprehensive documentation for each skill.

### ✅ Tested
All skills tested together (not just individually).

### ✅ Community-Ready
Public GitHub repo, easy to share and contribute.

---

## 📝 Quick Reference

### Activate Worker
```
"Activate autonomous-worker-v2 mode — [your task]"
```

### Spawn Agent
```
"Spawn AI Engineer agent for [ML task]"
"Spawn Backend Architect agent for [system design]"
"Spawn Code Reviewer agent for [code review]"
```

### Use Discipline Skills
```
"Activate TDD mode — implementing [feature]"
"Activate systematic debugging — [bug description]"
"Activate writing-skills — creating [documentation]"
```

### Web Research
```
"Research [topic] using web-research"
"Fetch papers from arXiv about [topic]"
```

---

## 🤝 Contributing

Found a bug? Have an improvement?

1. **Fork** this repo
2. **Create** feature branch
3. **Test** with real tasks
4. **Submit** PR

**GitHub:** https://github.com/bellfireg/openclaw-autonomous-worker-v2-bundle

---

## 📄 License

MIT License — Free to use, modify, and share.

---

## 🎯 Next Steps

1. ✅ **Install bundle** — Run `INSTALL.sh`
2. ✅ **Read QUICKSTART.md** — 5-minute guide
3. ✅ **Test with simple task** — "Check system info"
4. ✅ **Test with complex task** — "Build [your project]"
5. ✅ **Share with community** — Star repo, submit PRs

---

**Bundle Version:** 1.0  
**Last Updated:** 2026-03-19  
**Author:** Kyo 🐋 (with Bell)  
**Compatible with:** OpenClaw v1.0+

**Ready to use right out of the box!** 🎁🚀
🐋 (with Bell)  
**Compatible with:** OpenClaw v1.0+

**Ready to use right out of the box!** 🎁🚀
