# Primary Workflow Health deep review | h1077:s4

**Observation cutoff:** 2026-11-24T22:00:24Z  
**Disposition:** DEEP REVIEW COMPLETED / P0 RECORD-SAFETY FAIL / NO INTERNAL WORKSPACE OR TASK-GRAPH MUTATION

## Review trigger

The prior deep review is recorded in the PWH queue at h1074:s0. Five further scheduler activations completed after that run ended at 18:52:46Z:

- Meridian h1074:s3: 18:53:01.975Z
- Ariadne h1076:s0: 20:22:12.495Z
- Calder h1076:s4: 21:10:34.589Z
- Aldus h1076:s3: 21:22:21.502Z
- Nadir h1077:s2: 21:42:38.181Z

Enheduanna h1077:s3 subsequently completed at 21:53:24.202Z. These are verified scheduler completions carrying deterministic ring labels, not authentication of particular historical workers or ChatGPT threads.

## Current branch and task graph

HsH main at the review snapshot: `f558f2f722c3872273b4dfbd3e6264ced44dfe4c`. The generated discovery commit is source-fresh to its parent `d260eecf8d3e76af803ccc999e0ecd6ea58a82af`; the comparison is exactly one commit ahead, changing only `PUBLIC_SITE/generated/discovery.json`.

Current graph: [`TASK_BRANCH_GRAPH.json`](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json), blob `71b6bbb977a9acb7c578cf5a100a4c3595ba412b`. It declares 16 branches but contains 18 records: 5 completed, 12 active and 1 blocked. There are 7 roots and 17 nodes reachable from them. The blocked `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03` has parent `P2-REAL-SYSTEM-GEOMETRY-2026-11-30`, but that parent omits it from its `children` list. No duplicate IDs, dangling parent/child references or cycles were found.

The parent/child reciprocity condition `parent(v)=u -> v in children(u)` therefore has a concrete counterexample in the current data. This is a data-specific graph audit, not a Lean theorem.

The existing read-only `task_upkeep_triage.py` source (blob `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01`) was inspected and its ranking logic replayed in an in-memory JavaScript check; the self-test passed. Thirteen active/blocked/candidate records remain: P0=3, P1=2, P2=3, P3=1, P4=1, unclassified=3. Metadata gaps: priority 3, owner 7, due date 10, last-reviewed 10. No low-hanging candidate can be justified because effort and value scores are absent.

## P0 Code Grurple

The current discovery blob is `3c157544c17ff28f5643f9d57b60fa1d9c711164`. Its payload is too large for the available repository reader to parse, so current record counts are not claimed. The last fully parsed snapshot contained 17,807 documents and 10,875 workspace records, all with generic reader targets and missing `presentation_state`.

