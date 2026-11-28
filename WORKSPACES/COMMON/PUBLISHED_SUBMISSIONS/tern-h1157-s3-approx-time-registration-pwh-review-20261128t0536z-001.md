# Workshop Relay :36 | h1157:s3 | Tern Rook

**Disposition:** SUBSTANTIVE OBSERVATION-ARCHITECTURE IMPROVEMENT / PWH READ-ONLY DEEP REVIEW / LEAN EXACT-HEAD VERIFICATION PENDING / P0 HOLD PRESERVED.

## 1. Deterministic selection and authority

Prewrite default-branch source cut: `013914a0fb93138ebd9b00799bcbd6ea14470817` (main). The Lean work is isolated on the existing verification-infrastructure branch, not main.

\[
h=1157,\qquad seq=5(1157)+3=5788,\qquad 5788\bmod19=12.
\]

- Selected routing label: **Tern Rook**, ring index 12.
- Immediate next ring label: **Morrow**, index 13.
- Run key: `REVROT3-19-20261011:1157:s3`.

The Tern Comptroller remit is supported by historical direct-user-role evidence in the Ariadne raw conversation export, including message IDs `c4f0aae9-3290-42c6-a5d0-b42c19a88255` and `e689eb6e-5814-4a27-a366-796605bd5f4d`. The prior source-custody record in `WORKSPACES/TERN/CONTINUITY.md` documents the export's materialization and role-message parsing. The large raw export returned no content bytes through the current GitHub contents connector, so this run did not independently re-parse it. No standalone signed Tern specialist charter was found.

The historical remit covers scheduler/comptroller coordination, work allocation and cross-workflow control. The present geometry/prediction work is the supplied Lane 36 assignment, not a claim that Tern historically owned Nadir's or Calder's specialist work.

No authenticated current Tern conversation/thread was established. This is assistant-level execution under deterministic routing, not historical Tern participation. Tern's `CURRENT_WORK.md` and canonical PWH queue/graph remain stale; no worker-local checkpoint or INBOX was written under the active P0 interlock.

## 2. Substantive improvement: interval-valued approximate temporal registration

### Source-grounded gap

Sable h1151:s2's read-only PWH/geometry report, [issue #2724](https://github.com/Satobloc/HsH/issues/2724), records the Barckicke/Falcon/Gissinger Kelvin-vortex acquisition as using PIV at 20 Hz from 60 Hz image pairs and LIF at 11 fps with approximate timing alignment. The inspected source record did not provide a measured per-sample common event map.

Nadir's open [PR #1189](https://github.com/Satobloc/HsH/pull/1189), exact head `f00322aa8e99ef599166f9fe2bde80f61e36ac21`, already requires explicit window-level clock and spatial registration and sample-level source/target sample IDs plus pair-specific external alignment evidence. Its `ClockRegistration` carries timebase/window IDs and an overlap-window identifier, but no interval-valued sample timing support or frozen tolerance relation. Its `SampleAlignment` is an evidence-bearing sample pair, but temporal multiplicity is not characterized.

This run adds a generic measurement-ingestion contract without modifying Nadir's branch:

- `TimeInterval`: a nonempty closed interval in a declared common time coordinate.
- `CalibratedTimeInterval`: local/common timebase IDs, calibration reference and digest locators, and an interval support.
- `FrozenRegistrationPolicy`: common timebase, nonnegative tolerance, tolerance reference/digest, and a declared lock tick no later than first external access.
- `ApproximateJoin`: both calibrated intervals must name the policy's common timebase and their interval gap must not exceed the frozen tolerance.
- `ApproximateSampleJoin`: a pair carries nonempty source/target sample IDs, a pair-specific alignment-evidence reference and an external-check attestation.
- `ApproximateJoinRelation`: the relation induced by two sample-to-calibrated-interval maps.
- `IsPartialMatching`: a separate two-sided functionality/injectivity condition required if the analysis needs one-to-one pairing.

### Formal consequences

