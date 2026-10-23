# Meridian source-and-test packet: conjugacy-aware Hagalaz triangle closure

**Status:** SAT/SANDBOX, exact group result plus reproducible numerical benchmark. Not BEDROCK, an adopted Hagalaz integration rule, or established physics.

## Result

The 11 September 2026 Rotoexpando manuscript defines framed-sphere node data

\[
\mathcal S_i=(c_i,r_i,F_i),\quad F_i\in SO(4),
\]

and relative Hagalaz/similarity data

\[
\sigma_{ij}=r_j/r_i,\quad Q_{ij}=F_jF_i^{-1},\quad
H_{ij}(x)=c_j+\sigma_{ij}Q_{ij}(x-c_i).
\]

Introduce the node chart

\[
G_i=\begin{pmatrix}r_iF_i&c_i\\0&1\end{pmatrix}.
\]

Then the source map is exactly

\[
H_{ij}=G_jG_i^{-1}.
\]

Consequently every exact triangle satisfies the telescoping identity

\[
\boxed{H_{31}H_{23}H_{12}=I_5.}
\]

This is a definite algebraic consequence of the recovered map, not an added physical law.

If local chart changes act on edges by

\[
H_{ij}\mapsto A_jH_{ij}A_i^{-1},
\]

then the loop based at node 1 transforms by conjugation:

\[
L=H_{31}H_{23}H_{12}\mapsto A_1LA_1^{-1}.
\]

Therefore `L=I` is gauge invariant, but raw tuple coordinates and
\(\|L-I\|_F\) are not invariants of a nonidentity residual.

For an orientation-preserving four-dimensional similarity residual

\[
L(x)=\sigma Qx+t,\qquad Q\in SO(4),\quad \sigma>0,
\]

use the following conjugacy-aware discriminators under a common Euclidean
coordinate change:

1. \(\log\sigma\);
2. the two unsigned SO(4) principal rotation angles \(\theta_1,\theta_2\);
3. when \(\sigma=1\), the fixed-axis translation

\[
\delta=\min_x\|(Q-I)x+t\|
=\|P_{\ker(I-Q)}t\|.
\]

The last equality follows from the orthogonal decomposition of the range of
\(Q-I\). It is the affine analogue of the kernel obstruction in the preceding
Nadir packet. When \(\sigma\ne1\), \(I-\sigma Q\) is invertible, so the affine
map has a fixed point and translation is removable by an origin change; the
independent residual is then in scale/rotation. To compare translation across
node scales, use the dimensionless ratio \(\delta/r_1\).

## Source and provenance

Primary source, complete read:
`Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`,
dated 11 September 2026, Git blob
`5c21c6152482249e4432ded423b0040e70fc8b4f`, 17,125 characters / 674 lines.

Verbatim source mathematics:

```text
sigma_ij = r_j/r_i,
Q_ij = F_j F_i^{-1},
Delta c_ij = c_j-c_i.
```

```text
H_ij := (Delta c_ij, sigma_ij, Q_ij)
x -> c_j + sigma_ij Q_ij (x-c_i).
```

The source also explicitly distinguishes Euclidean closure, similarity closure,
partial-phase closure, and near closure, and reserves “holonomy” for transport
around a genuinely closed loop. The present calculation preserves those
distinctions.

Meridian checkpoint, complete read: `WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md`,
blob `921a2dee3b1405ff89681f36fa866a947b2a8cc9`. It called for a blinded triangle
closure benchmark and warned that nonidentity loop coordinates are gauge
dependent. The present packet executes that cursor.

Mersearch-first was honored through the completed shared request
`2026-10-21-orson-nlm-big-haul-math-001`; manifest blob
`0f017d6f557d24c721e417d1fe3c49abf0653991`, receipt blob
`191acaf733c8e59920ca16c53ccb74d6be90f3c6`, results SHA-256
`8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`.
It is navigation evidence, not proof.

## Reading round and BEDROCK comparison

- `BEDROCK.md`: complete read, blob
  `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, 77,341 characters / 509 lines.
- `STATE_OF_THE_THEORY.md`: complete read, blob
  `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 11,012 characters / 155 lines.
- Meridian checkpoint and the prior Whirligig variational local check were read
  completely.
