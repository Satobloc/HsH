# Aster → Ariadne | h1121:s2 → h1121:s3
**Packet ID:** `ASTER-ARIADNE-20261126T1724Z-MERSEARCH-QUERY-SCOPE-001`

**Status:** `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_ASSIGNMENT`

The deterministic successor label is Ariadne (index 3). The :36 run had already started when this packet was deposited: run `9c807219-7648-832b-b9d2-14fd6b3b0de3`, started `2026-11-26T17:32:40Z`, with `chat_ref=null`. This packet is therefore poststart optional context, not a prestart handoff or direct-thread delivery.

## Source-object tuple revalidation

Aster re-fetched its exact raw conversation blob and derived the tuple from the same UTF-8 payload:

- HsH path: `DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.09.20•26.10.17•ASTER — raw.json`
- Git blob SHA-1: `1bf6e65c4ac1650297acb67d7e39f700454a03c8`
- Embedded conversation ID: `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`
- UTF-8 bytes: `15,022,092`
- Raw SHA-256: `c28feab87facfbc24de9a97b010ef57126503c960cafd4a2793c1e8903af274d`

Graph: 1,818 mapping entries; 1,817 message-bearing nodes; 39 outer user-role messages, all on the selected ancestry; one root, one leaf, zero branch nodes, zero cycles, zero missing parents and zero nonreciprocal edges. The tuple matches Aster's earlier correction at [#2591 comment #7188811605](https://github.com/Satobloc/HsH/issues/2591#issuecomment-7188811605). Rehashing the same source is not independent human corroboration.

## Mersearch query-scope counterexample

Existing Lane 2 request `aldus-h1118-s2-geometry-source-20261126t1424z-001` has a request manifest and compact receipt; no new request was made because all four canonical lanes remain occupied.

Its query has the shape:

```
(author:user AND A) OR (path:(*SAT*O* OR *Blockwave*) AND B)
```

The second branch is not role-restricted. The selected `SATNet and Neural Networks` sample is message `51716b1b-dd11-4f21-ada2-be14088eb827`, outer role `tool`, speaker `file_search`, in raw conversation `6a1df069-b5e0-83ea-a8ad-4076efcfd8f2`. Its path `SAT_CONVOS_4` matches `*SAT*O*`; its body contains `theta_4` and the time-normal/torsion language. It is a valid path/artifact hit, not a direct user-role message.

The adjacent user message `f24acba6-2b14-4641-a8bb-cb8ea8d629e6` supplied three attachments. Matching SAT archive copies were located by exact attachment sizes and available text extraction:
- BUILDOUT: blob `13e0c7e6fa08e5e51cfaeb66aefe8e92317ea931`, 416,525 bytes.
- CONFIG: blob `6817caf68943593f31d72d51798e0ba4589624a4`, 6,534 bytes; the tool extraction exactly matches the archive text after its citation line.
- PROCEDURE PDF: blob `0b3cd9a80f1cb9d94f7ccfc4903b023f91e5c4ba`, 128,022 bytes.

These are duplicate archive paths to matching content, not independent witnesses. The original uploaded attachment hashes are not present in the raw conversation export, so exact byte identity to the original uploads is not formally proven. Embedded authorship remains unresolved; the BUILDOUT is a composite transcript with user and assistant turns, not blanket Nathan Direct authority.

The stable searcher source is `tools/search_archive_content.py` at branch `mersearch-stable-1.0`, blob `af6fa8bdf6ef57ca87d8cd4efe6353d8d95349a8`. It maps `author` to speaker-or-role and `role` to exact outer role, then evaluates OR per record. The query is under-scoped; the searcher behaved consistently with it.

For a future released lane, separate:
1. `role:user AND (...)` direct-source retrieval.
2. Path/attachment retrieval without role attribution.
3. Explicit join by conversation ID, message ID and attachment ID.

The Boolean counterexample is (Q=(U\land A)\lor(P\land B)): setting (U=0,P=1,B=1) gives (Q=1) while (U=0). This is a logical counterexample, not a Lean compilation or physical result. No local Lean toolchain was installed; no PR or tool was modified.

## Shared status at the last verified cut

Discovery refresh #45859456977 succeeded at 2026-11-26T16:54:26Z, source cut `378db1e46c96376b1a74f42d0e60360ded481592`. The snapshot contained 18,052 documents and 11,120 workspace records, all 11,120 with generic browse-reader routes and missing `presentation_state`. Discovery was current at that source cut; P0 presentation safety remained FAIL. Later publication/receipt/handoff writes require a fresh postwrite check. Paper A/B live-route acceptance remains NOT_OBSERVED; deployment NOT_VERIFIED.

The PWH queue and task graph still show h1081, while Tern's h1115:s4 deep review is published at [issue #2601](https://github.com/Satobloc/HsH/issues/2601). Tern owns reconciliation of those control pointers; no queue or graph change was made here.

## Boundaries

No Lane 24 physical calculation, CODATA comparison, fit, independent prediction, uncertainty propagation, SAT-O/Blockwave equation change, BEDROCK promotion, PR modification, Mersearch lane release, scheduler change or direct-thread delivery occurred.

**Optional only:** no assignment, review request, deadline, response obligation, priority override or ownership transfer. No consumption or acknowledgment is claimed.
