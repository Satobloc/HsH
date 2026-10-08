# MK160 | Timelike transport: three distinct connections (SANDBOXED)
2026-10-08, Morrow/Kestrel. No PRIOR_ART accessed. Full solver and derivation retained in task-thread bundle.

Source coverage: SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Worldlines.txt lines 1–450; HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt opening, 1100–1240, 2000–2130, 3300–3440, 4800–4920, 6200–6320. Old particle claims are assistant-generated conjecture, not established results. Nathan's direct two-interaction proposal occurs near current source line 6237. Current front door, Common controls, reference desk, War Room, HSH_RESOURCES routing reviewed. No historical constants fitted.

In Schwarzschild, set x=GM/(c²r), and take a stable circular geodesic r>6GM/c². Three transports along the same circular geometry:
- Euclidean normal-sphere connection: H_N=2π(1−sqrt(1−x)).
- Schwarzschild spatial circle: H_S=2π(1−sqrt(1−2x)).
- Timelike Fermi–Walker spin: H_FW=2π(1−sqrt(1−3x)).
Hence H_N:H_S:H_FW approaches 1:2:3 as x→0. These are DIFFERENT connections; the ratio does not imply C3 symmetry.

Independent full-coordinate Fermi–Walker ODE checked with SymPy and SciPy, including accelerated circular paths. For angular velocity Ω and f=1−2x, the spin rotation frequency per azimuth is beta=(1−3x)/sqrt(f−r²Ω²). At geodesic Ω²=GM/r³, beta=sqrt(1−3x). At r=10GM/c²: (H_N,H_S,H_FW)=(0.322432348,0.663333522,1.026295321) rad. In the flat accelerated control, rΩ/c=0.25, signed Thomas rotation is −0.206060574 rad per orbit. Spin norm, orthogonality and analytic phase agree with integrated equations within 5e−9.

Finite-core radial half-width b gives delta H_k≈2π k mb/[r² sqrt(1−k m/r)] for k=1,2,3, where m=GM/c². This is an orientation gradient, not a force.

NEW CONDITIONAL CONJECTURE: if a physical identification exists between a material threefold director and the normal-sphere connection, while a reference gyroscope follows Fermi–Walker, then their mismatch Δ=2π(sqrt(1−x)−sqrt(1−3x)) reaches π/3 at r/m=7.111563685418. A threefold sector-crossing interpretation additionally requires an independent constitutive locking energy. Without that coupling, the angle subtraction has no physical meaning. No transition or particle prediction is claimed.

Next test: finite-radius three-strand elastic rod, Fermi–Walker control, zero-coupling control, and flat-space Thomas limit. Failure of the physical frame identification rejects the conjectural locking interpretation, not the exact GR comparison.
