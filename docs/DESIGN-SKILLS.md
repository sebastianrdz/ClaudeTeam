# Claude Team — Design Craft Stack

Three external skill packs give the team a real craft ceiling for UI work. This file is the
**single source of truth for routing**: which skill owns which job, who loads it, and how they
must not collide. Agent briefs point here instead of repeating it.

## The three packs

| Pack | Skills | Scope | Source |
|---|---|---|---|
| **Impeccable** | `impeccable` (+ `impeccable-finish-reviewer`, `-documenter`, `-asset-producer`, `-manual-edit-applier` agents) | Whole-surface design engine: direction, visual world, layout, typography, color, motion system, a11y/perf audits, design-system extraction | [impeccable.style/designing](https://impeccable.style/designing/) |
| **Emil (design engineering)** | `emil-design-eng`, `animate`, `animate-expo`, `apple-design`, `review-animations`, `improve-animations`, `find-animation-opportunities`, `animation-vocabulary`, `ask-sonner`, `pick-ui-library`, `prototype` | Component-level feel, motion craft, interaction physics, library taste | [emilkowal.ski/skill](https://emilkowal.ski/skill) |
| **Tasteskill** | `design-taste-frontend` + 12 siblings (see below) | Anti-slop landing pages, portfolios, marketing redesigns, style presets, design-reference image generation. **Not** dashboards, data tables, or multi-step product UI | [tasteskill.dev](https://www.tasteskill.dev/) |

## Routing table

| The job | Load | Primary owner |
|---|---|---|
| New screen/app surface, or redesign of one | `impeccable` (`shape` to plan, then ordinary new-work) | `design-lead`, `frontend-lead` |
| Landing page, portfolio, marketing site | `design-taste-frontend` | `marketing-lead` → `frontend-lead` |
| Polish an existing product surface | `impeccable polish` / `bolder` / `quieter` / `distill` / `layout` / `typeset` / `colorize` | `frontend-lead` |
| "Does this component feel right?" | `emil-design-eng` | `react-engineer`, `ui-stylist` |
| Build one animation/transition (web) | `animate` | `motion-engineer` |
| Build motion in React Native / Expo | `animate-expo` | `motion-engineer` |
| Gestures, springs, momentum, sheets, Apple-feel | `apple-design` | `motion-engineer` |
| Review motion in a diff (gate) | `review-animations` — invoke explicitly | `code-reviewer`, `motion-engineer` |
| Audit motion across a codebase, plan fixes | `improve-animations` | `motion-engineer` |
| "What here should animate?" | `find-animation-opportunities` | `motion-engineer`, `design-lead` |
| Name an effect the user described vaguely | `animation-vocabulary` | anyone |
| Toasts (Sonner) | `ask-sonner` | `react-engineer` |
| Pick a UI dependency | `pick-ui-library` — invoke explicitly | `frontend-lead` |
| Explore several visual variants live | `prototype` — invoke explicitly | `ui-designer` |
| UX heuristic critique of an existing UI | `impeccable critique` | `ux-researcher` |
| A11y / performance / responsive audit | `impeccable audit` | `qa-lead` |
| Capture or extract a design system from code | `impeccable document` / `extract` | `design-lead` |
| Figma read/write | `figma:*` (unchanged, still mandatory before Figma tools) | `ui-designer`, `design-lead` |
| Charts | `dataviz` (unchanged) | `react-engineer`, `data-analyst` |

`review-animations`, `pick-ui-library`, and `prototype` ship with `disable-model-invocation` — they
never auto-trigger. Call them by name through the Skill tool when the routing table says so.

## The Tasteskill family

Installing Tasteskill installs 13 skills, not one. Only `design-taste-frontend` is a default route;
the rest are opt-in and several will fight the rest of the stack if an agent picks them up on its own.

| Skill | What it is | Team routing |
|---|---|---|
| `design-taste-frontend` | The default: anti-slop landing pages, portfolios, redesigns | **Auto-route** for landing/portfolio surfaces |
| `redesign-existing-projects` | Scan an existing codebase, strip generic AI patterns, lift quality without breaking function | Opt-in alternative to `impeccable` for a redesign of *non-product* surfaces |
| `high-end-visual-design`, `minimalist-ui`, `industrial-brutalist-ui`, `gpt-taste` | **Aesthetic direction presets** — each pins a specific look (agency-maximal, editorial-minimal, brutalist, GSAP-motion-heavy) | **User-pinned only.** An agent never picks one unsolicited |
| `imagegen-frontend-web`, `imagegen-frontend-mobile`, `brandkit` | Generate design *reference images* (no code) | `ui-designer`, `marketing-lead` — when there's no Figma file and the user wants comps |
| `image-to-code` | Generate a reference image, then implement it | `ui-designer` → `frontend-lead`, image-first flows only |
| `stitch-design-taste` | Writes a `DESIGN.md` for Google Stitch | **Quarantined** — see collision rule 3 |
| `full-output-enforcement` | Anti-truncation directive, not a design skill | Opt-in, only for genuinely long single-file generation |
| `design-taste-frontend-v1` | Legacy v1, kept for back-compat | Ignore unless a project depends on v1 behavior |

## Collision rules (read before loading anything)

1. **One direction-setter per surface.** `impeccable`, `design-taste-frontend`,
   `redesign-existing-projects`, and every style preset (`high-end-visual-design`, `minimalist-ui`,
   `industrial-brutalist-ui`, `gpt-taste`) each decide a visual world. Exactly one may run on a
   surface. Product UI → Impeccable. Landing/portfolio → Tasteskill. When a product has both, they
   are separate surfaces with separate briefs.
   **Style presets are user-pinned, never agent-chosen.** An agent that loads `industrial-brutalist-ui`
   because it seemed cool has overridden the client's brief — that is a defect, not initiative. If the
   user pinned a preset, it *replaces* the direction-setter above; it does not stack on top of one.
2. **Two skills are named "animate".** `/impeccable animate <target>` designs a surface's motion
   *system*; the Emil `animate` skill builds *one* interaction well. Surface-level direction first,
   component implementation second — never the reverse.
3. **Impeccable owns `PRODUCT.md` and `DESIGN.md`.** No other skill or agent rewrites them. Run
   `<impeccable-skill-dir>/scripts/impeccable context` once per session from the project root; do
   not rerun it per agent or per subagent.
   **`stitch-design-taste` also writes a `DESIGN.md` and calls it the single source of truth** — it
   will silently overwrite Impeccable's. Use it *only* in a project that has no Impeccable artifacts
   and is actually targeting Google Stitch. Never in a project the team builds with `impeccable`.
4. **`frontend-design:frontend-design` is now the fallback**, used only when `impeccable` isn't
   installed in the environment.
5. **Restraint is the default.** Emil's premise — most things should not animate. An agent that
   adds motion everywhere has failed, not delivered. `gpt-taste` pulls hard the other way (mandatory
   GSAP ScrollTriggers, pinning, scrubbing) and will fight `motion-engineer`'s review gate. Treat it
   as a pinned preset for one marketing surface, not as a motion standard — and when it is pinned,
   `review-animations` still gates the diff.
6. **Load one, not four.** These skills are large. Pick the single skill the routing table names
   for the job at hand; loading the whole stack per task is the most expensive mistake available.
7. **Craft skills never override the project.** An existing design system, token set, or Figma
   library still wins. These skills raise the ceiling inside the project's constraints.

## Handoff shape

A UI work package from the Master Orchestrator or a lead should name the craft skill explicitly:

> **Craft:** `impeccable polish` on `src/app/settings/` · motion review required (`review-animations`)

Agents that receive no craft directive use the routing table and state their choice in DECISIONS.

## Install status

These are user-level skills, not vendored into this repo — they update independently.

| Pack | Installed at | Status |
|---|---|---|
| Impeccable | `~/.claude/skills/impeccable` + `~/.claude/agents/impeccable-*.md` | Installed (user-level) |
| Emil | `~/.claude/skills/*` → `~/.agents/skills/*` (from `emilkowalski/skill`) | Installed (user-level) — 11 skills |
| Tasteskill | `~/.claude/skills/*` → `~/.agents/skills/*` | Installed (user-level) — 13 skills; only `design-taste-frontend` is auto-routed |

Agents degrade gracefully: if the routed skill isn't available, do the work with the fallback,
and list the missing skill under FOLLOW-UP REQUIREMENTS rather than failing the package.
