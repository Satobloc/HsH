# Amendment 03 — final scheduler outcome and source-provenance reconciliation

Applies to: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T1800Z_s0_enheduanna.md`  
Run key: `REVROT3-19-20261011:690:s0`  
Status: **ADDITIVE RECONCILIATION ONLY**. No new research issue, canonical receipt, PR, branch, or successor handoff is created.

## 1. Final scheduler observation

A fresh Automations readback after the earlier snapshots recorded:

- Task ID: `6aa1fe0de5e48191b886496095b1343f`; enabled.
- Exact schedule unchanged: `DTSTART;TZID=America/New_York:20261001T140000`, `RRULE:FREQ=HOURLY`; :00 phase unchanged.
- Same run ID: `e330bab6-9248-8331-8d6b-877397083b42`.
- `scheduled_for=2026-11-08T18:00:00Z`; `started_at=2026-11-08T19:00:54.505049Z`; `completed_at=2026-11-08T19:25:56.037351Z`; recorded status **FAILED**; `chat_ref=null`.
- `latest_result` has the same run ID, was created at `2026-11-08T19:25:58.584793Z`, and contains only: `There was a problem with your scheduled task.` It is explicitly marked as a failure message; delivery status is unknown.

This is a final observation of the existing h690:s0 run key, not a new slot. Preserve the earlier FAILED and IN_PROGRESS snapshots in Amendment 02; do not rebase to h691, infer an attempt-history ID, infer a backend cause, or infer thread delivery. The task remains enabled and unchanged.

## 2. Exact primary-source locators recovered

These are read-only source-locator refinements to the already published #1496 report. They are not a third research result.

### 2024 moving-plane / helix geometry

- Conversation: **DIMENSIONAL GRAVITY**, conversation ID `252d05c0-22ed-4ea2-a474-7966ab13145a`.
- HsH raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`, blob SHA-1 `2cea1924266418e19b825b95ae51e6b7cbace7e1`.
- Nathan Direct messages: `aaa28bd9-07f7-4740-b878-b485d4db44d0` (2024-03-22T15:10:05Z), `aaa2269b-7eab-4781-9454-647098d6747f` (15:20:20Z), `aaa2d0b1-017d-453e-b95a-b23915f87d32` (15:29:30Z), and `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` (15:35:10Z).
- Direct proposition: in a static 3D arrangement, the straight axis and coaxial helix intersect a plane at points S and H; when the 2D plane moves perpendicular to the axis, S stays fixed and H moves around S on a circle. Its radius is the helix cross-sectional radius and is independent of pitch. The direct text is qualitative; it does not itself state a parametric helix or the equation `omega=2 pi v/p`.
- Historical assistant messages: `5f8f77b5-3d63-4a8b-8d61-c4b03c4f70c2` initially described a spiral/helix-like sequence of intersection points, which is not the direct geometry. Later assistant messages `44bd817b-1e7d-45a2-8d41-48f9d3c7d2ac`, `2be1f285-4d18-4f36-8c93-4f4c0c6df8b7`, and `e0d27f8b-0b88-4c3f-b83d-6d2fdb5d80e3` move toward the corrected two-point/circular-orbit/radius-independent description.

### 2026 timesheet / angle-convention surface

- Conversation: **Switching to English**; raw blob SHA-1 `dfdaec331846087af7daf0008eba431520a5b9ad`. HsH path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_4/26.03.06•26.06.11•Switching to English — raw.json`; the same blob is also present at the SAT archive root as `Switching to English — raw.json`.
- Nathan Direct message `f236e23d-0266-4be8-94f7-ead029c534b6`, 2026-03-07T08:08:45Z, describes multiple time-sheet/timewave modes and measures `theta_4` relative to the sheet plane, with vacuum at 90 degrees to that plane. Assistant child `0f38b9a5-8a6a-43c1-90e4-b6c4b1f42b44` summarizes this as a “formalized mapping” to particle observables, although the direct message supplies no such equations or derivation.
- Current control is later: BEDROCK BR-005 records the 2026-09-16 Nathan Direct baseline from the **time normal**, with null/vacuum `theta_4=0`. The 2026-10-09 direct statement “90 degrees to timesheet / 0 degrees from time normal” agrees with BR-005. The March plane-reference and September normal-reference are a historical convention change; treating them as complementary requires an explicitly defined metric/observer/angle convention. Neither is `theta_BW`.

### 2026 one-core / hollow-coil / 4D-filament correction

- Conversation: **Meridian Free Build**, ID `6ac45d1f-17b0-83ea-ad1f-fa524602378b`.
- HsH raw export: `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`, blob SHA-1 `7af1561b321f4d9364da5eb111df689efc652827`.
- Nathan Direct message `6f00a97a-aa84-45bf-9429-4ff70736014a`, 2026-10-09T01:13:43Z: one helical core follows the convoluted path; no second-order core; the larger outer coil is hollow. The Kerr-core wording is provisional, and a surrounding soliton is tentative.
- Nathan Direct message `5a929b5e-515e-4f77-a32a-e49feef42812`, 2026-10-09T02:46:38Z: worldtube bending/inertia equivalence is a conceptual claim, while no elastic modulus, invented filament tension, or microscopic spring constant is supplied; it also corrects the “sheet” wording toward a 3D slice/bulk.
- Nathan Direct message `28b2378a-846d-4c3f-a242-91f9007ce261`, 2026-10-09T07:39:31Z: the approximately 0.7-fm scale is the outer-coil radius, not filament thickness; begin with the 4D filament and derive its 3D intersectional trace; no 3D self-closure is expected. Assistant child `8c6662e3-5e0b-4e40-9fb7-35db9a8b1b7c` acknowledges that its earlier 3D-toroidal construction had the direction reversed.

## 3. Geometry-fidelity and Lean boundary

The existing PR #1455 module is `FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean`, blob SHA-1 `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`. Its source comments cite the 2024 raw message IDs above.

- The module contains two separate conditional models: a 4D all-plus affine line/hyperplane intersection, and a 3D circular helix cut by a 2D plane. No map or composition law connects these models, and neither defines the later 4D filament-to-3D-bulk readout.
- The direct 2024 messages do not state the standard parametric helix or phase-rate equation. Those are formalization choices. `movingSlice_phase_rate` proves a constant finite-difference/secant-slope identity for an affine phase; the file does not state a derivative theorem using `HasDerivAt`.
- PR #1455 remains open/draft/unmerged. Actual pull-request workflow run #42390677035, job #128457402086, checked merge reference `71d9002869f1a519a3beddd106d9ef3f1ffc2dac`; Lean 4.34.0 / Mathlib, 8,945 jobs, build SUCCESS. The printed target-theorem axiom lists include `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appears in those printed target lists. Tests, lint, nanoda, and the global axiom/sorry audit were skipped; `nanoda-allow-sorry=true`. This is not a global no-sorry guarantee.
- The module itself warns that the all-plus affine toy model is not the physical SAT4D metric; the 2025 SAT4D draft uses `R^(3,1)`; no Wick rotation, signature-change, or projection map is supplied. Compilation proves only the formalized conditional statements, not translation fidelity or physical premises.

