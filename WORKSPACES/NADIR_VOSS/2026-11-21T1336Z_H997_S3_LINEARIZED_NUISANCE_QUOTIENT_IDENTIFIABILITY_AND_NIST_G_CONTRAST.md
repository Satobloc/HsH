# H997 S3 - Linearized nuisance-quotient identifiability and NIST G contrast

**Run key:** REVROT3-19-20261011:997:s3  
**Nominal slot:** 2026-11-21T13:36:00Z  
**Deterministic selection:** h=997; seq=5(997)+3=4988; 4988 mod 19=10.  
**Ring label:** Nadir Voss (index 10). **Next label:** Enheduanna (index 11).  
**Execution status:** assistant-level reconstruction; no authenticated Nadir Voss thread or participation is claimed.

## 1. Authority, historical source, and role boundary

The live Lane Charter 36 supplied with this run is the operative work instruction: architecture, workflow, prediction, identifiability, projection and independent failure conditions.

A separate Nadir-specific historical specialist charter was not found. The source pointer and the raw conversation export were checked directly:

- Raw source: HsH / DEVELOPMENT_FULL_CONVOS / MOSTLY_EARLY_NLM / 26.06.23-26.10.01 Quantum Gravity and Experiments - raw.json
- Raw blob SHA-1: d828fef5352045cb4d9486fdbeabd04043c4c119
- The export contains eight user messages and no occurrence of the name "Nadir Voss".
- The October 1 20:56:07Z role assignment names five other labs: Morrow/Kestrel, Orson, Meridian, Ravel and Mercer. It does not appoint Nadir.
- The October 1 21:07:30Z and 21:20:56Z messages give broad independent-playground and math-compilation permissions. They are not a Nadir-specific specialist charter.

The [Nadir Voss playground pointer](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NADIR_VOSS_PLAYGROUND_POINTER_2026-10-01.md) is an assistant-maintained source map, not a historical user appointment. The [prior h959 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/2026-11-19T2336Z_H959_S3_AIR_CORE_BOUNDARY_RANKINE_CLOSURE_AND_CAVITY_CONVECTION_COMPARATOR.md) likewise describes assistant reconstruction and a SILOED/PLAYGROUND boundary. The [raw export](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23%E2%80%A226.10.01%E2%80%A2Quantum%20Gravity%20and%20Experiments%20%E2%80%94%20raw.json) was checked directly. The ring label therefore does not authenticate a worker identity, grant access to private material, or create a response obligation.

No Nadir private inbox, restricted resource payload, or unverified current thread was used. No cross-thread delivery is claimed.

## 2. Control-plane preflight

The following live HsH documents were read from main:

| Document | Git blob |
|---|---|
| BEDROCK.md | bdfc6f401736aa4dd9de2bf23a7293b7f8919b07 |
| Steering Charter 2026-10-26 | be44c424674764c602b5f618dfce528c0f97b0ef |
| Three Paper Campaign 2026-10-26 | 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4 |
| New Instance Start Here | 43b577d42b8cced83f8836934598081685ea3ff3 |
| Revival Rotation V3 | 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14 |
| Revival Rotation V4 | 6761337dfcd0847226ee7baad84db0a9c496760a |
| Revival Thread Routing | d9ea7c3a04e03822c65ee231d0b9545bf37907bd |
| Nadir playground pointer | 80633e1a636c253da50ec0605544d07fa029b574 |
| Task branch graph | 412780e6a36d87692c39b00b37c345da0700f545 |
| PWH action queue | 86835f692c456deb26bf73f92eed89d877595a84 |

The SAT archive root README and HSH_RESOURCES root README plus indexes/AI_START_HERE.md were read. No private HSH_RESOURCES payload was opened.

Mersearch was not callable in this runtime. The four existing request lanes were not changed or retriggered. The immediately preceding [h997:s2 Elias report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-21T1324Z_H997_S2_MERSEARCH_RUNNER_SHUTDOWN_CHECKOUT_AUDIT.md) records runner shutdowns and the continuing request-lane boundary. This run used bounded direct source reads and GitHub API/connector access as fallback, not a Mersearch execution. No claim of exhaustive archive search is made.

