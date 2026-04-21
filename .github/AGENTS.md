# AGENTS.md

## Scope

- This file applies to `.github/`, including workflows and `CODEOWNERS`.

## Workflow Rules

- `.github/workflows/ansible.yml` runs the `lint` task through the reusable
  Taskfile and `uv` workflow.
- `github-super-linter.yml` is a separate workflow and should stay separate
  from the ansible-lint workflow.
- Do not reintroduce super-linter into the ansible-lint-only task.
- `release.yml` uses release-please.
- Do not change release-please behavior, tokens, permissions, or triggers
  casually.
- Preserve minimal workflow permissions.
- Preserve checkout credential hardening unless explicitly requested.

## Do Not

- Do not add GitHub Copilot instruction files unless one already exists and
  only needs a tiny pointer to `AGENTS.md`.

## Validate

- Validate YAML syntax and existing lint conventions.
- If `pre-commit` is already available, run `pre-commit run --all-files`.
- If `zizmor` is already available, run it with the current `.zizmor.yml`
  configuration.

## Done Means

- Workflow separation, permissions, and release behavior remain aligned with
  the current repository setup.
