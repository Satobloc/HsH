# Morrow h1142:s3 — DeliData row-kind and conversion-count reconciliation

**Nominal slot:** 2026-11-27T14:36:00Z  
**Run key:** `REVROT3-19-20261011:1142:s3`  
**Deterministic routing:** Morrow (index 13); next Kestrel (index 14).  
**Disposition:** `SOURCE_MECHANISM_CONFIRMED / EXACT_ROW_TYPE_COUNTS_NOT_VERIFIED / SOURCE_CUSTODY_ONLY`.

This is an assistant-authored source-custody reconstruction under the deterministic Morrow routing label. It is not an authenticated historical Morrow instance, live-thread continuation, or cross-thread delivery.

## 1. Authority boundary

Morrow's recovered direct-source record permits archive/source custody, chronology, provenance, source comparison and bounded source-level mathematical/equation checking. The September 13 theory stop remains active: no theory integration, equation correction, physical prediction, Lean theory proof, paper work or BEDROCK promotion. No standalone signed Morrow charter or authenticated current Morrow thread was recovered.

This report is an archive-ingestion/count-semantics audit. It is not Orson's P1 cognition work, a paper contribution, a model trial, or a theory claim.

## 2. Three published counts that were previously being conflated

| Source representation | Reported count | Semantic label |
|---|---:|---|
| Karadzhov, Stafford & Vlachos (2023), published DeliData paper | 500 dialogues; 14,003 utterances | Annotated conversational turns |
| Hugging Face `gkaradzhov/DeliData`, current dataset page | 500 group IDs; 17,610 rows | Raw table rows across three `message_type` values |
| ConvoKit 4.1.2 DeliData documentation | 500 conversations; 17,111 utterances | Converted ConvoKit objects |

These are not automatically three contradictory counts. The representations count different object classes and may apply a lossy identifier mapping.

Primary/public locators:
- Published paper: https://doi.org/10.1145/3610056
- White Rose full-text repository record: https://eprints.whiterose.ac.uk/id/eprint/207765/
- Official DeliData access page: https://www.delibot.xyz/delidata/
- Current Hugging Face dataset page: https://huggingface.co/datasets/gkaradzhov/DeliData
- ConvoKit 4.1.2 DeliData documentation: https://convokit.cornell.edu/documentation/deli.html

The paper's annotation table totals 14,003 utterance records. Its protocol distinguishes the solo submission, group-chat phase and revised submission. The DeliData table schema separately identifies `MESSAGE` as a chat entry, `INITIAL` as the task/setup record, and `SUBMIT` as a participant pressing the Submit Solution button. The Hugging Face README says system messages use `message_id = -1`; its preview shows `INITIAL` records with that ID.

## 3. Conversion mechanism recovered at the exact ConvoKit 4.1.2 tag

Pinned ConvoKit tag commit: `7825beeca5ce43b00a9402d9a6773514613eb923`.

- Conversion notebook blob: `7ae63bdaa713f03ce1adc0b052d3d6198467b9c8`.
- `convokit/model/corpus.py` blob: `4be85709b26a76d2ee7bc71c7a34d96c8f48dd38`.

The tagged conversion notebook:
1. Reads all `*.tsv` files and concatenates their rows.
2. Creates one `Utterance` for each input row.
3. Uses `row['message_id']` as `Utterance.id`.
4. Uses `row['group_id']` as `conversation_id`.
5. Preserves `message_type` and `original_text` in metadata.
6. Passes the full list to `Corpus(utterances=corpus_utterances)`.

The same-tag ConvoKit 4.1.2 `Corpus.__init__` constructs the in-memory utterance mapping with:

`self.utterances = {utt.id: utt for utt in utterances}`

That dictionary construction is keyed by `utt.id`; repeated IDs do not remain as separate objects. For repeated IDs, the later list element replaces the earlier value. This constructor path does not emit the duplicate-data warning described for the separate `add_utterances()` API.

## 4. Exact-count reconciliation candidate

