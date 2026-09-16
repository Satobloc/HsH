# Kerr particle-regime collision pass — 2026-09-16

**Status:** RAVEL SANDBOX / CANDIDATE THEORY WORK — not canon, not promoted H(s)H

## Purpose

Collide the dimensionless oblate Kerr geometry already derived in `KERR_SHELL_GEOMETRY_PASS_2026-09-16.md` with the actual electron-like over-extreme parameter regime, keeping standard Kerr/Kerr-Newman control geometry separate from H(s)H interpretation.

The immediate goal is to learn what standard geometry really leaves available before assigning any H(s)H carrier, shell, tension, charge or finite-core law.

---

## 1. Dimensionless oblate cross-section atlas

Let

\[
q\equiv r/a,
\qquad
E/a^2=q^2+\cos^2\theta.
\]

From the Euclidean embedding of the constant-`r` oblate coordinate surface,

\[
A/a=\sqrt{1+q^2},
\qquad
C/a=|q|.
\]

The dimensionless principal curvature magnitudes are

\[
a k_\theta
=
\frac{|q|\sqrt{1+q^2}}
{(q^2+\cos^2\theta)^{3/2}},
\]

\[
a k_\phi
=
\frac{|q|}
{\sqrt{1+q^2}\sqrt{q^2+\cos^2\theta}}.
\]

Therefore the full angular anisotropy is

\[
\boxed{
\mathcal A_K(q,\theta)
=
\left|\frac{k_\theta}{k_\phi}\right|
=
\frac{1+q^2}{q^2+\cos^2\theta}
}.
\]

Important limits:

\[
\mathcal A_K(q,0)=1,
\]

while

\[
\mathcal A_K\left(q,\frac{\pi}{2}\right)
=1+\frac{1}{q^2}.
\]

Thus the coordinate spheroids remain locally isotropic at the poles while developing arbitrarily large equatorial shape anisotropy as the ring limit is approached.

This is geometry only. It is not a material stress, stiffness or shell law.

---

## 2. Electron-like Kerr is overwhelmingly over-extreme

Use the ordinary Kerr length parameters

\[
M_g=\frac{Gm}{c^2},
\qquad
a=\frac{J}{mc}.
\]

For a spin-1/2 lepton with `J=ħ/2`,

\[
a=\frac{\hbar}{2mc}.
\]

Define

\[
\mu\equiv \frac{M_g}{a}
=\frac{2Gm^2}{\hbar c}.
\]

For the electron,

\[
a_e\approx1.9308\times10^{-13}\ \mathrm m,
\]

\[
M_{g,e}\approx6.7648\times10^{-58}\ \mathrm m,
\]

\[
\boxed{\mu_e\approx3.50\times10^{-45}}.
\]

The ordinary Kerr horizon condition is `M_g^2 >= a^2`, or `mu >= 1`. The electron-like Kerr control is therefore not remotely a black hole.

For uncharged over-extreme Kerr, the stationary-limit condition is

\[
M_g^2-a^2\cos^2\theta\ge0,
\]

so any stationary-limit surface can exist only in the angular belt

\[
|\cos\theta|\le\mu.
\]

For the electron this belt has angular scale ~`3.5e-45 rad` about the equator, and its exact-equator radial outer scale is only `2M_g ~ 1.35e-57 m`.

Therefore the familiar black-hole ergosphere is not available as a particle-scale shell of order `a`.

This is a direct correction to loose earlier language that treated "ergosphere/shell anatomy" as though the ordinary black-hole structure survived at the electron scale.

---

## 3. Charged Kerr-Newman control is even sharper

For standard Kerr-Newman in geometrized units,

\[
\Delta=r^2-2M_g r+a^2+Q_g^2,
\]

with

\[
Q_g^2=\frac{G e^2}{4\pi\epsilon_0 c^4}.
\]

Define

\[
\chi^2\equiv\frac{Q_g^2}{a^2}.
\]

Using

\[
\alpha=\frac{e^2}{4\pi\epsilon_0\hbar c},
\]

and spin `ħ/2`,

\[
\boxed{\chi^2=2\alpha\mu}.
\]

For the electron,

\[
Q_g\approx1.38\times10^{-36}\ \mathrm m,
\]

\[
\chi\approx7.15\times10^{-24}.
\]

Because `Q_g >> M_g`, the Kerr-Newman stationary-limit discriminant

\[
M_g^2-a^2\cos^2\theta-Q_g^2
\]

is negative for every `theta`.

Hence the standard electron-like Kerr-Newman control has neither a horizon nor an ergosurface.

