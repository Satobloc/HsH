# NIST four-cell contrast and measurement-identifiability gate

**Disposition: SOURCE-TABLE DIAGNOSTIC ONLY / CANDIDATE ONLY / NO P2 SYSTEM SELECTION / NO H(s)H PREDICTION.**

## Result

The final NIST/BIPM torsion-balance paper reports four aggregate determinations of G across a 2×2 design: copper/sapphire source-mass material × electrostatic-servo/free-deflection readout. The four values are correlated. A covariance-aware reparameterization gives these descriptive contrasts, in ppm of the unweighted four-cell mean:

| Contrast | Estimate | Table-18 covariance SE |
|---|---:|---:|
| Free minus servo, averaged over material | +103.244 ppm | 50.630 ppm |
| Sapphire minus copper, averaged over readout | −104.144 ppm | 52.477 ppm |
| Material-by-readout interaction | +92.905 ppm | 91.676 ppm |

The contrast estimates are mutually correlated (r = 0.662, 0.818, 0.742). Inputs are the published Table 16 central values and relative standard uncertainties, plus Table 18 correlations; the table entries are rounded. These SEs are not p-values or the paper's final posterior.

The NIST authors separately introduce configuration-specific dark uncertainty, with G_j = μ + λ_j + ε_j and Σ_ij = τ_i τ_j R_ij. That model is essential to the paper's consensus. The table-18-only contrasts must not be interpreted as independent evidence of a physical material or readout effect.

## Identifiability consequence

The four cells admit a four-coefficient factorial model: common mean, material effect, readout effect, and interaction. The coefficient-to-cell map is bijective. Therefore the four-parameter model is saturated at the four-aggregate-summary level: it can reproduce any four cell values exactly and leaves no residual degrees of freedom for testing an additional H(s)H-specific thickness, twist, contact-surface, or other effect.

This is now formalized in the existing draft PR #1387, module FORMAL_VERIFICATION/HsHVerification/FactorialContrastIdentifiability.lean. The module defines the map and inverse over Q, proves both inverse identities, and proves Function.Bijective cells. PR head b00cb22188b67f4857d59fcf9b01e754270ff028 was included in successful Lean 4.34.0 / Lake 5.0.0 merge-reference run #42314682998 (1054); full root build: 8,946 jobs. The three theorem-specific axiom reports list propext, Classical.choice, and Quot.sound. The full job log contains zero sorryAx and zero bare admit occurrences. Separate nanoda and whole-project axiom-audit stages were not run. This proves only the formalized algebraic statement, not the source-to-physical translation or any H(s)H premise.

## Source-to-observable gate

The standard measurement chain uses measured finite source/test-mass supports, the published mass-integration factor Γ, and two native readout operators. An H(s)H comparison still requires explicit maps:

W_HsH → (ρ_s, ρ_t) → N(Δφ) → y_free or y_servo.

The worldtube-to-mass-support map and H(s)H interaction operator remain undefined. Finite three-dimensional apparatus geometry and separate readout paths are source-forced; H(s)H thickness, twist, and contact surfaces are not. They become admissible only when an internal source defines them, an explicit projection/composition map carries them into the observable, and shared parameters predict an independent holdout.

## Open data gate

No raw torque/angle time-series bytes, CMM point-cloud files, full raw-observation covariance, acquisition-block metadata, or independent holdout were retrieved in this run. The NIST apparatus is not selected as the P2 measured system. No physical calculation, fit, held-out prediction, BEDROCK promotion, or paper-gate advancement is claimed.

A test must compare the standard baseline and any source-defined H(s)H model using the same geometry, calibration, and configuration-specific nuisance/covariance structure. A numerical falsification threshold must be declared before holdout access; none is assigned from the four aggregate values.

## Sources and traceability

- NIST final paper, *Metrologia* 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f: https://doi.org/10.1088/1681-7575/ae570f
- NIST publication page (whose abstract differs from the final PDF): https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist
- Full source-table analysis and reproducible standard-library Python calculation: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-06T2336Z_NIST_FOUR_CELL_FACTORIAL_CONTRAST_GATE.md
- Formalization and CI: https://github.com/Satobloc/HsH/pull/1387
- Existing covariance-scaling formalization: https://github.com/Satobloc/HsH/pull/1306
- P2 system-selection gate: https://github.com/Satobloc/HsH/issues/565

This is an assistant-authored source/architecture note, not Nathan Direct, not an independent measurement, and not a theory result.