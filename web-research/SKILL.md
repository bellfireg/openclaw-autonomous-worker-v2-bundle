---
name: web-research
description: Unified web research workflow using agent-browser for full browsing + security pipeline integration. Use for research tasks, data extraction, and content gathering.
read_when:
  - Researching topics online
  - Extracting data from websites
  - Gathering information for reports
  - Fetching content for memory
metadata: {"clawdbot":{"emoji":"🌐","requires":{"bins":["agent-browser"]}}}
allowed-tools: Bash(agent-browser:*)
---

# Web Research Skill — Agent Browser Integration 🕸️🛡️

**Unified workflow untuk web research dengan full security integration.**

## Core Tools

| Tool | Purpose | When to Use |
|------|---------|-------------|
| `agent-browser` | Full browser automation | JS-heavy sites, login-required, screenshots |
| `web_fetch` | Simple HTTP fetch | Static articles, documentation |
| `SearXNG` | Local search engine | Initial discovery (localhost:8080) |
| `security-pipeline.sh` | 4-layer defense | ALL external content before memory |

## Workflow

### Phase 1: Discovery (SearXNG)

```bash
# Search via SearXNG (local, no API)
curl -s "http://localhost:8080/search?q=artificial+intelligence+2026&format=json"
```

Or use OpenClaw's `local_search_search` tool.

**Output:** List of URLs (top 10-20 results)

---

### Phase 2: Deep Dive (Agent Browser)

For each promising URL:

```bash
# 1. Navigate
agent-browser open <url> --timeout 15000

# 2. Snapshot (get element refs)
agent-browser snapshot -i --json > snapshot.json

# 3. Extract content
agent-browser get text body 2>/dev/null
# Or for specific sections:
agent-browser get text @e1
agent-browser get html article

# 4. Screenshot (optional)
agent-browser screenshot --full screenshots/<name>_<timestamp>.png

# 5. Save PDF (optional)
agent-browser pdf pdfs/<name>_<timestamp>.pdf

# 6. Close
agent-browser close
```

**For interactive sites:**
```bash
# Fill forms
agent-browser fill @e1 "search query"
agent-browser click @e2

# Wait for navigation
agent-browser wait --load networkidle

# Re-snapshot for new refs
agent-browser snapshot -i
```

---

### Phase 3: Security Pipeline

**BEFORE saving ANY content to memory:**

```bash
# Save fetched content to temp file
agent-browser get text body > /tmp/research_content.md

# Run through security pipeline
./scripts/security-pipeline.sh /tmp/research_content.md \
  --output memory/research/<topic>/<name>_<timestamp>.md

# Check exit code
# 0 = Success (saved to memory)
# 1 = Quarantine (blocked by security layer)
# 2 = Error (pipeline error)
```

**For URLs:**
```bash
./scripts/security-pipeline.sh <url> --url \
  --output memory/research/<topic>/<name>_<timestamp>.md
```

---

### Phase 4: Synthesis & Memory

```bash
# 1. Read saved content
cat memory/research/<topic>/<name>_<timestamp>.md

# 2. Extract key insights
# - What is this about?
# - How does it apply to Bell's work?
# - What assumptions does this challenge?

# 3. Save to semantic memory
# Use elite-longterm-memory or save to memory/semantic/

# 4. Index to ChromaDB (if applicable)
```

---

## Security Integration

**ALL external content passes through 4-layer defense:**

1. **Layer 1: Domain Firewall**
   - Check against allowlist/blocklist
   - Unknown domains = quarantine

2. **Layer 2: Content Sanitization**
   - Strip scripts, event handlers
   - Remove embedded code

3. **Layer 3: Injection Detection**
   - 62+ pattern scanning
   - Prompt injection blocking

4. **Layer 4: Safe Execution**
   - Risk-based approval
   - Audit logging

**Fail-closed:** Any layer failure = quarantine + stop.

---

## Example: Research Task

**Task:** "Find recent AI reasoning papers from arXiv"

```bash
# 1. Search
curl -s "http://localhost:8080/search?q=arxiv+LLM+reasoning+2026&format=json"

# 2. Extract URLs from results
# (parse JSON, get top 5 URLs)

# 3. For each URL:
agent-browser open "https://arxiv.org/abs/..."
agent-browser snapshot -i
agent-browser get text .abstract
agent-browser screenshot --full screenshots/arxiv_$(date +%Y%m%d_%H%M%S).png
agent-browser close

# 4. Security pipeline
./scripts/security-pipeline.sh /tmp/arxiv_abstract.md \
  --output memory/research/AI_reasoning/arxiv_$(date +%Y%m%d_%H%M%S).md

# 5. Synthesize
# Extract key findings, save to memory/semantic/
```

