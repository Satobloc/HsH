# Optional context only: Orson Vay → Sable

**Status:** REPOSITORY_ONLY / OPTIONAL_CONTEXT / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER.

This packet carries one narrow source-fidelity refinement to the already-published 2024 geometry and LLM-translation work. It is not a new assignment and does not alter Sable's current P0 work.

## Frame-aware helix/slice correction

The 2024 primary conversation distinguishes three objects:

- A fixed transverse plane intersects a 1D helix at one point.
- A moving family of transverse planes produces one intersection point per plane.
- The intersection point's transverse in-plane coordinates trace a circle of radius r, while its ambient 3D locus lies on the helix.

Thus the assistant's first claim of a spiral in one fixed plane is wrong. Its later phrase “helix-like path in space” can be correct in ambient coordinates, but it does not answer the requested 2D in-plane readout unless the projection/frame is stated. This refines, rather than replaces, the existing slice/frame-drift findings.

A conditional reconstruction, not a verbatim Nathan equation:

    H(φ) = (r cos φ, r sin φ, p φ/(2π))
    Π_t: z = z0 + v t
    φ(t) = 2π(z0 + v t)/p
    q(t) = H(φ(t))
    π_xy(q(t)) = (r cos φ(t), r sin φ(t))
    ||π_xy(q(t))|| = r
    dφ/dt = 2πv/p

The radius is independent of pitch and slice speed; pitch and plane speed determine phase rate.

A separate assistant error is the claim that a tilted line's y-intersection speed equals the plane speed T. The corrected conditional relation is

    dy/dt = (dy/dz) T

and equality with T requires dy/dz = 1. Existing Lean work proves this conditional slope factor.

## Source and proof pointers

- Primary 2024 raw conversation: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json, blob 2cea1924266418e19b825b95ae51e6b7cbace7e1, conversation 252d05c0-22ed-4ea2-a474-7966ab13145a. Key direct user messages: aaa28bd9-07f7-4740-b878-b485d4db44d0, aaa2269b-7eab-4781-9454-647098d6747f, aaa2d0b1-017d-453e-b95a-b23915f87d32, aaa2a1cc-e884-4f6a-800f-8afc29ab221a, aaa26a36-fc31-4d8f-8c66-c1743e7fbaf5.
- Existing source/cognition report: https://github.com/Satobloc/HsH/issues/1869.
- Existing oblique-slice/taxonomy audit: https://github.com/Satobloc/HsH/issues/1998.
- Existing moving-plane formalization scope: https://github.com/Satobloc/HsH/issues/2187.
- Existing Blockwave transcript custody and fidelity: https://github.com/Satobloc/HsH/issues/2522.
- Existing conditional Lean modules are on open, unmerged PR #262, not current main. Its exact-head build passed, but it does not prove source translation or physical premises.

## Next deeper cursor

Recover and independently parse the larger 2026 raw conversation containing the direct one-core/hollow-coil, 4D-filament/3D-trace, active-timesheet, and Klein-Fabric statements. Then specify the support dimensions and actual maps between the 2024 curve/surface intersection, any finite-core worldtube, and the 2026 3D trace. Do not infer equivalence from names or analogies.

No direct Sable thread delivery, consumption, acknowledgement, or scheduled execution is claimed. The :12 lease remains disabled; this packet is only a repository handoff.
