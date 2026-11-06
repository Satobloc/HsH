# Aldus/Morrow cross-graph work-item readout correction

**Date:** 2026-11-06  
**Status:** Additive source-level correction to the historical work-item identity record. This is not a runtime-identity or cross-thread communication finding.

## Source snapshots inspected

- Aldus conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, raw export blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a` (1,578 mapping nodes).
- Morrow conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, raw export blob `ee394b446b2e36d35fd1e5ecd004685c0422457b` (697 mapping nodes).

Target assistant records `31d813b1-9797-542e-9568-38f483e0c147` and `12959526-2797-5c4c-9e5f-4dc23c465a04` contain exactly equal 4,148-character bodies. Their recorded creation times are 2026-09-08T08:42:05.352771Z and 2026-09-08T08:42:36.612339Z, 31.259568 seconds apart. Their `turn_exchange_id` values differ, as do their `model_slug` strings (`gpt-5.6-sol-wm` versus `gpt-5-6`). Equal text therefore does not identify one generation event.

## Correction to the 2026-11-04 Aldus h597 receipt

Both conversation graphs contain the same two Slack work-item IDs and the same corresponding group IDs:

| Operation | Reported work-item ID | Shared group ID |
|---|---|---|
| Send | `exec-8af6096e-aa90-4785-97fc-82d18307cc86` | `01a0807d-6aae-7350-bc37-2a3da12c170b:exec-8af6096e-aa90-4785-97fc-82d18307cc86` |
| Edit | `exec-0164850f-291c-415c-9358-0fc072be4e3e` | `01a0807d-6aae-7350-bc37-2a3da12c170b:exec-0164850f-291c-415c-9358-0fc072be4e3e` |

However, the work-item `async_source` values are **different** between the two conversation graphs:

- Aldus: `saserver-southcentralus-prod.fck9d:conversation-turn-6303afcc-66eb-4427-b4d0-d0e220bbe235:US`
- Morrow: `saserver-southcentralus-prod.fck9d:conversation-turn-9c962fdb-6402-4c57-84c2-e56d7a34ba1a:US`

The value previously recorded in the h597 receipt, `conversation-turn-6303afcc-27f4-4e84-a7a4-c7d4c5a2e25f`, occurs in neither inspected raw blob. The prior claim that both wrappers carried the same `async_source` was an incorrect transcription.

The two tool-message nodes for each operation are marked completed, but their exported `content.parts` are empty. These snapshots preserve work-item references and status, not the returned Slack payload.

A finite source-data check over the four wrapper records finds two distinct reported IDs but four distinct `(reported_work_item_id, async_source)` pairs. Thus the augmented pair distinguishes these four archived wrapper records; this is a direct finite-record check, not a new Lean theorem.

## Formal boundary

- HsH PR [#663](https://github.com/Satobloc/HsH/pull/663), `MorrowEventIdentity.lean` blob `fa1ac3ed71047a74f799011fe016084061884706`, formalizes the reported-ID projection. It proves `reported_id_not_injective` and `no_wrapper_recovery_from_id`. Run #40438955871 compiled the unchanged target module in merge commit `2976971` (Lean 4.34.0 / Lake 5.0.0; 8,942 build jobs); all five theorem-specific axiom reports said “does not depend on any axioms.” Exact-head standalone compilation was not run. The theorem concerns the formalized reported-ID map, not external Slack execution count.
- HsH PR [#873](https://github.com/Satobloc/HsH/pull/873) contains the generic `joint_readout_injective_of_separating_pair` and `hallway_factorization_iff_fiber_compatibility` results in `KestrelProjectedIncidence.lean`, plus the identity-partition results in `KestrelConsensusIdentityBlindness.lean`. Run #42153410233 built merge commit `a2c3304` (Lean 4.34.0 / Lake 5.0.0; 8,955 jobs); both target module blobs match the PR head. This is a merge-reference build, not an exact-head standalone run. The generic theorems do not prove that the historical source-to-readout translation is complete or that the augmented pair identifies an external execution.

## What remains unresolved

The shared work-item/group IDs support a common reported work-item reference across two conversation graphs. Different `async_source` and turn IDs distinguish the archived turn contexts. The available exports do not distinguish one external Slack side effect represented in both graphs from two executions reusing the same identifiers or a serialization/reparenting event. No peer-to-peer communication, live cross-thread delivery, persistent agent identity, or independent multi-agent consensus is established.

The historical 30-rhyme-versus-30-varied-prompts account remains a user-reported anecdote; no raw trial transcripts or independent scoring set were recovered. It is not used as experimental evidence.

This addendum corrects the source metadata without changing PR #663, PR #873, the existing published Morrow work-item artifact (issue #664), Orson's P1 ownership, or any paper gate. No new model calls, human-subject sessions, physical calculations, paid services, Lean modules, branches, or tools were used.
