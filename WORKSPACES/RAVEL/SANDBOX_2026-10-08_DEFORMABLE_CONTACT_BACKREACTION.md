# Ravel sandbox — deformable contact backreaction

**Status:** SILOED PLAYGROUND / `GEN/CANDIDATE`. This is a synthetic continuum-mechanics test, not canonical SAT/H(s)H theory and not evidence for a particle model.

## Result in one sentence

Replacing the prescribed contact window by a compliant pad field produces a negative-definite, nonlocal director self-interaction; the polar finite-core architecture still selects the retained domain, the annulus still does not, and the existing five-coordinate wall closure predicts the full-field crossing within 0.81% over the tested pad stiffness range.

## Exact source record

### Historical SAT archive — substantially read

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt`, lines 1–650, read as a contiguous region. The relevant source facts are:

- SAT filaments are placed near standard worldlines, embedded/framed curves, rigid-particle models, and elastic-rod mechanics.
- the historical “Obscuration Constant” is translated cautiously as a regulated overlap/contact functional rather than a fundamental constant;
- “Braid Force” is translated as a linking/contact potential;
- finite tube radius and minimum curvature radius are named as possible regulators;
- the document repeatedly warns that translation is not identity and that universality requires proof.

This file is a historical translation/prior-art draft. Its particle labels and historical constants were not used as numerical targets.

### H(s)H September 30 dump — substantially read

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/Glass_Sausage_Factory_copy_rewrite_Nathan_voice.md`, lines 1–500, read as a contiguous region. The relevant source facts are:

- the project’s generative kernel is world history → local readout → recursion/inheritance;
- the current programme is described as reconstruction of the older centerline/filament picture at finite-core worldtube resolution;
- cross-section, boundary dynamics, contact, deformation, exclusion, and readout are explicitly separated as modeling problems;
- source, synopsis, reconstruction, computational experiment, and current premise are explicitly different authority classes.

I also inspected `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NAUTILUS ARTICLE EVOLVING.txt`, lines 1–900, as secondary historical context. Its force-as-deformation language was not used as formal authority.

### Routing and external-reference boundary

Before corpus-wide retrieval I issued Mersearch request `2026-10-08-ravel-deformable-contact-backreaction-001` in `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`. No result packet was indexed during this run. `HSH_RESOURCES` was used only to identify standard elasticity/continuum-mechanics as the appropriate comparison family; no resource-library proposition was imported as SAT/H(s)H theory.

## Translation into current H(s)H language

**Source fact:** the historical construction supplies a contact/overlap functional on a curve-like carrier; current H(s)H requires finite cross-section, boundary response, contact, and deformation to become explicit.

**Ravel inference:** if the 4D object is taken seriously as a finite worldtube, then the local contact envelope cannot remain a fitted readout mask. It is a deformation state of the contacting worldtube/pad and must respond to the same internal orientation it reads.

**New sandbox conjecture:** a retained director domain and a compliant polar contact form a positive feedback loop. The domain lowers unilateral contact energy; the pad indents further where that energy is lower; the added indentation strengthens the domain-selecting bias. Annular contact lacks the necessary polarity and remains the compulsory null.

## Smallest coupled mechanics

All symbols below are local to `LOCAL:RAVEL-DCP`.

Let `psi(s)` be the finite-core material director, `h(s)` the contact amplitude, and `h_t(s)` an exact top-hat actuator footprint. Define

\[
E[\psi,h]=\int_0^1\left[
\frac{C}{2}\psi_s^2+\frac{K}{2}\sin^2\psi
+\Lambda hV(\psi)
+\frac{B_p}{2}h_s^2+\frac{A_p}{2}(h-h_t)^2
\right]ds,
\]

where `V(psi)=U_c(psi)-U_c(0)` and `U_c` is the previously computed unilateral circumference-contact energy. The field equations are

\[
-C\psi_{ss}+\frac{K}{2}\sin(2\psi)+\Lambda hV'(\psi)=0,
\]

\[
-B_ph_{ss}+A_p(h-h_t)+\Lambda V(\psi)=0,
\]

with `psi(0)=psi(1)=h(0)=h(1)=0`. The pad relaxation length is

\[
\ell_p=\sqrt{B_p/A_p}.
\]

The actuator footprint is sharp, but the realized contact edge is not prescribed: it emerges from the second equation.

### Eliminating the pad

Write `L_p=-B_p d^2/ds^2+A_p` and `h_0=L_p^{-1}(A_ph_t)`. Exact minimization over `h` gives, up to the director-independent pad baseline,

