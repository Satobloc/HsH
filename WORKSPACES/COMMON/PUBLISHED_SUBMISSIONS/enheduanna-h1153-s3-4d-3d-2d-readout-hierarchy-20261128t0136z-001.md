# Enheduanna h1153:s3 — 4D→3D→2D observation hierarchy and incidence-source gate

**Disposition:** SOURCE_CROSSREAD_COMPLETE / NESTED_READOUT_MAP_PROPOSED / EXISTING_LEAN_RESULTS_REUSED / NO_PHYSICAL_PREDICTION.

## 1. Routing, authority, and scope

- Nominal slot: 2026-11-28T01:36:00Z; `h=1153`.
- `seq=5h+3=5768`; `5768 mod 19 = 11`.
- Selected routing label: Enheduanna (index 11); next label: Tern Rook (index 12).
- Run key: `REVROT3-19-20261011:1153:s3`.

Selection is deterministic routing, not authentication of a historical Enheduanna instance or current ChatGPT thread.

The original September 23 user-role instruction in conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, says to consider all archives when examining the Enheduanna case. This is broad archive-revival guidance, not a recovered technical specialist charter. No standalone signed Enheduanna charter or authenticated current Enheduanna thread was found. This is assistant-level source-grounded work.

The current h1152 Aldus report and PR #2727 were read. This report is additive: it does not repeat the longitudinal tangent-dimension proof. It adds an explicit nested observation-plane layer and a source-authority rule for selecting the incidence branch.

## 2. Primary-source cross-read

### 2024 DIMENSIONAL GRAVITY

Raw HsH conversation:
- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`.
- Raw file: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`.
- Git blob SHA-1: `2cea1924266418e19b825b95ae51e6b7cbace7e1`.

Three direct user-role messages are relevant:

- `aaa2269b-7eab-4781-9454-647098d6747f` (2024-03-22 15:20:20Z): the construction is explicitly static and has no time dimension; each one-dimensional line intersects the two-dimensional plane at one point.
- `aaa2d0b1-017d-453e-b95a-b23915f87d32` (2024-03-22 15:29:30Z): when the plane moves perpendicular to the straight line, the helix intersection point traces a circular path in the plane; its speed depends on helix pitch and plane-motion rate.
- `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` (2024-03-22 15:35:10Z): the circular-path radius is the helix cross-sectional radius, not its pitch.

Thus the 2024 construction has a two-dimensional observation plane in a three-dimensional toy arrangement. At each fixed slice, the line/plane intersections are zero-dimensional points. The moving-slice readout is a one-dimensional circular trajectory. It is not a two-dimensional worldsheet.

### 2026 finite-core working hypothesis

Library-held raw export: `ND Workshop Relay :24 | Geometry`, direct user message `bcbe9ee8-b621-4a40-9edb-b34c17783be5` (2026-11-08).

Nathan's wording calls the 4D tube / 1D core / 3D boundary a “working hypothesis”; the possible mouth is introduced with “probably”; its relation is described as “the intersection or some boundary” of the timesheet; and the 2D worldsheet is introduced as something the worldtube “may be modelable as,” while also being described as a simplification.

This does not specify whether the core crosses the timesheet, lies within it, or is represented by a moving family of timesheets. In particular, it does not state the longitudinal premise `Γ ⊂ Σ` used by the conditional construction in Aldus PR #2727.

The 2024 moving 2D plane is not automatically the 2026 3D timesheet. Equating them requires a new embedding or projection map. The 2024 circular locus, a 2D boundary-sector bundle, a 2D observation plane, and a 2D worldsheet are distinct typed objects despite some sharing the same visual language or dimension.

## 3. New architecture improvement: explicit nested observation maps

Use the following typed objects in a four-dimensional ambient manifold `X⁴`:

- `W⁴ ⊂ X⁴`: full finite-core tube region.
- `B³ = ∂W⁴`: its three-dimensional boundary shell, when the boundary is regular.
- `Σ³_t ⊂ X⁴`: a three-dimensional timesheet/resolving hypersurface.
- `P²_t ⊂ Σ³_t`: a separately specified two-dimensional observation plane. This is an analyst-proposed bridge to the 2024 toy construction, not a Nathan Direct premise.
- `r_t`: the instrument/readout map from the admitted observation support to a declared output space `Y`.

The composition is:

\[
M^3_t := W^4 \times_{X^4} \Sigma^3_t
\]

for the full-core section, and

\[
R^2_t := B^3 \times_{X^4} \Sigma^3_t
\]

for the boundary rim, subject to the relevant embedding, clean-intersection, and boundary-regularity conditions.

If a two-dimensional observation plane is independently defined inside the timesheet, a further readout support can be formed:

\[
C^1_t := R^2_t \times_{\Sigma^3_t} P^2_t.
\]

Under transversality within `Σ³_t`, the expected dimensions are:

| Operation | Conditional dimension |
|---|---:|
| `W⁴ ∩ Σ³_t` | 3 |
| `B³ ∩ Σ³_t` | 2 |
| `R²_t ∩ P²_t` within `Σ³_t` | 1 |
| `Γ¹ ∩ P²_t` within `Σ³_t` | 0 |

The final observable is `r_t(C_t)` or the corresponding point/readout family. The standard comparator must use the same `P²_t`, calibration, instrument map, and readout. A geometric distinction is relevant only if it survives this shared projection/readout.

This yields a nested chain:

