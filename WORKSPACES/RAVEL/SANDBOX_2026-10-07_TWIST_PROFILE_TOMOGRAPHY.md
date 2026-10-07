# Ravel sandbox — internal twist-profile tomography

**Date:** 2026-10-07  
**Status:** `GEN/CANDIDATE` — siloed sandbox construction, not canonical H(s)H  
**Task:** determine whether the signed complex mode response identifies only endpoint rotation or also the internal distribution of material-frame twist.

## Result

Endpoint holonomy is insufficient. Two finite worldtubes can have the same total material-frame rotation and different internal twist distributions; their mode-resolved complex coherence differs. Three modes over a length ladder recovered the first nonuniform profile coefficient in a blind test and decisively rejected uniform twist.

## Competing architectures

Use sandbox-local symbols `delta_mat` and `eta_mat` for material-frame twist density and its zero-net-gradient correction. On a segment `0 <= s <= L`, compare

\[
\vartheta_{\rm uni}(s)=\delta_{\rm mat}s
\]

with

\[
\boxed{
\vartheta_{\rm prof}(s)
=\delta_{\rm mat}s
+\eta_{\rm mat}(Ls-s^2).
}
\]

Both have identical endpoint rotation,

\[
\vartheta_{\rm uni}(L)=\vartheta_{\rm prof}(L)=\delta_{\rm mat}L,
\]

but their local twist densities differ:

\[
\partial_s\vartheta_{\rm prof}
=\delta_{\rm mat}+\eta_{\rm mat}(L-2s).
\]

Thus any discriminator must inspect distributed internal structure rather than endpoint closure alone.

## Complex mode tomography

For Neumann mode `n`, the normalized complex coherence becomes

\[
\boxed{
G_n(L)=2\int_0^1
\sin^2(n\pi u)
\exp\!\left\{2i\left[
\delta_{\rm mat}Lu
+\eta_{\rm mat}L^2u(1-u)
\right]\right\}
du.
}
\]

The observable from the preceding signed-phase construction is

\[
Z_n(L)=\varepsilon_Ce^{2i\psi_{\rm det}}G_n(L).
\]

This retains pole-splitting magnitude and split-mode polarization orientation in one quantity.

### Phase-only first-order sensitivity

At zero uniform background twist, `delta_mat=0`, expansion about `eta_mat=0` gives

\[
\left.\frac{\partial |G_n|}{\partial\eta_{\rm mat}}\right|_0=0,
\]

but

\[
\boxed{
\left.\frac{\partial\arg G_n}{\partial\eta_{\rm mat}}\right|_0
=L^2\left(\frac13+\frac{1}{n^2\pi^2}\right).
}
\]

Therefore a weak antisymmetric twist-density gradient rotates the polarization axes at first order while leaving the split magnitude unchanged at first order. A magnitude-only experiment is locally blind to precisely the first nonuniform correction.

## Blind numerical inverse

Synthetic hidden parameters were

\[
(\delta_{\rm mat},\eta_{\rm mat},\varepsilon_C,\psi_{\rm det})
=(-1.18,0.245,0.068,0.27).
\]

Twenty-one complex observations covered seven lengths and modes `n=1,2,3`.

| Quantity | Hidden | Recovered |
|---|---:|---:|
| `delta_mat` | -1.180000 | -1.178505 |
| `eta_mat` | 0.245000 | 0.242337 |
| anisotropy `epsilon_C` | 0.068000 | 0.067903 |
| detector offset | 0.270000 | 0.269195 |

The fitted Jacobian condition number was `4.94`, indicating a locally well-conditioned four-parameter inverse for this fixture.

The uniform-twist null absorbed the missing profile into biased parameters:

\[
\delta_{\rm null}=-1.04882,
\qquad
\varepsilon_{C,\rm null}=0.06373.
\]

It lost by

\[
\Delta\mathrm{AIC}=174.46.
\]

At withheld length `L=2.27`, the profile model's three-mode relative error was `0.635%`; the uniform null's was `42.99%`.

## Translation into current H(s)H language

Within this model, accumulated rotation is not a sufficient worldtube descriptor. The transported finite core must retain at least enough information to distinguish:

\[
\text{endpoint frame relation}
\quad\text{from}\quad
\text{distributed material-frame history}.
\]

A candidate particle-like state therefore cannot be reduced to total winding or holonomy whenever internal modes couple to local director orientation. A finite-core intersection may resolve a mode family that functions as a low-order tomography of the worldtube's internal transport history.

This does not add a new interaction. It refines the state carried by the already-admitted finite anisotropic core.

## Source facts, inference, and conjecture

### Source facts actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt` — sequential lines 1–700 of the 114,116-byte file; 46,748 decoded characters. This section develops a historical relational-memory proposal, contrasts native and newly arriving trajectories, introduces attachment/forgetting kernels, and eventually recognizes that a viable history term must not accumulate naively around repeated closed motion. Its gravitational-aging and Oumuamua applications were not adopted.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/WHIRLY.txt` — complete 16,849-character read. It inventories an `SO(4)` angular-velocity tensor, filament stiffness, fourth-order path dynamics, and many older numerical/lattice/particle claims. Only the general distinction between rotational transport and stiffness-supported internal modes was retained; all historical constants, particle assignments, lattice claims, mass laws, and claimed empirical recoveries were excluded.
- `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` was updated with request `2026-10-07-ravel-twist-profile-tomography-001`. At checkpoint time no durable result directory was yet returned, so no search result was presumed.

The controlling project front door, Reference Desk, current workflow/task pointers, symbol/citation/toolbox controls, and current key were refreshed before construction. HSH_RESOURCES routing surfaces were reviewed as tool/source navigation only, not theory authority.

### Inference

The useful old-SAT residue is not “gravity ages.” It is the weaker structural distinction between endpoint state and distributed history. The HsH equation compilation leaves this distinction unresolved because total rotation/frequency inventories do not specify an observable sensitive to where twist resides. Complex modal coherence supplies such an observable.

### New sandbox conjecture

If matter-induced time-normal/material-frame rotation is spatially nonuniform through a finite core, a multimode complex response can recover low-order coefficients of that distribution. Stable particle-like identity may therefore include a transfer-stable *twist profile spectrum*, not only total twist.

## Decisive next test

Replace the analytic coherence integral with the finite-element anisotropic-rod solver. Generate two cores with identical endpoint rotation but different twist-density profiles, then fit only modes 1 and 2 and preregister mode 3 plus one withheld length. The inferred `eta_mat` must predict both the third-mode pole split and its polarization axis.

A stronger experimental protocol would compare two detector orientations. Detector rotation may add one constant phase to every `Z_n`; it must not change recovered profile coefficients.

## Failure gate

Reject or revise this architecture if:

- finite-element eigenvectors do not reproduce the analytic phase sensitivity;
- profile coefficients change under detector rotation or resolver thickness;
- modes require incompatible profiles;
- higher profile coefficients alias the quadratic profile over all accessible modes;
- the uniform model predicts preregistered third-mode and withheld-length data equally well after complexity penalties;
- mesh refinement moves the inferred gradient rather than shrinking its uncertainty.

## Artifacts

- Solver: `WORKSPACES/RAVEL/CODE/twist_profile_tomography.py`
- Numerical record: `WORKSPACES/RAVEL/DATA/twist_profile_tomography.json`
- Class-P diagnostic: `WORKSPACES/RAVEL/FIGURES/twist_profile_tomography.svg`

