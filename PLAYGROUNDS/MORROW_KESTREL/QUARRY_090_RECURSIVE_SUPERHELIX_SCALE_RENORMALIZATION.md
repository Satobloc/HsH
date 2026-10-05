# QUARRY_090 — Recursive superhelix smoothness requires scale renormalization

Status: sandbox / noncanonical

## Provenance consumed
- Old archive: `SAT 2026 ROUNDUP DOCS/GLOSS_2026.txt`, blob `8e00e3b23b0b443a40769a12c8eca22ae3f20a9b`; lines 1–900 requested/read. Historical claim extracted: recursive superhelix = fourth-order differentiable path used to stabilize higher-order torsion derivatives / prevent curvature spikes.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 ROUNDUP DOCS/SAT26 MATH ROUNDUP.txt`, blob `1f690930cdd585e0db6e7c29cdfcd6e25d49127e`; lines 1–1000 requested/read. Current imported construction: recursive harmonic worldline, UI rotation/expansion generator, curvature-squared operational action and fourth-order EL equation.

## Independent build
Use a unit circular carrier C(u) with periodic normal frame n1,n2 and a daughter lift
[
X_m(u)=C(u)+\epsilon[\cos(mu)n_1(u)+\sin(mu)n_2(u)].
]
This curve is C-infinity for every finite m, so differentiability alone does not bound curvature.

Numerical periodic finite-difference calculation at epsilon=0.08:
m=1: kappa_max=1.0064
m=2: 1.1745
m=4: 1.8600
m=8: 3.9340
m=16: 7.8721
m=30: 10.7586

Thus recursive nesting can be perfectly smooth while generating arbitrarily severe high-frequency bending.

For a curvature cap kappa_max <= 5, the first cap-crossing amplitude at high m obeys approximately
[
\epsilon_c m^2 \approx 4.27,
]
so
[
\epsilon_c \propto m^{-2}.
]

## Sandbox inference
A viable recursive H(s)H hierarchy needs amplitude-frequency renormalization, not merely recursive differentiability. For nested levels j with frequency omega_j and radius/amplitude epsilon_j, a necessary high-frequency condition is roughly
[
\epsilon_j\,\omega_j^2 \lesssim K_j
]
for the relevant curvature budget K_j. If omega_j grows geometrically, amplitudes must shrink at least quadratically in frequency unless neighboring levels cancel covariantly.

This suggests a possible physical recursion rule: ᚼ may have to rescale daughter radius when it raises winding frequency.

## Failure condition
If the full 4D transported-frame calculation produces systematic cancellations absent in this 3D reduced fixture, the m^-2 ceiling need not survive. Conversely, if actual H(s)H recursive lifts violate the curvature budget under refinement, the historical claim that recursion itself regularizes curvature is false.

## Next solver
Run the same sweep on the certified 4D helix->superhelix fixture using exact derivatives and the full SO(4) transported frame. Measure max curvature, curvature derivative, jerk and action level-by-level. Blindly fit epsilon_j versus omega_j at the stability boundary. Compare fixed-amplitude recursion against epsilon~omega^-2 and action-minimized recursion.

Carry-forward discriminator:
[
\boxed{\text{smooth recursion} \neq \text{bounded-curvature recursion}.}
]
