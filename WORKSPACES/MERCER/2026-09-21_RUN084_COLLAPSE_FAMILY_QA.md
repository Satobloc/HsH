# Mercer QA — analytic non-equilateral carrier-collapse family

**Date:** 2026-09-21  
**Status:** INDEPENDENT QA / FEED-FORWARD CANDIDATE  
**Branch/task:** `LAB-SBS-001` / Three-Spheres comparator  
**Exposure:** cleared HsH workspace only; PRIOR_ART/private quarantine untouched.

## Why this bounded pass

Meridian Run 084 generalized the equal-S3 common-carrier margin to arbitrary non-collinear center triangles and requested a primitive one-parameter family that decreases `G_carrier` through zero away from the equilateral line. Comptroller has routed that exact event-detection test. This note supplies a closed-form family and analytic event target for independent numerical comparison; it does not substitute for Meridian's implementation run.

## Primitive family

Fix shell radius `R=1` and centers in a 2-plane of R4:

`c1=(-1/2,0,0,0)`

`c2=(+1/2,0,0,0)`

`c3=(0,h,0,0)`, with `h>0`.

This is upstream primitive-center deformation. Pair distances are

`d12=1`, `d13=d23=sqrt(h^2+1/4)`.

The family is equilateral only at `h=sqrt(3)/2`; every other positive h is non-equilateral.

Using `u=c2-c1=(1,0,0,0)` and `v=c3-c1=(1/2,h,0,0)`, the Gram matrix is

`K=[[1,1/2],[1/2,1/4+h^2]]`,

so

`det K = h^2`.

Thus the family remains non-collinear for every `h>0`; the singular center stratum is only approached as `h -> 0`.

## Exact carrier channel

The circumradius of this isosceles center triangle is

`r_c(h) = (1+4h^2)/(8h)`.

Therefore

`G_carrier(h) = 1 - (1+4h^2)^2/(64h^2)`.

The collapse equation `G_carrier=0` has two positive roots:

`h = 1 +/- sqrt(3)/2`.

For the requested downward deformation from the equilateral state, the relevant event is

`h_* = 1 - sqrt(3)/2 ~= 0.1339745962`.

At that event,

`d12=1`,

`d13=d23=sqrt(2-sqrt(3)) ~= 0.5176380902`,

so collapse is manifestly non-equilateral. `G_carrier>0` immediately above `h_*` and `G_carrier<0` immediately below it (while h remains positive), giving a clean sign-changing event target.

The equilateral starting control `h=sqrt(3)/2` gives `r_c=1/sqrt(3)` and `G_carrier=2/3`, matching the established symmetric control.

## Conditioning target

At the collapse itself the primitive Gram determinant is still

`det K = h_*^2 ~= 0.01794919243`,

not zero. The 2x2 Gram condition number is approximately `87.56`: noticeably less comfortable than the equilateral control, but finite. This is useful for the intended test because an implementation that confuses carrier collapse with center-collinearity should fail here: `G_carrier` reaches zero while the center Gram matrix remains nonsingular.

The true singular guard remains independently visible as `h -> 0`, where `det K -> 0` and the circumcenter solve should not be forced through the degenerate stratum.

## Comparator typing

Use the existing `E_spread` definition directly on the primitive distance triple

`(1, sqrt(h^2+1/4), sqrt(h^2+1/4))`.

It must remain a separate symmetry-defect channel. The analytic event above is determined by `G_carrier`, not by nonzero spread. At `h_*`, spread is necessarily nonzero because the side triple is `(1,~0.517638,~0.517638)`.

## Suggested numerical event bracket

A minimal implementation check can sample on both sides of `h_*`, for example

`h = h_* +/- 1e-3`, `h_* +/- 1e-6`, and `h=h_*`,

while recording `E_spread`, `G_carrier`, `det K` (or equivalent area guard), circumcenter-solve conditioning, and the analytic-vs-numerical event error. This brackets the event without approaching the actual collinear stratum at h=0.

## Scope / status

The geometry above is an analytic comparator fixture, not a physical or model-validation claim. It independently instantiates the event family requested by Meridian Run 084 and the Comptroller handoff. No Nathan Words/model-meaning issue arises.

## Durable boundary / return

Feed this family to Meridian's next eligible `LAB-SBS-001` crossing run as an optional exact benchmark. The incorporation test remains behavioral: numerical detection should cross `G_carrier=0` near `h_*` while `det K>0`, with `E_spread` kept separately typed. If Meridian independently chooses another valid family, retain this one as a regression fixture rather than forcing convergence on the same parametrization.

No Nathan action required.
