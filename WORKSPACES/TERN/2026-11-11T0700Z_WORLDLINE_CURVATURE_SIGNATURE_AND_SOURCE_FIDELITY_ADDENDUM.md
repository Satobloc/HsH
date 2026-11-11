# Tern Rook | Worldline curvature, finite-core geometry, and normalization source-fidelity addendum

**Run key:** `REVROT3-19-20261011:751:s0`  
**Nominal source date:** 2026-11-11T07:00Z  
**Status:** additive source-fidelity and conditional geometry derivation; no theory promotion, no physical calculation, no CODATA.

This addendum extends, rather than replaces, [issue #1292](https://github.com/Satobloc/HsH/issues/1292), [issue #1344](https://github.com/Satobloc/HsH/issues/1344), [issue #1376](https://github.com/Satobloc/HsH/issues/1376), and the existing Euclidean-curve formalization in [PR #1245](https://github.com/Satobloc/HsH/pull/1245). It adds an exact Lorentzian-versus-Euclidean curvature crosswalk and recovers the October 29 TOPLESS raw-source locator that issue #1344 had marked blocked.

## 1. Source custody and chronology

### 1.1 Meridian Free Build: October 9 direct geometry

- Conversation ID: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`.
- Raw Git blob: `7af1561b321f4d9364da5eb111df689efc652827`.
- Direct user message `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 2026-10-09T01:50:55.112Z.
- Nearby direct user message `5a929b5e-515e-4f77-a32a-e49feef42812`, 2026-10-09T02:46:38.173Z.
- Direct user message `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 2026-10-09T07:40:38.859Z.
- Additional direct geometry message `6f00a97a-aa84-45bf-9429-4ff70736014a`, 2026-10-09T01:13:43.652Z.

The 01:50 direct message says, in the classical Minkowski limit, that a worldtube's shape is determined by force and mass, that the filament is stationary in the block-universe description, and that particle motion is represented by filament topology rather than motion of the filament. It uses `w=ct` as a time-length coordinate in metres and states “worldtube curvature == inertia” as a conceptual equivalence.

The 02:46 direct message clarifies that the timesurface is an interacting three-dimensional bulk, not a passive readout. It also says the assistant's preceding “no elastic modulus / no invented tension” wording was not the intended restriction: stiffness and coil dimensions should be constrained from known systems and measured momentum under known force, not assigned invented values.

The 07:40 direct message distinguishes the 4D filament from its 3D intersectional trace, says the larger 3D-looking coil should not be assumed to self-close in 3D, and distinguishes coil radius from filament thickness. It asks that the ambiguous `worldtube ℓ` length notation be replaced by a symbol that specifically means diameter. The earlier direct message `6f00a97a...` describes one helical core, not a carrier plus a second-order core, with the larger coil hollow.

### 1.2 Historical normalization document

- SAT archive source: `DIMENSIONAL_NORMALIZATION.tex`.
- Blob SHA-1: `52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1`.
- First extant archive commit: `1fd97fe5b90910085b36cfde6ef61b8ce6181c9e`, 2026-09-08T22:55:04Z.
- Displayed title: *Metric Symmetry to Reveal the Grain*.
- Byline/date: Nathan McKnight & Janus C. Sol, September 9, 2026.
- Attached PDF: 10 pages, 445,700 bytes, SHA-256 `14ecb786e2659adf227c9455e048e79ff43774574a3d9b10711613af69208b06`.

The document calls `w=ct` an elementary time-to-length base map, not a new result and not an ontological claim. Its derivative map is:

\[
w=ct,\qquad \partial_t=c\,\partial_w,\qquad
\partial_t^n=c^n\partial_w^n,\qquad
\frac{dx}{dw}=\frac vc.
\]

The paper treats metric signature as a residual that must be preserved, not as something erased by the coordinate normalization. The paper is a coauthored historical working document, not a raw Nathan Direct message.

### 1.3 October 21 direct native-frame notation

- Conversation ID: `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`.
- Raw Git blob: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.
- Direct message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21T13:55:40.205Z.
- Nearby direct message `92856f85-9f67-44d0-b1c4-4e9ff7d6500d`, 2026-10-21T14:00:32.869Z.

The first says to preserve the literal `cw=t` notation, the tentative balanced expression `+/- (c+H_0)/2`, Forest Normalization, and `(++++)`. The second calls (H_0) a velocity in the expansion-centering description.

Current BEDROCK retains this as standing native-frame directive ND-2026-10-21-02 and explicitly prohibits silently inventing the type of (w) or rewriting `cw=t) as `w=ct`.

