# Meridian XCII — basis-free 3+1 expansion / Householder / Lorentz closure

SANDBOXED. Nothing here is a canonical physical claim.

## Sources actually read
- Old archive: `SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt`, opening section through the discussion of CTC/CSC, Euclidean time-space equivalence, and expansion-rate asymmetry. Read substantially.
- H(s)H Sep-30 dump: `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H REWORK.txt`, lines 500–1150, including the microscopic-action lock, Hessian target, and explicit warning not to impose Lorentz structure by calibration.

## Independent construction
Let Euclidean R4 carry a unit distinguished direction u and expansion tensor
D = h I + delta u⊗u.
For any v perpendicular to u define the Euclidean rotation generator
J_uv = u⊗v - v⊗u.
Then
[D,J_uv] = ± delta (u⊗v + v⊗u) = ± delta K_v.
Rotations wholly in u-perp commute with D.

The six generators {J_vw, K_v} preserve, up to scale, the unique symmetric bilinear form
g = I - 2 u⊗u,
which has eigenvalues (-1,+1,+1,+1). Thus the Householder metric and Lorentz Lie algebra are two consequences of the same rank-one expansion anisotropy, rather than independent assumptions.

## Scripted blind test
Random u = (-0.749297,-0.310200,-0.413774,-0.413668), delta=0.73.
Commutator construction residuals: 2.99e-16, 4.11e-16, 4.31e-16.
Solving X^T G + G X = 0 for symmetric G from the six generated matrices produced a one-dimensional nullspace. After normalization:
spec(G)=(-1,1,1,1),
det(G)=-1,
||G-(I-2uu^T)||_F=9.85e-16.

## New sandbox inference
A compact local grammar may be based on the pair (delta,u), or equivalently the traceless rank-one anisotropic part of D. It simultaneously determines:
1. the 3D equal-expansion normal subspace u-perp;
2. the three commuting spatial rotations;
3. the three boost-like generators obtained by commutator with D;
4. the Lorentzian readout metric g=I-2u⊗u.

This is stronger than separately positing a Householder metric and a 3+1 expansion split.

## Failure gate
Given a measured symmetric expansion tensor D, infer its isolated eigendirection u only if its spectrum is genuinely 3+1. Generate the Lie algebra from so(4) rotations and commutators with D, then solve blindly for symmetric G satisfying X^T G+GX=0. The construction fails if:
- D lacks a stable 3+1 eigenspectrum;
- the invariant-form nullspace is not one-dimensional up to scale;
- recovered G is not Lorentzian;
- recovered negative eigendirection does not coincide with the isolated expansion eigendirection.

## Next test
Apply this blind invariant-form solver to actual UI/H(s)H deformation fields pointwise. Compare the recovered G with the independently computed Householder readout g[u], without supplying either to the other solver.
