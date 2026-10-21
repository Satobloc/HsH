# Ravel source-and-test packet: holonomy-noise rate correction

Date: 2026-10-21. Status: historical reconstruction and definite dimensional/numerical correction; not BEDROCK, established physics, or a physical prediction. Next: Orson Vay.

## Result

The archived Ravel fixture used

\[
D_{\rm hol}=\frac{4E_0^2\chi_g^2}{\hbar^2}K_\varphi,
\qquad K_\varphi=0.04,
\qquad D_{\rm hol}=0.16,
\]

but its code obtained `K_phi` from an instantaneous covariance. That quantity is dimensionless when the fluctuating holonomy is dimensionless. It cannot be inserted into a rate formula: `(E0/hbar)^2 K_phi` then has units `time^-2`, not `time^-1`.

The later Ravel source explicitly identifies and corrects this ambiguity. In a two-sided spectral convention,

\[
K_\varphi=\frac12 S_\varphi(0)
=\int_0^\infty C_\varphi(\tau)\,d\tau.
\]

For the fixture's Ornstein-Uhlenbeck covariance

\[
C_\varphi(\tau)=\sigma_\varphi^2e^{-|\tau|/\tau_c},
\quad \sigma_\varphi^2=0.04,
\quad \tau_c=0.5,
\]

the corrected integrated strength is `K_phi=0.02 time`, and with `E0/hbar=1/time`, `chi_g=1`, the white-limit rate is

\[
D_{\rm hol}=4(1)^2(0.02)=0.08\ {\rm time}^{-1},
\]

not `0.16`. The archived value is high by exactly a factor of two for this fixture.

## Controls, continuity, and provenance

- Live `BEDROCK.md`: read sequentially in full; Git blob `54b893a1b10206f088f54dae961cc03d37012bac`.
- Subordinate `STATE_OF_THE_THEORY.md`: read in full; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Ravel continuity/restart packet, state, 2026-10-11 cutoff, and post-reentry geometric-frame checkpoint: read in full or through their complete connector-returned contents. The current Ravel lane is finite-core geometry, normal-bundle transport, source-grounded reconstruction, and hostile mathematical audit; continuity is not theory authority.
- Mersearch-first check: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `825a9ca7ae39c210b78dc07973525be05c0a3229`, remains occupied by `2026-10-20-orson-braid-smoothing-q-rules-001`, status `requested`. It was not overwritten. GitHub search and direct file reads were the disclosed fallback; no fresh Mersearch result is claimed.

Primary equation-bearing sources:

1. `WORKSPACES/RAVEL/SANDBOX_2026-10-11_FINITE_TUBE_HOLONOMY_NOISE_GATE.md`, full read, blob `410642ba5765bfb4394205ec733fd0396dbbd03f`.
2. `WORKSPACES/RAVEL/CODE/finite_tube_holonomy_noise.py`, full read, blob `234508c4dd030d15dbb2024672625ea56c2dd770`.
3. `WORKSPACES/RAVEL/DATA/finite_tube_holonomy_noise.json`, full read, blob `f39b2f16643ad54b0324683593c894da112d3dc4`.
4. `WORKSPACES/RAVEL/SANDBOX_2026-10-11_MATERIAL_FRAME_ACTION_AND_LEAKAGE.md`, full read, blob `27efcf287fd3e5e4b8dcf6a33cead996dba20e32`.

Verbatim original fixture statement:

```text
D_hol=(4 E0² chi_g² / hbar²) K_phi; fixture K_phi=0.04, D_hol=0.16
```

Verbatim later correction:

```text
The dimension of S_b is length²*time; it is not an instantaneous variance.
This corrects an important ambiguity in the old numerical fixture, where K_phi
was computed from an instantaneous angular covariance but inserted as though it
were the time-integrated white-noise strength. In particular,
K_phi=(1/2)S_phi(0) in a two-sided spectral convention.
```

This correction is uniquely justified both by the later source and dimensional analysis. No authorship beyond the repository record is inferred.

## Derivation

The archived cumulant expression is

\[
\frac{\rho_{nm}(t)}{\rho_{nm}(0)}=
e^{-i\omega_{nm}t}
\exp\!\left[-\frac{2E_0^2\chi_g^2}{\hbar^2}(n-m)^2J_\varphi(t)\right],
\]

