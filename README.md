# Claude Team

A portable library of Claude Code **agents, skills, and orchestration practices** — a full virtual company you install next to any project. A Master Orchestrator (CEO) on your strongest model coordinates nine Sonnet team leads, who manage 19 specialists, with model tiering, retro loops, and token discipline built in.

**The goal:** better results, more consistency, lower token spend, and a repeatable path from idea → built → shipped → sold.

## The org

- **Master Orchestrator** (`inherit` → Fable/Opus) — triage, decomposition, acceptance, synthesis.
- **Engineering** — frontend, backend, devops, qa, data leads + 11 specialists (react-engineer, api-engineer, db-engineer, ci-cd-engineer, infra-engineer, test-engineer, e2e-tester, code-reviewer, ui-stylist, data-analyst, ml-engineer).
- **Design** — design-lead + ui-designer (Figma-native), ux-researcher.
- **Product** — product-lead + market-researcher, spec-writer.
- **Marketing** — marketing-lead + copywriter, seo-specialist.
- **Sales/GTM** — sales-lead + pricing-strategist, pitch-writer.

Full chart and flow: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md). Model tiering & token rules: [docs/MODEL-STRATEGY.md](docs/MODEL-STRATEGY.md). MCP wiring: [docs/INTEGRATIONS.md](docs/INTEGRATIONS.md).

## Install

```bash
git clone <this-repo> ~/Code/ClaudeTeam

# Option A — everywhere (recommended): user-level, available in ALL projects
~/Code/ClaudeTeam/install.sh --user

# Option B — one project only
~/Code/ClaudeTeam/install.sh --project /path/to/project-a

# Add --copy to either mode to copy files instead of symlinking
```

Symlinks are the default so a `git pull` in ClaudeTeam updates every install instantly. Restart Claude Code (or start a new session) after installing.

## Use

```text
/team build a settings page: profile editing, notification prefs, dark mode toggle
```

`/team` activates the Master Orchestrator protocol: triage → context bootstrap (graphify/Explore, once) → work packages with acceptance criteria → parallel delegation to leads → retro loop until evidence says done → one honest synthesis.

You can also address anyone directly — the agents are ordinary Claude Code subagents:

```text
Use the qa-lead agent to review and test my last commit
Use the pricing-strategist agent to price this app
```

Other skills:

- `/retro` — post-mortem the last team run; turns lessons into edits to agent briefs and protocol.
- `/hire <role>` — add a new agent in the house format, wired into the roster.

## Practices baked in

- **Model tiering** — judgment on the big model, execution on Sonnet, mechanical work on Haiku; per-task overrides.
- **Context once** — one graphify/Explore pass becomes a Context Brief reused by every agent. Run `/graphify` on repos you work in often.
- **Evidence-based acceptance** — QA verdicts on pasted output and screenshots, never on "should work".
- **Bounded retro loops** — max 3 revisions, same agent (context preserved via SendMessage), then escalate to you.
- **Safety rails** — deploys/publishes/destructive migrations are always proposals for you; no secrets or PII in outputs.

## Customize

- Edit any agent in [.claude/agents/claude-team/](.claude/agents/claude-team/) — it's just markdown with frontmatter (`name`, `description`, optional `tools`, `model`).
- `/hire` scaffolds new roles consistently; `/retro` tells you what to change.
- New teams = new folder + a lead + a roster row in the `/team` skill and master-orchestrator.

## Requirements

- Claude Code with subagents & skills support.
- Optional but recommended: `graphify` skill, Figma MCP connector, Playwright MCP plugin. See [docs/INTEGRATIONS.md](docs/INTEGRATIONS.md) for connectors that need one-time authorization.
