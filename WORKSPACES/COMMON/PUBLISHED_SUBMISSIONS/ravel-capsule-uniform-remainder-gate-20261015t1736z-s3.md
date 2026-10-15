# Ravel — uniform-remainder gate for the near-contact 4D capsule crossover

**Status:** GEN/DERIVED; numerical quadrature EXECUTED. This is Euclidean set geometry only. It does not establish an interaction, force, field equation, or physical realization.

## Question and definitions

Let (A) be the radius-(R) neighborhood in (mathbb R^4) of the segment
[
S_A={(0,0,0,t): |t|le L},
]
and let (B) be the radius-(R) neighborhood of
[
S_B={(ssin	heta,D,0,scos	heta): |s|le L}.
]
Write the small surface gap as (p=2R-D>0), and use Ravel's fixed-crossover variable
[
delta=rac{L	heta}{sqrt{Rp}},qquad
	heta=rac{deltasqrt{Rp}}{L}.
]
The task is to test whether the previously derived capsule formula is not merely pointwise in (delta), but numerically uniform on (0ledeltale4):
[
V_{m asy}(p,delta)=
pi R Lp^2F(delta)
+rac{8pi}{15}R^{3/2}p^{5/2}
left(1-rac{delta^2}{4}ight)_+^{5/2},
]
where
[
F(delta)=
egin{cases}
1-delta^2/6+delta^4/80,&0ledeltale2,\
16/(15delta),&deltage2.
end{cases}
]

## Exact reduced integral

Use coordinates (x=(u,y,z,t)). For capsule (A), the endpoint excess is
[
e_A(t)=(|t|-L)_+,
]
so at fixed ((u,t)) the allowed ((y,z)) section is a disk centered at ((0,0)) with radius
[
a(u,t)=sqrt{left[R^2-u^2-e_A(t)^2ight]_+}.
]

For the tilted segment, define its longitudinal and perpendicular coordinates in the ((u,t)) plane:
[
ell_B=usin	heta+tcos	heta,qquad
v_B=ucos	heta-tsin	heta,
]
and endpoint excess (e_B=(|ell_B|-L)_+). Its ((y,z)) section is a disk centered at ((D,0)) with radius
[
b(u,t)=sqrt{left[R^2-v_B^2-e_B^2ight]_+}.
]

Let ({cal A}(a,b;D)) be the exact intersection area of two disks of radii (a,b) separated by (D). In the proper-overlap case (|a-b|<D<a+b),
[
{cal A}=
a^2cos^{-1}rac{D^2+a^2-b^2}{2Da}
+b^2cos^{-1}rac{D^2+b^2-a^2}{2Db}
-rac12sqrt{(-D+a+b)(D+a-b)(D-a+b)(D+a+b)}.
]
It is (0) for (Dge a+b) and (pimin(a,b)^2) for (Dle|a-b|). Therefore the capsule overlap is reduced exactly to
[
V_{m exact}(p,delta)=
int_{-L-R}^{L+R}int_{-R}^{R}
{cal A}!left(a(u,t),b(u,t);2R-pight),du,dt.
]
The inner integral was evaluated by 800-point Gauss–Legendre quadrature and the outer integral adaptively, split at (t=pm L).

At (delta=0) there is also an exact dimensional-reduction identity,
[
V_{m exact}(p,0)=2L,V^{(3)}_{m lens}(2R-p;R)
+V^{(4)}_{m lens}(2R-p;R),
]
used directly by the solver. The limiting checks are:

- (p	o0) at fixed (delta): (V_{m asy}=O(p^2)).
- (delta=0): the (p^{5/2}) cap term is present and must improve the cylinder-only approximation.
- (delta=2): both branches give (F(2)=8/15), and the cap correction vanishes continuously.
- (delta	oinfty) within the small-angle scaling: (F(delta)sim16/(15delta)), the infinite-line crossover.
- Negative control: omit the cap term. In the parallel fixtures this is worse for every tested (p).

## Parameters and acceptance gate

