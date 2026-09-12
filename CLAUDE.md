# ClaudeTeam repo

This repo IS the Claude Team library — agents in `.claude/agents/claude-team/`, skills in `.claude/skills/`, docs in `docs/`. When working here you are usually *editing the org itself*, not using it.

## House rules for editing agents

- Format: markdown + frontmatter (`name`, `description`, optional `tools`, `model`). Follow the template in `.claude/skills/hire/SKILL.md`.
- `description` drives auto-delegation — keep it trigger-rich ("Use for X, Y, Z. Reports to <lead>."), concrete, and short.
- Model tiers: master = `inherit`; leads = `sonnet`; specialists = `sonnet`, mechanical roles = `haiku`. Justify any deviation in the PR/commit.
- Every agent ends with an explicit output contract (STATUS · DELIVERABLES · VERIFICATION · DECISIONS · RISKS or role-appropriate variant).
- Design/frontend agents route craft work through `docs/DESIGN-SKILLS.md` — that file is the single source of truth. Point at it; don't re-explain the routing inside an agent brief, and don't add a skill reference to an agent without adding its row there.
- Leads must keep the dual-mode paragraph ("delegate when you can, execute when you must") — subagent nesting isn't guaranteed in every environment.
- Adding/renaming an agent? Update BOTH roster tables: `.claude/skills/team/SKILL.md` and `.claude/agents/claude-team/master-orchestrator.md`, plus the managing lead's delegation list and `docs/ARCHITECTURE.md`.

## Conventions

- Keep agent files under ~50 lines of body — long prompts dilute; specifics beat volume.
- No secrets, PII, tokens, or internal network details anywhere in this repo (it gets symlinked everywhere).
- Installed via `install.sh` (symlinks by default) — don't rename `.claude/agents/claude-team/` or skill folders without updating the script.
