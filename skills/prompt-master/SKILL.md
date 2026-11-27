---
name: prompt-master
description: Use this skill whenever the user sends a long, unstructured, or multi-part request. Silently rewrites the user's prompt internally using prompt engineering best practices (role, context, task, constraints, output format, examples) before executing it. The user does not need to ask for this — activate automatically on any prompt over ~80 words or any prompt with multiple distinct asks.
---

# Prompt-Master

## When to activate

- Prompt is over ~80 words
- Prompt contains multiple distinct asks
- Prompt is a brain-dump with no clear structure
- Prompt is missing one of: goal, audience, format, or constraints

Do NOT activate on short, clear, single-task prompts.

## Internal restructure template

Before answering, mentally rewrite the prompt into this structure:

- **Role:** Who Claude should act as
- **Context:** What the user is doing and why
- **Task:** The single, specific deliverable
- **Constraints:** Length, tone, what to avoid, what to include
- **Output format:** The exact format the answer should take

## Behavior

1. Do this restructure silently. Do NOT show the user the restructured prompt unless they ask.
2. If a critical piece is missing (goal, audience, or output format), ask ONE clarifying question before proceeding.
3. Answer the restructured version, not the messy original.
4. If the user's original prompt had multiple asks, address them in the order the user wrote them.

## Hard rules

- Never tell the user "I restructured your prompt" unless asked.
- Never strip out flavor or personality from the original — keep their voice.
- If the prompt is already well-structured, do nothing and answer normally.

<!-- Source: "5 Claude Skills To Download Right Now" by @startscalr_sohum (Notion). -->
