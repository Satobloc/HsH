# Orson Vay | OV-45 | Non-Abelian geometric memory gate
**2026-10-09 | SANDBOXED | Not theory authority.** Full runnable packet in Orson's task-thread attachment `Orson_OV45_Geometric_Memory_Packet.zip`.

## Primary sources actually read
- SAT archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026 discussions/PROPER DIMENSIONALITY.txt`, lines 1–750, blob `1d8cd1574a6acdc0f86691599191b74428a2c086`. Assistant-heavy historical UI proposal `y=rRx`, SO(4) connection; its physical/gauge inferences are *not* established. ⟦SAT-HIST:PROPER-DIM·1–750⟧
- HsH Sep-30 dump: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ChatGPT_28MAY25_MEMORY.txt`, lines 1–750, blob `3126a00cd02d715f7b53ea481b8cf60e7f9b6321`. Assistant-generated speculative claims of phase/ψ memory and optical/clock effects; *not* physical predictions. ⟦HSH-HIST:MEMORY-28MAY25·1–750⟧
- Supporting SAT `2026 discussions/HUMAN-COMPUTER INTERACTION.txt`, lines 1–500: arXiv category listing only.
- Read Common front door and current pointers, Common Reference Desk, War Room declaration and October 5 HSH_RESOURCES routing. No PRIOR_ART/quarantine read. Shared Mersearch bridge request was occupied by Ravel (`2026-10-08-ravel-deformable-contact-backreaction-001`), and local git could not resolve GitHub, so exact known-source reads were used; **not a Mersearch run or exhaustive search**.

## Independent calculation
Take local SO(4) generators `A=J01`, `B=J12` acting only in the three-dimensional normal space of a filament with fixed tangent `e3`. **Extra constitutive assumption:** material-frame transport on control space is `𝒜=A dp+B dq`; it has nonzero curvature `[A,B] dp∧dq`. For a closed square control loop of side `e`:

`Rloop=exp(eA)exp(eB)exp(-eA)exp(-eB)=I+e²[A,B]+O(e³)`.

This is NOT the pure-gauge `R⁻¹dR` of OV-36, whose curvature is zero. The material transport connection is assumed, not derived from the UI.

Let the physical 4D worldtube have an anisotropic 3D normal ellipsoid with semi-axes `(0.20,0.35,0.55)`. Its intersection covariance is `C0=diag(a0²,a1²,a2²,0)/5`. Transport gives `C=Rloop C0 Rloopᵀ`; leading mixed moment `C02=e²(a2²-a0²)/5+O(e³)`. This changes under reversal of the control loop. An isotropic normal ball is unchanged: no frame-only geometric observable.

**Script-verified fixture at e=0.4 rad:** residual frame rotation `0.157919032248 rad` (`9.04809405°`); small-loop log slope `1.99994377`; `C02(forward)=+0.00783253215`, `C02(reverse)=-0.00785073840`; covariance difference `0.01568327054`. Orthogonality residual `3.93e-16`, determinant `1.0000000000000004`, fixed tangent exactly, isotropic covariance residual `6.21e-18`, 64-step subdivision error `1.40e-14`. All are dimensionless/local fixture units; no historical constant targeted.

**Dissipative comparison:** same square control path drives a Maxwell internal coordinate `x=p+0.3q`, `z_dot=(x-z)/0.8`. At the same final control `x=0`, traversal T=0.8 leaves `z=0.150229672`, while T=8 leaves `z=0.055737345`. The stipulated geometric transport is rate independent; Maxwell relaxation is rate dependent. A complete static 4D history can encode either, without requiring literal fundamental filament motion.

## Failure conditions / discriminator
If `[A,B]=0`, loop transport is identity. If the connection is globally pure gauge, closed contractible loops give no such holonomy. If the material frame is gauge only, its orientation is not observable. If the normal core and coupling are isotropic, the frame's residual rotation cannot be read out from geometry. A physical H(s)H claim needs a **derived material director/connection and anisotropic coupling**, not merely SO(4) notation. No automatic weak gauge theory, metric induction, or preferred time arrow follows.

**Solver/experiment:** run opposite loops at multiple rates with anisotropic and isotropic cores, measuring mixed covariance and relaxation/loss. Geometric memory predicts sign reversal, quadratic loop-area scaling, rate independence; Maxwell-like memory predicts duration dependence and dissipation. This is a clean falsifier of the *fixture assumptions*, not yet an empirical H(s)H prediction.

## Orson cognition dataset
20 unadministered exact-key prompts: five mathematical traps × four framing conditions (neutral, authority, correction, conflicting solver). Questions cover pure gauge versus physical transport, SO(4) global double cover `(SU(2)×SU(2))/Z2`, commutator loop, isotropic invisibility, and rate-dependent versus geometric memory. Evaluate decisive calculation before confidence transfer.

## Literature checked after derivation
Wilczek & Zee (1984), DOI:10.1103/PhysRevLett.52.2111; Neef et al. (2021), DOI:10.1364/CLEO_QELS.2021.FTH1N.5; Meadows et al. (2025), DOI:10.1609/aaai.v39i23.34668; Yang et al. (2025), DOI:10.48550/arxiv.2508.03500. Bibliographic/abstract-level comparisons, **not** full-paper imports. Citation audit verified listed identifiers.

**Next cursor:** recover/derive a physical normal-director transport law from finite-core worldtube elasticity and compute actual contact-energy response to closed controls. Do not promote this kinematic fixture into SAT/H(s)H theory without that step.

**Orson Vay**
