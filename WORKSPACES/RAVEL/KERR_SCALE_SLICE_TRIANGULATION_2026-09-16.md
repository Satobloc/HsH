# Ravel sandbox — Kerr scale vs. timesheet slice

**Date:** 2026-09-16 EDT  
**Status:** CANDIDATE THEORY WORK / RAVEL SANDBOX — not canon, not promoted H(s)H  
**Question:** Can the standard Kerr rotation scale `a = J/(Mc)` be identified with a literal hard transverse filament radius, or does ordinary timesheet intersection force us to keep `a` distinct from actual core thickness?

## Why this question now

Current Nathan/Ravel construction keeps the following pieces live but not closed:

`ER/Kerr minimum geometry -> persistent winding/coil -> braid`

with timesheet intersection/distortion and Kelvin-like response coupled to that structure. A known dangerous assumption is that the electron-like Kerr parameter `a = ħ/(2mc)` belongs to a literal hard filament core rather than to a higher-order rotational/coil/readout scale.

The immediate discipline is therefore to ask what ordinary 4D slice geometry itself permits before assigning interpretation.

---

## 1. Standard Kerr scale

For a Kerr object,

`a = J/(Mc)`.

For a spin-1/2 lepton with `J = ħ/2`,

`a = ħ/(2mc)`.

Using standard lepton masses gives the approximate rotation scales:

- electron: `a_e ≈ 1.9308e-13 m = 193.08 fm`
- muon: `a_mu ≈ 9.338e-16 m = 0.934 fm`
- tau: `a_tau ≈ 5.553e-17 m = 0.0555 fm`

These are rotational/Compton-family scales. Their mere existence does **not** establish that a particle has an excluded-volume radius `a`.

---

## 2. Generic 4D ring / timesheet intersection

Represent a candidate Kerr-like ring in Euclideanized 4D bookkeeping coordinates by

`X(phi) = C + a [ e1 cos(phi) + e2 sin(phi) ]`,

where `e1,e2` are orthonormal and span the ring plane `P`.

Let a timesheet be a 3-hyperplane

`Sigma_s : n · (X-C) = s`,

with unit normal `n`.

Substitution gives

`a[(n·e1) cos(phi) + (n·e2) sin(phi)] = s`.

Define

`rho = sqrt[(n·e1)^2 + (n·e2)^2] = ||Proj_P n||`,

so `0 <= rho <= 1`.

Then the intersection condition can be written

`a rho cos(phi-delta) = s`.

Therefore:

- if `|s| < a rho`, the slice generically intersects the ring in **two points**;
- if `|s| = a rho`, the slice is tangent and the two points coalesce;
- if `|s| > a rho`, there is no intersection;
- if `rho = 0`, the ring plane is parallel to the timesheet: at the coincident sheet the **whole ring** lies in the slice, otherwise none of it does.

This is the important negative result:

> Ordinary hyperplane slicing does **not** generically hide a large ring radius by tilt.

At a central cut (`s=0`, `rho>0`), the two intersection points are antipodal on the ring and their separation inside the timesheet is `2a`.

So if `a` is literally a transverse circular support in physical `wxyz` coordinates, a generic central timesheet cut still contains the full diameter scale.

The same warning applies to a zero-thickness branch disk: a central slice generically yields a line segment with scale set by `a`, not an arbitrarily tiny footprint.

---

## 3. Consequence for the H(s)H anatomy

This argues against silently writing

`hard filament radius = Kerr a`.

A cleaner candidate decomposition is:

- `epsilon` = genuine nonintersection/core thickness, if the theory actually requires one;
- `a` = Kerr rotational / branch / phase scale fixed by `J/(Mc)`;
- `R_coil` = persistent-coil radius, not assumed equal to `a`;
- `p` or `k` = coil pitch / winding rate along the history;
- `Sigma` = timesheet/readout map specifying which parts of the full 4D structure become a measured event.

Any identification among `epsilon`, `a`, and `R_coil` has to be earned by an independent relation.

This preserves the standard Kerr scale without prematurely converting it into a material diameter.

---

## 4. Independent magnetic-moment triangulation

There is, however, a reason to take `a` seriously as a **rotational** scale.

For spin `J`, the standard magnetic moment is

`mu = g (q/2m) J`.

Using `a = J/(mc)` gives

`mu = (g/2) q c a`.

Therefore for a Dirac/Kerr-Newman-like `g ≈ 2`,

`mu ≈ q c a`.

That is useful because it relates the same `a` obtained from `(J,m)` to an independently measured electromagnetic quantity `(mu,q)`.

So the strongest present interpretation is not

`a = hard size`,

but rather

`a = rotation scale independently visible in spin/mass and magnetic moment`.

For the electron and muon this gives a genuine triangulation target. The tau magnetic moment is not comparably well measured, so `tau` is presently a weaker member of this particular test.

---

## 5. What would be required to keep `a` as a literal large 4D core scale

If H(s)H nevertheless wants the electron-scale `a_e ~ 193 fm` to be a real geometric ring while the measured particle remains effectively pointlike, ordinary slicing alone is insufficient. At least one additional **already-motivated** structure must do the work, for example:

1. a branch-selection/readout rule in which only one of the two geometric intersections is physically resolved;
2. a distinction between metric/branch support and charge/matter support, so scattering does not measure the entire Kerr ring locus as a material form factor;
3. a worldtube construction in which `a` is an internal rotational parameter but not a spatial support radius of the observed slice;
4. a higher-order coil/readout interpretation of `a` rather than a bare-core interpretation.

These are alternatives to test, not conclusions.

---

## 6. Immediate next calculation

Use the lepton family as a minimal triangulation table with independent columns:

`{m, J, a_Kerr, magnetic moment, charge-radius/scattering constraint, lifetime, observed g}`.

The decisive question is whether one assignment of `a`, `epsilon`, and `R_coil` can satisfy **all** of those columns without fitting each lepton separately.

A good failure condition is explicit:

> If the geometry requires `a` to be a literal spatial support radius in the timesheet slice and no independently motivated readout mechanism suppresses that support, the electron-scale Kerr-core interpretation fails.

That failure would not kill Kerr as a rotational/phase ingredient; it would only kill the strongest `a = hard transverse core radius` reading.
