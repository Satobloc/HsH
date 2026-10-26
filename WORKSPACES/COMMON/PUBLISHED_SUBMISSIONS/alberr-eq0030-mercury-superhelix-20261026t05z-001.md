# EQ-0030 — recursive R4 superhelix / Mercury closure audit

**Worker handoff:** Alberr → Mira  
**Status:** `SRC/HISTORICAL-CANDIDATE`; corrected smoothness conditions; real-system closure test is mixed; finite-core lift and physical identification remain open. No BEDROCK or established-physics promotion.

## Historical source and terminology chain

The mathematical clearinghouse preserves ENTRY 022 verbatim:

```text
H(λ) = ( R(λ) cos(ω_s λ + φ_0),
         R(λ) sin(ω_s λ + φ_0),
         r_h cos(ω_h λ + ψ_0),
         r_h sin(ω_h λ + ψ_0) )
```

Source locator: `SAT_THEORY_ARCHIVE_2023-25/..MATHEMATICAL_REPOSITORY`, ENTRY 022 beginning line 694, blob `1b6876db3f871bfa25157ac024d66d8239082ff1`, clearinghouse commit `f96a7ec118874ec340ba08859b2fe4d3c4b0d2d0` (2026-06-08).

Underlying source: `% BIG PAPER (nolat).pdf`, archived commit `fdf30b2d636f023fd3c9282987ac19c514e9394e` at 2026-05-30T00:22:50Z. Extracted text lines 89–103, blob `29cfa060a6fb83faef5920a470ba650b89e780a1`; source-PDF SHA-256 `5f1bc1638ced8553ac16bd077d70ec2209f88771cbee021fa528a68ace9f84b1`.

The original prose states that this construction “prevents curvature spikes by ensuring convergence of higher-order derivatives.” That conclusion does not follow from the displayed formula alone.

Terminology/status was not declared superseded. `H(s)H 2026 STARTUP DOCS.txt` (blob `68200d849152dcb0c4fc1814f8b1789d499ebca8`, 1,758 lines / 75,885 chars) retains older recursive-superhelix equations as mathematical scaffolds during the worldline-to-worldtube transition. Current `HsH/synthesis/CURRENT_SYNTHESIS.md` (blob `29feb585044a718585f72e19994fb781e6d33a3e`) classifies the explicit generator as `GEN/HISTORICAL-CANDIDATE`, while recursive definition and finite-core lift remain `OPEN`.

## Definite mathematical correction

The formula is a curve in the product of two coordinate planes. If `R` is constant, its image lies on `S¹(R) × S¹(r_h) ⊂ R4`. If `ω_s/ω_h` is rational, the image is closed; for coprime winding counts `(p,q)` it represents class `(p,q)` on that product torus. If the ratio is irrational, the image is not periodic and is dense on the torus.

The source’s derivative claim needs explicit hypotheses:

- `ω_s λ` and `ω_h λ` must be dimensionless. If λ is arc length, each ω has units `L^-1`; if λ is time, each has units `T^-1`. The source calls λ arc length, so a time-domain physical comparison is a reparametrization, not an identity.
- Curvature requires at least a regular `C²` curve: `H'(λ) ≠ 0`.
- A fourth derivative requires `R ∈ C⁴`. Bounded fourth derivative on an interval requires bounded `R,R',...,R⁽⁴⁾` there.
- Smooth trigonometric factors do not repair a cusp, jump, or unbounded derivative already present in `R(λ)`.
- With constant radii,

  `||H^(n)||² = R² ω_s^(2n) + r_h² ω_h^(2n)`.

  Every fixed order is finite for finite parameters, but the sequence of derivative norms need not converge. “Finite at order four” and “convergent higher derivatives” are not equivalent.

For constant radii and a time parameter,

`v² = R²ω_s²+r_h²ω_h²`, `a² = R²ω_s⁴+r_h²ω_h⁴`, `v·a=0`, and `κ = sqrt(a²)/v²`.

These are exact properties of the ansatz, not evidence that it is a physical worldtube.

## Real-system test: Mercury’s measured 3:2 spin–orbit state

Comparator data are from primary analyses:

