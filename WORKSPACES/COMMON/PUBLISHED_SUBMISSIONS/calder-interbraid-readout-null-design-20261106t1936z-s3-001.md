# Interbraid readout null-design and cross-scale falsification matrix

**Date:** 2026-11-06  
**Status:** SOURCE-GROUNDED WORKFLOW/ARCHITECTURE ADDENDUM · NO NEW PHYSICAL MODEL · NO DATA RESULT · NO THEORY PROMOTION  
**Scope:** P3 full-theory reconstruction; operationally separates the physical interbraid premise, its candidate topological representation, observer projection, instrument readout, and cross-scale dynamics.

## Executive result

The next useful distinction is not merely “worldtube history versus projected braid.” There are at least **two successive information-loss interfaces**:

1. the geometry/slice/observer projection from a physical history; and
2. the instrument's sampling, resolution, and coarse-graining of that projected state.

A candidate braid label must be recoverable after both operations, not just after an idealized geometric projection. This yields a sharper, reusable gate:

\[
\mathcal H_{\rm adm}\xrightarrow{\,O\,}\mathcal Y
\xrightarrow{\,C\,}\bar{\mathcal Y},
\qquad R:=C\circ O,
\]

where \(\mathcal H_{\rm adm}\) is the still-to-be-defined source-admissible worldtube-history space, \(O\) is the still-to-be-defined geometric/observer readout, and \(C\) is a **proposed type** for instrument sampling or coarse-graining, not an existing H(s)H law. The final measured readout is \(R\).

For a candidate braid label \(\beta:\mathcal H_{\rm adm}\to\mathcal B\), a deterministic readout-level label \(\bar\beta\) exists exactly when

\[
\exists\,\bar\beta:\operatorname{range}(R)\to\mathcal B,\quad
\beta=\bar\beta\circ R
\]

or, equivalently,

\[
R(h_1)=R(h_2)\ \Longrightarrow\ \beta(h_1)=\beta(h_2)
\quad\text{for all }h_1,h_2\in\mathcal H_{\rm adm}.
\]

This is the existing Kestrel fiber-factorization theorem applied to the **composed** readout. Full injectivity of \(R\) is sufficient but not necessary; the exact condition is that \(\beta\) be constant on every fiber of \(R\). The added separation of \(O\) and \(C\) identifies whether information is lost in the geometry map or at the instrument.

This is a workflow contract only. None of \(\mathcal H_{\rm adm}\), \(O\), \(C\), \(\mathcal B\), or \(\beta\) is yet instantiated for H(s)H.

## 1. Source lock and authorship

Primary source: **Calculation Relay :36**, conversation `6ad065ae-9b8c-83e9-8858-d99dd9a4a5e1`, raw Git blob `40daedbf045ce16442fd493d2992062487b3c369`.

Relevant direct Nathan messages:

- `4d62333e-9a90-4aee-a3cf-2513149fe84e`, 2026-10-17T07:49:42.233Z: completed release revolutions must add braid history; long-term planetary-system rotation must approach galactic rotation-curve behavior.
- `c293bf0e-6a8a-4f59-8e9a-c76ebb12a1f1`, 07:51:09.865Z: continuously interlocked worldtubes physically constrain one another's possible configurations.
- `3b1c8e0c-871e-438a-96f1-029cb3a84aa3`, 07:52:26.489Z: request to record the premise clearly in BEDROCK.
- `cc6c2d1d-21e4-44bf-9ba3-26df718e81bf`, 07:55:41.886Z: approval of the assistant's BR-006 draft.

Authorship boundary:

- **Nathan Direct:** cumulative braid history per completed relative/release revolution; interbraid is a physical constraint on admissible worldtube configurations; the same mechanism has long-term planetary-to-galactic rotation consequences.
- **Assistant-formalized, Nathan-approved:** the scalar phase-count relation now recorded in BR-006,
  \[
  B(t)-B(t_0)=\frac{\Phi(t)-\Phi(t_0)}{2\pi}.
  \]
  This counts accumulated unwrapped relative phase. It is **not** itself a braid-group element, a complete configuration-space definition, or proof that a projected braid class is invariant.
