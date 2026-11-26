# Ravel h1120:s3 | Projected-observable identifiability gate

## Run identity and authority

Using the current nominal UTC hour, h=1120. Therefore seq=5h+3=5603 and 5603 mod 19=17: Ravel is selected; Orson Vay is next. This is deterministic routing, not authentication of a Ravel instance or conversation. The invocation arrived before the task's nominal :36 phase; the existing task was not retimed or otherwise changed.

Read the live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, thread-first and navigation-preflight rules, automation/write-safety controls, current main and Ravel branch, current receipts, and Ravel source-provenance materials. HSH_RESOURCES access stopped at its README and AI_START_HERE. No restricted payload was opened.

No standalone signed Ravel specialist charter was recovered. Five direct user-role messages in the historical Syncmathcek export establish the source-backed remit: geometric reconstruction and measurement, primary co-theorist designation, conceptual cohesion/drift and epistemic hygiene, accurate public record, and citation lineage. The raw export is source material, not independent authentication of the speaker. No authenticated current Ravel thread or run-bound conversation reference was found. No cross-thread delivery is claimed.

## Source custody: originals retained, no equation corrections

### SAT-O1

Source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt  
Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc  
First extant repository commit: b543eb3fbf16e50500ceadad83dc9a7dc0759e5b, 2025-10-27T00:40:28Z. The file has no byline or internal composition date.

Verbatim source equations:

~~~text
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
~~~

This is an unbylined historical source, not independently established Nathan Direct authorship.

### Blockwave

Source derivative: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE.txt  
Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d  
First extant HsH commit: 6e4415f62616b19ae5cb677984c85d1985834d9, 2026-10-08T02:42:49Z.

The corresponding raw source is an assistant-role message, ID 3039b226-02d4-41a3-a2d3-c338e25204a9, in conversation 68f4d9b5-b908-832e-940e-6782db174a4a, dated 2025-10-19T12:31:03.318Z. It is not Nathan Direct authority.

Verbatim source equations:

~~~text
J^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
\nabla_\mu J^{\mu\nu} = 0
~~~

Only Git blob SHA-1 identities are asserted here. Earlier unverified SHA-256 strings and the incorrect 2025-09-16 Blockwave date are not reused. No SAT-O1 or Blockwave equation is corrected, replaced, or promoted.

## Substantive architecture improvement

The existing Ravel formalization already covers geometric support rank, nuisance-image distinguishability, representation-conversion coherence, directed slice composition, and heterogeneous projection-error transfer. It did not yet state the exact identifiability condition for a geometric linearization followed by an observational measurement projection.

The new module is:

FORMAL_VERIFICATION/HsHVerification/RavelProjectedObservableIdentifiability.lean

It treats a supplied geometric linearization G: V ->_l[Real] GSpace and a supplied measurement/readout linearization R: GSpace ->_l[Real] OSpace. The candidate observed linearization is R after G, conditional on the chain-rule model for concrete nonlinear maps having been supplied separately.

The new formal statements are:

1. ker(G) subseteq ker(R after G): a measurement projection cannot restore a parameter direction already lost by the geometric map.
2. R after G is injective exactly when G is injective and R separates points on im(G). The readout need not be globally injective; it must be injective on the geometry image.
3. Any nonzero mode in im(G) intersect ker(R) makes R after G noninjective.
4. An abstract integer-module counterexample shows that even an identity geometry map can lose identifiability under a first-coordinate projection.

The readout map here is an observational measurement map, not the physical timesheet interaction law. The source archive does not yet supply a concrete geometry-to-observation map, metric/signature, instrument transfer function, calibration, covariance, units, or measured system. The chain-rule relation is a modeling condition, not a derived SAT/H(s)H result.

### Lean branch and verification

Extended the existing draft PR #1133 on branch research/ravel-carrier-slice-reconstruction-20261031t0212z. No new branch or PR was created; no rebase or merge was attempted.

Final inspected branch head at report cutoff: 18a70e4ef0c7291f396803553d510facd5f5777a.  
New module blob: c056185b4140b859f182b251733b36c69518bf58.  
Root aggregator imports the new module; aggregator blob: b01ce39ffd4ff19f02f9e21273f03fcfb3771f2b.

The new module contains four theorem-specific #print axioms commands and two executable #eval examples. Static source inspection found zero sorry, admit, or custom axiom declarations.

Verification history:
- Prior exact-head baseline run #45711289709 passed 8,959 jobs on the preceding head 95f508ed; Lean 4.34.0 / Lake 5.0.0. This is not verification of the new module.
- First new attempt #45857386119 failed on a malformed product type annotation and an unhelpful noncomputable Real #eval. Corrected by moving the executable example to Integers.
- Second new attempt #45858118174 failed because LinearMap.id was applied with an incorrect explicit argument. Corrected by defining the identity linear map explicitly.
- Current exact-head run #45858790354, job #140044068858: exact PR-head checkout assertion PASS; Lake dependency manifest generation IN_PROGRESS at report cutoff; Lean compile has not started. Status is SUBMITTED_NOT_VERIFIED. No compilation or theorem-success claim is made.