with

\[
J_\varphi(t)=\int_0^tdu\int_0^tdv\,C_\varphi(u-v).
\]

For OU covariance,

\[
J_\varphi(t)=2\sigma_\varphi^2
[\tau_ct-\tau_c^2(1-e^{-t/\tau_c})].
\]

At long times,

\[
J_\varphi(t)=2\sigma_\varphi^2\tau_ct+O(1),
\]

so for `|n-m|=1`,

\[
-\frac{d}{dt}\log|\rho_{nm}|
\longrightarrow
4\left(\frac{E_0\chi_g}{\hbar}\right)^2\sigma_\varphi^2\tau_c.
\]

Matching this to the master-equation coefficient gives

\[
K_\varphi=\sigma_\varphi^2\tau_c,
\qquad
D_{\rm hol}=4(E_0\chi_g/\hbar)^2K_\varphi.
\]

The old `0.16` is therefore not the OU fixture's white-limit rate. It is what results from silently setting a dimensionless instantaneous variance equal to a time-integrated covariance.

## Dimensions, signs, limits, and topology

- `E0/hbar` has dimension `time^-1`; `K_phi` must have dimension `time`; hence `D_hol` has dimension `time^-1`.
- An instantaneous dimensionless holonomy variance instead gives `time^-2`, failing the rate gate.
- For a PSD stationary covariance, `K_phi >= 0`, so `D_hol >= 0`. The sign of `chi_g` is lost because it is squared.
- `E0 -> 0`, `chi_g -> 0`, or `K_phi -> 0` gives `D_hol -> 0`.
- At fixed variance, `tau_c -> 0` gives `K_phi -> 0`; a nonzero white-noise limit requires variance to scale inversely with correlation time while integrated strength stays fixed.
- At fixed variance, `tau_c -> infinity` invalidates a constant Markov rate; finite-time decay becomes Gaussian rather than exponential.
- In Planck units `hbar=1`, the correction does not disappear: energy has inverse-time dimension and `K_phi` still supplies one power of time.
- The formula encodes a scalar loop-averaged stochastic channel but does not itself derive a nontrivial loop, representation weight, or protected angular-momentum basis. The later Ravel source shows that a smooth periodic director contributes only integer winding, while a concrete asymmetric tube generates local Berry transport and transitions. Numerical positivity cannot supply the missing topology or operator selection.

## BEDROCK comparison

The source is compatible with BEDROCK only as a sandbox control calculation:

1. It starts from an apparatus-constrained ring and an imported positive oscillator bath, not a completed SAT-native worldtube/timesheet action. Under the no-attractive-substitution rule, this cannot become an H(s)H derivation merely because the mathematics is consistent.
2. The connection, loop, readout, and physical dynamics must remain separate. Gauge-invariant loop holonomy modulo integer winding is not equivalent to a derived physical dephasing channel.
3. The concrete asymmetric tube destroys the symmetry-protected `N` eigenbasis and produces transitions. The pure-dephasing interpretation therefore fails in the very geometry used to generate nonzero fractional holonomy.
4. Nothing here modifies BEDROCK. Status remains `GEN/CANDIDATE` with a corrected numerical fixture.

## External-verification gate

There is no CODATA quantity corresponding to this normalized apparatus fixture. `E0/hbar=1`, `sigma=0.2`, and `tau_c=0.5` are dimensionless illustrative choices, not independently mapped physical measurements. A CODATA comparison would therefore be category error, not verification.

Gate: `INTERNALLY_CORRECTED; PHYSICAL_MAPPING_UNDEFINED; NO_CODATA_QUANTITY`.

The exact external discriminator is to specify a physical ring/tube, derive `E0`, `chi_g`, the covariance spectrum and readout from one SAT-native action without fitting a measured dephasing rate, then compare a held-out rate and leakage spectrum to experiment.

## Executed numerical output

