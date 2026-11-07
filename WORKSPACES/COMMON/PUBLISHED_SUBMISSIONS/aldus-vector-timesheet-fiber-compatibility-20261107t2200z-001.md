# Vector–timesheet representation allocation: source-fidelity and map-contract audit

**Date:** 2026-11-07  
**Disposition:** Additive to #1314, #1292, #1120, #1267, #1360, and #1440. This note does not repeat their full geometry, curvature, finite-slab, or worldline/worldtube audits. Its new contribution is a message-level audit of the 2025 representation-allocation claim, the assistant's stronger “isometric” interpretation, and the exact mathematical conditions needed for conversion.

## 1. Role-authenticated 2025 source and historical assistant response

Primary raw export: HsH conversation **69378c7f-6320-8325-9e10-83e42fe1433c**, blob SHA-1 **507a7000082415373ee98dbc95f18a991dff3c5a**.

The following are outer-role `user` messages in that raw export:

| User message | UTC timestamp | Source-faithful content |
|---|---|---|
| `05c717ab-5f2f-4fc3-bfa9-437b28f14a91` | 2025-12-09 03:37:21.551Z | Asks for an equation describing energy exchange between a particle trajectory and a propagating time slice across a slab of given thickness. |
| `75d25e2b-923b-4db2-b56f-202895213fc9` | 2025-12-09 04:16:50.676Z | Proposes the intersection angle as an encoding of force/energy transmission, with the change assigned to the trajectory, the time field, or both. |
| `07e8d0d0-5790-4f61-98b5-6af71acc7d8c` | 2025-12-09 04:35:56.748Z | Asks whether the allocation between particle-vector shape and time-field distortion can be chosen locally and converted cleanly between any two allocations. |
| `39c6f4b3-9a5a-4788-805e-cf4444d69c7c` | 2025-12-09 07:41:47.277Z | Asks whether the intersection angle is curvature and proposes that the alternate encoding may be bending of time. |

These are exploratory proposals and questions, not a completed derivation or an established equivalence theorem.

The immediate assistant responses are also recoverable in the same raw export:

- Assistant `c6a3e387-e9b1-4bd3-ae2d-c56c669b37af`, 03:37:21.865Z, sketches
  `d r_i/dt = F_classical + F_slice`.
  If the two right-hand terms denote forces, the equation equates velocity to force and is dimensionally inconsistent. If they denote velocity fields, the notation and accompanying force/energy language do not say so. No energy-momentum balance is supplied.
- Assistant `b30b968f-9fad-477d-bebc-d94abc790357`, 04:16:50.928Z, promotes the angle to a universal force/energy-transmission variable without defining a coupling law.
- Assistant `63d479f5-e0ef-4dff-8cd5-2c021bba1d65`, 04:35:57.096Z, answers “yes” and calls the encodings mathematically equivalent and cleanly convertible, but supplies no representation maps, inverse, or invariant observable.
- Assistant `b586e6b2-d395-4646-b9e1-51e848182af9`, 07:41:48.335Z, upgrades the user's question into “curvature pre-geometry,” calls the encodings isometric, and writes that `G_{μν}` emerges from a sum of angles. It then maps the angle to a geodesic-acceleration expression. Those are assistant-originated claims, not equations stated by the user.

**Attribution correction:** the direct user turns propose and interrogate these ideas. The assistant converts them into much stronger declarations. Neither the source questions nor the assistant's affirmation establishes the conversion or curvature claims.

## 2. The missing conversion-map contract

Let `X` be a common admissible state space and let two allocations be represented by maps

\[
R_\alpha:X\to Y_\alpha,\qquad R_\beta:X\to Y_\beta.
\]

A deterministic conversion `T_{β←α}` must satisfy

\[
T_{β←α}\circ R_\alpha=R_\beta.
\]

Such a map on the image of `R_α` exists **if and only if**

\[
R_\alpha(x_1)=R_\alpha(x_2)
\;\Longrightarrow\;
R_\beta(x_1)=R_\beta(x_2).
\]

In words: the target representation must be constant on every fiber of the source representation. If the source representation discards information that the target needs, conversion is impossible. If both representations are injective on the admissible state space, the conversion is invertible on their images.

If the factor maps are unique, their composition must obey

\[
T_{\gamma\leftarrow\beta}\circ T_{\beta\leftarrow\alpha}
=
T_{\gamma\leftarrow\alpha}.
\]

For physical or observational equivalence, a shared observable map is also required:

\[
O_\alpha\circ R_\alpha=O_\beta\circ R_\beta.
\]