- Stark, Oberst & Hussmann (2015), *Mercury's resonant rotation from secular orbital elements*, DOI context and full text: https://arxiv.org/abs/1506.00008. DE432-derived mean orbital period `T = 87.96934962 ± 0.00000037 d`; perfect-resonance inertial spin rate `ω_res = 6.138506839 ± 0.000000028 deg/d`. The paper explicitly notes that this rate assumes perfect resonance and includes the pericenter-precession term.
- Stark et al. (2015), *First MESSENGER orbital observations of Mercury's librations*, DOI `10.1002/2015GL065152`: three years of MESSENGER altimetry and stereo imaging give `ω_obs = 6.13851804 ± 0.00000094 deg/d`, with long-period libration proposed as the reason for the finite-window offset.
- The orbital source also gives `a = 57.90909 ± 0.00011 million km` and `e = 0.2056317 ± 0.0000071` at J2000.

This is a topology test, not a fit. A constant-frequency `(2,3)` torus closure predicts repeatability after two orbital cycles relative to the chosen angular frame. The empirical rotation rate was not tuned to the archive formula.

The first calculation deliberately used the naïve target `1080°`. It failed an assertion because even the perfect-resonance inertial rate accumulates `1080.0009085295°`: perihelion precession makes the inertial-frame target differ from three exact turns. The correction is to compare the independently observed finite-window phase with the paper’s resonant inertial model, not with bare `1080°`.

Corrected result over `2T = 175.93869924 d`:

- resonant-model phase: `1080.00090852950410236°`;
- observed finite-window phase: `1080.0028792188742896°`;
- residual: `+0.00197068937018724° = 5.474137139409×10^-6 turn`;
- propagated standard uncertainty: `0.0001654557311988152°`;
- diagnostic residual/uncertainty: `11.910674570827`;
- equivalent accumulated surface-time lead: `27.73756800496 s`.

This does **not** reject Mercury’s 3:2 resonance; the measurement paper interprets the offset as long-period libration. It does reject an exact, constant-rate two-circle representation as a complete time-domain description over that measurement window. A viable use needs precession/libration in the phases and a nonuniform radial/orbital map.

The eccentricity test is also decisive for the constant-`R` specialization:

- perihelion: `46,001,145.377847 ± 420.337256 km`;
- aphelion: `69,817,034.622153 ± 432.013869 km`;
- radial excursion: `23,815,889.244306 km`.

The general source permits `R(λ)`, so this is not a rejection of the displayed four-component curve. It means that `R=constant` plus a phase linear in coordinate time cannot reproduce the actual orbit. If `R` is made Keplerian, the source’s smoothness and closure claims must be reproved for that specific parametrization.

## Executed Python

```python
from decimal import Decimal, getcontext
from math import sqrt, pi

getcontext().prec = 50
D = Decimal

T = D('87.96934962')
uT = D('0.00000037')
w_res = D('6.138506839')
uw_res = D('0.000000028')
w_obs = D('6.13851804')
uw_obs = D('0.00000094')

window = 2*T
naive = D(1080)
phase_res = w_res*window
phase_obs = w_obs*window
frame_offset = phase_res-naive
delta = phase_obs-phase_res
u_delta = sqrt(float((window*uw_obs)**2 +
                     (window*uw_res)**2 +
                     (D(2)*(w_obs-w_res)*uT)**2))

print('Mercury 3:2 finite-window closure audit')
print('2*T_orbit =', window, 'd')
print('naive target =', naive, 'deg')
print('resonant-model phase =', phase_res, 'deg')
print('precession/frame offset =', frame_offset, 'deg')
print('observed phase =', phase_obs, 'deg')
print('observed-model residual =', delta, 'deg')
print('u(residual) = %.15E deg' % u_delta)
print('diagnostic pull = %.12f' % (float(delta)/u_delta))
print('residual turns =', delta/D(360))
print('surface-time lead =', delta/w_obs*D(86400), 's')

a = D('57.90909e6')
ua = D('0.00011e6')
e = D('0.2056317')
ue = D('0.0000071')
peri = a*(1-e)
aphe = a*(1+e)
u_peri = sqrt(float(((1-e)*ua)**2 + (a*ue)**2))
u_aphe = sqrt(float(((1+e)*ua)**2 + (a*ue)**2))
print('perihelion =', peri, 'km; u = %.6f km' % u_peri)
print('aphelion =', aphe, 'km; u = %.6f km' % u_aphe)
print('radial excursion =', aphe-peri, 'km')

# Conditional constant-radius R4 comparison at real Mercury scales.
# rh=2440 km is the reference sphere used in the MESSENGER reduction,
# not a fitted superhelix parameter or a physical extra dimension.
w_orb = 2*pi/float(T)
w_spin = float(w_obs)*pi/180
R = float(a)
rh = 2440.0
v2 = R*R*w_orb**2 + rh*rh*w_spin**2
a2 = R*R*w_orb**4 + rh*rh*w_spin**4
j2 = R*R*w_orb**6 + rh*rh*w_spin**6
h4 = R*R*w_orb**8 + rh*rh*w_spin**8
kappa = sqrt(a2)/v2
print('speed norm = %.12E km/day' % sqrt(v2))
print('acceleration norm = %.12E km/day^2' % sqrt(a2))
print('jerk norm = %.12E km/day^3' % sqrt(j2))
print('fourth-derivative norm = %.12E km/day^4' % sqrt(h4))
print('Euclidean curvature = %.12E km^-1' % kappa)

assert frame_offset > 0
assert delta > 0
assert float(delta)/u_delta > 10
assert peri > 0 and aphe > peri and kappa > 0
print('ASSERTIONS = PASS')
```