## 4. Equation custody remains unchanged

- SAT4D live draft: SAT archive `SATOBLOC/SAT4D_LIVE_DRAFT.txt`, blob SHA-1 `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, document-level June 2025 Nathan byline. Its historical O1 curve/action includes `gamma^mu(lambda)`, `v^mu=d gamma^mu/d lambda`, and `L=(1/2)m v^mu v_mu - V_tension(gamma)`.
- Standalone `SATOBLOC/SAT O1 4D.txt`, blob SHA-1 `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, is unbylined and substantively similar but not byte-identical.
- Unbylined `SAT—Blockwave Ideal Model.txt`, blob SHA-1 `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, is a separate `g,u,theta` model and contains no `J` current.
- `🧱BLOCKWAVE.txt`, blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, is a user-supplied artifact with unresolved content authorship and includes a two-form `J^{mu nu}` current. The 2025-10-19T12:29:46.538Z assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, raw blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, adds a “unified” action, master kernel, determinant condition, and quantization claims; these are assistant-originated, not Nathan Direct O1 equations.
- `BLOCKWAVE EXTENSION .txt`, blob SHA-1 `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, is another branch without the `J` current. Keep the three artifacts separate. The later direct rejection of invented tension does not supply a replacement Lagrangian; preserve `V_tension` as historical source text, not as an established current constitutive law. No corrected action is adopted here.

## 5. Continuity and next cursor

- `WORKSPACES/ENHEDUANNA/CURRENT_WORK.md` is present on current main, blob SHA-1 `3fe80fe93866a584b5100f87421c6014b41b5939`; its last path commit predates h690. Its Babbage cursor at line 1321 is older than the h690 receipt's line 1481; use the newer receipt cursor. The earlier “not found at expected path” entry records a failed retrieval, not proof that the file did not exist.
- Nadir h689:s4 packet arrived at 18:03:32Z, ten seconds after the first h690 start at 18:03:22Z. It is late optional context only, with no task or response obligation. It was read as optional context during the later re-entry.
- The existing h671 optional Tern handoff and its Amendment 01 remain the only Tern continuity packet referenced here. No new h690 handoff, cross-thread delivery, consumption, or acknowledgment is claimed.
- Babbage unrelated-reading cursor remains line 1481. FIE last full review was 2026-10-27; re-review is due 2026-11-10, not yet due.
- Next geometry cursor: recover the authoritative Klein Fabric source; type the 4D object; specify the thickening/sweep map from the 1D core to finite 4D support; specify the 3D timesheet/bulk intersection and readout; and define composition maps linking the 2024 3D helix/2D-plane example to the later 4D-filament/3D-trace description. Keep `J^{mu nu}`, `theta_BW`, and `theta_4` separate until source-defined maps exist.

## 6. Controls retained

No new issue, PR, branch, Mersearch request, Lean module, physical calculation, CODATA scoring, theory promotion, task, schedule, phase, signet, or chat rename. All four Mersearch request lanes remain occupied with status `requested`; their request-scoped manifests were not present, and no local pinned Mersearch checkout was available. The raw-source work above used already-known immutable blob locators from the existing Lean module and receipts; it is not represented as a Mersearch result. No cross-thread delivery or worker authentication is claimed.
