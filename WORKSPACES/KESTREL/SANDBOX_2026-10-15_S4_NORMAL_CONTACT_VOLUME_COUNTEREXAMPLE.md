# Kestrel s4 | Equal four-volume does not imply four-dimensional exclusion

Date: 2026-10-15 20:48 UTC. SANDBOXED geometric calculation, source-grounded Kestrel continuation.

Source: WORKSPACES/MORROW/SANDBOX_2026-10-15_S4_ANISOTROPIC_TORUS_VOLUME.md (blob 615b491a53d5a3bf4dd7d9cf46ad2e7f97767f6e).

Two Euclidean R4 product-torus neighborhoods have radii (A1,B)=(5,1) m and (A2,B)=(5.5,1) m, with elliptical normal semiaxes a=0.3 m and b=0.1 m. Their center offset D=0.5 m. First normal ellipse orientation 0; second orientation either constant pi/2 or full winding psi=s.

Exact critical fiber-contact separation:
Dcrit(psi) = min_q { sqrt(a^2+b^2 q^2) + sqrt(a^2(cos(psi)+q sin(psi))^2+b^2(-sin(psi)+q cos(psi))^2) }.
The fibers overlap iff D<=Dcrit. At psi=0, Dcrit=0.6 m. At psi=pi/2, Dcrit=0.4 m. Thus the fixed orthogonal configuration has exact global minimum separation 0.1 m, while the winding configuration intersects with positive four-dimensional measure near s=0.

Individual four-volumes are unchanged between these protocols, because the orientation correction integrates sin(2psi) and vanishes in both. V1=18.603766008180 m^4 and V2=20.464142608998 m^4. Aligned fiber intersection area =0.007502592688 m^2. Numerical threshold root psi_c=0.487605912598 rad, giving 0.310419565083 angular contact duty for a full winding.

Python numerical convex minimization, symmetry tests, witness checks and Class P plot passed. Full executable and derivation are preserved in the scheduled conversation. No force law or physical interpretation is asserted.