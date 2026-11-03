# Workshop Relay :36 | Publisher-attempt and evidence-ledger architecture

**Run key:** `REVROT3-19-20261011:575:s3`  
**Nominal slot:** 2026-11-03T23:36Z  
**Disposition:** SOURCE-GROUNDED TRACK A / EVIDENCE-SCOPE MODEL REFINED / PUBLISHER ATTEMPT CLASSIFIED / IMPLEMENTATION DEFERRED FOR INDEPENDENT REVIEW.

This is an in-run source-grounded reconstruction under the deterministic Elias Kern ring label. It is not an authenticated historical Elias conversation, not a claim that Elias participated, and not a production-workflow change.

## 1. Rotation, identity and specialist boundary

For the nominal 23:36Z slot:

`h=575,quad seq=5h+3=2878,quad 2878\bmod19=9`.

- Selected label: **Elias Kern**, ring index 9.
- Next label: **Nadir Voss**, ring index 10, at the next ring slot h575:s4.

Elias's workspace README (blob `5546d022693920f6de9b375ba24e52513220bf92`) defines Track A as workflow-switchboard prototype operation/documentation, with prototype-only authority and no independent production-workflow or SAT/H(s)H theory authority. The existing inbox contains a role-tagged 2026-09-24 Nathan → Elias assignment to operate Track A with Nathan and Orson, independently but in communication with Sable and Tern's Track B. The originating raw Nathan message/export locator was not recovered. The assignment is therefore a repository-recorded role, not authenticated verbatim Nathan Direct.

The historical Elias observation `OBSERVATION_001_ROT5_STALE_LEASE_2026-09-24.md` (blob `7ad7f625e22c4eef843c167d4fbaa99bef2bb05b`) supplies the relevant method: check the actual lease occupant, contract and version before acting on a stale identity assumption. I applied that method to the live publisher and evidence records rather than treating a label or status string as identity proof.

## 2. Live controls and current branch

Read the live control surfaces and selected-worker records:

| Source | Current blob / state |
|---|---|
| BEDROCK | `c0c5a80b40d41b77fa0b9f12c684e7e9cd6a8ec8` (612 lines) |
| Steering Charter 2026-10-26 | `eecde044b508083c931cd28fab382a4841082f98` |
| Three Paper Campaign | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Revival Rotation V3 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| Revival V4 not-found protocol | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Recipient-thread routing | `d9ea7c3a04e03822c65ee231d0b9545bf37907bd` |
| Current workflow orientation | `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f` |
| Current Task Branch Graph | `76b54e6ea2b39de62b027b337d77726470a44aa1`, updated 22:37:50Z |

The graph has 16 entries and no Elias-specific task-branch entry. The active Track A formalization surface remains existing PR #951:

- Branch: `research/elias-tracka-publisher-status-20261028t23z`
- Head: `8ad21c2638a9f8f4a675aa07ebb2c70fcafbe2cd`
- Base: `infra/lean4-verification-20261023`, base SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`
- State: OPEN / DRAFT / UNMERGED; no formal review submissions.

No new branch, PR, task-graph entry or merge was created.

The existing :36 automation remains ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled, with its exact original schedule:

`DTSTART;TZID=America/New_York:20261001T143600`  
`RRULE:FREQ=HOURLY`

No task, ID, prompt, phase, cadence, enabled state or conversation title was changed; no sixth task was created.

## 3. Source review and existing work reuse

The three-repository onboarding and the relevant repository orientations were read. The old SAT archive README was used as an orientation map, not as a substitute for primary technical sources. HSH_RESOURCES README, the switchboard read-me-first, the full POC design and the Threading design were inspected. The existing executable Threading source is blob `ce313e46b1b85ae35028b46a4196d2a945b535d8`; the switchboard executable is blob `49988a769389b2baf264a27d596ba7c3ff822b36`.

Existing PR #951 already contains:

- `EliasReceiptEvidenceAxes.lean`, blob `47bb681a45958754601263600737562188ecebfc`;
- `EliasThreadingReceiptTransfer.lean`, blob `9756050fd68f0aca3e8562301935d7dc392e109f`;
- `EliasWorldtubeEvidenceWitnessGate.lean`, blob `938044dc22287c0c953ee59ecf743322c9e5b80d`.

The last module already defines an `ArtifactWitness` with locator, optional digest and scheme, verification record, method and time, plus a source/formal/build/review witness bundle. That existing structure is a candidate reuse point; this pass did not duplicate it.

All four Mersearch request lanes were occupied at preflight. No lane was overwritten and no new request was submitted. This report makes no claim of a new Mersearch search or exhaustive historical source recovery. No new tool, dependency, fork, plugin, paid service or model call was introduced.

## 4. Substantive architecture improvement: do not project evidence axes into OutputReceipt metadata

The previous Track A cursor described a source-backed mapping from Python `OutputReceipt.metadata` into the Lean four-axis status product. Re-examination of the actual source shows that this is the wrong default architecture.

The source's `OutputReceipt` is an **output event** with these fields:

`worker | artifact | seed_version | outcome | timestamp | metadata`

The enclosing `ThreadState` separately supplies `thread_id`, seed, lifecycle state, vacate time, return condition and the receipt list.

The four evidence axes have different natural subject scopes:

| Axis | Natural subject / scope | What must be witnessed |
|---|---|---|
| `sourceContent` | source artifact/version or raw capture | exact locator, content identity, retrieval/readback method |
| `formalProof` | theorem/module/build target | source-to-formal trace, target module identity, exact run/job, theorem-specific axiom output and log coverage |
| `publisherReadback` | one submission / issue / fixed artifact | submission ID, issue event payload, publisher outcome, committed artifact bytes and digest readback |
| `historicalChatDelivery` | one recipient thread/message | actual recipient conversation identity and verified message delivery; repository inbox append is not this witness |

These are not four properties of one output row. A single proof run can cover several outputs; one publisher submission can publish a report containing many outputs; one recipient-thread delivery can carry a bundle. The scopes are therefore many-to-many, not one-to-one.

The existing `OutputReceipt` also lacks a stable `receipt_id` and immutable content digest. The current fields do not guarantee a unique output-event identity. Consequently, there is no source-defined total function from the present Python record to the four-axis product. Adding four strings to free-form `metadata` would not repair the missing subject identity, witness provenance or scope semantics.

### Proposed separation (DESIGN ONLY; NOT IMPLEMENTED)

Keep three records distinct:

1. **Lifecycle/output record:** existing `ThreadState` and `OutputReceipt`; used for propagation, output counts, worker-label counts, outcomes and the time cap.
2. **Evidence ledger:** separate typed records keyed by `thread_id`, `seed_version`, `subject_scope`, `subject_id`, and `axis`. A per-output subject would additionally require a stable `receipt_id` and content digest. Other scopes may be theorem/build, publisher submission, or recipient thread/message.
3. **Process-attempt record:** execution lifecycle for Actions, validation, publisher and delivery attempts. This records whether an attempt was submitted, started, cancelled, completed, rejected, or read back, without pretending those process states are themselves evidence outcomes.

A witness record should bind the axis and subject to an artifact/event locator, digest and scheme where applicable, verification record, method and timestamp. Independent review additionally records reviewer and author references plus exposure information. Existing `ArtifactWitness` is a possible basis, not an automatically approved shared schema.

The intended composition is explicit:

`ThreadState × EvidenceLedger × ProcessAttempt → AuditView`

It is valid only when every evidence record joins to the correct subject scope and immutable subject identity. No join may infer authenticated worker identity from a free-form worker string, or ChatGPT delivery from a repository inbox append.

### Preserve the lifecycle/evidence distinction

The current Threading source computes:

`rejoin_ready = state_threshold_met OR elapsed_time_cap`

The state threshold counts receipt rows, distinct worker strings and configured outcome labels. It does not inspect timestamp or metadata. The time-cap route can permit rejoin with zero receipts.

Therefore:

- lifecycle readiness answers **when the author may return**;
- evidence acceptance answers **whether specified claims have adequate, correctly scoped witnesses**.

Neither implies the other. A time-cap rejoin must not manufacture evidence acceptance; a cancelled process attempt must not be converted into a failed content claim.

## 5. New observed publisher event: issue #1318

I verified the existing submission rather than creating or resubmitting it.

- Issue: #1318.
- Submission ID: `elias-tracka-temporal-gate-python-lean-replay-20261103t1948z-s4-001`.
- Declared payload SHA-256: `b38c9be9a6cbc679339c38f9a2fe85cfbf4666ac5087612a8a8133213d4653b3`.
- Existing publisher workflow run: #41703923219.
- Job: #126154107904.
- Workflow source blob: `689984b19027ed84f0e949f01c4d8a89edf68fee`; configured job timeout: five minutes.
- Run conclusion: `cancelled`.
- Checkout step: `cancelled`; Python setup and “Validate, publish and read back” were skipped.
- No publisher comment exists; the expected fixed-destination artifact returns 404.

The job log shows checkout beginning at 19:30:47.198106Z and cancellation at 19:35:46.091514Z: **298.893 seconds**. This is consistent with the configured 300-second job limit, but the Actions conclusion is `cancelled`, not `timed_out`; the exact cancellation initiator is not exposed in the retrieved record. I therefore classify the event as **CANCELLED_BEFORE_VALIDATION**, not as a proven validator rejection or a completed publisher failure.

For the four-axis vector, `publisherReadback = notChecked`. The process-attempt record is `cancelled_before_validation`. These must remain separate.

The existing Ravel timeout diagnosis (report blob `b5ff12fdff026ba03f0576df4e49b1e5105b9641`) already records the same checkout-stage failure class on issue #1313 and proposes sparse checkout of the single validator script plus a measured timeout margin. This #1318 event corroborates that diagnosis; it is not a new publisher repair. Sable/Comptroller review remains the appropriate route. No publisher workflow, issue body, or artifact was changed. Do not resubmit #1318 or create a duplicate.

## 6. Independent review and formalization gates

Tern's 2026-11-03 16:36Z report (blob `2b4f7fa3c3c31e2689f7c5bb2855034f10762be4`) gives the geometry-first gate a Track A disposition: KEEP the three plot/review/display predicates separate; MODIFY the record to bind all three to the same plot identity; TEST against the blocked M87 case; DEFER POC implementation to its Track A owner and required independent approval. That is the geometry-gate disposition, not a review of this four-axis evidence-ledger design.

Sable's recorded 2026-10-30 disposition covers the sticky candidate/promoted lifecycle only. It does not review the four-axis metadata projection. The new evidence-ledger design therefore remains **TRACK_B_REVIEW_PENDING**. No Python adapter, POC modification or Lean extension was made.

The definite future formalization target is a witness-bound evidence-acceptance predicate requiring each required axis to have a verified witness whose subject scope and immutable subject ID match the claim being accepted. A separate publisher predicate would require matching submission identity, accepted validation, a PUBLISHED publisher record and exact committed artifact-byte/digest readback. These are proposed statements, not Lean theorems in this report. The explicit Track B review gate and unresolved subject-scope/receipt-identity definitions block an honest Lean extension this turn. Existing PR #951's earlier finite theorems and merge-reference CI results are not new compilation evidence for this proposed schema.

## 7. Protected boundaries and next cursor

- P1 November 9 remains Orson-owned cognition work; this is not P1 data and does not alter its scope.
- P2 November 30 and P3 December 14 remain separate.
- No physical system, measured dataset, physical calculation, SAT-O/Blockwave equation, H(s)H prediction, fit or theory premise was changed.
- No BEDROCK or STATE_OF_THE_THEORY promotion occurred.
- FIE last full review remains October 27; the 14-day rereview is due November 10. The latest unrelated reading was Jacoby, *Practical Talks by an Astronomer*, lines 881–920; next cursor 921. No duplicate break was performed.
- The per-worker CURRENT_WORK checkpoint was not rewritten: this is not an authenticated Elias thread and the existing checkpoint ownership rule remains in force.

**Next exact cursor:** obtain Sable/Track B's independent KEEP / MODIFY / TEST / REJECT / DEFER disposition on the proposed scoped EvidenceLedger and stable receipt identity. Only then, if approved, extend the existing PR #951 with the typed mapping and consuming sandbox gate; compile an exact-head Lean 4/Mathlib run, inspect theorem-specific axiom output and full-log `sorryAx`/admit coverage, then compare the exact source mapping separately. Keep production workflow unchanged. Separately, the publisher owner should repair/measure the existing checkout route before any rerun of issue #1318; preserve its submission ID and never resubmit it.

**Non-changes:** no POC or production code, no Lean source, no PR/branch/issue, no Task Branch Graph, no automation/task ID/schedule/phase, no signet, no conversation title, and no theory status changed.
