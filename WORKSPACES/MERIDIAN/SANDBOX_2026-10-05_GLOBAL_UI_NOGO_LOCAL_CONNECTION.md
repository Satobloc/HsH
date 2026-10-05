# Meridian XCIV — Global UI No-Go / Local-Connection Upgrade

Status: SANDBOXED; not canonical SAT/H(s)H.

## Sources actually read

- Old archive: \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/Worldlines.txt\`, lines 1–1200 requested/read. Extracted the old UI trajectory \(y(\lambda)=r(\lambda)R(\lambda)x_0\), six-plane SO(4) angular machinery, worldline/superhelix language, and intersectional-trace framing. Historical particle assignments, constants, lattice locks, and claimed predictions were not used as targets.
- HsH Sep-30 dump: \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt\`, lines 1–1400 requested/read. Extracted its formalization of dilation + SO(4) rotation and the embedded critique that a point map must be upgraded to a contour evolution \(\gamma(\lambda,s)\).

## Independent result

If a whole filament is transformed by a single similarity
\[
Y(s)=rQ\gamma(s),\qquad r>0,\quad Q\in SO(4),
\]
then pairwise distances scale uniformly, topology is unchanged, and Euclidean curvature obeys
\[
\kappa_Y=\kappa_\gamma/r.
\]

More generally all generalized Frenet curvatures scale with inverse length while dimensionless curvature ratios and winding structure are preserved. Therefore a global UI map cannot turn a helix into a genuine superhelix or create new local coiling order. It can only rotate/dilate geometry already present.

This is a no-go for identifying ᚼ with a global \(rR\) similarity if ᚼ is supposed to create helix→superhelix structure.

## Minimal upgrade

Promote the frame to depend on filament parameter:
\[
Y(s)=r(s)R(s)\gamma(s),\qquad
A_s=R^T\partial_sR\in\mathfrak{so}(4).
\]

Then
\[
R^T Y'
=
r'\gamma+r(\gamma'+A_s\gamma).
\]

The extra term \(A_s\gamma\) is absent from global UI and can generate a second winding scale. The natural H(s)H mechanical object is therefore not merely \(R\), but the local SO(4) connection \(A_s\).

Candidate compact grammar:
\[
\text{SAT map}: (r,R),
\qquad
\text{H(s)H local mechanics}: (r(s),A_s(s)),
\quad
A_s=R^{-1}R'.
\]

## Curvature caution

If \(A=R^{-1}dR\) comes from one globally smooth frame field, the Maurer–Cartan identity gives
\[
F=dA+A\wedge A=0.
\]
Nonzero connection curvature therefore requires an independent connection, singularities/defects, nontrivial patching, or another obstruction. Do not mistake a pure frame rewrite for physical curvature.

## Failure gate

Take an archived claimed helix→superhelix operation. If a single constant similarity \(rQ\) reproduces the output from the input, then no local H(s)H connection was required. If not, reconstruct \(R(s)\), calculate \(A_s\), and compare its two canonical SO(4) rates against the actual two geometric winding scales.

Nothing here is promoted beyond sandbox status.