The current HsH main head at preflight was d82bc1d69508b1d960c9c16740902a93a825bbb8. The separate formalization branch described below was not main and was not rebased.

## 3. Substantive architecture improvement

The existing ModelSelectionPreference contract already exposes an external proposition, identifiableAfterNuisance, but it did not provide a precise generic construction for discharging that proposition in a linearized additive-response model.

I extended existing draft PR #1487, rather than creating a duplicate PR or a new tool. The new section defines:

- A : Theta -> Y as the linear response map containing all standard-model and admitted nuisance directions.
- v in Y as one candidate extension-response direction.
- alpha as the candidate coefficient.
- The combined readout as A(theta) + alpha v.
- The candidate coefficient as structurally identifiable when equal readouts force equal alpha, even if theta changes.

The principal theorem states that coefficientIdentifiableAfterNuisance(A,v) holds if and only if v is not in range(A). The explicit quotient readout is q_A : Y -> Y / range(A); q_A(v) is nonzero exactly when it survives the standard-plus-nuisance quotient.

The proof has two directions:

1. If v is in the range of A, choose a nuisance displacement that reproduces v. A unit change in alpha can then be absorbed by that nuisance displacement, so alpha is not identifiable.
2. If two outputs agree with different alpha values, subtract the outputs. The nonzero coefficient difference times v lies in the range of A. Dividing by that nonzero scalar puts v in the range, contradicting the outside-range condition.

A second theorem proves that an invertible linear change of readout coordinates preserves this structural identifiability condition. A valid invertible whitening or calibration-coordinate transformation therefore cannot manufacture a new independent response direction. It can change the covariance norm and statistical detection threshold, which remain separate.

This is a necessary-and-sufficient criterion for one candidate scalar coefficient in a specified linearized additive model. It is not a universal criterion for nonlinear or constrained models. Those require a justified local tangent map or a separate global argument.

### Why this improves the workshop gate

The quotient map is an explicit projection, not an analogy:

- First define the standard-plus-nuisance response map A.
- Then project the observable space into Y / range(A).
- Only the candidate component surviving that projection can be structurally distinguished from the admitted standard and nuisance directions.
- Statistical detectability is assessed afterward, using the actual covariance and a frozen threshold.
- Independent holdout validation remains a separate empirical requirement.

