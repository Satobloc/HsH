# H826:S3 | Paired comparison-freeze and evidence-witness contract

**Run key:** `REVROT3-19-20261011:826:s3`  
**Selected ring label:** Nadir Voss, index 10  
**Next ring label:** Enheduanna, index 11  
**Lane:** 36 architecture / workflow / prediction overlay. This does not reassign or alter Nadir's existing Lane 24 sandbox.

**Disposition:** A source-grounded gap was identified in the existing worldtube evidence schema: empirical and testability statuses are not yet bound to a concrete, common comparison identity. A paired model/observation freeze plus execution attestation is specified below. No PR, branch, task, equation, physical model, or theory status was changed.

## 1. Authority, source, and access

The following live HsH controls were read:

| Surface | Blob SHA-1 |
|---|---|
| `BEDROCK.md` | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| Primary Operational Guideline, 2026-11-08 | `a8e333b1d5b5aa1d9772366945dd88769d24153c` |
| Steering Charter, 2026-10-26 | `be44c424674764c602b5f618dfce528c0f97b0ef` |
| Three Paper Campaign, 2026-10-26 | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| New Instance Start Here | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Revival Rotation v3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| Task Branch Graph | `4ee79fa0a30fedb1feffd0a92c2716f87a365670` |
| Workflow Branching Map | `756c506780072591b2f48e22044f3368a57bfa7d` |
| Scheduler Authority | `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45` |
| Code Grurple Roster | `cc96c0bfafc95c54e7960899c7306031e5abce17` |

The three repository front doors were checked. HsH is the live workflow/workbench; `SAT_THEORY_ARCHIVE_2023-25` is the historical source archive; `HSH_RESOURCES` is an internal/private-reference boundary. Only its root README and repository metadata were read; no HSH_RESOURCES payload was opened.

Observed repository heads at audit time:
- HsH `main`: `eca0600d41f6b00d0ae41756cce6891b211ae78f`
- SAT archive: `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`
- HSH_RESOURCES: `896e36690a5dcb666b10d0714e34a22f092baa4e`

### Historical Nadir authority

The raw conversation `Quantum Gravity and Experiments` was fetched and parsed from its actual mapping:

- Conversation ID: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`
- Raw export Git blob SHA-1: `d828fef5352045cb4d9486fdbeabd04043c4c119`
- User-role message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` names Morrow/Kestrel (:00), Orson (:12), Meridian (:24), Ravel (:36), and Mercer (:48). It does not name Nadir.
- User-role message `11122adb-75c5-4418-9b59-29730a034811` gives broad permission to create an experimental playground.
- User-role message `de178e6a-d223-4ad1-9bc9-d37f178f8b21` asks the worker to compile its best mathematics and attempt a connected H(s)H trial Lagrangian.

No standalone signed Nathan-authored Nadir specialist charter was recovered. The Nadir workspace's named stacked-holonomy remit is an assistant-maintained reconstruction/sandbox description, not a historical identity or theory-authority record. The October 1 playground authorization permits bounded sandbox exploration, but it does not override the current real-data-first rule or authorize invented physical fixtures. No authenticated current Nadir thread was established.

The incoming Elias h826:s2 packet was read as optional P0/control context. It did not assign a task or transfer ownership.

## 2. New finding: the worldtube evidence schema has a second identity gap

I inspected the actual PR #951 branch source, without modifying the PR.

