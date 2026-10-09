# Mercer sandbox | Two compliant worldtube cores | 2026-10-09

**Status:** SANDBOXED, not a physical claim, H(s)H doctrine, or empirical prediction. Independent Lorentzian scalar/vector comparator with finite, deformable cores; causal carrier **assumed**, not derived.

## Primary project reading and routing

- Front door: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, plus its Common symbol/citation/onboarding/workflow/reference desk pointers.
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt`, lines 1–360 (Nathan's worldline→worldtube and untargeted-calculation instructions amid mixed LLM synthesis); `Filament onto.txt`, lines 1–360 (Nathan's filament/timesheet mechanical picture).
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`, lines 400–800 and 1–110 (Meridian's explicitly sandboxed coil stiffness and carrier elasticity model).
- HSH_RESOURCES October 5 routing: Common Reference Desk, War Room declaration/link index, toolkit index, tool chest, resource index, preferences BOOT, digestion guide, and role-relevant directory inventories reviewed for candidate use only. No quarantined PRIOR_ART accessed; no external reference promoted into SAT/H(s)H authority.
- `[[SAT26 TOOLBOX]]/SAT to H(s)H TRANSITION.txt` returned zero content via GitHub file reader despite a blob SHA. Treat as a reader/size diagnostic, **not** proof of emptiness.

## New local calculation

Namespace: `LOCAL:MERCER-TWO-CORE-20261009`. Let `C` be the matched static interaction coefficient [force·length²], `b` impact parameter [length], `w` relative speed, `γ=(1-w²/c²)^(-1/2)`. Two non-overlapping finite cores carry transverse oscillator modes `M_j q̈_j + M_j Ω_j² q_j = f_j(τ)`, with compliance `χ_j=(M_j Ω_j²)^(-1)` [length/force]. Center-field monopole approximation, straight prescribed trajectories.

In each core's proper time, the vector and Lorentz-scalar proper transverse pulses are respectively

`f_V(τ)=γ C b/[b²+(γwτ)²]^(3/2)`, `f_S(τ)=f_V(τ)/γ`.

The exact oscillator Fourier amplitude is `A_V,j=2CΩ_j K₁(Ω_j b/(γw))/(γw²)`; `A_S,j=A_V,j/γ`. Thus, with negligible feedback, for *both* cores with arbitrary positive rest frequencies and inertias:

**`E_internal,S / E_internal,V = 1/γ² = 1-w²/c²`.**

In the **adiabatic** regime `Ω_j b/(γw)≫1`, eliminate the oscillator coordinates. Writing `χΣ=χ_A+χ_B`, the first-order on-shell induced action is

`S_ind,V=3πγχΣ C²/(16wb³)`, `S_ind,S=S_ind,V/γ²`.

Impact-parameter differentiation gives `I_ind,V=9πγχΣ C²/(16wb⁴)`, `I_ind,S=I_ind,V/γ²`. Against rigid `I_0,V=2C/(wb)`, `I_0,S=I_0,V/γ`, set `s=1/γ` and `ε=9πγχΣ C/(32b³)`:

**`R_truncated=(s+s²ε)/(1+ε)=s+s(s-1)ε+O(χΣ²)`.**

The rational form is the ratio of **first-order truncated** impulses, not an all-orders resummation. The scalar/vector ratio now has a calculable `b^(-3)` correction. Fixture `c=C=b=1`, `w=.8c`, `χΣ=.02`: `ε=.0294524311`, `R_truncated=.5931336473` vs rigid `.6`. No historical SAT constant used as target.

## Verification and limitations

Independent cosine-weighted Fourier quadrature vs Bessel expression, and numerical derivative-integral vs analytic induced impulse. Maximum relative Fourier error ~5.7e-8 occurs only for an exponentially small ~1e-11 amplitude (absolute error ~5.7e-15). Induced-impulse quadrature agrees to ~4.1e-16 relative error. Executable script and four Class-P plots were generated in this run, preserved with the full derivation in the task's downloadable ZIP.

**Failure conditions:** `ε≪1`, `χ_j γC/b²≪a_j`, `a_A+a_B<b`, preferably `a_j/b≪1`, `Ω_j b/(γw)≫1`, weak deflection and negligible radiation. Finite-radius stress form factors and dynamical memory are not included; they may mask or reverse the predicted correction. The scalar/vector comparators do not reproduce GR's tensor coupling.

**Next solver cursor:** integrate the retarded field and induced stress over explicit moving spherical/anisotropic cross-sections, quantify `O(a²/b²)` finite-core effects against the `O(χΣ C/b³)` correction at held-out `b,w,Ω_j`, and reject the center-force reduction if finite-size terms dominate.

**Mercer | independent sandbox checkpoint.**
