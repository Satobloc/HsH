# Meridian Run 144 — recurrence frontier + particle-zoo geometry entry

## Recurrence result
An answer-blind stride rule selected L=30 by maximizing the minimum exact recurrence discriminant over Δω={0.10,0.03,0.01,0.003}, subject to retaining at least 40 recurrence windows.

120 deterministic-seed noisy trials per gap at L=30:
- 0.10 → median relative error 0.00689968
- 0.03 → 0.0925203
- 0.01 → 0.523497
- 0.003 → 33.547

Result: under this fixed acquisition/noise/window model, the solver is strong at 0.10, degraded by 0.03, and does not reliably resolve 0.01 or 0.003. This is a measured estimator frontier, not a universal limit.

## Particle-zoo source reconstruction
Direct source read: `SAT Mark V/SATv THE PARTICLE ZOO.txt`, plus `PARTICLE_SAVE.txt` and `PARTICLE_SAVE_FORMUL.txt`.

Source-level archetypes reconstructed:
- leptons: persistent singly curved filaments; mu/tau heavier harmonics;
- neutrino: near-aligned filament;
- quark: short/high-curvature segment, composite binding/braiding;
- photon: propagating phase-alignment ripple;
- gluon: confined internal ripple;
- W/Z: local reconfiguration event;
- Higgs: stabilization/structural event;
- baryon: three braided quark filaments.

### First Class-P-style geometry check
Representatives plotted directly from explicit parametric curves:
- charged lepton `(cos s, sin s, s/(2π))`;
- neutrino `(0.02 cos s, 0.02 sin s, s/(2π))`;
- 3-braid radius 0.65, phases `0,2π/3,4π/3`;
- phase ripple `(0.55 sin(2πu),0,u)`.

For helix `(R cos s,R sin s,b s)`, `κ=R/(R²+b²)`, `τ=b/(R²+b²)`.
With `b=1/(2π)`, the charged-lepton representative has κ=0.975295477, τ=0.155223096; the neutrino representative has κ=0.777293820, τ=6.185507685 and transverse/axial tangent ratio 0.125663706. The three-braid matched-axis minimum strand separation is `0.65√3=1.125833025`.

### Diagnostic
GREEN — the source descriptions are sufficient to build reproducible geometric representatives.

YELLOW — they are not yet sufficient to assign every particle a unique topological equivalence class. Electron/muon/tau are stated as geometric/harmonic variants; an open quark segment needs endpoint/framing/boundary data for a topological classification; bosonic ripple/event objects need typed state definitions before direct invariant comparison with persistent curves.

RED — a unique source-derived particle-label → topology classifier has not yet been recovered.

The key source question is whether the zoo intends distinct topological species, or a smaller topology set with particles distinguished by geometric/dynamical modes. That should be recovered rather than imported.

## Quick external context
Fresh academic search found related use cases:
- Bilson-Thompson, Hackett & Kauffman, *Particle Topology, Braids, and Braided Belts*, J. Math. Phys. 50 (2009), DOI 10.1063/1.3237148.
- Finkelstein, *The elementary particles as quantum knots in electroweak theory*, Int. J. Mod. Phys. A 22 (2007), DOI 10.1142/S0217751X0703707X.
- Asselmeyer-Maluga, *Braids, 3-Manifolds, Elementary Particles*, Symmetry 11 (2019), DOI 10.3390/SYM11101298.

These establish precedent for particle taxonomy using topological/geometric invariants. They do not establish equivalence to SAT/H(s)H.

## Control disposition
War Room declaration, live Meridian checkpoint, active-edge queue surface, automation roster, and switchboard were freshly inspected. PRIOR_ART/nLab quarantine was not opened.

## Durable state
A Meridian desk was created at `HSH_RESOURCES/HQ/MERIDIAN_DESK/` with required inbox/geometric-output conventions. The run-status inbox card committed successfully. Connector safety blocked the separate geometric-output write, so this local artifact and its generated PNG/SVG are the durable geometry packet for this run; no blocked commit is claimed.
