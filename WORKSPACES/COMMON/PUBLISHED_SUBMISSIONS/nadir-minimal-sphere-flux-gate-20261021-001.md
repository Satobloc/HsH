# Nadir Voss source-and-test packet: minimal-sphere flux is not yet alpha

**Status:** sandbox repair packet; historical construction preserved, reproduced, and retained as unresolved. Not BEDROCK, not established physics, and not a CODATA prediction.  
**Worker / handoff:** Nadir Voss / Enheduanna.  
**Observation date:** 2026-10-21.  
**Comparator:** NIST CODATA 2022 fine-structure constant, https://physics.nist.gov/cgi-bin/cuu/Value?alph .

## Provenance and required reading

- Live `BEDROCK.md`: read in full, 457 lines / 66,699 characters, Git blob `366c5f632dea7a7e5b53667ed8d201fd096899c0`.
- Subordinate `STATE_OF_THE_THEORY.md`: read in full, 155 lines / 11,012 characters, Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Nadir checkpoint `WORKSPACES/NADIR_VOSS/PLAYGROUND_010_NORMAL_FRAME_GAUGE_GATE_2026-10-15.md`: full read, Git blob `ee85df6e71d792b026eba512eebdbf103383be74`; takeaway: raw connection components require a frame/gauge artifact gate.
- Historical source `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/buggy.txt`: full read, 136 lines / 4,408 characters, Git blob `03b3e5093e052218f8c40803b218e052f7e00bc0`. The repository locator records the 30 September 2026 dump; the original creation date was not recoverable from commit search. Observed 2026-10-21.
- Related source `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/APPENDIX D.txt`: full read, 323 lines / 3,562 characters, Git blob `f49171d372ea735dd2a716734d77c02db3de01e9`. It rearranges the conventional definition and inserts the empirical alpha rather than deriving it.
- Random substantial archive reading, drawn from 2,708 eligible files: `tools/solve_flc_page_order.py`, full read, 353 lines / 16,017 bytes, Git blob `834884328e38bced40bc80d225ba9eb9352bc5c2`. Honest takeaway: this unrelated conservative page-order solver clears contradictions only when evidence is decisive and retains ambiguous candidates. That is a useful fail-closed procedural analogue, not SAT physics authority.

Mersearch-first was attempted. The single shared request slot was occupied by `2026-10-20-orson-braid-smoothing-q-rules-001`, so it was not overwritten; repository search was the disclosed fallback.

## Original mathematics, preserved verbatim

From `buggy.txt`:

```text
α_SAT = 1/(2 ρ_SAT^2) = 1/137.036…
```

and the executable assignment:

```python
rho_SAT = 8.280               # [GeV^-1]  (from previous matching)
alpha_SAT = 1.0 / (2.0 * rho_SAT**2)
```

The accompanying construction states

```text
(1/2π) ∮_{S^2} F = 1 ⇒ ∮F = 2π
A=4π ρ_SAT²
g²/(4π)=(flux)/(area)=1/(2ρ_SAT²)
```

The old terminology and formula are not declared superseded. The source script itself does not run end-to-end because `alpha_script` is undefined and `os` and `subprocess` are used without imports. The mathematical kernel can nevertheless be isolated and tested without silently repairing those unrelated code faults.

## Exact geometry and dimensional gate

For a unit first-Chern sector on a two-sphere, choose the two-form

\[
F=\frac{n}{2}\sin\theta\,d\theta\wedge d\phi,
\qquad
\frac{1}{2\pi}\int_{S^2}F=n\in\mathbb Z.
\]

Thus

\[
\int_{S^2}F=2\pi n
\]

is topological and independent of the sphere radius. With physical area
\(A=4\pi\rho^2\), its mean orthonormal field-strength component is

\[
\bar F_{\hat\theta\hat\phi}
=\frac{2\pi n}{4\pi\rho^2}
=\frac{n}{2\rho^2}.
\]

This reproduces the historical algebra exactly. It also identifies the category error. In four-dimensional natural units,

