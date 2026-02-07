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

### Discovery & Regional Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Discovery Agent** | `config/company-profile.yaml` | YAML (template) | Fixed name |
| **Discovery Agent** | `config/discovery-report.md` | Markdown | Fixed name |
| **Regional Coordinator** | `data/regional/strategy.json` | RegionalStrategy | Fixed name |
| **Regional Coordinator** | `data/regional/briefs/scout-brief-{region-id}.json` | ScoutBrief | By region |
| **Regional Scout** | `data/leads/L-YYYY-NNNN.json` | LeadProfile | Sequential ID |
| **Regional Scout** | `logs/operations/regional-scout-{region}-{date}.json` | Log | By region + date |

### Core Operational Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Maestro** | Morning briefing (stdout) | Markdown | — |
| **Market Intelligence** | `data/reports/daily/intel-{date}.json` | MarketIntelReport | By date |
| **Lead Researcher** | `data/leads/L-YYYY-NNNN.json` | LeadProfile | Sequential ID |
| **Analyst** | `data/reports/daily/{date}.json` | DailyAnalyticsReport | By date |
| **Analyst** | `data/reports/weekly/{date}.json` | DailyAnalyticsReport | By week-end date |
| **Analyst** | `data/reports/monthly/{date}.json` | DailyAnalyticsReport | By month-end date |
| **Lead Scorer** | `data/leads/L-YYYY-NNNN.json` | LeadProfile (update) | Existing files |
| **Lead Scorer** | `data/segments/{segment}.json` | Segment list | By segment name |
| **Pipeline Tracker** | `data/pipeline/status-{date}.json` | PipelineStatusReport | By date |

### Content & Creative Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Content Strategist** | `data/content/briefs/BRF-YYYY-NNNN.json` | ContentBrief | Sequential ID |
| **Copywriter** | `data/content/drafts/{brief-id}-draft.md` | Markdown | By brief ID |
| **Copywriter** | `data/emails/templates/{template-id}.md` | Markdown | By template ID |
| **Landing Page Agent** | `data/landing-pages/LP-YYYY-NNNN.html` | HTML | Sequential ID |
| **Landing Page Agent** | `data/landing-pages/LP-YYYY-NNNN-thankyou.html` | HTML | Sequential ID |
| **Landing Page Agent** | `data/landing-pages/LP-YYYY-NNNN-spec.json` | LandingPageSpec | Sequential ID |
| **Video Script Agent** | `data/video/scripts/VID-YYYY-NNNN.md` | Markdown | Sequential ID |
| **Video Script Agent** | `data/video/scripts/VID-YYYY-NNNN-spec.json` | VideoScriptBrief | Sequential ID |
| **Video Script Agent** | `data/video/webinars/WEB-YYYY-NNNN.md` | Markdown | Sequential ID |

### Outreach Channel Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Email Sequence Designer** | `data/emails/sequences/SEQ-YYYY-NNNN.json` | EmailSequenceConfig | Sequential ID |
| **Email Personalizer** | `data/emails/personalized/L-YYYY-NNNN-step{N}.md` | Markdown | By lead + step |
| **LinkedIn Outreach** | `data/linkedin/sequences/LI-SEQ-YYYY-NNNN.json` | LinkedInOutreachSequence | Sequential ID |
| **LinkedIn Outreach** | `data/linkedin/messages/L-YYYY-NNNN-step{N}.md` | Markdown | By lead + step |
| **Social Media Manager** | `data/social/calendar/social-calendar-{week}.json` | SocialMediaCalendar | By week |
| **Social Media Manager** | `data/social/posts/{platform}/{date}-{post-id}.md` | Markdown | By platform + date |
| **Paid Media Agent** | `data/ads/campaigns/AD-YYYY-NNNN.json` | AdCampaignConfig | Sequential ID |
| **Paid Media Agent** | `data/ads/creatives/AD-YYYY-NNNN-creative-{N}.md` | Markdown | By campaign + number |
| **Paid Media Agent** | `data/ads/audiences/AUD-YYYY-NNNN.json` | JSON | Sequential ID |

### Quality, Delivery & Orchestration

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **QA Reviewer** | `data/emails/approved/{filename}` | Moved from personalized | Same name |
| **QA Reviewer** | `data/content/approved/{filename}` | Moved from drafts | Same name |
| **QA Reviewer** | `data/social/posts/approved/{filename}` | Moved from posts | Same name |
| **Scheduler** | `data/pipeline/send-log-{date}.json` | SendLog | By date |
| **Multi-Channel Orchestrator** | `data/orchestration/MCO-YYYY-NNNN.json` | MultiChannelSequence | Sequential ID |
| **Multi-Channel Orchestrator** | `data/orchestration/lead-timelines/L-YYYY-NNNN-timeline.json` | JSON | By lead |
| **Multi-Channel Orchestrator** | `data/orchestration/channel-load-{date}.json` | JSON | By date |

