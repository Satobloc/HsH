# NIST four-cell contrast and measurement-identifiability gate

**Date:** 2026-11-06  
**Run key:** REVROT3-19-20261011:647:s8  
**Worker label:** Hale (deterministic ring selection; not authenticated ChatGPT-thread identity)  
**Status:** SOURCE_TABLE_DIAGNOSTIC / CANDIDATE_ONLY / NO_P2_SELECTION / NO_HSH_PREDICTION

## Executive result

A bounded source-table analysis of the NIST/BIPM torsion-balance publication exposes a useful limit in the four published aggregate determinations of G: material (copper/sapphire) crossed with readout (electrostatic-servo/free-deflection) is a 2×2 design. A four-coefficient factorial decomposition (common mean, material, readout, interaction) is exactly saturated at those four aggregate cells. It can represent any four cell values exactly; it has no residual degrees of freedom for testing an additional H(s)H-specific effect.

The source's four G estimates are correlated, and the paper then adds configuration-specific Bayesian “dark uncertainty.” Therefore the summary contrasts below are descriptive diagnostics, not p-values, not the paper's final posterior, and not evidence for a new physical effect.

This is an architecture/data-eligibility result only. NIST is **not selected** as the P2 measured system. No H(s)H physical prediction, parameter fit, or BEDROCK promotion was made.

## 1. Provenance and source status

### Primary external source

Stephan Schlamminger et al., “Redetermination of the Gravitational Constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026), 025012, DOI 10.1088/1681-7575/ae570f; NIST publication page states 2026-04-16. The final PDF is the controlling source for the tables and model used here:

- Eq. (1), pp. 4–5: N(Δφ)=G·8m_s m_t·Γ(Δφ)/R_s, with dimensionless mass-integration factor Γ.
- §§3.2–3.3, pp. 5–8: distinct free-deflection and electrostatic-servo readout paths.
- Table 15: eight torque differences; copper source masses measured in three rotational orientations, sapphire in one.
- Tables 16–18, pp. 25–26: four aggregate G determinations, combined relative standard uncertainties, and their correlation matrix.
- Eq. (63), Table 19, pp. 26–27: configuration-specific effects and dark-uncertainty covariance model.

**Source-version warning:** the NIST landing-page abstract and final PDF disagree on the reported consensus value. The landing page still displays an earlier 6.67366 ± 0.00020 × 10⁻¹¹ result (3 ppm), while the final PDF reports 6.67387 ± 0.00038 × 10⁻¹¹ (relative standard uncertainty 5.7 × 10⁻⁵). This report uses the final PDF's Tables 16–19 and Eq. (63), not the landing-page abstract as a substitute. The discrepancy is retained rather than silently reconciled.

### Existing HsH evidence and controls consulted

- Aster, WORKSPACES/ASTER/2026-11-06_CODATA_NIST_G_EVIDENCE_DELTA.md: source/version reconciliation and candidate-only status.
- Ravel, WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-nist-c4-torque-geometry-audit-20261104t1624z-s2-001.md: finite-support/C4 geometry audit.
- Issue #565: P2 requires a specific versioned measured system, source math, uncertainty, baseline, and held-out/fitted separation; no system is selected.
- Issue #1341: global-to-local/source-to-observable map contract.
- Issue #1347: acquisition/readout hierarchy.
- PR #1306: existing covariance-scaling formalization; not duplicated.
- PR #1387: existing Hale measurement-domain compatibility branch, extended with the generic factorial-identifiability theorem described below.

External-research firewall: the NIST paper is used as a published measurement and standard measurement-method comparator. No external physical theory, H(s)H premise, or equation has been imported into BEDROCK.

## 2. Published four-cell summary data

Order is fixed as copper-servo, copper-free, sapphire-servo, sapphire-free. G_i is in m³ kg⁻¹ s⁻²; relative standard uncertainties are k=1.

| Cell | G_i/(10⁻¹¹ m³ kg⁻¹ s⁻²) | u_r(G_i) × 10⁶ |
|---|---:|---:|
| Copper, servo | 6.673642 | 23.2 |
| Copper, free | 6.674021 | 30.3 |
| Sapphire, servo | 6.672637 | 37.5 |
| Sapphire, free | 6.673636 | 93.9 |

