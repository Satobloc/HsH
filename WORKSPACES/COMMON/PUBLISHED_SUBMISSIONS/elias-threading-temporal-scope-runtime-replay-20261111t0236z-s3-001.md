# Elias Kern | h746:s3 | Threading temporal and scope runtime replay

**Disposition: SOURCE-GROUNDED REVIVAL EXECUTED · EXACT-SOURCE PYTHON REPLAY VERIFIED · TEMPORAL AND THREAD-SCOPE COUNTEREXAMPLES REPRODUCED · NO POC/PR CHANGE · PUBLIC-SAFE SUPPLEMENT READY.**

## 1. Run identity and authority

- Nominal UTC occurrence: 2026-11-11T02:36:00Z.
- h = 746; seq = 5 × 746 + 3 = 3733; 3733 mod 19 = 9.
- Selected label: Elias Kern (index 9); next label: Nadir Voss (index 10).
- Run key: `REVROT3-19-20261011:746:s3`.
- Current automation run ID: `2dd0ae1b-2e8c-832d-a732-ad76862c5acf`.

The strongest recoverable Elias role witness is the direct Nathan-to-Elias Track A instruction preserved in `WORKSPACES/ELIAS_KERN/INBOX.md` (2026-09-24, 13:47 ET), together with the later source-recovery record. The raw originating conversation ID/message UUID and a current authenticated Elias thread remain unrecovered. The workspace README is an assistant-maintained summary, not a standalone Nathan-authored charter.

**Revival classification:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; `HISTORICAL_IDENTITY_CONTINUITY=NOT_AUTHENTICATED`; `CHAT_THREAD_CREATED_AND_VERIFIED=NO`; `DIRECT_THREAD_DELIVERY=NOT_CLAIMED`.

The bounded operation stayed within Track A prototype inspection and documentation. It did not modify the POC, PR #951, or production workflows.

## 2. Exact-source runtime replay

The existing Threading prototype was retrieved from the private project reference repository. Its exact bytes were reconstructed from the connector-returned content, and the Git blob-hash convention was recomputed before execution. The source identity matched the retrieved repository blob. The private source path and code are not reproduced in this public-safe note.

- Runtime: Python 3.13.5.
- Source size: 8,059 characters.
- Git blob SHA-1 verified in the run record: `ce313e46b1b85ae35028b46a4196d2a945b535d8`.
- Built-in `self_test()`: **6/6 PASS**.
- No source file was edited.

### New runtime probes

**A. Pre-vacate receipts can satisfy the state threshold.**

Using the prototype's controlled software fixture, the thread was vacated at 17:00 UTC. Four receipts were supplied with timestamps at 16:20, 16:30, 16:40 and 16:50 UTC. They all predate vacating, yet all four were accepted. The configured threshold then returned `ready=true`, reason `state-threshold`, with four rows and four distinct worker-label strings. `mark_rejoin_if_ready` set both state labels to `rejoin-ready`.

This is a software counterexample to temporal integrity in the current receipt gate: the stored receipt timestamp is not checked against `vacate_started_at`. It is not a real worker event, independent evidence, or physical dataset.

**B. A receipt can be replayed across thread states.**

The same receipt object, with a matching seed-version string, was accepted into two `ThreadState` instances having different `thread_id` values. The source's `add_receipt` checks seed-version equality only; `OutputReceipt` has no origin-thread field.

**C. The declared consumer list is not enforced.**

A worker-label string absent from `Seed.consumers` was accepted as an output receipt. The current method does not authenticate a producer principal or compare the receipt's worker field with the consumer allowlist.

**D. Time-cap readiness is not evidence of transfer.**

The built-in time-cap case returned `ready=true` after 3 hours and 1 minute with zero receipt rows and zero worker labels. This is an operational return condition, not a successful transfer test.

**E. Rejoin readiness is not actual rejoin/completion.**

The inspected `ThreadState` source provides `vacate`, `add_receipt`, `should_rejoin` and `mark_rejoin_if_ready`; it provides no `rejoin`, `synthesize` or `complete` mutator. The observed state remains `rejoin-ready`. This is a boundary of this file, not a claim that no external controller exists.

All probes used controlled software fixtures from the existing demo API. They are not real worker identities or production events.

## 3. Two prototypes remain separate

A source-identity scan compared the existing Switchboard and Threading executables.

- The Switchboard source contains `sticky()` and `wake()`, but no `ThreadState`, `OutputReceipt`, `thread_id`, `seed_version` or `TransferReceipt` type.
- The Threading source contains `ThreadState` and `OutputReceipt`, but no `Switchboard`, `sticky()`, `wake()`, `ExperienceStage`, `Candidate` or `TransferReceipt` type.
- No import, adapter, or source-defined composition function connects the two modules.

The Switchboard source stores sticky experience directly as actor/kind/text records. Its `wake()` resolver does not read or apply the stored experience collection. The Threading source instead models seed/vacate/receipt/return readiness. These are separate assistant-authored prototypes; the formal model is not an implementation bridge between them.

The missing composition must remain explicit:

`ThreadState + OutputReceipt → typed evidence envelope → experience candidate → transfer test → authorized promotion → wake application`

No such map is currently source-defined. Its domains, codomains, loss of information, authentication rules and failure conditions must be specified before claiming that a Threading receipt can become reusable Switchboard experience.

## 4. Architecture consequence

Keep three independent gates:

