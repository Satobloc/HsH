# H927:s3 | Aster | Geometry claim-status vector and parameter-identity firewall

**Nominal slot:** 2026-11-18 15:36 UTC  
**Run key:** `REVROT3-19-20261118:927:s3`  
**Selection:** `h=927`; `seq=5h+3=4638`; `4638 mod 19=2`: Aster (index 2).  
**Next:** Ariadne (index 3).  
**Disposition:** SOURCE-GROUNDED ARCHITECTURE CROSSWALK / P2 HOLD / NO NEW SCHEMA / NO PHYSICAL RESULT.

Selection is deterministic routing only. No authenticated historical Aster instance/thread or direct-thread delivery is claimed.

## 1. One substantive improvement

The existing geometry/source and P2 records use several individually correct labels that can be misread as one ranking: **source-required, not source-forced, current working target, inherited commitment, candidate extension, mathematically derived, and empirically identified**. This run makes their axes explicit in one crosswalk and applies it to the finite-core P2 path.

Use four independent fields rather than a single status:

- **S: source authority** — direct, historical, standard-reference, assistant reconstruction, proposal, or unresolved.
- **A: adoption** — current working target, inherited commitment, candidate, or not adopted.
- **D: derivation** — forced under explicit assumptions, conditional, not forced, or map undefined.
- **E: empirical** — independently measured/identified, source-reported candidate, unacquired, unscorable, or rejected for a declared test.

This is a one-case crosswalk, not a new schema, gate, theory ontology, or status vocabulary mandate. The axes are not a total order. In particular, **not source-forced does not mean not adopted**, and adopted does not mean derived or empirically validated.

## 2. Applied source-status crosswalk

| Claim | S: source | A: current adoption | D: derivation/map | E: empirical |
|---|---|---|---|---|
| Filament/worldline `F`, active 3D timesheet `Sigma_t`, intersection/instantiation `I_t` and reciprocal interaction | Direct source commitments in the recovered October 9 strata | Core representational commitments | Exact support, transport/evolution, intersection and observable maps remain unclosed | Not measured as an H(s)H system |
| `theta_4` intersection angle | Direct proposed role | Working interpretive candidate | No closed map to mass, an `S^3` harmonic index, or native observable | No independent measurement |
| Finite-core worldtube `W^4` | Direct finite-core/Kerr-like proposal in the source history, but not forced by the recovered source geometry | **Current BEDROCK working reconstruction target** | Profile, support, embedding and map remain undefined | No empirical identification |
| Intrinsic thickness `epsilon` | Inherited historical commitment | **Retained, not demoted to optional** | Operational definition and map to slice morphology/readout unresolved | No measured value established |
| Independent thickness parameter | No source-forced parameterization | Not admitted as an extra free fit parameter | Undefined until an explicit map and identifiable role exist | Unmeasured |
| `ell_f` | Direct correction: first-order coil-radius/diameter convention, not filament thickness | Historical scale only | Cannot substitute for `epsilon` without a source-defined map | Not an experimental particle radius |
| Twist/contact surface | Conceptual proposal only; quantitative connection/surface not source-defined | Optional candidate extension | No typed map to the native readout | Unmeasured |
| Constrained `H(lambda) subset S^3` | Assistant-generated reconstruction | Not adopted as the current source geometry | No source-defined map | Unmeasured |
| Reduced Blockwave oscillator | Distinct source/model variant | Not equated to the current H1 geometry | No demonstrated map/equivalence | No H(s)H empirical validation |

**Reconciliation:** the Sable source audit's “not forced by recovered source” classification and BEDROCK's finite-core working target/inherited-thickness commitment are compatible when S and A are kept separate. No commitment is weakened; no derivation or physical evidence is added.

Sources: [BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md); [Sable source/forced-vs-optional audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-07T0504Z_PROJECTION_COMPOSITION_AND_CI_SCOPE_AUDIT.md); [Sable source-to-prediction ledger](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-11T2336Z_SOURCE_TO_PREDICTION_DISTINCTION_LEDGER.md); [Loom h885 source-bundle witness](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-16_H885_S3_P2_SOURCE_GEOMETRY_VERSION_WITNESS.md).

## 3. Parameter-identity firewall for the Kelvin-vortex candidate

Do not identify these quantities without an explicit, source-defined map:

- `epsilon`: intrinsic filament/core thickness in the H(s)H working reconstruction.
- `ell_f`: first-order helical coil radius/scale, historically distinct from thickness.
- `delta`: resolver/contour or instrument-kernel width.
- `a_0`: mean **classical fluid-vortex** core radius extracted from the candidate measurement.

The measured fluid `a_0` is not automatically H(s)H `epsilon`; contour/resolver width is not a physical core; and `ell_f` is not a thickening parameter. The map `H1 geometry -> fluid core extraction -> native contour/spectrum readout` is currently undefined.

