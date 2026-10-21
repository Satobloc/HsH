# Mira historical Cabibbo convention and identifiability gate

Status: **TENTATIVE SOURCE-AND-TEST PACKET; NOT BEDROCK; NOT ESTABLISHED PHYSICS**  
Worker: Mira. Handoff: Aldus.  
Control basis: live `BEDROCK.md` blob `366c5f632dea7a7e5b53667ed8d201fd096899c0` read in full (457 lines); subordinate `STATE_OF_THE_THEORY.md` blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9` read in full (155 lines).

## Historical source record

Primary historical locator 1: `SAT_THEORY_ARCHIVE_2023-25/CP CLOSURE.txt`, complete 35-line read; blob `4c4525504e32b5cded85a68ea60660e1579871ee`; path commit `ec6ff6182340346b649f905653fd5f74886d1502`, 2026-06-29T10:18:39Z.

Verbatim mathematical claim:

> Cabibbo angle (\theta_{12}): Geodesically refined \theta_{12}=B(1-B^2) \approx 0.2251 rad

The same source attaches 24-cell/HSUCV-lattice, parameter-free, “TORQUED and LOCKED,” and sub-0.05% claims. Those attachments are preserved historically but conflict with current BEDROCK guards against assuming a raw lattice, a universal primitive `B`, or a locked numerical identification. They are not promoted here.

Primary historical locator 2: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/KEY CONCEPT - IRI.txt`, complete 184-line read; blob `ba94d51313fb94fb6af69cb76ccfc84141838abe`; path commit `11c5a796d3d5eeda8ec16a497b9cdccd87dce7c4`, 2026-10-08T02:05:20Z.

Verbatim mathematical sequence, retaining the source's terminology changes:

> B0=0.238732 ... theta12=0.225126 ... mass ratio 1934.

> B is inverse refractive index / should vary by bundle class.

> B=0.24123

> theta_12 = B(1-B^2) at that B = 0.22719

The second source compares this with “measured Cabibbo angle 13.02° = 0.22724 rad,” calls the mass-ratio determination “one fit” and the Cabibbo comparison “one hit,” and explicitly requires pinning the convention: angle in radians versus `sin(theta_C)`. Thus it is a transfer/postdiction candidate, not a preregistered independent prediction.

## Exact test definition

All quantities in this packet are dimensionless; the angle readout is in radians. Planck-unit normalization therefore introduces no scale and derives no coefficient.

Historical kernel:

\[
f(B)=B(1-B^2)=B-B^3,\qquad f'(B)=1-3B^2.
\]

Limits and sign on the stated physical interval:

\[
f(0)=f(1)=0,\qquad f(B)\ge0\quad(0\le B\le1).
\]

It rises on `0 < B < 1/sqrt(3)`, falls on `1/sqrt(3) < B < 1`, and has maximum `2/(3 sqrt(3))`. Consequently a target below that maximum generally has two admissible roots. Algebraically, if `f(x)=f(y)` and `x != y`, then

\[
x^2+xy+y^2=1.
\]

The scalar equation therefore does not identify a unique geometry or topology. The source's lattice/holonomy language is not entailed by this polynomial.

For the 2026 PDG standard CKM convention,

\[
|V_{us}|=s_{12}c_{13},\quad |V_{ub}|=s_{13},\quad
\theta_{12}=\arcsin\!\left(\frac{|V_{us}|}{\sqrt{1-|V_{ub}|^2}}\right).
\]

Comparator inputs are `|Vus|=0.22431+/-0.00085` and `|Vub|=0.00389+/-0.00016`. Independent first-order propagation gives

\[
\sigma_s^2=\left(\frac{\sigma_{us}}{c_{13}}\right)^2+
\left(\frac{|V_{us}||V_{ub}|}{(1-|V_{ub}|^2)^{3/2}}\sigma_{ub}\right)^2,
\quad
\sigma_\theta=\frac{\sigma_s}{\sqrt{1-s_{12}^2}}.
\]

## Numerical result

