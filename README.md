# Brief to Tasks 😈

Lish Daily Drop #1, by [Devlish](https://www.instagram.com/devlish_team/), a team of young devs.

You have a rough brief, a client message or an idea, and you don't know where to start. This kit turns it into questions to ask, a task list, an estimate with a range, and a cut list. It uses a small team of subagents, so each step is done by a focused helper.

## What you get

| Part | Role |
|---|---|
| `/brief-to-tasks` | The full flow: questions, tasks, estimate, risks, cut list, client reply |
| `/brief-questions` | Only the questions to ask, fast |
| `/client-reply` | A short message to send to your client |
| `brief-analyst` | Gives the size, the assumptions and the questions |
| `codebase-scout` | Reads your repository (read-only) so the plan fits your code |
| `task-planner` | Writes the ordered tasks, each with "done when" |
| `estimator` | Gives a range per task, using `estimation-guide.md` |
| `plan-skeptic` | Looks for missing tasks, wrong order and hidden work |
| `client-writer` | Writes the client message in plain words |

## How it works

1. `brief-analyst` and `codebase-scout` run at the same time.
2. You get the size, what was understood and the questions. Each question has a default. You answer, or you say "use the defaults".
3. `task-planner` writes the tasks.
4. `estimator` and `plan-skeptic` run at the same time. The skeptic can add a missing task, once.
5. If the input came from a client, `client-writer` prepares the reply.
6. You get one answer with the headings: Size, What I understood, Questions, Tasks, Estimate, Risks, Cut list, Reply to the client.

A small task gets a short answer. A big project gets more questions and module-level tasks.

## Install

You need [Claude Code](https://claude.com/claude-code) and Git.

```bash
git clone https://github.com/Mohamed-EDDAHMANI/brief-to-tasks.git
cd brief-to-tasks
./install.sh /path/to/your/project
```

The script copies the files into your project's `.claude/` folder and never overwrites an existing file. Restart Claude Code after installing.

To use it in all your projects, copy the contents of `template/.claude/` into `~/.claude/` instead.

## Use it

Paste your brief and call the skill:

```
/brief-to-tasks
Client says: "I want a website for my restaurant with a menu and reservations, nice and fast. How much?"
```

Or for a small task:

```
/brief-to-tasks add dark mode to my React app
```

Other ways: `/brief-questions` when you only want to know what to ask, and `/client-reply` when you only need a message to send.

## Good to know

- **The numbers are guesses.** The estimate comes from the information you gave and from `estimation-guide.md`, which holds rules of thumb and not measured data. Edit that file with your own history to make the estimates yours.
- **It does not change your code.** `codebase-scout` can only read and search. It never reads `.env` files.
- **It asks before it plans.** If you don't answer, it uses the defaults and tells you which ones.
- **It answers in the language of your brief.**
- **It costs more than a single prompt.** Several subagents run on each full request. Use `/brief-questions` for a cheap first look.
- **Claude can do this without the kit.** The kit gives it a fixed format, tested rules, a sceptic that looks for forgotten work, and the estimation guide, so you don't write the prompt each time.

## License

[MIT](LICENSE). An idea or a bug? Open an issue.
