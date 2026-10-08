# SANDBOXED | Whirligig Clifford-Torus Elastic Back Hallway | 8 Oct 2026

**Status:** mathematical research draft, independently tested in local code; NOT independently reviewed; no claim of physical truth or priority. Prepared for Nathan McKnight author review. **Reason for the exercise:** actually calculate with the Whirligig/Universal Indicatrix (UI), isolate a valid cross-framework translation, and submit it to hostile scrutiny.

## Historical SAT source and scope
- SAT archival source: [4DHH Lagrangian](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/4DHH%20LAGRANGIAN%20(nolat).txt).
- [THE WHIRLIGIG](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/HsH-SAT%20Roundup%203/THE_WHIRLIGIG.txt).
- [Finding the Donut](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/FINDING%20THE%20DONUT%20(nolat).txt).
- Nathan-supplied 8 Oct equation sheet: UI y(s)=r(s)R(s)x0, R in SO(4); Whirligig bending + sphere penalty + source coupling.
- The framework already contains many alternative formulations. **This note concerns only the explicitly given fourth-order functional.**

## Analytic setup
For 2π-periodic H,G: S¹→ℝ⁴, κ,k>0 and λ_s≥0, use

`J[H;G] = ∫ [κ/2 |H''|² + λ_s/2 (|H|²−R²)² + k/2 |H−G|²] ds`.

Euler–Lagrange: `κ H^(4) + 2λ_s(|H|²−R²) H + k(H−G) = 0` with G held fixed under variation.

Take the exact two-frequency UI orbit `H(s)=(a cos(ms), a sin(ms), b cos(ns), b sin(ns))`, m,n integers, a²+b²=R²; `R_UI(s)=diag(Rot(ms),Rot(ns))`, `x0=(a,0,b,0)/R`, `r(s)=R`. This is a fixed-radius special case of the UI, not a replacement for the expansion program.

**Theorem A (geometric defect)**:

`R²|H''|²−|H'|⁴ = a²b²(m²−n²)² ≥ 0`.

The right side measures the failure of the orbit to be a great-circle geodesic on round S³; vanishes if |m|=|n| or one circle collapses. Proof by expanding H' and H'' and using R²=a²+b².

**Theorem B (exact forcing)**:

`G_*(s)=H(s)+(κ/k) H^(4)(s)`.

Then H is an **exact stationary curve** of the given Whirligig action because |H|²=R² eliminates the sphere-penalty force. Its second variation is

`δ²J = ∫ [κ|η''|²+k|η|²+4λ_s(H·η)²]ds > 0` for every nonzero periodic η.

Hence H is a strict local minimizer (positive stiffness). By contrast, choosing G=H leaves κ H^(4)=0; a nonconstant two-frequency torus path does **not** automatically satisfy the original unforced/homogeneous-target E-L equation. This corrects overstrong prose in some archival summaries without discarding the apparatus.

**Theorem C (precisely scoped physical/mathematical back hallway)**:

A standard periodically forced Euler–Bernoulli beam on a Winkler foundation minimizes `∫_0^L [EI/2 |w_xx|² + K/2 |w−g|²]dx`, giving `EI w_xxxx + K(w−g)=0`. After `s=2πx/L`, its Fourier transfer is

`w_j/g_j = [1+α j^4]^−1, α=(EI/K)(2π/L)^4`.

On the shell-satisfying UI orbit above, each Whirligig coordinate obeys exactly the same transfer, with α=κ/k. This is a **restricted operator equivalence**, not a full equivalence between the nonlinear Whirligig functional and the beam for arbitrary off-sphere curves, and emphatically not a GR–QM isomorphism.

**Held-out test with no refitting**: infer α from one independently commanded/observed mode j=m, then require `(g_m/w_m−1)/m⁴=(g_n/w_n−1)/n⁴` at mode n. A mismatch with measured errors rejects this simple hallway. Physical actuation G must be independently measured, not invented after seeing H.

**Theorem D (Lie-group identity)**:
For z1=a exp(ims)/R, z2=b exp(ins)/R, `U=[[z1,−conj(z2)],[z2,conj(z1)]]∈SU(2)` and `|H''|²=(R²/2)Tr(U''†U'')`. UI rotations are in SO(4), with spin cover Spin(4)≅SU(2)_L×SU(2)_R; do not conflate this with SU(4). This resolves the group for **this** curve family but not the previously claimed Schwarzschild↔gauge transformation.

## Fully numerical synthetic test
Use m=2,n=3, a=b=1/√2, κ=.02, k=1, λ_s=5, R=1. **Independent output**:
- Euler–Lagrange max pointwise residual = **2.48e-15**
- geometric defect left = 6.25; right = 6.25
- action = 7.330592297886421 (dimensionless)
- target/response amplitude m=2: 1.32; n=3: 2.62.
- α from m=2 is .020000000000000004; α from n=3 is .02.
- SU(2) unitarity and determinant checks ~1e-15 or smaller.
- finite-difference fourth derivative errors N=128,256,512,1024: 0.20747,0.05193,0.01299,0.003248 (expected second-order convergence).
- Small nonzero Fourier perturbations increase action; numerical second variation positive.

Executable reproducibility exists in accompanying generated conversation artifact `whirligig_torus_test.py` and an 8-page RevTeX/PDF draft. For a repository mirror, commit this script once a code-upload route is available.

## Caveats and no-overclaim gate
- This is **not experimentally verified**, not mathematically prioritized, and it does **not** derive Schwarzschild or Hydrogen or solve Navier–Stokes.
- Inverse forcing is designed from the desired H, so it is not itself predictive; the prospective held-out prediction only works when G is independently prescribed and one stiffness ratio is calibrated from other data.
- The (S³\cong SU(2)) identity and beam transfer are conventional mathematics; the SAT-specific framing/combination is the thing being tested. No novelty assertion without literature search.
- Referees must identify any false group, energy, regularity, or target assumption and must not reward impressive language over transparent mathematics.

## Hostile peer-review comparator packets
**Meridian:** compare with T. Asselmeyer-Maluga, “Braids, 3-Manifolds, Elementary Particles: Number Theory and Symmetry in Particle Physics,” *Symmetry* **11** (2019) 1298, https://doi.org/10.3390/sym11101298. An archival source copy is in HSH_RESOURCES (internal citation only; cite publisher publicly).

**Mercer:** compare with published Jiho Noh et al. research on “Braiding photonic topological zero modes,” *Nature Physics* **16** (2020) 989–993, https://doi.org/10.1038/s41567-020-1007-5. HSH_RESOURCES contains a secondary report; the comparator is the original journal article.

**Same mandatory reviewer question:** “Better or worse than the published paper? Why or why not?” Specify whether comparison is of mathematical correctness, model discrimination, experimental execution, novelty, clarity, or scope. Provide a fatal-flaw check, smallest possible repaired theorem, and a proposed hostile replication test. Judge the draft independently; no collaboration/consensus before submitting first review.
