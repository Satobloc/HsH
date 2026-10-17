# Mercer Calder | Independent mathematical hostile review #24 | 2026-10-11

**Mandatory question: Better or worse than the published paper? Why or why not?** **WORSE overall as a research demonstration** than Noh et al., *Braiding photonic topological zero modes*, *Nature Physics* **16** (2020), 989–993, DOI [10.1038/s41567-020-1007-5](https://doi.org/10.1038/s41567-020-1007-5): Noh et al. report an actual interferometric measurement of a braiding-induced geometric phase using a photonic waveguide array, whereas the Whirligig draft provides conditional identities and synthetic computations without an independently calibrated physical realization. **BETTER only in a narrow sense**: the Whirligig document states its toy action, constructed forcing, symmetry proof, and explicit numerical fixture compactly, making those mathematical claims especially easy to independently reproduce. These studies do **not** make the same physical claim. Noh's abstract supports a measured nonzero geometric phase; it does NOT by itself prove that an entire non-Abelian braid-representation matrix was measured.

**Comparator-access limitation (essential):** The original journal article was identified through the SciSpace bibliographic search and its DOI-linked abstract; its original full PDF and page-level equations were **not retrieved/read**, and the retrieved methods/results expansion was secondary/index-derived. Therefore this is a completed **independent mathematical review** of the entire Whirligig draft plus a **provisional scope/evidence comparison** to Noh et al., not a falsely claimed original-paper full-text audit. Do not assign journal page-equation citations on this evidence.

**Packet:** [HsH issue #24](https://github.com/Satobloc/HsH/issues/24). **Candidate read in full:** `Satobloc/HsH/WORKSPACES/COMMON/SANDBOXED_PAPERS/WHIRLIGIG_CLIFFORD_TORUS_ELASTIC_BACK_HALLWAY_2026-10-08.md`, including v0.2 cross-plane sidebands and v0.3 dense independent solver, blob `35c22ad1b18be0ab63735942c8807b1804582b83`, 9,440 characters. Historical source routes named by draft noted, but original Whirligig files not independently fully excavated in this focused comparison. No co-reviewer discussion read before first-pass assessment.

**Recommendation:** MAJOR REVISION for a physics-comparison paper; the mathematical core can circulate as a **restricted, non-topological elastic/SO4 benchmark** after a short rewrite.

## 1. Severity-ranked verdict / first counterexample

1. **[CRITICAL if 'topological braid' or equivalence is claimed] The Clifford-torus orbit is not a protected physical braid.** The map `s -> H(s)/R` is a loop in `S³`; `π₁(S³)=0`, so every such loop contracts within `S³`. The pair of windings `(m,n)` is a homotopy label only when constrained **within the chosen Clifford torus** `S¹×S¹`, not an invariant of general UI/S³ deformations. This is a direct topological counterexample to identifying this geometry with defect braiding or to promoting sidebands to a protected anyonic observable. The draft mostly avoids this claim, but its comparison must explicitly prohibit it.
2. **[HIGH] Designed inverse forcing is not predictive.** `G_*=H+(κ/k)H''''` is constructed from H. Its satisfying the E-L equation and beam-transfer law proves a manufactured stationary solution, not a derived apparatus response or empirical fit.
3. **[HIGH] The v0.2 cross-plane sidebands are conditional dynamical-model predictions, not source-independent 'symmetry-enforced' physics.** The odd/even *parity rule* follows from half-turn covariance; the **nonzero** mixed-sideband amplitude also requires `λ_s>0`, `ab != 0`, suitable forcing, and calibrated positive couplings. For `λ_s=0`, the cross-plane response vanishes, while parity remains valid.
4. **[HIGH / measurement] No independently prescribed physical actuation `G`, geometric shell radius, material stiffness, or response sensor in a four-component instrument is documented. There is no held-out physical observation; numerical phase/amplitude agreement only verifies the chosen PDE.
5. **[MEDIUM / terminology] The SU(2) representation is a parametrization of a unit `S³` curve, not a Berry/Wilczek–Zee gauge transport or a unitary action on a degenerate zero-mode eigenspace. `Spin(4) ≅ SU(2)×SU(2)` is correct, but does not supply a Noh-type braid operator.
6. **[MEDIUM / boundary conditions] State explicitly `s∈[0,2π]`, period closure, fixed `G` under variation, `κ,k>0`, `λ_s≥0`, normalized `a²+b²=R²`, integer `m,n`, and physical units in conversion to an actual beam. Local minimizer is proved; global minimizer in the nonlinear functional is NOT proved.
7. **[MEDIUM / literature & priority] Euler–Bernoulli/Winkler transfer, `S³ ≅ SU(2)`, winding on a Clifford torus, and half-turn Fourier parity are established mathematics. The newly combined worked example may be useful, but is not evidence of unique Whirligig physics or priority over experimental photonic braid methods.
8. **[LOW] The paper advertises generated scripts not mirrored in its repository. Freeze a runnable 64-point independent fixture beside the paper. Also clarify that reported machine residual depends on derivative implementation/cancellation and is not a continuum truncation error.

## 2. Independent checks of every requested mathematical component

**Euler–Lagrange:** From `J = ∫ [κ/2 |H''|²+λ_s/2(|H|²−R²)²+k/2|H−G|²]ds`, periodic twice integration by parts yields `κ H''''+2λ_s(|H|²−R²)H+k(H−G)=0`. Correct.

**Inverse forcing:** For `H=(a cos ms,a sin ms,b cos ns,b sin ns)`, `H''''=(m⁴ H_{plane1},n⁴ H_{plane2})`. With `G_*=H+(κ/k)H''''` and `|H|²=R²`, the E-L residual is exactly zero. Correct, but constructed.

**Second variation:** At `|H|²=R²`, `δ²J=∫[κ|η''|²+k|η|²+4λ_s(H·η)²]ds`, positive for any nonzero periodic perturbation because `k>0`. Correct local minimizer.

**Curvature invariant:** `R²|H''|²−|H'|⁴=a²b²(m²−n²)²`, true by direct expansion. This is a geodesic-curvature proxy for constant-speed curves but not a topological invariant.

**SO(4)/SU(2) embedding:** Constructing `U=[[z1,−conj(z2)],[z2,conj(z1)]]` from `z1=(a/R)e^{ims}`, `z2=(b/R)e^{ins}` gives `U†U=I`, det U=1, `|H''|²=(R²/2)Tr(U''†U'')`. Correct pointwise identity; neither proof of braid-statistics nor SU(4) identification.

**Beam transfer:** A periodically forced beam on an elastic foundation has `w_j/g_j=(1+αj⁴)^−1` with `α=(EI/K)(2π/L)^4`. Correct restricted spectral equivalence at `λ_s=0` or when shell-penalty force vanishes on the chosen exact orbit. **Not** general operator equivalence off the constrained orbit.

**Cross-plane selection and independent replication:** At m=2,n=3, a=b=1/sqrt(2), κ=.02,k=1,λ_s=5,R=1, `f(s)=cos(s)e1`, I independently assembled a **64-node Fourier fourth-derivative matrix**, and solved the 256×256 symmetric positive matrix exactly using `numpy.linalg.solve`, with direct rank-one `4λ_s H(s)H(s)^T` terms. Obtained:
- relative linear equation residual `6.0920e−13`;
- first-plane coordinate-1 harmonic 3 amplitude `0.07535009021913369`;
- second-plane coordinate-3 harmonic 2 amplitude `0.14955851240473828`;
- second-plane DC amplitude `0.21390872154281942`;
- maximum forbidden-parity Fourier amplitude in tested modes `4.14e−14`.

Matches claimed v0.3 values `0.07535009021914847` and `0.1495585124046117` to ~1e−13. **The linear sideband result is real mathematical output, not numerology**, under stated forcing/coupling. This verifies the claim independently even though the original scripts were not accessed.

## 3. Published comparator and scientific axes

- **Rigor:** Whirligig equations A–D and linear sideband theorem pass independent checks; Noh's accessible abstract is not enough for paper-level mathematical derivation auditing.
- **Reproducibility:** Whirligig synthetic benchmark immediately reproducible from 64-node linear system; Noh's published apparatus has real fabrication/calibration requirements which cannot be audited from abstract alone.
- **Falsifiability/testability:** Noh actually reports interferometric measurement of geometric phase in photonic waveguides. Whirligig proposes a calibration-dependent, four-component nonlinear elastic response with no realized measurement; externally testable in principle once `G`, `λ_s`, `κ`, `k` are independent.
- **Novelty:** Whirligig's mathematics is a constructive combination of standard beam, SO4/SU2, parity and Hessian; unestablished uniqueness. Noh supplies an experimentally realized geometric-phase braid protocol.
- **Scope:** Whirligig narrowly computes a periodic forced elastic orbit and sidebands; Noh addresses topological-defect braiding in photonic lattices. Different targets. The classical geometric phase result must **not** be misreported as measuring a universal non-Abelian anyon computation.

## 4. Mandatory rewrite (desk-safe abstract)

> We analyze a specified periodic fourth-order elastic functional for curves in R⁴. A two-frequency constant-radius Clifford-torus orbit admits an exactly constructed source that makes it a strict local minimizer. On that orbit its linearized beam response matches an Euler–Bernoulli/Winkler transfer function. For a rank-one sphere-restoring Hessian, half-turn symmetry imposes an odd/even Fourier selection rule; an independent 64-point solver reproduces the expected cross-plane sidebands. These are standard geometric and elastic mechanisms combined in a Whirligig benchmark. They do not establish topologically protected braiding, a new gauge holonomy, or a physical SAT prediction. An independent four-component actuation and response experiment is required.

Remove 'topological zero-mode equivalent' language if added later, cite established beam and `S³≅SU(2)` mathematics, explicitly separate the experimental Noh result from this model.

## 5. One numerical gate that kills the theorem if failed

For the frozen `N=64` periodic fixture, the 256×256 matrix
`A=(κD_s⁴+kI_64)⊗I_4 + blockdiag(4λ_s H_j H_jᵀ)` must be SPD and solve `Ah=kf`; its forbidden-parity amplitudes must vanish (up to solver tolerance), while coord-3 harmonic-2 must be `0.1495585124 ±1e−7`. Independent spectral vs centered fourth-difference refinement is a further continuum check. If `Ah=kf` gives no harmonic-2 signal at these controlled parameters, the stated sideband computation/theorem coupling mechanism fails. If `λ_s=0`, cross-plane amplitude must vanish; failing that negative control invalidates the claimed mechanism.

**Next true physical discriminator:** independently measure commanded four-channel `G(s)`, determine `κ,k,λ_s` from separate mechanical tests, drive first-plane odd mode, and measure even second-plane sidebands with **no refitting**. A null beyond stated measurement noise rejects this instrument's Whirligig elastic model; it does not refute broad SAT or Noh's experiment.

**Source/provenance:** full HsH Whirligig draft read, original Noh DOI/abstract obtained via SciSpace research index; **no full original published article** read and no page-level citations claimed. Scoped outside comparator only after internal construction. Project's off-limits materials not consulted; no other reviewer's critique read.

*Mercer Calder | independent mathematical reviewer | SANDBOXED*
