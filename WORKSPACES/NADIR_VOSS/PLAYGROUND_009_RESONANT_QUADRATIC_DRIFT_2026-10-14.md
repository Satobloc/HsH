# Nadir Voss | PLAYGROUND 009: resonant quadratic affine drift
**2026-10-14 02:12 UTC nominal s1.** Source: `WORKSPACES/NADIR_VOSS/nadir_second_order_noncommuting_drift_gate_20261013.py` (008). **Sandbox, not theory authority or physical validity.** New calculation extends previous k>=4 formula to k=0,1,2,3.

## Setup and derivation
Euclidean R4, s∈[0,2π] dimensionless, η dimensionless, ℓ=1 nm. Let J_ab e_a=e_b, J_ab e_b=−e_a, and
`Q'=Q[J12+2J34+η cos(ks) J23], t'=ℓ Qe1; Q(0)=I, t(0)=0.`
At η=0 both Q and t close. Writing q_j=Qe_j and z=q3^(1) in complex 12-plane, x=q1^(2) in that plane:
`z''+4z=exp(is)[cos(ks)+ik sin(ks)], z(0)=0, z'(0)=−i`;
`x''+x=cos(ks)z, x(0)=x'(0)=0`.
Thus `C2(k)=∫₀²π (1−cos s) cos(ks) z(s) ds` and `(t1+i t2)/ℓ=η² C2(k)+O(η⁴)`.

Let n±=1±k, A±=(1±k)/2. Then `z=−i sin(2s)/2+A+ F_(1+k)+A− F_(1−k)`, where
`F_n=[exp(ins)−cos(2s)−in sin(2s)/2]/(4−n²)`.
At n=±2 use the analytic limits
`F_2=−i[s exp(2is)−sin(2s)/2]/4`,
`F_−2=+i[s exp(−2is)−sin(2s)/2]/4`.

## Exact quadratic coefficients
```
k=0:    C2=−π/3
k=1:    C2=−17π/96 + i π²/8
k=2:    C2=+7π/10
k=3:    C2=−91π/480 + i π²/8
k>=4:   C2=−π(k²+3)/[2(k²−1)(k²−9)]
```
First-order e3 translation / (ηℓ): k=1,3 => −π/2; k=2 => +π; otherwise zero. At k=1 and k=3 the identical +π²/8 lateral e2 term comes from secular s exp(±2is) resonances. k=2 is a nonresonant but exceptional Fourier-overlap case: blindly extending the k>=4 rational expression gives 7π/30, **one third** of the correct 7π/10. As k→∞, C2~−π/(2k²)[1+13/k²+O(k⁻⁴)].

## Executed controls
- Green-kernel quadrature k=0..10 vs closed forms: max abs error **1.03e−15**.
- Full 4D DOP853 transport at k=0,1,2,3,4,5,7, η=±0.2, ±0.1, ±0.05, ±0.025: even η² coefficient errors contract ~4x per halving, as expected from O(η⁴) next term.
- At k=1, η=.025: numerical C2≈−0.5563101734+1.2333991227i; exact −0.5563236991+1.2337005501i.
- At k=3, η=.025: numerical C2≈−0.5954984315+1.2335528229i; exact −0.5955936072+1.2337005501i.
- η=0 frame/translation closure <1e−11; SO(4) orthogonality and parity controls passed.
- Commuting negative control J23→J12: t(2π)=0 for integer k>=2, verified k=2,3,4,7.
- **Boundary:** prescribed connection only, no physical/finite-core mechanism derived.

Reproducible local Python script `nadir_resonant_quadratic_drift_gate_20261014.py` includes all formulas, solver, tests and Class P geometry figure. Next: replace imposed J23 with an embedding-induced finite-core connection and recheck the resonant lateral drift.