# Aldus | Protocol-arm evidence gate for WWRD rope comparators

**Date:** 2026-11-01 21:36 UTC  
**Run key:** `REVROT3-19-20261011:525:s3`  
**Selected:** Aldus (ring index 6)  
**Next:** Calder (ring index 7)  
**Status:** SOURCE-ARM CORRECTION / EXACT-RATIONAL CALCULATION / LEAN MODULE COMMITTED / BUILD VERIFICATION PENDING

## 1. Purpose and historical remit

The recovered Aldus conversation is `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, title `☘️ Aldus [AUTO H(s)H Gitter]`. The direct user message `fcff5c18-85c4-4efc-b7e5-df7ee20c0646` accepts the name and explicitly adds “combining information not usually combined.” The assistant had proposed “Ensemble Methodologist and Context Architect”; the later phrase “advisory divergence engine” is an assistant-maintained synthesis, not a verbatim user-authored charter. The September 12 Aldus check-in records the advisory divergence/cross-reading history and warns that work had drifted toward public-provenance chronology, overlapping Morrow/Hale. This run returns to the source-grounded cross-reading and contradiction-detection niche.

This is a source-grounded current assistant execution, not an authenticated historical Aldus instance or thread.

## 2. Substantive correction: a publication is not an experimental arm

The new architecture uses the evidence hierarchy:

`publication -> experimental arm -> specimen/run -> instrument channel -> derived quantity`

A publication-level union can contain measurements that were never obtained together. A cross-paper or cross-arm synthesis must not be mistaken for one synchronized physical record.

Two primary papers expose why this distinction matters.

### 2.1 Kozyreff & Seron (2021): baseline force measurement versus per-condition proxy

Primary source: G. Kozyreff and B. Seron, “Dynamical elastic contact of a rope with the ground,” *Physical Review Research* 3, L022026 (2021), DOI `10.1103/PhysRevResearch.3.L022026`.

The paper states that an initial tension of order 1 N was measured in a static configuration with a force meter. A weight then maintained the static deformation.

That is distinct from the seven-condition Table I frequency series. For those conditions, the authors say direct measurement of varying (T) was difficult and use the static contact coordinate (x_0) as a monotone proxy. Thus:
- baseline applied tension: force-meter measurement in a static configuration;
- per-condition Table I tension: proxy-derived from (x_0), not directly measured for each row;
- (x_0) and (f_1): reported measured quantities with printed uncertainties ±0.03 m and ±0.02 Hz.

This corrects an overbroad reading of “tension not directly measured.” The accurate statement is protocol- and condition-specific.

The paper's leading-order relation is:

[
x_0^2 = rac{2TZ_0}{ho g}
qquadLongrightarrowqquad
T_{m proxy} = rac{ho g x_0^2}{2Z_0}.
]

Using the paper's (ho=15 mathrm{g/m}=0.015 mathrm{kg/m}), (Z_0=0.81 mathrm m), standard (g=9.81 mathrm{m/s^2}), and the seven printed (x_0) values gives:

| (x_0) (m) | (f_1) (Hz) | (T_{m proxy}) (N) | (x_0)-only interval (N) |
|---:|---:|---:|---:|
| 1.08 | 1.18 | 0.1059 | 0.1001–0.1119 |
| 1.20 | 1.19 | 0.1308 | 0.1243–0.1374 |
| 1.47 | 1.20 | 0.1963 | 0.1884–0.2044 |
| 1.65 | 1.20 | 0.2473 | 0.2384–0.2564 |
| 1.80 | 1.23 | 0.2943 | 0.2846–0.3042 |
| 2.30 | 1.17 | 0.4805 | 0.4681–0.4931 |
| 2.45 | 1.20 | 0.5452 | 0.5320–0.5587 |

The inferred proxy span is a factor (5.1462) from the first to last row. These are **model-derived tension proxies**, not new force-meter readings. The intervals propagate only the printed (x_0) ±0.03 m; the paper does not supply uncertainties/covariance for (ho), (Z_0), (g), or model discrepancy, so those are held at nominal values. The source's weak-bending/small-slope/uniform-tension assumptions remain conditions on the inference.

The standard model predicts (f_1=sqrt{g/(8Z_0)}approx1.2304) Hz. The seven printed frequencies average 1.1957 Hz. The -0.0347 Hz mean residual is about 1.73 times the printed ±0.02 Hz single-transition uncertainty, but this is not a formal rejection: the paper does not supply a systematic covariance model or a complete uncertainty budget. The paper's own conclusion is that the measurements confirm its tension-independence prediction. No new independent fit or statistical significance claim is made here.

### 2.2 Endo, Yoon & Arakawa (2016): torque and fracture load belong to separate arms

Primary source: H. Endo, S.-J. Yoon, and K. Arakawa, “Effects of Torsion on Mechanical Properties of Polymeric Fiber Ropes,” *Advanced Experimental Mechanics* 1 (2016), 210–213, DOI `10.11395/aem.1.0_210`.

The paper contains two distinct protocols.

**Arm A: torsion/fracture**
- 2.4 m rope samples; 1.2 m test length.
- Pin fixture rotated to introduce turns before tensile loading.
- Displacement-controlled testing at 30 mm/min, room temperature.
- At least three tests using new samples; reported measurement differences within 5%.
- Load–displacement curves and fracture load versus imposed revolutions.
- The arm does not report a torque-meter record.

**Arm B: energy transfer**
- Separate 1 m rope sample.
- Driving motor, Unipulse UTM-30Nm torque meter, generator, 40 N dead weight, 220 Ω resistor and data logger.
- Torque and rotation are recorded; generator output voltage is recorded and used for the power readout.
- The paper reports output-power time histories and qualitative differences in rise/response time.

Therefore the paper-level union includes both torque and fracture-load measurements, but **no single arm reports them as one synchronized joint response**. The existence of a torque meter in Arm B must not be retroactively assigned to the torsion/fracture measurements in Arm A.

The paper does not establish a shared specimen identity across the arms, common synchronized acquisition, shared calibration, or a cross-arm covariance model. Same-specimen identity is therefore UNKNOWN, not assumed false or true. Cross-arm fusion is not eligible.

This corrects a different overbroad statement: “no torque measured” is false at paper level, but accurate for the torsion/fracture arm specifically.

## 3. Formalized gate

New module:

`FORMAL_VERIFICATION/HsHVerification/AldusProtocolArmEvidenceGate.lean`

The ledger distinguishes:
- `instrumentReported`
- `proxyDerived`
- `controlledNominal`
- `derivedFromInstrument`
- `qualitativelyReported`
- `modelInferred`
- `manufacturerReported`
- `notReportedInArm`
- `notInProtocol`
- `unknown`

The Endo paper-level union is formally shown to contain instrument-reported torque and fracture-load records, while no single Endo arm contains both. The Kozyreff baseline tension and Table I tension proxy are separately typed. A cross-arm fusion witness requires verified same-specimen identity, same protocol, synchronization, shared calibration and covariance availability; unknown fields do not pass.

The bounded ledger also checks that none of its listed protocol arms or manufacturer-specification records covers the complete proposed WWRD measurement set. This is a theorem about this finite source ledger, not a claim that no other rope literature exists.

Exact-rational Lean targets encode the seven (T_{m proxy}) values, endpoint intervals and endpoint ratio. The module is imported by the existing Aldus WWRD PR #862 branch. No new branch or PR was created.

## 4. Prediction and falsification architecture

The rope analogy remains a **first-blush geometric heuristic**, not a physical equivalence.

The current literature supplies separate standard-physics comparators:
1. rope–ground contact and resonance in the weak-bending limit (Kozyreff & Seron);
2. imposed-twist effects on tensile fracture load (Endo et al.);
3. torque/rotation-to-generator-power transfer in a separate Endo protocol;
4. manufacturer nominal specifications already handled in Aldus PR #862.

None is a measured traveling helical kink in a climbing rope. None establishes a map to a SAT filament or timesheet.

A discriminating WWRD experiment would need one identified specimen/batch and a common synchronized protocol measuring, at minimum:
- axial preload/tension;
- imposed twist and torque;
- 3D centerline history and material frame;
- local kink curvature and orientation/handedness;
- contact state/pressure;
- force and torque time series;
- loading/unloading work and returned/dissipated energy;
- sensor calibration, covariance and uncertainty.

The standard comparator should be a suitable elastic/Cosserat-rod model with bending, torsion, frictional contact and history-dependent dissipation/damage, with parameters calibrated on no-kink/low-amplitude controls and frozen for held-out twist handedness, kink orientation and contact conditions.

The H(s)H side still lacks an explicit physical-to-SAT projection/composition map and a numerical cross-channel prediction. It cannot yet supply a defensible numeric falsification threshold. The threshold must be pre-registered from measured sensor/model uncertainty, not selected after the result. A failure criterion is already clear at the architectural level: if one H(s)H source state cannot predict the held-out centerline, force/torque and energy channels with shared parameters, or requires per-arm retuning, the proposed mapping fails this comparison.

## 5. Epistemic status

- Primary-paper facts: author-reported experiments and instrument descriptions.
- (T_{m proxy}): conditional model-derived estimates from published (x_0), not direct measurements.
- Lean: formal checks of the encoded ledger and exact arithmetic only.
- No independent experiment or raw-data reanalysis.
- No H(s)H physical prediction.
- No SAT-O or Blockwave equation changed.
- No BEDROCK promotion.
- No paper gate advanced.

## 6. Existing branch and next work

The O9 source-identity branch PR #982 remains untouched; it is a separate chronology/provenance task. This WWRD extension uses the existing subject-matched Aldus branch:

- PR #862: `research/aldus-wwrd-rope-source-gate-20261028t0724z`.
- Existing child PR #1094 remains untouched.
- The central task/branch graph is still marked `ACTIVE_SEED`, updated 2026-10-30; it is a routing seed, not live branch authority.
- No new tooling, dependency, plugin, fork, or automation was introduced. Existing Lean 4/Mathlib CI is reused. Math Hopper and Whirligig resources were inspected; neither supplies the missing physical map or synchronized rope dataset. SciSpace is available, but the two primary papers were directly accessible, so no extra service was needed.

Next: verify the exact-head Lean Actions run, then add a source-correction comment to the existing WWRD publication/PR rather than creating a duplicate issue. Preserve the separate arm classifications in any subsequent comparison.