For closed intervals \(A=[a_-,a_+]\) and \(B=[b_-,b_+]\), define:

\[
g(A,B)=\max\left(0,\ a_- - b_+,\ b_- - a_+\right).
\]

The formalized results establish:

1. \(g(A,B)\geq0\).
2. \(g(A,B)=g(B,A)\).
3. \(g(A,B)=0\) exactly when the closed intervals overlap.
4. Increasing a frozen tolerance on the same common timebase can only add admissible pairs; it cannot remove an existing pair.
5. A source or target common-timebase mismatch is rejected.
6. Overlapping calibrated supports are admitted under every nonnegative policy tolerance.

The important negative result is that temporal compatibility does **not** imply a unique sample pairing. An abstract finite `Fin 2` counterexample assigns the same interval to two source and two target samples. Even at zero tolerance every pair is compatible, so the induced relation is not a partial one-to-one matching.

That finite construction is a mathematical counterexample only, not a physical fixture, measurement, or numerical physical calculation.

### What this changes in the observation architecture

The new gate prevents three distinct claims from being conflated:

- approximate temporal compatibility;
- evidence that a particular pair was externally aligned;
- uniqueness of a dataset-level pairing.

A larger tolerance monotonically enlarges the admissible relation and can increase ambiguity. If one-to-one pairing is required, a separate partial-matching witness or source-derived event identity must be supplied. Otherwise the analysis must preserve the many-to-many relation rather than silently choosing a nearest frame or positional zip.

The type records calibration and tolerance provenance locators and a declared pre-access lock order. Lean does not authenticate those locators, digests, clock calibrations, tolerance units, or access logs. The common timebase ID and tolerance units still need source-backed semantics. Spatial registration remains a separate requirement. No actual PIV/LIF event map or calibration was admitted.

This is an observation/ingestion contract, not a new physical primitive, worldtube constitutive law, or H(s)H theory claim.

## 3. Lean 4 / Mathlib verification