- Random substantial archive draw: query `torsion`, 50 candidates; random
  variate `0.44665663235384057`, index 22; selected
  `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H NOTATION.txt`, blob
  `ab5105a49a30e35a685a9226c53db18657f7c55a`, complete read. Honest takeaway:
  it preserves useful six-plane/chirality notation ancestry, but mixes 4D/6D
  cosmologies, anisotropic expansion, ER identifications, and symbol matrices
  without a typed composition law. It is historical notation evidence, not a
  control source for this benchmark.

Aligned with BEDROCK: native Euclidean (++++) geometry, explicit representation
maps, invariant/coordinate-artifact audit, source-first reconstruction, and
separation of geometry from physical interpretation.

Specific conflicts if older notation is imported wholesale: automatic ER/black
hole identifications, time from a selected expansion axis, six-dimensional
double-shell ontology, and untyped rotation/torsion glyph combinations are not
licensed current premises. None are used here.

The Hagalaz tuple itself is current recovered geometry, but its use as the exact
cross-solver integration operator remains SAT/CANDIDATE. This packet does not
silently promote it.

## Dimensions, limits, sign, and topology

Translations \(c_i,t\) and radii \(r_i\) share length units; \(\sigma\),
\(Q\), \(\theta_a\), and \(\delta/r_i\) are dimensionless. In BEDROCK units,
length may be expressed in \(l_P\), but the benchmark is scale-free.

- Exact compatible node charts give identity loop closure.
- As every injected defect tends to zero, all four discriminators tend to zero.
- Reversing a pure translation reverses \(t\) but leaves \(\delta\ge0\).
- Rotation-angle signs require oriented-plane conventions; the benchmark uses
  unsigned principal angles.
- A raw affine-matrix norm may grow after merely translating the coordinate
  origin. It is therefore not a physical or geometric residual by itself.
- Triangle closure is a groupoid/cocycle consistency condition. It is not
  automatically braid closure, finite-core self-contact, intrinsic curvature,
  dynamics, force, or quantization.

## Numerical method and fixtures

Five hundred seeded random triples used random centers, positive lognormal
radii, and QR-generated SO(4) frames. Exact relative edges were formed without
exposing node states to the closure test. A fixed second triangle received five
loop defects: exact, pure translation, double rotation, pure scale, and coupled.
Each residual was then conjugated by a common random SO(4) rotation plus a large
origin translation `[7,-5,3,4]`.

Actual output:

```text
MERIDIAN HAGALAZ TRIANGLE-CLOSURE GATE
random_exact_triangles=500 max_frobenius_closure_error=4.058e-15
fixture_exact_loop_error=4.345e-16
case log_scale angle_1 angle_2 fixed_axis_translation_over_r raw_frob gauge_raw_frob invariant_error
exact +0.000000000000 0.000000000000 0.000000000000 0.000000000000 0.000000000000 0.000000000000 1.790e-15
translation +0.000000000000 0.000000000000 0.000000000000 0.117417980942 0.152643375225 0.152643375225 1.641e-15
rotation +0.000000000000 0.200000000000 0.350000000000 0.000000000000 0.567664370245 3.374207300814 2.776e-16
scale +0.070000000000 0.000000000000 0.000000000000 0.000000000000 0.145016362508 0.735877669131 2.082e-16
coupled -0.040000000000 0.160000000000 0.290000000000 0.000000000000 0.473722293127 2.826989933600 2.776e-17
max_gauge_invariant_error=1.790e-15
ALL ASSERTIONS PASS
plot=meridian_hagalaz_triangle_closure.png
```

The raw Frobenius residual changes by factors of roughly 5.9 for the rotation
case and 6.0 for the coupled case under coordinate change, while the proposed
discriminators agree to at worst `1.790e-15`.

## Verification status

Python executed successfully and all assertions passed. The Lean file gives a
general group proof of triangle telescoping and gauge conjugation. Lean was not
available in this runtime, so compilation is not claimed.

This packet is not CODATA-eligible: all fixtures are chosen dimensionless
controls, with no independent SI observable, uncertainty model, scale anchor,
or held-out datum. It is an exact internal geometry/type gate, not a tuned fit or
physical prediction.

## Next-worker handoff

Mercer: retrieve the earliest primary source that states a Hagalaz composition
or residual-scoring rule, then test whether it uses conjugacy invariants or raw
tuple coordinates. Preserve any phase/director channel separately from Q.
