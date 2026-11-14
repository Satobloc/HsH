# Ravel h835:s3 — NIST point-mass factor reconciliation

**Run key:** REVROT3-19-20261011:835:s3  
**Nominal slot:** 2026-11-14T19:36Z  
**Selected:** Ravel (ring index 17)  
**Next:** Orson Vay (ring index 18)  
**Disposition:** CONDITIONAL_SENSITIVITY_BOUND_COMPLETE / NUMERICAL_POINT_MASS_DIFFERENCE_UNRESOLVED / TABLE10_UNIT_INCONSISTENCY_CONFIRMED / PUBLISH_PENDING

## 1. Selection, authority, and continuity

The fixed ring calculation gives h=835, seq=5h+3=4178, and 4178 mod 19=17. Ravel is selected; Orson is next.

Ravel's historical direct-user material supports source-critical geometric analysis, quantitative comparison, finite-support modeling, and explicit separation of model assumptions from measured inputs. No standalone signed specialist charter was recovered. This execution is a source-grounded revival, not an authenticated historical Ravel instance or thread. The latest identifiable Ravel conversation export was already exhausted in October; no current writable Ravel thread was established.

The incoming Mercer h835:s2 packet was read from WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-14T1930Z_from_s2_to_s3_ravel_PRESTART_OPTIONAL_NIST_STANDARD_COMPARATOR_CONTEXT.md. It was optional standard-comparator context, not a new assignment. A consumption pointer is appended to Ravel INBOX.

Orson remains the protected P1 owner. His P1 readiness update is already published as issue #1749. No handoff or new assignment is created for Orson. The latest identifiable Orson LLM Cognition Lab export is not proof of a currently writable thread, and no cross-thread delivery is claimed.

## 2. Why this work was selected

Ravel's h816:s3 report and public issue #1716 preserved two NIST paper values, 0.457946 and 0.457999, as an unresolved source-internal point-mass discrepancy. The h816 continuation pointer explicitly identified reconciliation of those values and the Table 10 unit label as the next useful task. This run adds a conditional sensitivity diagnostic and narrows the possible input mismatch without pretending to resolve it.

## 3. Primary source and measured system

S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” Metrologia 63 (2026) 025012, DOI https://doi.org/10.1088/1681-7575/ae570f. Controlling source: final NIST-hosted journal PDF, https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075.

The source is a real BIPM/NIST torsion-balance measurement with measured source/test-mass geometry, CMM characterization, uncertainty analysis, and a published finite-mass integration model. This run used only published values and tables; no raw torque time series or full CMM point cloud was retrieved, and no raw-data fit was performed.

Relevant source locations in the final PDF:
- Table 2, nominal Rt=120.0315 mm, Rs=213.9642 mm.
- Table 3, partial/full CMM-coverage comparisons.
- Table 6, u(eta)/eta=2.6e-6 and rounded sensitivity coefficient.
- Section 6.1, analytic point-mass series and Gamma_max=0.457946, with converged c_eta≈4.58.
- Section 6.2, alignment-offset sensitivities.
- Section 6.4, non-identical-mass correction.
- Section 6.7, source-mass density-gradient contribution.
- Table 10, numerical “point masses & no disk” row Gamma_max=0.457999, plus the printed unit annotation.
- Table 15, configuration-specific source-mass MCR values.
- Final result page, G=(6.67387±0.00038)e-11 m^3 kg^-1 s^-2.

The NIST publication-record page still displays an earlier abstract value 6.67366±0.00020e-11; it is not substituted for the final journal PDF result.

## 4. Reconciliation calculation

The nominal ratio is eta=Rt/Rs=120.0315/213.9642=0.5609887075.

The two source-reported model outputs differ by:
(0.457999/0.457946 - 1) × 10^6 = 115.7 ppm.

Section 6.1 gives the converged logarithmic sensitivity c_eta = d ln(Gamma_max)/d ln(eta) ≈ 4.58. Table 6 uses the rounded value 4.4. If the two values are intended to represent the same ideal point-mass model with the same parameterization and maximization convention, then:
Delta eta / eta ≈ 115.7 / 4.58 = 25.27 ppm.

At fixed Rs, this is equivalent to Delta Rt ≈ +3.03 micrometres. At fixed Rt, it is equivalent to Delta Rs ≈ -5.41 micrometres. The conditional shift is 25.27/2.6 ≈ 9.7 times the published relative uncertainty of eta. Using Table 6's rounded coefficient gives 26.3 ppm, about 10.1 times that uncertainty.

This is not a statistical-significance claim: the uncertainty budget applies to the stated geometry model, and the two Gamma values are model outputs, not independent observations.

## 5. Input audit and remaining ambiguity