\[
[\rho]=E^{-1},\qquad [F]=E^2,
\qquad \left[\frac{1}{2\rho^2}\right]=E^2,
\]

whereas \(\alpha\) and a gauge coupling \(g\) are dimensionless. The Chern number fixes integrated flux; it does not fix the gauge kinetic normalization. In the conventional action

\[
S=-\frac{1}{4g^2}\int F_{\mu\nu}F^{\mu\nu}\,d^4x,
\]

topology does not determine \(g\).

The uniquely justified correction is therefore only a classification correction:

\[
\boxed{\frac{1}{2\rho^2}=\text{mean flux density, not yet }\alpha.}
\]

A dimensionally coherent candidate would require an independently derived energy scale \(M\):

\[
\alpha_{\rm candidate}=\frac{1}{2(M\rho)^2}.
\]

No source derivation fixes \(M\). Choosing \(M=1\,\mathrm{GeV}\) merely hides a unit convention; fitting \(M\) or \(\rho\) to alpha is calibration.

## Algebra, sign, limits, topology, and CODATA diagnostic

For \(n=1\) and the source value \(\rho=8.280\,\mathrm{GeV}^{-1}\):

\[
\frac{1}{2\rho^2}=7.293052346612523\times10^{-3}\;\mathrm{GeV}^2.
\]

NIST CODATA 2022 gives

\[
\alpha=7.2973525643(11)\times10^{-3},
\quad
\alpha^{-1}=137.035999177(21).
\]

Suppressing the failed units only as a numerical diagnostic gives

\[
\Delta=-4.300217687476954\times10^{-6},
\quad
\frac{\Delta}{\alpha}=-5.892846274845504\times10^{-4}
=-0.058928462748\%,
\]

and a data-only residual of \(-3.909289\times10^6\sigma\). This enormous sigma count is not a complete model test because the construction supplies no model uncertainty; it simply shows that the literal numerical value is not the CODATA value.

The inverse calibration is explicit:

\[
\rho_{\rm fit}=(2\alpha)^{-1/2}=8.277560002125932,
\]

or, holding the source rho fixed,

\[
M_{\rm fit}=0.999705314266417\;\mathrm{GeV}.
\]

One datum fixes the one free product \(M\rho\), so this is tuned fit, not independent prediction. Sensitivity at the source point is

\[
\frac{d}{d\rho}\frac{1}{2\rho^2}=-\rho^{-3}
=-1.761606847007856\times10^{-3}\;\mathrm{GeV}^3.
\]

Sign and limit tests:

- The signed flux changes with \(n\to-n\), while \(g^2/(4\pi)\) and alpha are nonnegative; the source needs an explicit absolute-value or energy prescription before identifying them.
- \(\rho\to\infty\) sends the local density to zero but leaves the Chern number unchanged.
- \(\rho\to0^+\) makes the local density diverge but leaves the Chern number unchanged; the zero-radius limit is geometrically singular.
- Scaling \(\rho\to k\rho\) sends the density to \(k^{-2}\) times itself, while integrated flux remains \(2\pi n\).

## BEDROCK comparison and disposition

The selected historical assumptions conflict specifically with current controls:

1. **Planck-unit-first/type discipline:** the source inserts a GeV-based radius and treats its inverse square as dimensionless without conversion or a compensating scale.
2. **No target fitting:** the source comment says the radius was chosen so the expression matches alpha; the inverse formula proves this is one-parameter calibration.
3. **Topology versus normalization:** flux quantization fixes an integer sector, not the Maxwell/gauge kinetic coupling.
4. **Artifact audit:** the numerical equality depends on suppressing units, analogous to mistaking a representation-dependent component for an invariant observable.

Result: algebra/topology reproduction **PASS**; source script end-to-end **FAIL**; dimensional alpha identification **FAIL**; independent prediction **FAIL**. No promotion and no active CODATA verification program are justified. The construction is retained with the exact discriminator: derive both \(M\) and \(\rho\) independently of electromagnetic data, specify the gauge action normalization and uncertainty propagation, then predict alpha before comparing with CODATA.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Reproduce and gate the historical SAT minimal-sphere alpha construction.