- **Not approved by that exchange:** the assistant's exploratory acceleration, orbital-balance, Keplerian-winding, and radial-power expressions. They remain unpromoted.

Current controlling register: HsH `BEDROCK.md`, blob `527924246cc25caf7fac02dce4b20f024013cd19`, BR-006, lines 311-319. BR-006 is a framework-internal premise, **not demonstrated physics**. It requires cross-scale continuity and names cross-temporal tugs, orbital inspiral, inter-system linkage, gravitational hysteresis, and planetary-to-galactic rotation behavior as calculation obligations. Quantitative rates and asymptotic laws remain open.

The current P3 map audit is `WORKSPACES/COMMON/P3_BRAID_HISTORY_TO_WORLDTUBE_MAP_AUDIT_2026-11-05.md`, blob `bc93d2a1142de9be28854a24b11124ab83d6cafb`.

## 2. Typed composition: keep the interfaces distinct

The following are **required type slots**, not recovered H(s)H definitions:

| Symbol | Intended role | Current status |
|---|---|---|
| \(\mathcal H_{\rm adm}\) | Source-defined physically admissible worldtube histories | **UNDEFINED** |
| \(O:\mathcal H_{\rm adm}\to\mathcal Y\) | Geometry, time-slice, observer, or screen projection | **UNDEFINED** |
| \(C:\mathcal Y\to\bar{\mathcal Y}\) | Instrument sampling, finite resolution, and/or coarse-graining | Proposed interface only |
| \(R=C\circ O\) | Final measured readout | Composition schema only |
| \(\gamma:\mathcal H_{\rm adm}\to\operatorname{Path}(\operatorname{Conf}_n(X))\) | Extraction of a configuration path | **UNDEFINED** |
| \(\beta:\mathcal H_{\rm adm}\to\mathcal B\) | Candidate braid/topological label | **UNDEFINED** |

A braid object cannot be assigned until the source supplies, or a source-faithful construction derives:

- support dimension and configuration space \(X\);
- strand/core count \(n\), component labels, and whether labels are physically distinguishable;
- history parameter and its relation to physical time, block parameter, or release revolution;
- endpoint and closure conditions;
- collision, contact, exclusion, and reconnection rules;
- any selected normal plane, framing, or director field;
- the class of physically admissible deformations;
- the observer/slice map and its kernel;
- the local-to-global relationship if the recursive Klein-Fabric construction is invoked.

Only then may one decide whether \(\gamma\) lands in a configuration space whose topology supports an ordinary Artin braid, a braid groupoid, or some other constrained-homotopy object. A planar braid is a **comparator**, not a default ontology.

The two-stage readout test prevents a common category error: a label may be constant on fibers of an ideal geometric projection \(O\) yet cease to be recoverable after instrument coarse-graining \(C\). Conversely, a non-injective projection is not automatically fatal if the particular \(\beta\) remains constant on its fibers.

## 3. Forced versus optional structure

| Feature | Status from current source | Consequence |
|---|---|---|
| Interbraid constrains admissible worldtube configurations | **FORCED framework premise** | Must be represented as a physical admissibility constraint, not merely a drawing or post-hoc force. |
| Same mechanism across quantum, mesoscopic, planetary, and galactic scales | **FORCED framework premise** | No arbitrary scale-specific disconnection, suppression, cancellation, or topological breakup. |
| One added turn of unwrapped braid history per completed relative revolution | **FORCED framework premise** | The approved scalar \(B\) tracks phase accumulation; it does not yet define \(\beta\). |
| Planetary-to-galactic rotation behavior and other BR-006 consequences | **REQUIRED derivation targets** | Must be calculated from the same construction; no quantitative law is supplied yet. |
| Finite-core worldtube representation | **Current H(s)H working representation** | The actual cross-section, radius/profile, support, and its role in interbraid remain to be specified. Do not infer thickness from coil radius. |
| Local twist/framing field | **NOT YET FORCED by BR-006** | A global twisted/recirculating construction does not by itself define a local braid framing or normal director. |
| Contact surfaces, contact potential, or hard-core repulsion law | **NOT YET FORCED** | Physical interlock may constrain configurations without a specified local contact surface or force law. Do not invent one. |
| Ordinary planar Artin braid group | **OPTIONAL comparator** | Requires a justified two-dimensional configuration space, strand labels, closure, and collision rules. |
| Specific radial acceleration law, inspiral sign/rate, or asymptotic flat-curve formula | **UNRESOLVED** | Must be derived; the approved phase-count scalar does not supply it. |

