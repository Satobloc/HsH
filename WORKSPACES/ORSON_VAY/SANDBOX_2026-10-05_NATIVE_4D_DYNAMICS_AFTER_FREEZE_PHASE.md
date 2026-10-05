# ORSON VAY SANDBOX — 2026-10-05 — Freeze-the-block correction and native 4D dynamics

## Source boundary
Old archive read:
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/HsH ARCHITECTING.txt — lines 1–900 requested/read.
Key useful material actually encountered: battery/4D-solenoid discussion, distinction between chirality cancellation and collective attenuation, Kelvin-vortex reinterpretation, macro/fundamental helix analogy, and explicit user correction that worldlines should be treated as worldtubes.

Current HsH read:
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D_THEORIZING.txt — lines 1201–2400 requested/read.
Key useful material: guitar-string/vibrating-filament construction, transverse trace on resolving surface, Lissajous/helical projection discussion. Much of the assistant commentary in this historical conversation overclaimed equivalence to string-theory fermion modes; treat those claims as historical assistant output, not source facts.
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt — lines 1–1400 requested/read.
Key useful material: Euclidean R4 bulk, SO(4) scale-rotation UI, finite-core worldtubes, bending action, resolving surface, recursive state updates, current HsH separation of Electrogravity and Interbraid. Historical target constants/fitted closures ignored.

## Nathan correction now made explicit
“Freeze the block, move the slice” was an operational inverse-mapping phase. It was not an ontological claim and not a permanent restriction on H(s)H. Current forward theory must allow native 4D dynamics once the known-physics map is sufficiently constrained.

## Sandbox inference
Keep two maps distinct:
1. Native dynamics: X -> D4[X]
2. Readout/coarse-graining: X -> R_h[X]
Do not use readout artifacts as substitutes for genuine 4D dynamics.

A minimal native worldtube candidate is
S[X]=∫ dλ [ μ/2 |∂_λ X|^2 + κ/2 |∂_s^2 X|^2 + T/2 |∂_s X|^2 + V_hol(X) + V_medium(X,u) + U_braid ].
The old vibrating-filament construction then becomes a real dynamical limit, not merely a frozen-history visualization.

## Immediate discriminator
For a free small-amplitude transverse mode y(s,λ) around a straight tube, the quadratic action gives
μ y_{λλ} + κ y_{ssss} - T y_{ss} = 0,
so plane waves satisfy
ω^2(k) = (T/μ) k^2 + (κ/μ) k^4.
This provides a clean way to separate native propagation from readout filtering. A resolving kernel multiplies the observed mode by its transfer function, but cannot change the underlying dispersion relation unless observer coupling backreacts.

Failure condition: if the current HsH action cannot produce a stable, finite-energy propagation law for small transverse perturbations without inserting particle labels or fitted constants, the worldtube dynamics is not yet closed enough.

Next solver test: implement one finite-core tube, excite a transverse mode packet, compare (a) true 4D propagation, (b) finite-slab observation, and (c) coarse-grained effective stress. Track dispersion, group velocity, packet broadening, and readout bias separately.