Captured output:

```text
Mercury 3:2 finite-window closure audit
2*T_orbit = 175.93869924 d
naive target = 1080 deg
resonant-model phase = 1080.00090852950410236 deg
precession/frame offset = 0.00090852950410236 deg
observed phase = 1080.0028792188742896 deg
observed-model residual = 0.00197068937018724 deg
u(residual) = 1.654557311988152E-04 deg
diagnostic pull = 11.910674570827
residual turns = 0.000005474137139409
surface-time lead = 27.737568004960613588096582347096922435695896399125 s
perihelion = 46001145.377847 km; u = 420.337256 km
aphelion = 69817034.622153 km; u = 432.013869 km
radial excursion = 23815889.244306 km
speed norm = 4.136139982148E+06 km/day
acceleration norm = 2.954226005014E+05 km/day^2
jerk norm = 2.110047375960E+04 km/day^3
fourth-derivative norm = 1.507095243392E+03 km/day^4
Euclidean curvature = 1.726844611959E-08 km^-1
ASSERTIONS = PASS
```

The derivative values are a conditional geometric comparison only. They combine the real semimajor axis with the 2440-km reference sphere as the two coordinate-plane radii; no claim is made that the second plane is a physical extra dimension.

## Lean 4 / Mathlib source

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0030

structure ParamDim where
  exponent : Int
deriving DecidableEq, Repr

def mulDim (a b : ParamDim) : ParamDim :=
  ⟨a.exponent + b.exponent⟩

def parameterDim : ParamDim := ⟨1⟩
def angularFrequencyDim : ParamDim := ⟨-1⟩
def dimensionlessDim : ParamDim := ⟨0⟩

theorem phase_dimensionless :
    mulDim angularFrequencyDim parameterDim = dimensionlessDim := by
  rfl

theorem exact_three_two_closure
    (orbitPhase spinPhase : ℝ)
    (hOrbit : orbitPhase = 2 * Real.pi)
    (hSpin : spinPhase = (3 / 2 : ℝ) * orbitPhase) :
    2 * spinPhase = 6 * Real.pi := by
  rw [hSpin, hOrbit]
  ring

def orbitPeriod : ℚ := 8796934962 / 100000000
def resonantRate : ℚ := 6138506839 / 1000000000
def observedRate : ℚ := 613851804 / 100000000
def resonantUncertainty : ℚ := 28 / 1000000000
def observedUncertainty : ℚ := 94 / 100000000

theorem measured_rate_exceeds_resonant_model :
    resonantRate < observedRate := by
  norm_num [resonantRate, observedRate]

theorem one_sigma_intervals_are_separated :
    resonantRate + resonantUncertainty <
      observedRate - observedUncertainty := by
  norm_num [resonantRate, resonantUncertainty,
    observedRate, observedUncertainty]

theorem observed_two_orbit_phase_exceeds_resonant :
    2 * orbitPeriod * resonantRate <
      2 * orbitPeriod * observedRate := by
  norm_num [orbitPeriod, resonantRate, observedRate]

theorem inertial_resonant_phase_not_naive_1080 :
    2 * orbitPeriod * resonantRate ≠ 1080 := by
  norm_num [orbitPeriod, resonantRate]

theorem zero_orbit_radius_limit (r w : ℝ) :
    (0 : ℝ)^2 * w^2 + r^2 * w^2 = r^2 * w^2 := by
  ring

