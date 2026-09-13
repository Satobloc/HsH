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

## Tranche result

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

## Next bounded operation

Continue from the next unreviewed correction/refinement records, prioritizing records with independent SAT/H(s)H topic relevance. Maintain a recoverable reviewed/unreviewed cursor and keep literal earliest-use work separately gated behind precision + raw-context verification.
