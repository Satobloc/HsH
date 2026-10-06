# Ravel sandbox — asymmetric orientation-tail inversion

**Status:** SILOED PLAYGROUND / SAT–H(s)H candidate. This is a representational and metrological construction, not canonical theory or a particle claim.

## Exact question

If a finite carrier has unequal one-sided projected supports, can two orientation-reversed finite-thickness readouts separate support geometry from bulk-versus-boundary occupancy?

The narrow answer is:

- for any compact projected density in the declared quadratic-contact readout, two thick-slab tails recover the projected centroid and obey a support-only closure law;
- for one explicitly declared piecewise-stretched \(B^3/S^2\) family, that centroid also recovers the bulk fraction;
- for a general convex carrier, the same four scalars do not identify morphology.

## Controls and resource familiarity

Before this build I read the current `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and checked its materially relevant routing/control pointers. I also overview-read the new Common Reference Desk and verified the supplied HSH_RESOURCES routers: `indexes/ai_source_index/HSH_TOOLKIT.md`, `HQ/TOOL_CHEST.md`, `info/TOOLKIT_DIGESTION.md`, `!_HSH_RESOURCES_INDEX.md`, `info/NATHAN_PREFERENCES/BOOT.md`, `HQ/THE_WAR_ROOM/DECLARATION.txt`, and the SAT26 BigBook index. The immediately preceding project pass had already mapped the other packet directories and links.

Disposition: HSH_RESOURCES is a supporting reference/tool library. Inclusion gives no theory authority. Toolkit material is to be retrieved by the problem it solves, assigned an explicit digestion level, and kept in the chain

\[
\text{standard result}\to\text{deliberate imported tool}\to\text{H(s)H construction}.
\]

No PRIOR_ART path was opened; the newer Common quarantine control overrides War Room links into that lane.

## Exact source coverage

### Old SAT archive

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Dimensoins.txt`

- read in full through GitHub;
- blob `8f019606e52cbc8e45bd7638395f994777a3a446`;
- genre: generated 2026 exploratory synthesis containing Nathan prompts, generated calculations, and strong unsupported lock language.

**Source construction retained as historical:** distinguish intrinsic filament/string thickness from the radius of a coiled or excited tube; treat the observed local object as an incidence-dependent intersection footprint of a finite four-dimensional tube with a resolving three-surface; shallow incidence elongates the footprint.

**Not imported:** the 24-cell lattice, numerical scales, particle assignments, neutrino/photon comparisons, \(\theta_4\)-mass equivalence, gravity mechanism, string-theory identity claims, or any `VERIFIED/LOCKED` assertion. The file's simple \(1/\sin\theta\) footprint law is a geometric lead only; it is not assumed below.

