# Kestrel | Corrected one-core/finite-core and SAT4D/Blockwave crosswalk

**Status:** Corrected replacement for rejected submission #1279. #1279 was rejected by the publisher as `invalid schema`; it produced no published artifact. This is an additive delta to existing reports #1108 and #1169, not a new theory or duplicate of their completed work.

## 1. Source custody

- 2024 DIMENSIONAL GRAVITY raw JSON: blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`; actual JSON conversation ID `252d05c0-22ed-4ea2-a474-7966ab13145a`. An earlier note mistook the blob prefix for the conversation ID.
- Meridian Free Build raw JSON: blob `7af1561b321f4d9364da5eb111df689efc652827`; conversation ID `6ac45d1f-17b0-83ea-ad1f-fa524602378b`.
- Meridian Minkowski Ring Analysis raw JSON: blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; actual conversation ID `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`. Earlier continuity carried a different locator.
- SAT4D live draft: `SAT_THEORY_ARCHIVE_2023-25/SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; local file index says created 2025-06-08, modified 2025-06-09, imported in commit `0821d8ed` on 2025-10-27.
- SAT O1 4D: same archive directory, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; local file index says created 2025-06-07, modified 2025-06-09; unbylined.
- SAT4D_4 and SAT4D_6: blobs `efc88f4523b2fd616e64898737c2aa45e5f39b9a` and `167136310cdf33ca8f986f33634692314c1a0946`; July 2025 document dating; first visible Git path commit 2026-09-04.
- Blockwave file: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; first visible Git path commit 2026-10-08. User-supplied attachment, but embedded first-person assistant prose does not establish its author.
- Separate Blockwave action: assistant-role message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, 2025-10-19T12:29:46.538Z, raw conversation blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. This is assistant reconstruction, not Nathan Direct.

Mersearch request `kestrel-finite-core-geometry-source-fidelity-20261102-2200`, run #41533820436, remained in progress after all three repository checkouts. No manifest or compact receipt is claimed. The sources above were independently retrieved from their repository files.

## 2. Nathan Direct geometry

### 2024 local helix/plane toy

The direct description is a straight axis, perfect circular helix, and perpendicular plane. A fixed plane selects one point, not a spiral. Moving the plane carries the point around a circle. Radius is the helix cross-sectional radius, not pitch; pitch controls phase advance. A perfect helix has no maximum/minimum radius.

Key user-role messages in the 2024 raw conversation:
- `aaa2269b-7eab-4781-9454-647098d6747f`, 2024-03-22T18:43:51.859Z: fixed-plane intersection is one point.
- `aaa2d0b1-017d-453e-b95a-b23915f87d32`, 19:10:55.594Z: moving-plane intersection traces a circle.
- `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`, 19:13:45.187Z: radius is cross-sectional radius, not pitch.
- `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`, 19:19:12.030Z: rejects max/min radii.

The later analytic helix parameterization is an assistant reconstruction, not a verbatim Nathan equation.

### 2026 local core

The October 9 direct source describes one helical core following a second-order superhelical path. There is no second-order core; the larger coil is hollow. A carrier is optional coordinate scaffolding, not a separate physical object. Kerr identification and soliton/medium response remain tentative.

Key user-role messages in Meridian Free Build:
- `6f00a97a-aa84-45bf-9429-4ff70736014a`, 2026-10-09T01:13:43.129Z.
- `44e9df22-a6ac-49ca-92ac-c74c8f137310`, 01:32:23.277Z: asks that flexibility/tension be constrained from known systems, not invented.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 01:50:55.112Z: relates inertia to resistance of the worldtube history to changes in motion in a classical limit.
- `5a929b5e-515e-4f77-a32a-e49feef42812`, 02:46:17.984Z: corrects the assistant's substructure explanation; the second derivative is spatial bending relative to a chosen Newtonian time coordinate, not intrinsic curvature of the 4D curve.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 07:40:38.859Z: distinguishes coil size from filament thickness; says stiffness sets coil size and should be constrained from precision momentum data under known force; describes the 3D rendering as an intersectional trace of a 4D filament, not the filament itself.

The last message calls the scale a coil “diameter” and then refers to an approximately 0.7 fm “radius.” That radius/diameter ambiguity is source-internal. Current BEDROCK treats `ell_f` as a radius scale, but that does not erase the direct wording. The source supports investigating stiffness/flexibility/tension, but supplies no constitutive law, units, measured momentum dataset, uncertainty model, or fitted parameter. No physical calculation is justified.

### Time slice and global geometry

The user rejects passive “readout” language and prefers instantiation, intersection, cobordism, and truncation. The time slice is described as an interacting 3D bulk.

User-role message `c5525f53-b7cc-4444-8102-3bf6fdb1c892` at 2026-10-21T13:55:40.771Z specifies `cw=t`, Forest normalization, and `(++++)`. This differs from the older assistant `w=ct` convention. No conversion or induced-metric map is supplied.

