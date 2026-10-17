# Orson Vay | Pre-review standard-control reconstruction for inspiral pitch laws | 2026-10-11

**Status:** SANDBOXED / independent control calculation only. This is NOT the hostile review of HSH_RESOURCES issue #4 because Paper A has not yet been recovered/read in full.

## Common dimensionless pitch definition

For an adiabatically shrinking circular orbit, define
[
p equiv left|rac{dr}{r,dphi}ight| = rac{|dot r|}{rOmega} = rac{|dot r|}{v}.
]

This single definition lets the gravitational and electromagnetic cases be compared without identifying their force laws.

## G: Newtonian circular binary + quadrupole radiation

Standard leading-order circular inspiral:
[
dot r=-rac{64}{5}rac{G^3mu M^2}{c^5 r^3},
]
where (M=m_1+m_2), (mu=m_1m_2/M), and (
u=mu/M).

For circular motion,
[
v^2=rac{GM}{r},qquad eta=rac vc.
]

Then
[
rac{|dot r|}{c}
=rac{64}{5}
urac{G^3M^3}{c^6r^3}
=rac{64}{5}
ueta^6.
]

Divide by (v/c=eta):
[
oxed{p_G=rac{64}{5}
ueta^5.}
]

Thus the issue #4 headline (64/5,
ueta^5) is exactly the standard leading-order quadrupole circular-inspiral result expressed as radial loss per tangential orbital arclength.

Illustrative Earth-Sun control using (G=6.67430	imes10^{-11}), (M_odot=1.98847	imes10^{30},mathrm{kg}), (M_oplus=5.9722	imes10^{24},mathrm{kg}), (r=1,mathrm{AU}=1.495978707	imes10^{11},mathrm m), (c=299792458,mathrm{m/s}):
- (etaapprox9.93527	imes10^{-5})
- (
uapprox3.00340	imes10^{-6})
- (p_Gapprox3.72152	imes10^{-25})

These numbers are only a scale check.

## E: Coulomb circular orbit + Larmor radiation

Let (k=1/(4piepsilon_0)). For a light charge (q) in a circular Coulomb orbit about fixed (Q):
[
rac{mv^2}{r}=rac{k|qQ|}{r^2}
quadRightarrowquad
k|qQ|=mv^2r.
]

The orbital energy is
[
E=-rac{k|qQ|}{2r},
qquad
rac{dE}{dr}=rac{k|qQ|}{2r^2}.
]

The nonrelativistic Larmor power is
[
P=rac{q^2a^2}{6piepsilon_0 c^3}
=rac23 kq^2rac{v^4}{r^2c^3},
]
using (a=v^2/r).

Energy balance ( (dE/dr)dot r=-P ) gives
[
|dot r|
=rac43left|rac qQight|rac{v^4}{c^3}.
]

Therefore
[
rac{|dot r|}{c}
=rac43left|rac qQight|eta^4,
]
and dividing by (eta):
[
oxed{p_E=rac43left|rac qQight|eta^3.}
]

So the issue #4 headline ((4/3)|q/Q|eta^3) is likewise the standard leading-order nonrelativistic Coulomb+Larmor result under the same pitch definition.

For a classical electron-proton circular orbit evaluated at the Bohr-speed scale (etaapproxalphaapprox7.29735	imes10^{-3}) and (|q/Q|=1):
[
p_Eapprox5.18125	imes10^{-7}.
]

Again this is a scale/control calculation, not an endorsement of a literal radiating Bohr atom.

## What is established before reading Paper A

1. Both advertised pitch laws are independently recoverable from well-understood leading-order physics.
2. Their exponents differ for a reason: (|dot r|/csimeta^6) for leading quadrupole gravitational radiation and (simeta^4) for Larmor radiation; converting to pitch divides each by one factor of (eta).
3. The shared object is the dimensionless geometry (p=|dr|/(r,dphi)).
4. Therefore a paper that merely reproduces these two laws has a sound benchmark but has not yet established a new SAT/H(s)H result.
5. Novel content, if any, must be in the 4D embedding, mass-substitution maps, cross-scale fingerprint, damped-oscillator interpolation, or a new held-out prediction. Those remain unreviewed until Paper A is recovered.

## Review gate

Do not submit issue #4 verdict until the complete Paper A package is recovered and read. This note is only a standard-physics control against which Paper A's derivation can be audited.
