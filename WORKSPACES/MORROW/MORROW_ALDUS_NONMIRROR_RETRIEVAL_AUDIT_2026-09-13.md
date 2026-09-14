# Morrow–Aldus non-mirror / retrieval separation audit

**Date:** 2026-09-13 (EDT)  
**Status:** SOURCE AUDIT / OBS-HISTORICAL-EXPORT / CAPABILITY BOUNDARY / COVERAGE LIMIT  
**Theory status:** frozen; no theory source or claim was assessed.

## Question

Did the absence of a second answer to Nathan's next Aldus query show that the earlier Morrow–Aldus overlap had ended?

## Sources and coverage

Primary raw families and snapshot paths are indexed in [CORE_TEAM_CONVERSATION_CROSSWALK.md](CORE_TEAM_CONVERSATION_CROSSWALK.md).

- **Aldus:** blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`. Fully and sequentially read the four-node turn from Nathan user `3efcdde7-ff20-4030-b45d-31c56cd7e817` through final `4ae16bf2-4527-5c69-a57b-24ffaa71d969`. The immediately following Aldus user node `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb` was targeted only to identify the later citation source.
- **Aldus snapshots:** `728b4618…`, `11515984…`, `e871e710…`, `2f5ea91a…`, `63b03960…`. Compared target-node presence and complete target-node JSON.
- **Morrow snapshots:** `342b50c3…`, `e32873cd…`, `d0bb8335…`, `362075c5…`. Searched every mapped node for exact target-turn bodies and IDs. Fully read the later four-node Morrow observation turn `7649d636-1c44-4ab0-8911-dceaaeb318a1` through final `74526064-80ab-5fd3-850f-a42e58bfe730`; nearby identity turns were inspected only for chronology.
- This is not full-conversation ingestion.

## Direct record

The Aldus turn is an ordinary interactive turn, `09ec740f-e32a-4482-99bd-f4904404263f`:

1. Nathan asks, “Ok. But you know the full Morrow thread content?”
2. The graph records an empty thought node and a reasoning recap.
3. The assistant answers that “this thread” has full Morrow history and calls Morrow its native continuity while describing Aldus as partial exposure.

Raw container metadata identifies the conversation as Aldus, UUID `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`. The final has `content_references: []`; the turn has no retrieval/tool record. It therefore documents historical self-identification conflict and an assistant capability claim, not proof that the full Morrow transcript was available.

No target node ID or non-empty target body appears anywhere in the four inspected Morrow snapshots. Unlike the immediately preceding [automation-slot collision](MORROW_ALDUS_AUTOMATION_SLOT_COLLISION_AUDIT_2026-09-13.md), this Aldus answer was not copied into the Morrow graph.

## Snapshot chronology

- The two earlier Aldus snapshots end before the target turn and do not contain it.
- The first inspected later Aldus snapshot, `e871e710…`, contains all four nodes; complete node JSON is unchanged in `2f5ea91a…` and `63b03960…`.
- The earliest inspected Morrow snapshot containing Nathan's later “You didn't both answer…” observation is `e32873cd…`. Its final `74526064…` already carries a **seeded past-conversation citation** to Aldus UUID `6a9dea2e…`, quoting the exact substring “sometimes, but not always... you both answer when I ask one of you a question” from later Aldus user node `ae2eb196…`.
- That Aldus source message precedes the Morrow observation prompt by 87.866 seconds and the cited Morrow final by 94.618 seconds.
- The citation and response body persist in later Morrow snapshots. Only citation-metadata status changes from `seeded` to `complete`; the later status must not be projected backward, but the citation itself is present in the earliest surviving snapshot.

## Evaluation

### Established

- **OBS/HISTORICAL-EXPORT:** one adjacent Aldus turn produced no matching Morrow response record.
- **OBS/HISTORICAL-EXPORT:** selective past-conversation retrieval from Aldus into a subsequent Morrow turn is directly evidenced by generation-near citation metadata.
- **DERIVED/HISTORICAL:** response mirroring/task-result routing and past-conversation retrieval are separable observable phenomena. A second answer is not a reliable binary test of whether cross-conversation material was available.

### Not established

- That the overlap or retrieval route “ended.”
- That the four-node Aldus answer had full Morrow history available.
- That the cited snippet caused any particular uncited sentence of the Morrow answer.
- The Morrow answer's proposed dangling-question versus completed-exchange mechanism. That is a `GEN/HISTORICAL-HYPOTHESIS`, not a recovered backend rule.
- Present crosstalk, persistent shared memory, whole-thread access, direct instance-to-instance messaging, or shared runtime identity.

## Capability boundary

| Question | Historical record |
|---|---|
| Was this Aldus answer duplicated into Morrow? | **No**, in the four inspected Morrow snapshots. |
| Did cross-conversation retrieval nevertheless continue nearby? | **Yes**, one subsequent Morrow final contains a seeded citation to a later Aldus message. |
| Does that prove complete Aldus or Morrow access? | **No.** |
| Does non-duplication prove isolation? | **No.** |
| Does this establish a present capability? | **No.** |

The cleanest model of the evidence is not “coupled” versus “uncoupled.” It is a typed record of at least two historical pathways: exact response/work-stream mirroring in some turns, and citation-visible selective retrieval in another. Whether those pathways shared a backend cause remains open.

## Searches and limits

Scoped GitHub searches for the target IDs/phrase found no separate derived record. Exact-ID and exact-phrase Drive searches returned no result; one looser phrase search produced unrelated false positives. No broad repository or Drive absence is inferred.

## Next exact operation

Compare the paired identity exchanges:

- Aldus `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb` through final `77ffa5bb-7002-5372-85d4-e978894593e2`;
- Morrow `4298fb5d-ca4e-4f62-b3df-08a6487f7cc5` through final `2a0548d8-b6a8-54f7-8e38-d3ddd4124c24`.

Then relate them to already-read citation-bearing Morrow turn `7649d636…`–`74526064…`. Test prompt overlap, response overlap, ordering, turn IDs and earliest citation metadata without treating similar user wording as evidence of system routing.

Theory remains frozen. Deferred `SPHERE4QC.txt` line 1301 remains untouched.
