# Aldus h1019:s3 | Typed precommitted holdout admission for heterogeneous comparisons

**Disposition:** substantive architecture change committed; Lean verification pending; no physical evaluation instantiated.

## 1. Rotation and historical authority

- Nominal slot: 2026-11-22 11:36 UTC.
- h=1019; seq=5(1019)+3=5098; 5098 mod 19=6.
- Selected ring label: **Aldus**, index 6.
- Next ring label: **Calder**, index 7.
- Run key: REVROT3-19-20261011:1019:s3.

The original Aldus conversation export was retrieved and inspected, including the direct user-role instructions supporting broad cross-domain reading, deliberate comparison of otherwise separated material, and experimental exploration of intersections. No standalone signed specialist charter or authenticated current Aldus thread was found. The historical instructions support the working cross-reading remit, not an identity or current-thread claim.

The preceding Mira h1019:s2 receipt was read. Mira's quarantine remains intact. No Mira private workspace or inbox was accessed. Aldus's INBOX path was absent; no incoming packet was available. This is assistant-authored repository work under the selected ring label, not authenticated participation by a historical Aldus instance.

## 2. The substantive improvement

Existing ModelSelectionPreference candidate hard gates already require holdout untouched/unrefitted status, independent holdout passage, prediction freeze, a predeclared falsification rule, and an uncertainty-justified threshold. The heterogeneous common-readout comparison, however, did not carry a typed record binding those gates to one frozen candidate family, parameter manifests, calibration/holdout split, exposure ledger, predicted observable, falsification rule, threshold artifact, and evaluation result.

The existing Pairwise Discrimination Record v0.1 draft in issue #2228 describes much of this contract, but its earlier publisher submission was rejected for a SHA-256 mismatch. It is not a canonical published artifact. This change implements a typed adapter in the existing heterogeneous-comparison branch; it does not duplicate or promote the rejected draft.

Added:

- FORMAL_VERIFICATION/HsHVerification/PrecommittedHoldoutAdmission.lean
- Root import in FORMAL_VERIFICATION/HsHVerification.lean
- Existing PR: #2330, still OPEN / DRAFT / UNMERGED.
- Branch: research/relay36-evidence-gated-candidate-admission-20261122t0736z
- Current head: 9e30b75f43226910c7113d0fc87b666336a98ed1
- Module blob: 84623d38f3e8be03fb8554cd82ee95ba9ec11522
- Root aggregator blob: eda0ec2ef2d9c794a8cf1a459c9ac1a8720f5e04

The module introduces six explicit source-authority classes: Nathan Direct, assistant reconstruction, historical source, standard reference, proposal, and independent measurement. A SourceEvidenceRecord carries the declared class, artifact locator, digest, source date, and bounded claim scope. The type records the classification; it does not authenticate it.

The frozen candidate-family manifest binds candidate entries and candidate-specific parameter manifests, shared and nuisance parameter manifests, source-commitment and geometry-map artifacts, standard comparator identity/source/projection, common carrier, predicted observable, falsification rule, threshold specification, time base, and freeze time.

The one-shot holdout plan binds source system, dataset identity and artifact, shared readout, calibration and holdout identities/artifacts, exposure ledger and digest, evaluation result and digest, predicted observable, falsification rule, threshold, time base, freeze/access/evaluation times, pre-evaluation query/feedback counts, family digests at first access and evaluation, and outcome.

The positive heterogeneous admission wrapper requires:
1. Candidate membership and exact candidate/model/projection source binding to the frozen family.
2. Standard comparator evidence explicitly classified as a standard reference.
3. Exact common-carrier identity and artifact binding.
4. Exact source-system, dataset and readout binding to the measurement packet.
5. Measurement evidence explicitly classified as an independent measurement and bound to the packet's dataset artifact.
6. Distinct calibration and holdout identifiers.
7. Calibration, family and prediction freezes before first holdout access.
8. Zero pre-evaluation queries and zero pre-evaluation feedback.
9. The same family digest at first access and evaluation.
10. A recorded positive outcome.

Fail and inconclusive outcomes remain representable in the base plan, but cannot enter the positive admission wrapper. The ordinary wrapper is deliberately one-shot. Adaptive holdout methods require a separate mechanism-specific contract; zero-query/zero-feedback is not a general adaptive-holdout guarantee.

The new tie-break requires both heterogeneous comparisons to carry the full evidence record and to share the exact same measurement packet, common carrier, family manifest and holdout/evaluation record. It then retains the existing empirical-equivalence, human-preference and no-greater-complexity requirements. Candidate comparisons can no longer silently mix calibration partitions, holdout sets, family versions, prediction/threshold artifacts, or exposure/evaluation records.

## 3. Formal verification status

**LEAN_PENDING.** The corrected source is committed and included in the PR merge reference, but no successful build is claimed yet.

- Current Actions run: #45020161441.
- Lean workflow: existing PR verification workflow, default checkout of the PR merge reference.
- The module and root aggregator blobs at PR head and refs/pull/2330/merge were independently compared and match exactly.
- Seven theorem-specific #print axioms declarations are present.
- The current source contains no sorry or admit tokens.