---

## Session Management (Login-Required Sites)

```bash
# 1. Login once
agent-browser open https://example.com/login
agent-browser snapshot -i
agent-browser fill @e1 "username"
agent-browser fill @e2 "password"
agent-browser click @e3
agent-browser wait --url "/dashboard"

# 2. Save session state
agent-browser state save auth.json

# 3. Later: Load session
agent-browser state load auth.json
agent-browser open https://example.com/protected-page
```

---

## Batch Processing

For multiple URLs:

```bash
#!/bin/bash
# research-batch.sh

URLS=(
  "https://example.com/article1"
  "https://example.com/article2"
  "https://example.com/article3"
)

for url in "${URLS[@]}"; do
  echo "Processing: $url"
  
  # Fetch
  agent-browser open "$url"
  agent-browser get text body > "/tmp/content_$(date +%s).md"
  agent-browser close
  
  # Security pipeline
  ./scripts/security-pipeline.sh "/tmp/content_$(date +%s).md" \
    --output "memory/research/batch/$(basename $url).md"
  
  # Rate limiting (avoid hammering sites)
  sleep 2
done
```

---

## Output Structure

```
workspace/
├── memory/
│   ├── research/
│   │   ├── <topic>/
│   │   │   ├── <source>_<timestamp>.md  (raw content)
│   │   │   └── screenshots/              (visual captures)
│   │   └── batch/                        (batch processing)
│   └── semantic/
│       └── proactive_learnings_YYYY_MM_DD.md  (synthesized insights)
├── quarantine/
│   ├── layer1_domain_denied/
│   ├── layer2_sanitize_fail/
│   ├── layer3_injection_fail/
│   └── layer4_execution_fail/
└── scripts/
    ├── security-pipeline.sh
    └── browse-and-save.sh
```

---

## Error Handling

```bash
# Check agent-browser exit codes
agent-browser open "$url"
if [ $? -ne 0 ]; then
  echo "Failed to open: $url"
  # Log error, skip to next
fi

# Check pipeline exit codes
./scripts/security-pipeline.sh "$input"
exit_code=$?

if [ $exit_code -eq 0 ]; then
  echo "✅ Content saved to memory"
elif [ $exit_code -eq 1 ]; then
  echo "🚨 Content quarantined (security block)"
  # Notify Bell with reason
elif [ $exit_code -eq 2 ]; then
  echo "❌ Pipeline error"
  # Debug and retry
fi
```

---

## Performance Tips

1. **Use `web_fetch` for static content** (faster, no browser overhead)
2. **Use `agent-browser` for JS-heavy sites** (React, SPAs, login-required)
3. **Batch similar URLs** (reduce browser startup overhead)
4. **Save session state** (avoid re-login for repeated tasks)
5. **Use screenshots sparingly** (they're large, use only when needed)

---

## Troubleshooting

**Browser won't open:**
```bash
# Reinstall browser
agent-browser install

# Check dependencies
agent-browser install --with-deps
```

**Element not found:**
```bash
# Re-snapshot (refs change after navigation)
agent-browser snapshot -i
```

**Timeout errors:**
```bash
# Increase timeout
agent-browser open "$url" --timeout 30000
```

**Security pipeline blocks legitimate content:**
```bash
# Check quarantine folder for reason
cat quarantine/layer3_injection_fail/<timestamp>/metadata.json

# Review and adjust patterns if false positive
```

---

## Quick Reference

```bash
# Navigate
agent-browser open <url>

# Get content
agent-browser snapshot -i
agent-browser get text @e1
agent-browser get html body

# Interact
agent-browser fill @e1 "text"
agent-browser click @e2
agent-browser press Enter

# Capture
agent-browser screenshot --full path.png
agent-browser pdf path.pdf

# Session
agent-browser state save auth.json
agent-browser state load auth.json

# Security
./scripts/security-pipeline.sh <input> --output <memory_path>

# Close
agent-browser close
```

---

## Related Skills

- `proactive-learning` — Weekly automated research
- `security-pipeline` — 4-layer defense workflow
- `agent-browser` — Browser automation reference

---

## Notes

- **Refs are per-page** — Re-snapshot after navigation
- **Always use security pipeline** — No exceptions
- **Quarantine is safe** — Blocked content is logged, not deleted
- **Session state is powerful** — Use for login-required sites
- **Screenshots are optional** — Use when visual context matters
