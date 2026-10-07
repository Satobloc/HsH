# Ravel sandbox — continuous finite-core edge exponent and two-slab transfer

**Status:** `GEN/CANDIDATE`; siloed playground result, not canonical SAT/H(s)H.  
**Date:** 2026-10-07  
**Scope:** finite-core intersection morphology under a locally flat resolving slab.  
**Controlling correction:** the current key document withdraws the old `H0+c` / dual-shell picture. Any large-scale variation is treated as metric-gradient / normal-orientation geometry, not as multiple expansion speeds.

## Sources actually read

1. **Archive primary source:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H 2026 STARTUP DOCS.txt`, sequential lines 1–600 of the retrieved opening, blob `68200d849152dcb0c4fc1814f8b1789d499ebca8`.
   - Nathan's firsthand opening (lines 4–11) states the old construction as a standard-physics-constrained Minkowski mapping, followed by geometric inspection, controls, holdouts, and cross-sector promotion.
   - The embedded supervisory response (lines 59–106) makes the worldline-to-worldtube step explicit: cross-sectional type, thickness, normal-bundle transport, bulk/boundary distinctions, contact and resolving-sheet morphology must be typed; the worldline must be recovered as a controlled limit.
   - Nathan's correction and the following restatement (lines 353–448) sharpen the transition: finite thickness/bending were already implicit; H(s)H must explicitly locate finite-core boundary, contact, rotation, and intersection morphology without pretending the interior is externally accessible.
   - Historical particle assignments, ER/Kerr identifications, constants, lattice claims, and named spectra were not used.

2. **HsH September-30 dump:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`, complete embedded **Meridian Run 111**, lines 2641–2762, blob `f324a1f82aa4f5db0bb3a01639ed40667eb29714`.
   - Its local theorem says a compact connected carrier's scalar contact/existence set reduces to the one-dimensional support interval.
   - It explicitly limits that universality: density-weighted, boundary, cross-sectional, and disconnected-fiber observables retain more shape information.

The front door, current key, Common reference desk, symbol/citation/toolbox controls, workflow orientation, task graph, scheduler rule, and HSH_RESOURCES routing packet were refreshed first. HSH_RESOURCES was used only for navigation/tool familiarity. No `PRIOR_ART` source was opened.

## Source fact → inference → new conjecture

### Source facts

- SAT's old 4D construction is a centerline-dominant Minkowski map that must be retained as the thin-core limit.
- H(s)H must explicitly type finite-core boundary/contact/intersection structure.
- Binary contact support is provably blind to connected transverse shape once the support interval is fixed.

### Inference

The earlier discrete labels (S^2,B^2,B^3) should first be embedded in a continuous transverse-profile family. Otherwise a fit can only choose among our labels; it cannot test whether nature/model geometry lies between them.

### New sandbox conjecture

Use a local, symmetric, normalized normal marginal

\[
p_{\alpha}(z)
=\frac{C_{\alpha}}{r_c}
\left[1-\left(\frac{z}{r_c}\right)^2\right]^{\alpha},
\qquad |z|<r_c,\quad \alpha>-1,
\]

with

\[
C_{\alpha}
=\frac{\Gamma(\alpha+3/2)}
{\sqrt{\pi}\,\Gamma(\alpha+1)}.
\]

This contains the earlier marginals as (alpha=0) (uniform shell marginal), (alpha=1/2) (disk marginal), and (alpha=1) (filled three-ball marginal), while allowing intermediate edge morphology.

For slab thickness (d_{\Sigma}), signed center offset (u), and CDF (F_{\alpha}),

\[
W_{\alpha}(u)
=F_{\alpha}\!\left(\frac{d_{\Sigma}}2-u\right)
-F_{\alpha}\!\left(-\frac{d_{\Sigma}}2-u\right).
\]

At first penetration (g=d_{\Sigma}/2+r_c-|u|\downarrow0),

\[
1-(z/r_c)^2\sim\frac{2(r_c-z)}{r_c},
\]

so

\[
\boxed{
W_{\alpha}\sim
\frac{C_{\alpha}2^{\alpha}}
{(\alpha+1)r_c^{\alpha+1}}
g^{\alpha+1}
}.
\]