Again: this does not rule out an H(s)H finite-core worldvolume. It rules out simply importing the ordinary black-hole ergosphere and calling it that object.

---

## 4. A mass-independent normalized landmark: q = alpha

The Boyer-Lindquist Kerr-Newman time-azimuth coupling contains

\[
2M_g r-Q_g^2.
\]

Its sign changes at

\[
r_0=\frac{Q_g^2}{2M_g}.
\]

Substituting the SI definitions gives

\[
r_0
=\frac{e^2}{8\pi\epsilon_0 m c^2}
=\frac12 r_{\rm classical},
\]

and, since `a=ħ/(2mc)`,

\[
\boxed{\frac{r_0}{a}=\alpha}.
\]

Thus for any singly charged spin-1/2 lepton placed into the standard Kerr-Newman control geometry,

\[
\boxed{q_0=\alpha\approx1/137.036}
\]

independent of the lepton mass.

Numerically:

- electron: `r0 ≈ 1.409e-15 m`;
- muon: `r0 ≈ 6.81e-18 m`;
- tau: `r0 ≈ 4.05e-19 m`.

This radius is the standard Kerr-Newman `g_{t phi}=0` / turnaround landmark; it is not a horizon or ergosphere and should not be promoted into an H(s)H shell without a separate bridge.

But it is a very useful structural control because the dimensionless ratio is universal across the charged spin-1/2 lepton family.

---

## 5. Critical epistemic point: alpha is an excellent HOLDOUT, not an input

The relation `q0 = alpha` was obtained only after inserting the ordinary electric charge `e` into the Kerr-Newman control geometry.

Current H(s)H is trying to make charge emerge from filament/timesheet/Kelvin-like mutual dynamics rather than declaring standard electric charge to be a new primitive.

Therefore the right use of this result is:

> **Do not feed `e`, `alpha`, `r_classical`, or `q0=alpha` into the forward H(s)H construction. Preserve `q0=alpha` as a blinded/held-out target.**

If a charge-emergent finite-core/coil/timesheet construction independently generates a normalized transition, reversal, circulation or coupling radius near `q=alpha`, that would be informative.

If it does not, the standard Kerr-Newman coincidence remains merely a control identity and should not be retrofitted.

---

## 6. Consequence for the live H(s)H anatomy

The working decomposition is now sharper:

\[
\epsilon \neq a \neq R_{\rm coil}
\]

unless an independent relation identifies them.

- `a` = standard Kerr rotational/phase scale fixed by `(J,m)` and independently connected to magnetic moment;
- `epsilon` = genuine finite nonintersection/core thickness, still unknown;
- `R_coil` = persistent winding radius, still unknown;
- `Sigma` = timesheet/readout map;
- Kelvin-like response = separate live construction ingredient whose scale/reach must be derived rather than imported from an ergosphere picture.

The ordinary black-hole horizon/ergosphere does not provide the missing finite-core carrier in the particle-like regime.

---

## 7. Next forward calculation

The next internal H(s)H calculation should now be deliberately charge-blind.

Build the minimal neutral seed

`Kerr rotational scale a + finite core epsilon + persistent coil R_coil + timesheet intersection + Kelvin-like circulation`

without using `e`, `alpha`, the classical lepton radius or historical SAT charge formulas.

Ask whether conservation + closure + mutual filament/timesheet deformation forces any dimensionless radial or phase landmark

\[
q_* = \frac{r_*}{a}.
\]

Keep the standard Kerr-Newman result

\[
q_0=\alpha
\]

sealed as a holdout until that derivation freezes.

The first candidate construction should use only:

1. `a=J/(mc)` as the standard rotational scale under test;
2. finite-core nonintersection;
3. persistent winding/closure;
4. timesheet intersection geometry;
5. mutual energy/momentum bookkeeping (`always both`);
6. Kelvin-like circulation only to the extent independently required by the medium model.

A useful freeze condition is a dimensionless `q_*` or phase relation obtained before opening the `alpha` holdout.

---

## Standard-control references

- Kerr-Newman metric and horizon condition: Zimmerman et al., *Phys. Rev. D* 93, 044033 (2016), accepted manuscript: https://link.aps.org/accepted/10.1103/PhysRevD.93.044033
- Kerr-Newman turnaround radius `r=Q^2/(2M)`: A. J. S. Hamilton, *General Relativity, Black Holes, and Cosmology* (2026 course text), section 9.8: https://jila.colorado.edu/~ajsh/courses/phys7810_26/grbook_260224.pdf
- CODATA/NIST 2022 constants: https://physics.nist.gov/cuu/Constants/

