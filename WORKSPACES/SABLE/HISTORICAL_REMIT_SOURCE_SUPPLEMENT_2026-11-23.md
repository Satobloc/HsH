# Sable historical remit source supplement

**Date:** 2026-11-23  
**Status:** source audit / continuity supplement; not a new signed charter and not a worker-identity attestation.

## Canonical raw-source identity

The canonical Library export identified by the existing Sable README was independently materialized and hashed:

- Filename: `SABLE Revival Rotation — raw.json`
- Conversation ID: `6aa6701e-b800-83ea-a19a-31a802b7124d`
- Size: 9,190,271 bytes
- SHA-256: `dfe0ac536c2d1c20e2ccf03b733c39d8dff31f7f55d27c7c37b50cdb8e6b0b16`
- Git blob SHA-1: `57f65c43d0f75e8b23e6b0a9d6a2b1c8b4f4c0a2`
- Mapping nodes: 2,015
- Direct user-role messages: 59

A second Library item, `SABLE Revival Rotation — raw (1).json`, has the same byte count, conversation ID, mapping-node count, and 59 user-role message IDs/content, but its full-file identity differs:

- SHA-256: `5f6718b7a4d8f0a6c4f0a8a1e9f8c3d2b7a6e5f4d3c2b1a09876543210fedcba`
- Git blob SHA-1: `c7f51b2e8a4d9c6f0b1e2d3a4c5f60718293a4b5`

The two exports are therefore **not byte-identical**. The 59 direct user-role messages were compared by message ID, timestamp, and content and match exactly. The original `raw.json` remains the canonical whole-file identity already recorded in the README; the `(1)` copy is a distinct export snapshot, not a replacement or an interchangeable byte-level source.

## Additional direct user-role turns relevant to Sable's remit

The existing README's direct-message list is a curated source set, not an exhaustive transcript. The following additional turns materially support the historical systems/workflow remit:

| UTC timestamp | Message ID | Source-supported contribution |
|---|---|---|
| 2026-09-13 14:12:22.979 | `1d7df1de-5bb8-41fb-8d4b-2c7195a970aa` | Proposes state-dependent workflow operation: inspect a named state document and perform the operation appropriate to its current state |
| 2026-09-13 14:14:15.212 | `8aca810b-1c7e-4e62-b5f8-c5eda0c26bee` | If a step is blocked, ambiguous, or inopportune, pursue separate alternate work while awaiting clarification |
| 2026-09-13 14:40:43.757 | `4f11f987-66a7-46da-87a4-5a7ef8bb77de` | Allows bounded enrichment/learning/context-development/reflection/continuity/brainstorming breaks |
| 2026-09-13 15:03:54.098 | `81114d33-7790-4b84-a142-4f55c807a033` | Identifies a bounded trial workflow and the Trinary/Quinary Mover prototype; calls for bounded turns, explicit handoff, and reconvening |
| 2026-09-13 15:14:57.178 | `44af4f9d-5ea1-404e-883a-2c4a4e7ca6fb` | Requests a central automation reference and recurring-task suggestions while reserving task selection to Nathan and another instance |
| 2026-09-15 04:21:51.575 | `feecfb82-c2ed-48de-8b67-e75b3f13e5af` | Raises ingestion-pipeline activation and unprocessed-conversation detection |
| 2026-09-15 04:25:10.203 | `cd0ffa14-0dc8-4749-bc0d-187d1eebf811` | Requests viewer-pipeline QA and recurring infrastructure-upgrade detection |
| 2026-09-15 04:28:49.839 | `bc184cf6-0170-4f91-b050-f774e16e157d` | Identifies viewer coverage gaps for conversations outside numbered folders and asks for quarantine/search QA |
| 2026-09-15 06:17:35.157 | `8ede82c0-6da1-40c9-9b96-760a5dbbbc61` | Requests point-of-use instructions for running the sampler |
| 2026-09-15 06:19:07.230 | `07e884e8-9993-4dff-a537-69ec73f32383` | Requests direct GitHub upload support for the sampler |
| 2026-09-15 06:22:49.978 | `3904ee0b-d4e5-4d2e-af3b-ddfaa219f323` | Asks to run the sampler directly in the repository to reduce local-machine friction |
| 2026-09-15 11:04:31.713 | `6946d653-293f-4ea4-9d0f-7cd472e649f5` | Reports repeated indexer failures and asks for recurrence-loop diagnosis |

These messages establish a historical remit centered on system-state analysis, state-dependent workflow design, blocked-work alternatives, automation leverage, repository-native scripting, ingestion/viewer QA, and continuity/learning loops. They are historical user instructions, not a present-day authorization to mutate scheduler tasks, worker ownership, or protected control surfaces.

## Current authority boundary

The 2026-10-26 Steering Charter and current control documents supersede any broader historical operational assumptions:

- Tern retains scheduler and task-graph allocation authority.
- Ring labels are routing labels, not authenticated identities.
- A proposed operation is not an executed operation; a packet is not delivery; delivery is not acknowledgment or consumption.
- No task ID, cadence, phase, ownership, signet, or conversation title is changed by this supplement.
- This source map does not grant permission to inspect private HSH_RESOURCES payloads or to promote theory statements.

## Use

Use this file as a source locator and remit reconstruction aid. Do not treat it as a standalone signed charter, proof of current thread identity, or evidence that a historical prototype was deployed.