The observable onset power is therefore

\[
\boxed{\beta_{\rm edge}=\alpha+1}.
\]

This continuously generalizes the prior powers (1,3/2,2).

## Two-slab transfer experiment

A fixed-seed synthetic fixture hid

\[
(d_{\Sigma,1},d_{\Sigma,2},r_c,\alpha)
=(0.080,0.140,0.060,0.650).
\]

The first slab used 13 noisy tilt observations spanning full incidence, first contact, intermediate tilt, and far tilt. A five-start fit recovered ((d_{\Sigma,1},r_c,\alpha)). Only (d_{\Sigma,2}) was then estimated from nine high-tilt observations in the second slab. The second slab's 55-point contact sweep was withheld.

| Quantity | Hidden | Recovered | Relative error |
|---|---:|---:|---:|
| (d_{\Sigma,1}) | 0.080000 | 0.079963 | −0.046% |
| (r_c) | 0.060000 | 0.060021 | +0.035% |
| (alpha) | 0.650000 | 0.647017 | −0.459% |
| (d_{\Sigma,2}) | 0.140000 | 0.140180 | +0.129% |

Five optimizer starts agreed to (2.82\times10^{-9}) in (alpha) and better in both widths. The local log-slope was (1.649955), versus the derived (1.650000).

The withheld second-slab RMS was (2.71\sigma). This is a useful near-pass rather than a clean success: the continuous model transfers far better than the wrong fixed profiles, but the present noise realization and high-tilt-only calibration do not clear a strict (2\sigma) gate.

| Fixed profile | First-slab training (chi^2) | Withheld second-slab RMS |
|---|---:|---:|
| (alpha=0), shell marginal | 7582.23 | (36.67\sigma) |
| (alpha=1/2), disk marginal | 226.90 | (8.29\sigma) |
| (alpha=1), filled-ball marginal | 732.09 | (10.66\sigma) |
| fitted continuous (alpha) | 20.59 | (2.71\sigma) |

## 4D translation

Let (n_{\Sigma}(\tau)) be the local resolving-surface normal and (X(\phi,s)) the finite-core carrier history. The relevant offset is not a second expansion speed:

\[
u(\phi,s;\tau)
=n_{\Sigma}(\tau)\cdot
\bigl[X(\phi,s)-x_{\Sigma}(\tau)\bigr].
\]

Metric curvature or angular/torsional transport of (n_{\Sigma}) changes where contact occurs. The candidate material descriptor (alpha) should not change merely because the slab thickness or known normal orientation changes. Thus H(s)H minimally needs separate slots for:

\[
(\text{carrier history},r_c,p_{\perp};\ \Sigma,n_{\Sigma},d_{\Sigma};\ R_{\Sigma}).
\]

The semicolon separation is conceptual, not a claim that these sectors are dynamically independent.

## Failure conditions

Reject (alpha) as a transported finite-core descriptor if any of the following occurs after declared instrument convolution:

1. independently inferred (alpha) changes with slab thickness or normal orientation beyond uncertainty;
2. the edge log-slope fails to approach (alpha+1) under resolution refinement;
3. the continuous model fails a (<2\sigma) second-slab contact transfer after estimating only the new slab thickness;
4. the fit is not stable under profile-family expansion (asymmetry, layering, or noncompact tails);
5. a disconnected/layered carrier with projection gaps fits equally well, invalidating the connected-profile premise.

## Next calculation

Repeat the two-slab experiment over many noise realizations with a physical instrument kernel and a slowly rotating (n_{\Sigma}(\tau)). Jointly fit one shared ((r_c,\alpha)), slab-specific (d_{\Sigma}), and declared normal-transport parameters. The decisive discriminator is whether the recovered (alpha) remains common while contact locations move exactly with the transported normal.

## Reproducibility

- Solver: `WORKSPACES/RAVEL/CODE/finite_core_edge_exponent_transfer.py`
- Data: `WORKSPACES/RAVEL/DATA/finite_core_edge_exponent_transfer.json`
- Figure: `WORKSPACES/RAVEL/FIGURES/finite_core_edge_exponent_transfer.svg`

