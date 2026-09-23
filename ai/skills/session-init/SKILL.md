---
name: session-init
description: Entry point for a session. Asks which of the three workflows this session needs — checklist-workflow, adhoc-workflow, or spec-workflow — then routes to it. Use this first, before any other work, whenever the workflow for the session hasn't already been decided. Do not use mid-session once a workflow has already been picked.
---

Every session picks a workflow before any work happens. That's your only job: ask, then route. You don't do the work yourself.

## Ask

Use `AskUserQuestion`: "Which workflow does this session need?"
- **checklist-workflow** — multi-step work, tracked in `checklist_<concern>.md`, executed task by task with review and escalation.
- **adhoc-workflow** — small or exploratory work where dispatching would cost more than the task itself.
- **spec-workflow** — not built yet (see below).

## Route

**checklist-workflow:**
1. `Glob` for `checklist_*.md`.
2. If one matches the concern, immediately call `Skill` with `skill: workflow-checklist-orchestrator` — do not ask the user anything first, it handles confirming scope from there.
3. If none matches, immediately call `Skill` with `skill: workflow-checklist-writer` — do not ask the user what the concern is yourself, that skill's job is to ask it. Once it's written the file, tell the user it's ready for `workflow-checklist-orchestrator` — don't chain that invocation automatically; let a checklist get reviewed before it's run.

In both cases, calling the `Skill` tool is the next action, not a sentence describing what you're about to do.

**adhoc-workflow:**
Proceed directly — no checklist, no sub-agent chain.

**spec-workflow:**
Not built yet. Say so, and describe the intended chain so whoever builds it doesn't have to rediscover it: write/review a spec doc first (reusing `workflow-spec-writer` once it exists), then generate a checklist from it (reusing `workflow-checklist-writer`), then run `workflow-checklist-orchestrator` on that checklist. Ask the user whether to fall back to checklist-workflow or adhoc-workflow for now, or stop here.

## Style

Ask once, route, stop narrating. Match the user's brevity standard.
