# Ravel sandbox — common-unit contact occupancy

**Date:** 2026-10-05  
**Status:** SILOED PLAYGROUND / generated candidate, not canonical theory  
**Question:** Can the exact finite-slab bulk and boundary responses be placed in one detector unit before introducing a layered carrier?

## Provenance and actual reading

Controlling onboarding was read first: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, then the materially relevant `CURRENT_WORKFLOW_ORIENTATION_V2.md`, `WORKFLOW_BRANCHING_MAP.md`, and `CHECKINS.md` pointers.

Mersearch retrieval reused pinned request `2026-10-05-ravel-finite-slab-fold-001` at archive commit `09c1ed1cf921103ca79175c203d48efc8d2b68ad`, Mersearch stable ref `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. The request searched the non-quarantined archive for finite slab/timesheet/intersection/worldtube material (3,983 files, 6,596,610 records, 2,627 hits); `QUARANTINE` and `PRIOR_ART` were excluded.

Fresh corpus reads:

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT PRE-H(s)H TIGHTENING.txt` — fetched as a 5,169-line file; read a substantial opening section and the direct construction windows at lines 1,942–2,083 and 2,693–2,697. The retained historical construction is the move from a naive zero-thickness timesheet to a finite slab with flow dynamics; slab thickness is associated with a resolving-wavefront wavelength/coherence length; particle readout is the slab/core intersection. Historical constants, particle labels, generated metrological claims, and ontology assertions were not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` — read in full. It proves, within its local model, that a curvature-facing one-sided support controls the incidence threshold while the sum of supports controls maximum contact measure. This was used only after the independent symmetric construction below, as a warning that normalization must not erase support geometry.

## Source facts, inference, and conjecture boundary

**Source facts:** the old archive proposes finite-thickness resolving readout rather than a mathematical point slice; current H(s)H finite-core work treats carrier support and readout measure as typed geometric objects; Run 110 separates one-sided support observables.

**Inference used here:** if bulk and boundary measures are to be mixed, raw four-volume and three-area cannot be added. A detector must first report a dimensionless fraction of each declared carrier admitted by the same slab, averaged over the same contact-support interval.

**New sandbox construction:** the contact-support averaged occupancy below, its exact bulk/boundary curves, the contrast optimum, and the layered-mixture conditioning statement are generated here. They are not archive facts or canonical H(s)H.

## Geometry and common detector functional

Use the leading quadratic tangency model

\[
q(s)=\frac{\kappa_{\rm rel}}2s^2,
\qquad |z|\le h_\Sigma,
\qquad \lambda=\frac{h_\Sigma}{r_c}.
\]

The full contact-support interval ends where the slab can just touch the radius-\(r_c\) carrier:

\[
s_{\max}=\sqrt{\frac{2r_c(1+\lambda)}{\kappa_{\rm rel}}}.
\]

At each \(s\), let \(f_H(s;\lambda)\in[0,1]\) be the fraction of the declared carrier fiber \(H\) admitted by the slab. Define

\[
\boxed{\bar O_H(\lambda)=\frac1{2s_{\max}}
\int_{-s_{\max}}^{s_{\max}}f_H(s;\lambda)\,ds.}
\]

This has one unit for both carrier types: mean admitted carrier fraction. Overall detector gain, \(r_c\), and \(\kappa_{\rm rel}\) cancel. The cancellation does not identify or equate the carriers; their fractional profiles remain different.

With \(x=s\sqrt{\kappa_{\rm rel}/(2r_c)}\), the admitted normal interval is

\[
[\ell,u]=[-1,1]\cap[-\lambda-x^2,\lambda-x^2].
\]

For a uniform filled ball and uniform spherical boundary,

\[
f_{B^3}=\frac34\int_\ell^u(1-z^2)\,dz,
\qquad
f_{S^2}=\frac{u-\ell}{2}.
\]

## Exact responses

For \(0\le\lambda\le1\), put

\[
t=\sqrt{\frac{1-\lambda}{1+\lambda}}.
\]

Then

\[
\bar O_{B^3}=
\frac{8(1-t)(3t^6+3t^5+10t^4+10t^3+10t^2+3t+3)}{35(1+t^2)^3},
\]

and

\[
\bar O_{S^2}=\frac{2(1-t^3)}{3(1+t^2)}.
\]

For \(\lambda\ge1\), put

\[
u=\sqrt{\frac{\lambda-1}{\lambda+1}}.
\]

Then

\[
\bar O_{B^3}=
\frac{8(3u^4+9u^3+11u^2+9u+3)}{35(1+u)^3},
\qquad
\bar O_{S^2}=\frac{2(1+u+u^2)}{3(1+u)}.
\]

Both curves are strictly increasing from 0 to 1. Thus the earlier fixed-span inverse folds are not carrier-invariant facts: they depend on using raw dimensional measure while holding measured span fixed. The calibrated fractional-occupancy readout removes those folds.

The carrier contrast remains strictly positive:

\[
\Delta O=\bar O_{B^3}-\bar O_{S^2}
=\frac{(1-t)(2+2t+30t^2+100t^3+30t^4+2t^5+2t^6)}{105(1+t^2)^3}
\]

for \(0\le\lambda\le1\), and

\[
\Delta O=
\frac{2(1-u)^2(1+5u+u^2)}{105(1+u)^3}
\]

for \(\lambda\ge1\). Hence bulk occupancy exceeds boundary occupancy for every finite positive thickness, but the contrast vanishes as \(\Delta O\sim1/(60\lambda^2)\) for a very thick slab.

## Exact contrast optimum

The interior stationarity condition reduces to

\[
p(t)=t^7-7t^5-70t^4+175t^3+196t^2-105t-22=0.
\]

An exact-rational Sturm count changes from 3 sign variations at \(t=0\) to 2 at \(t=1\), so there is exactly one root in \((0,1)\). It gives

\[
t_*=0.541173854752178,
\qquad
\boxed{\lambda_\Delta=0.5469469697056074},
\]

\[
\bar O_{B^3}=0.4954616622671534,
\qquad
\bar O_{S^2}=0.4339221716313451,
\]

\[
\boxed{\Delta O_{\max}=0.0615394906358083}.
\]

This is a 6.154 percentage-point absolute separation, or 14.182% of the boundary response. Direct numerical quadrature of the fiber fractions agrees with the closed forms to better than \(10^{-14}\) at seven test thicknesses spanning \(0.01\le\lambda\le5\).

## Consequence for the first layered model

Only now is a linear layer fraction dimensionally legitimate. For a detector-linear mixture

\[
\bar O_{\rm mix}(\lambda;w)
=w\bar O_{B^3}(\lambda)+(1-w)\bar O_{S^2}(\lambda),
\qquad 0\le w\le1,
\]

known \(\lambda\) gives

\[
w=\frac{\bar O_{\rm mix}-\bar O_{S^2}}{\Delta O}.
\]

Noise amplification is \(1/\Delta O\), so the same independently generated optimum \(\lambda_\Delta\) is the best single-thickness setting for estimating \(w\) in this minimal model. Its condition factor is still \(1/\Delta O_{\max}=16.2497283\): common units make the mixture legal, not automatically well conditioned.

## Cross-pollination after construction

- Google Drive searches for `finite slab occupancy carrier normalization` and `worldtube detector functional bulk boundary` returned no controlled duplicate.
- Public working-group Slack already contains centered static-slab occupancy and aperture-tomography work, including a one-setting covariance-matched \(B^3/S^2\) discriminator at \(h/(|a|R)=\sqrt{3/5}\). No message used `contact-support` normalization, and the exact value `0.546946` had no hit. The present result is distinct: it averages along a curved quadratic contact support and calibrates raw bulk/area measures into one dimensionless output before mixture.
- Run 110 suggests the next extension: replace the symmetric radius by one-sided supports \(\rho_\pm\). That extension must retain the threshold/sum separation rather than collapse both into a single effective radius.

## Failure conditions

This discriminator fails as a physical claim if any of the following are false:

1. response is linear in admitted carrier measure and separately saturated to define “fraction”;
2. sampling weight is uniform over the declared contact-support interval;
3. the slab is a centered top-hat in the relevant normal coordinate;
4. \(r_c\) and the support endpoint are independently known well enough to set \(\lambda\);
5. bulk and boundary carriers have the declared uniform measures;
6. asymmetric support, deformation, attenuation, or carrier-dependent gain is negligible or independently calibrated.

A nonuniform weight \(w(s)\), unresolved one-sided support, or carrier-dependent gain changes both the optimum and potentially the ordering. The result does not yet justify a physical layered particle.

## Solver/experiment discriminator

Implement the fiber fractions above directly, with no fitted geometric coefficients. Sweep \(\lambda\) across \([0.01,5]\), normalize each channel by its independently measured saturated response and by the full contact-support span, then require all of:

1. direct quadrature agrees with the closed forms;
2. both occupancies are monotone and approach 1;
3. \(\bar O_{B^3}>\bar O_{S^2}\) at every finite \(\lambda>0\);
4. the measured contrast has one maximum at \(0.5469469697\) within declared resolution;
5. a synthetic layered response recovers its preregistered \(w\) by the affine inversion above without refitting gain.

Any robust fold in the calibrated occupancy curves, contrast sign reversal, or failure of the single optimum rejects this minimal common-unit detector model.

## Artifacts

- `common_unit_occupancy.py` — closed forms, direct quadrature, optimum, regression checks, and figure.
- `common_unit_occupancy.json` — numerical checkpoint.
- `common_unit_occupancy.svg` / `.png` — Class P response and contrast visual.

## Next cursor

Generalize the functional to asymmetric convex support with \(\rho_+\ne\rho_-\). Test whether two orientation-reversed occupancy sweeps plus the Run-110 incidence threshold are sufficient to identify \((\rho_+,\rho_-,w)\) without carrier-dependent gain.