The existing workflow's tests, lint, leanchecker, nanoda, and global axiom audit are not part of the observed verification run. Lean checks only the formalized statements, not the soundness of the geometric translation or physical premises.

## Conditional test matrix

| Element | Required definition | Current status |
|---|---|---|
| Hypothesis | The projected geometric response remains identifiable: R after G is injective on the target parameter subspace, after nuisance separation | Conditional theorem formalized; concrete maps absent |
| Shared parameters | Geometry parameters, readout/calibration parameters, and nuisance parameters | Not identified for a measured system |
| Calibration | Independently measured instrument transfer map and covariance | Absent |
| Holdout | Independent event, interval, or dataset not used to choose G or R | Absent |
| Predicted observable | Projected response vector, Jacobian rank/conditioning, and residual signature | No physical prediction supplied |
| Standard comparator | Standard model using the same measured system and calibrated readout | No system selected |
| Falsification | A nonzero geometric mode lies in the readout kernel, or projected rank/conditioning fails a pre-registered covariance-based threshold | Exact algebraic null-mode condition proved; no numerical threshold |

No measured system, dataset, provenance package, units, uncertainties, fit, holdout, or independent measurement was selected. The test matrix is an implementation contract, not a completed empirical test. No data-free physical calculation was made.

### Forced versus optional

Forced by the formal architecture:
- Keep the geometry map and measurement projection as distinct typed maps.
- Define their composition and the target parameter subspace.
- Test whether the readout separates points on the geometry image.
- Evaluate nuisance absorption after projection.
- Use measured calibration/covariance to distinguish exact injectivity from practical identifiability.

Not forced by this result:
- Worldtube thickness, twist, contact surfaces, Kerr-core structure, or a Blockwave two-form.
- Any GR/string-theory/SM-QM/information equivalence.
- Any specific time-surface metric or interaction law.

Those remain source-dependent hypotheses until a concrete measured system and independently testable map require them.

## Existing-resource reconnaissance

- PR #1133 is OPEN / DRAFT / UNMERGED, based on infra/lean4-verification-20261023. Parent PR #262 remains open. No rebase, merge, review request, or ownership change.
- PR #2309's finite-chain heterogeneous projection-error work is adjacent but not the same injectivity condition.
- Whirligig Kernel 0 PR #2463 is a restricted sandbox projection model, not a general measured readout map.
- Math Hopper issue #991 remains source-coverage/extraction work, not a verified general solver.
- SciSpace is available but was unnecessary. No relevant fork surfaced in the bounded repository search.
- All four canonical Mersearch lanes are occupied. No lane was overwritten or retriggered, and no new Mersearch query is claimed. Exact known source files were fetched by pinned paths as a bounded fallback, not represented as Mersearch results.
- The live issue-publisher workflow triggers on issues.opened and issues.edited body changes; its validator requires OWNER association, the exact four-key envelope, lowercase hsh-publish-v1 schema, a unique submission ID, and a matching UTF-8 SHA-256. This supersedes older opened-only descriptions.
- Mysearch remains scaffold-only. No new tooling, dependency, subscription, or expenditure.

## P0, campaign, and continuity

The latest fully parsed discovery snapshot reported by Tern's h1119 work is at source cut fbe7079, with generated discovery commit c14c49a97391031ccd8df2d12289d04237f36b29:
- 18,042 documents.
- 11,112 workspace records, all missing presentation_state.
- 26 machine/control records with generic reader routes.
- Paper A/B live-route acceptance NOT OBSERVED.

Discovery freshness passed at that source cut. Presentation safety remains FAIL. Deployment is NOT VERIFIED; release/standdown is NOT AUTHORIZED. No route probe, deployment, manual dispatch, or P0 ownership change was made. The subsequent publisher/receipt writes will require a new postwrite discovery refresh.

PWH remains Tern-owned. Queue h1081:s3 is stale; task graph has 18 records against 16 declared branches. No queue or graph mutation.
- P1 cognition: OVERDUE / FROZEN / Orson-owned.
- P2 November 30 major paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE full rereview: December 8.
- Unrelated-source break: November 28.

No Ravel-local STATE, CONTINUITY, BOOT, or INBOX checkpoint was rewritten under the active P0 interlock. No handoff or assignment was sent to Orson; his protected cognition remit remains untouched. No authenticated current Ravel thread was established, and no cross-thread delivery is claimed.

## Return priority

Keep PR #1133 open and draft. First obtain exact-head Lean verification for commit 18a70e4; carry run #45858790354 if still pending. Then define G and R from an actual source-grounded measured system, with units, calibration, covariance, holdout, standard comparator, and pre-registered falsification threshold. Do not infer worldtube thickness, twist, or contact surfaces from this generic theorem.

The existing :36 task remains enabled with its identity, hourly schedule, and phase unchanged. No sixth task, task reassignment, cadence change, signet, or conversation rename.