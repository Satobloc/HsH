# Mercer h960:s4 | PNAS coefficient-lineage and observable-definition correction

**Artifact type:** additive source-correction to Meridian h960:s3, not a replacement or duplicate of the original report.  
**Original report:** https://github.com/Satobloc/HsH/issues/2144  
**Source:** Matsuzawa, Zhu, Goldenfeld & Irvine, PNAS, DOI 10.1073/pnas.2526858123; Supplementary Information, especially §§4A.3–4A.4, 4C.1–4C.4 and 5A–5E, Figs. S15–S17 and S22–S23, and Tables S6–S8.

## 1. Material correction: the adopted coefficients have different calibration parents

The original h960:s3 report describes c₀ and ε₀ too simply as two fitted parameters from the same small-blob front-growth window. The paper does show a two-parameter MSE surface over c₀ and ε₀, but it also reports a separate late-time estimate of ε₀ and explicitly identifies the adopted pair as coming from two different experimental conditions and time regimes:

- **ε₀ = 0.88 ± 0.10:** experimentally inferred from late-time decay of the **large turbulent blob**, Reλ = 203, n = 21, using the asymptotic energy-decay behavior and saturated integral length scale. Main Fig. 3B and SI Fig. S23b identify this as the large-blob estimate.
- **c₀ = 1.20 ± 0.11:** selected from the **small-blob** expansion-rate comparison, Reλ = 60, n = 10. SI Fig. S17b shows the c₀–ε₀ MSE landscape; at the experimentally inferred ε₀ = 0.88, its minimum occurs at c₀ = 1.2.

The main text first says both c₀ and ε₀ can be estimated from the instantaneous small-blob expansion-rate MSE, then says ε₀ can also be estimated from the large-blob late-time decay and uses that result with the small-blob comparison to set c₀. It later states explicitly that the adopted pair is identified from the decay of a large blob and the propagation/expansion of a small blob. Table S6 distinguishes these experiments and acquisition methods. The pair is therefore a **cross-condition calibration within one experimental study**, not simply a simultaneous fit to one small-blob dataset and not an independent holdout validation.

The MSE surface remains a joint trade-off diagnostic: it contains a diagonal band of minima. The late-time large-blob estimate of ε₀ selects a location on that band; the small-blob MSE then selects c₀ conditionally. The paper reports marginal uncertainties for the two coefficients, but the reviewed material does not supply a joint covariance or profile-likelihood interval for the pair.

A source cross-reference should also be preserved: the main-text sentence following the ε₀ estimate points to Fig. 5D when discussing the c₀ selection, while the Fig. 5 caption identifies panel C as the MSE map and SI §5B identifies main Fig. 5b–c plus SI Fig. S17. Treat the Fig. 5D pointer as a likely editorial cross-reference slip, not as a separate MSE result.

A further qualification matters: SI §4C.3 says the large-blob energy decay cannot be described adequately by one power law over the whole interval; two decay regimes are visible and the fit quality worsens as late-time data are included. Table S7's optimized all-window fit for the large blob is n = −1.32, t₀ = −0.15 s over 0–90 s. That is not itself the late-time t⁻² asymptote used in the dissipation estimate. The precise asymptotic fit window and virtual-origin treatment should be retained as source-method details rather than inferred from the all-window fit or borrowed from another experiment.

## 2. Preserve the two reported fitting windows and acquisition regimes

The main text describes the expansion-period MSE comparison over approximately **1–5.5 s**. The SI Fig. S17 caption specifies the MSE-map evaluation window as **1.2–5.0 s**. These are distinct source-reported descriptions. The latter is the specific window attached to Fig. S17b; do not silently replace it with the broader main-text interval or claim they are identical.

Table S6 identifies the small-blob Dataset 1 as 2D PIV, n = 10, constant-sequence acquisition. The large-blob Dataset 2 is 2D PIV, n = 21, logarithmic-sequence acquisition. The study's acquisition section explains that the logarithmic sequence decreases the camera frame rate as the decay slows. The two coefficient parents therefore differ in both physical condition and temporal sampling design.

The small-blob integral-length-scale fit has its own virtual origin and early-time scaling/saturation description. Do not substitute its t₀ = 0.5 s value for the large-blob decay analysis. The large-blob virtual-origin procedure is fit-window dependent; the SI explicitly warns that the large-blob decay is not a single power law across the full record.

## 3. Observable correction: R_blob is a second-moment readout, not a tracked boundary

SI §5B defines R_blob² as the turbulent-energy-weighted second moment of q(x,t) over the measurement volume. In spherical coordinates, the radial integrals are proportional to ∫r⁴q(r,t)dr and ∫r²q(r,t)dr. Its time derivative is obtained by differentiating this ratio.

Accordingly, R_blob is an operational characteristic radius of an energy distribution. Ṙ_blob is a **second-moment expansion rate**, not the velocity of a material boundary or a directly tracked interface. The paper's shorthand “front propagation” should be read in that operational sense.

The source-defined readout chain is:

1. measured velocity fields from 2D PIV or 3D PTV;
2. filtering, missing-vector handling, and Reynolds decomposition;
3. turbulent-energy density q(x,t);
4. ensemble and angular averaging to q(r,t);
5. moment integrals P(t) and Q(t);
6. R_blob(t) = sqrt(P(t)/Q(t));
7. time derivative Ṙ_blob(t);
8. MSE comparison with the model's transport-plus-dissipation prediction.

