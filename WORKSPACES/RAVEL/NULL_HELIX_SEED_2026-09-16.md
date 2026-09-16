# Null-helix neutral seed pass — 2026-09-16

**Status:** RAVEL SANDBOX / CANDIDATE THEORY WORK — not canon, not promoted H(s)H

**Dependency discipline:** The construction below is derived directly from the current Ravel separation `a != epsilon != R_coil` plus ordinary Minkowski geometry. External zitterbewegung literature was checked only *after* the construction was obtained, as prior-art/standard-comparison control; it is not an input to the derivation.

## 1. Why this construction

`KERR_SCALE_SLICE_TRIANGULATION_2026-09-16.md` showed that a simultaneous 4D ring support of radius `a` is not generically hidden by a timesheet tilt: a central hyperplane cut still exposes the diameter scale.

That does **not** establish the same result for a time-directed helix. A helix is a history, not a simultaneous ring. A timesheet can intersect its centerline locally at one event.

This is exactly the distinction the current H(s)H object hierarchy requires us to test:

- full 4D history/worldtube;
- local timesheet/readout slice;
- coarse observed trajectory.

---

## 2. Simplest rest-frame null helix

Use `w=ct` and Minkowski signature `(-,+,+,+)`.

Let

\[
H(s)=
\left(
 s,
 a\cos(s/a),
 a\sin(s/a),
 0
\right),
\]

where `s` has dimensions of length.

Then

\[
H'(s)=
\left(
1,
-\sin(s/a),
\cos(s/a),
0
\right).
\]

Its Minkowski tangent norm is

\[
\eta(H',H')
=-1+\sin^2(s/a)+\cos^2(s/a)=0.
\]

Therefore the carrier curve is exactly **null**.

But its cycle-averaged/coarse centerline is

\[
C(s)=(s,0,0,0),
\]

which is timelike.

So pure Minkowski geometry already permits

\[
\boxed{
\text{null microscopic history}
\longrightarrow
\text{timelike coarse trajectory}
}
\]

without adding a field or changing the metric.

---

## 3. The Kerr rotation scale fixes the rest helix frequency

Take the live standard-control scale

\[
a=\frac{J}{mc}.
\]

For `J=ħ/2`,

\[
a=\frac{\hbar}{2mc}.
\]

The rest helix phase is

\[
\phi=s/a=ct/a,
\]

so

\[
\omega_0=\frac{c}{a}
=\frac{2mc^2}{\hbar}.
\]

For the electron this is approximately

\[
\omega_0\approx1.55\times10^{21}\ \mathrm{s}^{-1}.
\]

The corresponding spatial speed around the helix is

\[
a\omega_0=c.
\]

Thus the same `a` that enters the Kerr spin/mass relation generates a lightlike internal circulation with the familiar `2mc^2/ħ` frequency scale.

This does not derive the particle mass; `m` is still present in the input definition of `a`. It does show that the Kerr rotation scale and the simplest null Minkowski helix are kinematically compatible without an extra numerical parameter.

---

## 4. Spin bookkeeping

If a null circulating energy packet carries total rest-frame energy

\[
E=mc^2,
\]

then its momentum magnitude is

\[
p=E/c=mc.
\]

A circulation radius `a` then gives

\[
L=ap=amc=J.
\]

For `a=ħ/(2mc)`,

\[
L=\frac{\hbar}{2}.
\]

So the same minimal geometry closes the ordinary dimensional spin relation exactly.

This is energy/momentum bookkeeping, not yet an H(s)H derivation of spin statistics or of the Dirac equation.

---

## 5. Lorentz-boosted helix

Boost the rest construction along the `z` axis with velocity `beta c`.

Writing `gamma=(1-beta^2)^(-1/2)`, the boosted history can be parameterized by the rest-centerline proper-length parameter `s` as

\[
H_\beta(s)=
\left(
\gamma s,
 a\cos(s/a),
 a\sin(s/a),
 \gamma\beta s
\right).
\]

Its tangent satisfies

\[
-\gamma^2
+\sin^2(s/a)+\cos^2(s/a)
+\gamma^2\beta^2
=0,
\]

so the microscopic history remains null.

The coarse centerline is

\[
C_\beta(s)=(\gamma s,0,0,\gamma\beta s),
\]

with

\[
\eta(C_\beta',C_\beta')=-1.
\]

