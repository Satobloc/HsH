# CODE 000 | Hale | Continuous UI moving-double-point address gate | 2026-10-25T03Z

Task: `calc48-20261025T03Z-hale-moving-doublepoints-001`.
Classification: `INTERNALLY_CHECKED` mathematical construction; physical application `UNRESOLVED`; no BEDROCK promotion, no CODATA endpoint.

## Source and scope

The historical UI map `y(lambda)=r(lambda) R(lambda) x0`, `R in SO(4)`, occurs in `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt` (Git blob `1854995be3311f565739f2be64269cbb0385a82f`). Original user wording is in `_AUTO_EXTRACTED_TEXT/Universal Indicatrix in my words CHARACTERIZATION (Nolat).txt` (blob `a1707dffe3502d507bc405d4087a3476fc1d6cce`). Current HsH code `tools/whirligig_rq/ui4d.py` (blob `6dc51596150467261086705f95b16ba92812c0c6`) implements six-plane SO(4) lifts. This test follows Ravel's earlier UI intersection gate, published as issue #427, but does not assume its conjectured dynamics.

## Exact construction and proof

For a dimensionless parameter t, physical length ell>0, define

`X(t)=ell*(1/2+sin(t), sin(2t), t/(2*pi)+(1/4)*cos(t), 0)`.

This is one smooth, regular R4 curve for all real t. Its complete unordered self-intersection pairs are exactly

`t0_n=2*pi*n`, `t1_n=(2*n+1)*pi`, `n in Z`, at

`p_n=ell*(1/2,0,n+1/4,0)`.

Proof: equality of x implies `t2=t1 (mod 2*pi)` or `t2=pi-t1 (mod 2*pi)`. In the second case equality of y requires `sin(2*t1)=0`, reducing nontrivial pairs to even/odd multiples of pi. Equality of z selects precisely the adjacent even/odd pair with the same n. Phase-identical pairs from different periods differ in z by an integer. The x,y tangent minor at each double point is 4, so its two tangent directions are independent (but NOT ambient-R4 transverse). Consecutive addresses are separated by exactly ell. No physical law is asserted.

Because `(x,y)` never vanishes, set `rxy=sqrt(x^2+y^2)`, `r=sqrt(rxy^2+z^2)`, `theta=atan2(y,x)` (continuously unwrapped), `psi=atan2(z,rxy)`. Then `X(t)=ell*r(t)*R12(theta(t))*R13(psi(t))*e1` exactly: no translation primitive is required. `r` here is dimensionless; ell restores units.

## Stability discriminator

The arbitrarily small perturbation `X_epsilon(t)=X(t)+ell*epsilon*cos(t)*e4` removes ALL self-intersections for any nonzero epsilon. At every old candidate pair, the fourth-coordinate difference is `2*ell*epsilon`; all other potential pairs were already excluded by the first three coordinates. Therefore the moving-address set is mathematically constructible but not robust under unconstrained four-dimensional perturbations. A finite-core tube along this self-crossing centerline cannot be globally embedded at positive radius; any H(s)H physical use requires explicit intersection/contact interpretation.

## Executed verification

Python/SymPy/NumPy checked exact crossing equality and tangent minors for n=-3..3, exact fourth-axis separation, and 6001-point SO(4) reconstruction. Maximum absolute reconstruction residual: `3.6637359812630166e-15`; sampled orthogonality residual: `2.220446049250313e-16`; sampled determinant residual: `4.440892098500626e-16`. All assertions passed. Executed Python SHA-256: `d22ba5851a80dac149dfab49d3797d58543634e9c4ae1abb236cdd9e813e8c30`.

Status: `INTERNALLY_CHECKED` geometry, `UNRESOLVED` physical dynamics and finite-core intersection, CODATA not applicable, not a Factory Floor H(s)H candidate. No empirical inputs, fitted parameters, or new primitives.
