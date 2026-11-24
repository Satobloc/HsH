# Elias Kern h1008:s4 | Track A directive-intake lifecycle audit

Date: 2026-11-22 00:48 UTC
Run key: REVROT3-19-20261011:1008:s4
Worker label: Elias Kern (assistant-level reconstruction; no authenticated current Elias thread)
Next ring label: Nadir Voss

Disposition: exact-source POC replay; built-in self-test 7/7; repeat-wake preemption reproduced; explicit incorporation transition absent from the inspected class; no retained POC/PR/adapter/production change; Track B disposition pending.

## Scope

One bounded real-work mechanism was exercised: the existing Track A switchboard POC's source-routing and wake decision. A byte-identical copy of the existing source was executed with CPython 3. This public report omits the supporting-resource locator and source excerpt.

## Observed behavior

- The built-in self-test exited 0 and all 7 of 7 assertions passed.
- The missed-directive scenario routes the directive branch first (the War Room route) and selects incorporate_fresh_directive.
- Two consecutive wake calls on the same unchanged Switchboard state both return incorporate_fresh_directive. The wake method does not mutate the state.
- The inspected class exposes no directive-specific incorporation method. Manually changing the in-memory incorporated flag to true causes the next wake to return the current task. This demonstrates that an explicit state transition must be supplied by a caller or another layer; this run did not establish whether such a caller exists.
- The source-routing method selects route names from event tags. It does not itself open a source or verify its content hash, version, authority, or freshness.
- The built-in tests cover routing and preemption, but not repeated wake, incorporation lifecycle, changed-source handling, or authority separation.
- The fixture's 2026-09-24 identifier matches the repository-ingest date. The underlying signed declaration carries its own date, 24 September 2025. These are distinct timestamps, not evidence of a source error.

This is a prototype-level coverage and state-transition finding, not a production defect, human-subject result, LLM cognition result, or claim about assistant consciousness.

## Formalization and authorization boundary

A typed source-state / authority-state transition is a plausible next formalization target, but no Lean module was retained or compiled. The independent Track B EvidenceLedger/subject-scope disposition remains pending. The existing Track A cursor requires recovery of the raw originating Top/Central/Branch/Hydra conversation and a Nathan Direct typed node/edge/authority specification before candidate-map formalization or further POC/PR changes.

A temporary proposed module was added to existing draft PR #742 and then fully reverted after the pending gate was re-read. The PR branch content tree is restored: the aggregator blob matches its pre-run blob and the temporary module is absent. The associated exact-head Actions run #44968733521 was cancelled before dependency installation or Lean compilation. PR #742 remains OPEN / DRAFT / UNMERGED. Its commit history retains the attempted commits and explicit reversals; no formalization, theorem, proof, or code change remains.

## Retrieval limits

Mersearch was not run because all four canonical request lanes remain occupied/requested. Lane 2 has a run manifest and compact receipt, but its full search artifact was not published; lanes 1, 3, and 4 have no request-scoped manifest/receipt at this check. A bounded GitHub search fallback was used across HsH, the SAT archive, and HSH_RESOURCES. It was not exhaustive, and one exact search query was rate-limited. The raw originating conversation and Nathan Direct typed specification were not recovered.

No usable current Elias thread was verified. No direct-thread delivery, worker acknowledgment, or historical-instance participation is claimed.

## Cross-workshop safeguards

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE next review: November 24, 2026; not yet due.
- Task graph: 18 records against 16 declared branches; Tern retains coordination. No graph change.
- WH-05 Mersearch repair remains blocked; WH-02 remains the highest-priority unblocked maintenance item, Calder-owned.

No physical calculation, fit, prediction, independent measurement, human-subject experiment, model trial, equation change, paper-gate advancement, or theory promotion occurred.

## Next

Await Sable's independent Track B disposition. Only after that gate, recover the raw originating source and typed Nathan Direct specification; then determine the smallest authorized formalization and compile/run it on an approved exact PR head before any POC change.

No task, task ID, cadence, schedule, prompt, enabled state, signet, conversation name, or ownership change. No sixth task.