\[
W^4 \longrightarrow M^3_t \longrightarrow R^2_t
\longrightarrow C^1_t \longrightarrow Y.
\]

The 2024 toy is a distinct chain: a fixed 2D plane in a 3D arrangement produces point intersections; a moving family of such planes produces a 1D circular locus. Mapping that plane into a 2026 3D timesheet requires an explicit `P²_t ↪ Σ³_t` or a specified projection `Σ³_t → P²_t`. No such map is source-defined.

### Keep the worldsheet and normal sector separate

A proposed 2D worldsheet `S²` requires an explicit embedding `S² ↪ W⁴` or a reduction/projection `W⁴ → S²`, together with its fibers and the observable-preservation conditions. It is not automatically `P²_t`, `C¹_t`, or `R²_t`.

Likewise, Aldus's conditional normal-plane construction

\[
\eta = T\Sigma \cap \nu(\Gamma)
\]

requires longitudinal containment `Γ ⊂ Σ`. Its unit-circle bundle `S(η)` is a separate candidate two-dimensional boundary sector. Identifying it with the mouth, observation plane, or worldsheet requires another explicit map and incidence conditions.

The word “mouth” should therefore not be used as a dimensional type. It must be resolved as a full-core section `M³_t`, boundary rim `R²_t`, observation trace `C¹_t`, or another explicitly defined interface.

## 4. Incidence-branch selection gate

Keep three alternatives open until Nathan's source or a later explicit decision selects one:

1. **Transverse crossing:** `Γ` meets `Σ³_t` at isolated events. A transverse `B³ ∩ Σ³_t` can form a 2D boundary rim.
2. **Longitudinal containment:** `Γ ⊂ Σ³_t`. This is the additional premise required for Aldus's `η` construction.
3. **Moving family:** `Σ³_t` varies with a parameter; the history of its instantaneous sections requires a family map and a rank condition on the resulting projection.

The 2026 “possible mouth” wording does not choose among these. The 2024 moving-plane example motivates distinguishing a fixed slice from a moving family but does not establish which 2026 branch is intended.

Admission rule: every branch must carry (a) source locator and epistemic status, (b) explicit domain/codomain and incidence map, (c) dimension/regularity conditions, (d) projection/readout map, and (e) an independent failure condition. An unselected branch remains conditional; it must not be promoted to the default H(s)H geometry.

## 5. Existing Lean verification reused

No new Lean module or PR was created. The relevant mathematical results already exist:

- Kestrel PR #873, exact head `94b6d96c91806a95505260a3c52220f4af294185`; Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), `verify` job SUCCESS. Its generic `transverse_intersection_finrank` theorem supplies the conditional linear-algebra dimension counts when the relevant subspaces span the ambient space. The theorem-specific axiom reports include `propext`, `Classical.choice`, and `Quot.sound`; the retrieved build report found no `sorryAx`. This is not a global axiom audit or manifold-embedding proof.
- Aldus PR #2727, exact head `3b9fe0e4170d8304232ff113ecdf250e2a20da93`; Actions run [#46089408891](https://github.com/Satobloc/HsH/actions/runs/46089408891), `verify` job SUCCESS. `contained_core_selects_two_dimensional_normal_plane` proves the pointwise conditional result under `L ≤ U` and `L ⊔ W = ⊤`. Its axiom report includes `propext`, `Classical.choice`, and `Quot.sound`.

The Aldus theorem does not prove `L ≤ U`, global smooth-bundle existence, a tubular embedding, a source-selected incidence mode, or any physical response law. The new nested composition maps and `P²_t` are proposals and are not Lean-formalized. Lean verifies only the stated finite-dimensional conditional mathematics.

## 6. Physical and campaign boundary

No measured physical system, dataset, calibration, units, uncertainty model, holdout, numerical prediction, fit, or falsification threshold was admitted. No physical calculation was performed. The 2024 toy geometry is not treated as physical evidence for the 2026 finite-core model.

No SAT-O or Blockwave equation was retrieved or modified. No manuscript gate or BEDROCK theory status was advanced.

Current campaign gates remain separate: P1 November 9 overdue/frozen/Orson-owned; P2 November 30 HOLD; P3 December 14 incomplete. P0 presentation safety remains FAIL; Paper A/B live routes NOT_OBSERVED; deployment NOT_VERIFIED; release NOT_AUTHORIZED.

All four Mersearch lanes remain occupied/requested. No request was overwritten, released, or retriggered. No private HSH_RESOURCES payload was opened.

## 7. Freshness and lateral reading

A bounded unrelated-source reading was completed in the SAT archive:
- File: `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`.
- Git blob: `f33eb29fbac65efa1db054239bb9c28a04a13a42`.
- Actual extent: lines 1801–1840.
- The fragment is a historical language-guessing chat, not an authoritative linguistic source. Its assistant response includes an unverified Assamese/Kannada classification claim; no language claim is imported into the geometry work.
- Return cursor: line 1841.
- No physical stand/stretch/walk is claimed by this runtime.

FIE was last fully reviewed November 24; the next scheduled rereview is December 8. No premature rereview was performed.

## 8. Return cursor

The next geometry decision is not another dimension calculation. It is source-authorized selection of the intended incidence mode, followed by an explicit `P²_t ↪ Σ³_t` or projection map and a defined readout operator. Until then, keep the transverse, longitudinal, and moving-family branches separate and label the nested observation plane as an analyst proposal.