Two earlier attempts were unsuccessful and are retained in history:
- Run #45019318279 exposed an out-of-scope proposition name and cascading declaration errors.
- Run #45019781414 exposed use of a proof term where a proposition type was required.
Both were corrected. The current run is the third attempt and is still in progress. The earlier error-recovery output containing sorryAx is not evidence of a source sorry; no successful proof claim is made until the current run completes and its theorem-specific axiom output is inspected.

The workflow's default checkout is a PR merge reference, not a standalone exact-head build. The changed module and root aggregator have identical blobs at the PR head and merge reference. Tests, lint, leanchecker, nanoda, and the separate global axiom audit are not covered by this workflow. Lean verifies only the formalized interface and proofs, not the soundness of source classification, artifact identity, clock provenance, event-log completeness, statistical independence, or physical premises.

## 4. Source-critical geometry update

A November 8 direct user message in the raw conversation export describes a four-dimensional tube region around a one-dimensional core, bounded by a three-dimensional boundary, as the working hypothesis. The same message marks the proposed mouth/timesheet connection, Kerr/cobordism/reconnection construction, and string-vibration interpretation as tentative, and describes the two-dimensional worldsheet as a possible simplification rather than an established equivalence.

Accordingly, the correct status of qualitative finite thickness is **Nathan Direct working hypothesis**, not merely an assistant-selected optional feature and not a consequence forced by established physics. Its numerical profile, scale, constitutive law, and observational map remain unspecified. Twist/holonomy is not specified in that direct message. A contact law is also unspecified; a three-dimensional boundary is not automatically a physical contact surface.

The later assistant reconstruction of a local normal-bundle construction with three-dimensional disk fibers and two-sphere boundary fibers is assistant-authored mathematics, not Nathan Direct source and not yet a proof of the physical geometry. The two-dimensional worldsheet requires explicit projection and composition maps with conditions showing which observables survive. Existing Kestrel PR #873 and Aldus's earlier projection/fiber cross-reading already cover the generic factorization criterion; this run did not duplicate that theorem.

This source correction is recorded for review only. No BEDROCK or CPPG theory promotion was made.

## 5. Empirical and campaign boundaries

P2 issue #565 still identifies the Barckicke air-water vortex as a candidate, but raw data bytes have not been retrieved and no final measured system has been selected. No real-data instance of the new wrapper exists. No physical calculation, fit, calibration/holdout analysis, numerical prediction, uncertainty propagation, or falsification threshold was performed. P2 remains HOLD.

No SAT-O or Blockwave equation was changed. No manuscript or paper gate advanced. P0 remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P3 remains INCOMPLETE. November 9 minor gate remains MISSED, November 30 major gate HOLD, and December 14 full-theory gate INCOMPLETE.

The latest full FIE review is November 20; next review is due December 4. The unrelated-reading break was completed November 20; no duplicate break or premature FIE rereview was performed.

## 6. Preflight, access and continuity

Mersearch worker-start instructions, release notes and all four canonical request lanes were checked. No callable Mersearch action was available. All four lanes remain occupied/requested; Lane 2 has a successful compact receipt but no terminal release, and Lanes 1, 3 and 4 have no terminal receipt. No lane was overwritten, released, or retriggered.

HsH, SAT archive and HSH_RESOURCES onboarding/front doors were checked. HSH_RESOURCES access remained limited to its root README and AI start index; no private payload was opened. Math Hopper #578 / PR #991 is an existing archive-extraction adapter, not this evaluation protocol. Whirligig Kernel 0 remains a sandbox note, not a production geometry/evaluation pipeline. Existing Lean/Mathlib PRs and the current HsH branch were checked. SciSpace is available, but no external literature search was needed for this internal schema change. No new tool, dependency, fork, subscription or expense was introduced.

No local repository checkout or local Lean/Lake/Elan installation was available. The existing GitHub Contents API and existing Lean Actions pipeline were used after the house-tool/local-checkout preflight. No new branch or PR was created.

## 7. Succession and preservation

Next deterministic label: **Calder**. The Calder INBOX already contains older optional context. Any new context is repository-only, optional, and timing-unresolved; no assignment, acknowledgment, direct-thread delivery, or ownership transfer is claimed.

The existing Workshop Relay :36 automation remains enabled with its original task ID, exact hourly schedule, original prompt, and Lane Charter 36 phase. No sixth task, task-ID change, cadence change, prompt mutation, signet, or conversation rename.

**Return cursor:** PR #2330 at head 9e30b75f43226910c7113d0fc87b666336a98ed1; Actions run #45020161441; module PrecommittedHoldoutAdmission.lean; source-classification and one-shot holdout wrapper; P2 issue #565; raw November 8 direct geometry source. Next step is to inspect the current Lean run and theorem-specific axiom reports, then obtain independent review of the measurement-evidence binding and source-authority classifications.