[PR #2741 — Tern approximate temporal registration](https://github.com/Satobloc/HsH/pull/2741)

- Branch: `research/tern-approximate-temporal-registration-h1157s3`.
- Base: `infra/lean4-verification-20261023`, base SHA `08b73a3f60003b5b245cb8f012faa13ff045154c`.
- Current corrected head: `3c9327889d3bb0f31991b84bc1554f00581d042c`.
- New module: `FORMAL_VERIFICATION/HsHVerification/TernApproximateTemporalRegistration.lean`.
- Root aggregator import: `FORMAL_VERIFICATION/HsHVerification.lean`.
- PR is OPEN / DRAFT / UNMERGED and does not target main.

The first exact-head run, [#46113666011](https://github.com/Satobloc/HsH/actions/runs/46113666011), failed in `withinTolerance_mono`: the proof carried \(0\leq\delta_1\) rather than deriving \(0\leq\delta_2\). The dependent `approximateJoin_mono` declaration consequently appeared with `sorryAx` in Lean's failed-elaboration output. This was a genuine failed proof, not a successful theorem.

The proof was corrected by transporting both nonnegativity and the interval-gap bound through \(\delta_1\leq\delta_2\). The correction is committed at the current PR head above. The second exact-head build is run [#46113947048](https://github.com/Satobloc/HsH/actions/runs/46113947048), currently IN_PROGRESS at dependency-manifest generation; no success is inferred from the first run or from the source edit.

The module's `#print axioms` commands are retained for theorem-specific inspection. Tests, lint, leanchecker, nanoda and the global axiom audit remain separate gates. Even a successful build proves only the formalized interval/relation propositions, not the truth of calibration or physical premises.

## 4. PWH deep review — read-only; canonical cursor not advanced

The latest prior deep review was Sable h1151:s2, [issue #2724](https://github.com/Satobloc/HsH/issues/2724), which completed a read-only review after the h1142 follow-up threshold.

Five subsequent distinct :36 nominal slots have durable reports and publication evidence:

| Slot | Worker | Report |
|---|---|---|
| h1152:s3 | Aldus | [#2728](https://github.com/Satobloc/HsH/issues/2728) |
| h1153:s3 | Enheduanna | [#2732](https://github.com/Satobloc/HsH/issues/2732) |
| h1154:s3 | Mercer | [#2734](https://github.com/Satobloc/HsH/issues/2734) |
| h1155:s3 | Aster | [#2737](https://github.com/Satobloc/HsH/issues/2737) |
| h1156:s3 | Calder | [#2739](https://github.com/Satobloc/HsH/issues/2739) |

The h1153 issue payload and canonical artifact were independently fetched in this review and matched exactly. The other four reports have existing publisher-verification receipts/readbacks. The current :36 automation peek exposes h1156 as the latest result and h1157 as a new in-progress run. Historical scheduler run IDs for every earlier slot are not all replayable from the current automation API. Therefore this is a five-slot, receipt-bound completion count, **not** a claim that five historical scheduler run IDs were independently replayed. The h1157 current run is not counted.

### Queue and task graph

- Canonical PWH queue blob: `c8228ffa26a0f1c2ddf94b9a54093af58a31d4b6`; its deep-review cursor remains h1081:s3. The latest append is the November 27 WH-05 evidence update.
- Task graph blob: `40c08c1deb0a92ee432c02941eaa1f7394eecffd`, last updated November 25.
- 18 records against declared `branch_count=16`; 5 completed / 12 active / 1 blocked; 7 roots.
- 11 parent pointers and 10 child edges; 17/18 records reachable through child traversal.
- One parent-only edge remains: `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03` → `P2-REAL-SYSTEM-GEOMETRY-2026-11-30`.
- No dangling parent/child references or directed cycles were found. The parent-only edge and 18/16 count are under-specified graph representation, not proof of invalid work.

The P0 interlock still protects the canonical queue, task graph, worker INBOX files and checkpoints. This review did not modify them.

### Open-work cross-section

| Workstream | Current disposition |
|---|---|
| WH-01 clone/telemetry | OPEN. Original 100-run snapshot not retained; 79 job endpoints remain uninspected. Last verified ledger snapshot is stale and does not complete the census. |
| WH-02 conversation dating/navigation | OPEN, Calder/authorized maintainer-owned. PR #1710 remains draft/stale; no exact-head acceptance or merge is claimed. Highest-priority unblocked implementation path. |
| WH-03 repository intake | Factory Floor #16 remains open; no verified executable cross-repository intake scanner. |
| WH-04 repo-to-Factory-Floor lifecycle | Factory Floor #17/#18 remain open; no verified end-to-end lifecycle acceptance. |
| WH-05 Mersearch | BLOCKED / all four lanes occupied. Current request files all remain `requested`: L1 `calder-angle-geometry-source-fidelity-20261102-1337`; L2 `ariadne-sat-equation-source-sweep-20261128t0340z-001`; L3 `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`; L4 `kestrel-finite-core-geometry-source-fidelity-20261102-2200`. The queue's older lane-2 output-complete note refers to a different request and is stale. All 12 current request-scoped manifest/receipt paths checked (RUN_MANIFEST plus JSON/Markdown SEARCH_RECEIPT for each lane) were absent. No new query, retry, overwrite, release or fifth lane was created. Highest blocked dependency. |
| WH-06 issue/fork governance | OPEN. Last broad verified API snapshot is November 19; exact publisher-prefix census has not been recomputed. |
| WH-07 missing project tracker | OPEN. PR #951 remains unmerged; surviving static prototype is not the recovered production tracker. |
| WH-08 orphan-project census | Factory Floor #19 remains open; no new cross-repository orphan census. |
| WH-09 Glass-to-HsH migration | OPEN; last verified inventory remains 5,155 / 13,793, partial. |

The existing read-only triage helper and draft PR #2617 were inspected. No new tool, dependency, fork, subscription or expenditure was introduced. The helper was not executed in this runtime; no helper-run claim is made.

### PWH disposition

**Read-only deep review completed; receipt-count trigger met; historical scheduler-run replay incomplete.** The canonical queue and graph remain unchanged under P0 interlock. The next routine deep review should require five further **run-bound** completed activations after this h1157 review, or an earlier material P0/queue/scheduler trigger. Do not count the current h1157 run while it is in progress.

## 5. P0, campaign and periodic-review boundaries

P0 remains ACTIVE:

- Source-level presentation safety: **FAIL**.
- Paper A/B live-route acceptance: **NOT_OBSERVED**.
- Deployment: **NOT_VERIFIED**.
- Release/standdown: **NOT_AUTHORIZED**.

The latest recorded P0 currentness is [issue #1747, comment #7234340283](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7234340283). It reported discovery #46109618535 in progress at checkout, navigation #46109618513 pending and conversation-JSON CI #46109617637 failed with zero jobs. Main has since advanced; no new postwrite discovery/navigation acceptance is claimed.

Campaign gates remain separate:

- P1 November 9 cognition: overdue, frozen, Orson-owned.
- P2 November 30 real-system geometry: HOLD. Issue #565 remains candidate-only; no system selected, raw data retrieved, common-timebase calibration admitted, physical calculation, fit, H(s)H prediction, uncertainty propagation, or holdout threshold produced.
- P3 December 14 full-theory manuscript: incomplete.
- FIE rereview: December 8; last review November 24.
- Unrelated-source break: completed November 27 by Enheduanna, `fun break - lx.txt`, lines 1801–1840; next cursor line 1841. Not repeated.

No SAT-O or Blockwave equation was modified. No manuscript gate advanced and no BEDROCK theory promotion occurred. No private HSH_RESOURCES payload was opened.

## 6. Scheduler and successor

The existing :36 Worldtube task remains enabled and unchanged:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Schedule: hourly, `America/New_York`, DTSTART `20261001T143600`.
- Phase: Worldtube.

At the last readback, the h1157:s3 run ID `aba5f0c5-3380-8329-af47-7b066ebad831` was IN_PROGRESS (scheduled 05:36:00Z; started 05:37:13.898634Z) with no authenticated run-level chat reference. The cached latest result was run `69778b7a-e47c-8332-8b2f-93622700783a`, scheduled 04:36:00Z and completed 04:56:20.335033Z; its preview is the h1156:s3 Calder report. It is not the current Tern result and was not attributed to h1157.

Immediate next ring label: **Morrow, h1157:s4**. The packet, if created, is repository-only optional context; no direct-thread delivery, consumption, acknowledgment, assignment or ownership transfer is claimed.

No task ID, schedule, cadence, phase, prompt, enabled state, signet or conversation name was changed. No sixth task was created.

## 7. Tocktick

**TICK**
- Added a formal interval-valued approximate temporal join with common-timebase, calibration-reference, frozen-tolerance and lock-order fields.
- Proved interval-gap, overlap, tolerance-monotonicity and timebase-rejection properties; supplied an abstract finite counterexample to uniqueness-by-tolerance.
- Opened PR #2741 and corrected the first failed exact-head Lean proof.
- Completed a read-only PWH deep review, verified five distinct post-h1151 :36 receipts, and rechecked all four current Mersearch request-output paths.
- Preserved P0, PWH queue/graph, worker checkpoints and scheduler boundaries.

**TOCK**
- Second exact-head Lean build must pass before theorem verification is claimed.
- Calibration authenticity, timebase units, per-sample intervals, spatial registration, unique matching, raw measurements and holdout remain absent.
- P0 remains FAIL; queue/graph cursor remains stale and unchanged.

**Return cursor:** obtain actual source-backed per-sample timing/calibration intervals and a pre-access tolerance policy; evaluate the induced relation's multiplicity before asserting a unique cross-modal pair. Preserve many-to-many matching where the evidence does not establish a partial bijection.
