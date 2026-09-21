# RUN 096 — Closed-carrier SO(4) connection gate

**Branch/task:** Meridian / Hagalaz solver unification / closed carrier  
**Status:** SANDBOX / PROVISIONAL / analytic operator gate  
**Date:** 2026-09-21  
**Operation:** combine RUN 092's six-channel local SO(4) generator with RUN 095's exact closed product-torus carrier and determine what is required for a nontrivial endpoint holonomy.  
**Quarantine:** none consulted.  
**Nathan Words disposition:** SOURCE ONLY via RUN 092's already-ingested UI packet; no new intended-object ambiguity was introduced in this bounded operator calculation.

## 0. Inputs

RUN 092 types the local Hagalaz state as

`Omega(lambda) in so(4)` + scale rate `alpha` + tangent advance `v`,

with six antisymmetric rotation channels `{xy,xz,xw,yz,yw,zw}`. RUN 095 established that the product torus

`C(p,q)=(a cos p,a sin p,b cos q,b sin q)`

has trivial intrinsic Levi-Civita holonomy despite a nontrivial embedded frame path.

Take a closed winding

`gamma_mn(t)=C(mt,nt), 0<=t<=2pi`, `(m,n) in Z^2`.

The question is whether merely placing a six-channel Hagalaz generator on this closed carrier is enough to make the endpoint SO(4) holonomy informative.

## 1. Explicit connection

Let `J_ab` denote the standard antisymmetric generator of rotations in coordinate plane `(a,b)`. Write

`A_t(t) = sum_{a<b} omega_ab(t) J_ab`.

The finite rotational readout is

`Q_gamma = P exp integral_0^{2pi} A_t(t) dt`.

This is now properly distinct from the torus Levi-Civita connection. It is an **associated Hagalaz/frame connection** whose coefficients must come from the local recursive solver rather than from the scalar torus metric.

## 2. Commuting control sector

First take a constant connection in a commuting Cartan pair,

`A_t = u J_xy + v J_zw`,

where `[J_xy,J_zw]=0`. Then path ordering drops out and

`Q_gamma = exp(2pi u J_xy) exp(2pi v J_zw)`.

This gives two independent rotation angles modulo `2pi`:

`theta_1 = 2pi u (mod 2pi)`,
`theta_2 = 2pi v (mod 2pi)`.

A nontrivial endpoint residual exists whenever either `u` or `v` is noninteger. If the coefficients are locked to the geometric winding rates `u=m`, `v=n`, integer carrier closure again forces `Q_gamma=I`.

**Gate 1:** adding an SO(4) connection is necessary but not sufficient. If it merely copies the integer frame winding of the carrier, endpoint holonomy remains trivial.

## 3. Full six-channel sector and noncommutativity

For general RUN 092 output,

`A_t = omega_xy J_xy + omega_xz J_xz + omega_xw J_xw + omega_yz J_yz + omega_yw J_yw + omega_zw J_zw`.

Most generator pairs sharing an index do not commute. Therefore time variation matters:

`Q_gamma != exp(integral A_t dt)` in general.

The first correction is visible in the Magnus expansion,

`Q_gamma = exp(Omega_M)`,

`Omega_M = integral A(t1)dt1 + 1/2 integral_{t1>t2}[A(t1),A(t2)]dt1dt2 + ...`.

This is the first clean place where recursive channel ordering can leave an endpoint residual even if simple signed integrals of individual channels cancel.

**Gate 2:** the candidate Hagalaz observable should preserve the ordered six-channel history, not only six integrated angles.

## 4. Carrier-coupled typing

A minimal closed-carrier record can now be written as

`R_mn = { (m,n), lambda_mn, ell_mn, A_t(t), Q_gamma }`,

where

`lambda_mn = m^2/a^2 + n^2/b^2`,

`ell_mn = 2pi sqrt(a^2 m^2 + b^2 n^2)`.

Under a pure similarity rescaling `a,b -> mu a, mu b`,

`lambda_mn -> mu^-2 lambda_mn`,
`ell_mn -> mu ell_mn`,

so `ell_mn^2 lambda_mn` remains invariant. If the Hagalaz connection is dimensionless per normalized progress `t`, `Q_gamma` is independently scale invariant. Thus scale and rotational transport can coexist without being conflated.

If instead `A` is parameterized per physical arclength `s`, then similarity covariance requires `A_s -> mu^-1 A_s` so that `A_s ds` remains dimensionless.

**Gate 3:** every implementation must declare whether its six rates are per normalized phase/progress or per physical length. Otherwise cross-rung holonomies are not comparable.

## 5. Useful falsifiers / benchmark checks

For any numerical implementation of the RUN 092 connection on a closed carrier:

1. **Zero-connection:** `A=0 => Q=I`.
2. **Single-plane constant:** `A=u J_ab => Q=R_ab(2pi u)`.
3. **Integer geometric copy:** `A=m J_xy+n J_zw => Q=I` for integer `(m,n)`.
4. **Reversal:** reversing path with the pulled-back connection must give `Q_reverse=Q^-1`.
5. **Conjugation/gauge frame change:** a constant frame rotation `G` must give `Q -> G^-1 Q G`; conjugacy invariants are the portable readout.
6. **Similarity:** if rates are correctly typed, pure scale change must preserve the conjugacy class of `Q` while scalar eigenvalues scale as `mu^-2`.

For SO(4), portable endpoint summaries can use the two principal rotation angles (equivalently suitable conjugacy invariants such as traces), rather than raw matrix entries tied to a chosen frame.

## 6. Result

The closed-carrier unification route survives, but the correct target is sharper:

`closure sector + spectral ruler + ordered Hagalaz connection + SO(4) conjugacy class`.

The torus itself does not generate the desired holonomy. A six-channel connection derived from the recursive Hagalaz solver can. However, if that connection only reproduces integer geometric winding, closure trivializes it. Nontrivial endpoint information must come from fractional/internal phase, channel noncommutativity/order, or another explicitly defined coupling—not from relabeling the carrier's ambient frame rotation.

This is a constraint, not a claim that any particular residual is physically realized.

## 7. Durable boundary / next cursor

**Changed:** RUN 095's undefined `A` has been typed as a six-channel `so(4)` Hagalaz/frame connection and supplied with exact control cases and covariance requirements.

**Capability added:** analytic bridge between RUN 092 recursive local generator and RUN 094/095 closed spectral carrier.

**Blocker:** RUN 092 reports RMS channel activation, not the sampled signed functions `omega_ab(t)` needed for an actual path-ordered exponential. No endpoint residual should be inferred from RMS activity.

**Next cursor:** recover or rerun RUN 092 to emit signed six-channel `omega_ab(t)` arrays on normalized progress; map one adjacent-order pair onto a closed benchmark interval; compute `Q_gamma` numerically and report its SO(4) conjugacy invariants alongside the spectral record.

No Nathan action required.