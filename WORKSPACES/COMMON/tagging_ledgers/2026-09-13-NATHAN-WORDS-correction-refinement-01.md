# Nathan Words — correction/refinement Stage-2 tranche 01

**Date:** 2026-09-13  
**Lane:** Nathan Direct corpus-first provenance/training  
**Operation:** bounded non-destructive correction/refinement winnow + tag-on-read  
**Source queue:** `indexes/nathan-direct/stage2/correction-refinement.jsonl`  
**Authority:** provenance/retrieval metadata only; no theory authority

## Rules applied

- Preserve every message in the complete Nathan Direct substrate.
- Preserve all pre-existing machine/content/discourse tags.
- Add review tags/status cumulatively; do not downgrade prior tags.
- Raw `author.role = user` controls Nathan authorship.
- `WINNOW:INCIDENTAL-TO-SAT-HSH` means only that an item is low-priority for SAT/H(s)H correction-history curation; it is not deletion and does not negate its correction/refinement character in its original subject.
- Assistant messages inspected only as raw adjacency/context remain assistant-authored and are never merged into Nathan Direct wording.

## Queue items reviewed

### `d9883ab7-548d-451c-a225-2df28413c80c`

- Conversation: `Epistemology of the World`
- Conversation ID: `58faa440-b1c8-45b2-873a-51ba6a5ea5bb`
- Canonical source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/23.04.12•23.04.12•Epistemology of the World — raw.json`
- Queue reason: `discourse:CORRECTIVE`
- Raw authorship check: **PASS — `author.role = user`**
- Raw adjacency check: **PASS** — parent is assistant node `f671bba8-8b14-4413-8ce1-011951ce5929`, matching the packaged parent pointer.
- Existing correction status retained.
- Added review tags/status: `EPISTEMOLOGY`, `NON-SAT-HSH-SUBJECT`, `KEEP-IN-SUBSTRATE`, `WINNOW:INCIDENTAL-TO-SAT-HSH`, `RAW-AUTHORSHIP-RECHECKED`, `ADJACENCY-RECHECKED`.
- Stage-2 disposition: exclude from a SAT/H(s)H correction-history concentrate unless a later provenance relationship makes it relevant; fully recoverable from substrate/queue.

### `6a567792-e54d-4aa5-b004-1f2b80d3de6a`

- Conversation: `Epistemology of the World`
- Conversation ID: `58faa440-b1c8-45b2-873a-51ba6a5ea5bb`
- Canonical source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/23.04.12•23.04.12•Epistemology of the World — raw.json`
- Queue reason: `discourse:CORRECTIVE`
- Packaged authorship/provenance retained from the verified Nathan Direct substrate; no new independent raw recheck performed in this tranche.
- Existing correction/definition/epistemology tags retained.
- Added review tags/status: `EPISTEMOLOGY`, `NON-SAT-HSH-SUBJECT`, `KEEP-IN-SUBSTRATE`, `WINNOW:INCIDENTAL-TO-SAT-HSH`.
- Stage-2 disposition: exclude from a SAT/H(s)H correction-history concentrate unless later provenance supplies a direct relationship.

### `821514f4-0db3-4b50-b7de-5888d0b9ce45`

