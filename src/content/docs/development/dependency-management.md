---
title: Dependency Management
description: Automated dependency updates, Renovate configuration, and Dependency Dashboard workflows.
---

StellarView Docs uses [Renovate](https://docs.renovatebot.com/) for automated dependency updates and lockfile maintenance across the repository.

## Overview

Automated updates keep frontend frameworks, Astro plugins, and GitHub Actions dependencies current while minimizing noise through grouped pull requests and scheduled batching.

- **Automation Engine**: Renovate bot (`renovate[bot]`)
- **Tracking Center**: Live [Dependency Dashboard](https://github.com/StellarViewOrg/stellarview-docs/issues/15) maintained via GitHub Issues
- **Primary Configuration**: `renovate.json` in repository root

## Configuration (`renovate.json`)

The repository configuration extends Renovate's recommended presets:

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["config:recommended"],
  "timezone": "UTC",
  "schedule": ["before 6am on monday"],
  "prConcurrentLimit": 5,
  "packageRules": [
    {
      "matchManagers": ["npm"],
      "matchUpdateTypes": ["minor", "patch"],
      "groupName": "minor and patch dependencies"
    },
    {
      "matchManagers": ["github-actions"],
      "groupName": "github actions"
    }
  ],
  "lockFileMaintenance": {
    "enabled": true,
    "schedule": ["before 6am on monday"]
  }
}
```

### Key Policies

1. **Schedule**: Dependency checks and PR generation run weekly before **6:00 AM UTC on Mondays**. This prevents build noise during active development cycles.
2. **Concurrency Cap (`prConcurrentLimit: 5`)**: At most 5 automated dependency PRs remain open simultaneously to avoid overwhelming CI runners and code reviewers.
3. **Grouped Updates**:
   - `npm` minor and patch updates are consolidated into a single grouped PR (`minor and patch dependencies`) to test compatibility in one batch.
   - GitHub Actions workflow updates are grouped into a dedicated PR (`github actions`).
4. **Lockfile Maintenance**: Automated `bun.lock` verification and refresh runs weekly on Mondays to resolve transitive dependency drift.

## Monitored Ecosystems & Packages

Renovate monitors both Node.js/Bun dependencies and CI workflow actions:

### `package.json` Ecosystem

| Package | Role | Update Strategy |
| :--- | :--- | :--- |
| `astro` | Core web framework | Grouped minor/patch; isolated major PR |
| `@astrojs/starlight` | Documentation theme & routing | Grouped minor/patch; verified with Starlight links validator |
| `@astrojs/tailwind` / `tailwindcss` | Utility CSS engine & Vite plugin | Grouped updates |
| `@astrojs/check` / `typescript` | Static type checking | Grouped updates |
| `sharp` | High-performance image optimization | Grouped updates |
| `starlight-links-validator` | Documentation link integrity check | Grouped updates |

### GitHub Actions (`.github/workflows/`)

- `actions/checkout`
- `actions/setup-node`
- `oven-sh/setup-bun`

## Dependency Dashboard Operations

Renovate maintains an ongoing Dependency Dashboard in the repository issue tracker (Issue `#15`).

> [!NOTE]
> The Dependency Dashboard issue remains permanently open. Closing this issue disables Renovate's ability to present scheduled rebases, pending upgrades, and retry controls.

### Dashboard Capabilities

- **Pending / Scheduled Updates**: Lists upcoming dependencies scheduled for the next Monday maintenance window.
- **Manual PR Trigger**: Maintainers can check any update checkbox on the dashboard to trigger an immediate pull request prior to the scheduled window.
- **Rebase & Retry**: Checking the rebase box on open Renovate PRs forces an automated git rebase against the target branch (`main`).

## Local Verification Workflow

Before merging dependency updates or submitting PRs that touch dependencies, always verify clean installation and documentation build locally:

```bash
# Install dependencies
bun install

# Verify static typecheck
bun run check

# Verify full static site generation and link validation
bun run build
```
