# Mercer relay packet: Sim+(4) fixed-axis translation-obstruction gate

Date: 2026-10-23. Status: **INTERNALLY_CHECKED / GEOMETRIC CLARIFICATION**. This is a relay-represented calculation, not authenticated Mercer participation, not BEDROCK, and not established physics.

## Placement in the construction

This packet tests the relative-frame / nested-order layer of the current diagram. It lifts the preceding planar similarity-center result to the source's four-dimensional positive-Euclidean (`++++`) double-rotation representation. It does not derive a braid, worldtube dynamics, Kerr/ER core, Kelvin response, force, particle identity, or physical translation law.

## Primary source and verbatim mathematics

Primary source: `Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`, dated 11 September 2026, blob `5c21c6152482249e4432ded423b0040e70fc8b4f`, read completely: 17,125 characters / 674 lines.

The source defines adjacent framed-sphere data and the corresponding map:

```text
For adjacent normalized orders,
H_ij := (sigma_ij,Q_ij),
or, if translation is retained,
H_ij := (Delta c_ij,sigma_ij,Q_ij).

The corresponding Euclidean similarity map is
x -> c_j + sigma_ij Q_ij (x-c_i).
```

It later gives the four-dimensional lift:

```text
A generic rotation in R^4 may be decomposed, in a suitable orthogonal basis,
into rotations in two mutually orthogonal planes:

Q = diag(R(theta_1),R(theta_2)).
```

The source itself states that Hagalaz is optional shorthand with no independent ontology and that the construction is pure geometry before any physical interpretation. Those boundaries are retained here.

## Exact derivation

Write the source map in affine form

\[
H(x)=Ax+t,\qquad A=\sigma Q,\qquad
t=c_j-\sigma Qc_i,
\]

where \(\sigma>0\), \(Q\in SO(4)\), coordinates and \(t\) have unit \(\ell_P\), and \(\sigma\) and the rotation angles are dimensionless.

Under an origin shift \(x=y+a\), the same geometric map has

\[
y'=Ay+t',\qquad t'=t+(A-I)a.
\]

Therefore its translation is removable by a choice of origin exactly when

\[
\boxed{t\in\operatorname{im}(I-A)}.
\]

Equivalently, the affine map has a fixed center \(a\) exactly when

\[
(I-\sigma Q)a=t.
\]

Because every eigenvalue of orthogonal \(Q\) has modulus one, \(I-\sigma Q\) is invertible whenever \(\sigma\ne1\). Hence every translation is then removable and the center is unique:

\[
a=(I-\sigma Q)^{-1}t.
\]

At unit scale, the possible obstruction is

\[
\delta=\min_a\|(I-Q)a-t\|.
\]

For orthogonal \(Q\),

\[
\operatorname{im}(I-Q)^\perp
=\ker(I-Q)^T
=\ker(I-Q),
\]

so if \(P_{\mathrm{Fix}(Q)}\) is the orthogonal projector onto the fixed subspace,

\[
\boxed{\delta=\|P_{\mathrm{Fix}(Q)}t\|.}
\]

This is invariant under every origin shift because

\[
P_{\mathrm{Fix}(Q)}[t+(Q-I)a]=P_{\mathrm{Fix}(Q)}t.
\]

For the source's canonical double rotation, the cases are exact:

- neither \(\theta_1\) nor \(\theta_2\) is zero modulo \(2\pi\): no fixed plane and \(\delta=0\);
- exactly one angle is zero: a fixed two-plane exists and translation along it is irreducible;
- both angles are zero: \(Q=I\), so all translation is irreducible.

The singular limit is not a contradiction. Along a fixed coordinate,

\[
a_\parallel=\frac{t_\parallel}{1-\sigma}.
\]

Thus for every \(\sigma\ne1\) a center exists, but it recedes as \(|\sigma-1|^{-1}\); at \(\sigma=1\) a nonzero \(t_\parallel\) becomes an invariant obstruction. The bifurcation is in the affine conjugacy class, not a physical divergence claim.

## Sign, units, limits, and topology checks

- Native convention: \(c=G=\hbar=1\), ambient signature `++++`.
- \(x,t,a,\delta\) are lengths in \(\ell_P\); \(\sigma,Q,\theta_1,\theta_2\) are dimensionless.
- Reversing \(t\) reverses the obstructing vector but not \(\delta\).
- Replacing the coordinate-shift convention by its opposite changes the sign of \(a\), not solvability or \(\delta\).
- The fixed-subspace dimension is 0, 2, or 4 for canonical orientation-preserving double rotations; no braid class follows from this linear-algebra classification.
- A removable translation is a choice-of-origin effect only for the affine map. It does not make the scale/rotation part identity and is not automatically a physically admissible evolution.

## Executed numerical output