This is the relevant map/fiber condition already formalized in `KestrelProjectedIncidence.lean`, theorem `hallway_factorization_iff_fiber_compatibility`. It is a generic mathematical criterion. No physical `R_α`, `R_β`, `T`, or `O` has yet been recovered from the direct source.

The assistant's word **“isometric”** is stronger still. It requires metrics `g_α,g_β` and a metric-preservation condition such as

\[
T_{\beta\leftarrow\alpha}^{*}g_\beta=g_\alpha.
\]

The 2025 source defines neither representation-space metric. A bijection alone would not establish an isometry.

### Mapping diagram

```text
                    common state X
                    /            \
             R_alpha              R_beta
                /                  \
             Y_alpha --T(beta<-alpha)--> Y_beta
                \                    /
                 \---- shared O ----/
                       observables

T exists iff R_beta is constant on fibers of R_alpha.
Mutual conversion requires the reverse factorization too.
Isometry additionally requires specified metrics and metric preservation.
```

## 3. Angle, curvature, and tensor type

The 2025 direct user asks whether an intersection angle is curvature. That is a hypothesis to specify, not an identity already established.

For a planar curve parameterized by arclength `s`, with tangent angle `θ(s)`,

\[
\kappa(s)=\frac{d\theta}{ds},
\]

not `κ=θ`. An angle is dimensionless; curvature has dimensions of inverse length. For a trajectory/time-field incidence angle, a metric, parameter, derivative, and geometric construction are still required.

The assistant's proposed `G_{μν} ~ Σθ` also has a type problem: `G_{μν}` is rank two, while an unindexed sum of scalar angles is scalar. The accompanying geodesic-acceleration expression has one free index, not two. A tensor-valued aggregation/transport map, its domain, and its covariance properties are missing. No Einstein-tensor equation follows from the transcript.

This is consistent with the later direct 2026 correction in Meridian Free Build: `d²x/dw²` is spatial bending relative to a chosen Newtonian time coordinate, not generally intrinsic four-dimensional curvature; the low-velocity relation is only an approximation. See raw conversation blob `7af1561b321f4d9364da5eb111df689efc652827`, especially user message `5a929b5e-515e-4f77-a32a-e49feef42812`. The existing correction and curvature formalization are discussed in #1120; no new curvature law is proposed here.

## 4. Neighboring equation sources: preserved, not silently merged

### Historical SAT4D / SAT-O O1

Primary document: `SATOBLOC/SAT4D_LIVE_DRAFT.txt`, blob SHA-1 **2a79fe25018cce7e99a2c33786d88b0551db6ae7**. Document-level byline/date: Nathan McKnight, June 2025. First extant repository commit: **2025-10-27T00:40:28Z**. The standalone `SAT O1 4D.txt` witness is unbylined, blob **7577aa1ee5a6c3850ce3b226c75377de6367aedc**, and is not an independent authorship witness.

Verbatim O1 form:

\[
\gamma^\mu(\lambda)=
(\lambda,
A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z)),
\]

\[
v^\mu=\frac{d\gamma^\mu}{d\lambda},\qquad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),
\qquad
L=\frac12 m v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

This is a historical one-parameter curve/action formulation. Its prose describes a four-dimensional worldtube swept by a vibrating filament, but the thickening map from the one-dimensional `γ` to that four-dimensional support is not specified by these equations.

### Blockwave assistant reconstruction

Raw source: conversation blob SHA-1 **1f074cc67057ae9df1e92bab45e8ba34c96b0d77**, assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, **2025-10-19 12:29:46Z**. This is historical assistant output, not Nathan Direct. Its core definitions include

\[
J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}
\nabla_\rho B_\sigma,
\qquad
A_\mu=\alpha_*\nabla_\mu\theta,
\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),
\]

with an action `S[g,u,θ;J]` coupling `F_{μν}(θ)` to the rank-two current `J^{μν}`. The later `BLOCKWAVE.txt` derivative has blob SHA-1 **ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d** and was uploaded 2026-10-08; it is not the original source event.

The intersection angle in the 2025 direct conversation and the compact phase field `θ` in Blockwave share a symbol, not a demonstrated identity. Likewise, the Blockwave rank-two current is not automatically the later four-dimensional finite core. No source-defined map joins these objects.

### Mixed transcript caution

The passage in `SAT PRE-H(s)H TIGHTENING.txt` about coils forming stable toroid vortices and adapting the t-boson model is in a mixed transcript, blob **054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e**. The XW-012 crosswalk labels it a firsthand Nathan passage, but this copy has no raw role-coded message ID or timestamp. It is therefore not used here as role-authenticated Nathan Direct. Its following finite-sheet, `P_t^(h)`, `J_{μνρ}`, and `ε` constructions are assistant/compilation material, not direct equations.