theorem derivative_norm_square_nonnegative
    (R r ws wh : ℝ) :
    0 ≤ R^2 * ws^8 + r^2 * wh^8 := by
  positivity

end HsHVerification.ArchiveEQ0030
```

Formal carrier: draft PR #388, branch `codex/eq0015-elias-20261024`, source commit `07962505bf5281337ae9d541df478c747632d2b6`, workflow run `40275760432`. The `verify` job completed **successfully**: dependency generation, Lean/Mathlib installation, full library compilation, and environment recording all passed. Status: `LEAN_VERIFIED` for the stated theorems only.

## Reading and search audit

- Full live `BEDROCK.md`: blob `4cabda482c48c217614b868a2138409275df9bf7`, 563 lines / 86,946 chars.
- Full subordinate `STATE_OF_THE_THEORY.md`: blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 155 lines / 11,012 chars.
- Full historical equation source extract: `% BIG PAPER (nolat).txt`, blob `29cfa060a6fb83faef5920a470ba650b89e780a1`, 217 lines / 9,317 chars.
- Full transition source: `H(s)H 2026 STARTUP DOCS.txt`, blob `68200d849152dcb0c4fc1814f8b1789d499ebca8`, 1,758 lines / 75,885 chars.
- Actual Python randomness: `secrets.randbelow(96) → 11` from the declared GitHub code-search population for `curvature torsion` across the SAT archive and HsH after excluding controls/publications/quarantines. Selected `Early Misc/THREAD2.txt`, blob `fcb243a3ea6e20b422ff850c678aa64fccd55b68`, 331 lines / 5,486 chars; path commit `75249fd5a0cc87a995875db4cbde74acca202f26` (2026-09-04). Honest takeaway: it is an early generated Æther/axion/Z3/TQFT patch list, rich in imported analogies but without a derivation of the current finite-core H(s)H object. Its raw `theta4`, Z3, and lattice suggestions remain historical and hard-guarded, not controlling inputs.

Mersearch guide blob `82ffe3ebd837de1d997af78b04d411481f75158e` was read. All four connector lanes were occupied by other requested searches, so none was overwritten. This run used bounded GitHub code search across SAT and HsH plus exact source reads; it is not claimed as a comprehensive three-repository Mersearch result. HSH_RESOURCES was not searched by the fallback.

## Disposition and exact discriminator

## Versioned CODATA gate

The current reference set is the **2022 CODATA recommended values** (released 2024-05-20 and based on data through 2022-12-31). This audit has opened the comparison gate but has **no evaluable CODATA residual**: EQ-0030 contains free geometric radii/frequencies and predicts no fundamental constant independently of its inputs. Therefore the unit, uncertainty, and fit ledger is: predicted CODATA observable `none`; SI unit `not applicable`; model uncertainty `undefined`; residual `undefined`; tuned parameters `none`. Substituting a CODATA value such as `c` or `e` into a free parameter would be a tuned insertion, not a prediction. The active verification program can proceed only after a preregistered map from `(R,r_h,ω_s,ω_h)` to a CODATA observable supplies an independent prediction and propagated uncertainty.

**PASS:** dimensional phase ledger; fixed-order derivative algebra; constant-radius sign/zero limits; rational 3:2 closure theorem; real-data arithmetic; uncertainty propagation; stated Lean theorems (`LEAN_VERIFIED`, run `40275760432`).

**CORRECTED:** replace the unsupported “ensuring convergence of higher-order derivatives” with the explicit regularity/boundedness conditions above. Replace the naïve `1080°` inertial target with the source-defined resonant inertial phase that includes perihelion precession.

**FAIL for the constant-rate specialization:** MESSENGER’s finite-window phase is separated from the perfect-resonance inertial model by `0.001970689°`, and Mercury’s eccentric orbit has a 23.816-million-km radial excursion.

**UNRESOLVED:** the map from this R4 curve to the current finite-core H(s)H worldtube, including normal bundle, cross-section, readout, metric signature, and dynamics. No CODATA constant is predicted here; this is a primary-data topology/kinematics test, not a constant recovery.

Reopening/promoting requires a preregistered `R(λ), θ_s(λ), θ_h(λ)` with parameter definition and frame, no target fitting, that predicts Mercury’s independently measured libration/precession residuals and also succeeds on a held-out resonant body. A mere exact 3:2 ratio or visually closed plot is insufficient.
