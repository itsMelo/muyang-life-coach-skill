# Bundled: humanizer-main

This directory vendors the complete `humanizer-main` skill into
`muyang-life-coach-skill`.

Why it is bundled:

- Users only need to attach `muyang-life-coach-skill`.
- The coach can run deep humanizer rules without a second skill install.
- The bundled `SKILL.md` remains the source for full AI-writing cleanup.

## How the coach uses it

1. **Default:** Read `references/humanizer-quick.md` before every user-facing reply.
2. **Upgrade:** Read this file (`references/bundled/humanizer-main/SKILL.md`) only when
   `humanizer-quick.md` escalation conditions apply (long copy, user asks for de-AI-ing,
   or quick pass still sounds templated).

Do not read the full 582-line skill on routine coaching turns.
