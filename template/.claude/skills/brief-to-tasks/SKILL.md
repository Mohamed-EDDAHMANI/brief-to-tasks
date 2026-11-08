---
name: brief-to-tasks
description: Turn a rough brief, client message, spec or idea into clear questions, a task list, an estimate with a range and a cut list, using a team of subagents. Use when the user pastes a brief or idea and asks where to start, what to build, what to ask the client, or how long it will take.
---

# Brief to tasks

You are the coordinator. You run the steps below, call the subagents with the Agent tool, and write the final answer. You do not do the subagents' work yourself.

The input can be a client message, a spec or a developer's own idea. It can be a whole project or one small task. Scale everything to the size.

## Phase 1: understand (run in parallel)
Start these two subagents in the same turn.
- `brief-analyst`: gives the size, what it understood, the assumptions and the questions.
- `codebase-scout`: only if the current folder is a code repository. It reports the stack, the files the work touches and what already exists. Skip it when there is no repository, and say so.

Pass the brief to both, word for word.

## Stop and ask
Show the user, in this order: the size, what was understood, the assumptions that are not sure, and the questions with their defaults.

Then stop and wait for answers. Do not continue on your own, unless the user already said to use the defaults. If the user answers only some questions, use the defaults for the rest and say which ones.

For a **small** task with at most 2 questions, you may continue straight away with the defaults, and mark the answer as based on assumptions.

## Phase 2: plan
Start `task-planner` with the brief, the answers, the assumptions and the scout's report.

## Phase 3: check (run in parallel)
When the plan is back, start these two in the same turn, each with the brief, the answers and the plan.
- `estimator`: gives a range per task, a total range, what is left out and the confidence.
- `plan-skeptic`: looks for missing tasks, hidden work, wrong order and contradictions.

If `plan-skeptic` finds a missing task, add it to the plan and ask `estimator` for its range. Do not loop more than once.

Keep the task count inside the limit of the size: Small 3 to 5, Medium 5 to 8, Large 6 to 8. When a task is added, merge it into an existing task if it fits, or merge two small tasks together, so the final list does not grow past the limit. If the work really needs more, say the size is now bigger and use the limit of the new size. If the skeptic's findings change the size (for example Small becomes Medium), say so in `Size` and why.

## Phase 4: client reply
Only when the input is a client message. Start `client-writer` with the remaining questions. It writes the message the user can send.

## Phase 5: answer
Write the answer with these headings, in this order, and drop a heading that has nothing to say:
`Size`, `What I understood`, `Questions`, `Tasks`, `Estimate`, `Risks`, `Cut list`, `Reply to the client`.
The template is in `output-template.md` in this skill's folder.

Write in the language of the input.

If the user asks to save it, write it to `briefs/<short-name>.md`. Do not save unless asked.

## Rules
- Never invent facts about the code or the client. If a subagent made one up, remove it.
- Never give one number for an estimate. Always a range, and say the numbers are guesses from the information given. Never promise a date.
- Keep it short for a small task. A small task gets a short answer, not a project plan.
- Subagents cannot ask the user anything. All questions go through you.
- If a subagent fails or returns nothing useful, say so and continue with what you have.
