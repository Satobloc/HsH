# ORSON VAY SANDBOX — 2026-10-05 — Moving-intersection kinematics

## Source boundary

Old archive actually read:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`, lines 1–900 requested/read. Useful source material: the old SAT distinction between a rigid/persistent filament and flexible resolving time-surface; finite wavefront thickness as a possible observational scale; repeated concern with dropout/accessibility, intersection traces, and explicit late-file recognition that there may be genuine action in the 4D block. The file is highly speculative and contains many historical fitted constants/particle identifications. None are adopted here.

Current H(s)H actually read:
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, lines 1401–2800 requested/read. Useful current-side material encountered: finite resolving slab Sigma_t^(h), Euclidean R4 bulk, SO(4) configuration generator, finite-core worldtubes, recursive state generator, explicit resolving operation, and native bending/tension action candidates. Historical constants and particle-label closures ignored.

## Operational correction
The old “freeze the block, move the slice” rule is treated only as an inverse-mapping phase. Current H(s)H may have native 4D dynamics. Therefore observable motion should be decomposed into native tube motion plus moving-intersection kinematics.

## Concrete geometry: moving-intersection law

Let a resolving hypersurface be
F(x,lambda)=0
and a worldtube centerline/history be X(s,lambda). An observed intersection satisfies
F(X(s_*(lambda),lambda),lambda)=0.

Differentiate:
0 = F_lambda + grad F · (X_lambda + X_s ds_*/dlambda).

Hence

ds_*/dlambda = -(F_lambda + grad F · X_lambda)/(grad F · X_s).

This is the kinematic “readout velocity” along the tube. It is not itself native material motion.

For any observable spatial coordinate q(X),

dq_obs/dlambda = q_lambda + q_s ds_*/dlambda.

Thus apparent motion naturally separates into
native motion + intersection sweep.

## Planar toy model

Take resolving plane
tau = v_Sigma lambda,
and a locally straight dynamic filament
tau(s,lambda)=a s + u lambda,
q(s,lambda)=b s + w lambda.

Then
s_*(lambda) = (v_Sigma-u)lambda/a

and

dq_obs/dlambda = w + b(v_Sigma-u)/a.

As a -> 0, i.e. filament tangent approaches tangency with the resolving surface, apparent intersection speed diverges even when u,w,b are finite. This is ordinary moving-intersection geometry, analogous to a sweeping laser spot, and does not imply superluminal transport.

## H(s)H consequence

A finite-core tube and finite-thickness resolving slab should regularize the point-intersection divergence into a broadened/extended readout event. Therefore H(s)H should distinguish:
1. material/group velocity of tube excitations,
2. intersection/readout velocity,
3. propagation velocity of stresses/information,
4. detector integration over finite slab thickness.

This is especially important before interpreting any old SAT “superluminal snap,” dropout, or moving-slice acceleration as native dynamics.

## Failure condition

If a proposed SAT/H(s)H observable depends on the divergent intersection velocity and remains divergent after finite-core + finite-slab detector modeling, the readout model is incomplete or physically wrong. Conversely, if a claimed superluminal signal is only ds_*/dlambda or dq_obs/dlambda while causal stress propagation remains subluminal in the effective metric, it is not a transport prediction.

## Solver test

Construct a finite-radius 4D tube crossing a finite-thickness moving slab at controllable angle alpha. Give the tube an independent transverse wave packet with known native dispersion. Sweep alpha through near-tangency. Measure separately:
- material packet group velocity,
- centroid velocity of the observed intersection,
- duration/width of the readout event,
- detector-integrated energy flux.

Prediction candidate: point-intersection centroid velocity scales approximately as 1/(n·T) near tangency, while finite-core/slab event width grows so that no corresponding divergent transported energy flux appears.

This is a clean discriminator between native H(s)H dynamics and projection/readout kinematics.