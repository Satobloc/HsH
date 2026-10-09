# Morrow + Kestrel | Accelerated contact-worldsheet gate (SANDBOXED)

**Date:** 2026-10-10. **Status:** LOCAL DERIVATION / SANDBOX ONLY; not H(s)H theory authority. **No historical particle constants fitted.**

## Provenance
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/000 Earliest SAT_RMS/002 Forces Across Temporal Points - to 8-13-24.txt` (complete, 3,911 characters; distinguish Nathan's initial question from assistant response); `2023-24 FRAMEWORK DEVELOPMENT/SATv TIME_WAVEFRONT.txt` (complete, 3,400 characters; compiled speculative formulation, not raw Nathan dialogue).
- Current HsH: `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md` (complete, 13,668 characters), `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` (complete, 5,567 characters), `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT WEIRD IDEAS — Solenoidbit.txt` (complete, 18,337 characters), and `WORKSPACES/MERIDIAN/SANDBOX/WHIRLIGIG_KERNEL_0.md` (opening ~12,000 characters).
- All formulas below are newly derived within this bounded model; they are not claims from the source documents. Source routing used exact known paths, not a corpus-wide Mersearch novelty scan. No quarantined material read.

## Exact geometry

Use Minkowski metric `diag(-,+,+,+)`, length coordinate `T=ct`, and `c=1`. Two timelike histories sweep rank-two circular supports. Tube A is inertial with support in `(x,y)`; B is accelerated in `(T,x)` with support in its transported Fermi normal and `z`. The two 3D swept supports meet in a 2D timelike contact worldsheet.

**LOCAL namespace `MK-ACCEL-20261010`** (not registered shared notation): proper contact half-widths `a,b`, initial rapidity `chi0>0`, signed proper acceleration `kappa=dchi/dtau`, and A longitudinal offset `x0`. Write `chi=chi0+kappa*tau`. The exact Fermi map is

```
T = [sinh(chi)-sinh(chi0)]/kappa + xi*sinh(chi)
x = [cosh(chi)-cosh(chi0)]/kappa + xi*cosh(chi)
```

with `xi in [-b,b]`, `x in [x0-a,x0+a]`. Its Lorentzian area Jacobian is `1+kappa*xi`. Hence

```
A(kappa) = int_{-b}^b dxi int_{x0-a}^{x0+a} dx
 (1+kappa*xi)/sqrt((cosh(chi0)+kappa*x)^2-(1+kappa*xi)^2).
```

At `kappa=0`, `A=4ab/sinh(chi0)`, recovering the straight-history rapidity gate.

Let `s=sinh(chi0)`, `c0=cosh(chi0)`. Expansion:

```
A = 4ab/s + kappa*(-4ab*c0*x0/s^3)
  + kappa^2 * 2ab/(3*s^5) * [
      a^2*(2*s^2+3) + 3*b^2*(s^2+1)
      + x0^2*(6*s^2+9)] + O(kappa^3).
```

**New discriminator:** centered contact `x0=0` has an exact zero linear response and positive quadratic leading correction; off-center contact has a signed linear acceleration response. This is geometrical contact, not a force law or parity violation.

## Reproduction and failure gates

Fixture `a=.8,b=.45,chi0=.9`: inertial area `1.4028022768032058`; centered quadratic coefficient `0.9509904694842581`; at `x0=.25`, linear coefficient `-0.47695431357190704`. Independent exact 1D quadrature, elementary antiderivative, and 2D Gauss quadrature agreed to absolute error below `1e-9` over 14 test fixtures; centered log-log excess-area slope `2.0008879`. Lorentz-boosted Jacobian checks passed.

The derivation **fails** when `1+kappa*xi<=0` (Fermi caustic) or when the positive-rapidity inverse ceases to be monotone. It does not determine constitutive force, reconnection, topological protection, or particle identity. The quantity is Lorentzian contact **area**, not the resolving-interface area of Tangency Packet 002.

**Next test:** replace the prescribed accelerated history by a genuine ᚼ-generated curved worldtube with carried rank-two supports; recover or falsify the centered quadratic null and off-center signed linear response, then add a separately justified contact-energy law.

**Full executable solver, precision figures, and extended provenance:** delivered as conversation attachments in the Morrow + Kestrel free-quarry run of 2026-10-10. No code was committed by this note.