```text
PDG-2026 inputs
Vus = 0.22431000 +/- 0.00085000
Vub = 0.00389000 +/- 0.00016000
c13 = 0.999992433921
s12 = 0.224311697160 +/- 0.000850006443
theta12 = 0.226236677502 +/- 0.000872233167 rad
theta12 = 12.962406792 +/- 0.049975279 deg

Historical candidates
B0=3/(4pi): B=0.238732414637843, f(B)=0.225126298549, f'(B)=0.829020502604
  as |Vus|: residual=+0.000816298549, z=+0.960351
  as theta12: residual=-0.001110378954 rad, z=-1.273030
B_mass: B=0.241232875656961, f(B)=0.227194738482, f'(B)=0.825420099107
  as |Vus|: residual=+0.002884738482, z=+3.393810
  as theta12: residual=+0.000958060980 rad, z=+1.098400

Inverse identifiability
Vus target: roots=0.237748595431,0.859699513516
  B=0.237748595431, sigma_B=0.001023570029, branch=low
  B=0.859699513516, sigma_B=0.000698295475, branch=high
theta12 target: roots=0.240073357564,0.858111360750
  B=0.240073357564, sigma_B=0.001054575174, branch=low
  B=0.858111360750, sigma_B=0.000721411119, branch=high
```

## Decision

Basic algebra, dimensions, limits, and sign **PASS**. The historical `B0=3/(4pi)` value is statistically compatible with either 2026 comparator under these uncertainties, but compatibility is not derivation. The mass-ratio-fitted `B_mass` is compatible only if the historical output is interpreted as the angle itself (1.10 sigma); interpreting it as `|Vus|` misses by 3.39 sigma. This convention dependence is decisive.

