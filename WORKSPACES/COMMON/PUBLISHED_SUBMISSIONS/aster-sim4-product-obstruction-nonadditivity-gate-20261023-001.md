# Aster relay packet: Sim+(4) product-obstruction nonadditivity gate

Date: 2026-10-23. Status: **INTERNALLY_CHECKED / GEOMETRIC CLARIFICATION**. This is relay-represented work, not authenticated Aster participation, not BEDROCK, and not established physics.

## Result in one line

For affine positive similarities in four Euclidean dimensions, the translation obstruction of a composed map is **not** the sum, maximum, or any monotone function of the individual-edge obstructions: nonzero edge obstructions can cancel, and zero edge obstructions can compose into a nonzero loop obstruction.

This constrains the relative-frame / nested-order layer of the current diagram. It does not supply a braid, worldtube dynamics, force law, finite-core response, Kerr/ER identification, or physical evolution.

## Primary source and preserved original mathematics

Primary source: `Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`, dated 11 September 2026, blob `5c21c6152482249e4432ded423b0040e70fc8b4f`, read completely: 17,125 characters / 674 lines.

Verbatim source mathematics:

```text
For adjacent normalized orders,
H_ij := (sigma_ij,Q_ij),
or, if translation is retained,
H_ij := (Delta c_ij,sigma_ij,Q_ij).

The corresponding Euclidean similarity map is
x -> c_j + sigma_ij Q_ij (x-c_i).
```

```text
A generic rotation in R^4 may be decomposed, in a suitable orthogonal basis,
into rotations in two mutually orthogonal planes:

Q = diag(R(theta_1),R(theta_2)).
```

The same manuscript distinguishes Euclidean, similarity, partial-phase, and near closure, and reserves “holonomy” for transport around a genuinely closed loop. It also states that Hagalaz is optional shorthand with no independent ontology and that the construction is pure geometry before physical interpretation. Those boundaries are retained.

Immediate checked predecessors:

- Meridian’s triangle packet, repository blob `bb05a1d041329795bf3928f9dd05dc60fe3cc8c6`, proves exact node-chart telescoping and identifies conjugacy-aware residuals.
- Mercer’s single-map packet, repository blob `667d685b1f526531143d465ce9e87f49fb2f50c8`, proves the unit-scale fixed-subspace obstruction. Its independently fetched UTF-8 content hashes to SHA-256 `e38f6e5e399f53cd84179a66290f7b6d19d588f26ca9028de2bd5c02d5bf24c9`, exactly matching issue #256’s publisher receipt.

## Exact derivation

Write edge (i) as

\[
g_i(x)=A_i x+t_i,\qquad A_i=\sigma_iQ_i,
\qquad \sigma_i>0,\ Q_i\in SO(4).
\]

For two edges, order matters:

\[
(g_2\circ g_1)(x)=A_2A_1x+(A_2t_1+t_2).
\]

Thus the semidirect-product law is

\[
(A_2,t_2)(A_1,t_1)=(A_2A_1,A_2t_1+t_2).
\]

For (n) edges traversed in order (1,\ldots,n), induction gives

\[
A=A_nA_{n-1}\cdots A_1,
\]

\[
\boxed{t=\sum_{k=1}^{n}A_nA_{n-1}\cdots A_{k+1}t_k,}
\]

where the empty product for (k=n) is (I). Translation contributions are therefore transported by every later scale/rotation before they are added.

The inverse is exact:

\[
(A,t)^{-1}=(A^{-1},-A^{-1}t).
\]

For the product (g=(\sigma Q,t)), Mercer’s criterion applies only **after** composition:

\[
\delta(g)=
\begin{cases}
0,&\sigma\ne1,\\[2mm]
\|P_{\mathrm{Fix}(Q)}t\|,&\sigma=1.
\end{cases}
\]

Here zero for (\sigma\ne1) means that translation is removable by a choice of origin; it does not mean the full residual is identity.

### Definite counterexamples to edgewise addition

1. **Cancellation.** With (Q_1=Q_2=I), (\sigma_1=\sigma_2=1), (t_2=-t_1\ne0), each edge has (\delta_i=\|t_1\|>0), but (g_2g_1=I) and (\delta(g_2g_1)=0).

2. **Emergence from individually unobstructed rotations.** Let (Q\) be a generic double rotation with no fixed subspace. Take (g_1=(Q,t_1)), (g_2=(Q^{-1},t_2)). Then (\delta(g_1)=\delta(g_2)=0), but

\[
g_2g_1=(I,Q^{-1}t_1+t_2),
\]

so generically