This generalizes the existing [FactorialContrastIdentifiability work in parent PR #1387](https://github.com/Satobloc/HsH/pull/1387). That work handles a specific four-cell contrast and a shared first-harmonic orientation nuisance. The new theorem gives the same-span absorption criterion for an arbitrary linear response map and exposes its quotient-space interpretation.

## 4. Actual measured-system anchor: NIST BIPM torsion balance

The empirical anchor is a standard reference, not an H(s)H source:

Stephan Schlamminger et al., "Redetermination of the gravitational constant with the BIPM torsion balance at NIST", Metrologia 63 (2026) 025012, published 2026-04-16, [DOI 10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f).

Official NIST PDF:
https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075

The paper reports data collected 2024-01-24 through 2024-06-22. Eight torque differences were measured: copper source masses at 0, 120 and 240 degrees, plus sapphire at one orientation, each using electrostatic-servo and free-deflection readouts. Table 15 gives the measured torque differences. The six copper determinations are modeled with G(theta)=G_i + A sin(theta-theta0), with readout-specific G_i and shared orientation amplitude and phase. The four final configuration estimates and their covariance are in Tables 16 and 18.

The four Table 16 G values, in the order used below, are:

| Configuration | G (m^3 kg^-1 s^-2) | Relative standard uncertainty (ppm) |
|---|---:|---:|
| Copper servo | 6.673642e-11 | 23.2 |
| Copper free | 6.674021e-11 | 30.3 |
| Sapphire servo | 6.672637e-11 | 37.5 |
| Sapphire free | 6.673636e-11 | 93.9 |

Table 18 supplies the correlation matrix:

~~~text
          Cu-servo  Cu-free  Sa-servo  Sa-free
Cu-servo    1.00     0.42     0.38     0.12
Cu-free     0.42     1.00     0.23     0.23
Sa-servo    0.38     0.23     1.00     0.25
Sa-free     0.12     0.23     0.25     1.00
~~~

### Reproducible summary-table contrast

I calculated the material-by-readout difference-in-differences:

D = (G_sapphire,free - G_sapphire,servo)
    - (G_copper,free - G_copper,servo).

For vector order [Cu-servo, Cu-free, Sa-servo, Sa-free], the contrast vector is w=[1,-1,-1,1]. The covariance was constructed from the published relative uncertainties and correlation matrix:

C_ij = R_ij (G_i u_i) (G_j u_j).

The calculation was run in Python using the published summary values:

~~~python
import numpy as np

G = np.array([6.673642, 6.674021, 6.672637, 6.673636]) * 1e-11
u_rel = np.array([23.2, 30.3, 37.5, 93.9]) * 1e-6
R = np.array([
    [1.00, 0.42, 0.38, 0.12],
    [0.42, 1.00, 0.23, 0.23],
    [0.38, 0.23, 1.00, 0.25],
    [0.12, 0.23, 0.25, 1.00],
])
C = np.outer(G * u_rel, G * u_rel) * R
w = np.array([1.0, -1.0, -1.0, 1.0])
D = w @ G
uD = np.sqrt(w @ C @ w)
Gbar = np.mean(G)
print(D, uD, D/Gbar*1e6, uD/Gbar*1e6, D/uD)
~~~

Output:

~~~text
D = 6.200000e-15 m^3 kg^-1 s^-2
u(D) = 6.117981e-15 m^3 kg^-1 s^-2
D/Gbar = 92.91 ppm
u(D)/Gbar = 91.68 ppm
D/u(D) = 1.013
~~~

For context, the separate free-minus-servo contrasts are approximately:

- Copper: 3.79e-15 +/- 1.96e-15 m^3 kg^-1 s^-2, standardized contrast 1.93.
- Sapphire: 9.99e-15 +/- 6.14e-15 m^3 kg^-1 s^-2, standardized contrast 1.63.

These are covariance-aware calculations from rounded published summary tables, not a raw-data reanalysis, p-values, or preregistered tests. The 1.01 standardized difference-in-differences is not evidence of a material-dependent method effect at this summary resolution.

The paper explicitly says the servo estimates are below the corresponding free-deflection estimates in both campaigns, that the systematic offset is not conclusively explained, and that a configuration-specific Bayesian dark-uncertainty model is added. Table 19 gives posterior medians for configuration effects and dark uncertainties, but the joint posterior draws/covariance needed for a defensible posterior interval on D were not retrieved. I therefore did not fold those marginal medians into a second z-score. The measurement-only contrast above must not be presented as the paper's final uncertainty analysis.

No raw acquisition time series, acquisition-unit map, or independent holdout was retrieved. The four final G estimates are derived summaries, not four independent raw measurements.

## 5. Test matrix and what would distinguish H(s)H

| Element | Source-grounded status |
|---|---|
| Measured system | BIPM torsion balance operated at NIST |
| Standard comparator | Newtonian gravitational torque and mass-integration model, with the paper's servo/free readout and copper orientation treatment |
| Measured channels | Eight Table 15 torque differences; four Table 16 configuration-level G estimates |
| Shared parameters | Source/test-mass geometry and mass integration; shared copper orientation harmonic across readouts; readout-specific intercepts |
| Known nuisance structure | Correlated input uncertainties; configuration-specific dark effects in the paper's hierarchical model |
| Candidate H(s)H response vector v | NOT DEFINED |
| Standard-plus-nuisance map A for an H(s)H comparison | NOT INSTANTIATED |
| Calibration/holdout split | No independent acquisition-unit map or untouched holdout established from the accessible source |
| Predicted observable | Not supplied by H(s)H; would have to be a frozen torque/readout residual vector |
| Falsification threshold | Not set; must be derived from the full covariance and a predeclared holdout protocol |

The four configuration-level summaries alone are especially vulnerable to hidden flexibility. If their four configuration-specific effects are treated as unconstrained fixed nuisance directions, those directions span the entire four-dimensional summary space and absorb any four-cell candidate response. The paper instead regularizes its configuration effects hierarchically; any claimed separation must therefore expose those prior assumptions. The richer eight torque differences and the shared copper orientation model retain additional structure, but an H(s)H comparison still needs a source-grounded response map and the complete covariance.

A defensible future test would freeze the Newtonian standard model, source geometry, mass integration, readout calibration, copper orientation nuisance, covariance model and any H(s)H parameters on calibration acquisitions. It would then predict a named residual vector on genuinely independent acquisition units. The candidate is structurally distinguishable only if its linearized response survives the quotient projection q_A(v). It is statistically detectable only if the covariance-weighted residual exceeds a threshold declared before holdout access.

The present source does not supply an H(s)H map into torque, a candidate vector v, a fit, a prediction, an independent holdout or a numerical falsification threshold. This is a real-data diagnostic of the comparator and nuisance architecture, not an H(s)H result or a P2 candidate selection.

## 6. Formalization status and limits

The new formalization was appended to the existing draft PR:

https://github.com/Satobloc/HsH/pull/1487

- Branch: research/intelligibility-selection-gate-20261108t1336z
- New branch head: 705e055aff20e342e4c754ad45248361fdbabea9
- Previous head: 9c660ab099cfa39afcf7facc16f97e2e2cd24d9a
- New ModelSelectionPreference.lean blob: 9ca3f60be09ae8621b3c03db806a649f69ba148b
- PR state: OPEN / DRAFT / UNMERGED
- Base remains the existing parent branch research/hale-measurement-domain-contract-20261105t0936z at 2589d4c3ac6cb3aa44910c8cef068a1cdd6e6105.
- No rebase, retarget, merge or new PR was performed.

Six new declarations include the scalar identifiability equivalence, the explicit nuisance quotient readout, the quotient nonzero equivalence, and invariance under invertible linear readout-coordinate changes. The file includes theorem-specific #print axioms commands.

**Lean status: SUBMITTED_NOT_VERIFIED.** The earlier PR merge-reference run #42751414165 compiled the previous module state, not this new head. No workflow run was returned for head 705e055aff20e342e4c754ad45248361fdbabea9. The combined status showed only the unrelated Vercel free-deployment-rate-limit failure. The existing lean-verification.yml supports workflow_dispatch and pull_request path triggers, but no workflow-dispatch action is exposed in this runtime. The local container has no lean, lake or elan executable, and network access was unavailable for installing a temporary toolchain. No successful compile or theorem-specific axiom output is claimed for the new declarations.

The next formal verification step is an authorized dispatch of the existing Lean workflow against the updated PR head. Keep the PR draft and unmerged until the exact code is compiled and independently reviewed.

Lean, when run, will verify only the formalized algebra. It will not establish that the NIST data were translated into A and v correctly, that the physical premises are true, or that an H(s)H mechanism exists.

## 7. Project boundaries and continuity

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-OWNED.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor-paper gate: MISSED.
- November 30 major-paper gate: HOLD.
- December 14 full-theory gate: INCOMPLETE.
- FIE last reviewed November 20; next review December 4.
- The predecessor h997:s2 completed the unrelated reading break and recorded return cursor 59593. No duplicate break was performed here.
- PWH WH-02 remains Calder-owned; no takeover or reassignment.
- No SAT-O or Blockwave equation was changed. No H(s)H symbol, thickness, twist, contact surface, force law or physical premise was promoted.
- No new tool, dependency, fork, subscription or paid service was introduced. SciSpace was available but not needed for this formalization or published-summary calculation.
- No private HSH_RESOURCES payload was accessed.
- No P2 selection, physical H(s)H fit, prediction, independent measurement, holdout result or paper-gate advancement is claimed.

The existing Workshop Relay :36 task remains enabled with its original task ID, hourly cadence, prompt and Lane Charter 36 phase unchanged. No sixth task, scheduler mutation, signet or conversation rename.

**Next research cursor:** obtain an authorized exact-head Lean run for PR #1487; then, separately, construct a source-grounded standard-plus-nuisance map A and candidate response v for a real H(s)H observable. Do not fit or predict until those maps, shared parameters, calibration units, full covariance and untouched holdout are identified.
