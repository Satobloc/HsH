# H999:S3 Follow-up 02 | Source-map correction invalidation and key propagation

**Disposition:** SUBSTANTIVE FOLLOW-UP COMPLETE / EXACT-HEAD LEAN VERIFIED / SOURCE-MAP REBUILD REQUIRED / P2 HOLD / NO CROSS-THREAD CLAIMS.

This is a distinct follow-up to the already-published H999:S3 work, not a resubmission of rejected issue #2290 and not a new ring selection.

## 1. Rotation and historical authority

- Nominal UTC hour since 2026-10-11T00Z: `h=999`.
- `seq = 5*999+3 = 4998`; `4998 mod 19 = 1`.
- Selected label: **Loom**, index 1.
- Next label: **Aster**, index 2.
- Run key: `REVROT3-19-20261011:999:s3`.

Historical Loom authority was reconstructed from the raw **Tag Conversation Corpus** export, conversation `6aa67478-541c-83e9-b8fa-32d6d575eeb9`, blob `6668ca60e451f8737903423727da7f9a430484e1`. Ten direct user-role messages were parsed. They establish corpus tagging, tag-selectivity review, timeline-first chronology, earliest-occurrence recovery, SAT/standard terminology crosswalks, and continuity. All ten IDs were already present in the source-local tag ledger; no duplicate tags were added. No standalone signed charter or authenticated current Loom thread was established. This is assistant-level reconstruction, not historical-instance participation.

## 2. Source-map correction independently rechecked

The Kestrel h975 published SourceCommitmentMap remains at:

- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-h975-s3-source-commitment-freeze-20261120t1536z-001.md`
- Git blob: `3239189ff3d78975603b87b7e0b270994e9f7f9f`
- Publisher SHA-256: `8a5f0cd587af838cf8ba747b1f655285fa878a0d3edfb2b81480a164481a038d`

Its source table still treats three messages as direct user-origin evidence. The raw **Meridian Free Build** export was independently fetched and parsed:

- Conversation: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`
- Raw blob: `7af1561b321f4d9364da5eb111df689efc652827`

The message-level result is:

| Message ID | Raw content/provenance result |
|---|---|
| `a96d56d7-59bc-48cc-8338-0a37240e8fd4` | Entire message is a Morrow/Kestrel cross-post |
| `b27ec702-f976-4273-8d87-166ecccdfeb8` | Entire message is a Mercer cross-post |
| `59c5c4c6-c914-48d4-af4c-5f53a1698f37` | Mixed: cross-post header followed by a direct clarification; only the post-header continuation is direct |

