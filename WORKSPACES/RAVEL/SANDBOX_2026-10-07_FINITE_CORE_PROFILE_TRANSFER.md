# Ravel sandbox — widths do not identify transverse core type

**Date:** 2026-10-07 (America/New_York)  
**Status:** `GEN/CANDIDATE`; synthetic geometry/profile-transfer test, not empirical validation  
**Local namespace:** `LOCAL:RAVEL:CORE_PROFILE_TRANSFER`

## Ordinary-language checksum

A thick loop can have the same outside width whether its cross-section is filled material, a material disk, or a boundary shell. Far from tangency, a thick viewing layer measures almost the same total amount from all three. Near first contact, however, the way signal turns on reveals how material is distributed across the core.

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT PRE-H(s)H TIGHTENING.txt`, contiguous lines 1650–2350 of 5169, repository blob `054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`. The inspected passage contains Nathan's correction from a naïve zero-thickness timesheet toward a finite slab with flow dynamics, his distinction between t-bosons and a possible synchronized temporon wavefront, and his explicit instruction that these were ideas rather than finished mathematics. The same passage also records the gullibility/sanity-check failure of generated analysis. Historical constants, lattice claims, particle assignments, and fitted numerical closures in the surrounding source were not used. `⟦PROV:ARCHIVE:PRE-HSH-TIGHTENING·L1650–2350⟧`
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`, complete embedded **Meridian Run 134 — three-carrier observable phase diagram**, lines 2304–2468, repository blob `f324a1f82aa4f5db0bb3a01639ed40667eb29714`. Source fact retained: bulk `B^3`, material-support `B^2`, and boundary `S^2` carriers require typed readouts; eliminating a radius can leave isolated or continuous observable loci and may require an independent datum. Its numerical phase-diagram constants were not used as fitting targets here. `⟦PROV:HSH:PRECLOSE-RUN134·L2304–2468⟧`

The current project front door, Reference Desk, symbol/citation/toolbox controls, workflow orientation, task graph, scheduler authority, and HSH_RESOURCES routing surfaces were refreshed first. HSH_RESOURCES was used only for navigation/tool familiarity; no `PRIOR_ART` material or external theory was imported.

## Independent construction

Retain the previous circular carrier, flat slab, and widths

\[
R=1,\qquad d_\Sigma=0.08,\qquad r_c=0.06.
\]

Let `p(z)` be the normalized marginal density of core material along the slab normal. The finite-slab overlap is

\[
W_p(u;d_\Sigma,r_c)
=\int_{-d_\Sigma/2-u}^{d_\Sigma/2-u}p(z)\,dz.
\]

Three connected cores with identical support `[-r_c,r_c]` were compared:

\[
p_{B^3}(z)=\frac{3}{4r_c}\left(1-\frac{z^2}{r_c^2}\right),
\]

\[
p_{B^2}(z)=\frac{2}{\pi r_c^2}\sqrt{r_c^2-z^2},
\]

\[
p_{S^2}(z)=\frac{1}{2r_c}.
\]

These are respectively the normal-coordinate marginals of a uniform three-ball, uniform two-disk, and uniform two-sphere boundary.

All three have the same nonempty incidence condition,

\[
|u|\le a_{\rm eff},\qquad a_{\rm eff}=d_\Sigma/2+r_c,
\]

so binary support cannot distinguish them.

## Universal far-tilt law

The weighted loop signal is

\[
S_p(\theta)=\frac{1}{2\pi}\int_0^{2\pi}
W_p(R\sin\theta\sin\phi)\,d\phi.
\]

For any normalized compact marginal,

\[
\int_{-\infty}^{\infty}W_p(u)\,du=d_\Sigma.
\]

Therefore, when `R|sin(theta)|` is large compared with the contact width,

\[
\boxed{
S_p(\theta)\sim
\frac{d_\Sigma}{\pi R|\sin\theta|}
}
\]

independently of core radius and transverse profile. High-tilt signal plus support can identify the two widths while remaining almost blind to whether the core is `B^3`, `B^2`, or `S^2`.

## Contact-edge fingerprint

Let `g=a_eff-|u|` be the small positive penetration depth at first contact. Direct integration gives

\[
W_{S^2}\sim\frac{g}{2r_c},
\qquad
W_{B^2}\sim\frac{4\sqrt2}{3\pi r_c^{3/2}}g^{3/2},
\qquad
W_{B^3}\sim\frac{3}{4r_c^2}g^2.
\]

Thus the contact onset exponent—not the support radius—is the profile discriminator:

\[
\boxed{1,\quad 3/2,\quad 2}
\]

for shell, disk, and filled bulk respectively.

## Blind synthetic transfer

The hidden profile was selected by a fixed seed and revealed only after fitting: `S2_shell`. Four noisy high-tilt observations at `20, 35, 55, 80` degrees were used to fit `(d_Sigma,r_c)` independently under all three profile hypotheses. A 46-point sweep from `5.76` to `18` degrees was withheld.

| assumed profile | fitted `d_Sigma` | fitted `r_c` | training chi-square | withheld signal RMS |
|---|---:|---:|---:|---:|
| `B3_bulk` | 0.0799304 | 0.0597581 | 2.445 | 16.95 sigma |
| `B2_disk` | 0.0798857 | 0.0597805 | 2.352 | 11.51 sigma |
| `S2_shell` | 0.0798110 | 0.0598177 | 2.235 | 1.86 sigma |

The sparse training difference between best and worst profiles was only `Delta chi-square = 0.210`; it was not a decisive classifier. Nevertheless, every profile recovered both widths to better than `0.41%`. The withheld contact sweep then rejected the wrong profiles while retaining the hidden shell profile under the registered signal-transfer gate.

At `90 degrees`, all three signals agreed with `d_Sigma/pi` to within `8.7e-4` relative, numerically confirming the universal far-tilt law.

## H(s)H implication

Within this model, `r_c` is a support radius, not a complete specification of the finite core. A particle-like H(s)H state minimally requires

\[
(\text{centerline/worldtube history},\;r_c,\;p_\perp,\;d_\Sigma,\;R_\Sigma),
\]

or an equivalent transverse constitutive descriptor. Width recovery alone cannot decide whether the modeled carrier is filled bulk, lower-rank material support, or boundary-dominated.

The robust experimental hierarchy is therefore:

1. far-tilt weighted signal estimates slab thickness;
2. incidence support estimates slab half-width plus support radius;
3. dense contact-onset scaling estimates transverse profile class.

## Failure conditions

Reject this discriminator if:

- independently generated contact sweeps do not preserve the `1`, `3/2`, and `2` onset ordering after convolution with a declared instrument kernel;
- a wrong profile passes withheld signal transfer below `2 sigma` at the declared noise level;
- fitted widths change by more than 10% when profile class changes;
- anisotropy, off-center cores, or slab curvature reproduce the same residual signatures without an independently distinguishable channel;
- the inferred onset exponent changes materially with resolver density after physical resolution is held fixed.

## Next cursor

Replace ideal profile labels by a continuous edge exponent `alpha`, with `p(z) ~ (r_c-|z|)^alpha`, and infer `(d_Sigma,r_c,alpha)` jointly. Transfer the inferred exponent to a second slab thickness. If `alpha` does not transfer, it is an acquisition-kernel property rather than a carrier descriptor.

## Artifacts

- `WORKSPACES/RAVEL/CODE/finite_core_profile_transfer.py`
- `WORKSPACES/RAVEL/DATA/finite_core_profile_transfer.json`
- `WORKSPACES/RAVEL/FIGURES/finite_core_profile_transfer.svg`
