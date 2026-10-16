---
title: Contract Source Verification
description: How verified-contract badges, source browsing, and diffing work on StellarView Explorer.
---

The Verification tab on a contract's page ties a deployed WASM binary back to its public source code.

## Verification States

A contract can show as:

- **Verified**: the deployed binary matches submitted source.
- **Unverified**: no source has been submitted for this `wasm_hash`.
- **Pending**: a submission is being built and checked.
- **Mismatch**: submitted source did not produce the deployed binary.
- **Build failed**: the submitted source could not be built.
- **Not available**: the verification service isn't reachable yet (see below).

## Source Browser and Diff View

A verified contract exposes its full source tree in a file browser. From there you can diff the current contract's verified source against any other verified `wasm_hash`, useful for reviewing what changed across an upgrade.

## Submitting Source for Verification

The submission form takes a git reference or an archive URL, plus the toolchain and build profile used to compile it. Once submitted, the page polls automatically until the result lands, verified, mismatched, or build failed, with no manual refresh needed.

:::note
The verification backend is still in development on the indexer side. Until it ships, every contract's Verification tab shows a "Verification isn't available yet" state rather than an error or a broken form. The explorer UI is already built against the frozen API contract, so verification will activate automatically, with no explorer-side changes, once the service comes online.
:::
