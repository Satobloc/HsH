# H971:s0 Amendment 01 | Moving-plane source and formalization scope

**Status:** ADDITIVE_SOURCE_FIDELITY_CORRECTION / EXISTING_LEAN_BUILD_RECONCILED / NO_NEW_ISSUE

This amendment supplements the already-published [H971:s0 proof-status artifact](../COMMON/PUBLISHED_SUBMISSIONS/nadir-h971-s0-helix-slice-exact-head-20261120t1100z-001.md) and its [publisher issue #2187](https://github.com/Satobloc/HsH/issues/2187). It does not repeat the earlier source-fidelity reports or create another publication issue.

## 1. Primary source recovered

The two-parabola proposal is present in the role-authenticated raw export:

- Conversation: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- Git blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- 466 mapping nodes; 138 user messages; 199 assistant messages.

Relevant direct user messages:

- `aaa2d58f-3738-44f9-9fcc-d4c054b23c2a`, 2024-03-22T16:08:08.428Z: asks for two points to travel toward the origin along the moving plane's y-axis, meet at the origin, then move away at a steady rate.
- `aaa2fa79-70eb-46b0-928e-ce38246f52e2`, 2024-03-22T16:20:56.977Z: proposes two parabolas, described relative to the y- and z-axes and perpendicular to x, with A opening toward +y and B toward -y; the plane begins above the x-axis and moves in a “negative direction.”

The direct source therefore gives **partial orientation and opposite-opening constraints**. It does not give exact curve equations, an unambiguous common carrier plane, the moving plane's normal, or the axis of the negative sweep. The earlier H971 wording that implied no orientation information was too strong; the correct status is *partially specified, not fully typed*.

The assistant response `5fff3c44-6847-41ad-874a-bb7233df1fa6`, 2024-03-22T16:21:03.651Z, selects a negative-y plane sweep and asserts approach/contact/separation. “Negative y” is an assistant choice; the user said only “negative direction.”

## 2. Existing Lean model and actual build

At PR #262 head `368f9af8d95d061b4581688759ed3eda309e9886`:

- `MovingPlaneTraceGeometry.lean`, blob `9a2669d3e29a9a94b33ad7a7f29ef5c3f78b2f1a`, defines `parabolaA z = z^2`, `parabolaB z = -(z^2)`, and `parabolicSeparation z = 2 z^2`.
- It proves the two curves meet at zero, the separation identity, positivity away from zero, evenness, and monotonic increase on positive z.
- The same file's moving-slice rate theorems apply to a **straight line**. The parabolic section itself has no time variable, no time-indexed plane family, and no incidence-point trajectory.
- `NadirHelixSliceGeometry.lean`, blob `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`, is a separate conditional circular-helix / Euclidean-4D slice model. It does not supply the missing parabolic sweep.

The historical exact-head Actions run `#43948452979`, job `133584241306`, checked out PR head `368f9af...` and built both modules in an 8,947-target build. The target declaration axiom reports list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appears in those target reports. Tests, lint, nanoda, leanchecker, and a global axiom audit were not run.

PR #262 remains OPEN / UNMERGED, head `368f9af...`, base `e2e738facee0890bdfbbc563e9936db174f63074`, mergeability reported true with merge state unstable. This is a historical exact-head build, not a new build in this run.

## 3. Mapping diagram

```text
Nathan Direct (2024)
  target: two slice points approach -> meet -> separate at steady rate
  geometry: two opposite-y-opening parabolas; partial y/z orientation;
            plane initially above x-axis; sweep direction only “negative”
             |
             | missing curve parameterization, plane normal/axis,
             | time law, and incidence map
             v
Assistant final response
  chooses a negative-y plane sweep and asserts the desired motion
             |
             | separate assistant reconstruction
             v
Lean parabolic submodel
  y_A(z) = z^2; y_B(z) = -z^2; Delta_y(z) = 2 z^2
  static separation function; no parabolic time/slice trajectory
```

## 4. Glossary and proposition crosswalk

| Term | Source-grounded meaning | Formalization status |
|---|---|---|
| Moving plane | A plane whose position changes; its normal and sweep axis are unresolved | Not defined for the parabolic pair |
| Slice point | Intersection of a curve with the moving plane | Not constructed for the parabolic pair |
| Parabolic pair | Two parabolas with opposite y-opening and partial y/z orientation | Assistant model chooses (y=\pm z^2) |
| Separation | Distance or signed coordinate difference between the two slice points | Static `2 z^2` function only |
| Steady rate | Directly stated target behavior | Not formalized for the parabolic pair |
| Helix slice | Separate idealized circular-helix / 4D Euclidean model | Compiled, conditional, not source-equivalent |

**Original proposition:** a moving plane should produce two intersection points that approach the origin, meet, and separate at a steady rate.

**Assistant translation A:** choose a negative-y sweep and assert the desired motion.

**Assistant translation B (Lean):** choose opposite parabolas (y=\pm z^2) and prove a static separation law in the slice coordinate z.

These are not shown equivalent. In particular, the Lean parabolic theorem does not prove the direct steady-rate condition, because the parabolic section is not connected to a time-indexed plane family. The line-rate theorems elsewhere in the file do not transfer to the parabolic functions without an explicit construction.

## 5. Discrepancy ledger

1. **Source under-description:** the direct message contains more orientation information than the earlier H971 summary acknowledged, but still lacks a uniquely specified plane family and curve parameterization.
2. **Axis substitution:** the assistant's negative-y choice is not directly stated by Nathan.
3. **Model substitution:** the Lean file chooses z as the parabola parameter/slice coordinate. That is a distinct assistant completion, not a recovered source equation.
4. **Static/dynamic gap:** `parabolicSeparation = 2 z^2` is a static relation. It does not define time, plane motion, intersection points as functions of time, or steady-rate motion.
5. **Module boundary:** the straight-line moving-slice rate theorems and the parabolic separation theorems are separate. The former do not prove the latter's desired dynamics.
6. **Proof boundary:** compilation establishes only the formalized declarations. It does not validate the source translation or any physical premise.
7. **H(s)H boundary:** the separate `NadirHelixSliceGeometry` model is not a derivation of the parabolic proposal or a full H(s)H worldtube theory.

## 6. Existing coverage and next cursor

The direct 2024 source and its assistant translation are already covered by Aster's source correction [issue #1530](https://github.com/Satobloc/HsH/issues/1530), the Mercer h900 GR/ST comparison [issue #1554](https://github.com/Satobloc/HsH/issues/1554), and the existing Nadir h800/h914/h952 lineage. Those reports are reused; no duplicate source report or issue is needed.

**Next deeper cursor:** recover a later raw Nathan Direct clarification, if one exists, of (a) the moving plane's normal and sweep axis, (b) the parameterization of both parabolas, and (c) the observable meant by “steady rate” (each point's signed y-speed or their separation rate). If no such source exists, keep those quantities unresolved. A future formalization would need explicit curve maps (C_\pm(u)), a plane family (P(\tau)), incidence maps (I_\pm(\tau)), and a rate observable. These are proposed definitions, not source equations.

## 7. Epistemic and operational status

- No new Lean module, build, physical calculation, fit, prediction, independent measurement, CODATA scoring, or theory promotion.
- No equation in SAT-O1 or Blockwave corrected. Their previously verified verbatim originals, hashes, and date/provenance records remain in the h952 source-custody receipt.
- No paper gate advanced.
- The detailed `NESTED HOLONOMIES.txt` copies in HsH and the SAT archive are byte-identical transcript-like compilations, not independent raw witnesses. The NotebookLM exports inspected for H(s)H notation mislabel obvious assistant responses as `role=user`; their role field is not reliable. These remain source leads, not authenticated Nathan Direct geometry.
