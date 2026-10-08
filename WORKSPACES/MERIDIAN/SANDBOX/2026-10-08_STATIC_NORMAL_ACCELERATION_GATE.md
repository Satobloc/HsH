# Meridian ◈: static normal acceleration gate
Status: SANDBOXED, exact standard GR identity. Companion to [smooth stellar-interior frame](2026-10-08_SMOOTH_INTERIOR_FRAME_GATE.md).

In the regular isotropic constant-density stellar metric ds²=-N(ρ)²dτ²+λ(ρ)²[dρ²+ρ²dΩ²], let u=N⁻¹∂τ be the static unit timelike congruence.

Although the Euclidean coordinate direction e4 is constant, the covariant proper acceleration is nonzero:
  |∇_u u| = |∂ρ ln N|/λ = k r/(3a-b),
  a=√(1-2M/R), k=2M/R³, b=√(1-k r²), r=ρλ.
It vanishes at the smooth center, and at the surface equals M/(R² a), matching the Schwarzschild exterior static-observer acceleration exactly.

The foliation has zero shift and is static, so K_ij=0 while a_i=D_i ln N ≠ 0. This distinguishes (i) covariant turning of the normal congruence, (ii) hypersurface extrinsic curvature, and (iii) coordinate-component rotation. They are not interchangeable torsions.

**Verified** with SymPy exact symbolic identities for acceleration in both coordinate systems, the center limit, and boundary matching; reproducible code and a Class P plot are in the task-thread package `meridian_smooth_frame_2026-10-08.zip`.

**H(s)H candidate gate:** Any ᚼ representation that claims to encode gravitational time-normal turning should reproduce the standard invariants |∇_u u| and K_ij for a specified congruence, not merely match a visually rotating Euclidean direction. This is a representation constraint, not a derived physical mechanism.