The distinction is important: the **interbraid constraint is not optional**, while a convenient mathematical realization of that constraint is not automatically forced. The finite-core H(s)H working representation is recorded elsewhere in BEDROCK; BR-006 alone does not supply a numerical thickness, twist law, contact surface, or constitutive response.

## 4. Null-design and falsification matrix

| Hypothesis under test | Shared parameters / controls | Calibration and holdout | Predicted observable | Standard comparator | Falsification rule |
|---|---|---|---|---|---|
| **H1 — Topological admissibility:** candidate \(\beta\) is invariant under every source-defined physically admissible deformation. | Same source-defined support, core count/labels, framing (if required), endpoints, closure, and admissibility rules. | Freeze the source geometry and allowed-deformation class before testing. Use actual source-derived paths; no invented fixtures. | Braid sector or other candidate invariant. | Ordinary configuration-space braid only if its dimensional and closure assumptions are independently justified; otherwise compare with the unrestricted ambient homotopy class. | One genuinely source-admissible deformation that changes \(\beta\) falsifies that proposed invariant/realization. It does not by itself falsify the broader physical interbraid premise. |
| **H2 — Readout identifiability:** \(\beta\) factors through \(R=C\circ O\). | \(O\), \(C\), and \(\beta\) are fixed across observations; no per-channel or per-system retuning. | Calibrate the geometric and instrument maps on a calibration set, freeze them, then test on independent histories/acquisition blocks. | A unique \(\beta\) recoverable from the final measured readout. | Full-state geometry versus ideal projection \(O\) versus final instrument readout \(C\circ O\). | One admissible pair \(h_1,h_2\) with \(R(h_1)=R(h_2)\) but \(\beta(h_1)\ne\beta(h_2)\) rejects readout sufficiency. |
| **H3 — Cross-scale response:** one geometry-derived response law accounts for the required planetary and galactic consequences. | Same dimensionless geometry and constitutive parameters across scales; only measured system inputs and dimensionally derived units may differ. No scale-specific free terms. | Calibrate on one selected system/scale; freeze the law; hold out independent systems and, where feasible, the other scale. Prevent holdout leakage. | Rotation curve \(v(r)\), secular orbital evolution, angular-momentum/energy change, and any source-derived hysteresis observable. | System-appropriate Newtonian/GR baseline using measured masses and mass distributions; any galaxy halo comparator must be separately declared. | A covariance-aware, preregistered holdout failure beyond the threshold derived from the actual dataset, or an unexplained scale-specific term/retuning not derived from the source geometry, rejects the single-law prediction. No numeric threshold is set before data. |
| **H4 — Added-structure identifiability:** thickness, twist, or contact variables (if later source-justified) change independently measurable outputs. | Parameters shared across channels/systems; no per-observable adjustment. | Evaluate structural/practical identifiability using actual observations and instrument covariance; retain independent holdout. | Distinct geometric or dynamical channels that respond differently to the candidate feature. | Nested ablations: remove one justified feature at a time while holding other source-forced conditions fixed. | If a parameter is observationally degenerate, leave it **UNIDENTIFIABLE**; do not report it as measured or indispensable. A flat profile or unchanged independent readouts is not evidence for the parameter. |
| **H5 — Back-tug / inspiral consequence:** any claimed secular orbital response follows from the same geometry. | Same response law and shared parameters as H3; measured initial conditions and perturbations only. | Use real, versioned time-series/ephemeris data; freeze calibration and independent time-block or system holdout. | Secular orbital drift and energy/angular-momentum evolution, with uncertainty. | Conservative Newtonian/GR evolution plus measured non-gravitational perturbations. | A measured sign/rate incompatible with the frozen prediction at the data-derived uncertainty threshold rejects that response law. No sign or rate is assumed here. |