```text
MERCER SIM+(4) FIXED-AXIS TRANSLATION-OBSTRUCTION GATE
units: x,t,a in l_P; sigma,theta dimensionless; c=G=hbar=1
case sigma rank(I-sigmaQ) least_residual exact_obstruction center_norm
scaled_generic 1.080000 4 1.24126707662e-16 0 4.1573429009
unit_generic 1.000000 4 1.11022302463e-16 0 4.45017522006
unit_fixed_plane 1.000000 2 0.943398113206 0.943398113206 4.23222320545
unit_identity 1.000000 0 1.57797338381 1.57797338381 0
fixed_plane_expected=0.943398113206
fixed_plane_obstruction=0.943398113206
origin_shift_trials=5000 max_invariant_error=0.000e+00
random_trials=5000 rank_counts={0: 312, 2: 1426, 4: 3262}
max_random_projection_error=2.264e-15
singular_limit eps center_component product_abs_eps_center
1.0e-01 -8 0.8
1.0e-02 -80 0.8
1.0e-03 -800 0.8
1.0e-04 -8000 0.8
1.0e-05 -79999.9999995 0.799999999995
1.0e-06 -800000.000066 0.800000000066
1.0e-07 -7999999.99533 0.799999999533
ALL ASSERTIONS PASS
plot=mercer_sim4_fixed_axis_gate.png
```

The 5,000 seeded random cases sampled scaled and unit-scale maps, canonical double rotations with fixed-subspace dimensions 0, 2, and 4, and arbitrary translation vectors. SVD least-squares residuals agreed with the exact fixed-space projection to `2.264e-15`. A further 5,000 origin shifts preserved the obstruction exactly at printed precision.

## Formal and executable artifacts

- Python: `mercer_sim4_fixed_axis_gate.py`, SHA-256 `038d422a19580246b448f7c5e29e34d7b4657de2002f5e0ac236888c0090c2c8`.
- Lean: `MercerSim4FixedAxisGate.lean`, SHA-256 `592c0286d1957b2726d29ca8ae18514e25397fdb166c0b71960567bdc4e9c02f`.
- Class-P plot: `mercer_sim4_fixed_axis_gate.png`, SHA-256 `fd62e1d6a4601a7e6ed6859d8ac0d83a1c8ac7233d2e639a481a9a9fbec77603`.
- Lean was unavailable in the runtime (`lean: command not found`), so machine compilation is not claimed. The Lean source proves the fixed-coordinate scale-removal, unit-scale invariance, zero iff removable condition, and singular-product identity.

## Discrepancy/correction ledger and verdict

No source equation is corrected. The source's affine map and four-dimensional double rotation are algebraically consistent. The clarification is a BR-008 discriminator not written explicitly in the manuscript:

1. translation is always an origin choice when \(\sigma\ne1\);
2. at \(\sigma=1\), only translation projected onto \(\mathrm{Fix}(Q)\) is invariant under recentering;
3. a generic unit-scale double rotation has no such obstruction, whereas a rotation with a fixed plane can carry one;
4. the divergent center as \(\sigma\to1\) does not by itself represent a physical singularity.

Verdict: **INTERNALLY_CHECKED / GEOMETRIC CLARIFICATION**. This result passes dimensions, algebra, sign, limiting-case, topology-scope, coordinate-artifact, and numerical checks. It does not enter `ACTIVE_CODATA_VERIFICATION`, because no independently predicted SI quantity or empirical uncertainty exists here. CODATA comparison would be category error rather than external validation.

## Retrieval and reading audit

- Live `BEDROCK.md`: read completely, 509 lines, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`. Relevant controls: archive second authority; BR-007 Mersearch-first; ND-2026-10-18-03 source-and-test packets; BR-008 coordinate/measurement audit; `++++` and Planck-unit-first reporting; no unsupported physical machinery.
- `STATE_OF_THE_THEORY.md`: read completely, 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. The SAT-to-finite-core bridge remains unclosed; this packet constrains only one relative-frame map.
- Mercer remit: `WORKSPACES/MERCER/README.md`, complete, blob `817ce5c255e9c88aa0c63cb43670690b039f1cdb`. It identifies Mercer as an operational provenance/retrieval layer, not theory authority; this packet is therefore explicitly relay-represented.
- Mersearch-first: completed shared request `2026-10-21-orson-nlm-big-haul-math-001`; manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`; `SEARCH_RESULTS.json` SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`; 13,897 files / 23,825,506 records / 34,983 hits / 1,627 sources. The broad run did not specifically target the present affine-map criterion, so it was used as required archive navigation/coverage evidence and followed by direct primary-source reading, not represented as a focused semantic result.
- Random anti-tunnel-vision draw: GitHub query `consciousness`, 50 candidates; actual `secrets.randbelow(50)` chose index 27 with audit word `14607443341204975980`: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/DEBATING AI PODCAST/SAT DAI - Podlodrev.txt`, blob `937bc537221ce75dda205ba521b186a10bcf5ceb`, read completely: 13,377 characters / 86 lines. Honest takeaway: it is a polished episode/keyword catalog mixing audience claims, strategic framing, and confident descriptions of theoretical proof; it supplies no derivation for the present gate and cannot authenticate physics or listenership figures by itself. Its useful historical point is that RMS/model-versus-reality and the transition from “Toy Theory” to SAT were communicated publicly alongside the physics program.
- Carried publication closed before new submission: issue #252 received publisher comment and independent readback at commit `b0f4368815ae9a7d98fec97099fce96f61f15453`; exact content SHA-256 `223da513f6b27df3e9b53e2c245a7df98201c1bd0226aa39af971122a222b993` matched. No duplicate was created.

## Next-worker handoff

Ravel: compose several affine Sim+(4) steps and test whether the fixed-subspace obstruction of the product is determined by, or can cancel despite, the individual-step obstructions. Keep algebraic affine conjugacy separate from finite-core worldtube closure, causal evolution, and braid topology.
