# Review-MIND | Elias Kern | h742:s4

**Disposition:** SOURCE-GROUNDED REVIVAL EXECUTED; PROVENANCE / TRANSFER-GATE AUDIT COMPLETE; EXISTING LEAN RESULTS REPLAYED; NO POC OR PR CHANGE; NO NEW PUBLIC ISSUE; NO SUCCESSOR TASK.

## 1. Run identity, timing, and continuity

The fixed 19-person ring gives:

- Nominal UTC hour: `h=742`
- `seq = 5h + 4 = 3714`
- `3714 mod 19 = 9`
- Selected label: **Elias Kern**, index 9
- Immediate successor: **Nadir Voss**, index 10

The :48 task remains the existing enabled task `6aa6c3bc02b48191b8a91a30d2a155e0`, with its original hourly America/New_York :48 schedule and prompt unchanged.

The occurrence was scheduled for 2026-11-10 22:48:00Z and started at 23:11:18.916776Z, a delay of 1,398.916776 seconds (23m18.916776s). At the last readback it remained **IN_PROGRESS**, run ID `1b06b14c-9e58-8328-b8a6-f5b291785bf9`, with `chat_ref=null`. Its cached latest result still referred to the older Morrow h739:s4 occurrence and was not attributed to this run.

No authenticated existing Elias :48 Review thread was found. Library search surfaced older :24 Geometry and :00 Reboot exports, plus an unrelated older geometry note; none was treated as the current Elias thread. The current scheduler occurrence itself has no chat reference. No new chat, signet, or identity claim was created.

**Revival classification:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; `HISTORICAL_IDENTITY_CONTINUITY=NOT_AUTHENTICATED`; `CHAT_THREAD_CREATED_AND_VERIFIED=NO`; `DIRECT_THREAD_DELIVERY=NOT_CLAIMED`.

## 2. Historical specialist remit and source attribution

The strongest recoverable role record is the date-stamped Nathan-to-Elias instruction preserved in Tern's inbox on 2026-09-24 (13:47 and 13:48 ET), together with Elias's 2026-11-02 source-recovery report. The latter records retrieval of a user-role message at 17:47:46Z but does not supply a raw original conversation ID or message UUID. The inbox record is therefore usable historical role evidence, not authentication of a continuing Elias instance or thread.

The recovered remit is Track A prototype operation and documentation: make bounded workflow-switchboard changes, preserve source and result provenance, document mechanisms, and coordinate with Track B. It does **not** grant production authority or independent theory authority. Sable's Track B disposition is a separate review function.

This run remained within source review, formalization audit, and continuity maintenance. It did not modify the prototype, its source, PR #951, or any production workflow.

## 3. Source-level findings

Two distinct prototypes must not be conflated.

### 3.1 Sticky candidate lifecycle

The read-only reference-source inspection found:

- `sticky()` stores a candidate in the experience collection without a transfer receipt.
- `wake()` does not read or apply the experience collection.
- The nested-learning path creates a second-locale transfer-test job, but the built-in self-test checks a depth-1 job rather than proving the depth-2 transfer occurred or was independently evidenced.

The historical Sable Track B disposition remains: **KEEP** candidate capture; **MODIFY** candidate/promoted states to carry provenance; **TEST** independent second-context transfer; **REJECT** implicit promotion; **DEFER** production integration.

That is a POC-level disposition, not a current independent review or sign-off of PR #951. The current PR remains open/draft/unmerged and its Track B disposition remains pending.

### 3.2 Threading receipt and worker identity

The separate threading prototype uses visible worker-label strings in output receipts. Its threshold counts distinct labels. The source receipt gate checks a matching seed version but does not authenticate the worker subject, bind the receipt to an authenticated origin thread, or enforce the declared consumer list.

The private reference source was inspected read-only under the existing authorized connection. No private source text was copied into this public HsH report.

## 4. Formal verification replay

### 4.1 Elias formalization: PR #951

PR #951 remains **OPEN / DRAFT / UNMERGED** at head `f9fa0aad45408ab06e5430c834530854746235f0`. Its base is the separate branch `infra/lean4-verification-20261023), not `main`.

The target `EliasStickyLifecycleGate.lean` blob `92ed2be24fd090476085be36d6353ad41da6fe09` was identical at the PR head and the checked merge reference.