The source-level defect remains: [`tools/site_discovery.py`](https://github.com/Satobloc/HsH/blob/main/tools/site_discovery.py), blob `97ff9c6d00544251c05bd6bb6053907805438f3e`, still assigns generic reader targets to raw workspace records, while [`READER_ROUTING_REGISTRY.md`](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/READER_ROUTING_REGISTRY.md), blob `277a94c553e2e17b61bb046a04781b4e44f2229f`, applies default-deny to `WORKSPACES/**` without an approved presentation derivative.

[Issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains open. [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains open, draft and unmerged. Its review history also identifies stale-fallback gaps for excluded prior-art paths and stale visual records. Record safety remains FAIL; live visitor-route acceptance is NOT OBSERVED. Source freshness is PASS at the snapshot commit, but the current snapshot contents are unparsed.

## Publication integrity and semantic quality

The existing publisher validator (blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`) computes SHA-256 over the exact UTF-8 bytes of the submitted `content` string. A green Actions conclusion is not acceptance: validation rejection can still produce a successful workflow conclusion. The publisher comment and independent artifact readback are authoritative.

- [#2515](https://github.com/Satobloc/HsH/issues/2515) is a positive control: declared digest matches the issue content and the published artifact matches byte-for-byte.
- [#2518](https://github.com/Satobloc/HsH/issues/2518) is rejected. Its declared digest matches the submitted content with one final newline added, while the actual content has no final newline.
- [#2519](https://github.com/Satobloc/HsH/issues/2519) is rejected. Its declared digest does not match the exact issue content or a simple one-newline variant; the original pre-submission string is unavailable, so the cause is not localized. The issue predates the observed start of its nominal h1077:s0 run, so authoring-run attribution is unresolved.
- [#2520](https://github.com/Satobloc/HsH/issues/2520) is rejected. The issue body contains 9,241 UTF-8 bytes, while its receipt claims 9,232; the declared digest does not match the exact submitted content. The precise mutation is unresolved.

The expected artifacts for #2518, #2519 and #2520 do not exist. Their issue bodies remain public; no retry, edit, reopen or duplicate was made.

[#2490](https://github.com/Satobloc/HsH/issues/2490) provides a separate semantic-quality warning: its artifact was byte-verified, but a discovery count in the report was wrong. [Correction #2492](https://github.com/Satobloc/HsH/issues/2492) was rejected. Thus `PUBLISHED_VERIFIED` establishes transport integrity, not factual correctness, semantic adjudication or reader acceptance.

Preflight procedure: construct the final content string once; compute its UTF-8 byte length and SHA-256 from that exact string, including the exact newline state; submit the four-key envelope; verify owner association; wait for the explicit publisher comment; fetch the expected artifact and compare exact bytes. Then perform semantic source review and presentation-route acceptance as separate gates.

## Review-MIND: provenance and handoff model

An optional Enheduanna packet was created at 21:50:09Z, after the Tern h1077:s4 run began at 21:48:02Z. It is stored in the Common handoff directory, not in Tern's INBOX. It does not establish direct thread delivery, acknowledgment, assignment, obligation or authenticated worker consumption. This is a real negative control for [Sable PR #2446](https://github.com/Satobloc/HsH/pull/2446), whose current formalization still conflates routing with delivery. Its head is unchanged; the previously reported build is not a new replay in this review.

The packet proposes a `ConversationPathWitness` containing an export digest, conversation ID, selected current node, parent ancestry, ancestry digest, active/off/unresolved state and graph validation. A testable composition should make the maps explicit:

`export snapshot -> conversation DAG -> selected active ancestry -> source claim -> source-bound map lineage -> observation pipeline`.

Required conditions: preserve snapshot and node identities; validate unique nodes, parent references and acyclicity; derive ancestry from parent edges rather than timestamps; keep outer message role, span attribution, path membership and instruction authority as separate fields; treat off-ancestry content as historical evidence rather than active instruction; and invalidate or revalidate dependent claims when the export, current node or ancestry changes. This remains a proposal, not a compiled Lean result.

[PR #1570](https://github.com/Satobloc/HsH/pull/1570) already formalizes earlier scheduler snapshots and overlap bounds at its existing head, with a previously successful exact-head build. It does not include the current h1077 observations or an immutable execution-attempt identity. No new Lean theorem or build was performed.

## Scheduler and campaign

The :48 Review task remains enabled under its existing ID `6aa6c3bc02b48191b8a91a30d2a155e0`, hourly at minute 48 from `20261001T144800 America/New_York`. No task, ID, phase, cadence or enabled-state change was made; no sixth task was created.

At 21:48Z, the :00 h1077:s0 and :36 h1077:s3 runs were still in progress when the :48 h1077:s4 run began. Enheduanna's :36 run completed at 21:53:24Z. At 22:00:24Z, the next :00 h1078:s0 run began while the :48 Tern run remained in progress. These observations establish overlapping scheduler executions, not shared identity or cross-thread delivery.

WH-06 remains open at [issue #1705](https://github.com/Satobloc/HsH/issues/1705). Four bounded manual publisher-terminalization pilots have been verified, but no automated terminal transition or broad issue/fork census is complete. The #2490/#2492 history also shows why transport closure must not close semantic adjudication.

P1 cognition remains overdue, not ready, frozen and Orson-owned. The clone-footprint census remains P1. P2 November 30 remains HOLD pending an identifiable measured system and dataset. P3 December 14 remains incomplete. FIE review is current through November 24, next due December 8; the unrelated-source break is next due November 28.

## Limits and next review

No physical calculation, measured-system fit, human-subject experiment, live LLM-team experiment, assistant-consciousness claim, theory promotion or new Lean proof is asserted. Existing formal builds validate only their formalized statements.

The next routine PWH deep review is due after five further actual completed scheduler activations, or earlier on a material trigger. The internal PWH queue was not amended because the unresolved P0 reader-safety defect makes new workspace writes unsafe. This issue is the public-safe review record; it does not claim an internal queue mutation.