\[
E_{\rm eff}[\psi]=E_{\rm dir}[\psi]
+\Lambda\langle h_0,V\rangle
-\frac{\Lambda^2}{2}\langle V,L_p^{-1}V\rangle.
\]

The last term is non-positive because `L_p` is positive definite. This is the concrete backreaction mechanism: compliance adds a nonlocal attractive self-interaction in the contact-energy contrast. It was not inserted as a new angular potential.

## Numerical discriminator

Parameters were held at `C=0.010`, `K=0.050`, `A_p=40`; no historical constant or particle datum was fitted. At every director iterate the pad equation was solved exactly. The full director field was compared with the same five-coordinate boundary-exact kink/antikink family used in the preceding checkpoint.

| pad length `ell_p` | full crossing `Lambda_*` | five-coordinate crossing | relative error |
|---:|---:|---:|---:|
| 0.012 | 11.74610 | 11.84077 | 0.806% |
| 0.025 | 12.04053 | 12.10595 | 0.543% |
| 0.050 | 12.98705 | 13.02858 | 0.320% |

For `ell_p=0.025`, the near-crossing director RMS mismatch was `0.00859 pi`, the pad-field RMS mismatch was `6.18e-4`, and the full pad peak was `1.0159`. The inferred threshold was grid-stable:

| director grid | crossing |
|---:|---:|
| 121 | 12.03988 |
| 181 | 12.04055 |
| 241 | 12.04136 |
| 321 | 12.04086 |

The largest checked pad force-balance residual was `8.88e-13`; the largest director gradient infinity norm was `1.85e-7`.

### Compulsory null

The annular contact potential was run through the identical coupled solver. It produced no energy crossing over `Lambda in [4,13.5]`; its smallest domain excess was `+0.21656`. Thus compliance alone does not manufacture directional selection. The one-sided polar contact remains the operative symmetry break.

## What follows if the 4D picture is taken seriously

1. **Contact morphology is memory-bearing state.** Readout strength and the object being read are coupled; the effective interaction is generally nonlocal after the contact field is eliminated.
2. **A particle-like reduced coordinate can survive contact backreaction.** Here the five director coordinates remain predictive even after adding an entire pad field, because the pad is slaved by a convex force balance.
3. **Softer/broader contact is not automatically stronger selection.** Increasing `ell_p` spreads the load beyond the favorable domain and raises the crossing from `11.746` to `12.987` in this parameter family.
4. **Polarity remains essential.** A deformable annulus is still blind to the director reversal relevant here.

These are conditional consequences of this toy functional, not general H(s)H claims.

## Failure conditions

Reject this architecture, or at least this closure, if any of the following occurs:

- the annular null develops a comparable crossing under refinement;
- the full-field crossing ceases to converge when the actuator footprint is integrated rather than point-sampled;
- the five-coordinate error exceeds 1% or the pad RMS exceeds `1e-2` over a physically relevant stiffness range;
- a physically constrained contact law forces `h<0`, unbounded indentation, or loss of convexity near the claimed threshold;
- adding pad dynamics removes the retained branch rather than producing a finite relaxation/hysteresis window.

The present model is static. It does not yet establish dynamical persistence, transport, dissipation, or a particle lifetime.

## Next solver/experiment

Run the gradient-flow pair

\[
\tau_\psi\dot\psi=-\delta E/\delta\psi,\qquad
\tau_h\dot h=-\delta E/\delta h
\]

under triangular load ramps. The tight prediction candidate is that polar contact shows a rate-dependent hysteresis band whose quasistatic midpoint approaches the static `Lambda_*(ell_p)`, while annular contact shows no sign-selective hysteresis. In a benchtop analogue, use a torsionally compliant, optically tracked rod with an asymmetric finite-core insert inside a transparent elastomeric pad; measure indentation and internal orientation simultaneously while varying pad thickness/stiffness. A polar/annular pad pair is the essential control.

## Durable artifacts

- `WORKSPACES/RAVEL/CODE/deformable_contact_backreaction.py`
- `WORKSPACES/RAVEL/DATA/deformable_contact_backreaction.json`
- `WORKSPACES/RAVEL/FIGURES/deformable_contact_backreaction.svg`

**Next cursor:** add pad dynamics and load ramps; test whether the static nonlocal backreaction produces a finite, stiffness-scaled hysteresis loop without contaminating the annular null.
