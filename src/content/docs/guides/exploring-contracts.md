---
title: Exploring Smart Contracts
description: How to browse Soroban smart contracts on StellarView Explorer.
---

Soroban is Stellar's smart contract platform. Contracts are identified by a contract ID (starting with `C`).

## Finding a Contract

Paste a contract ID into the search bar, or navigate to the Contracts section.

## Contract Details

The contract page shows:

- **Contract ID** — The unique identifier
- **Code** — The deployed WASM binary information
- **Storage** — Key-value data stored by the contract
- **Events** — Contract events emitted during execution

## Contract Events

Events are emitted by contracts during transaction execution. Each event shows:

- **Topic** — What the event is about
- **Data** — The event payload
- **Transaction** — The transaction that triggered the event
- **Ledger** — When the event occurred

:::note
Contract data is fetched via Soroban RPC, which may not be available on all networks.
:::

## Read/Write Console

The Read/Write tab decodes a contract's WASM spec directly in the browser, structs, unions, enums, and error enums included, and builds a form for every function it finds.

Read calls simulate against Soroban RPC and need no wallet. Write calls require a connected wallet (Freighter or another wallet supported by Stellar Wallets Kit) to sign and submit the invocation. Contract errors are shown as plain-language alerts, with the full trace kept in the browser console for debugging.

## Contract Verification

The Verification tab links a deployed contract's WASM binary back to its public source, when a verification has been submitted. See [Contract Source Verification](/guides/contract-verification/) for how badges, the source browser, and the submission flow work.
