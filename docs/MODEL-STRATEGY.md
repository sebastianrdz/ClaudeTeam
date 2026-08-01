# Claude Team — Model & Token Strategy

## Tiering

| Layer | Model | Why |
|---|---|---|
| Master Orchestrator | `inherit` (your session model — Fable or Opus) | Decomposition, judgment, and final review are where the top model pays for itself. `inherit` means it automatically uses the best model you're running. |
| Team leads (9) | `sonnet` | Planning, briefing, and reviewing scoped work is squarely Sonnet territory — near-Opus quality on structured tasks at a fraction of the cost. |
| Specialists | `sonnet` (default) | Real engineering/writing/analysis against a precise brief. |
| Mechanical specialists | `haiku` (`ui-stylist`; override others per task) | Precisely-specified execution — token-exact and fast. |

### Per-task overrides

Tiers are defaults, not law. The Agent tool's `model` option overrides per spawn:

- Downgrade to `haiku`: renames, config churn, running scripted test plans, format conversions.
- Upgrade to `opus`/`fable`: gnarly debugging, security-sensitive review, architecture calls.

The Master Orchestrator's rule of thumb: **pay for judgment, not for typing.**

## Token-efficiency rules (baked into the /team skill)

1. **Triage before org.** Trivial task → zero agents. Single-discipline → one lead. The org is for cross-functional work.
2. **Context bootstrap once.** One graphify query or Explore pass → a ≤300-word Context Brief reused everywhere. N agents must never independently rediscover the codebase (the single biggest token leak in naive multi-agent setups).
3. **graphify first.** If `graphify-out/` exists, query the knowledge graph instead of re-reading files. For projects you'll work on repeatedly, run `/graphify` once up front — it amortizes across every future team run.
4. **Briefs, not dumps.** Pass paths and pointers; agents read only what they touch.
5. **Reuse running agents.** Revisions go to the same agent via SendMessage — its context is already paid for. Respawning re-buys it.
6. **Bounded retro loops.** Max 3 revisions, then escalate. Also: one good review pass is cheaper than three blind revision loops.
7. **Restricted toolsets** for reviewers/researchers (read-only) keep them from wandering into expensive side quests.
8. **Parallelize independent packages** — same tokens, much less wall-clock time.

## Cost intuition

A full cross-functional run (orchestrator + 3 leads + 5 specialists + QA loop) is real money on every invocation — which is exactly why triage is step 0 and why leads are Sonnet rather than Opus. In practice most day-to-day tasks should resolve as "one Sonnet lead + review", with the full org reserved for ship-a-feature or launch-a-product missions.

Check current per-model pricing with the `claude-api` skill rather than hardcoding numbers here — pricing moves.
