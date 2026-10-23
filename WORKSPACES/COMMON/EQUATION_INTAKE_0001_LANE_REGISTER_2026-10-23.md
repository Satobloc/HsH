# EQUATION INTAKE 0001 — current + historical, lane-separated
**Date:** 2026-10-23  
**Status:** INTAKE / SOURCE REGISTER, NOT MATHEMATICAL CLEARANCE OR THEORY PROMOTION.  
**Authority:** BEDROCK.md (read blob aa5d236354258f4c4715f5cf77bff2c5db602cfd); subordinate STATE_OF_THE_THEORY.md (blob b5958a1056c2541f00ab4f3477d8acc32426cfe9).

## Boundary and search receipt
- Read Mersearch worker guide `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md` (blob 4548c3a76142ba71480845c9e3a003c9f62e8fcb) and stable release guide (blob e44316bd01a5d8618433e866a209fe63e04e25a6).
- Shared bridge `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` occupied by **2026-10-21-orson-nlm-big-haul-math-001** (blob 662e4a99e47a48e1e573cf0dddffaf1329dd60dd). **Not overwritten; no new Mersearch run claimed.** The request is broad and overlapping. Follow its request-specific receipt/manifest for completed coverage before counting results.
- This initial bounded pass used GitHub code search plus exact underlying file reads. Code search does **not** equal exhaustive multi-root Mersearch coverage. Direct inspection was of 2 historical SAT source files, 2 contemporary HsH mathematical notes, 1 current handoff, 1 provenance note, and the control documents. HSH_RESOURCES was not searched in this intake pass. Restricted sources excluded.
- All historical claims must retain their original formulation, then be paired with an independently identified correction, if any. No correction inferred solely from date.

## Orthogonal lanes
**Source-era lanes** H0 original/historical SAT; H1 intermediary SAT solvers; C0 current finite-core H(s)H; E0 established external physics (independent comparator). **Mathematical-function lanes** K kinematics/projection; V variational/action; G metric/GR/Kerr; T topology/braids; F medium/fluids; Q quantum/QCD/QED; S scaling/constants; O observational readouts; X interfaces/translations. Any entry may have multiple function tags but one explicit version lineage.

**Separate gate dimensions**: (a) provenance source verified or not; (b) syntactic mathematical inspection; (c) algebra/dimensions/sign/limits; (d) computational reproduction; (e) current H(s)H applicability; (f) cross-sector candidacy; (g) independent physical validation. Default untested. Factory-floor mathematical clearance only means eligible for consideration for candidacy, not tentative candidacy itself. Tentative H(s)H candidacy requires independent coupling across multiple physics sectors. Nothing in this register clears either gate.

## First harvested entries (exactly sourced, not all endorsed)

