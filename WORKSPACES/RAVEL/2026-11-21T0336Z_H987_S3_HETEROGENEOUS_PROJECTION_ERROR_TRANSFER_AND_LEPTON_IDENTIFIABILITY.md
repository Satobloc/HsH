# Ravel h987:s3: Heterogeneous Projection Error Transfer and Lepton Identifiability

Date: 2026-11-21T03:36Z  
Status: workspace report; formalization committed to existing Ravel PR; corrected exact-head Lean build pending; PDG 2026 measured-value reconnaissance completed.  
Authority: assistant-level reconstruction under the deterministic Ravel ring label. No authenticated historical Ravel instance/thread participation is claimed.

## 1. Rotation and historical role

- Nominal UTC hour: h = 987.
- Sequence: 5h + 3 = 4938.
- 4938 mod 19 = 17.
- Selected label: Ravel, index 17.
- Next label: Orson Vay, index 18.

The historical Ravel Syncmathcek source contains direct user-role messages establishing a primary co-theorist remit, conceptual-cohesion and drift detection, epistemic hygiene, source lineage, measurement/observable triangulation, and accuracy-first public record. No standalone signed specialist charter was recovered.

Source witnesses:
- Role messages: 638d13ba-1541-483d-853f-3b6d04b9b1b2; c5639160-5631-4373-90c2-68d7c4c022de; 5590d70d-6525-42aa-9de8-5a7022b189f7; 4fb7a5be-a32d-43c0-b1a2-2c4787423b52.
- Geometry messages: 3d0ad680-51db-4c79-ad4a-9bbacada24ef; b9805319-9d77-4b43-874a-5af50c0b6ef7; 496a15ea-0263-459d-b815-908f52155b90.
- Raw Library export SHA-256: b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba.
- Raw Library export Git blob: 17cfe3feb830f70009557d063482b35adba0834b.
- HsH raw-export mirror blob: c49367b0faa424491e7b3520a034b9e44fe6897f. These are distinct source snapshots, not asserted byte-identical.
- The historical Syncmathcek thread and later Ravel Free Build export are archived records, not an authenticated currently usable Ravel thread. Existing-thread-first was checked. No cross-thread delivery is claimed.

## 2. Source-faithful representation and shape ledger

Nathan Direct source distinguishes three representations:
1. A reduced 3D Minkowski/worldworm diagram.
2. The full 4D bulk, with dynamics at least in an intersectional surface/thickness and potentially through the bulk.
3. An actual 4D view together with our 3D slice.

The third representation is not directly identified with a timesheet intersection. The assistant-derived W intersect Sigma and W intersect Delta-Sigma readouts remain candidate translations, not recovered Nathan Direct equations.

Additional source constraints:
- Standard Kerr is already a 4D spacetime solution. The direct construction instruction is to choose a spatial Kerr section and extend that section along the filament, not to use the full 4D Kerr spacetime as the cross-section of another 4D object.
- Filament-side and timesheet-side distortions are described as mutual accommodation, with force called the true primitive. No constitutive force law, directed response map, or action-reaction law is supplied.
- An induction-current connection within timesheet thickness is tentative. No normalized current equation or closure law is supplied.

Current structural classification:

| Feature | Status | What remains unestablished |
|---|---|---|
| Finite intrinsic filament/worldtube thickness | Qualitative source commitment | Support dimension, profile, metric, magnitude, embedding and observable map |
| Timesheet thickness | Separately mentioned in direct source | Its relation to core thickness, response law and normalized readout |
| Spatial Kerr section | Direct construction choice | Section dimension, embedding, transport, boundary conditions and metric |
| Mutual accommodation / force primitive | Direct source | Typed interaction relation and constitutive response |
| Responsive medium | Required in the BEDROCK electrogravity action-at-a-distance account | Whether it is identical to, contained in, or distinct from the timesheet |
| Twist / holonomy | Optional candidate structure | Normal-frame connection, transport law, loop observable and independent evidence |
| Separate contact surface | Not forced as an additional object | Whether the source's intersectional surface/thickness is a distinct support or only a relational locus |
| Worldline-only or timesheet-only reduction | Candidate representation only | Explicit projection, readout and coupling-preservation conditions |
| Mutual worldtube-timesheet curvature | Tentative working hypothesis | Curvature objects, composition maps and a discriminating observable |

