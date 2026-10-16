# CLAUDE.md

Guidance for AI coding tools working in this repository.

## What this is

The Mintlify documentation site for StellarView. It documents four public repositories: `stellarview-explorer` (Next.js), `stellarview-indexer` (Go), `stellarview-tui` (Go), and this one. There is no build step beyond Mintlify.

## Commands

```bash
mint dev            # Local preview on :3000
mint validate       # Strict build check, fails on warnings
mint broken-links   # Internal link check
mint a11y           # Contrast and alt text check
./scripts/render-diagrams.sh   # Render diagrams/*.d2 to images/diagrams/*-{light,dark}.svg (needs d2)
```

## Rules

- English pages live at the root; Spanish pages mirror them under `es/` with the same file names. Any page added, removed, or renamed must change both trees and both `languages` entries in `docs.json`.
- Internal links in Spanish pages use the `/es/` prefix, except generated API endpoint pages under `/api-reference/`, which are shared.
- `api-reference/openapi.yaml` is derived from the indexer source (`internal/httpserver`, `internal/analytics`, `cmd/indexer`). When the indexer API changes, update the spec from the code, not from the indexer's markdown docs.
- Diagrams: edit the `.d2` source, re-render, commit both SVGs, and embed with the `Diagram` snippet from `snippets/diagram.mdx`.
- Verify every command, path, env var, and feature status against the current code of the relevant repository. Features whose backend has not shipped (contract verification build pipeline, DEX historical aggregates) must be described as in development.
- No em dashes in any file, commit, issue, or PR.
- `architecture/`, `diagrams/`, `report/`, and `scripts/` are excluded from the published site by `.mintignore`.
- Commit messages: Conventional Commits, one line, lowercase.