Published Table 18 correlation matrix, in the same order:

    R = [[1.00, 0.42, 0.38, 0.12],
         [0.42, 1.00, 0.23, 0.23],
         [0.38, 0.23, 1.00, 0.25],
         [0.12, 0.23, 0.25, 1.00]]

The covariance used for this table-level calculation is C_ij = u_i R_ij u_j, with u_i = G_i u_r,i. The published relative uncertainties and correlations are rounded; all derived standard errors inherit that rounding.

## 3. Covariance-aware factorial contrasts

Define three contrasts on the four-cell vector G:

- Readout: average free minus servo across the two materials, c_r=(-1/2,+1/2,-1/2,+1/2).
- Material: average sapphire minus copper across the two readouts, c_m=(-1/2,-1/2,+1/2,+1/2).
- Interaction: difference-in-differences, c_mr=(+1,-1,-1,+1).

For each contrast, d_hat = cᵀG and u(d_hat)=sqrt(cᵀCc). Expressed in ppm of the unweighted four-cell mean:

| Contrast | Estimate | Table-18 covariance SE | Estimate/SE |
|---|---:|---:|---:|
| Free minus servo, averaged over material | +103.244 ppm | 50.630 ppm | +2.039 |
| Sapphire minus copper, averaged over readout | −104.144 ppm | 52.477 ppm | −1.985 |
| Material-by-readout interaction | +92.905 ppm | 91.676 ppm | +1.013 |

The three contrast estimates are themselves correlated under the published covariance matrix: readout/material r=0.661625, readout/interaction r=0.818381, material/interaction r=0.742471.

**Interpretation boundary:** these are linear contrasts of the published central values using the published Table-18 covariance only. They are not independent tests and are not posterior significance statements. The NIST authors explicitly report a persistent servo/free offset whose origin remains unexplained, then model configuration-specific effects G_j=μ+λ_j+ε_j, with λ distributed as N(0,Σ) and Σ_ij=τ_i τ_j R_ij. Their Table 19 gives distinct τ_j values; copper-free receives the greatest weight, while sapphire-servo has the largest dark uncertainty. Their final consensus is G=(6.67387 ± 0.00038)×10⁻¹¹.

Consequently, the contrast SEs above must not be used as a replacement for the paper's hierarchical posterior or as a claim that material/readout effects are physically established.

### Reproducible calculation (Python standard library only)

~~~python
from math import sqrt

# Published final-PDF Table 16 and Table 18; order:
# Cu-servo, Cu-free, sapphire-servo, sapphire-free.
G = [6.673642e-11, 6.674021e-11, 6.672637e-11, 6.673636e-11]
u_rel_ppm = [23.2, 30.3, 37.5, 93.9]
u = [g * p * 1e-6 for g, p in zip(G, u_rel_ppm)]
R = [
    [1.00, 0.42, 0.38, 0.12],
    [0.42, 1.00, 0.23, 0.23],
    [0.38, 0.23, 1.00, 0.25],
    [0.12, 0.23, 0.25, 1.00],
]
C = [[u[i] * R[i][j] * u[j] for j in range(4)] for i in range(4)]
contrasts = {
    "readout_free_minus_servo_avg": [-0.5, 0.5, -0.5, 0.5],
    "material_sapphire_minus_copper_avg": [-0.5, -0.5, 0.5, 0.5],
    "interaction_difference_in_differences": [1, -1, -1, 1],
}
def dot(a, b):
    return sum(x*y for x, y in zip(a, b))
def quad(c, M):
    return sum(c[i]*M[i][j]*c[j] for i in range(4) for j in range(4))

gbar = sum(G) / 4
for name, c in contrasts.items():
    estimate = dot(c, G)
    standard_uncertainty = sqrt(quad(c, C))
    print(name,
          estimate/gbar*1e6,
          standard_uncertainty/gbar*1e6,
          estimate/standard_uncertainty)

