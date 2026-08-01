---
name: retro
description: Run a retrospective on work the Claude Team just completed — what went well, what failed, and what to change in agent briefs, skills, or process. Use when the user types /retro or asks "what should we learn from that" after a team run.
---

# Claude Team — Retrospective Protocol

Run a retro on the most recent piece of team work in this conversation (or the scope the user names). The output is *changes*, not reflections.

## 1. Reconstruct what happened

From the conversation: what was asked, which agents ran (which models), how many revision loops each package took, what was accepted, what was cut or escalated.

## 2. Judge it honestly

- **Outcome**: did the result meet the original acceptance criteria? Any defects found after acceptance?
- **Process**: which packages needed 2–3 REVISE loops, and was the root cause a vague brief, missing context, wrong specialist, or wrong model tier?
- **Tokens**: was the org right-sized? Flag agents spawned for work one tool call could do, context rediscovered instead of passed in a brief, or heavyweight models on mechanical work.

## 3. Turn every lesson into a change

Each finding becomes exactly one of:

- **Brief fix** — the recurring feedback belongs in the agent's definition file (in the ClaudeTeam repo, `.claude/agents/claude-team/...`). Propose the specific edit; apply it if the repo is accessible.
- **Protocol fix** — the `/team` skill's process failed (triage, context brief, retro loop). Propose the edit.
- **Memory** — a project- or user-specific lesson that doesn't belong in the shared repo: save it to memory (type: feedback, with **Why** and **How to apply**).
- **Follow-up requirement** — a missing tool/integration/permission; add it to the running list for the user.

## 4. Report

**WHAT SHIPPED** · **WHAT WORKED** (keep doing) · **WHAT FAILED** (with root cause) · **CHANGES MADE** (files edited / memories saved) · **CHANGES PROPOSED** (needing user approval).

Keep it under a page. A retro that only produces prose has failed its own acceptance criteria.