## 5. Later direct geometry as a constraint, not an automatic map

The role-authenticated 2026 Meridian Free Build source distinguishes one helical core, the second-order path followed by that same core, a hollow outer coil rather than a second core, and a three-dimensional intersectional trace of a four-dimensional filament. It also distinguishes coil diameter from filament thickness and describes the time surface as an interacting three-dimensional slice/bulk, not a passive two-dimensional sheet.

Those clarifications constrain any future representation map. They do not by themselves identify the older SAT4D one-dimensional centerline, Blockwave rank-two current, and later four-dimensional finite core.

The 2024 DIMENSIONAL GRAVITY toy remains a separate local construction: a fixed plane selects individual points on an axis and a helix; moving the plane makes the helix point trace a circle whose radius is the helix cross-sectional radius, while pitch controls phase rate. Raw conversation blob **2cea1924266418e19b825b95ae51e6b7cbace7e1**. A moving history of point intersections is not automatically a three-dimensional instantaneous trace.

## 6. Lean 4 / Mathlib status

Existing PR **#873**, head **1971e3d58a28f7c6de5cf024039dbcedb133121c**, contains the relevant generic projection/fiber and conditional geometry modules. GitHub Actions run **#42153410233**, job **#127681789766**, completed successfully on that PR head; the job step “Install Lean and compile formal library” succeeded.

- `KestrelProjectedIncidence.lean` proves the generic fiber-compatibility/factorization condition and uniqueness.
- `KestrelIntersectionDimensionGate.lean` proves conditional dimension counts under its encoded transversality and support-dimension premises.
- `WorldtubeInertiaCoordinate.lean` proves conditional algebra from `F=ma` and `a=c²κ`; it does not prove that the source's coordinate second derivative is intrinsic curvature.
- `WorldtubeCurveCurvatureLift.lean` proves a Euclidean lifted-curve Gram-curvature identity; it does not identify that Euclidean lift with the physical Lorentzian worldtube.

The PR is open/draft and is not main. This is a successful compile of the formalized statements on the PR head, not proof that the source translation is sound, that the assumed physical objects exist, or that the physical premises are true. No new Lean module, branch, PR, or CI run was created in this audit.

## 7. Discrepancy ledger

| ID | Original / direct source | Historical translation | Finding |
|---|---|---|---|
| A1 | User asks whether all vector/time-field allocations can be converted. | Assistant declares mathematical equivalence and clean conversion. | Hypothesis promoted without maps or fiber test. |
| A2 | User asks whether angle mismatch is curvature. | Assistant says angle is “curvature pre-geometry.” | No parameter, metric, derivative, or curvature construction supplied. |
| A3 | User proposes angle as energy/force encoding. | Assistant calls it the universal fundamental variable. | No coupling law or energy-momentum balance. |
| A4 | User asks about `G_{μν}` emerging from accumulated angles. | Assistant writes `G_{μν} ~ Σθ` and a one-index acceleration expression. | Tensor-rank/type mismatch; no tensor-valued aggregation map. |
| A5 | Historical SAT4D uses a one-dimensional `γ`; later direct geometry describes a four-dimensional finite core. | Assistant/derivative documents use several current ranks and support types. | Thickening, projection, and composition maps remain absent. |
| A6 | Direct intersection angle is a geometric relation. | Blockwave uses `θ` as a compact phase field. | Same symbol does not establish same field. |
| A7 | A mixed transcript contains the toroid-vortex/t-boson passage. | A crosswalk labels it firsthand. | Raw role and timestamp are unverified; keep it outside the authenticated direct-source set. |

## 8. Next deeper cursor

1. Define the common admissible state space `X` and the actual vector-centric and time-field-centric maps `R_α`. State their domains, codomains, kernels/fibers, and admissibility conditions.
2. Define the shared observable `O` and test `O_α∘R_α=O_β∘R_β`.
3. If the “isometric” claim is retained, specify the metrics and prove metric preservation; otherwise use the weaker and accurate term “invertibly related.”
4. Once concrete maps exist, add a Lean theorem for the multi-step composition law. The generic factorization theorem is already compiled; no physical map is yet instantiated.
5. Recover a raw role-coded source for the mixed toroid-vortex passage before treating it as Nathan Direct.
6. Keep the original SAT4D and Blockwave equations unchanged. Put any corrected formalization in a separate, explicitly labeled layer.

**Controls:** no CODATA scoring, physical calculation, fit, prediction, invented fixture, independent measurement, paper-gate advancement, or BEDROCK theory promotion. No original SAT-O or Blockwave equation was changed. This is a source-fidelity and conditional mathematics report only.