[
R=1.2,quad L=1,quad
pin{0.02,0.01,0.005,0.0025},quad
delta=0,0.25,ldots,4.
]
For each (p), define
[
E_infty(p)=max_{deltain[0,4]cap0.25mathbb Z}
left|rac{V_{m asy}-V_{m exact}}{V_{m exact}}ight|.
]
The gate requires (E_infty<0.08), observed convergence order above (0.75) on the two finest halvings, cap improvement at (delta=0), and independent agreement with the archived (p=0.01) fixture within (4	imes10^{-9}) absolute.

## Executed numerical output

The run exited 0 and printed `ALL_CHECKS_PASSED`. SciPy emitted an `IntegrationWarning` that roundoff prevented the requested tolerance in at least one adaptive integral, so the printed `quad_error` values are retained and may themselves be underestimated. The largest printed estimator is (4.73	imes10^{-9}); the main asymptotic discrepancies are much larger. The independent archived-fixture discrepancy is (2.116	imes10^{-9}) absolute.

```text
/workspace/scratch/335d458e3903/ravel_capsule_uniform_remainder_gate.py:83: IntegrationWarning: The occurrence of roundoff error is detected, which prevents 
  the requested tolerance from being achieved.  The error may be 
  underestimated.
  value, error = quad(outer, -L-R, L+R, epsabs=ATOL, epsrel=RTOL,
4D capsule uniform-remainder audit
R=1.2 L=1.0 GL_order=800 deltas=17
p delta exact asymptotic relative_error no_cap_relative_error quad_error
0.0200000 0.00 1.627813434267e-03 1.632557994649e-03 +2.914683146e-03 -7.362573500e-02 0.00e+00
0.0200000 0.25 1.607302092321e-03 1.612113613617e-03 +2.993538874e-03 -7.153101544e-02 1.25e-11
0.0200000 0.50 1.547451943144e-03 1.552339469955e-03 +3.158435280e-03 -6.535984894e-02 1.36e-10
0.0200000 0.75 1.453204605993e-03 1.457857553366e-03 +3.201852894e-03 -5.549644148e-02 2.46e-10
0.0200000 1.00 1.332495218550e-03 1.336181016634e-03 +2.766087287e-03 -4.278334391e-02 4.15e-11
0.0200000 1.25 1.195758123335e-03 1.197401430812e-03 +1.374280839e-03 -2.882966630e-02 8.10e-11
0.0200000 1.50 1.055192405520e-03 1.053677628101e-03 -1.435546172e-03 -1.638443615e-02 1.28e-09
0.0200000 1.75 9.236599030924e-04 9.183758899377e-04 -5.720734588e-03 -9.307984062e-03 4.73e-09
0.0200000 2.00 8.126413165334e-04 8.042477193190e-04 -1.032878472e-02 -1.032878472e-02 3.87e-09
0.0200000 2.25 7.254470605777e-04 7.148868616169e-04 -1.455681542e-02 -1.455681542e-02 9.73e-10
0.0200000 2.50 6.560395992278e-04 6.433981754552e-04 -1.926929988e-02 -1.926929988e-02 3.27e-10
0.0200000 2.75 5.995741861918e-04 5.849074322320e-04 -2.446195033e-02 -2.446195033e-02 1.41e-09
0.0200000 3.00 5.528221168828e-04 5.361651462127e-04 -3.013079644e-02 -3.013079644e-02 2.67e-09
0.0200000 3.25 5.135480405665e-04 4.949216734271e-04 -3.626996049e-02 -3.626996049e-02 5.79e-11
0.0200000 3.50 4.801565062342e-04 4.595701253251e-04 -4.287431419e-02 -4.287431419e-02 3.73e-10
0.0200000 3.75 4.514779928753e-04 4.289321169701e-04 -4.993792889e-02 -4.993792889e-02 3.73e-10
0.0200000 4.00 4.266359783876e-04 4.021238596595e-04 -5.745441071e-02 -5.745441071e-02 1.10e-09
0.0100000 0.00 3.984436069994e-04 3.990163493154e-04 +1.437448878e-03 -5.384071470e-02 0.00e+00
0.0100000 0.25 3.936764857745e-04 3.942574617294e-04 +1.475770019e-03 -5.231186300e-02 2.24e-11
0.0100000 0.50 3.797317123735e-04 3.803210918695e-04 +1.552094483e-03 -4.780752386e-02 3.35e-11
0.0100000 0.75 3.576572850152e-04 3.582183941914e-04 +1.568845931e-03 -4.059208415e-02 9.19e-12
0.0100000 1.00 3.291561829786e-04 3.296010096664e-04 +1.351415258e-03 -3.124513277e-02 4.63e-11
0.0100000 1.25 2.965091050422e-04 2.967057797869e-04 +6.633008609e-04 -2.086917744e-02 2.00e-10
0.0100000 1.50 2.624546653946e-04 2.622643858994e-04 -7.249994770e-04 -1.134956834e-02 1.71e-10
0.0100000 1.75 2.300074703612e-04 2.293513544963e-04 -2.852585022e-03 -5.399161602e-03 1.35e-10
0.0100000 2.00 2.021063291006e-04 2.010619298297e-04 -5.167573304e-03 -5.167573304e-03 1.11e-10
0.0100000 2.25 1.800335928693e-04 1.787217154042e-04 -7.286848217e-03 -7.286848217e-03 1.42e-10
0.0100000 2.50 1.624172754468e-04 1.608495438638e-04 -9.652492807e-03 -9.652492807e-03 2.10e-11
0.0100000 2.75 1.480423316717e-04 1.462268580580e-04 -1.226320603e-02 -1.226320603e-02 4.45e-10
0.0100000 3.00 1.360988116277e-04 1.340412865532e-04 -1.511787686e-02 -1.511787686e-02 1.44e-10
0.0100000 3.25 1.260259862562e-04 1.237304183568e-04 -1.821503618e-02 -1.821503618e-02 7.31e-11
0.0100000 3.50 1.174234141187e-04 1.148925313313e-04 -2.155347642e-02 -2.155347642e-02 9.60e-11
0.0100000 3.75 1.099974533599e-04 1.072330292425e-04 -2.513171017e-02 -2.513171017e-02 9.87e-12
0.0100000 4.00 1.035279058412e-04 1.005309649149e-04 -2.894814593e-02 -2.894814593e-02 2.74e-11
0.0050000 0.00 9.807153269281e-05 9.814132713663e-05 +7.116687371e-04 -3.898942925e-02 0.00e+00
0.0050000 0.25 9.694345422620e-05 9.701386734843e-05 +7.263318889e-04 -3.788621325e-02 1.92e-12
0.0050000 0.50 9.363596871019e-05 9.370781837036e-05 +7.673297041e-04 -3.461862878e-02 9.53e-12
0.0050000 0.75 8.838234078016e-05 8.845045234314e-05 +7.706467421e-04 -2.938973053e-02 2.44e-12
0.0050000 1.00 8.156071059765e-05 8.161461356222e-05 +6.608937585e-04 -2.259417554e-02 2.86e-12
0.0050000 1.25 7.368532795715e-05 7.370894520227e-05 +3.205148946e-04 -1.499656728e-02 1.50e-11
0.0050000 1.50 6.538639715530e-05 6.536191565722e-05 -3.744127089e-04 -7.913229964e-03 3.32e-12
0.0050000 1.75 5.737724900505e-05 5.729494941792e-05 -1.434359237e-03 -3.238971780e-03 1.21e-10
0.0050000 2.00 5.039624850259e-05 5.026548245744e-05 -2.594757527e-03 -2.594757527e-03 6.63e-11
0.0050000 2.25 4.484437327256e-05 4.468042885105e-05 -3.655852664e-03 -3.655852664e-03 4.74e-11
0.0050000 2.50 4.040800161321e-05 4.021238596595e-05 -4.841012657e-03 -4.841012657e-03 9.30e-12
0.0050000 2.75 3.678292742044e-05 3.655671451450e-05 -6.149942971e-03 -6.149942971e-03 2.72e-11
0.0050000 3.00 3.376635003971e-05 3.351032163829e-05 -7.582353471e-03 -7.582353471e-03 7.40e-12
0.0050000 3.25 3.121786579407e-05 3.093260458919e-05 -9.137754860e-03 -9.137754860e-03 5.63e-11
0.0050000 3.50 2.903720390961e-05 2.872313283282e-05 -1.081616115e-02 -1.081616115e-02 1.93e-12
0.0050000 3.75 2.715081662216e-05 2.680825731063e-05 -1.261690638e-02 -1.261690638e-02 9.47e-12
0.0050000 4.00 2.550355608314e-05 2.513274122872e-05 -1.453973137e-02 -1.453973137e-02 1.55e-11
0.0025000 0.00 2.424166808555e-05 2.425023336707e-05 +3.533288833e-04 -2.803945592e-02 0.00e+00
0.0025000 0.25 2.397051453065e-05 2.397937490977e-05 +3.696365844e-04 -2.723579706e-02 1.66e-12
0.0025000 0.50 2.317548459433e-05 2.318433660449e-05 +3.819557738e-04 -2.489180431e-02 1.04e-11
0.0025000 0.75 2.190901164909e-05 2.191742576860e-05 +3.840483376e-04 -2.112417284e-02 1.90e-12
0.0025000 1.00 2.025796334554e-05 2.026477075018e-05 +3.360359839e-04 -1.621510236e-02 1.93e-12
0.0025000 1.25 1.834194936708e-05 1.834459324069e-05 +1.441435452e-04 -1.073354410e-02 1.89e-12
0.0025000 1.50 1.630751324182e-05 1.630438450412e-05 -1.918586639e-04 -5.535384271e-03 4.31e-12
0.0025000 1.75 1.432652789881e-05 1.431615554235e-05 -7.239965281e-04 -2.001634334e-03 5.17e-12
0.0025000 2.00 1.258277815518e-05 1.256637061436e-05 -1.303968060e-03 -1.303968060e-03 4.83e-12
0.0025000 2.25 1.119063889055e-05 1.117010721276e-05 -1.834719000e-03 -1.834719000e-03 1.50e-11
0.0025000 2.50 1.007756531238e-05 1.005309649149e-05 -2.428048852e-03 -2.428048852e-03 6.55e-12
0.0025000 2.75 9.167445417175e-06 9.139178628625e-06 -3.083387712e-03 -3.083387712e-03 5.40e-12
0.0025000 3.00 8.409544692043e-06 8.377580409573e-06 -3.800952803e-03 -3.800952803e-03 1.92e-12
0.0025000 3.25 7.768734678126e-06 7.733151147298e-06 -4.580350894e-03 -4.580350894e-03 3.32e-12
0.0025000 3.50 7.219928205305e-06 7.180783208205e-06 -5.421798664e-03 -5.421798664e-03 1.89e-12
0.0025000 3.75 6.744725590916e-06 6.702064327658e-06 -6.325129567e-03 -6.325129567e-03 3.15e-12
0.0025000 4.00 6.329327242147e-06 6.283185307180e-06 -7.290180015e-03 -7.290180015e-03 1.99e-12
uniform_maxima
p=0.0200000 max_abs_rel=5.745441071500e-02 at_delta=4.00
p=0.0100000 max_abs_rel=2.894814593187e-02 at_delta=4.00
p=0.0050000 max_abs_rel=1.453973136990e-02 at_delta=4.00
p=0.0025000 max_abs_rel=7.290180014772e-03 at_delta=4.00
uniform_error_orders=0.988946702,0.993470335,0.995974271
delta=0.0 error_orders=1.019828408,1.014232883,1.010194172
delta=1.0 error_orders=1.033375634,1.031980772,0.975802641
delta=2.0 error_orders=0.999111663,0.993887220,0.992691197
delta=3.0 error_orders=0.994983265,0.995537925,0.996284602
delta=4.0 error_orders=0.988946702,0.993470335,0.995974271
published_fixture_max_abs_delta=2.116e-09
ALL_CHECKS_PASSED
```

