# StellarView Docs

Documentation for [StellarView](https://github.com/StellarViewOrg), the open-source explorer suite for the Stellar network: the web explorer, the terminal explorer (TUI), the indexer, and its HTTP API.

The site is built with [Mintlify](https://mintlify.com) and published in English and Spanish.

## Run it locally

```bash
bun add -g mint
mint dev
```

Open http://localhost:3000. Before opening a pull request:

```bash
mint validate
mint broken-links
```

## Layout

| Path | Contents |
| --- | --- |
| `docs.json` | Site configuration and navigation for both languages |
| `*.mdx`, `concepts/`, `explorer/`, `tui/`, `indexer/`, `contributing/` | English pages |
| `es/` | Spanish pages, mirroring the English tree |
| `api-reference/openapi.yaml` | OpenAPI 3.1 spec for the indexer API. Mintlify generates the endpoint pages from it |
| `diagrams/` | D2 sources. Render with `./scripts/render-diagrams.sh` |
| `images/diagrams/` | Rendered light and dark SVGs |
| `snippets/` | Reusable MDX components |
| `architecture/` | Long-form design notes, kept in the repo and not published |

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) and the [Writing docs](https://github.com/StellarViewOrg/stellarview-docs/blob/main/contributing/docs.mdx) page.

## License

Apache License 2.0. See [LICENSE](./LICENSE).

StellarView is independent software, not affiliated with, sponsored, or endorsed by the Stellar Development Foundation.