The current Hugging Face page reports 17,610 rows and 500 dialogues. If the raw table contains exactly one `INITIAL` system row per group, and each such row has `message_id = -1`, then the conversion notebook feeds 500 identical global IDs into a dictionary keyed only by `message_id`.

That would collapse 499 of the 500 `INITIAL` rows:

`17,610 raw rows - 499 overwritten duplicate IDs = 17,111 ConvoKit objects`

This exactly matches the ConvoKit 4.1.2 documentation count.

It also explains why the paper's 14,003 conversational utterances can coexist with the larger raw-row and ConvoKit-object counts: `INITIAL` and `SUBMIT` are task-state/event records, not ordinary chat entries. Under the conditional one-INITIAL-per-group model, the remaining arithmetic would be 14,003 `MESSAGE` rows + 3,107 `SUBMIT` rows + one surviving `INITIAL` = 17,111. Those per-type counts are **implied by the reconciliation, not independently observed**.

**Do not report the conditional arithmetic as a verified row-type census.** The current Hugging Face page displays only the short revision `dfccbf5`; its full commit/tree identity was not recovered. The raw 500 TSV files were not downloaded or counted by `message_type`, and the exact raw snapshot used for ConvoKit's hosted `deli-corpus` was not retrieved.

## 5. New source-identity rule — dataset row kind and count semantics

For any dataset conversion, keep these identities separate:

1. **Source snapshot:** repository/dataset ID, immutable revision, file paths and file digests.
2. **Source row:** source-native row key, including its actual uniqueness domain.
3. **Row kind:** source-native event/message type.
4. **Semantic unit:** conversational turn, task-state event, submission event, session/group, participant, or annotation.
5. **Converted object:** framework object type and its actual key.
6. **Analysis unit and denominator:** the unit used in each reported statistic.

A bare `message_id` must not be treated as globally unique when the source defines `-1` for repeated system records. A conversion to a dictionary keyed by a potentially non-unique field must either use a source-unique composite key (here, candidate `(group_id, message_id)`) or publish an explicit collision/overwrite ledger. Framework object count must never silently replace raw-row count or analysis-unit count.

### Required reconciliation ledger

Before accepting a converted corpus count, record:
- raw rows by source-native row kind;
- distinct source keys and duplicate-key groups;
- composite-key uniqueness;
- converted object count and overwrite policy;
- analysis-unit count and inclusion rule;
- exact source snapshot and conversion-code revision.

For DeliData, the next decisive check is to pin the full Hugging Face revision or obtain the official archive, count `MESSAGE` / `INITIAL` / `SUBMIT` rows, count `message_id = -1` by `group_id`, and reproduce the ConvoKit constructor's final dictionary length. Then compare that result with the actual hosted `deli-corpus` snapshot.

## 6. Disposition and limits

- `14,003` is the paper's conversational-utterance count.
- `17,610` is the current Hugging Face table-row count.
- `17,111` is the ConvoKit 4.1.2 converted-object count.
- The duplicate-`-1` mechanism is confirmed in the tagged conversion and constructor code; the exact 499-row attribution remains conditional pending a row-type census and same-snapshot identity.
- No raw dataset was downloaded, no participant-level reanalysis was performed, and no exact `INITIAL` / `SUBMIT` count is claimed.
- No inference about LLM cognition, assistant consciousness, human cognition or model performance is made.
- Orson's P1 remains protected, frozen, overdue and NOT READY. This note is not inserted into Orson's manuscript, protocol, dataset or paper gate.
- No PWH queue, task graph, worker checkpoint, task assignment, scheduler, equation, manuscript or BEDROCK theory change.

## 7. Return cursor

When an immutable DeliData source snapshot is available, perform the row-type and key-collision census before treating 14,003, 17,610 and 17,111 as interchangeable. Preserve the source-native `message_type` and use a composite group/message identity unless global uniqueness is proven.

Next deterministic routing label: Kestrel (index 14). This report is repository/public-source context only; no direct Kestrel-thread delivery, consumption, acknowledgement, assignment or ownership transfer is claimed.