This chain matters geometrically: the fitted observable is a projected, averaged, moment-based readout. It is not a unique reconstruction of the full 3D energy field or its boundary. The paper's own Fig. S11 shows the distinct processing paths for front propagation, spatially averaged decay, and blob radius.

## 4. Initial-condition and comparison lineage

SI Fig. S15 says the 3D CDS simulation's initial condition is built from a single experimental 3D PTV energy distribution, filtered, zero-padded, and Gaussian-smoothed. The simulation's central slice is compared with the small-blob 2D PIV ensemble average (n = 10) and with a separate single 2D PIV run (n = 1). The paper explicitly distinguishes the smoother ensemble-average evolution from the branching, realization-sensitive single-run field.

The relevant provenance graph is therefore:

- large-blob 2D PIV, n = 21, logarithmic sequence → late-time q decay and saturated ℓ → ε₀ estimate;
- small-blob 2D PIV, n = 10, constant sequence → Ṙ_blob MSE surface → c₀ selected conditional on ε₀;
- small-blob 3D PTV, n = 1 → filtered 3D simulation initial condition;
- (c₀, ε₀, measured ℓ(t), initial condition) → 3D CDS simulation → central-slice comparison with small-blob 2D PIV.

These are distinct measurement and projection paths. Their composition should not be collapsed into a claim that one dataset independently validates the full model.

## 5. Late-time model limitation

SI §5E reports that using c₀ = 1.2 and ε₀ = 0.88 with the experimentally obtained ℓ(t) produces substantial disagreement in the energy-decay comparison. The authors attribute persistent late-time inhomogeneity to chamber interaction and lower c₀ from 1.2 to 0.001 after the turbulence reaches the wall (reported at t − t₀ = 2.15 s) to improve the simulated crossover.

That adjustment is a model adaptation for a later regime, not a validation of one fixed coefficient pair across the entire evolution. Preserve the early expansion calibration, the late-time discrepancy, and the subsequent coefficient change as separate facts.

## 6. Source algebra and verification status

The SI defines the dimensionless dissipation coefficient as ε₀ = εℓ/q^(3/2). Under its stated late-time assumptions, ℓ = ℓ_sat and q ∝ (t − t₀)⁻², while ε = −dq/dt. The dissipation-only late-time reduction is therefore:

- dq/dt = −ε₀ q^(3/2)/ℓ_sat;
- q(t) = 4ℓ_sat²/[ε₀²(t − t₀)²];
- ε₀ = 2ℓ_sat/[(t − t₀)√q(t)].

The last expression is dimensionless because (t − t₀)√q has units of length. A SymPy symbolic derivative check of the stated power-law solution against the ODE returned an exact zero residual. This is an algebraic source check, not a new physical calculation or a reproduction of the experimental estimate.

**Lean status: LEAN_NOT_RUN / AUTHORIZED_TARGET_NOT_AVAILABLE.** The proposition is explicit and formalizable: for positive ℓ_sat, ε₀ and τ = t − t₀, the stated q(τ) satisfies the stated ODE. The local runtime has no Lean, Lake or Elan executable. The documented formalization/leancheck/run.ps1 path is absent from current main. Existing PR #262 provides a working Lean 4.34.0 / Mathlib v4.34.0 Actions environment on an open, unmerged infrastructure branch; its exact-head run built 8,947 jobs successfully, but it does not contain this proposition. PRs #1852 and #1858 concern P2 comparison-freeze contracts, not this ODE. No worker-owned PR was modified and no new branch or PR was created. This is not FORMALIZATION_BLOCKED_DEFINITION: the mathematical statement is defined; execution is unavailable within the authorized current lane.

## 7. Evidence and scope boundaries

- Primary paper: https://doi.org/10.1073/pnas.2526858123
- Supplementary Information PDF copy inspected: https://guava.physics.ucsd.edu/~nigel/REPRINTS/2026/Matsuzawa%20decay%20and%20spread%20of%20turbulence%20PNAS%202026.pdf
- Source locators: main text around the small/large blob calibration discussion and the later cross-dataset coefficient statement; SI §§4A.3–4A.4, 4C.1–4C.4 and 5A–5E; Figs. S15–S17 and S22–S23; Tables S6–S8.
- The paper states that figure data are deposited at Zenodo DOI 10.5281/zenodo.18380405. That dataset was not downloaded or inspected in this run.
- No raw PIV/PTV data were analyzed; no new fit, physical prediction, independent measurement, or observational validation is claimed.
- P2 remains HOLD. No candidate system was selected, no P2 artifact was promoted, and no H(s)H/SAT theory claim was changed.
- Math Hopper was inspected as an existing extraction/provenance tool; it is not a proof engine and was not run. No callable Mersearch route was exposed, and no occupied request lane was touched. SciSpace did not return the exact supplementary source; the primary paper and SI were read directly.
- No SAT-O or Blockwave equation was accessed or modified. No BEDROCK theory promotion.

## 8. Disposition

This addendum supersedes only the overbroad description of the adopted c₀/ε₀ calibration lineage in the original Meridian h960:s3 report. The original report remains intact for audit history. The corrected reading is: **ε₀ is inferred from large-blob late-time decay; c₀ is selected from small-blob second-moment expansion MSE at that ε₀; the pair is cross-dataset calibration, not an independent holdout validation.**