Thus the coarse trajectory is an ordinary timelike Minkowski worldline with velocity `beta c`.

Expressed in lab coordinate time,

\[
w=\gamma s,
\]

so the internal phase is

\[
\phi=\frac{s}{a}
=\frac{w}{\gamma a},
\]

and the internal rotation rate becomes

\[
\omega_\beta
=\frac{c}{\gamma a}
=\frac{\omega_0}{\gamma}.
\]

The internal clock therefore time-dilates automatically under the ordinary Lorentz boost of the same null helix.

No separate time-dilation rule was added.

---

## 6. Timesheet slicing changes the size question

For a standard timesheet

\[
\Sigma_{w_0}: w=w_0,
\]

the centerline helix has exactly one phase value and therefore one centerline intersection event.

That is categorically different from slicing a simultaneous ring support.

Therefore a history radius

\[
R_{\rm history}=a
\]

does **not by itself** imply that a single timesheet contains a material disk or ring of diameter `2a`.

If the physical support is a finite tube of local thickness `epsilon` around the helix, the instantaneous/readout footprint can in principle be controlled by `epsilon` and the local slice angle rather than by the full historical radius `a`.

This reopens a possibility the previous ring-slice pass deliberately left unresolved:

\[
\boxed{
a=R_{\rm history}
\quad\text{while}\quad
\epsilon\ll a
}
\]

without identifying `a` with hard excluded-volume size.

However, this does **not** automatically evade scattering/form-factor constraints. A coupling that follows the instantaneous circulating locus may still reveal the large radius when measurements integrate or resolve the cycle. The readout/coupling rule must be specified and tested rather than assumed.

---

## 7. What is genuinely gained

This minimal construction simultaneously supplies:

1. a null microscopic carrier;
2. a timelike coarse worldline;
3. the standard Kerr rotation scale `a=J/(mc)`;
4. for spin 1/2, the radius `a=ħ/(2mc)`;
5. the rest internal frequency `2mc^2/ħ`;
6. light-speed internal circulation;
7. Lorentz time dilation of the internal phase under axial boosts;
8. a clean distinction between historical radius `a` and local core thickness `epsilon`.

All eight arise from one Minkowski helix plus the already-declared Kerr spin/mass scale.

What it does **not** yet supply:

- a derivation of `m` rather than insertion of `m` into `a`;
- electric charge;
- the fine-structure constant;
- the anomalous magnetic moment;
- spin statistics / Pauli exclusion;
- a finite-core law for `epsilon`;
- Kelvin-like circulation dynamics;
- the measurement/readout law that decides whether `a` is experimentally visible as spatial extension.

---

## 8. Immediate next test

The next calculation should no longer ask vaguely whether `a` is a particle size.

It should compare two explicit support models under the same timesheet slicing:

### Model A — simultaneous ring support

The earlier ring construction, which exposes `2a` in a generic central slice.

### Model B — time-directed null helix with finite local tube thickness epsilon

A timesheet intersects one local phase of the helix; the local footprint is set by the tubular support/readout geometry.

Then calculate the observable form factor / effective spatial support each model would present under a declared measurement functional.

The first breaker question is:

> Can Model B keep the independently triangulated rotational scale `a` while satisfying pointlike lepton constraints without an ad hoc projection rule?

If yes, `a` remains viable as a history/rotation radius while `epsilon` carries genuine local nonintersection.

If no, the large Kerr/Compton-family `a` must remain a non-spatial phase/rotation parameter rather than a literal history radius.

---

## Prior-art / standard-comparison note — not a derivational input

After obtaining the construction above, a literature check found a close standard-adjacent precedent in David Hestenes' zitterbewegung interpretation of the Dirac electron: a lightlike helix with radius `ħ/(2mc)` centered on the Dirac-current streamline and internal frequency `2mc^2/ħ`.

Relevant sources include:

- D. Hestenes, `Reading the Electron Clock`, arXiv:0802.3227.
- D. Hestenes, `Zitterbewegung in Quantum Mechanics — a research program`, arXiv:0802.2728.

This means the null-helix kinematics above must not be treated as an H(s)H novelty claim. Its value here is different: it shows that the current Kerr/worldtube reconstruction has independently landed on a known Dirac-compatible geometric structure using the current H(s)H/Minkowski constraints.
