---
name: client-reply
description: Write a short, friendly reply to a client's message that asks the right questions in plain words. Use when the user pastes a client message and wants a reply to send before any work starts.
---

# Client reply

1. Use the `brief-analyst` subagent with the client's message, word for word, to get the questions.
2. Use the `client-writer` subagent with the client's message and those questions.
3. Show the user the message from `client-writer`, and nothing else, so it can be copied and sent.

If the client's message is already clear and no question changes the work, say so in one line and write a short confirmation instead.

Never add a price or a date unless the user asks for it.