```text
DIMENSION_TESTS
corrected_D_dim= Dim(kg=0, m=0, s=-1)
corrected_is_rate= True
archived_variance_D_dim= Dim(kg=0, m=0, s=-2)
archived_variance_is_rate= False
sigma2= 0.040000000000000
tau_c= 0.500000000000000
K_archived_instantaneous_variance= 0.040000000000000
D_archived= 0.160000000000000
K_corrected_integrated_covariance= 0.020000000000000
D_corrected_white_limit= 0.080000000000000
archived_over_corrected= 2.000000000000000
t=0.05 J=0.000096748360719 coherence=0.999806521997845 effective_decay_rate=0.003869934428768
t=0.50 J=0.007357588823429 coherence=0.985392561465602 effective_decay_rate=0.029430355293715
t=5.00 J=0.180000907998595 coherence=0.697675059093933 effective_decay_rate=0.072000363199438
t=50.00 J=1.980000000000000 coherence=0.019063114291612 effective_decay_rate=0.079200000000000
asymptotic_decay_rate= 0.080000000000000
ASSERTIONS=PASS (6/6)
GATE=INTERNALLY_CORRECTED; PHYSICAL_MAPPING_UNDEFINED; NO_CODATA_QUANTITY
```

## Complete executed Python

```python
#!/usr/bin/env python3
"""Audit the archived Ravel holonomy-noise rate fixture."""

from dataclasses import dataclass
from math import exp, isclose


@dataclass(frozen=True)
class Dim:
    kg: int = 0
    m: int = 0
    s: int = 0

    def __mul__(self, other):
        return Dim(self.kg + other.kg, self.m + other.m, self.s + other.s)

    def __truediv__(self, other):
        return Dim(self.kg - other.kg, self.m - other.m, self.s - other.s)

    def __pow__(self, n):
        return Dim(self.kg * n, self.m * n, self.s * n)


ENERGY = Dim(kg=1, m=2, s=-2)
ACTION = Dim(kg=1, m=2, s=-1)
TIME = Dim(s=1)
RATE = Dim(s=-1)
ONE = Dim()


def ou_J(t, sigma2, tau_c):
    return 2.0 * sigma2 * (
        tau_c * t - tau_c**2 * (1.0 - exp(-t / tau_c))
    )


def coherence(t, omega0, sigma2, tau_c):
    return exp(-2.0 * omega0**2 * ou_J(t, sigma2, tau_c))


def d_hol(omega0, k_phi):
    return 4.0 * omega0**2 * k_phi


def main():
    sigma2 = 0.20**2
    tau_c = 0.5
    omega0 = 1.0

    k_archived = sigma2
    d_archived = d_hol(omega0, k_archived)
    k_corrected = sigma2 * tau_c
    d_corrected = d_hol(omega0, k_corrected)

    print("DIMENSION_TESTS")
    print("corrected_D_dim=", (ENERGY / ACTION)**2 * TIME)
    print("corrected_is_rate=", (ENERGY / ACTION)**2 * TIME == RATE)
    print("archived_variance_D_dim=", (ENERGY / ACTION)**2 * ONE)
    print("archived_variance_is_rate=", (ENERGY / ACTION)**2 == RATE)
    print("sigma2=", f"{sigma2:.15f}")
    print("tau_c=", f"{tau_c:.15f}")
    print("K_archived_instantaneous_variance=", f"{k_archived:.15f}")
    print("D_archived=", f"{d_archived:.15f}")
    print("K_corrected_integrated_covariance=", f"{k_corrected:.15f}")
    print("D_corrected_white_limit=", f"{d_corrected:.15f}")
    print("archived_over_corrected=", f"{d_archived/d_corrected:.15f}")

    for t in (0.05, 0.5, 5.0, 50.0):
        j = ou_J(t, sigma2, tau_c)
        coh = coherence(t, omega0, sigma2, tau_c)
        eff = -__import__('math').log(coh) / t
        print(
            f"t={t:.2f} J={j:.15f} coherence={coh:.15f} "
            f"effective_decay_rate={eff:.15f}"
        )

    asymptotic_rate = d_corrected
    print("asymptotic_decay_rate=", f"{asymptotic_rate:.15f}")

    assert (ENERGY / ACTION)**2 * TIME == RATE
    assert (ENERGY / ACTION)**2 != RATE
    assert isclose(k_corrected, 0.02, rel_tol=0, abs_tol=1e-15)
    assert isclose(d_corrected, 0.08, rel_tol=0, abs_tol=1e-15)
    assert isclose(coherence(5.0, omega0, sigma2, tau_c),
                   0.6976750590939335, rel_tol=0, abs_tol=2e-15)
    assert isclose(d_archived / d_corrected, 2.0,
                   rel_tol=0, abs_tol=1e-15)
    print("ASSERTIONS=PASS (6/6)")
    print("GATE=INTERNALLY_CORRECTED; PHYSICAL_MAPPING_UNDEFINED; NO_CODATA_QUANTITY")


if __name__ == "__main__":
    main()
```