### Analytics & Optimization Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **SEO Agent** | `data/seo/keyword-research-{date}.json` | SEOKeywordResearch | By date |
| **SEO Agent** | `data/seo/audit-{date}.json` | JSON | By date |
| **SEO Agent** | `data/seo/content-gap-analysis-{date}.json` | JSON | By date |
| **ABM Coordinator** | `data/abm/accounts/ACC-YYYY-NNNN.json` | ABMAccountPlan | Sequential ID |
| **ABM Coordinator** | `data/abm/buying-committee-maps/ACC-YYYY-NNNN-committee.json` | JSON | By account |
| **ABM Coordinator** | `data/abm/engagement-scores-{date}.json` | JSON | By date |
| **A/B Test Manager** | `data/abtests/AB-YYYY-NNNN.json` | ABTestConfig | Sequential ID |
| **A/B Test Manager** | `data/abtests/results/AB-YYYY-NNNN-results.json` | JSON | By test |
| **Attribution Analyst** | `data/attribution/attribution-{model}-{date}.json` | AttributionReport | By model + date |
| **Attribution Analyst** | `data/attribution/cohort-analysis-{date}.json` | JSON | By date |
| **Attribution Analyst** | `data/attribution/clv-cac-{date}.json` | JSON | By date |
| **Attribution Analyst** | `data/attribution/conversion-paths-{date}.json` | JSON | By date |

### Post-Sale Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Sales Enablement** | `data/sales-enablement/battlecards/BC-{competitor}.md` | Markdown | By competitor |
| **Sales Enablement** | `data/sales-enablement/proposals/PROP-YYYY-NNNN.md` | Markdown | Sequential ID |
| **Sales Enablement** | `data/sales-enablement/roi-frameworks/ROI-{segment}.md` | Markdown | By segment |
| **Sales Enablement** | `data/sales-enablement/case-studies/CS-YYYY-NNNN.md` | Markdown | Sequential ID |
| **Sales Enablement** | `data/sales-enablement/objection-guides/OBJ-{segment}-{persona}.md` | Markdown | By segment + persona |
| **Sales Enablement** | `data/sales-enablement/meeting-briefs/MB-{lead-id}.md` | Markdown | By lead |
| **Retention & Growth** | `data/retention/campaigns/RET-YYYY-NNNN.json` | RetentionCampaign | Sequential ID |
| **Retention & Growth** | `data/retention/sequences/{type}-{segment}.json` | JSON | By type + segment |
| **Retention & Growth** | `data/retention/surveys/NPS-YYYY-NNNN.json` | JSON | Sequential ID |
| **Retention & Growth** | `data/retention/health-scores-{date}.json` | JSON | By date |

### Meta Agents

| Agent | Output Path | Schema/Format | Naming Convention |
|-------|------------|---------------|-------------------|
| **Bootstrap Orchestrator** | `logs/bootstrap/progress.md` | Markdown/JSON | Fixed name |
| **Bootstrap Orchestrator** | `agents/{agent-name}.md` | Agent MD | kebab-case |
| **Agent Critic** | `reviews/round-{N}/{agent-name}-review.json` | QAReviewReport | By round + agent |

---

## ID Format Reference

| ID Type | Pattern | Example | Used In |
|---------|---------|---------|---------|
| Lead ID | `L-YYYY-NNNN` | `L-2025-0042` | LeadProfile |
| Sequence ID | `SEQ-YYYY-NNNN` | `SEQ-2025-0003` | EmailSequenceConfig |
| Brief ID | `BRF-YYYY-NNNN` | `BRF-2025-0015` | ContentBrief |
| Review ID | `QA-YYYY-NNNN` | `QA-2025-0008` | QAReviewReport |
| LinkedIn Seq | `LI-SEQ-YYYY-NNNN` | `LI-SEQ-2025-0001` | LinkedInOutreachSequence |
| A/B Test ID | `AB-YYYY-NNNN` | `AB-2025-0012` | ABTestConfig |
| Landing Page | `LP-YYYY-NNNN` | `LP-2025-0005` | LandingPageSpec |
| Account ID | `ACC-YYYY-NNNN` | `ACC-2025-0003` | ABMAccountPlan |
| Ad Campaign | `AD-YYYY-NNNN` | `AD-2025-0007` | AdCampaignConfig |
| Video Script | `VID-YYYY-NNNN` | `VID-2025-0004` | VideoScriptBrief |
| Retention | `RET-YYYY-NNNN` | `RET-2025-0002` | RetentionCampaign |
| Multi-Channel | `MCO-YYYY-NNNN` | `MCO-2025-0001` | MultiChannelSequence |
