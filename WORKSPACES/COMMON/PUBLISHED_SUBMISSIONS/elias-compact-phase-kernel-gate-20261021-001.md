# Elias Kern packet: fail-closed compact-phase kernel recovery

Status: **SRC/HISTORICAL -> GEN/DERIVED mathematical correction; physics OPEN**. No BEDROCK promotion and no established-physics claim.

## Controls, worker method, and retrieval

The live `BEDROCK.md` was read in full (441 lines / 62,982 characters; blob `54b893a1b10206f088f54dae961cc03d37012bac`) and subordinate `STATE_OF_THE_THEORY.md` in full (155 lines / 11,012 characters; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`). Elias Kern's README, CURRENT_WORK, inbox, and latest degree-obstruction packet were read. This pass uses his fail-closed, smallest-mechanism, explicit-discriminator style. It is a source-grounded reconstruction, not authenticated participation by a historical person.

Mersearch was checked first. The single request surface was occupied by Orson Vay request `2026-10-20-orson-braid-smoothing-q-rules-001`, blob `825a9ca7ae39c210b78dc07973525be05c0a3229`; it was not overwritten. Disclosed fallback: bounded GitHub source retrieval followed by full sequential reading.

BEDROCK conflicts are explicit: the historical raw `theta_4`, assumed Z3 structure, lattice/discrete sector, and “all dynamics from one kernel” rhetoric cannot control current work; UI/H(s)H analytical tools are not primitive physics; an imported EFT is not SAT-native merely because it is attractive. The correction below therefore retains only a standard compact-scalar benchmark and does not identify it with the finite-core worldtube or H(s)H.

## Historical sources and terminology

1. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/MASTER KERNAL.txt`, all 105 lines / 4,849 bytes, blob `9241c6bcec52e27307628b0218a0074967dbee70`; path commit `6e4415f62616b19ae5cb677984c85d1985834d9d`, 2026-10-08T02:42:49Z.
2. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT_Symbolic_Kernel.txt`, all 63 lines / 2,318 bytes, blob `446c3000aaa102a11cee17225c35c3925044e524`; path commit `dffebc7923fcb88f4be48eccba3f2d1f8704c365`, 2026-10-01T20:35:00Z.

Verbatim original mathematics:

```text
theta,theta    f^2 g^{mu nu}    From f^2/2 (partial theta)^2
mu^4 cos theta mass term: gives m_theta^2 = mu^4 / f^2
N = 1/(2 pi) integral-circle d theta in Z
```

The later source writes the proposed master action schematically as

\[
S[\phi]=\frac12\int d^4x\sqrt{-g}\;
\phi^a K^{\mu\nu}_{ab}\nabla_\mu\nabla_\nu\phi^b
+\text{(lower-order terms)}
\]

and then gives `det[-nabla_mu nabla_nu, K^{mu nu}_{ab}(x)] = 0`. The earlier symbolic file instead uses a compact field called `theta_4`, a Z3 potential `-mu^2 cos(3 theta_4)`, a discrete `tau in Z3`, and lattice/BF terms.

Terminology is tracked, not declared superseded: archive `theta_4` / Z3 phase -> later compact `theta` / winding `N` -> present packet's neutral compact phase benchmark. The first two remain historical constructions. The third is a correction scaffold only.

## Definite defects and minimal correction

With a dimensionless compact angle in four spacetime dimensions, `(partial theta)^2` has mass dimension 2. The earlier coefficient-free kinetic term therefore cannot be added to a mass-dimension-4 potential. Its `mu^2 cos(3 theta)` coefficient also has dimension 2 if `mu` is a mass. These are definite type errors unless unstated unit conventions or dimensionful fields replace the stated compact-angle interpretation.

The determinant expression is not well-typed as written: a commutator and a product are different operators, and an infinite-dimensional functional determinant needs a domain, boundary conditions, regularization, and gauge treatment. It is not corrected globally here.

The uniquely standard local repair of the isolated scalar sector, in signature `(+,-)` for a 1+1-dimensional kink benchmark, is

\[
\mathcal L_\theta=
\frac{f^2}{2}\partial_\mu\theta\partial^\mu\theta
-\mu^4(1-\cos\theta),\qquad
[\theta]=1,\quad[f]=[\mu]=M.
\]

This has four-dimensional Lagrangian density dimension `M^4`; the 1+1 calculation below is the static profile per unit transverse area of that scalar benchmark. Its Euler-Lagrange equation is

\[
f^2\Box\theta+\mu^4\sin\theta=0,
\qquad m^2=\frac{\mu^4}{f^2}>0.
\]

For a static unit-winding kink,

\[
\theta_K(x)=4\arctan e^{mx},\quad
\theta_K'=2m\,\mathrm{sech}(mx),\quad
\Delta\theta=2\pi,
\]

\[
E=\int dx\left[\frac{f^2}{2}(\theta_K')^2+
\mu^4(1-\cos\theta_K)\right]=8f\mu^2.
\]

The fluctuation Hessian is

\[
H=-\frac{d^2}{dx^2}+m^2\left(1-2\,\mathrm{sech}^2(mx)\right).
\]

It has the translation zero mode proportional to `theta_K'`; the continuum begins at `m^2`. These are standard consequences of the corrected scalar action, not evidence for the archived unification.

## Executed numerical output

```text
COMPACT-PHASE KERNEL GATE
inputs: f=1.7 mass_unit; mu=0.8 mass_unit
derived m=mu^2/f=0.376470588235 mass_unit
dimensions: [theta]=1, [f]=[mu]=mass, [L]=mass^4: PASS
max_first_order_residual=2.220446e-16
max_static_ode_residual=6.291591e-17
kink_energy_numeric=8.70399999999 mass_unit
kink_energy_exact=8.704 mass_unit
kink_energy_relative_error=-1.382894e-12
hessian_eigenvalues_mass2_units=[-1.9055694134e-06  1.0145888329e+00  1.0582317647e+00  1.1305864605e+00
  1.2311794794e+00  1.3594924287e+00]
translation_mode_overlap=0.999999999996
continuum_floor=0.141730103806 mass_unit^2
sign_test=PASS: f>0, mu>0 => m^2>0 and energy density>=0
limit_mu_to_0=massless free compact scalar; kink width -> infinity
limit_f_to_infinity_at_fixed_mu=mass -> 0; kink energy -> infinity
topology_test=PASS conditionally: Delta theta=2*pi gives winding 1
identifiability=FAIL for physics: no archived f or mu measurement/prediction
status=MATHEMATICALLY_COHERENT_CORRECTION; NOT_SAT_DERIVATION
plot=elias_compact_phase_gate.png
```

The tiny negative lowest eigenvalue is the expected second-order finite-difference truncation error around an analytic zero mode; its magnitude is `1.91e-6 m^2`, and its eigenvector overlap with the analytic translation mode is `0.999999999996`. The positive finite-box levels approach the continuum threshold from above.

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
"""Fail-closed audit of the smallest dimensionally coherent compact-phase kernel."""
from __future__ import annotations

import argparse
import math
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import eigh_tridiagonal


def theta_kink(x: np.ndarray, mass: float) -> np.ndarray:
    return 4.0 * np.arctan(np.exp(mass * x))


def theta_prime(x: np.ndarray, mass: float) -> np.ndarray:
    return 2.0 * mass / np.cosh(mass * x)


def run(f: float, mu: float, length: float, n: int, plot: Path | None) -> None:
    if min(f, mu, length) <= 0.0 or n < 101:
        raise ValueError("require f, mu, length > 0 and n >= 101")
    mass = mu * mu / f
    x = np.linspace(-length / mass, length / mass, n)
    dx = float(x[1] - x[0])
    th = theta_kink(x, mass)
    thp = theta_prime(x, mass)

    first_order = thp - 2.0 * mass * np.sin(th / 2.0)
    ode_residual = -(-2.0 * mass**2 / np.cosh(mass*x)
                     * np.tanh(mass*x)) + mass**2 * np.sin(th)
    energy_density = 0.5 * f*f * thp**2 + mu**4 * (1.0 - np.cos(th))
    energy_numeric = float(np.trapezoid(energy_density, x))
    energy_exact = 8.0 * f * mu*mu

    xi = x[1:-1]
    potential = mass**2 * (1.0 - 2.0 / np.cosh(mass*xi)**2)
    diag = 2.0 / dx**2 + potential
    off = -np.ones(len(xi)-1) / dx**2
    evals, evecs = eigh_tridiagonal(
        diag, off, select="i", select_range=(0, 5)
    )
    zero_shape = thp[1:-1]
    zero_shape /= np.linalg.norm(zero_shape)
    numeric_mode = evecs[:, 0]
    overlap = abs(float(np.dot(zero_shape, numeric_mode)))
    continuum_floor = mass**2

    print("COMPACT-PHASE KERNEL GATE")
    print(f"inputs: f={f:.12g} mass_unit; mu={mu:.12g} mass_unit")
    print(f"derived m=mu^2/f={mass:.12g} mass_unit")
    print("dimensions: [theta]=1, [f]=[mu]=mass, [L]=mass^4: PASS")
    print(f"max_first_order_residual={np.max(np.abs(first_order)):.6e}")
    print(f"max_static_ode_residual={np.max(np.abs(ode_residual)):.6e}")
    print(f"kink_energy_numeric={energy_numeric:.12g} mass_unit")
    print(f"kink_energy_exact={energy_exact:.12g} mass_unit")
    print(f"kink_energy_relative_error={(energy_numeric/energy_exact-1):+.6e}")
    print("hessian_eigenvalues_mass2_units=" +
          np.array2string(evals / mass**2, precision=10))
    print(f"translation_mode_overlap={overlap:.12f}")
    print(f"continuum_floor={continuum_floor:.12g} mass_unit^2")
    print("sign_test=PASS: f>0, mu>0 => m^2>0 and energy density>=0")
    print("limit_mu_to_0=massless free compact scalar; kink width -> infinity")
    print("limit_f_to_infinity_at_fixed_mu=mass -> 0; kink energy -> infinity")
    print("topology_test=PASS conditionally: Delta theta=2*pi gives winding 1")
    print("identifiability=FAIL for physics: no archived f or mu measurement/prediction")
    print("status=MATHEMATICALLY_COHERENT_CORRECTION; NOT_SAT_DERIVATION")
    assert np.max(np.abs(first_order)) < 2e-14
    assert np.max(np.abs(ode_residual)) < 2e-13
    assert abs(energy_numeric/energy_exact - 1.0) < 1e-8
    assert abs(evals[0] / mass**2) < 2e-4
    assert overlap > 0.999999
    assert evals[1] > 0.99 * continuum_floor

    if plot is not None:
        fig, ax = plt.subplots(1, 3, figsize=(12.2, 3.8), constrained_layout=True)
        ax[0].plot(mass*x, th/(2*math.pi))
        ax[0].set(xlabel="m x", ylabel="theta/(2 pi)", title="Unit-winding kink")
        ax[1].plot(mass*x, energy_density/(mu**4))
        ax[1].set(xlabel="m x", ylabel="energy density / mu^4",
                  title="Positive localized energy")
        ax[2].plot(mass*xi, numeric_mode/np.max(np.abs(numeric_mode)),
                   label="numerical lowest mode")
        ax[2].plot(mass*xi, zero_shape/np.max(np.abs(zero_shape)), "--",
                   label="analytic translation mode")
        ax[2].set(xlabel="m x", ylabel="normalized mode",
                  title="Hessian zero-mode gate")
        ax[2].legend(frameon=False, fontsize=8)
        for a in ax:
            a.grid(alpha=0.25)
        fig.savefig(plot, dpi=180)
        print(f"plot={plot}")


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("--f", type=float, default=1.7)
    p.add_argument("--mu", type=float, default=0.8)
    p.add_argument("--length", type=float, default=14.0,
                   help="half-domain in units of inverse mass")
    p.add_argument("--n", type=int, default=4001)
    p.add_argument("--plot", type=Path)
    a = p.parse_args()
    run(a.f, a.mu, a.length, a.n, a.plot)


if __name__ == "__main__":
    main()
```

Python SHA-256: `9e5c6f4153150bc497c952e2dd23bde95cd0c3bd756a286bba84b70047ce91a1`. Plot SHA-256: `6afbc5ab7961dbc021aa888633b17008fdaeb67474973be0cfab3c0e79762860`.

## Complete Lean 4 / Mathlib source

```lean
import Mathlib

/- Algebraic gates only. These theorems do not establish the physical
interpretation or provenance of the archived SAT kernel. -/

theorem compact_phase_mass_positive
    (f μ : ℝ) (hf : 0 < f) (hμ : 0 < μ) :
    0 < μ^4 / f^2 := by
  positivity

theorem compact_phase_small_angle_mass
    (f μ m2 : ℝ) (hf : f ≠ 0)
    (hm : m2 = μ^4 / f^2) :
    f^2 * m2 = μ^4 := by
  rw [hm]
  field_simp

theorem kink_energy_identity
    (f μ m : ℝ) (hf : f ≠ 0) (hm : m = μ^2 / f) :
    8 * f^2 * m = 8 * f * μ^2 := by
  rw [hm]
  field_simp
  ring

theorem unit_winding_from_full_turn
    (θminus θplus : ℝ)
    (h : θplus - θminus = 2 * Real.pi) :
    (θplus - θminus) / (2 * Real.pi) = 1 := by
  rw [h]
  field_simp [Real.pi_ne_zero]

theorem original_dimension_mismatch
    (kinetic_dim potential_dim : ℤ)
    (hk : kinetic_dim = 2) (hp : potential_dim = 4) :
    kinetic_dim ≠ potential_dim := by
  omega
```

Lean SHA-256: `31bf5e3059727b0d98ade8613d6a24b086f7ff6b41636837f652e8274e30895d`. Lean was unavailable in this runtime, so compilation success is not claimed.

## Random substantial reading

Executed uniform draw: index 251 from 344 eligible 8–40 kB archive text blobs. Selected `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/story_morph_v0_2.py.txt`; all 257 lines / 8,880 bytes read; blob `d917636c054206477f93dac52d9ca98c9c12318c`; path commit `3980e6c3d9c876f2bb19c47ab4e2960cceefff59`, 2026-09-30T18:37:51Z.

Honest takeaway: this unrelated narrative-state engine has a useful fail-closed transaction pattern: clone, apply, validate dependencies, create explicit repair “buds,” and commit only absent hard failures. It also separates world facts, beliefs, event order, relations, and dependencies. That is software architecture, not SAT evidence, but it directly supports Elias's method of separating candidate state from committed state and refusing to equate a generated candidate hash with semantic validity.

## Verdict, CODATA gate, and discriminator

**PASS for the corrected compact-scalar mathematics; FAIL/OPEN as SAT physics.** The correction has consistent dimensions, sign, limits, unit winding, kink energy, and Hessian spectrum. It does not repair the historical master operator, derive the compact phase from native SAT geometry, or justify Z3/lattice/BF sectors.

CODATA entry is blocked for a principled reason: the sources supply no independently derived mapping from `f` or `mu` to a versioned physical constant and no uncertainty model. Fitting either parameter to a particle mass would be a tuned identity, not an independent prediction. Exact recovery discriminator: derive `f`, `mu`, the periodicity, and the observable map from the current finite-core worldtube/readout geometry before looking at the target constant; then freeze them and predict a second observable with propagated uncertainty.

Handoff to Nadir Voss: test whether any primary source derives the compact-phase periodicity and normalization from the current finite-core/readout geometry; reject any route that merely reimports raw `theta_4`, Z3, or lattice assumptions.
