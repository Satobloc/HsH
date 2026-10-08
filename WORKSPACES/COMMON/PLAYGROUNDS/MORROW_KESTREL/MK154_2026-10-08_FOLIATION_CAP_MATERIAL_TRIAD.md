# MK154 | Foliation cap vs material-triad topology
Morrow/Kestrel 2026-10-08. SILOED SANDBOX; not canonical.

## Read ledger
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt: lines 1–290 (~46.9k characters), F1–F4 4D geometry, time normal, filaments.
- SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/GRAVITATIONAL NANOSTRUCTURE (Nolat).txt: complete 7,836 chars; 2026-03-07 tentative coarse-graining concept, no constants imported.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md: complete 5,017 chars, finite-core support geometry.
- HsH/🔑/🔑.md, O_EFF_IS_THE_REPRESENTATIONAL_DEFAULT.md, H0_TO_C_IS_THE_UNIVERSAL_METRIC_GRADIENT.md: all complete.
- HsH/WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/MK153_2026-10-08_METRIC_TEXTURE_SKYRMION.md: complete.
- Front door, Common workflow/symbol controls, reference desk, War Room declaration, resource-tool routing reviewed. No PRIOR_ART/QUARANTINE. Mersearch 1.0 documented but full checkout unavailable in this runtime; exact-path retrieval, not corpus-wide search.

## Theorem (LOCAL:MK154; new derivation)
Assume unit u:S3_space->S3, u(infinity)=e0, Euclidean delta, induced Lorentz metric g=I-2uu^T, fixed instantiation T=constant. The spatial induced metric h_ij=delta_ij-2u_i u_j has eigenvalues (1,1,2u0^2-1). A globally spacelike fixed-T foliation requires |u0|>1/sqrt(2). Connectedness and asymptotic orientation force u0>1/sqrt(2), restricting u to a contractible cap of S3; hence deg(u)=0. The metric-only director has the same conclusion via its future-oriented lift.

Example u=((r^2-a^2),2ax,2ay,2az)/(r^2+a^2), a>0, has degree -1 but loses fixed-T spatiality for (sqrt(2)-1)a<r<(sqrt(2)+1)a. This does NOT imply the Lorentzian metric is singular or all foliations fail.

## New sandbox completion
Keep u=e0, g=diag(-1,1,1,1). Use the same unit quaternion q(x) above to orient a PHYSICAL finite-core spatial triad: R(x)=Rot(q(x)) in SO(3). Its lift has degree -1, and pi3(SO3)=Z; quotient by a finite strand-permutation symmetry preserves pi3. Thus material-frame topology can coexist with a fixed globally spacelike instantiation, without assigning winding to the time normal. This requires a physically consequential 3D triad field; a mere coordinate frame is gauge and not a mechanism.

Numerical Python fixture: degree -1 to 1e-15 for a=.3,1,3; verified rotation orthogonality, det=1, q~-q and induced-metric eigenvalues. Class-P figures and full code in task-thread bundle.

FAIL if no bulk material triad, if its order parameter degenerates, if the metric rule differs, or if no dynamics stabilizes the texture. Reflection flips charge; no chirality preference. No physical constants or particle targets used.

NEXT: simulate finite-core triad orientation with an explicit degeneracy amplitude, track integer degree under reconnection, and test whether stiffness/interaction derived from existing HsH terms can stabilize size. Historical source claims, new theorem, and speculative material-frame mechanism remain separate.
