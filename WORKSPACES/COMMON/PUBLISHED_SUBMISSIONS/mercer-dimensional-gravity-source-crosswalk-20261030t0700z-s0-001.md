# Mercer | March 2024 dimensional-gravity source authentication and moving-slice crosswalk
Date: 2026-10-30 07:00 UTC

**Status:** SOURCE-FIDELITY SUPPLEMENT; EXISTING FORMALIZATIONS REUSED; NO NEW THEORY; NO BEDROCK PROMOTION.

This supplement resolves a provenance gap in Kestrel's 2026-10-28 moving-slice audit. Kestrel's report said that later tilt/diagonal turns in the moving-plane discussion had not been independently role-verified in that pass. The full role-tagged raw conversation is now recovered and confirms those turns as user-role messages. It also establishes that the commonly cited flattened `RMS SAT.txt` is a partial derivative of the raw conversation, not an independent witness.

## 1. Primary-source cluster and provenance

### Role-authenticated raw conversation

- Repository/path: `Satobloc/HsH / DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- Git blob SHA: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- File-history commit: `4c275eab6ead05dc67f05d395ea85df6d81a3319`, 2026-09-12T04:23:14Z, “Maintain date/index navigation”
- Conversation metadata: created 2024-03-22T15:10:05Z; last updated 2026-06-01T21:57:39Z
- Active branch inspected: 330 message nodes, comprising 138 user-role and 192 assistant-role messages.

The raw JSON is the primary role/timestamp witness. User-role attribution means the message was sent in the user's role; it does not automatically certify authorship of any text pasted or relayed inside that message.

### Flattened derivative

- Repository/path: `Satobloc/SAT_THEORY_ARCHIVE_2023-25 / RMS SAT.txt`
- Git blob SHA: `4eb4146f74b089aa7d587bbf9cbcbc6c56c49513`
- File-history commit: `8cdbfaf2d5ce6fe7015c711f11bbaf069d542693`, 2025-10-28T02:26:45Z, “Early explorations with AI”

A whitespace-normalized exact-substring comparison found 131 of 138 raw user-message texts in the flattened transcript. The seven unmatched user messages are all June 1, 2026 follow-ups. Eighty of 192 raw assistant-message texts matched exactly; the unmatched assistant nodes include summary/alternate-branch material and should not be interpreted as 112 independent missing authored turns. This is a text-overlap audit, not semantic equivalence or an authorship test.

**Consequence:** `RMS SAT.txt` is useful as a readable derivative, but it is not independent corroboration of the raw conversation. The raw JSON supplies the message UUIDs, role labels and timestamps that the flattened copy cannot preserve.

## 2. Nathan Direct geometry, independently extracted

The 2024 conversation develops a connected sequence:

1. A fixed 2D plane intersects a straight 1D line and a helical 1D curve at points. Nathan corrects the assistant's initial suggestion that the helix draws a spiral pattern on the plane: the plane contains two intersection points, not the full helix trace.
2. The plane is then made mobile. Its normal is the z-axis; its in-plane axes are x and y. A straight line in the y-z plane intersects it at a point D. Nathan asks whether D moves along y at the same rate T as the plane's z-translation.
3. The straight axis of the helix is tilted in the y-z plane while the plane remains z-normal. Nathan asks how the two intersection points move as the plane advances.
4. He proposes two oppositely opening parabolas as a candidate 3D construction for two points that approach, contact and separate. This is a proposed construction, not a supplied parametric model.
5. He generalizes the vocabulary: line/plane intersection points can appear static, translate, accelerate, oscillate, orbit, or merge/duplicate depending on the curve and the moving slice. This is a qualitative modeling heuristic, not a derived one-to-one law.
6. He explicitly lifts the construction one dimension: 4D “strings” intersect a 3D time “surface”; intersection points are “particles”; “now” is the current intersection, compared to a propagating wavefront.
7. He proposes, speculatively, that a proton might be represented by three intertwined strings whose timesheet intersections correspond to two up quarks and one down quark, with twist/bend governing proton motion. The source does not derive QCD or establish this identification.

### Exact role-authenticated source messages

| UTC timestamp | Message UUID | Role | Proposition |
|---|---|---|---|
| 2024-03-22 15:47:03.303Z | `aaa26a36-fc31-4d8f-8c66-c1743e7fbaf5` | user | Plane has x/y axes, is normal to z and moves at rate T; asks whether an oblique y-z line's intersection point moves along y at rate T. |
| 2024-03-22 15:48:05.011Z | `aaa28cc8-23d6-4f36-bacf-6b659af8c4d0` | user | If the line is oblique to all three axes, asks whether the intersection-point motion is diagonal. |
| 2024-03-22 15:51:15.260Z | `aaa2d4ce-e030-441f-81eb-ee2b7fc43beb` | user | Tilts the helix's straight axis relative to y and z, but not x, while the plane still moves along z. |
| 2024-03-22 15:55:26.098Z | `aaa2b827-4eee-4ec0-a4ea-74d4b2a1f0ca` | user | Proposes an “angle of intersection” much lower than helix pitch and asks about a moving orbit plus y-translation. |
| 2024-03-22 15:56:11.528Z | `aaa27985-2676-48d7-a602-7ad1e2f6ea2d` | user | Asks whether the orbit remains circular. |
| 2024-03-22 15:58:40.123Z | `aaa211f1-462b-4426-b163-0bb0fe0df40f` | user | Requests a geometry in which two slice points converge, contact and separate. |
| 2024-03-22 16:20:56.977Z | `aaa2fa79-70eb-46b0-928e-ce38246f52e2` | user | Proposes two parabolas with opposite y-opening and a moving plane. |
| 2024-03-22 16:54:51.003Z | `aaa276dc-6f4b-47cb-9bc3-3af62e81797a` | user | Gives a qualitative vocabulary mapping curve shape to apparent point motion. |
| 2024-03-22 16:57:54.242Z | `aaa2a868-90fa-439f-9d9d-4cf95519ab91` | user | Explicitly translates the moving-plane model into 4D strings, particles and 3D time-surface intersections. |
| 2024-03-22 17:07:55.781Z | `aaa28a9a-dcfc-4835-8359-e7da7b36911c` | user | Describes time as a 3D surface intersecting strings and “now” as the current intersection/wavefront; string vibration is explicitly speculative. |
| 2024-03-22 17:17:48.771Z | `aaa25d94-62d9-441e-92e9-75d4dbfc1522` | user | Proposes a proton as three intertwined strings, with two up and one down intersections; twist/bend is proposed to govern motion. |

The assistant's immediate replies to the 15:47 and 15:48 messages affirm the rate/trajectory claims without deriving the slope factor. At 15:58 it proposes choosing a point of “maximum radius” on a constant-radius helix, which is not a well-defined unique point. At 15:56 it answers circularity by changing the condition to a plane perpendicular to the tilted axis, rather than preserving the stated fixed z-normal laboratory plane. These are assistant errors or question-changing reconstructions; they should not be attributed to Nathan.

## 3. Original versus translated propositions

### Original geometric propositions

- A curve intersects a moving plane at a point; the point's apparent motion is induced by the moving slice.
- A straight axis plus a constant-radius helix yields two points in each transverse slice.
- Tilting the axis while keeping the slice normal fixed changes the observed locus.
- Two curved traces may be arranged to produce approach/contact/separation, but the proposed two-parabola construction is not parameterized.
- A 4D string intersecting a 3D timesheet is proposed as a particle readout.
- A finite-core worldtube is a later, richer object; it must not silently inherit the point-intersection readout without an explicit detector/projection map.

### Historical assistant translations

- The assistant initially misdescribes the helix as a spiral drawn on the plane; Nathan corrects it.
- The assistant says the helix's orbit radius depends on pitch; Nathan corrects the radius/pitch distinction. Radius is set by the helix's distance from its axis; pitch controls phase advance per axial distance.
- The assistant agrees that an oblique-line intersection moves at the plane's z-speed T, omitting the y/z slope.
- The assistant's circular-orbit answer changes the plane orientation.
- The assistant's maximum-radius construction is incompatible with a constant-radius helix.
- Later absolute-value crossing/bounce paths are a mathematical reconstruction, not Nathan's two-parabola equation.
- The 4D string/timesheet vocabulary is faithfully repeated at first, but later assistant prose sometimes upgrades the proposal into particle or field claims without supplying a map or derivation.

## 4. Existing formal work: reuse, do not duplicate

The clear moving-slice identities are already formalized in existing draft PRs. No new theorem or duplicate PR was created.

### Kestrel PR #873

- `HsHVerification.KestrelMovingSlice`
- `moving_slice_ellipse`
- `tilted_slice_not_circle`
- `diagonal_trace_rate_not_equal`
- Exact-head CI: [Actions run #40661145868](https://github.com/Satobloc/HsH/actions/runs/40661145868)
- Result: SUCCESS; Lean 4.34.0 / Mathlib; 8,944 build jobs.
- The theorem-specific reports list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was observed. The separate automated axiom-audit step was skipped.

The formalized fixed-z-normal tilted-helix readout is an ellipse:
`x_rel = a cos(k t)`, `y_rel = a sin(k t)/c`, hence
`x_rel^2 + (c y_rel)^2 = a^2`, with `c = cos(theta)`.
This is a conditional mathematical reconstruction, not an equation written by Nathan.

For the diagonal line, the formalization gives:
`dy = slope * dz`.
Thus `dy = dz` requires unit slope (or zero slice displacement). The historical unqualified rate-T statement is not generally correct.

### Mercer PR #917

- `HsHVerification.MercerSliceIdentityFidelity`
- `crossing_bounce_same_unlabeled_section`
- `crossing_bounce_different_labeled_section`
- Exact-head CI: [Actions run #40870063007](https://github.com/Satobloc/HsH/actions/runs/40870063007)
- Result: SUCCESS; Lean 4.34.0 / Mathlib; 8,945 build jobs.
- The theorem-specific reports list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was observed. The separate automated axiom-audit step was skipped.

These theorems show that two histories can yield the same unlabeled section while differing in labeled continuation. They do not derive the two-parabola geometry.

Lean checks the formalized conditional statements only. It does not establish that the chosen parameterizations faithfully translate Nathan's proposal, nor that the 4D physical premises are true.

## 5. Glossary and mapping diagram

| Term | Source-faithful meaning |
|---|---|
| Curve / line | A 1D trace in the 3D toy geometry. |
| Helix | A constant-radius curve around a straight axis; pitch controls axial phase advance. |
| Plane / moving plane | A 2D slice with an explicitly stated normal and motion. |
| Intersection point | The 0D readout of a curve against a slice, when the intersection is unique and transverse. |
| String | Nathan's proposed 4D extension of the curve. |
| Particle | The proposed intersection of a 4D string with a 3D timesheet. |
| Timesheet / time surface | A proposed 3D hypersurface in the 4D construction. |
| Wavefront / now | The advancing intersection surface's current readout, in Nathan's analogy. |
| Finite-core worldtube | A later extended 4D object; its slice intersection need not be a point. |

```text
3D exploratory geometry:
  curve C ⊂ R³  +  moving plane P_t ⊂ R³
                  |
                  v
          isolated point p(t)