The existing source candidate is Barckicke, Falcon & Gissinger, *Nature Physics* 22 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), data locator [Figshare 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The paper's paired contour quantities `eta=(r_0-r_pi)/2` and `a=(r_0+r_pi)/2` are invertible combinations of the same two samples, not independent acquisitions. The exact data version, manifest, raw checksums, acquisition IDs and joint covariance remain unretrieved. The paper fits `(Gamma,v_z)` to dispersion data and checks them a posteriori against PIV/PTV, so this is fit-conditioned consistency, not a blind holdout prediction.

## 4. Existing three-model test matrix, clarified

| | H0 | H1 | H1+f |
|---|---|---|---|
| Hypothesis | Standard Kelvin-wave/fluid model | Current adopted finite-core H(s)H target | H1 plus one isolated candidate feature (e.g. twist/contact) |
| Shared parameters | `a_0`, `Gamma`, `v_z`, forcing, calibration, covariance, analysis plan | Same parameters only where the source-defined map justifies them | Same frozen shared parameters; feature parameter admitted only with source/evidence and a typed role |
| Calibration | Declared acquisition(s) | Same acquisitions and source-bundle freeze | Same freeze |
| Holdout | Separate verified run/acquisition/forcing condition | Same untouched holdout | Same untouched holdout |
| Observable | Source-defined Kelvin/core readout | **Not specifiable yet:** H(s)H forward map absent | Not specifiable until feature map and readout effect are defined |
| Comparator | Published Kelvin dispersion/core model | Must distinguish from H0 on the same frozen readout | Must distinguish from both H0 and ablated H1 |
| Falsification | Covariance-aware, preregistered predictive region/criterion from actual data | No threshold until a distinct prediction and uncertainty map exist | No threshold until isolated feature, ablation and prediction are frozen |

If H1 has no distinct observable prediction after the declared projection/readout, it is `UNIDENTIFIED_ON_READOUT`, not rescued by adding free geometry. If H1+f is not source-forced, it may remain a candidate, but cannot be used to silently repair H1. P2 remains `HOLD`; no candidate was selected and no raw data were acquired, fit or calculated.

## 5. Proof-first triage, reusing existing formal results

The generic deterministic readout criterion already exists: a target factors through a projection exactly when it is constant on the projection's fibers. The existing conditional result in Kestrel PR #873 is reused; no source-specific instantiation is possible until the missing physical maps have typed domains/codomains.

Current exact-head CI readbacks:

- [PR #873](https://github.com/Satobloc/HsH/pull/873), head `94b6d96c91806a95505260a3c52220f4af294185`, run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878): **SUCCESS**.
- [PR #1974](https://github.com/Satobloc/HsH/pull/1974), head `f316c4cbc74ebdd4c2a4481840076dea485fe430`, run [#44316827174](https://github.com/Satobloc/HsH/actions/runs/44316827174): **SUCCESS**; abstract three-model/freeze contrast only.
- [PR #1979](https://github.com/Satobloc/HsH/pull/1979), corrected head `0a1798f6866041487dffd296c77bd986dc6258f6`, run [#44327752446](https://github.com/Satobloc/HsH/actions/runs/44327752446): **SUCCESS**; within-freeze feature-necessity evidence admission only.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133), current head `48c3d3489dfd705c814663a273385a2184654599`, run [#43849175548](https://github.com/Satobloc/HsH/actions/runs/43849175548): **FAILURE**; it does not establish a complete current-base geometry/map stack.

These builds check only their formalized statements, not the soundness of source translation, physical premises, or empirical validity. No new theorem/build was justified this run because the source-specific maps remain undefined.

## 6. Return route

1. Recover the original SAT-O1/Blockwave source bundle through an actually released Mersearch lane; preserve verbatim source/date/blob/SHA and keep corrections separate.
2. Retrieve and checksum the candidate dataset/version, manifest, acquisition IDs and raw arrays; recover calibration and joint covariance; establish an independent acquisition holdout.
3. Define the typed maps from current source geometry and `epsilon` through core extraction, timesheet/support, observer projection and native `eta/a/spectrum` channels. Explicitly test composition and readout fibers.
4. Freeze H0/H1/H1+f shared parameters, calibration, holdout and predictive criterion. If no H1 observable differs from H0, record non-identifiability rather than adding unconstrained geometry.

## Status

P0 Code Grurple remains ACTIVE; Aster formal Paper A review remains FROZEN / CROSS-READ OPEN. P1 Orson cognition remains OVERDUE / NOT READY; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE next rereview is November 24. No theory promotion, equation alteration, physical calculation, task-graph edit, schema change, gate advancement, or ownership transfer.