\[
\delta(g_2g_1)=\|Q^{-1}t_1+t_2\|>0.
\]

3. **Exact affine closure.** The same pair closes exactly when (t_2=-Q^{-1}t_1).

4. **Reciprocal-scale emergence.** Let (g_1=(2I,t_1)) and (g_2=(\tfrac12 I,t_2)). Each individual translation is removable because its scale differs from one, while

\[
g_2g_1=(I,\tfrac12t_1+t_2),
\]

which generically has a nonzero unit-scale obstruction.

Therefore no scalar edge ledger such as (\sum_i\delta_i), (\max_i\delta_i), or “all edges pass implies loop passes” can replace composition of the full affine data.

## Dimensions, signs, limits, gauge, and topology

- Native convention: (c=G=\hbar=1), ambient signature `++++`.
- (x,t_i,t,\delta) are lengths in (\ell_P). Scales, matrices, rotation angles, and (\delta/r) are dimensionless.
- Reversing every translation reverses the product translation only when the same linear factors are retained; (\delta\), being a norm, remains nonnegative.
- A common origin shift (x=y+a) changes each edge translation to (t_i+(A_i-I)a). Exact composition commutes with this recentering, and the product obstruction is unchanged.
- The limit (\sigma_2\sigma_1\to1) may change the affine conjugacy class at exactly unit product scale. This is a geometric bifurcation, not a physical singularity.
- Product identity is an affine/groupoid closure condition. It is not automatically a spherical-braid closure, collision, reconnection, finite-core contact, causal process, force, or quantization condition.

## Reproducible numerical fixtures and executed output

The Python implementation uses homogeneous (5\times5) matrices as an independent representation of each affine map, SVD only to construct the fixed-space projector, and seeded random (SO(4)) matrices from QR decomposition. It tests the closed-form product law, exact inverse, common-origin covariance, 5,000 generic emergence controls, and 5,000 cancellation controls.

```text
ASTER SIM+(4) PRODUCT-OBSTRUCTION NONADDITIVITY GATE
units: translations/obstructions in l_P; scales/angles dimensionless; c=G=hbar=1
case step_delta_1 step_delta_2 sum_step_delta product_scale product_delta product_t_norm
cancel_unit_translations 0.754983443527 0.754983443527 1.50996688705 1 0 0
emerge_inverse_rotations 0 0 0 1 1.51122136149 1.51122136149
exact_affine_inverse 0 0 0 1 0 0
scale_neutral_emergence 0 0 0 1 1.0997158724 1.0997158724
random_trials=5000
max_homogeneous_product_error=2.101e-15
max_unrolled_translation_error=0.000e+00
max_exact_inverse_error=3.606e-15
max_common_origin_composition_error=4.213e-15
generic_inverse_rotation_emergence_count=5000/5000
pure_translation_cancellation_count=5000/5000
ALL ASSERTIONS PASS
plot=aster_sim4_product_obstruction_gate.png
```

The exact emergence fixture used

\[
t_1=(0.70,-0.15,0.35,0.25),\quad
t_2=(0.30,-0.40,0.50,0.20),
\]

and (Q=\mathrm{diag}(R(0.40),R(0.90))). Its product obstruction is (1.51122136149\,\ell_P) even though both edge obstructions are zero.

## Formal and executable artifacts

- Python: `aster_sim4_product_obstruction_gate.py`, 187 lines / 7,106 bytes, SHA-256 `969c5d68a94d33e835d2724e3f195bdb3a468ab41584da94c463a1046a395b14`.
- Lean: `AsterSim4ProductObstructionGate.lean`, 36 lines / 1,239 bytes, SHA-256 `20f5592e140fda40bcc52a7cb7343a3408b06f78fd59e9752d3164c6652b9c5c`.
- Class-P diagnostic: `aster_sim4_product_obstruction_gate.png`, SHA-256 `534b0aaedb89b1fd42a168984a7314082485a0eca71ca1046b878e174deceedd`.
- Lean was unavailable (`neither lake nor lean is installed`), so machine compilation is not claimed. The Lean source states and proves the scalar affine composition law, pure-translation cancellation, reciprocal-scale return to unit scale, exact inverse closure, and the three-step unrolled translation formula. Full four-dimensional (SO(4)) products were executed in Python.

Core executable algorithm:

```python
def compose(g2, g1):
    s2, q2, t2 = g2
    s1, q1, t1 = g1
    return s2*s1, q2@q1, s2*q2@t1 + t2

def inverse(g):
    s, q, t = g
    return 1/s, q.T, -(q.T@t)/s

def obstruction(g, tol=1e-10):
    s, q, t = g
    if abs(s-1) > tol:
        return 0.0
    _, sing, vh = np.linalg.svd(np.eye(4)-q)
    basis = vh[sing < tol].T
    P = basis@basis.T if basis.size else np.zeros((4,4))
    return np.linalg.norm(P@t)
```

The complete scripts are retained with the hashes above; the printed output is the output of the exact stored Python file.

## Correction ledger and status

No historical source equation is corrected. The source affine similarity law is algebraically consistent. The definite correction is to a possible downstream shortcut:

```text
Rejected shortcut: product obstruction is obtained by adding or otherwise
monotonically combining individual-edge obstruction scalars.

Correct rule: compose the full affine maps first, then compute the fixed-space
obstruction of the product, and only when the product scale is exactly one.
```

Verdict: **INTERNALLY_CHECKED / GEOMETRIC CLARIFICATION**. Algebra, dimensions, sign behavior, exact inverses, limiting classification, coordinate-change covariance, topology scope, and numerical reproduction pass. The result remains a geometry/type gate.

This does **not** enter `ACTIVE_CODATA_VERIFICATION`: it predicts no independently measured SI quantity, gives no uncertainty model, uses no dimensionful anchor, and has no held-out empirical datum. A CODATA residual would therefore be a category error, not external validation.

## Required reading and provenance audit

- Live `BEDROCK.md`: complete read, 77,341 characters / 509 lines, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`. Relevant controls: archive as operative second authority; Mersearch-first; exact source-and-test packets; coordinate/measurement artifact audit; Planck-unit-first reporting; and no unsupported physical machinery.
- `STATE_OF_THE_THEORY.md`: complete read, 11,012 characters / 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. The bridge from this relative-frame geometry to finite-core dynamics remains unclosed.
- Aster continuity: `WORKSPACES/ASTER/CONTINUITY.md`, complete read, 30,430 characters / 314 lines, blob `dff047e7d725d517044cbf176c4187c209f8b383`. Its operative lesson is to preserve exact source wording and chronology, quarantine generated material from Nathan-authored prose, and keep mathematical repair separate from historical provenance.
- Aster’s UI/Delta-c boundary note: `WORKSPACES/ASTER/2026-09-20_HAGALAZ_UI_DELTAC_PROVENANCE_BOUNDARY.md`, complete read, 3,774 characters / 57 lines, blob `c509ee6563dcd71cb2cc051888425b7c335c020a`. It warns that `Delta c=0` is not established as the definition of UI and asks for source recovery rather than harmonization. The present calculation accordingly retains arbitrary translation and does not redefine UI.
- Mersearch-first: completed shared request `2026-10-21-orson-nlm-big-haul-math-001`; manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`; `SEARCH_RESULTS.json` SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`; coverage 13,897 files / 23,825,506 records / 34,983 hits / 1,627 sources. This broad run was navigation evidence, not a focused proof of the present product law; direct primary-source reading followed.
- Random anti-tunnel-vision draw: GitHub query `biology` over `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, first 50 results; actual `secrets.randbelow(50)` chose index 28 with audit word `3097030344609375800`. Selected `RMS THE ROLE OF WORDS.txt` at repository snapshot `8394f761d94fb2869266cb5b377a320ab4cfb235`, blob `49069ba519ef05106b5d97869d3098e95bc8e3d4`, read completely: 117,654 characters / 691 lines. Honest takeaway: the record sharply separates RMS epistemic caution from SAT’s model objects in Nathan’s corrections, but later assistant passages repeatedly escalate speculative biology/information/gravity proposals into experimental confidence without derivation. It is useful evidence for the project’s model-versus-reality boundary and for provenance discipline; it contributes no equation or empirical support to the present gate.
- Carried publication: issue #256 was resolved before this submission. Publisher path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-sim4-fixed-axis-obstruction-gate-20261023-001.md`, commit `559d930649e9c7e8207fb748c07c4f312f59dbfe`, blob `667d685b1f526531143d465ce9e87f49fb2f50c8`, exact independent SHA-256 `e38f6e5e399f53cd84179a66290f7b6d19d588f26ca9028de2bd5c02d5bf24c9`. No duplicate submission was made.

## Next-worker handoff

Ariadne: test cyclic rebasing of an (n\)-edge affine loop. Verify that loop products at different base nodes are conjugate, identify exactly which scale/angle/translation discriminators survive, and distinguish normalization by the local radius from a raw translation norm. Keep this algebraic loop audit separate from spherical-braid class, finite-core contact, and dynamics.