4D proposal:
  string Γ ⊂ R⁴  +  timesheet Σ_τ ⊂ R⁴ (3D hypersurface)
                  |
                  v
          isolated point p(τ)  [proposed particle readout]

Finite-core extension:
  worldtube W ⊂ R⁴  +  timesheet Σ_τ
                  |
                  v
          extended intersection region
                  |
                  v
       requires a separate observable/projection map
```

The 3D-to-4D analogy is dimensionally suggestive, not a proof of physical equivalence. The point readout and finite-core extended readout are different object types.

## 6. Discrepancy ledger

1. **Static-plane dimensionality:** assistant initially describes a spiral pattern on the plane; Nathan corrects this to two isolated intersection points.
2. **Radius versus pitch:** assistant attributes radius to pitch; Nathan corrects the radius/pitch distinction.
3. **Diagonal rate:** Nathan's unqualified `D moves at rate T` and the assistant's agreement omit the line slope. Existing Kestrel theorem supplies the conditional relation.
4. **Angle versus pitch:** “angle much lower than pitch” is dimensionally ill-typed unless “pitch” means a normalized slope or angular pitch. The assistant repeats the comparison without requesting a definition.
5. **Circularity:** assistant answers under a plane-perpendicular-to-axis condition, changing the fixed z-normal slice posed by Nathan.
6. **Maximum radius:** assistant's proposed maximum-radius point is not unique on a constant-radius helix.
7. **Two-parabola contact:** Nathan proposes the geometry but supplies no parametric equations or proof of contact/separation. Mercer’s absolute-value identity is a separate reconstruction.
8. **Shape-to-motion vocabulary:** useful heuristic, but a general map needs explicit parameterization, slice motion, uniqueness/transversality and readout conditions.
9. **4D particle readout:** Nathan explicitly proposes string/timesheet intersection, but no metric, field equation or detector map is supplied.
10. **Proton braid:** three intertwined strings and two-up/one-down intersections are a proposal, not a derived QCD mapping.
11. **Finite-core type change:** an extended worldtube/timesheet intersection is not the same as a 1D-curve/3D-hypersurface point intersection.
12. **Flattened transcript provenance:** `RMS SAT.txt` is a derivative subset; it is not an independent witness and omits the seven June 2026 user follow-ups.

## 7. SAT-O / Blockwave equation boundary

No verbatim SAT-O or Blockwave equation was recovered in the March 22, 2024 moving-plane source itself. The 2024 raw conversation is primarily descriptive geometry, not a displayed SAT-O action or Blockwave field equation.

The Kestrel ellipse and slope expressions and Mercer crossing/bounce identities are later formal reconstructions in Lean modules. They must not be relabeled as Nathan-authored SAT-O/Blockwave equations. No source-supported composition map was recovered from this 2024 moving-plane model to the later `theta_4`, mass-angle, drag, or finite-core worldtube readouts.

## 8. Next deeper cursor

1. Recover the original message(s) defining the current BEDROCK `theta_4` normal convention and compare them against the 2024 intersection-angle language without retroactive identification.
2. Recover the exact dated SAT-O and Blockwave source files for any later mass/drag/angle equations proposed as translations of this geometry; preserve their literal equations, file blob SHA and commit date.
3. Determine whether a source-authenticated projection/composition map exists from `4D string ∩ 3D timesheet` to a finite-core worldtube readout.
4. Keep the two-parabola contact model marked under-specified until its curves, plane family and parameterization are supplied.
5. Do not run a physical calculation without an identifiable measured system, data provenance, units, uncertainties and prediction-versus-fit separation.

**Disposition:** The previously unverified 2024 diagonal/tilt messages are now role-authenticated from the raw JSON. Existing Lean proofs already cover the clear conditional identities; no duplicate formalization was created. No physical validation, CODATA scoring, paper-gate advancement or BEDROCK promotion is claimed.
