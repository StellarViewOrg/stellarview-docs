---
title: Network Analytics
description: History and ranking dashboards for network-wide Stellar activity.
---

The Analytics section's **History** and **Top N** tabs chart network-wide activity over time, backed by the indexer's aggregation API.

## History

Time-series charts at hourly, daily, or weekly resolution for:

- **Transaction count**
- **Transaction volume** (native XLM transfers)
- **Classic and Soroban fees**
- **Active accounts** and **new accounts**
- **Asset supply**, either summed across all assets or filtered to a single asset by code and issuer (or a Soroban contract ID)

Each chart can be exported as CSV or JSON.

## Top N

Ranked tables for the most active contracts, top assets by activity, and highest fees, over a selectable time window.

## Availability

Every chart and table queries the indexer independently and renders a "Not Available Yet" placeholder if that specific metric hasn't been aggregated yet, rather than an error or an indefinite spinner. In practice, all of these metrics are live today.
