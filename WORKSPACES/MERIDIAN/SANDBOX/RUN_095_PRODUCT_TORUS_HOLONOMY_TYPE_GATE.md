# RUN 095 — Product-torus holonomy type gate

**Branch/task:** Meridian / Hagalaz solver unification / closed carrier
**Status:** SANDBOX / PROVISIONAL / exact analytic negative result
**Date:** 2026-09-21
**Operation:** test the RUN 094 next cursor by asking whether the exact product-torus carrier's intrinsic Levi–Civita holonomy can supply the desired Hagalaz closure/holonomy channel.
**Quarantine:** none consulted.
**Nathan Words disposition:** NOT RELEVANT for this bounded operator-typing check; no intended-object ambiguity needed resolution beyond RUN 094.

## 0. Result

For the exact product torus

\[
C(p,q)=(a\cos p,a\sin p,b\cos q,b\sin q),
\qquad ds^2=a^2dp^2+b^2dq^2,
\]

the intrinsic Levi–Civita connection is flat in the global coordinate frame `(∂p,∂q)`. The metric coefficients are constant, hence all Christoffel symbols vanish:

\[
\Gamma^k{}_{ij}=0.
\]

Therefore parallel transport around every closed `(m,n)` winding has identity intrinsic holonomy:

\[
\boxed{\mathrm{Hol}^{LC}_{(m,n)}=I.}
\]

This is an exact negative result: **the scalar/intrinsic product-torus geometry cannot by itself carry the nontrivial Hagalaz frame-holonomy channel sought after RUN 094.**

## 1. Closed winding remains useful

A closed sector may be parameterized by

\[
\gamma_{mn}(t)=C(mt,nt),\qquad 0\le t\le 2\pi,
\]

for integers `(m,n)`. Its length remains

\[
\ell_{mn}=2\pi\sqrt{a^2m^2+b^2n^2},
\]

and RUN 094's spectral eigenvalue remains

\[
\lambda_{mn}=m^2/a^2+n^2/b^2.
\]

Thus closure, scale and shape channels survive. What fails is specifically the attempt to obtain a nontrivial **intrinsic tangent-bundle holonomy** from this flat torus.

## 2. Why this matters for solver unification

The product torus is simultaneously:

- excellent for exact closure sectors `(m,n)`;
- excellent for the scalar Laplace–Beltrami scale/shape gate;
- intrinsically flat, so its Levi–Civita holonomy is trivial;
- extrinsically embedded in `R4`, where the moving tangent/normal frame still changes along a winding.

Therefore Hagalaz needs at least two typed operator channels on this carrier:

1. **intrinsic scalar channel:** `Δ_g` for spectrum/scale/shape;
2. **extrinsic or bundle channel:** a normal-bundle / adapted-frame connection for rotation, twist and holonomy.

Collapsing these into one scalar Laplacian would erase precisely the information RUN 092 was designed to retain.

## 3. Explicit moving frame showing where the missing information lives

Define unit tangent directions on the torus

\[
e_p=(-\sin p,\cos p,0,0),\qquad
e_q=(0,0,-\sin q,\cos q),
\]

and radial normals

\[
n_p=(\cos p,\sin p,0,0),\qquad n_q=(0,0,\cos q,\sin q).
\]

Along `γ_mn(t)`,

\[
\dot e_p=-m n_p,\qquad \dot n_p=m e_p,
\]

\[
\dot e_q=-n n_q,\qquad \dot n_q=n e_q.
\]

So the ambient adapted frame undergoes two commuting plane rotations even though the intrinsic connection on the torus is trivial. Over one closed period the ambient frame returns after rotations `2πm` and `2πn`; its endpoint SO(4) element is also identity for integer closure, but the **path in SO(4)** and its accumulated generator are nontrivial and retain the winding labels.

This cleanly separates three notions that must not be conflated:

- endpoint closure of the carrier;
- intrinsic Levi–Civita holonomy;
- path/history of the embedded adapted frame in SO(4).

A Hagalaz holonomy observable must specify which of these is intended and, if endpoint-only, what additional connection/coupling prevents integer closure from trivializing it.

## 4. Immediate operator consequence

The next solver object should not be merely `Hol^LC(γ)` on the flat product torus. Candidate typed objects are instead:

\[
Q_\gamma=\mathcal P\exp\!\oint_\gamma A,
\]

where `A` is explicitly one of:

- the normal-bundle connection of a finite swept tube/carrier;
- the SO(4) adapted-frame generator inherited from the Hagalaz local operator;
- a connection on an associated bundle carrying the retained six-channel state.

The choice of `A` is a model decision and must not be smuggled in by calling every frame rotation “holonomy.”

## 5. Durable gate

For the unified Hagalaz record, require separate fields:

`closure_sector=(m,n)`

`spectral_scale={lambda_k, mu_k}`

`spectral_shape={eta,D,...}`

`intrinsic_LC_holonomy=I` for this exact flat carrier

`frame_path_or_bundle_holonomy=<typed connection required>`

This makes the negative result useful: the RUN 061/RUN 094 torus can remain the exact closure+spectrum benchmark while a richer connection supplies the rotational channel.

## 6. Status / next cursor

**Changed:** closed-carrier route narrowed. Intrinsic torus holonomy is exactly trivial and cannot serve as the desired Hagalaz rotational residual.

**Blocker:** the connection `A` carrying the six SO(4) Hagalaz channels must be defined from the current local generator or from a finite swept tube before a nontrivial Wilson/holonomy calculation is meaningful.

**Next cursor:** reconstruct the RUN 092 local SO(4) generator as an explicit connection along a closed `(m,n)` product-torus path, then compute its path-ordered exponential while keeping the RUN 094 scalar spectrum alongside it. This will test whether closure + spectral ruler + six-channel frame transport can coexist in one typed record.

No Nathan action required.