| Intake ID | Era / function | Recovered expression or construction | Source / blob | First-pass disposition / next gate |
|---|---|---|---|---|
| EQI-001 | H0 V | `L=1/2 ∂μθ4 ∂^μθ4 − μ² cos(3θ4)+λ(uμu^μ+1)+α ∇μuν ∇^μu^ν+β(∂μθ4)(∇^μu^ν)uν` | `SAT_THEORY_ARCHIVE_2023-25/FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt`; 9d5db44f16f1f2d853332efd8d91995a37e8d394 | **HISTORICAL / UNCHECKED**. Full Euler–Lagrange rederivation incl. index placement, β term redundancy under constant norm and metric compatibility, sign convention and physical status. Do not automatically import extra fields/actions into current H(s)H. |
| EQI-002 | H0 V | Source's summary E-L: `□θ4 + 3μ² sin(3θ4) − β ∇μ[(∇^μu^ν)uν]=0` | same source/blob | **UNVERIFIED DERIVATION**; vary explicitly, examine normalization u·u=-1 and possible θ-independent β coupling on-shell. |
| EQI-003 | H0 K/X | `y^μ(λ)=r(λ)R^μ_ν(λ)x0^ν`, `R∈SO(4)` | `SAT_THEORY_ARCHIVE_2023-25/BYO LAGRANGIAN.txt`; 47ee684888525d9d71a6dd701041685681f3dc49 | **HISTORICAL GENERATOR**; geometry, coordinate roles and limitations. Explicit S³ reference is historical solver apparatus, not licensed physical carrier. |
| EQI-004 | H0 V/X | `S=∫ F(X,X',X'',…) ds` | same | Generic action template; identify measure, boundary conditions, Lagrangian source before using. |
| EQI-005 | H1 S/O | `B=3/(4π)≈0.2387324`, adjacent optical `Δφ≈0.246 rad` | `HsH/WORKSPACES/MERCER/EARLY_B_PROJECTION_CONSTANT_SOURCE_RECOVERY_2026-10-07.md`; cfcb9380082dd109248997e66d7cc98a2a8709c4 (historical raw cited within, not reread here) | **SECONDARY SOURCE-GENEALOGY POINTER ONLY**; establish earliest actual expression + definition, units, independence of B and Δφ. Do not equate dimensionless B to angle sans construction. |
| EQI-006 | C0 K/T | `Q R_xy(β) Q^{-1}=R_yw(-β)`, `Q=R_xw(π/2)` | `HsH/WORKSPACES/MERIDIAN/SANDBOX/2026-10-22_HAGALAZ_QUARTERTURN_METRIC_RETURN_GATE.md`; 9a90a8c86818d621ea4cf0ab1478bf7da5b657a8 | **PRIOR SANDBOX NUMERIC CHECK CLAIM** in source; frame conjugacy does not generate physical winding. Re-run independent identity check in current audit. |
| EQI-007 | C0 K/T | `D_s φ=φ'+A` gauge-invariant phase derivative; return closure `Δφ+Ω=2πk` | same | Prior mathematical control; audit gauge and normal-plane selection in ℝ⁴, distinction from material twist. |
| EQI-008 | C0 K/O | `ds²=-N(x,y)²dt²+dx²+dy²`, `dx/dt=N u`, `du/dt=-∇N+u(u·∇N)` | `HsH/WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_INTEGRATED_NULL_WAVEFRONTS_EXPLICIT_METRIC.md`; 8067b4e5a3360faca9924522cb8227af22467ab8 | Prior executed toy numerical result, NOT Kerr/H(s)H metric. Dimensional extension & sourced physical stress gate. |
| EQI-009 | C0 F/X | `u_W=(1-w)u_A+w u_B^ε+g E(τ)Σ_j c_j(τ)m_j` | `HsH/WORKSPACES/COMMON/HANDOFF_2026-10-20_WHIRLIGIG_NAVIER_STOKES_WORKBENCH.md`; 8aa81f3207da27356fd6da7debb5913f386399a4; script `tools/whirligig_navier_stokes_workbench.py` | Candidate generator, **not** a Navier–Stokes solution. Note `w` in this code is an interpolation weight; disambiguate from spatial-coordinate w of H(s)H diagram. |
| EQI-010 | C0 F | `R_NS=T^{-1}∂_τω+(u_W·∇)ω−(ω·∇)u_W−νΔω` | same | Vorticity NS residual. Check assumptions, divergence-free endpoints, residual convergence, correction-mode controls. Not an equation establishing emergent QED. |

## Coverage lanes next
- **Provenance/archaeology**: reuse Orson Mersearch broad-math request; source-specific searches across *all three permitted roots* when bridge frees. Recover nested HsH full conversations, older files, duplicate exported notes, mathematical claims with exact message/cell/line locator and hashes. Distinguish text extraction from original.
- **Mechanics/geometry**: track worldlines, finite worldtubes, Kerr surfaces, horizons, S³/SO(4) mathematical instruments, timesheet intersection, Hagalaz geometry; keep one identified invariant per equation.
- **External controls**: Minkowski, Lorentz, Einstein/Kerr, Maxwell/QED, Yang–Mills/QCD, Dirac/SM, elasticity, Euler/Navier–Stokes, standard Lagrangian/Hamiltonian machinery. These are control-sector benchmarks, not H(s)H inventions.
- **Cross-sector closure**: graph dependencies from same shared construction to GR, EM, flavor, spin, optical, fluids, cosmology; no retuning on a spoke.
- **Visual/class-P**: the October 23 drawing assigns ring features, gravity-well/time-surface/ergosphere/horizon, three distinct tube identities, induced Kelvin modes in medium, string vibration/readouts and fourth spatial-axis **w**. A diagram assignment is **not** a demonstrated physical derivation.

## Registry contract for scaling
For each full record require: stable ID; literal expression; parsed LaTeX/SymPy form; mathematical object type; source path/ref/blob+locator; date and speaker; source era; physics-sector tags; definitions, domains, dimensions, signatures; assumptions; correction genealogy with before/after source; exact/symbolic checks; numerical tests incl. seeds/config if any; comparators/observables; dependency edges; lane/gate statuses; disqualifying tests; and physical claim status. Preserve conflicting versions as separate records with typed relationships, do not overwrite.

**Immediate reproducibility targets:** EQI-001/002 symbolic variation and under-constraint β test; EQI-003 derivative/normalization; EQI-006 explicit SO(4) matrix multiplication; EQI-009/010 divergence/residual convergence with an independent harness. Start with oldest *and* newest source for each ancestry.

**Source-read honesty:** No new physical tests, numerical reruns, or exhaustive Mersearch run were executed in this intake record. It captures source-supported expressions and differentiates inherited checks from checks performed here.
