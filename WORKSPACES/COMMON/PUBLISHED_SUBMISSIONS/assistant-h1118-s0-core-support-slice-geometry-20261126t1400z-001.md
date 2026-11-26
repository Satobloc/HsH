# Source-Fidelity Delta: One Core, Finite-Core Support, and the Curvature Translation

**Run key:** `REVROT3-19-20261011:1118:s0`  
**Source cut:** HsH `main` at `20f770232dfdafff9b51b60b2aba5941388ffe04`; SAT archive `main` at `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`; HSH_RESOURCES `main` at `a2666fd83da8c31bc45da4aec999a30f47420601`.  
**Scope:** Lane 00, Nathan Direct geometry fidelity. No CODATA scoring, physical calculation, paper-gate advancement, or theory promotion.

The deterministic ring calculation is \(h=1118\), \(seq=5590\), ring index \(4\) (Alberr), next index \(5\) (Mira). This is scheduling bookkeeping only. It does not authenticate a worker, thread, or cross-thread delivery.

## 1. New delta beyond the existing geometry audits

This report does not repeat the already-published dimension ladder or the Morrow h1116 tube/slice audit. It isolates four source-fidelity issues that were not adequately resolved there:

1. Nathan Direct describes **one helical core, no second-order core**, a hollow larger superhelix, a Kerr-scale finite core, and a distinct first-order coil radius near 0.7 fm. The 0.7 fm scale is explicitly not filament thickness. Nathan also asks for flexibility and tension. The current `WorldtubeInertiaCoordinate` source comment incorrectly attributes a categorical rejection of independent tension or spring-constant structure to Nathan.
2. Nathan Direct says **worldtube curvature is inertia**, but does not identify which curvature object is meant. The assistant formalization substitutes a particular curve-curvature premise and proves an algebraic consequence. It does not derive that premise or identify it with the curvature of a finite-core support.
3. The Nathan-attributed SAT4D draft contains a strict static-block mode and an O1 section describing intrinsic filament vibration. Their relationship is not specified. Later direct messages shift toward static filament history with topology change and an interacting three-dimensional time bulk.
4. The existing Lean dimension gate is already the right formalization for the conditional intersection dimensions. Its successful exact-PR-head build is verified, but the full geometric and physical maps remain absent.

## 2. Primary-source cluster and status labels

### 2024: line, moving slice, and particle-as-intersection

Raw conversation: **DIMENSIONAL GRAVITY**, conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, raw blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`. [Archive path](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22%E2%80%A226.06.01%E2%80%A2DIMENSIONAL%20GRAVITY%20%E2%80%94%20raw.json).

The direct messages describe a one-dimensional string/line intersecting a moving lower-dimensional surface at a point. As the surface moves, the intersection point traces a circle; the radius is described as independent of pitch and determined by the separation between the straight reference line and the helix. The later 4D description lifts this picture to a 3D time surface in a 4D carrier. The word “string” is a descriptive convenience in this source, not an adoption of fundamental string theory.

This is an early **coreline/intersection** picture. It does not yet describe a finite four-dimensional support.

### 2025: SAT4D and SAT-O1 historical equations

- `SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, document byline Nathan McKnight with AI assistance. The document-level byline does not authenticate every equation line.
- `SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, unbylined, duplicating the O1 section. Source-custodied SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`. File-index creation 2025-06-07 and last write 2025-06-09; first extant Git commit 2025-10-27T00:40:28Z.
- [SAT4D live draft](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT4D_LIVE_DRAFT.txt) and [SAT-O1](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt).

The same draft describes a static 4D block mode in which filaments are fixed histories and the time surface moves, while O1 describes intrinsic tension, vibration, and active dynamic paths. These may be different modeling modes, but no map between them is stated. The 2026 direct description that classical particle motion is filament topology rather than literal filament motion does not automatically resolve the O1 action parameter \(\lambda\).

### 2026-10-09: one core, hollow coil, tension, and interacting time bulk