### H(s)H September 30 dump

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md`

- read in full through GitHub;
- blob `f6b376382b39651c488814b49f1a8a5a6a25ef69`;
- retained only after the independent construction below.

Run 133 reconstructs a rank-two support radius from section area and contact span before using curvature to reconstruct orientation. Its transferable lesson is factorization: recover carrier support from observables before assigning orientation or carrier type. Its \(B^2\) equations are not used in this \(B^3/S^2\) derivation.

### Immediate branch dependency

`WORKSPACES/RAVEL/SANDBOX_2026-10-05_COMMON_UNIT_CONTACT_OCCUPANCY.md` was read in full from current main. It supplies the dimensionless contact-support occupancy and the symmetric \(B^3/S^2\) contrast result. The exact next cursor named asymmetric supports \(\rho_+\ne\rho_-\).

## Source / inference / new construction boundary

**Source facts:** old SAT repeatedly separates finite tube thickness from resolved intersection morphology; current H(s)H finite-core work separates support observables, orientation factors, and readout measures.

**Inference:** if a finite carrier is real within the model, reversing which side faces the same curved resolver must exchange the sign of its projected centroid while retaining one common support geometry. A display-only elongation or changing apparatus need not satisfy that joint constraint.

**New sandbox construction:** the two orientation kernels, tail-closure theorem, centroid inversion, and the piecewise-stretched \(B^3/S^2\) bulk-fraction formula below.

## Geometry and forward operator

Let the projected carrier coordinate be

\[
Z\in[-\rho_+,\rho_-],\qquad \rho_+>0,\quad \rho_->0,
\]

with normalized density \(p(z)\). Near tangency use

\[
q(s)=\frac{\kappa s^2}{2},\qquad \kappa>0,
\]

and a resolving slab of half-thickness \(h\). When the \(-\rho_+\) side faces the curvature, the contact-support-normalized kernel is

\[
K_{h,\rho_+}(z)=
\frac{\sqrt{(h-z)_+}-\sqrt{(-h-z)_+}}{\sqrt{h+\rho_+}},
\qquad (x)_+=\max(x,0),
\]

and

\[
\bar O_+(h)=\int p(z)K_{h,\rho_+}(z)\,dz.
\]

Reverse the carrier relative to the same resolver:

\[
\bar O_-(h)=\int p(z)K_{h,\rho_-}(-z)\,dz.
\]

This is a normalized geometric occupancy, not a raw detector count.

## General two-orientation tail theorem

Let

\[
\mu=\mathbb E[Z].
\]

For \(h\gg\max(\rho_+,\rho_-)\), expansion of the square roots gives

\[
\bar O_+(h)=1-\frac{\rho_++\mu}{2h}+O(h^{-2}),
\]

\[
\bar O_-(h)=1-\frac{\rho_- -\mu}{2h}+O(h^{-2}).
\]

Therefore

\[
\boxed{T_+=\lim_{h\to\infty}2h[1-\bar O_+(h)]=\rho_++\mu},
\]

\[
\boxed{T_-=\lim_{h\to\infty}2h[1-\bar O_-(h)]=\rho_- -\mu}.
\]

Adding the tails removes the internal density:

\[
\boxed{T_++T_-=\rho_++\rho_-}.
\]

This is the target-free tail-closure invariant. The centroid is recovered twice:

\[
\mu=T_+-\rho_+=\rho_- -T_-.
\]

The already-derived asymmetric incidence thresholds recover the supports independently,

\[
|\alpha|_{c,+}=\sqrt{2\kappa\rho_+},\qquad
|\alpha|_{c,-}=\sqrt{2\kappa\rho_-},
\]

so \(\rho_\pm=|\alpha|_{c,\pm}^2/(2\kappa)\).

## Minimal asymmetric B3/S2 family

Let \(u\in[-1,1]\) and stretch an even reference carrier piecewise:

\[
z(u)=
\begin{cases}
\rho_+u,&u<0,\\
\rho_-u,&u\ge0.
\end{cases}
\]

The projected reference densities are

\[
p_B(u)=\frac34(1-u^2),\qquad p_S(u)=\frac12,
\]

and the declared mixture is

\[
p_w(u)=w_Bp_B(u)+(1-w_B)p_S(u).
\]

Direct integration gives

\[
\mu_B=\frac{3}{16}(\rho_--\rho_+),\qquad
\mu_S=\frac14(\rho_--\rho_+),
\]

thus

\[
\mu=(\rho_--\rho_+)\left(\frac14-\frac{w_B}{16}\right)
\]

and, when \(\rho_-\ne\rho_+\),

\[
\boxed{w_B=4-\frac{16\mu}{\rho_--\rho_+}}.
\]

Controlled asymmetry therefore acts as a morphology encoder: it turns the bulk/boundary difference into a signed first moment.

## Candidate comparison

| Candidate | Identified by thresholds + tails | Residual ambiguity |
|---|---|---|
| Arbitrary compact projected carrier | \(\rho_+,\rho_-,\mu\) | Full density and morphology remain non-identifiable |
| Piecewise-stretched \(B^3/S^2\) family | \(\rho_+,\rho_-,\mu,w_B\) | Physical admissibility/dynamical selection remain open |
| Symmetric support | common radius only; \(\mu=0\) for both reference carriers | tail channel cannot recover \(w_B\) |
| Full two-orientation thickness sweep | overdetermined kernel/family test | extra moments require extra readout structure |

## Numerical check

`WORKSPACES/RAVEL/CODE/asymmetric_orientation_tail_inversion.py` evaluates the exact kernels by quadrature. It estimates the tails with

\[
T_R(h)=2T(2h)-T(h),
\]

which cancels the leading \(1/h\) bias.

Across twelve fixtures—four unequal support pairs and \(w_B\in\{0.1,0.5,0.9\}\)—at \(h=100\max(\rho_+,\rho_-)\):

- maximum absolute bulk-fraction error: \(4.5646889562\times10^{-4}\);
- maximum tail-closure error: \(4.5334562378\times10^{-5}\);
- support recovery from the two thresholds: floating-point exact.

## Failure conditions

1. **Symmetry singularity:**
   \[
   \left|\frac{\partial w_B}{\partial\mu}\right|
   =\frac{16}{|\rho_--\rho_+|}
   \]
   diverges as the supports become equal. At exact symmetry use the previous finite-thickness contrast optimum instead.
2. **Family misspecification:** endpoints plus centroid do not determine an arbitrary carrier. The \(w_B\) inverse is valid only inside the declared pushforward family.
3. **Center-map ambiguity:** miscentering manufactures both apparent support asymmetry and a false centroid.
4. **Unknown curvature:** without independently calibrated \(\kappa\), incidence determines only \(\kappa\rho_\pm\).
5. **Orientation-dependent apparatus:** gain, clipping, deformation, or a changed kernel can counterfeit the sign flip.
6. **Finite-thickness bias:** a single moderate \(h\) is not the tail; convergence or extrapolation is required.

## Experiment / solver discriminator

1. Freeze the center convention, resolver, gain calibration, and \(\kappa\).
2. Sweep incidence in both orientations and infer \(\rho_\pm\).
3. Sweep several large \(h\) values and extrapolate \(T_\pm\).
4. Test \(T_++T_-=\rho_++\rho_-\) before fitting morphology.
5. If closure holds and the stretched family was declared in advance, infer \(w_B\).
6. With no refit, predict both held-out finite-\(h\) occupancy curves.

A wrong orientation ordering, closure failure, \(w_B\notin[0,1]\), or structured held-out residual rejects the minimal family. This is an internal geometry/readout prediction, not an external particle prediction.

## What follows for H(s)H

The old SAT “javelin” idea should not be carried forward as a particle label or fixed angle. Its useful translation is more disciplined: a finite carrier and its readout footprint are different objects, and incidence can deform the footprint without changing the carrier. H(s)H should therefore use controlled orientation reversal and support reconstruction as tomography operations. A geometry-locked finite carrier must transport one common support/centroid relation through reversal; a display-only trace or apparatus change need not.

No paper update is earned until the theorem is extended beyond the piecewise-affine family or tested against a more general convex support.

## Exact next handoff

Meridian: implement a blinded two-orientation sweep and return \((\rho_+,\rho_-,T_+,T_-,\mu,w_B)\), closure residual, and held-out curve residuals. Calder: determine the minimum additional moments/readouts that identify morphology without the piecewise-affine assumption.