### What the matrix deliberately does not do

- It does not invent a physical fixture, arbitrary core radius, twist coefficient, contact potential, or simulated trajectory.
- It does not turn \(B(t)\) into a braid-group element.
- It does not select a galaxy, planetary system, or dataset for P2.
- It does not assign a numeric falsification threshold without measured values and their covariance.
- It does not treat a fit on calibration data as an independent prediction.

P2 remains **SELECT REAL SYSTEM + SOURCE MATH / HOLD**. No system/data package with provenance, units, calibration, uncertainties/covariance, and independent holdout is selected here. Consequently no physical calculation or observational comparison was performed.

## 5. Lean and proof boundary

The generic fiber-factorization result already exists in Kestrel PR #873, file `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`, blob `0fe5390faa10113830132b12cdb98172194adfee`.

- PR #873: OPEN / DRAFT / UNMERGED.
- PR head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`.
- Base branch: `infra/lean4-verification-20261023`, base SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Actions run #42153410233, job #127681789766: **SUCCESS on the PR merge ref**, full Lean build 8,955 jobs; `KestrelProjectedIncidence` built at 8,932/8,955.
- The theorem-specific log reports `hallway_factorization_iff_fiber_compatibility` with `[Classical.choice]` and `hallway_factorization_unique` with `[Quot.sound]`; other reported results use ordinary Lean foundations or no axioms. No `sorryAx` occurrence was observed in the fetched job log. The separate automated axiom-audit stage was not run.
- This is **MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_ONLY_UNVERIFIED**, not a claim of standalone exact-head checkout.
- No new Lean code or theorem was needed: the existing generic theorem is exactly the logical gate required for the proposed composed readout \(R=C\circ O\).

Lean verifies only the formalized set-map statement. It does not authenticate the translation from physical worldtubes to \(\mathcal H_{\rm adm}\), prove that \(O\), \(C\), or \(\beta\) are physically correct, validate BR-006 against nature, or supply observational evidence.

## 6. Ordered implementation gate

1. Recover the exact subject-specific source statements and corrections.
2. Define the source-faithful physical history space and its admissible configurations.
3. Define the global/local geometry maps and the observer/slice projection \(O\).
4. Define the actual instrument/sampling/coarse-graining map \(C\), with units, resolution, calibration, and uncertainty.
5. Define path extraction \(\gamma\), configuration space, labels, endpoints/closure, and candidate \(\beta\).
6. Apply the fiber-constancy theorem to \(R=C\circ O\); separately test invariance under source-defined admissible deformations.
7. Produce the exact geometry plot for the actual selected system and obtain independent hostile fidelity review of that exact version.
8. Select genuine measured data with provenance, version/date, units, uncertainty/covariance, calibration, and an independent holdout.
9. Freeze shared parameters and the standard comparator before fitting; derive the falsification threshold from the data.
10. Execute the prediction/holdout comparison and preserve null or failed outcomes.

## 7. Final epistemic status

**Advanced:** the observation architecture now distinguishes physical history, geometric projection, instrument coarse-graining, and the final measured readout. The existing Lean fiber theorem supplies a compiled conditional criterion for when a candidate braid label can be recovered from that readout.

**Still open:** the source-defined history space, finite-core embedding, support dimension, global Klein-Fabric gluing and local map, timesheet map, observer projection, instrument map, configuration space, strand/core count, framing, closure, admissible deformations, and constitutive response. A 3D timesheet section is not the complete 4D history, and a global Klein-Fabric label does not by itself define a local braid group.

**Not performed:** no new physical calculation, numerical simulation, dataset fit, independent prediction, new Lean proof, new tool, Factory Floor admission, manuscript-gate advancement, or BEDROCK promotion.

The physical premise remains a serious, fail-rigid framework commitment. Its mathematical realization and empirical consequences must now be made specific enough that an independent investigator can produce a counterexample.