Raw conversation: **Meridian Free Build**, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`. [Archive path](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/26.10.05%E2%80%A226.10.20%E2%80%A2Meridian%20Free%20Build%20%E2%80%94%20raw.json).

Direct-message anchors:

- `6f00a97a-aa84-45bf-9429-4ff70736014a`: one helical core, no second-order core; the larger coil is hollow; the finite core is associated tentatively with a Kerr-scale structure.
- `44e9df22-a6ac-49ca-92ac-c74c8f137310`: asks for filament flexibility and tension values and for conditions under which the filament coils. This is a research request, not a measured dataset.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1`: “filament motion is not a thing” at the classical limit; particle motion is filament topology; worldtube curvature is identified with inertia; an earlier \(w=ct\) convention is stated.
- `5a929b5e-515e-4f77-a32a-e49feef42812`: rejects the assistant's preceding categorical “no elastic modulus / no spring constant” description; describes the time surface as a three-dimensional slice or bulk interacting with matter, not merely a passive readout.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`: explicitly says the approximately 0.7 fm figure is not filament thickness, but a bound on the presumed spin-equivalent first-order coil radius/diameter. Filament stiffness sets coil size; determining stiffness would require precision momentum-under-known-force data. The existing symbol ℓ is called misleading because the intended measure is axis-to-circumference, not length along the helix.

A separate direct message `2bef9e5d...` recalls a previous tension estimate in the neighborhood of \(10^{44}\,\mathrm J\). No derivation, measured system, dataset, uncertainty, or independent measurement was recovered here. It is preserved as a historical claim only and is not used in a calculation.

### 2026-10-20/21: curvature and coordinate conventions

Raw conversation: **Meridian Minkowski Ring Analysis**, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`. [Archive path](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/26.10.20%E2%80%A226.10.22%E2%80%A2Meridian%20Minkowski%20Ring%20Analysis%20%E2%80%94%20raw.json).

Direct anchors include:

- `f658b2db-32f0-45cd-828b-140691cc9afb`: a proposed relationship between 3D rotation and 4D curvature.
- `090f5160-1020-486d-9c42-df3d7dff2063`: the older reciprocal “filament deforms timesheet / timesheet deforms filament” description is retired in favor of the later Klein Fabric model.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892`: later direct \(cw=t\) and \(++++\) notation, with Forest Normalization context.

The earlier \(w=ct\) and later \(cw=t\) statements are retained as distinct direct-source conventions. They are not silently normalized as a typo. The metric signature, unit system, and coordinate map between them remain unresolved.

### 2026-10-29 and 2026-11-08: finite-core support and slice distinction

The 2026-10-29 direct clarification is preserved in [the 4D/3D slice clarification record](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/2026-10-29_NATHAN_DIRECT_4D_3D_SLICE_CLARIFICATION.md). It distinguishes a 4D tube from a 3D slice and does not equate the whole tube with its instantaneous section.

The 2026-11-08 **ND Workshop Relay :24 | Geometry** raw Library export was retrieved through Library search because all four Mersearch lanes were occupied. Selected export: 8,331,175 bytes; the previously verified SHA-256 is `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`. The public [Morrow h1116 source-fidelity report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/2026-11-26T1200Z_H1116_S0_LANE00_W_T_AND_TIMESHEET_GEOMETRY_FIDELITY.md) records the source conversation and direct-message locators.

The direct messages distinguish a 4D tube region around a 1D core, a 3D boundary, a possible mouth onto the time surface, and a 2D worldsheet as a possible simplification. They also say pants topology is a special split case, not the general straight/vacuum or coiled/matter tube; an Alexander-horned-sphere construction is floated as a split/merge heuristic. The same cluster identifies \(\theta_4\) as the canonical vacuum/matter discriminator and keeps spatial \(w\) distinct from proper time.

## 3. Stable glossary

