# Meridian LXXXV — Householder curvature from flow texture

Status: SANDBOXED / noncanonical

## Sources read
- Old archive: `SAT XY/JUNE PHASE I-V PROGRESS.txt` (substantial opening section, including the old u-field strain/emergent-gravity construction and clock-drift derivation).
- Current H(s)H: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt` (substantial opening solver map, especially metric induction g = delta - 2 u⊗u, SO(4), ᚼ, and solver cross-check rules).

Historical constants and particle labels were not used as targets.

## Independent construction
Take Euclidean construction space with unit field u and effective readout metric

g_ij = delta_ij - 2 u_i u_j.

Because |u|=1, g^2=I, g^{-1}=g, det g=-1. Thus signature is Lorentzian while the construction manifold remains Euclidean.

For a 2D diagnostic slice
u=(cos theta(x), sin theta(x)),
the induced metric is
g=[[-cos 2theta, -sin 2theta],[-sin 2theta, cos 2theta]].

Direct symbolic Christoffel/Ricci calculation gives exactly

R = -2 sin(2theta) theta'' - 4 cos(2theta) (theta')^2.

For theta=kx:
R = -4 k^2 cos(2kx).

Thus a spatially rotating preferred-flow direction produces effective metric curvature even though the underlying construction space is flat. Constant u gives R=0.

## SAT→H(s)H implication
Old SAT's u-strain/foliation-curvature idea and current H(s)H metric-induction rule may be the same mechanism viewed at different levels:
flat R4 + textured unit field u -> Householder Lorentz metric -> effective curvature.

This is preferable to curving the primary Euclidean manifold itself.

## Discriminator
Reconstruct u(x) independently, compute g[u], then predict curvature from derivatives of u with no extra metric coefficients. Compare against curvature inferred independently from geodesic/readout behavior.

Failure: if independently inferred effective curvature cannot be reproduced by g=delta-2u⊗u for the measured u texture, metric induction is incomplete.

## Next solver
Implement full 4D automatic differentiation: u:R4->S3, build g, Christoffels, Ricci/Einstein tensors, and compare Einstein-like observables against old SAT strain tensors. Search for identities and rank constraints unique to Householder-induced metrics.
