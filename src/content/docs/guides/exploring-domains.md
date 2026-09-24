---
title: Exploring Soroban Domains
description: How to resolve, browse, and inspect *.xlm domains on StellarView Explorer.
---

Soroban Domains is Stellar's name-service contract. It binds human-readable names like `stellar.xlm` or `pay.alice.xlm` to an account or contract address.

## Resolving a Domain

Type a domain name into the command palette or the search bar (`stellar.xlm`, `pay.alice.xlm`). The explorer resolves it against the domains registry contract and takes you straight to the account or contract it points at.

Resolution runs directly against Soroban RPC, so it works even before the indexer has backfilled anything. An unregistered name shows a clear "not registered" message instead of a raw contract error.

:::note
Domain resolution is not available on Futurenet: the registry contract has no deployment there.
:::

## Domains on Account and Contract Pages

Any account or contract that owns a domain shows it as a badge next to its address (`alice.xlm`, plus `+N more` if it owns several). An address that owns no domain shows no badge at all, which is distinct from the indexer not having caught up yet: that case shows a muted "Domains pending" badge instead.

## The Domains Browser

The `/domains` section lists registrations with a status filter (active, expired, revoked, all) and pagination. Each entry links to its detail page.

A domain's detail page (`/domain/<name>`) shows:

- **Status**: active, expired, or revoked
- **Resolved target**: linked to the account or contract page it points at
- **Owner**
- **Registration and expiry dates**
- **Full event history**: register, transfer, renew, claim, and revoke, each linked to its transaction

:::note
Searching the domains list currently matches exact names only. The read API the explorer talks to doesn't support prefix or partial search yet.
:::
