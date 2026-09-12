# Claude Team — Integrations & Follow-up Requirements

Which MCP servers / plugins each team uses, and what needs action from you.

## Working now (no action needed)

| Integration | Used by | Notes |
|---|---|---|
| **Figma MCP** (claude.ai connector) | design-lead, ui-designer, frontend-lead, react-engineer | Connected. Agents load the mandatory `figma-*` skills before calling Figma tools. |
| **Playwright MCP** (plugin) | e2e-tester, qa-lead, ux-researcher | Browser automation for E2E verification and UI audits. |
| **WebSearch / WebFetch** (built-in) | market-researcher, seo-specialist, pricing-strategist, ux-researcher | Research backbone. |
| **graphify** (skill, `~/.claude/skills/graphify`) | Master Orchestrator context bootstrap | Run `/graphify` once per project you work on repeatedly; the team queries the graph instead of re-reading files. |
| **Impeccable** (skill + 4 agents, user-level) | design-lead, frontend-lead, ui-designer, ux-researcher, qa-lead | Whole-surface design engine (`shape`, `polish`, `critique`, `audit`, `document`…). Routing: `docs/DESIGN-SKILLS.md`. |
| **Emil design-engineering pack** (skills, user-level) | motion-engineer, react-engineer, frontend-lead, code-reviewer | `emil-design-eng`, `animate`, `animate-expo`, `apple-design`, `review-animations`, `improve-animations`, `ask-sonner`, `pick-ui-library`, `prototype`. |
| **Tasteskill family** (13 skills, user-level) | marketing-lead, frontend-lead, ui-designer | `design-taste-frontend` is the only auto-routed one. Style presets (`minimalist-ui`, `industrial-brutalist-ui`, `high-end-visual-design`, `gpt-taste`) are **user-pinned only**; `stitch-design-taste` is quarantined (it overwrites Impeccable's `DESIGN.md`). See `docs/DESIGN-SKILLS.md`. |

## ⚠️ Needs your authorization (follow-up requirements)

These claude.ai connectors exist in your session but are **not yet authorized**. Authorize the ones you want via your claude.ai connector settings (or `/mcp` in an interactive Claude Code session). Until then, agents will produce the work but list the integration step as a follow-up instead of executing it.

| Connector | Would unlock | Priority for "build & sell apps" |
|---|---|---|
| **Vercel** | devops-lead / infra-engineer deploy & inspect hosting directly | High |
| **Supabase** | backend-lead / db-engineer manage DB, auth, storage | High |
| **Linear** (or Atlassian/Jira) | product-lead files and tracks work items from specs | Medium |
| **Slack** | team posts summaries/updates to your channels | Medium |
| **Notion** | spec-writer publishes specs/docs to your workspace | Medium |
| **HubSpot** | sales-lead / marketing-lead manage contacts & campaigns | Low (until you have users) |
| **Canva** | marketing visual assets beyond Figma | Low |
| **Stripe** (not yet connected) | pricing-strategist wires real payments — needs an MCP server or API setup when you get there | Later |

## Conventions for agents

- If a needed connector isn't authorized, **don't fail** — produce the artifact (config, spec, copy) and add the authorization to FOLLOW-UP REQUIREMENTS in your report.
- External side effects (deploys, posts, sends, listing submissions) are always proposals for the user, even when the connector is authorized.
- Org data policy applies everywhere: no unencrypted PII, internal IP schemes, or raw firewall configs in chats — placeholders only.

## Adding a new integration

1. Connect the MCP server (claude.ai connectors, or `claude mcp add` for local servers).
2. Note which agents should use it in their definition files ("load schemas via ToolSearch if deferred").
3. Add a row here, and any usage rules to the relevant lead's prompt.