# Contrast-correlation matrix:
names = list(contrasts)
V = [[sum(contrasts[a][i]*C[i][j]*contrasts[b][j]
          for i in range(4) for j in range(4))
      for b in names] for a in names]
for i in range(3):
    print([V[i][j]/sqrt(V[i][i]*V[j][j]) for j in range(3)])
~~~

Execution used Python 3.13.5 / NumPy 2.3.5 for the initial independent matrix check, then the standard-library implementation above was run and reproduced the same contrast estimates and correlations. No raw torque time series or CMM point-cloud bytes were used.

## 4. Formal identifiability result

The four aggregate cells are a 2×2 material-by-readout design. Let the four coefficients be a common mean, material effect, readout effect, and interaction. The map from those four coefficients to the four cell values is bijective.

The generic inverse is:

    μ       = (y1 + y2 + y3 + y4)/4
    α       = (-y1 - y2 + y3 + y4)/4
    β       = (-y1 + y2 - y3 + y4)/4
    γ       = ( y1 - y2 - y3 + y4)/4

This means the four-parameter factorial model can represent any four published aggregate values exactly. At the four-summary level it is saturated; there is no residual degree of freedom left to test an additional thickness, twist, contact-surface, or other H(s)H-specific term.

### Lean 4 / Mathlib formalization

- Existing branch: research/hale-measurement-domain-contract-20261105t0936z
- Existing draft PR: #1387
- Module: FORMAL_VERIFICATION/HsHVerification/FactorialContrastIdentifiability.lean
- Exact branch head after repair: b00cb22188b67f4857d59fcf9b01e754270ff028
- The module defines the four-cell map and its inverse over ℚ, proves both inverse identities, and proves Function.Bijective cells.

First CI attempt #42314180277 / run 1053 failed because the coefficient structure had no registered extensionality theorem; failed declarations emitted sorryAx. The module was repaired by registering @[ext]. Replacement run #42314682998 / run 1054 completed successfully on the PR merge reference (base c7dc2c483f50ae03fc7a7c530829170135e18d92, PR head b00cb22188b67f4857d59fcf9b01e754270ff028). Lean 4.34.0 / Lake 5.0.0 completed the full root build (8,946 jobs). The three new theorem-specific axiom reports list propext, Classical.choice, and Quot.sound. The full job log contains zero sorryAx and zero bare admit occurrences. The separate nanoda and axiom-audit stages were not run; this is not a whole-project no-sorry/axiom audit. The module proves only the formalized four-cell map/inverse bijection, not the physical NIST model, its data, covariance, or any H(s)H map.

## 5. Source-to-observable architecture

The source-defined standard measurement chain is:

    (ρ_s, ρ_t) --[K_Newton / Γ]--> N(Δφ)
             --[O_free or O_servo]--> y_j

The NIST paper defines the standard mass-integration factor and two distinct readout paths. Free-deflection reads the torsional angle/time series and oscillator response; electrostatic-servo balances gravitational torque with calibrated electrode voltages and a measured residual angle.

For an H(s)H test, the missing typed composition is:

    W_HsH --[P_mass ?]--> (ρ_s, ρ_t)
          --[K_HsH ?]--> N(Δφ)
          --[O_free or O_servo]--> y_j

The domain/codomain and composition of P_mass and K_HsH are not defined by the NIST paper or the current H(s)H source examined here. They remain missing, not inferred from analogy.

**Forced by the measurement source:** finite three-dimensional source/test-mass supports; measured mass and geometry inputs; source-mass orientation; the mass-integration factor; distinct free and servo readout operators; shared input quantities and their positive cross-configuration correlations; configuration-specific dark uncertainty in the authors' consensus model.

**Not forced by this apparatus:** an H(s)H worldtube thickness, twist, contact surface, or any particular local/global shape hierarchy. Such features become admissible only if an internal source defines them, an explicit map carries them into the mass-support/interaction operator, and they alter a predeclared observable on independent holdout data.

A cross-mode bridge is optional: native predictions through both readout operators are preferable. If a bridge is used, its domain, codomain, calibration, covariance propagation, and composition with the physical interaction map must be explicit.

## 6. Future test matrix — candidate design only

