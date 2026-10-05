# Meridian XCVIII — Covariant winding quantization / normal-frame holonomy

**Status:** SANDBOXED. No physical claim. This is a reconstruction of a historical SAT intuition in current H(s)H moving-frame language.

## Tranche source facts kept separate

Newly supplied historical conversation \`Quantum discreteness explanation — raw.json\` contains Nathan-submitted statements that:
- discrete quantum units were being associated with the number of coils / turns of a filament;
- coil radius/stretch could still vary continuously;
- "click rate" was pictured mechanically as a timesheet/filament loading-and-snapback cycle.

Newly supplied \`Reasoning with SAT-HSH Skill — raw(3).json\` also contains the later architectural correction that the theory should remain worldline/worldtube at core rather than be promoted into a fundamental field ontology.

Those are source facts. The construction below is a new Meridian translation.

## Selected normal two-plane

A regular curve in \(\mathbb R^4\) has a three-dimensional normal bundle. A scalar helix phase exists only after a two-plane
\[
\Pi(s)\subset N_s
\]
is selected along the curve.

Choose an oriented orthonormal frame \((N_1,N_2)\) for that plane and write the transverse director
\[
n_\theta(s)=\cos\theta(s)\,N_1(s)+\sin\theta(s)\,N_2(s).
\]

Define the SO(2) normal-frame connection
\[
\omega_s=\langle N_1,\nabla_s N_2\rangle.
\]

Under a local frame rotation by \(\phi(s)\),
\[
\tilde\theta=\theta-\phi,
\qquad
\tilde\omega_s=\omega_s+\phi'.
\]

Therefore the local combination
\[
\boxed{
\nu(s)=\theta'(s)+\omega_s
}
\]
is gauge invariant:
\[
\tilde\nu=\nu.
\]

This is the first clean candidate for what the old "coil rate" should mean if the normal frame itself is allowed to rotate.

## Closed-loop integer

If the physical transverse director returns to itself after one closed carrier loop,
\[
n_\theta(L)=n_\theta(0),
\]
then
\[
\boxed{
N=\frac1{2\pi}\oint \nu(s)\,ds\in\mathbb Z.
}
\]

A frame gauge with its own integer winding can shift a full turn between the bare angle contribution
\[
\frac1{2\pi}\oint \theta' ds
\]
and the frame-connection contribution
\[
\frac1{2\pi}\oint \omega_s ds,
\]
while their sum \(N\) remains unchanged.

### Scripted fixture

A synthetic loop was built with physical winding \(N=3\). Then the normal frame was gauge-rotated through one additional full turn.

Before the gauge change:
\[
\frac1{2\pi}\oint\theta' ds=3,\qquad
\frac1{2\pi}\oint\omega_s ds\approx0.
\]

After the gauge change:
\[
\frac1{2\pi}\oint\tilde\theta' ds=2,\qquad
\frac1{2\pi}\oint\tilde\omega_s ds=1.
\]

In both gauges:
\[
\boxed{
\frac1{2\pi}\oint\nu ds=3
}
\]
to numerical precision, with maximum pointwise invariance residual \(5.7\times10^{-13}\).

The Class-P plot was generated as \`/mnt/data/meridian_xcviii_covariant_winding.png\` in the working session.

## Why this matters for the old "bigger/smaller quanta?" question

The integer \(N\) is topological/holonomic. It does **not** freeze continuous geometric moduli such as radius, pitch, local stretch, constitutive stiffness, or total length.

A minimal twist energy on the selected plane would use the invariant density,
\[
E_{\rm twist}
=
\frac{C}{2}\int_0^L \nu(s)^2\,ds.
\]

Inside a fixed sector \(N\), the minimum for constant \(C\) and \(L\) is the uniform solution
\[
\nu=\frac{2\pi N}{L},
\]
giving
\[
\boxed{
E_N^{\rm min}
=
\frac{2\pi^2 C}{L}N^2.
}
\]

But if \(C\), \(L\), radius, pitch, or other shape variables are allowed to relax, the energy of a sector changes continuously even though \(N\) remains integer.

So the historical SAT intuition can be sharpened:

\[
\boxed{
\text{discrete winding sector} \neq \text{fixed geometric size or equal energy spacing}.
}
\]

This is a cleaner resolution than treating "one coil" itself as a fixed universal quantum.

## Click-rate separation

The integer winding/holonomy above supplies a **sector label**. It does not by itself supply transition kinetics.

A literal bend/load/snapback "click" requires an additional barrier or bifurcation that permits
\[
N\rightarrow N\pm1.
\]

Therefore:
- winding/holonomy can explain why sectors are discrete;
- a timesheet/worldtube constitutive model must separately explain the transition barrier, rate, dissipation/redistribution, and whether such transitions are physically allowed.

Do not identify holonomy quantization with snapback dynamics without that derivation.

## R4 failure gate

For a generic curve in \(\mathbb R^4\), the normal bundle is rank 3 with structure group SO(3), not automatically SO(2).

The scalar formula above is valid only if H(s)H supplies a dynamically or geometrically selected normal two-plane \(\Pi(s)\).

If no such globally meaningful plane exists, the correct object is the non-Abelian normal-bundle holonomy
\[
\boxed{
W[\Gamma]=\mathcal P\exp\oint_\Gamma A_s\,ds\in SO(3),
}
\]
and "coil count" cannot be treated as one scalar integer without further reduction.

That is the sharp failure condition.

## Compact ᚼ implication

On a selected coiling plane, one plausible local ᚼ grammar is now
\[
\boxed{
ᚼ:\quad (\theta,\omega_s)\mapsto\nu=\theta'+\omega_s.
}
\]

This turns a coordinate-dependent coil angle plus frame rotation into one invariant local winding density.

The natural higher-order/global readout is then the loop holonomy / winding sector rather than bare turn count.

Nothing here promotes a particle assignment, historical numerical target, or a fundamental field ontology.