No worldtube thickness value, twist field, contact law, Kerr embedding, current equation, or force law was invented. Core thickness and timesheet thickness are not conflated. No new BEDROCK symbol or theory equation was introduced.

## 3. Substantive improvement: heterogeneous projection-error transfer

The existing architecture already has:
- Nadir's tolerance composition for comparisons in one declared pseudometric space;
- Ravel's exact directed-slice composition across distinct carrier, sheet and ambient types;
- the Coupling-Preserving Projection Gate, which requires explicit metrics, approximation bounds and error composition.

The missing case was approximate composition when successive representations have different metric codomains.

A new theorem was added to the existing Ravel PR #1133 branch. It uses:
- an explicit admissible intermediate domain D;
- exact and approximate first-stage projections P and P-tilde whose outputs both remain in D;
- a first-stage error bound epsilon-1 in the intermediate metric;
- a second-stage map R that is L-Lipschitz on D;
- a second-stage approximation error epsilon-2 in the final metric.

The conditional result is:

    d_Z(R(P(x)), R-tilde(P-tilde(x))) <= epsilon-2 + L * epsilon-1

The theorem also proves nonnegativity of the resulting error budget when L and both stage budgets are nonnegative.

This is deliberately domain-restricted. A global Lipschitz assumption is not silently substituted for a local one. Every further stage in a longer chain needs its own admissible domain, metric, calibration, Lipschitz transfer bound and approximation certificate.

A companion real-line theorem constructs, for every positive input tolerance and every proposed finite output bound, a linear map that amplifies a pair within that tolerance beyond the proposed bound. Thus an input tolerance alone cannot justify a finite downstream error budget without some regularity or transfer constraint.

The counterexample is pure mathematics, not a physical fixture or empirical calculation.

### Formal verification status

The new module is:

- Path: FORMAL_VERIFICATION/HsHVerification/RavelHeterogeneousProjectionErrorTransfer.lean
- Existing PR: #1133
- Branch: research/ravel-carrier-slice-reconstruction-20261031t0212z
- Corrected branch head: 9a6f1968883f7692af509e394fcb1531029efa60
- New module blob: 204465105c60004157651f803ed38c0c7dd9b26a
- PR remains OPEN / DRAFT / UNMERGED.
- Existing base remains infra/lean4-verification-20261023. No rebase, merge, force-push or new PR.

Build chronology:
1. Run #44862376247 checked out the exact PR head, but the full build failed in the new module. The first proof script had an addend-order mismatch and an unresolved absolute-value proof. The emitted axiom output for that failed elaboration included sorryAx and is not a verified theorem result.
2. Both proof scripts were corrected in commit 9a6f1968883f7692af509e394fcb1531029efa60.
3. Run #44862774441 was created for the corrected head. At the last observation it remained IN_PROGRESS at checkout; the exact-head assertion and compilation had not yet completed.

Therefore no successful Lean proof is claimed in this receipt. The next verification step is to inspect run #44862774441 and its exact-head assertion, then inspect the compiled theorem-specific axiom output. Tests, lint, leanchecker, nanoda and global axiom audit are separate checks and are not implied by a successful Lake build.

The Vercel preview check failed because the free daily deployment limit had been reached. This is unrelated to Lean compilation. No paid upgrade was attempted.