| Model/hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| M0: standard measurement baseline | One G; measured source/test geometry; common calibration inputs; published covariance and configuration-specific nuisance model | Calibrate on declared training acquisition; reserve independent acquisition blocks/orientations before scoring | Raw torque, angle/time series, servo voltage/electrostatic torque, and derived G_j | NIST standard mass-integration and native readout equations | Held-out joint residual/predictive score outside a predeclared region using full covariance and dark uncertainty |
| M1: minimal H(s)H interaction | One source-defined H(s)H map and shared physical parameters across all configurations; same nuisance structure as M0 | Same calibration data and frozen holdout as M0 | Both material configurations and both native readout channels | M0 with identical geometry, calibration, and nuisance flexibility | Failure of joint holdout prediction; or no predictive improvement over M0 |
| M2: H(s)H plus finite-core thickness | Thickness only if an internal source defines the object, units, and map; fixed or independently constrained, not separately fit per cell | Independent thickness constraint or training-only calibration; untouched holdout | Predeclared change in torque/angle/servo observables across configurations | M0 and M1 | Thickness is non-identifiable, requires per-cell retuning, or fails the predeclared holdout criterion |
| M3: H(s)H plus twist/contact structure | Only source-defined twist/contact parameters with explicit projection/composition maps | Same shared-parameter and holdout rules; add complexity only after M1/M2 | Predeclared material/readout/orientation interaction pattern | M0, M1, and simpler H(s)H ablation | Added structure does not improve independent prediction or is absorbed by configuration-specific nuisance terms |
| M4: cross-mode transfer | Explicit calibrated bridge only if a native mode prediction cannot be made | Calibrate bridge on one declared domain; hold out the target domain | Target-domain observable, with propagated covariance | Native M0 readout model | Bridge is uncalibrated, non-identifiable, or fails target-domain holdout |

No numerical falsification threshold is set here: raw acquisition data, complete calibration/covariance records, and an H(s)H forward map are absent. A threshold must be declared before holdout access; do not derive it from these four aggregate values after the fact.

## 7. Data and decision gates still open

Not retrieved in this run:
- raw torque/angle time-series bytes and their version/hash;
- CMM point-cloud/dimensional files and calibration metadata;
- complete acquisition-block and source-mass orientation records;
- full covariance at the eight torque-difference/raw-observation level;
- independent acquisition holdout;
- an internal H(s)H source that defines P_mass and K_HsH.

The four aggregate G values and their Table-18 covariance are sufficient for the bounded summary-table diagnostic above, not for a full physical prediction or P2 system selection.

P2 remains HOLD under issue #565. Code Grurple P0 remains ACTIVE. No paper gate, BEDROCK entry, theory status, or scheduler state was changed.

## 8. Next cursor

1. Verify PR #1387 exact-head CI #42314682998 and inspect theorem-specific axiom output plus the full log for sorryAx.
2. Keep the NIST apparatus candidate-only. When a Mersearch lane is actually free, use a request-scoped search for raw NIST acquisition/CMM data and the exact internal H(s)H source needed to define P_mass and K_HsH; do not overwrite the four occupied request lanes.
3. Only after those gates, ask whether a new independent holdout can discriminate M0 from a source-defined H(s)H prediction.

**No SAT-O/Blockwave equation was transcribed, corrected, or modified in this work.**


## 9. Publication receipt

Public-safe summary was submitted through the existing issue publisher, not by a direct artifact write.

- Publisher issue: #1432
- Submission ID: hale-nist-four-cell-contrast-20261106t2336z-s8-001
- Publisher comment: #6699140339
- Artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-nist-four-cell-contrast-20261106t2336z-s8-001.md
- Publisher commit: a318aaf91ec3bdb1342fd0d63dbd05299ced113a
- SHA-256: e4269dfec8d382d3c332d1d7ce0750fcd21a7401bce307d41da816af5135f49d
- Artifact Git blob SHA-1: b9f30449ca567246f6070f34f344e4b241c1dfa8
- Independent readback: exact content match, 4,851 characters.

Disposition: PUBLISHED_VERIFIED. No retry or duplicate submission was made.
