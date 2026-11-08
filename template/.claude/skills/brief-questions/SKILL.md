---
name: brief-questions
description: Quickly list the questions to ask before starting a brief, idea or client message, without a full plan. Use when the user only wants to know what to ask, or wants a fast check before committing.
---

# Brief questions

A fast version of `brief-to-tasks`. No task list, no estimate.

1. Use the `brief-analyst` subagent with the brief, word for word.
2. Show the user its result: the size, what it understood, the assumptions that are not sure, and the questions with their defaults.
3. End with one line: "Say `/brief-to-tasks` with your answers to get the tasks and an estimate."

If the input is a client message and the user asks for it, pass the questions to the `client-writer` subagent and show its message.

Write in the language of the input. Never invent requirements.
