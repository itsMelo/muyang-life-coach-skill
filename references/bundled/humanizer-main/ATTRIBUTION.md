# Bundled: humanizer-main

This directory vendors the complete `humanizer-main` skill into
`muyang-life-coach-skill`.

Why it is bundled:

- Users only need to install and attach `muyang-life-coach-skill`.
- The coach can use the full humanizer rules without requiring a second skill.
- The bundled `SKILL.md` remains the source for AI-writing cleanup behavior.

How the coach uses it:

1. Draft the coaching response with `references/session.md`.
2. Run the full humanizer pass from `references/bundled/humanizer-main/SKILL.md`.
3. Apply the coach-specific layer from `references/humanizer-pass.md`.
4. Send only the final user-facing response.

Bundled files:

- `SKILL.md`
- `README.md`
- `LICENSE`
- `AGENTS.md`

License: see `LICENSE` in this directory.