The theorem does not instantiate a physical H(s)H map, calibrate metrics, prove source-to-type translation, or establish empirical truth. Its real-valued Lipschitz constant is not automatically dimensionless. Before physical use, the intermediate and final metrics must be calibrated and unit-compatible, and L must carry a justified conversion/regularity meaning. This theorem does not close the separate UnitTagged calibration-identity gap in Mercer PR #2236.

## 4. Measured-data reconnaissance: charged lepton triplet

A prior Ravel assistant proposed the electron, muon and tau as a useful control family. That candidate-family choice is assistant reconstruction, not a Nathan Direct selection. The current Lane 36 request makes a real-data test matrix appropriate, but this run does not fit a model or calculate a physical prediction.

Reference dataset:
- Particle Data Group, 2026 Review of Particle Physics, Summary Tables.
- Table created 2026-06-01; data cut-off 2026-01-15.
- Source: https://pdg.lbl.gov/2026/tables/rpp2026-sum-leptons.pdf
- The table is a compiled reference summary, not the underlying measurement-level dataset or covariance package.

| Quantity | Electron | Muon | Tau |
|---|---:|---:|---:|
| Spin J | 1/2 | 1/2 | 1/2 |
| Mass | 0.51099895069 +/- 0.00000000016 MeV | 105.6583755 +/- 0.0000023 MeV | 1776.93 +/- 0.09 MeV |
| Mean life | > 6.6e28 years, 90% CL | (2.1969811 +/- 0.0000022)e-6 s | (290.3 +/- 0.5)e-15 s |
| a_l = (g-2)/2 | (1159.65218062 +/- 0.00000012)e-6 | (11659207.2 +/- 1.5)e-10 | -0.0024 to 0.0047, 95% CL |

All three are charged leptons with the same negative unit charge. The PDG table lists J=1/2 for each. The electron lifetime entry is a lower bound, not an observed decay lifetime. The tau magnetic-moment entry is a broad confidence interval, not a central value with a symmetric standard uncertainty.

### Identifiability consequences

- Mass, Compton frequency and Compton wavelength are not three independent observations. The latter two are derived from mass.
- A decay width expressed as the inverse lifetime is not independent of the same lifetime measurement.
- Muon lifetime is already tied to mass and weak-decay dynamics in the standard comparator. The accepted 2026 update gives the relation tau-mu inverse = GF squared times m-mu to the fifth power, multiplied by the radiative correction factor, divided by 192 pi cubed. Its reported Delta-q is (-4,384,700 +/- 34)e-9. Source: accepted 2026-10-28, https://doi.org/10.1103/l12j-mdsl.
- Tau lifetime also requires its weak-decay channels and hadronic contributions; a bare mass-only law is not an adequate comparator.
- The electron lifetime is only a lower bound.
- The dimensionless magnetic-moment anomaly is a separate observable channel, but the tau interval is far less constraining than the electron and muon values.
- No comparable spatial-radius/form-factor values were recovered from this summary table. They require a separate source and measurement operator.

The lepton triplet is therefore a useful same-charge/same-spin control family, but not a set of independent mass, Compton, width and lifetime constraints. Any H(s)H proposal must not count derived Compton quantities as independent data or use a mass relation to smuggle in a coil-scale prediction.

### Test matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| Standard Model baseline | Lepton masses, charge, spin, alpha, GF and relevant radiative/decay corrections | Underlying experiment-level measurements and covariance must be recovered; PDG summary alone is not a holdout | Masses, lifetimes, magnetic moments, decay channels | QED plus electroweak/weak-decay theory | Standard-model residuals outside the preregistered joint uncertainty model |
| H(s)H core/coil scaling candidate | One source-authorized geometry-to-observable map and a shared parameter set across e, mu, tau; no independent per-lepton fit coefficients unless justified | Fit/calibrate on a declared subset; hold out independent experiments or epochs; freeze all parameters and maps before holdout | A jointly predicted subset of mass, lifetime, magnetic moment and a separately measured form-factor/radius observable | Same Standard Model predictions and measurement covariance | Held-out joint observable vector outside the preregistered H(s)H prediction region after propagated measurement and model uncertainty, while the standard comparator remains adequate |
| Representation-chain stability | Explicit projection maps, admissible domains, calibrated metrics, stagewise Lipschitz constants and local error budgets | Independently establish each map and bound on the actual operating domain | Same declared joint readout after the full projection chain, within the composed bound | Direct full-representation readout or established standard measurement operator | Observed discrepancy exceeds the preregistered composed error budget |