[PR #951](https://github.com/Satobloc/HsH/pull/951) remains OPEN / DRAFT, Track B disposition pending. Its current head is `f9fa0aad45408ab06e5430c834530854746235f0`.

`EliasWorldtubeClaimEvidenceGate.lean` (blob `a34720b07942f973000271a961bf6363d1cd55dd`) defines a broad `WorldtubeClaimEvidence` record. It includes status fields for:

- measured system and dataset;
- measurement provenance;
- units and calibration;
- uncertainty budget;
- prediction/fit separation;
- held-out prediction;
- shared parameters;
- calibration/holdout separation;
- predicted observable;
- standard comparator;
- falsification threshold;
- independent empirical review.

However, the concrete `FormalizationWitnessBundle` in `EliasWorldtubeEvidenceWitnessGate.lean` supplies artifact witnesses only for source content, source classification, source-to-formal trace, build run, target module blob, and independent translation review. The empirical/testability axes remain status fields without a corresponding typed observation/comparison witness bundle.

The same PR explicitly demonstrates the general failure mode for formalization: `statusOnlyPassExample` satisfies the status-only `formalizationAuditGate` while an empty `FormalizationWitnessBundle` fails the stronger witness gate. The empirical/testability side does not yet have an analogous concrete witness gate.

A second gap remains across both sides: the existing build witness records PR head, checked-out commit, module blobs, toolchain, run state/conclusion, target, axiom-report coverage, full-log `sorryAx` scan, and automated axiom-audit state, but no common comparison-freeze identity binds that build to the same candidate, observation package, comparator, analysis plan, and decision rule.

This is distinct from Elias h822:s3's already-published switchboard counterexample in [issue #1727](https://github.com/Satobloc/HsH/issues/1727). That result showed that checks for different candidate versions could be combined into a false composite PASS. The present finding extends the identity problem into the actual worldtube formalization/empirical evidence schema: even well-formed individual witnesses need a shared test identity.

**Classification:** `SCHEMA_GAP_CONFIRMED_BY_SOURCE_INSPECTION`; not evidence that a physical experiment was misreported or that PR #951 is unsafe. No code, PR comment, review, CI run, or merge state was changed.

## 3. Proposed paired-freeze contract

A test is not identified by a theory candidate alone. It is a frozen relation among a model, a measured observation package, a standard comparator, an analysis plan, and a decision rule.

### A. `ModelFreeze`

Bind:
- exact original SAT-O and Blockwave source artifacts, each with repository/path, first-extant date, immutable blob/content digest, and verbatim equation locator;
- corrected equations as separate artifacts with explicit correction lineage; never overwrite or silently substitute the original;
- source-defined geometry and typed projection/intersection/composition maps;
- parameter manifest, including every free/model-specific parameter;
- the frozen predicted observable and its units/type.

### B. `ObservationFreeze`

Bind:
- identifiable measured physical system and acquisition;
- raw dataset/version and exact digest;
- instrument, calibration, units, environmental conditions and transfer/response model;
- uncertainty/covariance package;
- immutable partition manifest identifying calibration/fit, model-selection and untouched holdout data;
- provenance and exclusions.

If raw data, calibration, covariance, or the holdout partition is unavailable, the observation freeze is incomplete and the empirical gate cannot pass.

### C. `ComparatorFreeze`

Bind the standard GR/SM/QM or other appropriate comparator version and implementation, the shared-parameter manifest, and any model-specific parameter differences. H(s)H and the standard comparator must use the same observation freeze and declared shared calibration/nuisance parameters. Different calibration or data partitions are not a fair model comparison.

### D. `AnalysisPlanFreeze`

Bind analysis code and dependency/toolchain versions, likelihood/statistic, fit procedure, parameter-selection rules, uncertainty propagation, and preregistered decision/falsification rule. The holdout must not influence model construction, parameter selection, prior choice, or threshold selection.

### E. `ComparisonFreeze`

The comparison identity is a canonical content digest of the four manifests above plus the decision rule. Every mathematical, geometric, source, empirical, comparator, prediction and independent-review witness must reference this same comparison identity.

A separate `ExecutionAttestation` binds that comparison identity to exact code commit, PR head, base/merge-base, checked-out commit, target-module blob, toolchain, run/job, build conclusion, tests/lint, theorem-axiom coverage, full-log `sorryAx` scan, automated axiom audit, and log/artifact digest.

An independent-review witness additionally records reviewer identity, author identity, scope, and exposure/holdout access. Different reviewer and author labels are necessary bookkeeping, not proof of intellectual independence. A formal proof, a successful build, a publisher readback, and an independent empirical holdout remain four different evidence classes.

### Fail-closed invalidation

| Change | Required invalidation |
|---|---|
| Original source, correction, geometry map, parameterization, or predicted observable changes | New `ModelFreeze`; prior model/formal/geometry witnesses do not validate the revision |
| Dataset, instrument, calibration, units, covariance, exclusions, or holdout partition changes | New `ObservationFreeze`; prior empirical results do not validate the revision |
| Standard comparator or shared-parameter definition changes | New `ComparatorFreeze` and `ComparisonFreeze` |
| Analysis code, solver, likelihood, or decision rule changes | New `AnalysisPlanFreeze` and `ComparisonFreeze` |
| Code head, toolchain, build target, or run changes | New `ExecutionAttestation` |
| Holdout is inspected and then used to revise the candidate or threshold | That holdout is consumed; a new independent holdout is required |

This is the operational extension of candidate-freeze coherence. It makes hidden flexibility visible: every post-hoc change has a named invalidation consequence rather than quietly inheriting earlier PASS receipts.

## 4. Geometry consequences under the current minimal-model directive

The current Primary Operational Guideline specifies two minimal primitives: worldline/worldtube (worldtube preferred where finite extent/internal structure matters) and timesheet. A responsive/reactive medium is a provisional third primitive whose eliminability/absorption must be tested. Exact roles and mathematical types are not inferred from their names.

| Feature | Current conditional status |
|---|---|
| Worldtube rather than centerline | Preferred when finite spatial extent/internal structure matters; the actual dimension, topology, metric, boundaries and embedding still require specification |
| Numerical core thickness | Not determined by the primitive choice alone; requires source/geometry derivation or identifiable data, and must not be target-fit |
| Timesheet | Part of the minimal pair; exact inclusion/intersection/readout maps remain explicit obligations |
| Responsive medium | Provisional third primitive; retain only if it cannot be eliminated or absorbed and evidence/geometry requires it |
| Twist/holonomy | No extra variable is forced by the minimal pair alone; preserve source-defined terms and add no rescue term unless source or derived geometry requires it |
| Contact/intersection surface | An explicit incidence/slice/readout map is required wherever a contact or observed intersection is claimed; a new material contact surface is not implied by naming the primitives |
| Additional nesting/shape level | Optional until explicit projection and composition maps show it is required; any addition creates a new `ModelFreeze` |

No original SAT-O/Blockwave equation was retrieved or altered in this run. Mersearch was not callable in this runtime; the four existing request files remain `requested` and were not overwritten, released, or retriggered. Therefore this report makes no new source-equation attribution or correction.

## 5. Test-matrix admission template

The test matrix should contain, for each candidate:

`hypothesis | source-defined geometry | shared parameters | model-specific parameters | calibration/fit partition | untouched holdout | predicted observable + units | standard comparator | uncertainty/covariance | preregistered falsification threshold | ComparisonFreeze | ExecutionAttestation | independent reviewer/exposure`

No physical row is populated in this run. The live P2 measured-geometry branch remains HOLD, and no system has been selected with a complete raw-data, provenance, calibration, uncertainty and holdout package. A schema is not a physical test, and no H(s)H prediction or independent measurement is claimed.

## 6. Current formal-verification status: PR #262

[PR #262](https://github.com/Satobloc/HsH/pull/262) is OPEN, no longer draft, and GitHub currently reports `mergeable=false`.

- PR head: `89ab283ae583aef69d6f89a36cc0e2d3b09bfe63`
- Compared main snapshot: `eca0600d41f6b00d0ae41756cce6891b211ae78f`
- Merge base: `e2e738facee0890bdfbbc563e9936db174f63074`
- Compare: 52 commits ahead, 17,236 behind.

Existing Actions run #43550564055 / job #132311821512 checked out merge commit `265a277f4259caffb77e9c31ad93b227483057ca`. `HsHVerification.NadirFrameTelescoping` built at 8927/8946; `similarity_gram_isotropic` reported `[propext, Classical.choice, Quot.sound]`. The full root build failed in `MovingPlaneTraceGeometry.lean` at lines 72, 76, 80, 84, 96, 100 and 197 because definitions depended on noncomputable real division/slice declarations. Tests, lint, nanoda, leanchecker and the separate axiom audit were skipped.

This is a **merge-reference module build plus root-build failure**, not a successful full build, not an exact-head standalone build, and not current-main integration. The PR body still contains stale “CI compilation remains to be verified” wording; it was not edited here. No rebase, merge, PR comment, or new CI dispatch was made.

### Lean formalization target and limit

The proposed Lean target is a `ComparisonFreeze` structure and a `BoundWitness` structure whose evidence gate requires every required witness to carry the exact same freeze value and verified status. Prove that an accepted gate implies all required witnesses share that exact comparison identity. Canonical serialization/hash correctness is a separate implementation/cryptographic obligation; a Lean proof over the encoded record does not prove SHA-256 collision resistance or source-to-model fidelity.

Local `lean`, `lake`, and `elan` executables are absent. The existing PR #262 infrastructure branch is currently highly divergent and non-mergeable, so it was not used as an ad hoc new CI route. No Lean module was added, compiled, or run. No proof is claimed.

## 7. Maintenance and control state

- P0 Code Grurple: ACTIVE; both paper reader routes remain PRESENTATION_PENDING / NOT_OBSERVED. No Sites editor or live route evidence was available; no route probe or standdown.
- P1 cognition: OVERDUE / NOT READY; Orson retains ownership and the four-of-five genuine cognition-work target.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 P1 gate: missed/not ready; November 30 P2 and December 14 P3 remain separate gates.
- FIE rereview: November 24; not yet due.
- Task Branch Graph: branch_count 16 versus 18 records remains an acknowledged unresolved semantics discrepancy; it was not changed.
- All four Mersearch requests remain `requested`; no Mersearch execution result was available.
- No new task, branch, PR, tool, dependency, subscription, or expenditure.
- No physical calculation, prediction, fit, measurement, equation change, or theory promotion.

The existing :36 automation was positively read as enabled. Its saved identity, prompt, phase and schedule were preserved unchanged. No task, ID, schedule, phase, cadence, or enabled state was changed. No terminal completion is claimed.

## 8. Return route

The immediate design gap is now precise: add a shared comparison identity and concrete observation/comparison witness bundle to the existing worldtube evidence architecture, but do not alter PR #951 before Track B disposition. The next mathematical step is to formalize the same-freeze invariant in the existing approved Lean project once an exact-head, current-base verification route is available. The next empirical step remains blocked until P2 has an identified measured system and complete data/calibration/uncertainty/holdout package.

This is an architecture proposal and source audit, not a new H(s)H physical result.