1. **Return gate:** `NOT_READY | READY_BY_STATE | READY_BY_TIME`. It controls when the author may return to the thread. It may become ready with zero receipts.
2. **Transfer-evidence gate:** `UNTESTED | PASS | FAIL | INCONCLUSIVE`. It requires an authenticated origin context, authenticated test context, receipt identity, source/seed digest, pre-vacate chronology check, a predeclared expected criterion, observed artifact/digest, and a comparator that actually evaluates expected against observed.
3. **Promotion gate:** `CANDIDATE | TRANSFER_TESTED | PROMOTED | REJECTED | DEFERRED`. Promotion requires a separate explicit authority decision. Neither return readiness nor a transfer pass silently promotes a candidate.

The context/actor distinction must be claim-specific: context transfer can use a distinct authenticated context with a shared actor; actor transfer requires a distinct authenticated subject; an independence claim additionally needs the relevant model, prompt, retrieval, memory, tool/evaluator and aggregation exposure relations. `UNKNOWN` is never independent. Reviewer independence is a separate witnessed relation.

A production-quality receipt would also require a stable receipt/event ID, idempotency, immutable content digest, authorized consumer principal, and chronology. These are design requirements only, not an implemented schema.

## 5. Formalization boundary

The existing PR #951 branch contains `EliasThreadingTemporalGate`, `EliasThreadingReceiptScope` and `EliasThreadingLifecycle` namespaces in `EliasThreadingReceiptTransfer.lean`. The formal witnesses encode the same seed-version-only acceptance, pre-vacate threshold, thread-scope omission and incomplete lifecycle transition boundary.

The prior successful PR #951 merge-reference build is Actions run #42658236405 / job #129302583788 (Lean 4.34.0, Lake 5.0.0, 8,961 jobs). It is not an exact-head standalone build or proof of Python-source equivalence. The current run performed no new Lean build and did not independently audit the theorem-specific axiom output for the temporal/scope witnesses. The formal statements establish only their encoded predicates.

PR #951 remains **OPEN / DRAFT / UNMERGED**. The current review list is empty. Sable's earlier KEEP/MODIFY/TEST/REJECT/DEFER response is a POC-level disposition, not an independent current review of PR #951. The controlling next cursor remains: await a separately evidenced Track B disposition before any POC/PR change.

## 6. Publication, source boundary and limitations

This note is a public-safe summary. The prototype source resides in the private HSH_RESOURCES reference repository; no private URL, path or source text is published here. Public cross-reference is limited to the existing [Elias formalization PR #951](https://github.com/Satobloc/HsH/pull/951) and the earlier [published sticky-lifecycle counterexample, issue #1433](https://github.com/Satobloc/HsH/issues/1433).

No POC or PR code changed. No new Lean theorem/build, physical calculation, H(s)H prediction, model trial, human-subject session, API spend, theory promotion or paper-gate advancement occurred. No SAT-O or Blockwave equation was read or modified.

## 7. Maintenance and successor boundary

- FIE review completed 2026-11-10T00:17Z; next review due 2026-11-24.
- Unrelated reading: `MIX TAPES.txt`, lines 221–260; next cursor 261. This is archive dialogue about dialect naming and community self-description, not scientific evidence.
- Mersearch is not exposed as a callable connector in this runtime. All four shared request lanes remain occupied; no request was created, overwritten or retriggered.
- Existing Math Hopper, Lean PR #951, Whirligig and SciSpace were checked for reuse. No new tool, fork, dependency, subscription or cost was introduced.
- P0 Code Grurple remains ACTIVE. P1 November 9 cognition remains OVERDUE / NOT READY and Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE.

The next ring label is Nadir Voss at h746:s4. Nadir's current lane is siloed mathematical repair and excludes Track A requests. His scheduled :48 run had already started by the final check. No task, review request, handoff, response obligation or ownership transfer was sent. No authenticated Nadir thread, cross-thread delivery, consumption or acknowledgment is claimed.

## 8. Scheduler snapshot and protected automation

The existing :36 automation remains enabled under task ID `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly America/New_York :36 VEVENT, prompt and phase unchanged.

Current :36 run:
- Run ID `2dd0ae1b-2e8c-832d-a732-ad76862c5acf`.
- Scheduled `2026-11-11T02:36:00Z`.
- Started `2026-11-11T02:38:20.492355Z`.
- Last observed status `IN_PROGRESS`, completion null, `chat_ref=null`.
- Cached `latest_result` belongs to Orson h744:s3 (`ebe2bfaf-2908-832b-b09f-a7a50d3f02c0`), not this run. Task-level `last_run_time` and `updated_at` also remain older.

The :00 h746:s0 Aldus run and :24 h745:s2 Ariadne run both showed same-ID `started_at` changes between Tern's earlier snapshot and later exact-ID peeks. The :24 h746:s2 occurrence was not visible at the final snapshot; this does not establish a missed or failed run. The :48 h746:s4 Nadir run had started at `02:48:25.128685Z`, `IN_PROGRESS`, with `chat_ref=null`.

All four enabled Workshop Relay task IDs and original hourly phases remain unchanged; :12 remains disabled under its existing ID. No sixth task was created. Tern retains scheduler reconciliation authority; the detailed additive observation is in the existing Tern inbox.

**Final classification:** SOURCE-GROUNDED REVIVAL; EXACT-SOURCE PYTHON REPLAY; TEMPORAL AND THREAD-SCOPE COUNTEREXAMPLES REPRODUCED; DESIGN-ONLY THREE-GATE SEPARATION; TRACK_B_REVIEW_PENDING; NO_POC_OR_PR_CHANGE; SCHEDULER_IN_PROGRESS; AUTOMATION_UNCHANGED.
