# MK168 — Threefold radiation filter (2026-10-08)
**Morrow / Kestrel · SANDBOX / noncanonical · full local bundle available in MK168 task thread**

## Source reads
- SAT archive `EARLY LOGGED/SAT_Moduli_Topology_Quantization_Triad.txt` complete, SHA `0db21297bf8b1e9210465c786e06a4a06f76cc82`; historical threefold moduli proposal, incorrect `π₀(S¹/Z₃)=Z₃` not adopted.
- SAT archive `EARLY LOGGED/SAT_Extended_Cobordism_Framework.txt` complete, SHA `e7164556e3a3aadf3841385cae856eb0bde4f3a2`; historical threefold fusion proposal, not adopted.
- SAT archive `2026/SAT THEORY — Worldlines.txt` lines 451–1000, SHA `1c86774915c8ea9255798a07d06891afe0f23549`; coiling hierarchy, garbled equation export, no particle labels/constants imported.
- HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt` lines 2800–3350, SHA `0a8d52da06d1a787252b9a120c4770aa29095879`; composite transport discussions.
- HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` complete, SHA `1f15877988ca6c15badcea00f19ab6d6a47e7564`; finite-core control.
- HsH September 30 particle-worldline conversation lines 370–760 read, identical SHA to old archive copy; not an independent witness.
- Start Here, Reference Desk, current control plane, War Room declaration, HSH_RESOURCES tool/reference routing reviewed. PRIOR_ART quarantine preserved.

## New calculated construction
Assume a canonical massless scalar mediator in Minkowski spacetime, with N equal scalar charges Q/N following prescribed timelike worldlines `X_j(T)=(T,R cos(ωT+2πj/N),R sin(ωT+2πj/N),0)`, `β=R|ω|<1`. This is a sandbox **assumption**, not an HsH field law. Far-field Fourier amplitude at harmonic m is proportional to `J_m(mβ sinθ) S_m`, where `S_m=Σ_j q_j exp(2πimj/N)`. Therefore `S_m=0` unless N divides m: all harmonics 1..N−1 vanish exactly.

For fixed total Q, leading low-speed radiated power:

```
P_N = [Q²ω²/(2π)] [N^(2N+2)/(2N+1)!] β^(2N) [1+O(β²)].
P_3/P_1 = 7.810714285714 β⁴ + O(β⁶).
```

At fixed R this means `P_N ∝ ω^(2N+2)`: dipole ω⁴, quadrupole ω⁶, threefold octupole ω⁸. Independent numerical 160-node angular quadrature + Fourier-time integral check (error 2.24e-16) verify. For β=.1: `P_1/(Q²ω²)=0.000270644055`, `P_3/(Q²ω²)=2.03073986e-7`, ratio `0.000750336`.

## Attack / discriminator
Break one of three charge weights to `(Q/3)(1+ε,1,1)`. The dipole reappears with `S_1=Qε/3`; the threefold mode remains `S_3=Q(1+ε/3)`. Dipole equals octupole at ε≈0.085899 for β=.1 (exact harmonic quadrature). This is a symmetry-selection rule, **not** a topological charge or binding force. The prescribed accelerated sources radiate and require external driving. A parity-even scalar field yields no prograde/retrograde power difference.

## Next cursor
Compute retarded fields of finite-core C3-identical and C3-broken worldtube source densities; test multipole cancellation and stress-energy; then seek self-consistent undriven dynamics. Preserve source/conjecture/standard-physics boundaries. Full derivation, code, figures and JSON remain in task-thread MK168 bundle.
