---
name: toidiu-workflow-checklist-writer
description: Turns a new concern into a checklist_<concern>.md file. Ask clarifying questions before writing anything, draft the milestone/task breakdown, then confirm it with the user before finalizing. Use when starting a checklist-driven session for a concern that has no checklist_*.md yet, or when a checklist needs to be rewritten from scratch. Do not use to update or execute an existing checklist — that's `toidiu-workflow-checklist-orchestrator`'s job.
---

You write `checklist_<concern>/checklist_<concern>.md` in the project root: one folder per checklist, holding the checklist and every sub-agent artifact for it. You do not execute tasks or dispatch sub-agents — that is `toidiu-workflow-checklist-orchestrator`'s job. Your only output is that folder with a checklist the orchestrator can run from.

## Folder layout

```
checklist_<concern>/
  checklist_<concern>.md      the checklist
  results/                    one file per sub-agent dispatch, written by the orchestrator's sub-agents
```

Create the folder and an empty `results/` when you write the checklist. If the checklist comes from a spec, the first `## Context` line names the spec path (`spec_<concern>/spec_<concern>.md`).

## Before writing anything

1. `Glob` for `checklist_*/checklist_*.md` in the project root. If one already matches this concern, stop and tell the user — do not overwrite silently.
2. Ask clarifying questions with `AskUserQuestion` until you understand:
   - the concern's scope and boundary, and what "done" looks like;
   - the environment facts the tasks will depend on;
   - anything explicitly out of scope or not to be touched.
   - Never infer the checklist from a single request.
3. Group the work into milestones: one per concern, plus one milestone for integration tests and one for optimization work.
4. Draft the milestone/task breakdown and confirm it with the user before writing the file. Once they've confirmed, write it.

## Format (exact — do not deviate)

```
## Tasks
### M1. <milestone name>
1. - [ ] (agent) <task name>
2. - [ ] (user) <task name>

### M2. <milestone name>
3. - [ ] (agent) <task name>
...

## Context
<environment facts every task section depends on>

## Open questions
<anything unresolved, and which task number it blocks>

## 1. <task name>
Why: <one line — the reason this task exists>
What: <one line — the concrete outcome this task produces>
Details: <exact commands, files involved, preconditions, what must not
be touched>
Done when: <the concrete condition that makes this task complete>
Evidence: <what the sub-agent writes to its result file as proof — command output, diff, test result>

## 2. <task name>
...
```

Rules:
- `## Tasks` is the only checklist in the file: a flat, numbered list of one-line `- [ ]` tasks grouped under `### M<n>. <name>` milestone headings.
- Every task line is marked right after the checkbox with `(agent)` or `(user)`: who does it.
  - Mark `(user)` for anything a sub-agent can't do: a decision only the user can make, or an external action (approvals, credentials, another team).
  - Also mark `(user)` for anything the user said they want to do by hand.
  - Everything else is `(agent)`.
- Task numbers are permanent ids. Number sequentially across all milestones as you write; whoever updates the file later never renumbers, only appends.
- Each `## n. <task name>` section carries no checkboxes of its own.
  - It opens with `Why:` and `What:` (one line each), then `Details:`, `Done when:`, and `Evidence:`.
  - Write it so a sub-agent with zero context could execute it.
  - The orchestrator hands these fields to the sub-agent verbatim, so they must stand alone.
- If a task needs sub-items to stay clear, it's too large — split it into more tasks, don't nest.
- Refer to a task elsewhere in the file as "task n".
- Name files and identifiers, never restate code inline — duplicated detail goes stale.
- `## Context`: environment facts, one line each.
  - A decision from clarifying questions (an approach chosen over alternatives) is one line with its evidence and the rejected alternative.
- `## Open questions`: only for what genuinely can't be resolved by asking the user now (e.g. blocked on another team, unknown until task n runs).
  - Everything else gets asked via `AskUserQuestion` and folded into `## Context` or the task section.
  - Note which task each question blocks, and note it again in that task's section.
- No `## Result` headings: whoever executes the task adds them, not you.
  - A task's result in the checklist is one `Result:` line linking its result files under `results/`.
  - The evidence itself lives in those files.

## Style

Match the user's brevity standard: no filler sentences, no restating the question, no explaining a decision they already made. A task section is dense and exact, not padded.

Lists: limit each list entry to 200 characters and split longer ones into nested list items so entries stay small and easy to parse. Put this rule in every task whose deliverable is a document.