No H(s)H geometry-to-lepton-observable map, shared parameter set, calibration, holdout, numerical prediction interval or falsification threshold is currently source-defined. The table is a readiness and identifiability matrix, not a model fit. No physical calculation, fit, simulation, prediction or independent measurement was performed.

## 5. What the theorem changes in the test architecture

The new result makes a concrete failure route available once real maps exist:

1. Define the full-state and reduced-representation spaces.
2. Declare each projection and its admissible domain.
3. Identify the metric and calibration in each codomain.
4. Establish a local Lipschitz bound for every representation-changing map.
5. Bound each stage's approximation error using actual measurement or calibration evidence.
6. Compose the stagewise bounds without resetting uncertainty.
7. Compare the final readout with an independently acquired holdout.

If a required L is unbounded, unmeasured, or selected after seeing the holdout, the pipeline has not produced a predictive bound. The theorem does not rescue an unconstrained map.

For more than two stages, repeated application yields the recurrence E-next = epsilon-next + L-next times E-current, but no general n-stage Lean theorem is claimed here.

## 6. Project status and safeguards

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY / ORSON-owned |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |
| November 9 minor-paper gate | MISSED |
| November 30 major-paper gate | HOLD |
| December 14 full-theory gate | INCOMPLETE |

FIE was last fully reviewed 2026-11-20; next review is due 2026-11-24. The previous unrelated-reading break is recent and was not repeated.

Mersearch has no first-class callable action in this runtime. The raw Ravel source had already been recovered in verified archive batches; this run used those known source records and bounded GitHub repository reads, not a new Mersearch search. No request was submitted, overwritten, retriggered or released. The four existing request lanes remain untouched.

HsH main was read at commit 0bfb96a98e4a2497a87fa367d09793625df31937 before this report. SAT archive and HSH_RESOURCES front-door documentation were also read. No HSH_RESOURCES private payload was opened. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, current Lean PRs, and SciSpace availability were checked in the current workspace documentation. No new tool, dependency, fork, subscription or paid endpoint was introduced.

No SAT-O or Blockwave equation was changed. No physical fixture, data-free physical calculation, H(s)H prediction, BEDROCK theory promotion, paper-gate advancement, task graph mutation or ownership change occurred.

## 7. Successor and automation

The next deterministic ring label is Orson Vay. Orson's P1 cognition remit remains protected. No geometry assignment or cross-lane work request was sent, and no new inbox packet was created. No authenticated current Orson thread or direct-thread delivery is claimed.

The existing Workshop Relay :36 task remains enabled with its original task ID, hourly schedule, prompt and Lane Charter 36 phase unchanged. No sixth task, schedule mutation, task mutation, signet or conversation rename.

The current :36 run has no authenticated run-level thread reference. Cached prior-run content was not treated as this run's work.

Final status: H987:S3 / RAVEL-ASSISTANT-RECONSTRUCTION / HETEROGENEOUS-ERROR-TRANSFER-ADDED-TO-EXISTING-PR1133 / FIRST-LEAN-BUILD-FAILED-AND-CORRECTED / SECOND-EXACT-HEAD-RUN-PENDING / PDG-2026-LEPTON-RECONNAISSANCE / NO-HSH-PREDICTION / P2-HOLD / ORSON-P1-PROTECTED / NO-CROSS-THREAD-CLAIMS / TASK-UNCHANGED / NO-SIXTH-TASK
