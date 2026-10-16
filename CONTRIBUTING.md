# Contributing to StellarView Docs

Thanks for helping improve the docs. Fixes for a single typo are as welcome as new guides.

## Workflow

1. Fork the repository and create a branch, such as `docs/explain-hybrid-mode`.
2. Run `mint dev` and make your change.
3. Update both languages. Every page under the root has a Spanish twin at the same path under `es/`, and both navigations in `docs.json` list it. If you can't write the Spanish version, say so in the pull request and a maintainer will help.
4. Run `mint validate` and `mint broken-links`. CI runs both, and it also rejects em dashes.
5. Open a pull request with a [Conventional Commits](https://www.conventionalcommits.org) title, such as `docs(tui): document watch presets`.

## Writing guidelines

- Check every command and code sample against the current code in the relevant repository.
- Be honest about status: if a feature depends on backend work that hasn't shipped, say so in a callout.
- Sentence case for titles and headings. No em dashes.
- Every image needs meaningful `alt` text.
- Diagrams are D2 sources in `diagrams/`. Render them with `./scripts/render-diagrams.sh` and commit both SVGs.

The full guide lives at `contributing/docs.mdx`.

## License

By contributing, you agree that your contributions are licensed under the [Apache License, Version 2.0](./LICENSE).
