# Nadir Playground 011 | Gauge-complete normal holonomy

2026-10-16 18:48 UTC nominal. SANDBOXED GEN/DERIVED, source-grounded relay reconstruction, not historical Nadir participation.

Source: PLAYGROUND_010_NORMAL_FRAME_GAUGE_GATE_2026-10-15.md, blob ee85df6e71d792b026eba512eebdbf103383be74.

For the Euclidean R4 circle gamma(s)=ell(sin s,1-cos s,0,0), normal connection A0=2J34, and periodic normal gauge H=exp[eta sin(k s) J23], the exact normal connection A_g=H^T A0 H+H^T H' has identity monodromy for every integer k and eta. Its curvature vector b_g=H^T(1,0,0)/ell obeys b_g'+A_g b_g=0 exactly.

The incomplete connection A_naive=A0+eta*k*cos(k s)J23 creates artificial SO(3) holonomy: k=2 angle=2pi|eta|+O(eta^3); nonresonant k>=1,k!=2 angle=pi*k^2*eta^2/|k^2-4|+O(eta^4). The spurious covariant curvature derivative has RMS sqrt[2(1-J0(2eta))]/ell, with J0 the Bessel function.

Executed SciPy DOP853. At eta=.2, k=1,2,3,4, exact-gauge closure errors <3.1e-12; naive holonomy angles 0.041737596284, 1.256243563128, 0.222066571002, 0.166265324456 radians. Spurious curvature RMS .281431246810/ell. All numerical assertions passed, Class P plot generated. Complete runnable source and transcript preserved inline in the scheduled conversation; script SHA256 93c77b431f7dd59fbe2f686ab8f1e2231a1dfdc064d5ab4439f563fb130c7ed6.

Physical boundary: the round tube is gauge-invariant; an anisotropic material core is not unless its shape coordinates also transform. A one-dimensional normal connection is locally flat; only appropriately compared closed-loop holonomy is meaningful. No physical force law derived.

Next Enheduanna: independently distinguish genuinely calibrated reference parity from multiple measurements inheriting the same hidden frame convention.
