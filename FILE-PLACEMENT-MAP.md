# File Placement Map

Quick-reference: which agent writes to which path.

---

## Placement Rules

1. **All paths are relative** to the client workspace root (`clients/{client-name}/`)
2. **Never use absolute paths** in agent files
3. **One agent writes, many read** — each file has exactly one owner
4. **Git is the database** — commit after every session

---

## By Agent → Output Files

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Discovery Agent** | `config/company-profile.yaml` | YAML (template) | Fixed name |
| **Discovery Agent** | `config/discovery-report.md` | Markdown | Fixed name |
| **Bootstrap Orchestrator** | `logs/bootstrap/progress.md` | Markdown/JSON | Fixed name |
| **Bootstrap Orchestrator** | `agents/{agent-name}.md` | Agent MD | kebab-case |
| **Agent Critic** | `reviews/round-{N}/{agent-name}-review.json` | QAReviewReport | By round + agent |
| **Regional Coordinator** | `data/regional/strategy.json` | RegionalStrategy | Fixed name |
| **Regional Coordinator** | `data/regional/briefs/scout-brief-{region-id}.json` | ScoutBrief | By region |
| **Regional Scout** | `data/leads/L-YYYY-NNNN.json` | LeadProfile | Sequential ID |
| **Regional Scout** | `logs/operations/regional-scout-{region}-{date}.json` | Log | By region + date |
| **Lead Researcher** | `data/leads/L-YYYY-NNNN.json` | LeadProfile | Sequential ID |
| **Market Intelligence** | `data/reports/daily/intel-{date}.json` | MarketIntelReport | By date |
| **Analyst** | `data/reports/daily/{date}.json` | DailyAnalyticsReport | By date |
| **Analyst** | `data/reports/weekly/{date}.json` | DailyAnalyticsReport | By week-end date |
| **Analyst** | `data/reports/monthly/{date}.json` | DailyAnalyticsReport | By month-end date |
| **Lead Scorer** | `data/leads/L-YYYY-NNNN.json` | LeadProfile (update) | Existing files |
| **Lead Scorer** | `data/segments/{segment}.json` | Segment list | By segment name |
| **Content Strategist** | `data/content/briefs/BRF-YYYY-NNNN.json` | ContentBrief | Sequential ID |
| **Pipeline Tracker** | `data/pipeline/status-{date}.json` | PipelineStatusReport | By date |
| **Copywriter** | `data/content/drafts/{brief-id}-draft.md` | Markdown | By brief ID |
| **Copywriter** | `data/emails/templates/{template-id}.md` | Markdown | By template ID |
| **Email Sequence Designer** | `data/emails/sequences/SEQ-YYYY-NNNN.json` | EmailSequenceConfig | Sequential ID |
| **Email Personalizer** | `data/emails/personalized/L-YYYY-NNNN-step{N}.md` | Markdown | By lead + step |
| **QA Reviewer** | `data/emails/approved/{filename}` | Moved from personalized | Same name |
| **QA Reviewer** | `data/content/approved/{filename}` | Moved from drafts | Same name |
| **Scheduler** | `data/pipeline/send-log-{date}.json` | SendLog | By date |

---

## By File → Reading Agents

| File/Pattern | Read By |
|-------------|---------|
| `config/company-profile.yaml` | ALL agents |
| `config/shared-schemas.json` | ALL agents (reference) |
| `data/leads/L-YYYY-NNNN.json` | Lead Scorer, Email Personalizer, Pipeline Tracker, Analyst, Maestro |
| `data/segments/*.json` | Content Strategist, Email Sequence Designer, Analyst |
| `data/regional/strategy.json` | Regional Scout, Analyst, Maestro |
| `data/regional/briefs/*.json` | Regional Scout |
| `data/content/briefs/*.json` | Copywriter |
| `data/content/drafts/*.md` | QA Reviewer |
| `data/emails/sequences/*.json` | Email Personalizer, Scheduler |
| `data/emails/templates/*.md` | Email Personalizer |
| `data/emails/personalized/*.md` | QA Reviewer, Scheduler |
| `data/emails/approved/*.md` | Scheduler |
| `data/pipeline/status-*.json` | Analyst, Maestro |
| `data/pipeline/send-log-*.json` | Analyst, Pipeline Tracker |
| `data/reports/daily/*.json` | Maestro, Content Strategist |
| `data/reports/daily/intel-*.json` | Content Strategist, Lead Researcher |

---

## ID Format Reference

| ID Type | Pattern | Example | Used In |
|---------|---------|---------|---------|
| Lead ID | `L-YYYY-NNNN` | `L-2025-0042` | LeadProfile |
| Sequence ID | `SEQ-YYYY-NNNN` | `SEQ-2025-0003` | EmailSequenceConfig |
| Brief ID | `BRF-YYYY-NNNN` | `BRF-2025-0015` | ContentBrief |
| Review ID | `QA-YYYY-NNNN` | `QA-2025-0008` | QAReviewReport |
