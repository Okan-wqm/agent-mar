# Marketing Automation Agency System

A multi-client marketing automation platform powered by AI agents. The system provides B2B lead generation, cold email campaigns, content marketing, market intelligence, and pipeline management services to multiple clients through 15+ specialized AI agents.

## Quick Start

### 1. Create a New Client

```bash
# Linux/Mac
./scripts/new-client.sh acme-corp

# Windows
scripts\new-client.bat acme-corp
```

### 2. Run Discovery

```bash
cd clients/acme-corp
ai-assistant
```

Tell the Discovery Agent:
> "Analyze https://acme-corp.com and build the company profile."

### 3. Review & Correct Profile

Review `config/discovery-report.md` and correct `config/company-profile.yaml`, especially fields marked as LOW confidence.

### 4. Bootstrap Agents

Tell the Bootstrap Orchestrator:
> "Start the bootstrap orchestrator. Generate all 12 marketing agent files."

Wait for 4 waves of iterative agent generation (20-40 minutes).

### 5. Deploy Agents

```bash
# Linux/Mac
cp agents/*.md .ai/agents/

# Windows
copy agents\*.md .ai\agents\
```

### 6. Run Daily Operations

```bash
cd clients/acme-corp
ai-assistant
```

> "Start the morning routine."

## Architecture

### Three Layers

| Layer | Agents | Purpose |
|-------|--------|---------|
| **Meta** | Agent Architect, Agent Critic, Bootstrap Orchestrator | Generate and quality-check operational agents |
| **Discovery & Regional** | Discovery Agent, Regional Coordinator, Regional Scout | Client onboarding and multi-language lead research |
| **Operational** | 12 agents (Maestro through Scheduler) | Daily marketing operations |

### Agent Flow

```
User → Discovery Agent → company-profile.yaml
     → Bootstrap Orchestrator → 12 operational agents
     → Maestro → daily operations pipeline
```

### Operational Pipeline (Daily)

```
Analyst → Market Intelligence → Lead Researcher/Regional Scouts
→ Pipeline Tracker → Lead Scorer → Content Strategist
→ Copywriter → Email Sequence Designer → Email Personalizer
→ QA Reviewer → Scheduler
```

## Directory Structure

```
marketing-agency/
├── system/                    # Shared system files (never modified per client)
│   ├── meta-agents/           # Architect, Critic, Bootstrap Orchestrator
│   ├── agent-templates/       # Discovery, Regional Coordinator, Regional Scout
│   └── architecture/          # Schemas and templates
├── scripts/                   # Client management scripts
├── clients/                   # One subfolder per client (fully isolated)
│   └── {client}/
│       ├── .ai/agents/        # Deployed agent definitions
│       ├── config/            # Company profile and schemas
│       ├── agents/            # Generated agent .md files
│       ├── data/              # All operational data
│       ├── logs/              # Bootstrap and operation logs
│       └── reviews/           # Agent review reports
└── dashboard/                 # (Future) monitoring dashboard
```

See [FILE-SYSTEM-GUIDE.md](FILE-SYSTEM-GUIDE.md) for detailed directory documentation.
See [FILE-PLACEMENT-MAP.md](FILE-PLACEMENT-MAP.md) for the exact file placement reference.
See [USAGE-GUIDE.md](USAGE-GUIDE.md) for comprehensive usage instructions.

## Multi-Language Support

Regional Scouts search for leads in 7 languages:
- **German** (DACH region)
- **Italian** (Italy)
- **Spanish** (Spain & Latin America)
- **French** (France & Belgium)
- **Portuguese** (Portugal & Brazil)
- **Dutch** (Netherlands & Belgium)
- **Turkish** (Turkey)

All outputs are produced in English regardless of research language.

## Data Schemas

All agents communicate through structured JSON files conforming to schemas in `system/architecture/shared-schemas.json`:

- **LeadProfile** — Individual lead records
- **EmailSequenceConfig** — Multi-step email campaigns
- **QAReviewReport** — Quality assessments
- **ContentBrief** — Content production instructions
- **PipelineStatusReport** — Daily funnel snapshots
- **MarketIntelReport** — Industry intelligence
- **DailyAnalyticsReport** — Performance metrics
- **SendLog** — Email dispatch records
- **RegionalStrategy** — Multi-region prospecting plans
- **ScoutBrief** — Regional Scout dispatch instructions

## Critical Rules

1. Always `cd` into the client folder before running the AI assistant
2. Always `git commit` after every session — Git is the database
3. All agent outputs are in English
4. All file paths are relative to the client workspace root
5. No agent calls another directly — all coordination through Maestro or Bootstrap Orchestrator
6. QA feedback loop applies to both agent generation and content production (max 3 rounds)
7. Client data is fully isolated — no cross-client data access

## Compliance

The system supports GDPR, CAN-SPAM, and KVKK compliance. Each client's compliance configuration is set in their `company-profile.yaml`. All emails include mandatory elements (unsubscribe link, company name, physical address).