Python 3 executed successfully on 2026-10-21; all six assertions passed.

## Complete Lean 4 / Mathlib source

```lean
import Mathlib

structure Dim where
  M : Int
  L : Int
  T : Int
deriving DecidableEq, Repr

def Dim.mul (a b : Dim) : Dim := ⟨a.M+b.M, a.L+b.L, a.T+b.T⟩
def Dim.scale (n : Int) (a : Dim) : Dim := ⟨n*a.M,n*a.L,n*a.T⟩

def dOmega : Dim := ⟨0,0,-1⟩
def dTime : Dim := ⟨0,0,1⟩
def dRate : Dim := ⟨0,0,-1⟩
def dOne : Dim := ⟨0,0,0⟩

example : Dim.mul (Dim.scale 2 dOmega) dTime = dRate := by decide
example : Dim.mul (Dim.scale 2 dOmega) dOne ≠ dRate := by decide

def dHol (omega K : ℝ) : ℝ := 4 * omega^2 * K

example : dHol 1 (1/25 : ℝ) = 4/25 := by
  norm_num [dHol]

example : dHol 1 ((1/25 : ℝ) * (1/2)) = 2/25 := by
  norm_num [dHol]

theorem dHol_nonneg {omega K : ℝ} (hK : 0 ≤ K) :
    0 ≤ dHol omega K := by
  unfold dHol
  positivity
```

Lean was not installed in this runtime, so this complete source is untested here. The dimension examples are kernel-decidable; the arithmetic and positivity goals use standard Mathlib tactics.

## Individual varied archive reading

An actual `secrets.choice` draw over five declared substantial, not-recently-used HsH archive files selected:

`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/WB2.txt`

- Read extent: lines 1–220, the complete returned chapter.
- Blob: `0c04d190699c848c60914e7bd1809e074d076576`.

Honest takeaway: the chapter correctly reproduces the standard Einstein-Hilbert to weak-field Poisson chain, but surrounds it with dormant compact-scalar, elastic, and two-form sectors and then says one action covers the domains “without cross-talk.” Because those additional sectors are merely written into the action and turned off, this is not a derivation of their SAT necessity or mutual unification. It is useful as a benchmark and as a warning that successful recovery of standard GR cannot validate dormant added machinery.

## Discrepancy ledger

| Item | Archived fixture | Corrected/tested result | Status |
|---|---:|---:|---|
| Meaning of `K_phi` | instantaneous variance | integrated covariance / half zero-frequency PSD | definite correction |
| Dimension of `D_hol` | rate asserted | `time^-2` if old `K_phi` meaning retained | fail |
| OU `K_phi` | 0.04 | 0.02 time | definite correction |
| OU asymptotic `D_hol` | 0.16 | 0.08 inverse time | definite correction |
| `t=5` coherence | 0.6976750591 | reproduced exactly | pass |
| Pure `N`-dephasing | candidate | fails for the concrete asymmetric-tube eigenbasis | unresolved/rejected for tested fixture |
| CODATA comparison | none | no corresponding mapped quantity | not applicable |

Exact next discriminator: derive a physical covariance with units and a protected operator basis from one SAT-native finite-worldtube/timesheet action; then predict both dephasing and leakage without fitting either. If the same deformation necessarily produces transitions comparable to the diagonal channel, reject pure holonomy dephasing.

Orson Vay handoff: preserve `D_hol=0.08` only as the corrected OU toy-limit rate; investigate whether treating an instantaneous variance as an integrated noise strength recurs elsewhere in the archive, and keep apparatus noise distinct from an H(s)H mechanism.
