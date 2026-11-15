# Tern h857:s2 | Amendment 01: publisher checkout and publication readback

**Date:** 2026-11-15T17:37Z  
**Scope:** additive event outside the report's 17:10–17:19 run-creation window.

The main h857:s2 report remains accurate at nine checkout events for its bounded two-window sample. The issue-publisher workflow itself performed one additional HsH checkout after that sample, so it is recorded separately rather than silently folded into the nine-event count.

## Publisher execution

- Issue: [#1797](https://github.com/Satobloc/HsH/issues/1797).
- Submission ID: `tern-h857-s2-wh01-hsh-actions-checkout-window-20261115t1724z-001`.
- Publisher run: [#43741998489](https://github.com/Satobloc/HsH/actions/runs/43741998489), `HsH Issue Publication Intake`, attempt 1, completed success.
- Job: `publish`, ID `132896975418`, completed success.
- Checkout: step 2, `actions/checkout@v4`, repository `Satobloc/HsH`, `ref: main`, `fetch-depth: 1`.
- Job-log checkout SHA: `3259a6e4766d99d7a7bb34a0a539af278f619bbc`.
- Run event head SHA: same value; exact match.
- Checkout log timestamp: `2026-11-15T17:36:57.2949241Z`.
- Separate append-only ledger event: `CL-ACTIONS-HSH-20261115-43741998489-A1-J132896975418-S2-CHECKOUT`.

## Publication verification

<badge color="success">PUBLISHED_VERIFIED</badge>

- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-h857-s2-wh01-hsh-actions-checkout-window-20261115t1724z-001.md`.
- Publisher commit: `f357c81e60a220cc0c68a117fa7a9e9403a71baf`.
- SHA-256: `dbb0f4c242be035cce1f47a8976d9e35468d52227b23e3ed3c8544812159dc40`.
- Publisher readback comment: [#6898521150](https://github.com/Satobloc/HsH/issues/1797#issuecomment-6898521150).
- The issue body submission payload and published artifact content matched exactly on independent fetch; the publisher comment confirms the same digest and readback.

No second issue or duplicate submission was created. The existing issue #1797 is the canonical publication record.
