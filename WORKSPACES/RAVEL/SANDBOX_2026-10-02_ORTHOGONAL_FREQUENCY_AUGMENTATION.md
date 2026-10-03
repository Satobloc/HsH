# Ravel sandbox checkpoint — orthogonal frequency augmentation

**Status:** SILOED PLAYGROUND / GEN-CANDIDATE, not canonical theory.

## Exact question

Does an independently controlled carrier-frequency axis make the fast sector of the positive relaxation spectrum atom-identifiable, when the radius-only inverse failed its grid-refinement width test?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT XY/JUNE 1 PHASE V-.txt` — substantial sequential read of the June-1 Phase-V planning, blind-retrodiction recipes, outcomes separation, and later test construction. Retained only the methodological control “separate calculations from expected outcomes.” The document's many finished-physics claims and historical constants were not imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — full sequential read. Retained the direct-readout inversion discipline and use of distinct scaling laws as discriminators. Its finite-slab coefficients were not imported.
3. Google Drive query `radius frequency H(s)H spectral readout` — metadata plus best-effort content search; no relevant H(s)H result, so no Drive content entered the construction.
4. Public Slack query for joint radius/frequency readout — targeted search. It recovered earlier Ravel/Calder sandbox checkpoints, but no prior solution to this inverse problem; used only to avoid duplicate framing.

## Source fact → inference → new construction

**Source fact:** the historical SAT workflow explicitly proposed hiding expected outcomes until after calculation. The current H(s)H endpoint note treats directly measured readouts and scaling exponents as the legitimate inverse variables.

**Inference:** radius-only pole measurements trace one correlated curve through the constitutive kernel. A second, independently controlled coordinate should change the kernel without changing the material spectrum.

**New sandbox construction:** retain the prior synthetic constitutive fixture

\[
D(z;a,\nu)=\left(\frac{\nu}{a}\right)^2-z^2
-iz\,a^q\!\int_0^\infty\frac{d\mu(\tau)}{1-iz\tau}=0,
\]

but observe three known carrier multipliers

\[
\nu\in\{0.65,1,1.55\}
\]

at each of the same 41 radii. The unknown positive measure \(\mu\) is shared across frequency channels. No new response coefficient is fitted. Each frequency channel has independent repeat noise with the same within-radius correlation law, and validation withholds the same radius indices from all channels together.

The inverse remains the nonnegative grid problem

\[
\min_{w_j\ge0}\left[
\sum_{\nu}\|L_\nu^{-1}(b_\nu+B_\nu w)\|_2^2
+\lambda h^{-3}\|D_2w\|_2^2
\right],
\]

with predictive-evidence averaging over the unchanged 14-value \(\lambda\) path. The 50 seed IDs, 192 repeats, six grids, intervals, and conditioned \(q=2.4\) are exactly those of the radius-only comparison. Truth is attached only after blind summaries are built.

## Result

The added frequency axis materially improves the inverse but does **not** earn atomicity.

- Blind kernel numerical rank at relative threshold \(10^{-3}\): **6 → 8**.
- Blind stable rank: **1.029 → 1.117**.
- Wide-grid fast-sector medians contract with refinement: **0.1165 → 0.0855 → 0.0699** in physical log-width.
- But their 97.5% bounds expand: **0.2855 → 0.4514 → 0.5471**.
- The corresponding radius-only bounds were **1.5501 → 1.6583 → 1.6675**. Thus the finest-grid uncertainty bound falls by about **67%**, yet still fails the required contraction test.
- Wide-grid endpoint-mass U95 falls from **0.207–0.305** (radius only) to **0.0037–0.0174** (joint), so most of the former ambiguity was boundary leakage rather than true broad support.
- Blind centroids stabilize near **0.248** and **2.000**, with mass split near **0.600/0.400**, before the posthoc fixture reveal \((0.25,2.0;0.6/0.4)\).

## Interpretation and failure condition

The orthogonal frequency coordinate is informative: it sharply suppresses boundary leakage and improves sector location. It still does not distinguish a narrow continuous band from an atom in the worst 2.5% of noise realizations. The surviving noncontraction is a property of this pole-location readout/inverse pair, not evidence that the underlying worldtube morphology itself is broad.

**Unresolved design choice:** only one untuned three-frequency placement was tested. The multipliers are known controls, not fitted parameters, but their placement is still an intervention choice; no claim of optimal frequency design is made.

**Failure condition:** declare atom recovery unsupported whenever the physical-width upper bound fails to decrease under grid refinement, even if centroid and mass are accurate. This run fails that condition on both intervals.

## Discriminator / experiment candidate

At the same radii and carrier frequencies, measure the **complex pole residue** as well as the pole location. Fit one shared positive measure to both observables, with no added constitutive sector. A true discrete two-timescale response should make the joint location–residue width U95 contract as \(h\to0\); persistent noncontraction would show that this response kernel cannot certify atomic morphology from linear readout alone.

## Artifacts

- `spectral_joint_radius_frequency.py`
- `spectral_joint_radius_frequency_summary.json`
- `spectral_joint_radius_frequency.json`
- `spectral_joint_radius_frequency.svg` and `.png`

## Exact next dependency

Derive the pole-residue Jacobian for the same dispersion relation and run the pre-registered joint location–residue inversion on the identical 50 seeds and six spectral grids; add no new relaxation component unless the width bound still fails.