No uniquely justified textual correction is made: the original claim is preserved verbatim. The active-verification status is **CONVENTION-GATED / NON-IDENTIFIABLE**. Exact discriminators are: (1) preregister whether `f(B)` denotes `theta12`, `sin(theta12)`, or `|Vus|`; (2) derive the low versus high inverse branch from independent geometry; (3) supply an independent typed definition of `B`; and (4) predict an observable not used to fit `B`. Until those gates close, there is no BEDROCK promotion and no physics-proof claim.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Mira convention/identifiability gate for historical f(B)=B(1-B^2)."""
from math import asin, pi, sqrt

import matplotlib.pyplot as plt
import numpy as np

VUS, S_VUS = 0.22431, 0.00085
VUB, S_VUB = 0.00389, 0.00016
B0 = 3.0 / (4.0 * pi)
B_MASS = 0.241232875656961

def f(b):
    return b * (1.0 - b * b)

def fp(b):
    return 1.0 - 3.0 * b * b

def roots_for(y):
    roots = np.roots([1.0, 0.0, -1.0, y])
    return sorted(float(z.real) for z in roots if abs(z.imag) < 1e-12 and 0 < z.real < 1)

c13 = sqrt(1.0 - VUB * VUB)
s12 = VUS / c13
theta12 = asin(s12)
ds_dvus = 1.0 / c13
ds_dvub = VUS * VUB / (1.0 - VUB * VUB) ** 1.5
s_s12 = sqrt((ds_dvus * S_VUS) ** 2 + (ds_dvub * S_VUB) ** 2)
s_theta12 = s_s12 / sqrt(1.0 - s12 * s12)

print("PDG-2026 inputs")
print(f"Vus = {VUS:.8f} +/- {S_VUS:.8f}")
print(f"Vub = {VUB:.8f} +/- {S_VUB:.8f}")
print(f"c13 = {c13:.12f}")
print(f"s12 = {s12:.12f} +/- {s_s12:.12f}")
print(f"theta12 = {theta12:.12f} +/- {s_theta12:.12f} rad")
print(f"theta12 = {theta12*180/pi:.9f} +/- {s_theta12*180/pi:.9f} deg")

print("\nHistorical candidates")
for name, b in (("B0=3/(4pi)", B0), ("B_mass", B_MASS)):
    y = f(b)
    z_vus = (y - VUS) / S_VUS
    z_theta = (y - theta12) / s_theta12
    print(f"{name}: B={b:.15f}, f(B)={y:.12f}, f'(B)={fp(b):.12f}")
    print(f"  as |Vus|: residual={y-VUS:+.12f}, z={z_vus:+.6f}")
    print(f"  as theta12: residual={y-theta12:+.12f} rad, z={z_theta:+.6f}")

print("\nInverse identifiability")
for label, y, sy in (("Vus target", VUS, S_VUS), ("theta12 target", theta12, s_theta12)):
    rs = roots_for(y)
    print(f"{label}: roots={','.join(f'{r:.12f}' for r in rs)}")
    for r in rs:
        print(f"  B={r:.12f}, sigma_B={sy/abs(fp(r)):.12f}, branch={'low' if r < 1/sqrt(3) else 'high'}")

grid = np.linspace(0.0, 1.0, 1001)
fig, ax = plt.subplots(figsize=(8.0, 4.8))
ax.plot(grid, f(grid), label=r"$f(B)=B(1-B^2)$", color="black")
ax.axhline(VUS, color="#1f77b4", ls="--", label=r"PDG 2026 $|V_{us}|$")
ax.axhline(theta12, color="#ff7f0e", ls=":", label=r"PDG-derived $\theta_{12}$")
ax.scatter([B0, B_MASS], [f(B0), f(B_MASS)], c=["#2ca02c", "#d62728"], zorder=3)
ax.annotate(r"$3/(4\pi)$", (B0, f(B0)), xytext=(8, 10), textcoords="offset points")
ax.annotate(r"$B_{mass}$", (B_MASS, f(B_MASS)), xytext=(8, -16), textcoords="offset points")
ax.set(xlabel="dimensionless B", ylabel="dimensionless f(B)", xlim=(0, 1), ylim=(0, 0.41))
ax.legend(loc="lower center", ncol=2, fontsize=8)
ax.grid(alpha=0.25)
fig.tight_layout()
fig.savefig("mira_cabibbo_convention_gate.png", dpi=180)
```

Python 3 execution: PASS. Script SHA-256: `ff82c906e4a76f18cb864433b40695119f981dd3aa54fb478452476ec3e68e68`. Plot SHA-256: `e1ec997002a3bee4bdb852b2fce01d629cfa54d5d95808eaa58c4ecee7a9112b`.

## Complete Lean source

```lean
import Mathlib

def cabibboKernel (B : ℝ) : ℝ := B * (1 - B^2)

theorem cabibboKernel_expand (B : ℝ) :
    cabibboKernel B = B - B^3 := by
  ring

theorem cabibboKernel_zero : cabibboKernel 0 = 0 := by
  norm_num [cabibboKernel]

theorem cabibboKernel_one : cabibboKernel 1 = 0 := by
  norm_num [cabibboKernel]

theorem cabibboKernel_nonneg {B : ℝ} (h0 : 0 ≤ B) (h1 : B ≤ 1) :
    0 ≤ cabibboKernel B := by
  unfold cabibboKernel
  positivity

theorem cabibboKernel_symmetry_witness {x y : ℝ}
    (h : x^2 + x*y + y^2 = 1) :
    cabibboKernel x = cabibboKernel y := by
  unfold cabibboKernel
  nlinarith

theorem cabibboKernel_deriv (B : ℝ) :
    HasDerivAt cabibboKernel (1 - 3 * B^2) B := by
  convert (hasDerivAt_id B).mul
      ((hasDerivAt_const B 1).sub (((hasDerivAt_id B).pow 2))) using 1 <;>
    simp [cabibboKernel] <;> ring
```

Lean source SHA-256: `7aa2260267466b5228e771b6b4b6925f306848fd98506a35623c57507649e9a6`. Lean was unavailable in this runtime, so the formal file is **NOT COMPILE-VERIFIED**; Python independently tests all reported numerics.

## Individual reading round

Random draw over 341 eligible substantial text files selected `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/Audioscript - THE FUNDAMENTAL INTUITIONS OF SAT.txt`; complete 9,399-byte read; blob `2ebfdc24719487b873777f5622a942301720dac5`. Honest takeaway: the old “essay-TEE” text already contains the durable hierarchy of filaments/worldlines intersected by a moving time surface and explicitly imports the Standard Model, GR, and quantum mechanics as constraints. It also speculates about physical back-propagation, raw intersection-angle mass, aligned vacuum lattices, and bosons as non-particulate network transfer. Current BEDROCK preserves the hierarchy but requires the speculative mechanisms, topology, and observational claims to remain unpromoted until typed and independently tested.

## Next-worker handoff

Aldus: use the two inverse branches as an identifiability stress test; do not choose the low branch merely because it is historically familiar. Require an independent geometric discriminator and a preregistered observable before treating `B` as recovered.
