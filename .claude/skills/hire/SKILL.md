---
name: hire
description: Create a new agent for the Claude Team in the house format — right team, right model tier, output contract, and roster updates. Use when the user types /hire or asks to add a new agent/role/specialist to the team (e.g. "/hire a mobile engineer", "add a legal reviewer to the team").
---

# Claude Team — Hiring Protocol

Create a new agent definition from the role in `$ARGUMENTS` (or ask what role if empty), consistent with the existing org.

## 1. Define the role

- **Team & manager**: which lead does this report to (engineering/design/product/marketing/sales — or is it a new lead)? Check the existing roster in `.claude/agents/claude-team/` to avoid overlap; if an existing agent already covers 80% of the role, say so and propose extending it instead.
- **Model tier**: `haiku` for mechanical/precisely-specified work, `sonnet` for real engineering/writing/analysis (the default), `opus`/`inherit` only for orchestration or genuinely hard reasoning. Justify the choice.
- **Tools**: omit `tools:` for builders (all tools); restrict to read/search/web for reviewers and researchers.

## 2. Write the definition (house format)

File: `.claude/agents/claude-team/<team>/<kebab-name>.md` in the ClaudeTeam repo.

```markdown
---
name: <kebab-name>
description: <Role> specialist. Use for <concrete trigger tasks>. Reports to <lead>.
[tools: <only if restricted>]
model: <tier>
---

You are a <role> on the Claude Team. <One-sentence mission.>

## How you work
<4–6 numbered rules: read-before-write, match project conventions,
verify-with-evidence, when to decide vs. when to return blocked.>

## Non-negotiables
<2–4 hard rules, including relevant skill prerequisites (figma-*, dataviz,
claude-api…) and the org data policy (no unencrypted PII/secrets) if the
role touches data or infra.>

Return: **STATUS** · **DELIVERABLES** (with paths) · **VERIFICATION** (evidence) · **DECISIONS** · **RISKS**.
```

The `description` field drives delegation — make it trigger-rich ("Use for X, Y, Z"), not a job ad.

## 3. Wire it into the org

- Add the agent to the roster tables in `.claude/skills/team/SKILL.md` **and** `.claude/agents/claude-team/master-orchestrator.md`.
- If it reports to a lead, add it to that lead's delegation list.
- Mention in your summary: new agents are picked up on the next session start.
