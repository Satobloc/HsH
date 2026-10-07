# Ravel sandbox — blind recovery of slab thickness and core radius

**Date:** 2026-10-07 (America/New_York)  
**Status:** `GEN/CANDIDATE`; synthetic inverse test, not empirical validation  
**Local namespace:** `LOCAL:RAVEL:FINITE_SLAB_INVERSE`

## Ordinary-language checksum

A thick loop passing through a thick viewing layer leaves two different clues:

1. how much of the loop touches the layer;
2. how much loop material lies inside it.

Those clues depend differently on layer thickness and loop thickness. Together they may separate the two. Near the instant when the whole loop stops fitting inside the layer, however, the binary shape label is hypersensitive.

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CORRECTION TO RMS CRITIQUE .txt`, complete file, lines 1–227, 18,750 characters, blob `f77dd3d360d8f0357e36e671ae04c4bf04972281`. The controlling Nathan corrections require candidates to be extracted from visible differences in empirically constrained 4D geometry, preserve a bidirectional benchmark trail, and return a null/open result instead of filling gaps speculatively. `⟦PROV:RMS-CORRECTION·L15–202⟧`
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/helix_intersection_visualizer.txt`, complete file, lines 1–68, 2,275 characters, blob `d1b9746e1b9d2cacc37855fad852fca02aa79c35`. The script draws a thin helix and a zero-thickness plane, but computes neither their intersection set nor a finite-core/slab measure. It is used here as a negative implementation control, not as a result. `⟦PROV:HSH-HELIX-VIS·L1–68⟧`
3. `Satobloc/HsH/🔑/ORSONS_ADVICE.md`, complete file, lines 1–253, 9,956 characters, blob `cd7cfd8539e1e115798ab5a009cfb566b0aa646b`. Applied directly: orient in ordinary geometry, draw it, calculate a controlled case, declare a failure gate, and separate carrier from readout.

The project front door, BigBook index, HSH_RESOURCES toolkit router, Tool Chest, and preference router were refreshed first. No `PRIOR_ART` or external theory was imported.

## Prior derived fixture

For a circular carrier of radius `R`, slab thickness `d_Sigma`, core radius `r_c`, and clipping tilt `theta_clip`, the two observables are

\[
f_{\rm inc}(\theta)
=\frac{\text{centerline phase with nonempty core/slab incidence}}{2\pi}
\]

and

\[
S(\theta)=\frac1{2\pi}\int_0^{2\pi}
W\!\left(R\sin\theta\sin\phi;d_\Sigma,r_c\right)d\phi,
\]

where `W` is the compact-support 3-ball/slab overlap fraction derived in the preceding checkpoint.

These are not redundant:

\[
f_{\rm inc}\sim
\frac{2(d_\Sigma/2+r_c)}{\pi R|\sin\theta|},
\qquad
S\sim\frac{d_\Sigma}{\pi R|\sin\theta|}
\]

at high tilt. Support sees `d_Sigma/2+r_c`; weighted signal sees `d_Sigma` at leading order.

## Blind synthetic test

Hidden generator values:

\[
R=1,\qquad d_\Sigma=0.08,\qquad r_c=0.06.
\]

Training used only six tilts

\[
8^\circ,12^\circ,20^\circ,35^\circ,55^\circ,80^\circ
\]

with independent Gaussian noise

\[
\sigma_f=6\times10^{-4},\qquad
\sigma_S=3\times10^{-4}.
\]

Seven tilts were withheld:

\[
6^\circ,10^\circ,15^\circ,27^\circ,45^\circ,65^\circ,90^\circ.
\]

The registered gate failed the architecture if either width error exceeded 10%, withheld aggregate RMS exceeded `2 sigma`, or five multistarts disagreed by more than `1e-5`.

## Recovery

| quantity | hidden | recovered | relative error |
|---|---:|---:|---:|
| slab thickness `d_Sigma` | 0.0800000 | 0.0799640 | −0.0450% |
| core radius `r_c` | 0.0600000 | 0.0599048 | −0.1587% |

- All five starts converged to within `4.06e-13` in parameter space.
- Weighted Jacobian condition number: `1.97`.
- Training chi-square: `4.16` for twelve observations.
- Withheld aggregate RMS: `1.10 sigma`.
- A zero-core null gave `chi-square = 383466`, versus `4.16` for the two-width model.
- The registered aggregate gate passed.

Across 160 independent noise realizations:

| parameter | median | 16th percentile | 84th percentile |
|---|---:|---:|---:|
| `d_Sigma` | 0.0800144 | 0.0798973 | 0.0801118 |
| `r_c` | 0.0600056 | 0.0599248 | 0.0600931 |

The recovered widths were moderately anticorrelated (`rho=-0.557`), but not degenerate.

## The more important result: topology is ill-conditioned at contact

The hidden and recovered critical tilts were

\[
\theta_c^{\rm true}=5.739170^\circ,
\qquad
\theta_c^{\rm fit}=5.732651^\circ.
\]

The shift was only

\[
-0.006519^\circ,
\]

yet the withheld incidence fraction at `6 degrees` missed by `3.92 sigma`. The weighted signal at the same tilt missed by only `0.60 sigma`.

This is not a solver failure. It follows from the intersection cusp. Just above the critical tilt, write `Delta theta = theta-theta_c > 0`. Then

\[
\kappa
=\frac{a_{\rm eff}}{R\sin\theta}
\approx
1-\frac{R\cos\theta_c}{a_{\rm eff}}\Delta\theta,
\]

and therefore

\[
\boxed{
1-f_{\rm inc}
\approx
\frac{2}{\pi}
\sqrt{
2\frac{R\cos\theta_c}{a_{\rm eff}}\Delta\theta
}}
}
\]

with a formally divergent slope at onset. The categorical morphology transition is intrinsically ill-conditioned even when the underlying widths are well recovered.

## H(s)H implication

Within this model, a robust readout should transport the continuous finite-core measure `W` or `S` first. “Full loop” versus “two arcs” should be a derived topology label carrying threshold uncertainty, not the primary particle-like state.

This weakens the earlier temptation to encode contact membership as a discrete transported coordinate. A stable worldtube may generate unstable categorical readouts near tangency without changing its carrier geometry.

## Failure conditions and discriminator

The round-core/slab mechanism fails if:

- joint support/signal data cannot recover both widths under independent channel families;
- the recovered widths do not transfer to withheld tilts;
- observed incidence onset is incompatible with the square-root cusp;
- weighted signal is as singular as the support topology despite instrument deconvolution;
- nonzero tails persist outside the predicted compact contact band;
- a different core cross-section predicts the data materially better with equal complexity.

The next physical/solver discriminator is to replace P9's softplus with this exact overlap kernel, infer `(d_Sigma,r_c)` from one sparse resolver family, and transfer them unchanged to a different density and tilt ladder. The widths are promoted only if transfer succeeds.

## Artifacts

- `WORKSPACES/RAVEL/CODE/finite_slab_width_inverse.py`
- `WORKSPACES/RAVEL/DATA/finite_slab_width_inverse.json`
- `WORKSPACES/RAVEL/FIGURES/finite_slab_width_inverse.svg`

## Next cursor

Run the exact kernel inside the P9 nuisance-refit pipeline. Track continuous weighted contact, inferred widths, and the uncertain topology label separately. The mechanism is killed if the widths become resolver-specific calibration parameters.