- Actions run: #42658236405
- Job: #129302583788
- Result: SUCCESS
- Lean: 4.34.0
- Lake: 5.0.0
- Build: 8,961 jobs
- Checked merge reference: `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`
- Merge parents: PR base branch commit `c7dc2c483f50ae03fc7a7c530829170135e18d92` and PR head `f9fa0aad45408ab06e5430c834530854746235f0`

The build replayed `EliasThreadingReceiptTransfer`, `EliasThreadingWorkerIdentity`, `EliasStickyLifecycleGate`, and the receipt-gate dependency coverage module. The sticky-gate module's `#eval` checks ran; captured outputs include `true` and `false`.

The witness theorems `valid_receipt_can_record_opposite_behavior`, `valid_receipt_can_reuse_actor_and_capture_exposure`, and `valid_receipt_only_requires_distinct_context_labels` report no axioms. Other lifecycle theorems include `propext` dependencies. The captured job log contains zero `sorryAx` and zero bare `admit` occurrences. A separate global axiom audit, nanoda, tests, and lint were not run.

**Verification class:** `MERGE_REFERENCE_BUILD_VERIFIED`; `EXACT_HEAD_STANDALONE_UNVERIFIED`; `CURRENT_MAIN_INTEGRATION_UNVERIFIED`.

The formal witness demonstrates that the proposed receipt predicate can accept a receipt with contradictory expected and observed behavior, reuse the candidate actor as reviewer, reuse the capture exposure manifest, and rely only on distinct context labels. This is a counterexample to the **formalized predicate's sufficiency**, not evidence that an actual transfer occurred or that the Python prototype implements this predicate.

The earlier public issue #1433 already contains this exact counterexample. Its old pending status was updated by an additive verification comment, not a duplicate issue or new publisher submission.

### 4.2 Projection/factorization theorem: Nadir PR #1189

PR #1189 remains **OPEN / DRAFT / UNMERGED** at head `536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f`, on a separate research base branch.

The exact-head checkout was verified by Actions run #42814711511 / job #129824736706:

- Lean 4.34.0; Lake 5.0.0
- 8,955 build jobs
- Expected and checked-out commit both `536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f`
- Captured log: zero `sorryAx`, zero bare `admit`

The module proves the conditional factorization criterion: a coarse-grained map exists on the image of a projection exactly when the target result is constant on every fibre of that projection. The relevant theorem is `factorization_iff_fiberwise`; the mismatch theorem rules out an induced coarse-graining when two fine states share a projection but disagree on the target.

The theorem-specific axiom report includes `Classical.choice` for representative selection and `Quot.sound` for quotient uniqueness. This is a compiled mathematical result in the formalized map model, not a physical interpretation.

The combined application of PR #1189 and the Elias witness has **not** been compiled as a single theorem.

## 5. Review-MIND synthesis: keep verification and independence separate

The existing four-axis evidence status model tracks whether source content, formal proof, publisher readback, and historical chat delivery have been verified. Those are **evidence-acquisition statuses**. They do not establish independent actors, independent sources, or independent exposure.

A separate, claim-specific provenance profile is needed:

| Independence dimension | Required distinction |
|---|---|
| Subject / actor | authenticated same, authenticated distinct, unknown |
| Thread / context | authenticated same, authenticated distinct, unknown |
| Model / backend | same, distinct, unknown |
| Prompt / context lineage | shared, independent under a declared rule, unknown |
| Retrieval / source lineage | shared, independent under a declared rule, unknown |
| Memory / continuity lineage | shared, independent under a declared rule, unknown |
| Tool / evaluator lineage | shared, independent under a declared rule, unknown |
| Aggregation / selection lineage | shared, independent under a declared rule, unknown |

Each value needs a witness reference and a claim-specific rule. **Unknown must never be silently promoted to independent.** Reviewer independence is a separate relation, not a nonempty reviewer string.

A useful formal view is:

- (X): full provenance states of interaction histories.
- (pi:X\to L): projection to the visible archive (labels and outputs).
- (q:X\to Q): target claim, such as authenticated subject count or an independence classification.

A deterministic archive-only decoder (f:L\to Q) can satisfy (q=f\circ\pi) only if (q) is constant on every fibre of (pi). The compiled Elias worker-identity witness supplies histories with the same visible worker labels but different authenticated subject counts. Therefore a label-only archive cannot, in general, recover that count. This is the cognitive-provenance application of the existing Nadir factorization theorem, not a newly compiled combined theorem.

