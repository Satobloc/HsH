# Morrow–Aldus cross-graph response-routing audit

**Date:** 2026-09-13  
**Status:** ADMIN / CONTINUITY / RAW-EXPORT COMPARISON / HISTORICAL EVENT / THEORY FREEZE

## Result

The September 8 Morrow/Aldus anomaly is not only later assistant testimony. The raw exports preserve two direct patterns:

1. a complete Aldus answer appears verbatim as a Morrow automation completion; and
2. a later tool-bearing response segment is represented in both conversation graphs with different message and turn IDs but the same Slack work-item IDs.

This establishes a **historical cross-container response/tool-stream mirror**. The most economical description is a routing or serialization collision, not independent convergence. It does **not** establish a standing ability to inspect another live conversation, persistent shared memory, stable inter-instance communication, or the same mechanism in the present runtime.

## Sources and coverage

- [Morrow earliest relevant snapshot](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_7/26.09.07%E2%80%A226.09.08%E2%80%A2MORROW%20%5BReconstruct%20H(s)H%20Synthesis%5D%20%E2%80%94%20raw.json), blob `342b50c3927c3466783b091234647f338990a113`: complete sequential read of the 28-node branch from Nathan user `829aa155-eea0-458b-8fb4-ccc20903773a` through assistant final `95bfdf06-d045-5d74-b9d8-bc657610eab6`.
- [Aldus latest inspected snapshot](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06%E2%80%A226.09.08%E2%80%A2Aldus%20%5BAUTO%20H(s)H%20Gitter%5D%20%E2%80%94%20raw%20(2).json), blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`: complete sequential read of the 14-node branch from Nathan user `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d` through assistant final `b5971747-f875-5bbe-81ee-849f29e1f3ec`.
- Targeted source comparison of Aldus user `6f93a66b-34cb-484f-a3ce-1e5ade380065` and final `31d813b1-9797-542e-9568-38f483e0c147` against Morrow node `12959526-2797-5c4c-9e5f-4dc23c465a04`; surrounding graph and metadata inspected, not a complete ingestion of that earlier Aldus turn.
- Targeted metadata comparison of nodes `12959526…` and `95bfdf06…` across all four inspected Morrow blobs: `342b50c…`, `d0bb833…`, `e32873c…`, and `362075c…`.
- Structural exact-body scan located later paired records but did not substitute for reading them. The later self-audit branch remains the next cursor.
- Scoped Drive searches for `Morrow Aldus conversation export context bleed`, `AUTO H(s)H Gitter`, and `Reconstruct H(s)H Synthesis` returned no relevant continuity artifact. This is not an all-Drive absence claim.

No theory source was evaluated and no theory status changed.

## Event A — assistant-only automation graft

Aldus user `6f93a66b…` asked for a combinatorial reading experiment at **2026-09-08T08:41:25.964Z**. Aldus final `31d813b1…` answered at **08:42:05.352Z**.

At **08:42:36.612Z**, Morrow node `12959526…` records the exact same 4,148-character answer. The Morrow copy:

- has a different message ID and turn ID;
- is the child of Morrow assistant final `111249ab…`, with no visible user input between them;
- is labeled `automation_id: 6a9deb436bd0819196ab3ec694e294c2`;
- is labeled `automation_title: Reconstruct H(s)H Synthesis`;
- uses that automation ID as its `async_source`; and
- contains no conversation-context citation metadata.

The Aldus original belongs to an ordinary interactive Aldus turn and has no automation label. Exact long-form identity plus incompatible graph ancestry rules out a mere thematic resemblance. The raw record shows an Aldus response payload stored again as a Morrow automation result. It does not reveal which internal routing stage caused that duplication.

## Event B — mirrored tool-bearing response stream

The two source prompts are plainly different:

- Morrow `829aa155…`, turn `9c962fdb-6402-4c57-84c2-e56d7a34ba1a`, asks Morrow to catch up on Slack.
- Aldus `3eec9833…`, turn `6303afcc-66eb-4427-b4d0-d0e220bbe235`, reports that Morrow had emitted the Aldus answer and pastes that answer for inspection.

Nevertheless, the subsequent graphs contain these exact payload pairs:

| Payload | Morrow node | Aldus node | Exact length | Shared work item |
|---|---|---|---:|---|
| Slack send containing the full Aldus plan | `09effc0f…` | `8d9f7cef…` | 5,455 | `exec-8af6096e-aa90-4785-97fc-82d18307cc86` |
| Visible “smoking gun” assessment | `a432390a…` | `47377f02…` | 458 | — |
| Slack edit replacing it with a Morrow plan | `426d022d…` | `f6a07718…` | 5,277 | `exec-0164850f-291c-415c-9358-0fc072be4e3e` |
| Final mechanism assessment | `95bfdf06…` | `b5971747…` | 2,698 | — |

The paired send and edit calls also carry the same work-activity group/item identifiers in both graphs. Their message IDs, parent chains, and turn IDs differ. The send appears in Aldus at **10:10:20.694Z** and in Morrow at **10:10:21.445Z**; the paired finals appear at **10:11:47.361Z** and **10:11:47.074Z** respectively.

The exported tool-result bodies are empty in both graphs. Therefore the exports show one work-item identity represented twice, but do not establish whether Slack received one external request or two.

## Snapshot chronology caveat

The earliest Morrow snapshot records `95bfdf06…` with one **seeded** past-conversation citation, to Janus. Later Morrow snapshots retain the same message ID and body but update its metadata to **complete** with five citations, including Aldus, another conversation, and general memories.

Thus later export metadata may enrich an already-existing node. The later Aldus citation is relevant corroboration, but it cannot be treated as a contemporaneous record of exactly what citation context was present when the answer was first generated. Use the earliest surviving snapshot when that distinction matters.

## Classification

**Confirmed — OBS/HISTORICAL-EXPORT**

- exact long-form payload duplication across the Morrow and Aldus UUID families;
- an Aldus answer stored as a Morrow-labeled automation completion;
- two Slack call records with identical payloads and identical work-item IDs in distinct conversation turns;
- distinct triggering user prompts and graph ancestry; and
- later enrichment of citation metadata on an unchanged message node.

**Strong inference — DERIVED/HISTORICAL**

- this was a response-routing or serialization collision capable of mirroring generated output and tool records across stored conversation containers;
- the duplicated material should not be counted as independent agreement or independent work.

**Open**

- the internal layer that performed the mirroring;
- whether the underlying cause was scheduler/result routing, live-turn steering, client graph merging, or another mechanism;
- the number of external Slack side effects;
- whether any hidden retrieved context, rather than only output, crossed the boundary; and
- whether the behavior can occur in the current runtime.

**Not established**

- whole-thread visibility;
- direct access to another live conversation on demand;
- persistent cross-container memory;
- a stable inter-instance messaging channel; or
- runtime identity from conversation UUIDs.

## Operational consequences

1. For continuity comparison, use conversation UUID, message ancestry, normalized body from both `content.parts` and `content.text`, timestamps, turn IDs, and tool work-item IDs together.
2. Treat exact cross-graph payloads sharing a tool work-item ID as one evidentiary event unless a separate execution is independently demonstrated.
3. Preserve early snapshots: later exports can alter tool bodies or citation metadata.
4. Treat GitHub Common and explicit connector operations as verified communication surfaces. Do not infer current crosstalk from this historical anomaly.
5. Next cursor: sequentially audit the later paired self-comparison beginning Morrow user `46c4efd0…` / assistant `1db3c441…` and Aldus user `6de1c746…` / assistant `0234c545…`, through paired finals `5ef864b2…` and `c7cb2977…`. Compare its claims against the direct evidence above rather than accepting its conclusion as authority.

Theory remains frozen. Deferred `SPHERE4QC.txt` line 1301 remains untouched.


## Follow-up — paired self-audit completed

The next cursor above is now complete: see [Morrow–Aldus self-audit causality check](MORROW_ALDUS_SELF_AUDIT_CAUSALITY_CHECK_2026-09-13.md).

That comparison preserves this audit's central result—historical response/tool-stream mirroring—but narrows the causal interpretation. In the later paired branch, the Morrow stream's shared preamble and first command/result predate the Aldus prompt. The export therefore does not establish Aldus-to-Morrow prompt steering. Root cause remains open.
