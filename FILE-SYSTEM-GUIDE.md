# File System Guide

Complete reference for every directory and file in the Marketing Automation Agency system.

---

## Root Level

| Path | Type | Purpose |
|------|------|---------|
| `README.md` | Doc | Project overview and quick start |
| `USAGE-GUIDE.md` | Doc | Comprehensive usage instructions |
| `FILE-SYSTEM-GUIDE.md` | Doc | This file — directory reference |
| `FILE-PLACEMENT-MAP.md` | Doc | Quick-reference file placement rules |
| `.gitignore` | Config | Git ignore rules |

---

## `system/` — Shared System Files

**Rule: Never modified per client.** These are templates and shared definitions.

### `system/meta-agents/`

| File | Agent | Purpose |
|------|-------|---------|
| `agent-architect.md` | Agent Architect | Writes agent .md files from specifications |
| `agent-critic.md` | Agent Critic | Reviews agent files against quality framework |
| `agent-bootstrap-orchestrator.md` | Bootstrap Orchestrator | Coordinates agent generation in 4 waves |

### `system/agent-templates/`

| File | Agent | Purpose |
|------|-------|---------|
| `discovery-agent.md` | Discovery Agent | Analyzes client website, generates company profile |
| `regional-coordinator.md` | Regional Coordinator | Manages multi-region prospecting strategy |
| `regional-scout.md` | Regional Scout | Searches for leads in local languages |

### `system/architecture/`

| File | Purpose |
|------|---------|
| `shared-schemas.json` | Canonical JSON schema definitions for all data types |
| `company-profile-template.yaml` | Template for client company profiles |

---

## `scripts/`

| File | Platform | Purpose |
|------|----------|---------|
| `new-client.sh` | Linux/Mac | Creates a new client workspace |
| `new-client.bat` | Windows | Creates a new client workspace |
| `save-all.bat` | Windows | Commits all changes to Git |

---

## `clients/{client-name}/` — Client Workspace

Each client has a fully isolated workspace. Everything below is relative to the client root.

### `config/`

| File | Created By | Purpose |
|------|-----------|---------|
| `company-profile.yaml` | Discovery Agent → Human review | Master configuration — every agent reads this |
| `discovery-report.md` | Discovery Agent | Detailed analysis report with confidence levels |
| `shared-schemas.json` | Copied from system | Local copy of schema definitions |
| `system-architecture.md` | new-client script | Architecture reference for the client workspace |

### `.ai/agents/`

| File | Created By | Purpose |
|------|-----------|---------|
| `*.md` | Copied from `agents/` after bootstrap | AI assistant reads agents from this directory |

### `agents/`

| File Pattern | Created By | Purpose |
|-------------|-----------|---------|
| `maestro.md` | Bootstrap → Architect | Runtime orchestrator |
| `market-intelligence.md` | Bootstrap → Architect | Industry scanning |
| `lead-researcher.md` | Bootstrap → Architect | Lead discovery |
| `analyst.md` | Bootstrap → Architect | Performance measurement |
| `lead-scorer.md` | Bootstrap → Architect | Lead scoring and segmentation |
| `content-strategist.md` | Bootstrap → Architect | Content planning |
| `pipeline-tracker.md` | Bootstrap → Architect | Funnel management |
| `copywriter.md` | Bootstrap → Architect | Content writing |
| `email-sequence-designer.md` | Bootstrap → Architect | Campaign architecture |
| `email-personalizer.md` | Bootstrap → Architect | Email personalization |
| `qa-reviewer.md` | Bootstrap → Architect | Quality assurance |
| `scheduler.md` | Bootstrap → Architect | Send timing management |

### `data/`

#### `data/leads/`
| Pattern | Schema | Created By |
|---------|--------|-----------|
| `L-YYYY-NNNN.json` | LeadProfile | Lead Researcher, Regional Scout |

#### `data/segments/`
| Pattern | Created By |
|---------|-----------|
| `{segment-name}.json` | Lead Scorer |

#### `data/regional/`
| Pattern | Schema | Created By |
|---------|--------|-----------|
| `strategy.json` | RegionalStrategy | Regional Coordinator |
| `briefs/scout-brief-{region-id}.json` | ScoutBrief | Regional Coordinator |

#### `data/content/`
| Directory | Created By | Contents |
|-----------|-----------|----------|
| `briefs/` | Content Strategist | `BRF-YYYY-NNNN.json` (ContentBrief) |
| `drafts/` | Copywriter | Draft content pieces |
| `approved/` | QA Reviewer | Approved content (moved from drafts) |

#### `data/emails/`
| Directory | Created By | Contents |
|-----------|-----------|----------|
| `sequences/` | Email Sequence Designer | `SEQ-YYYY-NNNN.json` (EmailSequenceConfig) |
| `templates/` | Copywriter | Generic email templates |
| `personalized/` | Email Personalizer | `L-YYYY-NNNN-step{N}.md` per recipient |
| `approved/` | QA Reviewer | Approved emails ready to send |

#### `data/pipeline/`
| Pattern | Schema | Created By |
|---------|--------|-----------|
| `status-{date}.json` | PipelineStatusReport | Pipeline Tracker |
| `send-log-{date}.json` | SendLog | Scheduler |

#### `data/reports/`
| Directory | Pattern | Schema | Created By |
|-----------|---------|--------|-----------|
| `daily/` | `{date}.json` | DailyAnalyticsReport | Analyst |
| `daily/` | `intel-{date}.json` | MarketIntelReport | Market Intelligence |
| `weekly/` | `{date}.json` | DailyAnalyticsReport | Analyst |
| `monthly/` | `{date}.json` | DailyAnalyticsReport | Analyst |

### `logs/`

| Directory | Pattern | Created By |
|-----------|---------|-----------|
| `bootstrap/` | `progress.md` | Bootstrap Orchestrator |
| `operations/` | `regional-scout-{region}-{date}.json` | Regional Scout |
| `operations/` | `{agent}-{date}.json` | Various agents |

### `reviews/`

| Directory | Pattern | Schema | Created By |
|-----------|---------|--------|-----------|
| `round-1/` | `{agent-name}-review.json` | QAReviewReport | Agent Critic |
| `round-2/` | `{agent-name}-review.json` | QAReviewReport | Agent Critic |
| `final/` | `{agent-name}-review.json` | QAReviewReport | Agent Critic |

---

## `dashboard/`

Reserved for future monitoring dashboard implementation.