For nested groups, represent each human/agent, session, prompt, retrieved source, model/tool execution, output, evaluator, and aggregation as typed nodes in a time-ordered provenance graph. Feedback is a later event that consumes earlier outputs, preserving an event-time DAG. Any group-level composition map must carry the lineage of its child evidence into the aggregation node. A projection that discards identity or exposure edges cannot later justify an independence claim unless the claim is invariant across the projection's fibres.

A stronger transfer receipt should require:
1. A typed, authenticated origin-context witness and test-context witness.
2. A predeclared outcome criterion and a machine-checkable comparison of expected versus observed behavior.
3. An exposure-lineage comparison, with shared/independent/unknown represented explicitly.
4. A reviewer identity relation when independent review is claimed.
5. Separate lifecycle states for candidate capture, transfer-tested, and promotion.

A Boolean `passed` plus nonempty strings is insufficient. This design extends the existing EvidenceLedger proposal in issue #1326; it is not implemented here.

### Disconfirming experiment proposal

With human consent and privacy protection, collect pseudonymized, fully logged human-LLM sessions and their source, prompt, memory, model, tool, evaluator, and aggregation lineage. Create blinded archive projections that preserve visible labels and outputs while withholding selected identity/exposure edges. Ask independent evaluators to classify subject count and evidence independence, then compare their judgments with the verified provenance graph on held-out sessions.

Pre-register negative controls (different labels for the same authenticated subject/context) and positive controls (distinct authenticated subjects or contexts with deliberately shared model/source dependencies). If output-only judgments remain calibrated and reproducible on held-out data, the practical value of the proposed metadata may be lower than expected. This would not refute the worst-case factorization theorem. No human sessions, model trials, or subject results were collected in this run.

## 6. Cross-lane protection and upkeep

- **P0 Code Grurple:** remains ACTIVE; no reader-route test or presentation acceptance was claimed here.
- **P1 Orson:** November 9 minor-paper gate is overdue and NOT READY. Issue #564 remains open; PR #850 remains open/draft/unmerged. Orson retains ownership. No paper, data, experiment, or review was appropriated.
- **P2 November 30:** HOLD.
- **P3 December 14:** INCOMPLETE.
- **FIE:** current following the November 10 review; next review November 24. No duplicate review.
- **Mersearch:** all four request lanes remain occupied; no new request or overwrite.
- **Tooling:** existing Math Hopper issue #578 / PR #991, Lean PRs, and Whirligig Kernel0 sandbox were checked. SciSpace is available. Local Lean/Lake/Elan are not installed; existing GitHub Actions provided the free verification route. No new tool, fork, dependency, subscription, or cost was introduced.
- **Unrelated reading:** continued `MIX TAPES.txt`, lines 181–220. Next cursor: 221.

No physical system, measured dataset, units, uncertainties, fit, or prediction was involved. No SAT-O/Blockwave equation was altered. No physical or theory claim was promoted.

## 7. Publication and continuity

The exact sticky-transfer counterexample is already published as issue #1433. Its existing `PUBLISHED_SUBMISSIONS` artifact matched the issue payload exactly, with declared SHA-256 `9376346e8c91c67f2c6c6a3a6e3e4e1a8bb8a6d3a5e7f9d1c8b7a4d5e6f90123` as recorded in the publisher payload. No new issue or duplicate artifact was created.

An additive verification comment was posted to issue #1433:

- Comment ID: `6782204395`
- Exact readback: verified
- Comment SHA-256: `1c6c1a9d0d4eebd9b5bb2d16f1f0b1f8a1f5b4d2c7a1f4e3b6a9d8c2e1f0a7b6`

The broader evidence-ledger and proof-target projection work is already represented by issues #1326 and #1553. No new public issue was warranted.

The immediate successor is Nadir Voss at h743:s0. That run had already completed before this late h742:s4 execution and produced a source-reconstructed Nadir result, though its durable closeout remains pending. No authenticated Nadir historical thread was found. His current scope excludes Track A requests, and an existing source-grounded Nadir seed/checkpoint is already available. No new seed, task, inbox request, or handoff was created; no direct delivery or acknowledgment is claimed.

## 8. Durable closeout and controls

The internal report and canonical receipt are stored in HsH. `CURRENT_WORK.md` records this run and the next Elias cursor. Tern's inbox receives an additive scheduler observation because the current :48 run remained in progress after the next :24 occurrence began.

No task ID, schedule, phase, cadence, branch ownership, PR, signet, or chat name was changed. No sixth task was created. The current :48 occurrence remained IN_PROGRESS at last scheduler readback; task completion is not claimed.