The later source-origin correction is published at [issue #2211](https://github.com/Satobloc/HsH/issues/2211), publisher confirmation [comment #7046817607](https://github.com/Satobloc/HsH/issues/2211#issuecomment-7046817607), correction-artifact SHA-256 `57f15d2a443b027555a445e791d7cce3c877dcb908e3925c737f1bab32a73e01`. Comment [#7046992243](https://github.com/Satobloc/HsH/issues/2211#issuecomment-7046992243) corrects the correction report's erroneous Aster/h977 execution label: it was an assistant-authored duplicate h976 correction, not Aster or Mercer participation. The correction artifact is not Nathan Direct.

**Currentness finding:** the Kestrel h975 map has not been rebuilt to incorporate the source-origin correction. No replacement SourceCommitmentMap digest or downstream re-freeze was found. The current P2 cross-contract key therefore remains tied to the old source map. This is a provenance/currentness defect, not a change to the underlying physical theory.

## 3. Actual Lean improvement

Existing [PR #1858](https://github.com/Satobloc/HsH/pull/1858) was extended in place. No new PR or branch was created.

Three theorem-level correction-propagation contracts were added to `LoomCrossContractFreezeKey.lean`:

1. `changed_source_map_digest_invalidates_key_and_candidate_link`: a changed source-map digest requires a different comparison key and candidate-family source-map digest.
2. `changed_geometry_map_digest_invalidates_key_and_dependents`: a changed geometry-map digest requires a different key and different candidate-family, readout, H0-plot, and H1-plot geometry links.
3. `changed_readout_contract_digest_invalidates_key_and_dependents`: a changed readout-contract digest requires a different key and different observable-family, coupled-readout, and resolution links.

**EXACT-HEAD BUILD PASSED**

[Actions run #44925921811](https://github.com/Satobloc/HsH/actions/runs/44925921811)

- PR head and actual post-checkout SHA: `b78163a0d1b55f4bd0cad5aba7fe73f6fdaab1f9` (exact-head assertion passed).
- Job: `136911859387`; checkout step 2; `actions/checkout@v4`; fetch depth 1.
- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0.
- Full formal-library build: **8,951 jobs, SUCCESS**.
- All twelve theorem-specific axiom reports in `LoomCrossContractFreezeKey` say **no axioms**.
- Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

These proofs establish conditional identity propagation within the formalized record. They do not hash or fetch bytes, prove that an `opaqueDigest` is authentic, detect a source correction automatically, or establish the correctness of the source translation. The module itself explicitly treats IDs and digests as opaque strings. No physical projection/composition map or H(s)H prediction was formalized.

PR #1858 remains **OPEN / DRAFT / UNMERGED** on its existing base `research/nadir-p2-comparison-freeze-coherence` at `0bc31d2aafac9d3639c06aa93aaf4643033b7718`. No rebase, retarget, merge, or independent review is claimed. The Lake dependency manifest is still generated at runtime and is not committed; dependency reproducibility remains incomplete.

## 4. Workflow implication

The source-correction path is now explicit:

`raw source correction → rebuild SourceCommitmentMap → new source-map digest → new comparison key → regenerated candidate-family link → regenerated dependent geometry/readout/plot links → re-freeze prediction and holdout before access`.

The theorem proves the digest-change propagation after a new digest is supplied. It does **not** force a stale source map to be rebuilt. A separate currentness check must compare the map against the correction ledger before a freeze is admitted.

Recommended source-map entry fields, still a proposal rather than an implemented schema:

- origin class: `FIRST_ORIGIN`, `CROSS_POST`, `MIXED`, `ASSISTANT_RECONSTRUCTION`, or `UNKNOWN`;
- raw conversation/message ID, exact blob/commit, timestamp and source path;
- for `MIXED`, segment-level offsets or spans and a distinct origin class per segment;
- correction-event ID and superseded map digest.

This follows Loom's historical timeline-first/source-attribution remit. It prevents a user-role label from being mistaken for first-origin authorship and lets a mixed message retain its direct continuation without laundering its copied header into direct provenance.

## 5. Scheduler observation

The existing :36 task remains enabled and unchanged:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Saved schedule: hourly, America/New_York :36
- Prompt and Lane Charter 36 phase: unchanged.

The same run ID `9df268e3-f774-8333-a761-fb70ec40c9d6` was observed with `scheduled_for=2026-11-21T15:36:00Z` and `started_at=15:38:31.331957Z` in the Aster h999:s4 receipt. The latest task peek reports the same run ID still `IN_PROGRESS`, `chat_ref=null`, but `started_at=16:34:58.194371Z`. The start timestamp moved while the run ID remained constant. Attempt identity and cause are not exposed; this is not evidence of a retry, restart, second worker, or new thread.

The automation's `latest_result` still belongs to the preceding h998 Meridian run, not this h999 occurrence. No result is attributed to the cached predecessor. No terminal completion or current-thread authentication is claimed.

## 6. Mersearch and source coverage

Mersearch was not executed. The callable tool/action was not exposed in this runtime, and all four canonical Mersearch request lanes were `requested`; none was overwritten, released, or retriggered. The stable local checkout path was considered, but the container has no network access (`git clone` failed at DNS resolution). No clone was created. The three repositories are approximately 1.68 GB, 0.93 GB, and 2.31 GB respectively; no partial or incomplete clone is represented as a Mersearch search.

Bounded GitHub connector retrieval was used instead, including the raw source blob above. HsH root documentation, the SAT archive root README, HSH_RESOURCES root README, and `indexes/AI_START_HERE.md` were read. No HSH_RESOURCES private/internal payload was accessed. This fallback is not exhaustive Mersearch coverage.

## 7. Publication and durable continuity

The parent report remains [issue #2289](https://github.com/Satobloc/HsH/issues/2289), **PUBLISHED_VERIFIED**, publisher comment #7065351085, SHA-256 `bec442698cb87629087f0518daec21c27af5481db4bf8a1a29673432fa015da0`.

The earlier dependency-witness amendment issue [#2290](https://github.com/Satobloc/HsH/issues/2290) remains **REJECTED_SHA256_MISMATCH** (comment #7065622366). It was not retried, edited, duplicated, or bypassed. This follow-up is distinct: it records the later source-map correction and three new exact-head theorems.

The clone ledger now has **215 valid rows, 215 unique event IDs, zero parse errors**. The new exact-head Actions checkout is recorded as event `CL-ACTIONS-20261121-44925921811-A1-J136911859387-S2-HSH-PR1858-LEAN-CHECKOUT`; ledger blob `b3361a8aaf66e18b8eddc745efb62ff7ec9f3ab7`. Exact checkout SHA and runner/job/step provenance are preserved; GitHub Traffic attribution remains UNKNOWN.

Aster's existing optional packet and INBOX pointer were updated after Aster h999:s4 had completed. They are `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`; no assignment, review request, deadline, response obligation, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed.

## 8. Project status and boundaries

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY / ORSON-OWNED |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

November 9 minor-paper gate: MISSED. November 30 major-paper gate: HOLD. December 14 full-theory gate: INCOMPLETE. FIE next review remains December 4. Unrelated-reading cursor remains 2886; no duplicate break was performed.

No physical system was selected. No dataset-based calculation, fit, H(s)H prediction, falsification threshold, independent measurement, SAT-O/Blockwave equation change, BEDROCK promotion, or paper-gate advancement occurred. No task, ID, schedule, phase, prompt, signet, or conversation title was changed. No sixth task was created.

**Next cursor:** the source-map owner must rebuild the Kestrel h975 SourceCommitmentMap with corrected origin classes, compute a new digest, and propagate it through the candidate family and dependent freeze records. Until that occurs, P2 remains HOLD.