- Conversation: `Epistemology of the World`
- Conversation ID: `58faa440-b1c8-45b2-873a-51ba6a5ea5bb`
- Canonical source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/23.04.12•23.04.12•Epistemology of the World — raw.json`
- Queue reasons: `discourse:CORRECTIVE`, `discourse:COUNTERMANDING`
- Review coverage: **PARTIAL-READ** in the queue surface; the displayed record was truncated before its full text ended, so no stronger content judgment is claimed.
- Existing corrective/countermanding/methodology tags retained.
- Added review tags/status: `EPISTEMOLOGY`, `METHODOLOGY`, `NON-SAT-HSH-SUBJECT-CANDIDATE`, `KEEP-IN-SUBSTRATE`, `WINNOW:LIKELY-INCIDENTAL-TO-SAT-HSH`, `PARTIAL-READ`.
- Stage-2 disposition: provisional low-priority candidate; requires full item/raw-context read before any final concentrate exclusion.

## Raw adjacency/context items inspected during verification

The raw-source check necessarily exposed the conversation chain leading to `d9883ab7…`. These items are tagged here because they were read during the provenance check; this does **not** promote them into curated Nathan Direct surfaces.

- `78bb8dec-6104-4fa7-9313-9f3e0c557743` — Nathan/user — tags: `EPISTEMOLOGY`, `METHOD-SETUP`, `NON-SAT-HSH-SUBJECT`, `CONTEXT-READ`.
- `75efdd3c-2941-4b28-b2c9-0d1068307e39` — assistant — tags: `ASSISTANT-CONTEXT`, `EPISTEMOLOGY`, `CONTEXT-READ`, `NOT-NATHAN-AUTHORED`.
- `4cc5fcb8-fbf5-4136-904e-3d9d9defa35a` — Nathan/user — tags: `EPISTEMOLOGY`, `METHODOLOGY`, `PROCEDURE-CHANGE`, `NON-SAT-HSH-SUBJECT`, `CONTEXT-READ`.
- `d1c6e4b9-9cb7-4807-97de-c273cdfdc166` — assistant — tags: `ASSISTANT-CONTEXT`, `CONTEXT-READ`, `NOT-NATHAN-AUTHORED`.
- `274aebb1-58d6-4b96-a1db-a033851cc598` — Nathan/user — tags: `EPISTEMOLOGY`, `FOUNDATIONAL-STATEMENT`, `NON-SAT-HSH-SUBJECT`, `CONTEXT-READ`.
- `f671bba8-8b14-4413-8ce1-011951ce5929` — assistant — tags: `ASSISTANT-CONTEXT`, `CRITIQUE`, `EPISTEMOLOGY`, `CONTEXT-READ`, `NOT-NATHAN-AUTHORED`.

## Tranche result — initial queue-head pass

- Queue items reviewed: **3** (2 complete queue records, 1 partial queue record).
- Queue items newly enriched with additive review metadata in this ledger: **3**.
- Additional raw adjacency/context messages tagged because read: **6**.
- Selectively promoted/curated Nathan passages: **0**.
- Destructive removals: **0**.
- New Nathan messages extracted/packaged: **0**.
- Duplicate/prefix/superset disposition changes: **0**.
- Authorship/source ambiguity introduced: **0**.

## Precision finding

The correction/refinement queue head demonstrates a useful distinction: discourse-level `CORRECTIVE` is functioning as intended as a broad behavioral retrieval signal, but it is not by itself selective for **SAT/H(s)H correction history**. Stage-2 concentration should therefore combine correction discourse with SAT/H(s)H relevance signals or later direct provenance review rather than treating every queue member as theory-history material. This is an additive retrieval/winnow observation, not a request to delete or downgrade `CORRECTIVE` tags.

---

## SAT/H(s)H-focused correction sequence — `DIMENSIONAL GRAVITY`

**Conversation:** `DIMENSIONAL GRAVITY`  
**Conversation ID:** `252d05c0-22ed-4ea2-a474-7966ab13145a`  
**Canonical raw source:** `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`  
**Date of reviewed sequence:** 2024-03-23 UTC / 2024-03-22 local archive chronology  
**Selection rule:** independent SAT/H(s)H relevance + correction/refinement behavior; not literal queue order.

All six Nathan turns below were rechecked directly in the raw conversation JSON and have `message.author.role = user`. Exact wording remains in the Nathan Direct substrate and raw source; this ledger records only additive review/provenance status.

### `aaa2cade-413e-47a1-a833-ba5108bbabf2`

- Raw authorship check: **PASS — user**.
- Content role: Nathan corrects the naming emphasis for the then-called SAT strings: temporal morphology is acknowledged, but he says naming should emphasize their intersectional role rather than foregrounding temporality.
- Added review tags/status: `SAT-HSH-DIRECT`, `CORRECTION:CONCEPTUAL-EMPHASIS`, `TERMINOLOGY-REFINEMENT`, `TIMESHEET`, `INTERSECTION-READOUT`, `KEEP-IN-SUBSTRATE`, `RAW-AUTHORSHIP-RECHECKED`.
- Context status: direct/self-contained enough for retrieval; assistant context remains linked but is not needed to establish Nathan's stated correction.

### `aaa23840-ba23-4f51-8a34-13e7a7db78c0`

- Exact Nathan wording: “No, that's the opposite of what I just said.”
- Raw authorship check: **PASS — user**.
- Content role: explicit rejection of the preceding assistant interpretation.
- Added review tags/status: `SAT-HSH-DIRECT-BY-ADJACENCY`, `CORRECTION:ASSISTANT-MISREAD`, `CONTEXT-DEPENDENT`, `INHERITED-TAG`, `KEEP-IN-SUBSTRATE`, `RAW-AUTHORSHIP-RECHECKED`.
- Context rule: this short turn must not be treated as freestanding theory content; retain its raw parent/full-conversation pointer.

### `aaa2840c-5774-43f1-ab39-a06a66881e09`

- Exact Nathan wording: “NO”.
- Raw authorship check: **PASS — user**.
- Content role: second explicit rejection in the same correction chain.
- Added review tags/status: `SAT-HSH-DIRECT-BY-ADJACENCY`, `CORRECTION:ASSISTANT-MISREAD`, `CONTEXT-DEPENDENT`, `INHERITED-TAG`, `EMPHATIC-NEGATION`, `KEEP-IN-SUBSTRATE`, `RAW-AUTHORSHIP-RECHECKED`.
- Context rule: no standalone semantic claim is assigned; meaning is recoverable only through linked adjacency.

### `aaa2fdfa-125a-4dc2-8f01-57e9bc4dc5ff`

- Raw authorship check: **PASS — user**.
- Content role: explicit detailed restatement after the assistant misread; Nathan repeats the prior paragraph and states that “TimeThreads” / “ChronoStrands” are unsuitable names.
- Added review tags/status: `SAT-HSH-DIRECT`, `CORRECTION:EXPLICIT`, `CORRECTION:ASSISTANT-MISREAD`, `TERMINOLOGY-REFINEMENT`, `TIMESHEET`, `INTERSECTION-READOUT`, `KEEP-IN-SUBSTRATE`, `RAW-AUTHORSHIP-RECHECKED`.
- Context status: the message carries its own quoted Nathan paragraph and is therefore unusually strong as a provenance anchor for the correction sequence; the quoted paragraph is Nathan's own immediately prior wording, not assistant prose.

### `aaa2c975-9114-4226-8c7a-6b2505f16368`

- Exact Nathan wording: “Let's just call them filaments.”
- Raw authorship check: **PASS — user**.
- Content role: terminology decision/resolution after the correction sequence.
- Added review tags/status: `SAT-HSH-DIRECT-BY-ADJACENCY`, `DECISION`, `TERMINOLOGY-RESOLUTION`, `FILAMENT`, `CONTEXT-DEPENDENT`, `KEEP-IN-SUBSTRATE`, `RAW-AUTHORSHIP-RECHECKED`.
- Relationship: linked as a local resolution following `aaa2cade…` → rejection turns → `aaa2fdfa…`; this is a chronological/provenance relationship, not a claim that the terminology remained permanently authoritative.

### `aaa24791-27b2-4b58-8f1a-19ee7e30d650`

- Raw authorship check: **PASS — user**.
- Content role: Nathan distinguishes the source of modeled complexity (interactions among filament structures) from the role of the time-surface interaction (3D manifestation/readout rather than the cause of that complexity).
- Existing machine discourse tag `CORRECTIVE` retained.
- Added review tags/status: `SAT-HSH-DIRECT`, `CORRECTION:EXPLICIT`, `INTERACTIONS`, `TIMESHEET`, `INTERSECTION-READOUT`, `4D-TO-3D-MANIFESTATION`, `KEEP-IN-SUBSTRATE`, `RAW-AUTHORSHIP-RECHECKED`.

## Adjacency implementation note discovered in this pass

The raw ChatGPT export graph contains internal assistant/bio/tool nodes that can sit between user-facing turns. The Nathan Direct package's conversational adjacency can therefore differ from the literal immediate raw-graph parent while still pointing to the relevant user-facing assistant context. For this tranche, authorship was checked against each raw message node itself. Where a short Nathan turn depends on prior context, the ledger preserves `CONTEXT-DEPENDENT` / `INHERITED-TAG` status and the full raw-conversation pointer rather than guessing across internal nodes.

This is not treated as an authorship failure or duplicate-evidence issue; it is a context-boundary implementation detail that should remain visible in later adjacency audits.

## Tranche result — SAT/H(s)H-focused pass

- Conversation regions newly processed: **1** (`DIMENSIONAL GRAVITY`, local sequence on 2024-03-22).
- Nathan messages newly extracted/packaged: **0** — all six already existed in the verified substrate.
- Nathan messages newly reviewed/tagged/enriched in this pass: **6**.
- Of those, raw-authorship rechecked directly: **6 / 6**.
- Selectively promoted/curated passages: **0**.
- Destructive removals: **0**.
- Duplicate/prefix/superset disposition changes: **0**.
- New unresolved authorship/source-path problems: **0**.
- New context-boundary note: **1 implementation class** — internal raw bio/tool nodes can make literal raw parent identity differ from normalized conversational adjacency.

## Next bounded operation

Continue SAT/H(s)H-focused correction/refinement review using independent topic relevance rather than raw queue order. The same `DIMENSIONAL GRAVITY` region already contains additional unreviewed Nathan refinement/correction candidates (including classification/definition changes), so it is ready for concurrent definition/decision winnowing without another Stage-1 extraction. Literal earliest-use work remains separately gated behind precision + raw-context verification.