| Term | Working type | Fidelity boundary |
|---|---|---|
| \(M^4\) | Four-dimensional carrier/history | Metric and signature vary across historical sources; no single convention is silently imposed |
| \(\gamma^1\) | One-dimensional coreline/filament | Not itself a 4D volume; may be a static history rather than a moving particle path |
| \(W^4\) | Proposed finite-core 4D support/tube region around \(\gamma^1\) | Its embedding/thickening map is not source-defined |
| \(C_{\mathrm{hollow}}\) | Larger coiled trace or hollow coil | Not a second physical core |
| \(\partial W^3\) | 3D boundary of a 4D support | Boundary construction and orientation are unspecified |
| \(\Sigma^3\) | 3D time surface/bulk or resolving slice | Direct source says it interacts with matter; it is not automatically a passive readout |
| \(B^2\) | Possible 2D worldsheet reduction | Requires a reduction map; not equivalent to \(W^4\) by analogy |
| \(\kappa\) | Curvature scalar or magnitude | Must specify coreline curvature, boundary extrinsic curvature, worldtube curvature, or ambient curvature |
| \(\theta_4\) | Direct-named vacuum/matter discriminator | Not automatically the Blockwave compact phase \(\theta\) |
| \(w,t,\lambda\) | Spatial coordinate, proper time, and curve parameter | No complete coordinate/units map among them |
| \(I_\Sigma\) | Proposed time-bulk/matter interaction map | Undefined |
| \(R_\Sigma\) | Direct-named readout/measurement map | Domain, codomain, and relation to \(I_\Sigma\) remain undefined |

## 4. Mapping diagram

```text
M^4  (carrier / history; metric and causal structure unresolved)
|
+-- gamma^1  (single coreline)
|     |
|     +-- gamma^1 intersect Sigma^3
|             -> 0D event/particle in the early transverse-slice picture
|
+-- W^4  (proposed finite-core support around gamma^1)
      |
      +-- boundary(W^4) = partial W^3
      |
      +-- W^4 intersect Sigma^3
      |       -> 3D section, if transverse
      |
      +-- partial W^3 intersect Sigma^3
              -> 2D boundary trace, if transverse

B^2 = optional worldsheet reduction, not identified with W^4.
C_hollow = larger hollow superhelix, not a second core.
  r1 = first-order coil radius/diameter bound (~0.7 fm), not filament thickness.
  a_core = tentative Kerr-scale finite-core size, distinct from r1.
I_Sigma = time-bulk/matter interaction map, undefined.
R_Sigma = history-to-observable readout map, separately undefined.
```

This resolves an apparent dimensional contradiction without inventing a physical law: the early point-particle picture intersects the slice with the **coreline**; the later 3D section intersects the slice with the **4D support**. The boundary trace is a third object. The source still has not chosen which of these constitutes the “mouth.”

## 5. Original propositions versus assistant translations

| Nathan Direct / historical source | Historical assistant translation | Fidelity assessment |
|---|---|---|
| One core; no second-order core; larger coil hollow | Earlier two-line diagrams and later graph-lift curves | A graph-lift coordinate is not a second physical core, but the distinction must be stated |
| Flexibility and tension are requested model quantities | `WorldtubeInertiaCoordinate` comment says Nathan rejects an independent elastic modulus or spring constant | Source-attribution error; direct message `5a929...` rejects the assistant's categorical denial, while `44e9...` asks for flexibility/tension values |
| Worldtube curvature is identified with inertia | \(a=c^2\kappa\), followed by \(F=mc^2\kappa\) | The equation is an assistant-selected premise plus algebraic substitution; the direct source does not define which curvature \(\kappa\) is meant |
| 3D rotation and 3D acceleration are related to 4D curvature | Euclidean curvature of a graph lift \(X(w)=(x(w),w)\) | A candidate curve identity, not a proof of the direct physical claim |
| Time surface is a 3D bulk interacting with matter | Passive level-set or readout-only surface | Incomplete translation; interaction and observation must be separate maps |
| Later Klein Fabric model retires reciprocal filament/timesheet descriptions | Earlier reciprocal deformation grammar retained as if current | Historical supersession not propagated into all older assistant equations |
| \(cw=t\), \(++++\) appears in a later direct message | Earlier \(w=ct\), Lorentzian \(R^{3,1}\) reused without qualification | Distinct source conventions; no silent correction |
| 2D worldsheet is a possible simplification; pants is a special split | Worldsheet used as the default tube representation | Overgeneralization; a reduction map and conditions are missing |
| 0.7 fm is a first-order coil radius/diameter bound, not filament thickness; stiffness sets coil size | Earlier assistant descriptions risk conflating coil scale with core thickness or excluding tension | Distinct scales and stiffness map are missing from the equations and source comments |
| \(\theta_4\) is the vacuum/matter discriminator | Blockwave compact \(\theta\) with a \(Z_3\) potential | No identification map between the two fields |

