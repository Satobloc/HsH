# Meridian ◈ | Coupled-mode torsion / Frenet phase-slip gate | 2026-10-08

**Status:** SILOED SANDBOX; exact geometry and computational check; not canonical theory, particle phase, or physical quantization. No historical SAT constants fitted.

## Source/authority ledger
- Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and linked Common controls, Reference Desk, current `🔑/🔑.md`.
- **SAT archive**: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/SAT26 MATH ROUNDUP.txt`, entire short file (request lines 1–240). Historical UI rotation-expansion and bending/action ideas; unverified numerical/unification assertions not imported. `⟦PROV:SAT26-TBOX·SAT26 MATH ROUNDUP.txt:1–end⟧`
- **SAT archive**: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/THE SPHERES.txt`, lines 350–620. Driven sphere chain and axis/frame-bend induction; mixed historical conversation authorship. `⟦PROV:SAT26-TBOX·THE SPHERES.txt:350–620⟧`
- **HsH**: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, lines 820–1140. Historical constraint/Hamiltonian candidate, not adopted. `⟦PROV:HSH-30SEP·SAT Math Extension.txt:820–1140⟧`
- HSH_RESOURCES reviewed for navigation only: Reference Desk, War Room DECLARATION and linked categories, HSH_TOOLKIT index, HQ Tool Chest, toolkit digestion, source index, Nathan preference BOOT. No entry into PRIOR_ART, no claim of reading all reference folders.

## Independent geometry (scratch namespace LOCAL:MERIDIAN:MODE-FRAME)
For integer m≥1, |a|<1, b small, phase φ:
```
X(t)=((1+a cos mt) cos t, (1+a cos mt) sin t, b sin(mt+φ)), t∈[0,2π).
```
Smooth regular embedded unknot since cylindrical radius 1+a cos(mt)>0 and azimuth uniquely identifies t. **This is an analytic carrier benchmark, not an exact triple-sphere intersection or a dynamical solution.**

Direct derivative expansion of Frenet torsion gives
```
∮τ_F ds = π m(m²−1) a b cosφ + higher-order terms.
```
Symbolic coefficient tests: m=1→0; m=2→6π; m=3→24π; m=4→60π. Independent radial/vertical mode coupling produces signed net torsion; phase quadrature suppresses it. No added field is required for the mathematical example.

**Exact singularity gate:** for φ=0 at t_j=(2j+1)π/m, X''=[a(m²+1)−1]e_r and X'=(1−a)e_θ−bm e_z. Thus Frenet curvature vanishes at a_c=1/(m²+1), while X itself remains smooth and embedded. On crossing a_c, ∮τ_F ds jumps by −2πm for b>0 (m=2,3,4 numerical checks). This is a Frenet-frame branch singularity, **not** physical quantization or carrier topology change.

**Smooth normal-frame discriminator:** T=X'/|X'|; E1=normalized(e_r−(e_r·T)T); E2=T×E1. Define ω_t=E1'·E2 and Z=(T'·E1)+i(T'·E2), w=wind(Z,0). Then
```
∮τ_F ds = ∫ω_t dt + 2πw.
```
For m=3,b=.025,a=.09: w=0, total torsion=+0.1670475313. For a=.11: w=−3, total torsion=−18.6466836032, while smooth connection=+0.2028723183. Identity residual <3e−15. Apparent 6π discontinuity resides entirely in curvature-vector winding; modulo 2π transport is continuous.

## Failure and next calculation
The weak-amplitude law fails at large deformation; Frenet torsion is undefined at a_c. Integrated Frenet torsion is neither conserved charge nor knot invariant. Next: drive sphere/support deformation from the archived oscillator equations, independently obtain mode amplitudes/phase, test the πm(m²−1)ab cosφ response, and compare against a smooth material/Bishop frame. If coupling or phase response fails, record a negative result; do not invent an extra mechanism.

**Reproducible code/figures:** retained in Meridian task-thread package `meridian_frame_phase_slip_gate_2026-10-08.zip` with `solver.py`, `verification.json`, four precision figures, and expanded checkpoint. No repo code commit is claimed here. Meridian ◈.