## Result

The uniform grid maxima occur at (delta=4):
[
egin{array}{c|c}
p&E_infty(p)\ hline
0.02&5.7454411	imes10^{-2}\
0.01&2.8948146	imes10^{-2}\
0.005&1.4539731	imes10^{-2}\
0.0025&7.2901800	imes10^{-3}
end{array}
]
with successive orders (0.98895,0.99347,0.99597). Thus, on the tested grid (0ledeltale4),
[
E_infty(p)=O(p)
]
to numerical resolution. Pointwise orders at (delta=0,1,2,3,4) also approach one. This is evidence for a first-order *relative* remainder uniformly across the tested crossover window, not a proof outside the grid or beyond these (p)-values.

The cap correction is essential near the parallel limit: at (p=0.01,delta=0), the relative error improves from (-5.3841%) without the cap to (+0.14374%) with it. Beyond (delta=2), the cap contribution is zero and the negative error grows monotonically across this grid, locating the next useful analytic target: the (O(p^3)) correction to the line-dominated branch.

## Full executable Python source

```python
#!/usr/bin/env python3
"""Uniform-remainder audit for two near-contact 4D segment capsules.

GEN/DERIVED Euclidean set geometry.  Each capsule is the radius-R
neighborhood of a line segment of half-length L in R4.  This script evaluates
the exact two-dimensional reduced overlap integral and audits the published
fixed-delta near-contact expansion.  It asserts no interaction or force law.
"""

from __future__ import annotations

import math

import numpy as np
from scipy.integrate import quad
from scipy.special import betainc, gamma

R = 1.2
L = 1.0
P_VALUES = (0.02, 0.01, 0.005, 0.0025)
DELTAS = tuple(float(x) for x in np.arange(0.0, 4.0001, 0.25))
GL_ORDER = 800
ATOL = 2.0e-12
RTOL = 3.0e-9

GL_X, GL_W = np.polynomial.legendre.leggauss(GL_ORDER)
U = R * GL_X
UW = R * GL_W


def disk_lens_area(r1: np.ndarray, r2: np.ndarray, d: float) -> np.ndarray:
    """Vectorized exact intersection area of pairs of disks."""
    out = np.zeros_like(r1)
    positive = (r1 > 0.0) & (r2 > 0.0)
    contained = positive & (d <= np.abs(r1-r2))
    out[contained] = math.pi * np.minimum(r1[contained], r2[contained]) ** 2
    proper = positive & (d < r1+r2) & ~contained
    if np.any(proper):
        a1, a2 = r1[proper], r2[proper]
        ca = np.clip((d*d+a1*a1-a2*a2)/(2.0*d*a1), -1.0, 1.0)
        cb = np.clip((d*d+a2*a2-a1*a1)/(2.0*d*a2), -1.0, 1.0)
        rad = (-d+a1+a2)*(d+a1-a2)*(d-a1+a2)*(d+a1+a2)
        out[proper] = (a1*a1*np.arccos(ca) + a2*a2*np.arccos(cb)
                       - 0.5*np.sqrt(np.maximum(0.0, rad)))
    return out


def nball_lens(n: int, d: float) -> float:
    """Equal-radius n-ball lens volume."""
    if d >= 2.0*R:
        return 0.0
    unit = math.pi ** (n/2) * R**n / gamma(n/2+1)
    x = 1.0 - (d/(2.0*R))**2
    return float(unit * betainc((n+1)/2, 0.5, x))


def parallel_exact(p: float) -> float:
    d = 2.0*R-p
    return 2.0*L*nball_lens(3, d) + nball_lens(4, d)


def capsule_volume(p: float, delta: float) -> tuple[float, float]:
    """Exact reduced quadrature after analytic integration over (y,z)."""
    if delta == 0.0:
        return parallel_exact(p), 0.0
    d = 2.0*R-p
    theta = delta*math.sqrt(R*p)/L
    s, c = math.sin(theta), math.cos(theta)

    def outer(t: float) -> float:
        end_a = max(abs(t)-L, 0.0)
        r1sq = R*R-U*U-end_a*end_a
        long_b = U*s+t*c
        perp_b = U*c-t*s
        end_b = np.maximum(np.abs(long_b)-L, 0.0)
        r2sq = R*R-perp_b*perp_b-end_b*end_b
        r1 = np.sqrt(np.maximum(0.0, r1sq))
        r2 = np.sqrt(np.maximum(0.0, r2sq))
        return float(UW @ disk_lens_area(r1, r2, d))

    # A's capsule vanishes outside this t range.  Explicit breakpoints help
    # the adaptive outer rule resolve A's cylindrical-to-cap transitions.
    value, error = quad(outer, -L-R, L+R, epsabs=ATOL, epsrel=RTOL,
                        limit=300, points=[-L, L])
    return value, error


def shape(delta: float) -> float:
    if delta <= 2.0:
        return 1.0-delta**2/6.0+delta**4/80.0
    return 16.0/(15.0*delta)


def cap_shape(delta: float) -> float:
    return max(0.0, 1.0-delta**2/4.0) ** 2.5


def asymptotic(p: float, delta: float, include_cap: bool = True) -> float:
    leading = math.pi*R*L*p*p*shape(delta)
    if include_cap:
        leading += (8.0*math.pi/15.0)*R**1.5*p**2.5*cap_shape(delta)
    return leading


def convergence_order(errors: list[float]) -> list[float]:
    return [math.log(errors[i]/errors[i+1], 2.0)
            for i in range(len(errors)-1)]


def main() -> None:
    records: dict[float, list[tuple[float, float, float, float]]] = {}
    print("4D capsule uniform-remainder audit")
    print(f"R={R} L={L} GL_order={GL_ORDER} deltas={len(DELTAS)}")
    print("p delta exact asymptotic relative_error no_cap_relative_error quad_error")
    for p in P_VALUES:
        rows = []
        for delta in DELTAS:
            exact, qerr = capsule_volume(p, delta)
            approx = asymptotic(p, delta, True)
            no_cap = asymptotic(p, delta, False)
            rel = (approx-exact)/exact
            rel0 = (no_cap-exact)/exact
            rows.append((delta, exact, rel, rel0))
            print(f"{p:.7f} {delta:.2f} {exact:.12e} {approx:.12e} "
                  f"{rel:+.9e} {rel0:+.9e} {qerr:.2e}")
        records[p] = rows

    max_errors = []
    print("uniform_maxima")
    for p in P_VALUES:
        rows = records[p]
        j = int(np.argmax([abs(row[2]) for row in rows]))
        delta, _, rel, _ = rows[j]
        max_errors.append(abs(rel))
        print(f"p={p:.7f} max_abs_rel={abs(rel):.12e} at_delta={delta:.2f}")
    orders = convergence_order(max_errors)
    print("uniform_error_orders="+",".join(f"{x:.9f}" for x in orders))

    # Pointwise orders at and around the matching point delta=2.
    for target in (0.0, 1.0, 2.0, 3.0, 4.0):
        errs = []
        for p in P_VALUES:
            row = records[p][DELTAS.index(target)]
            errs.append(abs(row[2]))
        print(f"delta={target:.1f} error_orders="
              + ",".join(f"{x:.9f}" for x in convergence_order(errs)))

    # Published fixture cross-checks.
    expected = {0.5: 0.000379729596074, 1.0: 0.000329155679280,
                2.0: 0.000202106232054, 3.0: 0.000136098740788}
    fixture_deltas = []
    for delta, reference in expected.items():
        exact = records[0.01][DELTAS.index(delta)][1]
        fixture_deltas.append(abs(exact-reference))
    print(f"published_fixture_max_abs_delta={max(fixture_deltas):.3e}")

    # The cap term must improve the parallel approximation at every p.
    for p in P_VALUES:
        row = records[p][0]
        assert abs(row[2]) < abs(row[3])
    # This is an independent cross-solver check, not a bitwise identity test:
    # the archived fixture used a different quadrature.  The tolerance is
    # absolute and is <2e-5 relative even at the smallest fixture volume.
    assert max(fixture_deltas) < 4.0e-9
    assert max(max_errors) < 0.08
    assert min(orders[-2:]) > 0.75
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

