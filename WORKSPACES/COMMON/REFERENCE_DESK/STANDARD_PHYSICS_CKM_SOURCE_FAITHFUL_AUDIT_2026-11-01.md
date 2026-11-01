# CKM Source-Faithful Comparison — Nathan Direct 2026-03-21

**Date:** 2026-11-01  
**Status:** real-data comparison; no fit; no physical validation.

## Recovered source

The direct user-role message in `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Paper Restructuring Plan — raw.json` (blob `4e49650f2a0b6960d5ce99d6484825b463637828`, serialized lines 2185–2202, UUID `54674374-f032-4c85-a3b0-35cf1584d13c`, timestamp 2026-03-21T18:40:11.069Z) explicitly states:

- `B=3/(4π)≈0.23873241 rad`;
- `θ12=B(1-B²)≈0.2251 rad`;
- `θ23=B²(1-S)≈0.0420`;
- `θ13=B³S≈0.00356`;
- `S≈0.2621` as an example value for Technetium-98.

The direct source labels θ12 in radians. Thus the source-faithful comparison to the standard CKM parameterization is **sin(θ12)** against PDG's **sin θ12**, not θ12 itself against sin θ12. θ23 and θ13 are also described as mixing angles; their standard-parameterization comparison likewise uses their sines. The reuse of the quoted approximate S in the CKM formula is the source's same-symbol reading, but no uncertainty for S is supplied.

## Data source

PDG 2026 Review of Particle Physics, CKM Quark-Mixing Matrix, Eq. (12.28), global-fit values:

- sin θ12 = 0.22517 ± 0.00068
- sin θ23 = 0.04189 (+0.00081 / −0.00069)
- sin θ13 = 0.003763 (+0.000088 / −0.000083)

Source: https://ccwww.kek.jp/pdg/2026/reviews/rpp2026-rev-ckm-matrix.pdf

These are PDG global-fit results under the standard CKM/SM framework, not independent raw measurements. Pulls below divide the residual by the relevant one-sided PDG uncertainty only. There is no combined χ² because model uncertainty and the relevant covariance matrix are not included.

## Executed calculation

The script in this directory was executed in Python using only the source B, source approximate S, and PDG 2026 values. No parameter fitting or tuning was performed.

| Observable | Source-derived prediction | PDG 2026 global fit | Residual | One-sided reference pull |
|---|---:|---:|---:|---:|
| sin θ12 | 0.223229475433 | 0.22517 ± 0.00068 | −0.001940524567 | −2.8537σ |
| sin θ23 | 0.042042861338 | 0.04189 (+0.00081/−0.00069) | +0.000152861338 | +0.1887σ |
| sin θ13 | 0.003566155468 | 0.003763 (+0.000088/−0.000083) | −0.000196844532 | −2.3716σ |

## Interpretation

- θ12 is **not** a source ambiguity: the direct message specifies radians. The correct CKM observable comparison is sin θ12, yielding −2.85 reference σ.
- θ23 is close to the PDG central value within the PDG reference uncertainty.
- θ13 differs by about −2.37 reference σ.
- These are not a combined significance and not a physical validation result. S is approximate and has no supplied uncertainty; B's geometric derivation is not independently established by this comparison; PDG global-fit correlations are not included.
- The source's mass-ratio formula also contains `(1+Δ_bridge)`, omitted in the raw-B calculation in issue #411. That worker calculation is only the Δ_bridge=0 special case.
- The direct source states `J_obs=J_eff B^5`, with `J_eff≈−3.3×10⁻²`, while also printing `J_obs≈+2.53×10⁻⁵`. Since B⁵ is positive, the displayed sign is internally inconsistent unless J_obs is intended as a magnitude or a sign convention/definition is missing. Keep it unresolved; do not merge it with #411's separate J_shadow formula.

## Reproducibility

- Script: [ckm_source_faithful_comparison_2026-11-01.py](ckm_source_faithful_comparison_2026-11-01.py)
- Machine result: [ckm_source_faithful_comparison_2026-11-01.json](ckm_source_faithful_comparison_2026-11-01.json)
- Execution: Python run completed in this turn; printed values preserved in JSON.
- This calculation uses a real external reference dataset. It is not a data-free fixture.
