# H978:s3 | Resolution neighborhoods, exact fibers, and compositional uncertainty

**Status:** ASSISTANT RECONSTRUCTION / ABSTRACT LEAN SOURCE ADDED / `LEAN_UNTESTED` / P2 HOLD / NO PHYSICAL CALCULATION

**Nominal slot:** 2026-11-20T18:36:00Z  
**Run key:** `REVROT3-19-20261011:978:s3`  
**Deterministic ring label:** Nadir Voss (index 10); next Enheduanna (index 11)

## 1. Selection, source authority, and scope

The fixed-ring calculation is:

\[
h=978,\qquad seq=5(978)+3=4893,\qquad 4893\bmod19=10.
\]

The selected label is **Nadir Voss**. The next ring label is **Enheduanna**.

Nadir is an assistant-generated workspace/ring label, not a Nathan-authored identity. The recovered October 1 raw conversation is:

- Conversation: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`
- Raw export: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json`
- Git blob SHA-1: `d828fef5352045cb4d9486fdbeabd04043c4c119`

Three direct user messages establish broad experimental permission:

- `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, 2026-10-01T20:56:07.264Z: authorizes theory experiments, derivations, recombination and competing architectures, with source-versus-invention and no-target-fitting controls.
- `11122adb-75c5-4418-9b59-29730a034811`, 2026-10-01T21:07:30.057Z: explicitly asks for an independent playground.
- `de178e6a-d223-4ad1-9bc9-d37f178f8b21`, 2026-10-01T21:20:56.352Z: asks to compile the best mathematics and develop a trial H(s)H Lagrangian.

The name “Nadir Voss” does not occur in the raw export. No standalone signed Nathan-authored Nadir specialist charter or authenticated current Nadir thread was recovered. The current Lane 36 instruction is a one-run architecture/prediction overlay; Nadir's active Lane 24 Cycle 08/08 remains complete and BACKSEAT/HOLD. This report is assistant reconstruction, not historical-instance participation.

## 2. The missing distinction: exact fibers versus resolution neighborhoods

The existing H(s)H workflow already has three distinct mathematical/evidential questions:

1. **Representation/readout compatibility:** does a readout factor through a declared projection? Ravel PR #1133 contains the conditional exact-fiber criterion: the readout must be constant on the projection's fibers.
2. **Within-model identifiability:** is the parameter constant on the fibers of the observation map? If two admitted states have the same exact observation but different parameter values, no deterministic decoder from that observation can recover the parameter.
3. **Between-model discrimination:** does a frozen H(s)H candidate predict an observable that a matched standard comparator cannot reproduce at the declared resolution on an untouched holdout?

The existing Mercer Kelvin observation-chain report and h888 two-axis crosswalk already keep these axes separate. Nadir's h959 uncertainty amendment also correctly requires every uncertainty statement to be scoped to its observable, channel, acquisition, estimator, units, calibration and covariance.

**New finding:** a finite-resolution neighborhood is not automatically an exact observation fiber or an equivalence relation.

For a declared pseudometric space \((Y,d)\), define:

\[
R_\epsilon(x,y)\iff d(x,y)\leq\epsilon.
\]

For \(\epsilon\geq0\), this relation is reflexive and symmetric. It is **not generally transitive**. If

\[
d(x,y)\leq\epsilon,\qquad d(y,z)\leq\epsilon,
\qquad d(x,z)>\epsilon,
\]

then \(R_\epsilon(x,y)\) and \(R_\epsilon(y,z)\) hold while \(R_\epsilon(x,z)\) fails. The result is conditional: it does not assert that every tolerance relation on every metric space has such a witness.

The triangle inequality supplies the correct composition rule:

\[
d(x,z)\leq d(x,y)+d(y,z)
\leq \epsilon_1+\epsilon_2.
\]

Thus successive resolution errors accumulate. One cannot silently reset a multi-stage chain to the original single-stage tolerance.

This is standard metric mathematics, not a novelty claim. The useful project correction is operational: **do not form a quotient, Setoid, or exact observational equivalence class from “within uncertainty” unless transitivity has separately been established.** Exact equality of observations and finite-resolution closeness are different relations.

## 3. Consequences for projection, coarse-graining, and H(s)H

The distinction matters when comparing the source-committed finite-core construction with reduced representations.

- A 2D worldsheet or centerline projection may be valid for a particular readout if that readout is exactly constant on the projection fibers.
- That does not establish that intrinsic thickness, twist, contact structure or another parameter is identifiable from the readout.
- If a readout varies along a projection fiber, the projection is not adequate for that readout.
- If two predicted outputs differ exactly but their uncertainty regions overlap, structural distinction may remain while practical discrimination is unresolved.
- A source-committed feature is not made optional merely because the available measurement cannot identify it. Conversely, an optional feature should not enter the confirmatory family without a predeclared observable consequence.

For the current finite-core working reconstruction, BEDROCK `ND-2026-10-18-07` retains qualitative intrinsic filament thickness. Its magnitude/profile and operational map remain unresolved. The historical coil-scale `ell_f` is not interchangeable with thickness `epsilon`. Independent twist/holonomy and a contact law remain unestablished optional structures. This report changes none of those source classifications.

The new Lean lemma only gives additive error composition when successive comparisons live in the **same declared pseudometric space**. If a physical map changes the observable space, the relevant Lipschitz/error-transfer bound must also be supplied. No generic sum across heterogeneous map codomains is asserted. A covariance-weighted metric, singular covariance treatment, detector resolution, and numerical threshold must come from an actual measured system; none is invented here.

### Proposed addition to the existing CBCM resolution gate

This is a proposed field-level clarification, not a new canonical schema or an edit to Sable's CBCM:

| Field | Required meaning |
|---|---|
| `resolution_relation_kind` | Exact fiber equality, tolerance neighborhood, or statistical/likelihood overlap |
| `observable_metric_id` | Declared metric/pseudometric and its units |
| `uncertainty_model_id` | Actual covariance/likelihood source and scope, or `UNKNOWN` |
| `stage_error_bounds` | Per-stage error bound in the relevant codomain |
| `map_error_transfer` | Lipschitz/continuity bound needed to move errors across a map |
| `transitivity_status` | Proven, conditionally witnessed false, or not applicable |
| `structural_identifiability` | Exact fiber result for the named parameter and admitted domain |
| `practical_resolution` | Scorable only with actual uncertainty/covariance |
| `model_discrimination` | Separate matched-comparator and holdout status |

A tolerance threshold is a decision rule, not a replacement for a physical equivalence relation. A likelihood-overlap criterion is also not automatically transitive. The appropriate practical-identifiability calculation remains blocked until the real observation model and covariance are recovered.

## 4. Lean formalization attempt

A new module was added:

`FORMAL_VERIFICATION/HsHVerification/NadirResolutionTolerance.lean`

It defines `WithinResolution` on an arbitrary `PseudoMetricSpace` and states four results:

- `withinResolution_refl`: reflexivity for nonnegative tolerance;
- `withinResolution_symm`: symmetry;
- `withinResolution_chain_bound`: additive two-stage error bound;
- `not_transitive_of_resolution_witness`: conditional non-transitivity when a witness chain's endpoints exceed the original tolerance.

The module is imported by the existing formalization root aggregator.

**Code and PR status:**

- New branch: `research/nadir-resolution-tolerance-fibers-20261120t1836z`
- New module blob: `67b94e2065fd9994a95cbe4ff09e3a1486159c82`
- Updated root aggregator blob: `7628e9f7fc20db9123b5b5a68de02f58cb274344`
- Branch head / PR head: `bc6da5292e096742cca10ace08dca7bb3a0eb2d4`
- Draft PR: [#2214](https://github.com/Satobloc/HsH/pull/2214)
- Base: `infra/lean4-verification-20261023`, PR #262 head `368f9af8d95d061b4581688759ed3eda309e9886`.

**Verification status: `LEAN_UNTESTED`.** The commit-specific workflow-run query and Actions run listing returned no run for this head. The local runtime has no `lean`, `lake` or `elan` executable. No exact-head Lean 4.34.0/Mathlib compilation is claimed. The reason the Actions run was not created is not established. PR #262 remains OPEN / UNMERGED, and its base branch is behind current `main`; PR #2214 is therefore a stacked draft, not independently merge-ready for `main`.

No tests, lint, nanoda, leanchecker or global axiom audit ran. No Factory Floor intake was attempted because the mandatory successful exact-head Lean gate has not been met. The source contains no explicit `sorry` or custom axiom declaration on inspection, but this is not a compiler or axiom-audit result.

## 5. Existing architecture and tooling checked

This work deliberately reuses rather than duplicates:

- Ravel PR #1133: exact readout descent through declared map fibers; OPEN / DRAFT / UNMERGED.
- Mercer issue #1867: Kelvin-vortex observation-chain composition and fiberwise identifiability.
- Mercer h888 / Aldus issue #1820: separate within-model identifiability and between-model discrimination.
- Nadir h959:s3 uncertainty amendment: observable-scoped uncertainty.
- Elias h974 candidate-family / holdout-exposure proposal.
- Sable h976 Commitment-Bound Candidate Manifest (CBCM) v0.1, issue #2207.

Tool reconnaissance:
- Mersearch is the prescribed first archive-search route, but no callable Mersearch tool or local pinned executable was available. All four canonical request lanes were fetched and remain `requested`; none was overwritten or retriggered. No Mersearch search is claimed.
- GitHub code search was only a bounded fallback/locator, not a three-repository Mersearch run.
- Math Hopper issue #578 and PR #991 were checked; the full three-repository scan remains unverified and PR #991 remains OPEN / DRAFT.
- Existing Lean PRs #262, #1133 and #1189 were checked. The new formalization uses the existing #262 infrastructure branch rather than introducing a new Lean toolchain.
- Whirligig Kernel 0 remains SANDBOX ONLY and is not a general equation-to-curve encoder.
- SciSpace is available; no external literature search was necessary for this standard metric result.
- HsH, SAT archive and HSH_RESOURCES front doors were checked. Repository metadata reports zero forks for all three. HSH_RESOURCES metadata says public while its README establishes a private-reference boundary; only its root README was read. No payload was accessed.
- No new tool, dependency, fork, subscription, paid service or expense.

## 6. Project status and safeguards

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE; issue #1747 OPEN |
| P1 Orson cognition | OVERDUE / NOT READY / Orson-owned |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |
| FIE | Last reviewed November 10; next review November 24 |

The November 9 minor-paper gate remains missed, November 30 major gate remains HOLD, and December 14 full-theory gate remains INCOMPLETE. No paper gate advanced.

The task graph remains 18 branch records against 16 declared branches. The discrepancy is unresolved and remains Tern-owned. Nadir Lane 24 Cycle 08/08 remains complete and BACKSEAT/HOLD; this is a one-run Lane 36 overlay.

No measured system was selected. No raw dataset was acquired. No physical calculation, fit, H(s)H prediction, numerical falsification threshold, independent measurement, CODATA comparison, SAT-O/Blockwave equation change, manuscript edit, P2 selection or BEDROCK promotion occurred. No data-free physical fixture or numerical calculation was performed.

The most recent Nadir unrelated-reading record remains `fun break - lx.txt`, lines 2121–2160, next cursor 2161. No duplicate break was performed. FIE rereview is not yet due.

## 7. Publication and continuity

The report is submitted through the existing HsH issue publisher using the `hsh-publish-v1` four-field envelope. The issue-publisher result is tracked separately from the Lean PR. The initial submission state is `SUBMITTED_NOT_VERIFIED`; the canonical artifact, publisher comment and exact readback are checked separately and recorded in the run receipt. The report itself is not rewritten after publication; any final publisher-state correction is additive in the receipt.

Current HsH `main` was `04983b12bd35c570003440b04d09ea730f87a861` at preflight. During this run, main independently advanced to `7c3fb4d6a273130087464ef718b539935f73c5d8` at 2026-11-20T18:42:31Z via the automatic “Refresh public display docket and square artwork” commit. No main-branch theory or workspace change from this run is included in that commit.

The :36 automation remains the existing enabled task ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled with its original hourly America/New_York DTSTART `20261001T143600`, prompt and Lane Charter 36 phase unchanged. No task, ID, schedule, phase or enabled-state mutation; no sixth task.\n\nPrior publication reconciliation: the preceding Mira h977 issue [#2210](https://github.com/Satobloc/HsH/issues/2210), previously reported pending in its original receipt, now has publisher confirmation comment #7046587686 and canonical artifact readback for SHA-256 `a738265414a19f41732ee798d958389d2e302f0d75b4c6c8de4ab38747c1b622`. Its status is now PUBLISHED_VERIFIED; no retry or duplicate was made.

**Disposition:** `H978:S3 / NADIR-ASSISTANT-RECONSTRUCTION / RESOLUTION-NEIGHBORHOOD-TRANSITIVITY-GATE / PR2214-DRAFT / LEAN-UNTESTED / P2-HOLD / ISSUE-PUBLISHER-STATUS-SEPARATE / NO-PHYSICAL-CALCULATION / ENHEDUANNA-NEXT / TASK-UNCHANGED / NO-SIXTH-TASK`.
