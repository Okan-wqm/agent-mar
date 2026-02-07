# Usage Guide — Marketing Automation Agency System

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Client Onboarding](#client-onboarding)
3. [Daily Operations](#daily-operations)
4. [Weekly Cycle](#weekly-cycle)
5. [Monthly Cycle](#monthly-cycle)
6. [Ad-Hoc Commands](#ad-hoc-commands)
7. [Regional Operations](#regional-operations)
8. [Troubleshooting](#troubleshooting)

---

## Prerequisites

- **AI Assistant** installed and configured
- **Git** initialized in the root directory
- Access to the system files in `system/`

---

## Client Onboarding

### Step 1: Create Client Workspace

```bash
# Linux/Mac
./scripts/new-client.sh my-client

# Windows
scripts\new-client.bat my-client
```

This creates the full directory structure and copies shared system files.

### Step 2: Start AI Assistant

```bash
cd clients/my-client
ai-assistant
```

**Important:** Always `cd` into the client folder first. Never run the AI assistant from the root directory.

### Step 3: Run Discovery Agent

Tell the AI assistant:
> "Analyze https://my-client.com and build the company profile."

The Discovery Agent will:
1. Scan the website (all pages: about, products, pricing, blog, careers, etc.)
2. Research external sources (LinkedIn, Crunchbase, news)
3. Analyze brand voice and content patterns
4. Identify competitors
5. Reconstruct the Ideal Customer Profile (ICP)
6. Generate `config/company-profile.yaml` with confidence levels
7. Generate `config/discovery-report.md`

### Step 4: Review and Correct

Open `config/discovery-report.md` and look for the **"Action Required: Please Verify"** section at the end. This lists all LOW confidence fields that need manual correction.

Edit `config/company-profile.yaml` to:
- Correct any inaccurate information
- Fill in fields the Discovery Agent couldn't determine
- Adjust ICP segments if needed
- Set compliance flags (GDPR, KVKK, CAN-SPAM)
- Configure integrations (email provider, CRM)
- Set daily targets and limits

### Step 5: Bootstrap Operational Agents

Tell the AI assistant:
> "Start the bootstrap orchestrator. Generate all 12 marketing agent files."

The Bootstrap Orchestrator will generate agents in 4 waves:

| Wave | Agents | Duration |
|------|--------|----------|
| 1 | Maestro, Market Intelligence, Lead Researcher, Analyst | ~5-10 min |
| 2 | Lead Scorer, Content Strategist, Pipeline Tracker | ~5-10 min |
| 3 | Copywriter, Email Sequence Designer | ~5-10 min |
| 4 | Email Personalizer, QA Reviewer, Scheduler | ~5-10 min |

Each agent goes through: Write → Review → Revise (if needed, max 3 rounds) → Approve.

Monitor progress in `logs/bootstrap/progress.md`.

### Step 6: Deploy Agents

```bash
# Linux/Mac
cp agents/*.md .ai/agents/

# Windows
copy agents\*.md .ai\agents\
```

### Step 7: Commit

```bash
git add -A
git commit -m "Onboarded client: my-client"
```

---

## Daily Operations

### Morning Routine

```bash
cd clients/my-client
ai-assistant
```

> "Start the morning routine."

Maestro runs the full sequence:

1. **Analyst** — Reviews yesterday's metrics
2. **Market Intelligence** — Scans for industry news
3. **Lead Researcher / Regional Scouts** — Find new leads
4. **Pipeline Tracker** — Updates lead positions in funnel
5. **Lead Scorer** — Scores and segments new leads
6. **Content Strategist** — Plans content for the day
7. **Copywriter** — Writes content and email templates
8. **Email Sequence Designer** — Architects new campaigns
9. **Email Personalizer** — Personalizes emails per recipient
10. **QA Reviewer** — Reviews all content (QA loop, max 3 rounds)
11. **Scheduler** — Queues approved emails for sending

### Review Morning Briefing

After the routine completes, Maestro produces a morning briefing with:
- Key metrics from yesterday
- Hot leads requiring attention
- Content produced and queued
- Alerts and recommendations

### Ad-Hoc Commands During the Day

| Command | What It Does |
|---------|-------------|
| "Research {company-name}" | Lead Researcher investigates a specific company |
| "Score the new leads" | Lead Scorer processes unscored leads |
| "Write a blog post about {topic}" | Content pipeline: Strategist → Copywriter → QA |
| "Check pipeline status" | Pipeline Tracker generates current snapshot |
| "Send me the daily report" | Analyst generates performance report |
| "Find leads in {region}" | Regional Coordinator dispatches scouts |

### End of Day

> "Generate the daily report."

```bash
git add -A
git commit -m "Daily operations: my-client - $(date +%Y-%m-%d)"
```

---

## Weekly Cycle

> "Generate the weekly performance report with regional breakdown."

The Analyst produces:
- Segment comparison (which segments perform best)
- Sequence performance (which email sequences convert)
- Regional metrics (leads found, response rates by region)
- Top-performing leads
- Optimization recommendations

---

## Monthly Cycle

> "Generate the monthly strategic report."

The Analyst produces:
- ROI analysis
- Pipeline value assessment
- Regional review with rebalancing recommendations
- Strategic recommendations for next month

After the monthly report, the Regional Coordinator reviews and rebalances regional quotas.

---

## Regional Operations

### Setting Up Regional Prospecting

After bootstrap, tell the AI assistant:
> "Set up regional prospecting for our target markets."

The Regional Coordinator will:
1. Read ICP geography from `company-profile.yaml`
2. Allocate daily quotas across regions
3. Generate scout briefs for each region

### Running Regional Scouts

> "Run regional scouts for all target regions."

Or for a specific region:
> "Run regional scout for the DACH region."

### Rebalancing Regions

> "Rebalance regional quotas based on last month's performance."

---

## Troubleshooting

### Agent Not Triggering

Ensure agents are deployed to `.ai/agents/`:
```bash
ls .ai/agents/
```

If empty, redeploy:
```bash
cp agents/*.md .ai/agents/
```

### Bootstrap Stalled

Check progress:
```bash
cat logs/bootstrap/progress.md
```

If an agent is stuck in revision loops, tell the AI assistant:
> "Escalate {agent-name} and continue with the next agent."

### Low Quality Scores

If QA keeps rejecting content:
1. Review `config/company-profile.yaml` brand voice section
2. Ensure tone descriptions are specific enough
3. Check prohibited terms list
4. Adjust `min_quality_score` in system limits if appropriate

### Missing Data

All data is in Git. If files are missing:
```bash
git log --oneline -20
git diff HEAD~1
```

### Schema Validation Errors

If an agent produces invalid output:
1. Check `config/shared-schemas.json` for the expected format
2. Review the agent's output specification in its `.md` file
3. Re-run the agent with explicit instructions to follow the schema