## 6. Equation custody: verbatim historical forms

### SAT-O1

The located SAT-O1 file gives:

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right)
\]

\[
S[\gamma]=\int d\lambda\left[
\frac12m\,\dot\gamma^\mu\dot\gamma_\mu
-
V_{\mathrm{tension}}(\gamma)
\right].
\]

This is a one-parameter curve and action. It does not itself construct the 4D support or identify the first-order coil radius with the finite-core size. The amplitude/frequency/phase parameters are not mapped to the approximately 0.7 fm coil-radius bound or to filament stiffness. To reproduce the 2024 constant-radius circular helix, additional constraints on amplitudes, frequencies, and phase offsets would be needed; SAT-O1 does not state them. No such constraints are added here.

### Blockwave current copy

The located assistant-voiced `🧱BLOCKWAVE.txt` copy gives:

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0
\]

\[
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),
\qquad
A_\mu(\theta)=\alpha_\star\nabla_\mu\theta.
\]

The copy's Git blob is `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, first extant repository commit 2026-10-08. The underlying 2025-09-16 attachment event is recorded, but its original attachment digest remains withheld and content authorship is unresolved. These equations are not attributed to Nathan Direct.

### Separate Blockwave extension

The separately located `BLOCKWAVE EXTENSION .txt` artifact, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, includes the Lorentzian \((-+++)\) convention and:

\[
u^\mu u_\mu+1=0,\qquad
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,\qquad
\Phi=u^\mu\nabla_\mu\theta,
\qquad
V(\theta)=-\mu^2\cos(3\theta).
\]

Its core Lagrangian is written as:

\[
\mathcal L_{\mathrm{core}}=
\frac12\nabla_\mu\theta\nabla^\mu\theta
-\mu^2\cos(3\theta)
+\lambda\Phi^2
+\alpha P^{\mu\rho}P^{\nu\sigma}
\nabla_\mu u_\nu\nabla_\rho u_\sigma
+\beta f(\theta)\nabla_\mu u^\mu
+\xi(u^\mu u_\mu+1).
\]

This file's first extant Git commit is 2026-10-08; composition date and authorship are not independently established. It is a separate field-theory layer, not the same artifact as the \(J^{\mu\nu}\) current copy.

No SAT-O1 or Blockwave equation has been silently corrected. The later direct \(++++\) notation is not retroactively substituted into the Lorentzian Blockwave source. Blockwave \(\theta\) is not identified with \(\theta_4\).

## 7. Lean and formalization status

Existing work was reused. No new module or PR was created.

**PR #873** contains:

- `KestrelIntersectionDimensionGate`: the finite-dimensional tangent-space dimension formula under the transversality condition \(U\vee V=\top\), with curve/hypersurface, worldsheet/hypersurface, full-support/hypersurface, and hypersurface/hypersurface cases.
- `WorldtubeInertiaCoordinate`: conditional algebraic substitution from \(F=ma\) and \(a=c^2\kappa\) to \(F=mc^2\kappa\). It does not prove \(a=c^2\kappa\).
- `WorldtubeCurveCurvatureLift`: a Euclidean graph-lift curvature identity for \(X(w)=(x(w),w)\). It does not establish physical worldtube curvature or an inertia law.

PR #873 head: `94b6d96c` (full commit retained on the PR). Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878) succeeded and its workflow step **Assert exact PR-head checkout** passed. Later same-head run records #44483178851 and #45357400510 failed; no job payload was returned for those runs, so no failure cause is assigned here. PR #873 remains open, draft, and unmerged. No independent formal review is claimed.

PR #1245 adds a duplicate curvature-lift specialization and has a merge-ref build, not an independently established exact-head success. PR #1082 is the narrower affine line/hyperplane intersection surrogate. Neither supplies the missing physical maps.

The Lean result checks only the formalized finite-dimensional identity and conditional algebra. It does not prove that the chosen subspaces represent Nathan's physical objects, that the translation is sound, or that any physical premise is true.

## 8. Candidate typed construction, explicitly not a correction

If a smooth embedded core \(\gamma:I\hookrightarrow M^4\) and a metric/connection are chosen, its normal bundle has rank three. A standard tubular-neighborhood candidate is:

\[
F=\exp^\perp:D_\epsilon(N\gamma)\longrightarrow M^4,
\qquad
W_\epsilon=F(D_\epsilon(N\gamma)),
\qquad
\partial W_\epsilon=F(S_\epsilon(N\gamma)).
\]

This is an assistant-proposed typing scaffold, not a Nathan equation or accepted physical model. Because Nathan Direct also describes the larger coil as hollow, the filled disk-bundle neighborhood may be only an envelope; a shell or boundary-supported physical object remains possible.

For a transverse 3D hypersurface \(\Sigma^3\subset M^4\):

\[
\dim(\gamma\cap\Sigma)=0,\qquad
\dim(W_\epsilon\cap\Sigma)=3,\qquad
\dim(\partial W_\epsilon\cap\Sigma)=2.
\]

The existing PR #873 dimension gate formalizes this conditional arithmetic. It does not choose the physical mouth. The candidates \(W_\epsilon\cap\Sigma\), \(\partial W_\epsilon\cap\Sigma\), and a separate throat/bridge remain distinct.

A 2D reduction \(q:W^4\to B^2\) would require explicit projection, fiber, and composition conditions. The “pants” construction is a special split/merge topology, not a general tube identity.

Finally, the interaction map \(I_\Sigma\) and the observation map \(R_\Sigma\) must remain separate. The direct source describes the time bulk as interacting with matter; a passive readout alone does not encode that claim.

## 9. Discrepancy ledger

1. **Core/support:** \(\gamma^1\) and \(W^4\) are different types. The SAT-O1 curve is not the finite-core support.
2. **Single core:** the larger hollow coil is not a second core. Graph-lift coordinates are mathematical embeddings, not additional physical filaments.
3. **Boundary/mouth:** the 3D boundary, 3D support section, 2D boundary trace, and possible 2D throat are not interchangeable.
4. **Tension:** the PR #873 source comment misattributes a rejection of tension to Nathan. Direct messages instead ask for flexibility/tension values. The historical \(10^{44}\,\mathrm J\) statement is not an independent measurement.
5. **Curvature:** coreline curvature, Euclidean graph curvature, Lorentzian proper acceleration, support-boundary curvature, and ambient curvature are not identified.
6. **Coordinates/signature:** \(w=ct\), later \(cw=t\), Lorentzian \((-+++)\), and later \(++++\) remain separate conventions pending a typed normalization map.
7. **Time bulk:** a 3D physical bulk interacting with matter is not merely a passive projection surface.
8. **Worldsheet:** \(B^2\) is a possible reduction, not the full \(W^4\); pants is a special split.
9. **Fields:** Blockwave \(\theta\) and direct \(\theta_4\) have no established map.
10. **Evidence:** no measured system, dataset, units, uncertainties, or prediction-versus-fit separation was supplied for a physical calculation.

## 10. Next deeper cursor

1. Type the single core: spatial filament, timelike worldline, or a 1D submanifold of a 4D history. Do not decide by analogy.
2. Define separate symbols and maps for Kerr-scale finite-core size, first-order coil radius/diameter, hollow superhelix, and filament stiffness/tension. Resolve the axis-to-circumference quantity currently called ℓ.
2. Resolve \(w,t,\lambda,c,H_0\), the normalization, and the metric/signature from direct sources.
4. Define the core-to-support map and decide whether the finite-core object is a filled neighborhood, shell, or other support.
5. Define the time bulk as a geometric object and specify its matter-interaction map.
6. Define the mouth incidence separately for support section, boundary trace, and any bridge/throat.
7. Define the curvature object used in the inertia proposition, then prove or test the map to acceleration under its stated metric and parameterization.
8. Define a reduction map if the 2D worldsheet representation is retained.
8. Define the map between \(\theta_4\), Blockwave \(\theta\), and tube morphology, or keep them distinct.

## 11. Scope and limits

- No CODATA scoring.
- No physical calculation, fit, prediction, or data-free physical fixture.
- No independent measurement claimed.
- No corrected SAT-O1 or Blockwave equation issued.
- No new Lean module, PR, dependency, fork, tool, or expenditure.
- No paper gate advanced.
- No BEDROCK theory promotion.
- This is a source-fidelity delta, not a claim that the proposed geometry is physically correct.