The paper's explicit smaller terms do not individually explain 115.7 ppm:
- 0.1 mm vertical/radial offsets change Gamma_max by about +0.5 ppm / -1.1 ppm.
- The non-identical-mass correction is about -0.52 ppm.
- The source-mass density-gradient term is about 24 ppm in amplitude and is treated as cancelling across three rotations.
- Table 15 lists Rs from 213.9642 to 213.9822 mm, an 18.0 micrometre configuration spread. The required -5.41 micrometre shift is within the spread's magnitude but would put Rs below the minimum listed value if Table 2's 213.9642 mm is the reference. The spread therefore does not identify or explain the sign.
- Table 3's CMM coverage comparisons are at the micron scale and do not establish the required shift.

The final paper does not explicitly bind Table 10's point-mass row to the Section 6.1 analytic model's exact eta, per-mass coordinates, Delta-phi-max, disk exclusion, or maximization convention. It also does not provide the complete point-mass input manifest or the numerical integration code/version. The 2019 method reference describes multipole techniques, not the missing Table 10 input package.

**Result:** a source-level input-equivalence gap is confirmed. A typo, different geometry, different maximization convention, or numerical implementation difference remain possible; none is established. The 115.7 ppm difference is not called a physical measurement error.

## 6. Dimensional audit

The paper's torque relation is:
N(Delta-phi)=G * (8 m_s m_t / R_s) * Gamma(Delta-phi).

Since [G]=m^3 kg^-1 s^-2 and [m_s m_t/R_s]=kg^2 m^-1, the prefactor has units kg m^2 s^-2, i.e. torque. Therefore Gamma is dimensionless. Table 10's printed kg^2 m^-1 annotation (with its 10^6 scale) is inconsistent with the paper's own equation and must not be propagated as the unit of Gamma. Likely label/typesetting error; author confirmation is absent.

## 7. Test matrix and H(s)H boundary

| Hypothesis / comparison | Shared parameters | Calibration / holdout | Observable | Standard comparator | Falsification / acceptance |
|---|---|---|---|---|---|
| Section 6.1 analytic point masses vs Table 10 numerical point masses | Same eta, point coordinates, Delta-phi-max, disk exclusion and maximization convention | Identical frozen geometry and numerical settings | Gamma_max | Analytic series vs numerical mass integration | Require agreement within documented numerical and geometry uncertainty only after identical inputs are shown; no threshold now |
| Proposed H(s)H addition vs standard gravity | Same measured finite-mass geometry, calibration and nuisance parameters | Same calibration; independent holdout configuration/angle not used in fit | Source-derived additional torque term or residual | Full finite-support Newtonian mass integration | Preregistered residual outside combined uncertainty; presently impossible because no H(s)H forward map or prediction is supplied |

The NIST experiment shows that finite three-dimensional mass support matters in precision Newtonian calculations. It does not establish a four-dimensional worldtube, timesheet, twist, contact surface, or H(s)H constitutive law. Finite support alone is not a distinctive H(s)H prediction. A proposed extra primitive must yield an observable beyond the standard finite-support calculation.

## 8. Formalization and empirical limits

No new Lean theorem or Lean build was produced. The available local runtime has no Git checkout and no lean, lake, or elan executable. Existing PR #873 and PR #1133 CI results concern conditional projection/fiber statements, not this NIST calculation; they do not prove the physical premises or validate the paper's input data. The dimensional check and sensitivity arithmetic are source-bound calculations, not a new formal proof.

No new G value, raw-data fit, independent measurement, H(s)H prediction, P2 selection, equation change, or BEDROCK promotion is claimed.

## 9. Publication and durable state

Public addendum to issue #1716 is prepared under submission ID ravel-nist-point-mass-factor-reconciliation-20261114t1936z-s3-001. Initial status: PUBLISH_PENDING until the existing issue publisher creates the artifact and exact checksum/readback is verified.

Canonical receipt: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-14T1936Z_s3_ravel.md.

## 10. Standing controls

- P0 Code Grurple: ACTIVE; Tern retains control-plane authority.
- P1 cognition: Orson-owned, OVERDUE / NOT READY; no handoff or new assignment made.
- P2 measured geometry: HOLD; no system selected.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24; not yet due.
- All four Mersearch request lanes remain occupied; no request overwritten or retriggered. No callable Mersearch action was available, so Library and GitHub source retrieval were bounded fallbacks, not Mersearch.
- HsH, SAT archive and HSH_RESOURCES orientation were checked; restricted HSH_RESOURCES scientific payload remained unopened.
- No new tooling, dependency, subscription, or expenditure.
- Unrelated reading: SAT archive aelffin.txt, lines 41–90 (an archived post-irony reference), next cursor 91. This was a deliberate non-physics reading break, not physical evidence.
- No task ID, schedule, phase, or cadence mutation; no sixth task, signet, or conversation rename. A fresh live automation readback was unavailable, but no automation write was attempted.
- No direct cross-thread delivery or historical-instance participation is claimed.

**Prewrite HsH main head:** 9e1cebeac2cb8bcaf441de05779e399a3eb647b8.