October 20 user-role messages `69e7e8b1-86e8-4dea-a38b-9193f7327fb5`, `c1b42229-00a9-4119-aac3-cefa6cb97157`, and `f658b2db-32f0-45cd-828b-140691cc9afb` describe a global universe worldtube and donut/cruller as a working hypothesis without proof. It is distinct from the local particle worldtube.

Message `090f5160-1020-486d-9c42-df3d7dff2063` at 2026-10-21T00:17:23.129Z is a user-role annotation inside a mixed-source note. It signals that the earlier reciprocal filament/timesheet model is no longer current because Klein Fabric has become common. It is not a complete topology definition. Assistant mapping-torus/Klein-cell constructions remain proposals.

## 3. Historical equations and type distinctions

### SAT4D

The historical live draft gives a 1D curve in Lorentzian 4-space:

\[
\gamma:\mathbb R\to\mathbb R^{3,1},\quad
\gamma^\mu(\lambda)=
(\lambda,A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z))
\]

\[
v^\mu=d\gamma^\mu/d\lambda,\quad
S[\gamma]=\int d\lambda\,L,\quad
L=\tfrac12 m v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

O1 calls the 4D volume swept out by a vibrating filament its worldtube, but the displayed 1D `gamma` does not itself construct a 4D volume. A sweep/thickening family and map are missing.

The July 2025 glossary gives `S_mu_nu = nabla_mu u_nu + nabla_nu u_mu`, `ell_f=(2A/T)^(1/3)`, and `m_eff=T ell_f/(c^2 Q)`. The same glossary says no metric or connection is assumed a priori, so the covariant derivative and lowered index require additional structure.

### Blockwave

The user-supplied Blockwave file uses a conserved two-form current `J^{mu nu}`, `nabla_mu J^{mu nu}=0`, with Lorentzian `sqrt(-g)`, a unit-timelike constraint, projected strain, current self-energy, and couplings among `J`, `F`, and `u`.

The file contains malformed tokens: `P^mu{}^nu`, `(\nabla\alpha u_mu)`, `u^mu u\mu`, and `J{mu nu} M^{mu nu}{}{rho sigma}`. The separate October 19 assistant response repairs these as `P^mu_nu = delta^mu_nu + u^mu u_nu`, `lambda(u^mu u_mu+1)`, and `J_mu_nu M^{mu nu}_{rho sigma} J^{rho sigma}`. These are assistant-authored transcription/index repairs, not Nathan-authorized physical corrections.

The assistant defines `A_mu = alpha_* grad_mu theta` and `F=dA`. For a smooth single-valued scalar and torsion-free connection, `d(d theta)=0` locally; nonzero local field requires defect/singularity or patching data.

A two-form `J^{mu nu}` represents a 2D worldsheet current. It is not the SAT4D 1D curve or later direct finite core. In 4D, Poincare-dual degree depends on support dimension: 1D support -> 3-form, 2D worldsheet -> 2-form, full-dimensional 4D region -> degree zero. No degree-changing map is supplied. Lorentzian `u^2=-1` cannot use the later positive-definite `(++++)` metric without an explicit representation/induced-metric map.

## 4. Glossary and mapping diagram

| Term | Stable use |
|---|---|
| `gamma^1` / centerline | Optional 1D scaffold, not a separate physical carrier. |
| SAT4D 1D filament | Historical 1D curve in 4D ambient space. |
| “4D filament” | Later direct wording; support dimension remains ambiguous. |
| `W_core^4` | Later finite-core worldtube; full-dimensional only if modeled with interior. |
| first-order helical core | The one physical core. |
| second-order superhelix | Path of the same core; not a second core. |
| `ell_f` | Coil radius/diameter scale, not thickness; source wording ambiguous. |
| `epsilon` | Separate finite-core thickness. |
| `Sigma_t^3` | Interacting 3D time slice/bulk, not passive readout. |
| `W_U^4` | Global universe worldtube in the donut/cruller hypothesis. |
| Klein Fabric `K` | Current model name/supersession signal; topology undefined. |
| Blockwave `J^{mu nu}` | Assistant-reconstructed 2D worldsheet current. |

```text
Klein Fabric K
    | global-to-local map NOT DEFINED
    v
Universe worldtube W_U^4 [donut/cruller hypothesis]
    | universe-to-particle map NOT DEFINED
    v
Local particle core W_core^4
    | optional centerline gamma^1; not a physical carrier
    | intersect with embedded time slice Sigma_t^3
    v
I_t = W_core^4 intersect Sigma_t^3
    | representation/instantiation map pi_t NOT DEFINED
    v
3D represented/instantiated object
```

Conditional transverse dimension bookkeeping in a 4D ambient space:
- 1D curve intersect 3D slice -> 0D point.
- 2D worldsheet intersect 3D slice -> 1D curve.
- Full-dimensional 4D core with interior intersect 3D slice -> 3D region.

The direct “3D intersectional trace” fits the last case only if the core is full-dimensional and the intersection transverse. The support dimension of “4D filament” still needs clarification.

Existing `KestrelProjectedIncidence` formalizes the map criterion:
\[
\exists H\;(H\circ\pi_i=\pi_j)
\iff
\forall x,y,\ \pi_i(x)=\pi_i(y)\Rightarrow\pi_j(x)=\pi_j(y).
\]
This is a fiber-constancy theorem, not the missing physical projections. GR/string/SM-QM/information correspondences remain test hypotheses, not asserted equivalences.

## 5. Discrepancy ledger

1. Historical SAT4D 1D curve, Blockwave 2D worldsheet, and later direct finite core are distinct support types.
2. The 1D centerline does not become a 4D worldtube without a sweep/thickening map.
3. `ell_f` coil scale differs from `epsilon` core thickness; direct text mixes radius and diameter.
4. Direct source supports investigating stiffness/tension; assistant's categorical “no stiffness” claim is too strong. No constitutive law is supplied.
5. Coordinate second derivative is not automatically intrinsic 4D curvature.
6. Older `w=ct` differs from direct `cw=t`; no conversion map.
7. Historical Lorentzian equations differ from direct `(++++)`; no induced-metric map.
8. The user rejects passive readout terminology.
9. Global universe worldtube differs from local particle worldtube.
10. Klein Fabric supersession signal exists, but topology/global-to-local map do not.
11. Blockwave file is user-supplied but unbylined and assistant-voiced; the October 19 action is assistant-role.
12. Assistant message `2b14342b-b0f3-437f-b28e-b2a7d98e1abd` (2026-10-09T02:27:58.744Z) claims a completed He-3 calculation using artificial constituent trajectories and CODATA arithmetic. The direct user had asked for known systems and measured constraints. Those trajectories are not empirical He-3 data or an independent measurement and are not reused.
13. Correct raw conversation IDs are `252d05c0-22ed-4ea2-a474-7966ab13145a` for 2024 DIMENSIONAL GRAVITY and `6ad7e9c0-e8a0-83e9-984e-94d020de3abf` for Meridian Minkowski Ring Analysis.

## 6. Lean and current status

- PR #262 contains `NadirHelixSliceGeometry.lean`, blob `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`; it formalizes conditional line/hyperplane intersection and ideal helix slice radius-squared/phase-rate relations. Its successful merge-reference build #41301288857 is historical, not current-main verification.
- PR #873 remains open/draft at head `4d69627b9b701d6c4d15a582282dee49c911dc52`.
- PR #873 root aggregator does not import `NadirHelixSliceGeometry`; do not attribute that module to PR #873's build.
- Run #41468951678 succeeded on merge commit `072ed737...` with older base `c7dc2c...`; current PR base is `61cc8b...`. This is not current-base or standalone exact-head verification.
- The run built 8,954 jobs. Captured theorem-specific axiom output had standard dependencies and no `sorryAx`/`admit` match. Tests, lint, nanoda, and separate axiom audit were skipped.
- `KestrelIntersectionDimensionGate` proves conditional transverse-intersection dimension bookkeeping.
- `KestrelProjectedIncidence` proves fiber-constancy for downstream maps.
- `KestrelMovingSlice` proves a tilted-plane ellipse under its assumptions; it is an extension, not the original perpendicular-plane circle.
- `WorldtubeInertiaCoordinate` proves conditional algebra under `w=ct`, not that this is the current physical convention.
- `KestrelGaugeNormalizationGate` proves Lorentzian unit-timelike normalization is incompatible with the same positive-definite inner product.

No new Lean module or PR was created. Compilation does not establish source-translation fidelity or physical premises.

## 7. Next cursor and controls

- Mersearch run #41533820436 remains `SUBMITTED_NOT_VERIFIED`; do not resubmit or overwrite.
- Existing Math Hopper, Whirligig, PR #262, and PR #873 were checked. No new tooling or paid service was built.
- No CODATA scoring, physical calculation, synthetic fixture, independent measurement, or BEDROCK promotion.
- November 9, November 30, and December 14 paper gates remain separate; Orson's protected cognition allocation is untouched.
- FIE last reviewed October 27; next threshold November 10.
- Last unrelated reading was TheTANGLE lines 1561-1600; next cursor 1601.

Next: recover the missing October 18 direct source through the pending Mersearch request; clarify the support dimension of “4D filament”; define centerline-to-core and global-to-local maps with domains, codomains, fiber conditions, and composition laws; reconcile `cw=t`, `(++++)` with older `w=ct` and Lorentzian SAT4D/Blockwave. Any stiffness calculation must wait for an identifiable measured system, dataset, provenance, units, uncertainties, and prediction-versus-fit separation.