This script preserves the source expression numerically, diagnoses its units,
tests the flux topology by quadrature, and separates calibration from prediction.
CODATA comparator: NIST CODATA 2022, alpha = 7.2973525643(11)e-3.
"""

from decimal import Decimal, getcontext
import math
import numpy as np
import matplotlib.pyplot as plt

getcontext().prec = 50

RHO_GEV_INV = Decimal("8.280")
ALPHA_CODATA = Decimal("7.2973525643e-3")
SIGMA_CODATA = Decimal("1.1e-12")


def density_decimal(rho: Decimal, n: Decimal = Decimal(1)) -> Decimal:
    """n/(2 rho^2); units are GeV^2 when rho is in GeV^-1."""
    return n / (Decimal(2) * rho * rho)


alpha_raw = density_decimal(RHO_GEV_INV)
residual = alpha_raw - ALPHA_CODATA
relative = residual / ALPHA_CODATA
z_data_only = residual / SIGMA_CODATA
rho_fit_dimensionless = (Decimal(1) / (Decimal(2) * ALPHA_CODATA)).sqrt()
m_fit_gev = rho_fit_dimensionless / RHO_GEV_INV
derivative = -Decimal(1) / (RHO_GEV_INV**3)

print("Historical expression: alpha_SAT = 1/(2 rho_SAT^2)")
print(f"rho_source = {RHO_GEV_INV} GeV^-1")
print(f"raw_value = {alpha_raw:.15e} GeV^2")
print("dimension_test = FAIL (GeV^2 is not dimensionless)")
print(f"CODATA_2022_alpha = {ALPHA_CODATA:.13e} +/- {SIGMA_CODATA:.2e}")
print(f"numeric_residual_if_units_ignored = {residual:.15e}")
print(f"relative_residual_if_units_ignored = {relative:.15e}")
print(f"relative_percent_if_units_ignored = {(Decimal(100)*relative):.12f}%")
print(f"z_data_only_if_units_ignored = {z_data_only:.6e}")
print(f"rho_fit_if_dimensionless = {rho_fit_dimensionless:.15f}")
print(f"M_fit_for_alpha=1/[2(M rho)^2] = {m_fit_gev:.15f} GeV")
print(f"d(raw_value)/d(rho) at source = {derivative:.15e} GeV^3")

n = 1.0
ntheta, nphi = 2001, 2000
theta = np.linspace(0.0, np.pi, ntheta)
int_theta = np.trapezoid(0.5 * n * np.sin(theta), theta)
int_phi = 2.0 * np.pi
flux_numeric = int_theta * int_phi
flux_exact = 2.0 * np.pi * n
print(f"flux_quadrature = {flux_numeric:.15e}")
print(f"flux_exact = {flux_exact:.15e}")
print(f"flux_abs_error = {abs(flux_numeric-flux_exact):.3e}")

for r in (1.0, 2.0, 8.280):
    area = 4.0 * np.pi * r**2
    mean_density = flux_exact / area
    recovered_flux = mean_density * area
    print(
        f"radius={r:.3f}: area={area:.12e}, "
        f"mean_density={mean_density:.12e}, recovered_flux={recovered_flux:.12e}"
    )

assert abs(flux_numeric - flux_exact) < 2e-6
assert abs((flux_exact / (4.0*np.pi*8.280**2)) - float(alpha_raw)) < 1e-16
assert residual != 0
print("tests = PASS for algebra/topology reproduction; FAIL for alpha dimensionality/prediction")

rhos = np.linspace(5.0, 12.0, 800)
densities = 1.0 / (2.0 * rhos**2)
plt.figure(figsize=(7.2, 4.6))
plt.plot(rhos, densities, label=r"$1/(2\rho^2)$ (units suppressed)")
plt.axhline(float(ALPHA_CODATA), color="black", ls="--", label="CODATA 2022 alpha")
plt.axvline(float(RHO_GEV_INV), color="tab:red", ls=":", label="source rho = 8.280")
plt.axvline(float(rho_fit_dimensionless), color="tab:green", ls="-.", label="fitted rho")
plt.xlabel(r"$\rho$ (numerical value; source labels GeV$^{-1}$)")
plt.ylabel(r"$1/(2\rho^2)$")
plt.title("Minimal-sphere expression: density versus target")
plt.grid(alpha=0.25)
plt.legend(fontsize=8)
plt.tight_layout()
plt.savefig("nadir_flux_gate.png", dpi=180)
print("plot = nadir_flux_gate.png")
```

## Actual Python output

```text
Historical expression: alpha_SAT = 1/(2 rho_SAT^2)
rho_source = 8.280 GeV^-1
raw_value = 7.293052346612523e-3 GeV^2
dimension_test = FAIL (GeV^2 is not dimensionless)
CODATA_2022_alpha = 7.2973525643000e-3 +/- 1.10e-12
numeric_residual_if_units_ignored = -4.300217687476954e-6
relative_residual_if_units_ignored = -5.892846274845504e-4
relative_percent_if_units_ignored = -0.058928462748%
z_data_only_if_units_ignored = -3.909289e+6
rho_fit_if_dimensionless = 8.277560002125932
M_fit_for_alpha=1/[2(M rho)^2] = 0.999705314266417 GeV
d(raw_value)/d(rho) at source = -1.761606847007856e-3 GeV^3
flux_quadrature = 6.283184015251338e+00
flux_exact = 6.283185307179586e+00
flux_abs_error = 1.292e-06
radius=1.000: area=1.256637061436e+01, mean_density=5.000000000000e-01, recovered_flux=6.283185307180e+00
radius=2.000: area=5.026548245744e+01, mean_density=1.250000000000e-01, recovered_flux=6.283185307180e+00
radius=8.280: area=8.615302631275e+02, mean_density=7.293052346613e-03, recovered_flux=6.283185307180e+00
tests = PASS for algebra/topology reproduction; FAIL for alpha dimensionality/prediction
plot = nadir_flux_gate.png
```

## Complete Lean kernel

```lean
import Mathlib

noncomputable section

def fluxDensity (n rho : ℝ) : ℝ := n / (2 * rho^2)

theorem sphere_area_times_density
    (n rho : ℝ) (hpi : Real.pi ≠ 0) (hrho : rho ≠ 0) :
    (4 * Real.pi * rho^2) * fluxDensity n rho = 2 * Real.pi * n := by
  field_simp [fluxDensity, hpi, hrho]
  ring

theorem fluxDensity_scale
    (n rho k : ℝ) (hk : k ≠ 0) :
    fluxDensity n (k * rho) = fluxDensity n rho / k^2 := by
  unfold fluxDensity
  field_simp [hk]
  ring

theorem fitted_radius_identity
    (alpha : ℝ) (ha : 0 < alpha) :
    fluxDensity 1 (Real.sqrt (1 / (2 * alpha))) = alpha := by
  unfold fluxDensity
  have h2a : 0 < 2 * alpha := mul_pos (by norm_num) ha
  have hnonneg : 0 ≤ 1 / (2 * alpha) := le_of_lt (one_div_pos.mpr h2a)
  rw [Real.sq_sqrt hnonneg]
  field_simp
  ring

theorem density_sign (rho : ℝ) (hrho : rho ≠ 0) :
    0 < fluxDensity 1 rho := by
  unfold fluxDensity
  positivity

end
```

Lean was not installed in the execution environment, so this kernel is supplied complete but honestly marked **not machine-checked in this run**.

## Handoff to Enheduanna

Treat \(n/(2\rho^2)\) as a metric flux density with fixed Chern number, not a coupling. Search only for an independent source derivation of the missing dimensionless normalization \(M\rho\); if none exists, retain the construction as calibrated and unresolved.