### 1.4 October 29 TOPLESS raw source now recovered

- Conversation title: *Calculation Relay :48 | House Tools*.
- Conversation ID: `6ad95036-dcf0-83ea-a879-7b9264ace7ec`.
- Raw Library export: `ND Calculation Relay _48 _ House Tools - raw(1).json`.
- File size: 8,041,559 bytes.
- Independently recorded SHA-256: `0781ee3deb033ef48eb0b3d330c4970bb448a2c94754a2906a700d07827e6a3f`.
- Direct user message `c68c8846-5564-4c8c-96a5-157c99839a6b), 2026-10-29T17:00:52.136314Z.
- Direct user message `9e5cd8be-5fd4-4b63-bc4b-6bff79767505`, 2026-10-29T17:28:42.902296Z.

The first describes each particle's “mouth” as a local intersection of a finite-core tube/thread with the moving wavefront, not as material from a literal doughnut. The second says time distance is spatial distance, describes all four dimensions as geometrically alike after the asymmetry is accounted for, and says to work “exclusively in `w=ct`” using Forest Normalization. It describes the wavefront as traversing worldlines at intrinsic speed (c), with coiled matter worldlines bunched relative to straighter vacuum worldlines.

This raw recovery supersedes the OCT29_RAW_SOURCE_BLOCKED status in issue #1344. It does **not** establish that the October 29 branch globally revokes the October 21 `cw=t` native-frame directive. Preserve both direct witnesses and their contexts. No global conversion map or explicit global supersession is established.

## 2. Direct geometry versus assistant reconstruction

The direct geometry supports these distinctions:

- A stationary block-universe filament versus a moving intersection/wavefront description.
- A 4D filament versus its 3D intersectional trace.
- A finite-core tube/thread versus a 1D centerline/worldline.
- A 3D timesheet as an interacting bulk, not merely a passive display.
- One helical core and a larger hollow coil, without assuming a second-order core or 3D self-closure.
- Coil radius, core thickness, and a proposed worldtube diameter as different quantities.

The historical assistant first proposed a moving-filament constrained-trajectory model:

\[
a_\perp=v^2\kappa,\qquad
F_\perp=mv^2\kappa,\qquad
F_\perp=mc^2\kappa\quad\text{if }v=c.
\]

That is a standard constrained-motion construction under its own assumptions, but it does not faithfully express the direct block-model statement that the filament itself is stationary and particle motion is represented by topology/intersection history. The direct correction must remain visible.

A later assistant reconstruction used:

\[
\mathbf X(w)=(w,\mathbf x(w)),\qquad
\frac{d\mathbf x}{dw}=\frac{\mathbf v}{c},\qquad
\frac{d^2\mathbf x}{dw^2}=\frac{\mathbf a}{c^2},
\]

and therefore:

\[
\mathbf F=m\mathbf a=mc^2\frac{d^2\mathbf x}{dw^2}.
\]

This is a valid Newtonian coordinate reparameterization when (w=ct). The assistant also correctly caveated that the spatial second derivative is coordinate bending relative to the chosen Newtonian time coordinate, not generally the intrinsic curvature of the 4D curve. Its magnitude agrees with the leading curvature approximation in the low-velocity limit.

The equation is not, by itself, a finite-core worldtube constitutive law, a derivation of filament stiffness, or a proof that worldtube curvature and inertia are physically identical. The direct phrase “worldtube curvature == inertia” is a structural claim whose quantitative map remains undefined.

## 3. New exact curvature crosswalk

Let the 1D centerline be:

\[
X(w)=(w,\mathbf x(w)),\qquad
\mathbf u=\frac{d\mathbf x}{dw},\qquad
\mathbf b=\frac{d^2\mathbf x}{dw^2}.
\]

Write (u^2=\mathbf u\cdot\mathbf u), (b^2=\mathbf b\cdot\mathbf b), and (u\cdot b=\mathbf u\cdot\mathbf b).

### 3.1 Positive-definite Euclidean lift

For the Euclidean metric (dw^2+d\mathbf x^2), the Gram-determinant curvature of this lifted 1D curve is:

\[
\boxed{
\kappa_E^2=
\frac{(1+u^2)b^2-(u\cdot b)^2}{(1+u^2)^3}
}
\]

This is the same conditional algebraic expression already formalized in PR #1245 and in the `WorldtubeCurveCurvatureLift.lean` module of PR #873. It is a theorem about the explicitly defined Euclidean lift, not a theorem that the physical H(s)H worldtube uses that lift.

### 3.2 Lorentzian timelike lift

For the distinct Minkowski metric with signature ((-+++)), the tangent is timelike when (u^2<1). The invariant curvature of the same coordinate curve is:

\[
\boxed{
\kappa_L^2=
\frac{(1-u^2)b^2+(u\cdot b)^2}{(1-u^2)^3}
}
\]

Equivalently, with (\gamma=(1-u^2)^{-1/2}):

\[
\kappa_L^2=\gamma^4b^2+\gamma^6(u\cdot b)^2.
\]

For acceleration parallel to the spatial velocity, (\kappa_L=\gamma^3|b|). For perpendicular acceleration, (\kappa_L=\gamma^2|b|).

### 3.3 Classical limit

Both metric-dependent curvatures reduce to the coordinate-acceleration magnitude as (u\to0):

\[
\lim_{u\to0}\kappa_E^2=b^2,
\qquad
\lim_{u\to0}\kappa_L^2=b^2.
\]

Thus the October 9 classical-limit statement is compatible with the leading coordinate-bending approximation. It does not make the Euclidean and Lorentzian curvatures identical away from that limit.

A SymPy symbolic check was executed using the Gram-determinant definitions. Both reductions simplified exactly to zero residual. This is a symbolic algebra check, not a Lean proof, an observational test, or validation of the physical premises.

**Critical scope:** these formulas describe a 1D curve embedded in a 4D metric space. They do not compute the curvature of a finite-core worldtube or establish the map from a centerline to a 4D filament support.

## 4. Support type and intersection map remain unresolved

For a (k)-dimensional support (A^k\subset M^4) intersecting a 3D timesheet (\Sigma^3) transversely:

\[
\dim(A\pitchfork\Sigma)=k+3-4=k-1.
\]

Therefore:

| Support dimension (k) | Generic transverse trace dimension |
|---:|---:|
| 1D curve | 0D |
| 2D worldsheet | 1D |
| 3D support | 2D |
| 4D support | 3D |

The direct phrase “4D filament” may mean a filament embedded in a 4D ambient space, or a 4D finite-core support. Those are different types. A 1D filament in a 4D ambient manifold does not generically produce a 3D intersection with a 3D timesheet. A full-dimensional 4D support does. The source's “3D intersectional trace” therefore requires a declared support type and an explicit finite-core/centerline map.

The existing conditional carrier/slice dimension formalization in PR #1133 is the reuse point. No new topology theorem is claimed here.

## 5. Normalization and notation discrepancy ledger

| Source layer | Statement | Status |
|---|---|---|
| September 9 coauthored paper | (w=ct) is a standard, lossless time-to-length base map; no ontological claim | Historical working document |
| October 9 direct, classical Minkowski limit | (w=ct), time-length coordinate in metres | Direct, context-specific |
| October 21 direct | Literal (cw=t), ((++++)), Forest Normalization, tentative balanced (c/H_0) shorthand | Direct, retained by current BEDROCK |
| October 29 TOPLESS direct | Work exclusively in (w=ct), Forest Normalization, all four dimensions geometrically alike | Direct, branch-specific; no explicit global revocation |
| Current BEDROCK | Preserve native (cw=t), ((++++)), Planck-unit-first rule; do not invent (w)'s type | Controlling current directive |

Under ordinary SI typing, (w=ct) gives ([w]=L). Literal (cw=t), if (c) retains dimensions (LT^{-1}), implies ([w]=T^2/L). In (c=1) units the numerical forms may collapse, but that does not establish the geometric role of (w), the metric signature, or the required invertible map. Preserve the literal notation until the type map is explicitly supplied.

The expression (H_0+c) is dimensionally invalid if (H_0) is a rate and (c) is a speed. Current BEDROCK's dimensional comparison uses a declared length (L):

\[
v_H=H_0L,\qquad
\epsilon_H(L)=\frac{H_0L}{c}=\frac{L}{R_H},
\qquad R_H=\frac{c}{H_0}.
\]

This is a dimensional normalization, not a derived gravitational law or an observational result. The October 29 direct source itself calls the `H_0+c` shorthand incorrectly expressed.

Forest Normalization is a separate named method. The November 4 direct clarification describes it as an orientation/viewing convention associated with a maximally symmetric axis, but its exact algorithm, invariants, axis-selection rule, and uniqueness conditions remain unrecovered. Do not substitute the ordinary (w=ct) map, the separate physical-information Forest graph, or the BPHZ forest formula.

The October 29 TOPLESS direct source also contains an internal numerical typo: it says “almost six trillion miles” but writes 5,874,589,152 miles for one light-year. The written figure is short by a factor of 1,000 relative to the stated “almost six trillion” magnitude. This is a source arithmetic inconsistency, not a new physical calculation.

## 6. Stable glossary and mapping diagram

| Term | Working type | Required map |
|---|---|---|
| (\gamma^1) | 1D worldline/centerline | Parameterization and ambient metric |
| (F) | 4D filament object | Ambient embedding and support dimension |
| (W) | Finite-core worldtube/support | Centerline-to-core thickening map |
| (\Sigma^3) | 3D timesheet/wavefront bulk | Foliation, orientation, normal/director |
| (P) | Particle mouth/trace (W\cap\Sigma) | Transversality and local readout/interaction map |
| (R_{\rm coil}) | Provisional coil-radius label | Source symbol and scale definition |
| (D_{\rm core}) | Provisional core-diameter label | Source's requested diameter convention |
| (\epsilon_{\rm core}) | Provisional core-thickness label | Distinct from coil radius |
| (w) | Fourth/time-length coordinate | Native type and normalization map |
| (\mathbf u,\mathbf b) | Coordinate first and second derivatives | Metric-dependent curvature construction |
| (\kappa_E,\kappa_L) | Euclidean/Lorentzian centerline curvature | Metric and parameterization |
| Forest Normalization | Named orientation/normalization method | Authoritative algorithm still required |

\[
\begin{array}{c}
\text{4D filament / finite-core }F,W\quad(\text{support type unresolved})\\
\downarrow\;\text{centerline and finite-core map missing}\\
\gamma^1(w)=(w,\mathbf x(w))\\
\downarrow\;\text{choose metric and parameterization}\\
\kappa_E\quad\text{or}\quad\kappa_L\\
\downarrow\;\text{embed finite support and specify }\Sigma^3\\
P=W\cap\Sigma^3\\
\downarrow\;\text{interaction/readout and observable map missing}\\
\text{inertial / gravitational response}
\end{array}
\]

The diagram is a map inventory, not a claim that the missing maps exist. The timesheet is not to be reduced to a passive display: the direct source calls it an interacting 3D bulk.

## 7. Adjacent SAT-O / Blockwave custody boundary

No SAT-O equation was altered or promoted in this run. The current archive file locator for the June 2025 SAT-O1/Live Draft copies did not resolve through the current GitHub contents endpoint, so no verbatim SAT-O equation is newly asserted from a fresh read here. Existing source-custody records remain the locator; do not substitute the unbylined SAT-O1 module for the bylined SAT4D draft.

The adjacent HsH attachment `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt` was retrieved:

- Blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- First extant HsH path commit: 2026-10-08.
- Embedded authorship remains unresolved; the attachment is not treated as Nathan-authored merely because it was user-supplied.

Its assistant-generated action includes:

\[
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),
\]

\[
L_{\rm hol}=\frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu},
\qquad
L_{\rm mix}=\frac12J_{\mu\nu}\mathcal M^{\mu\nu}{}_{\rho\sigma}(\theta,u)J^{\rho\sigma}.
\]

The attachment treats (J^{\mu\nu}) as a conserved two-form worldsheet current. No map from that current to the direct finite-core 4D worldtube/filament support is established here. The Blockwave equations remain a separate assistant-generated historical proposal, not a premise for the curvature calculation.

## 8. Formalization and proof status

The next Lean 4/Mathlib propositions are:

1. Lorentzian Gram-curvature reduction for (X(w)=(w,\mathbf x(w))) under (u^2<1).
2. Euclidean Gram-curvature reduction for the same coordinate curve under (++++).
3. The low-velocity limiting equality (\kappa_E^2,\kappa_L^2\to b^2).
4. The conditional transversality dimension rule for a specified support dimension.

Existing infrastructure:

- PR #873, `WorldtubeInertiaCoordinate.lean`: the theorem `force_eq_mass_c_squared_curvature` assumes both (F=ma) and (a=c^2\kappa), then proves the algebraic consequence. It does **not** prove that (\kappa) is the geometric curvature.
- PR #873, `WorldtubeCurveCurvatureLift.lean`: conditional Euclidean Gram-curvature algebra for the affine lift.
- PR #1245, `SableEuclideanHelixCurvature.lean`: Euclidean circular-helix lift specialization.
- PR #873's Kestrel timelike gate proves a conditional tangent-norm/timelikeness statement, not the Lorentzian curvature formula.
- PR #1133 remains the conditional carrier/slice dimension reuse point.

No Lean executable, Lake, or Elan is installed in this runtime. No Lean compile or actual run is claimed. The existing PRs remain draft/unmerged; their historical merge-ref successes are not exact-head-only verification. The SymPy identity check is not a formal proof.

## 9. Discrepancy ledger

| Issue | Direct source | Historical assistant translation | Current status |
|---|---|---|---|
| Filament motion | Stationary block filament; particle motion is topology/intersection history | Initially used a moving-filament constrained-force model | Initial translation is not faithful to the direct block interpretation |
| Inertia/curvature | Qualitative worldtube-curvature/inertia equivalence at classical limit | (F=mc^2\mathbf x_{ww}) | Valid Newtonian coordinate relation; not an intrinsic worldtube law |
| Curve curvature | Direct source does not define a unique invariant | Coordinate second derivative sometimes called bending/curvature | Exact metric-dependent formulas now separated |
| Object support | 4D filament and 3D intersectional trace | 1D lifted curve (X(w)) | Centerline-to-finite-core map missing |
| Timesheet | Interacting 3D bulk | Sometimes treated as a passive readout | Preserve interaction |
| Radius/thickness | Coil radius, core thickness, and requested diameter differ | Earlier descriptions risked collapsing them | Separate symbols/maps required |
| Normalization | October 9/29 (w=ct); October 21 (cw=t), (++++) | Earlier summaries sometimes chose one globally | Preserve context-specific witnesses |
| Forest | Named normalization method | Sometimes treated as ordinary (w=ct) | Exact algorithm missing |
| (H_0+c) | Direct source calls shorthand incorrectly expressed | Naive sum would be dimensionally invalid | Use declared (L) only for typed comparison |
| TOPLESS distance figure | “Almost six trillion” with a 5.874-billion written value | Intake corrected factor 1,000 | Direct-source arithmetic typo preserved |

## 10. Next deeper cursor

1. Define whether the physical primitive is a 1D filament in 4D, a finite-core 4D support, or a typed pair of centerline plus core. Preserve both until the source chooses.
2. Specify the metric for each layer: ambient native (++++), any induced/effective Lorentzian metric, and the ordinary 3+1 Minkowski comparator.
3. Supply an explicit typed map between the October 21 literal (cw=t) and the October 29 branch's (w=ct), or record an explicit scope/supersession statement. Do not silently invert either.
4. Recover the authoritative Forest Normalization algorithm.
5. Define the finite-core thickening map, the timesheet foliation, the transverse intersection, and the interaction/readout map.
6. Formalize the Lorentzian curvature identity in the existing Lean infrastructure and obtain an actual exact-head Lean 4/Mathlib run before claiming proof.
7. Keep the measured-system, uncertainty, and prediction-versus-fit gate closed until a specific real system and dataset are identified and permission is supplied.

**Final epistemic status:** source-recovered direct propositions; assistant-generated coordinate reconstruction; exact conditional Euclidean/Lorentzian curve-geometry comparison; support and constitutive maps unresolved. No physical prediction, measurement, fit, CODATA scoring, or theory promotion.
