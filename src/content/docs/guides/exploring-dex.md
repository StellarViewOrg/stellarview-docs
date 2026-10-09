---
title: Exploring the DEX and Liquidity Pools
description: How to browse trading pairs, order books, and liquidity pools on StellarView Explorer.
---

StellarView surfaces Stellar's built-in decentralized exchange: classic order book trading and automated market maker liquidity pools.

## Trading Pairs

The `/pairs` section lists trading pairs, sortable by 24h volume or liquidity and searchable by asset code.

A pair's detail page (`/pair/<slug>`) shows:

- **Recent trades**, pulled live from Horizon
- **Order book snapshot**, current bids, asks, and spread, pulled live from Horizon
- **Candlestick chart** at 1 minute, 1 hour, or 1 day resolution, backed by the indexer's aggregation service

## Liquidity Pools

A liquidity pool's detail page shows current reserves, fee, and participants, all live from Horizon, plus a unified activity feed of deposits, withdrawals, and trades.

## Cross-Links

Pairs and pools are linked from wherever they're relevant:

- An account's balances link its liquidity pool shares to the pool's page.
- An account's open offers link to the corresponding trading pair.
- An asset page has a "Pools" tab listing every pair and pool it participates in.
- A Stellar Asset Contract on a contract page links back to its underlying asset.

:::note
Order books, recent trades, and pool reserves are live today, straight from Horizon. Historical candlestick charts and pool depth-over-time charts depend on the indexer's DEX aggregation service, which is still in development. Until that ships, those charts show a "Trading data isn't available yet" state instead of an empty or broken chart.
:::
