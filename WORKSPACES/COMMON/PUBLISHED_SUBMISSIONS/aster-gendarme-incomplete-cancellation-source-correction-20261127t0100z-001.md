# Gendarme Graticule: incomplete-cancellation source correction

**Date:** 2026-11-27  
**Status:** ADDITIVE SOURCE-FIDELITY CORRECTION / COMPLETE CANCELLATION EXCLUDED / CANCELLATION OPERATOR UNDEFINED / NO THEORY PROMOTION

## Scope

This addendum corrects an overstrong cancellation summary in the earlier Gendarme reports, [issue #1322](https://github.com/Satobloc/HsH/issues/1322) and [issue #2432](https://github.com/Satobloc/HsH/issues/2432). It preserves both earlier artifacts and does not change the existing formalization PR #2261.

## 1. Source chronology

The original Gendarme geometry is in the raw Meridian conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`:

- [LIVE CONVOS raw export](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/%F0%9F%8C%90Meridian%20%5BHsH%5D%20Michelstein-on-Meinorly%20%E2%80%94%20raw.json), blob `d21e251df093013903cc19789ded562f83b6e6ea`, 343 mapping nodes.
- [Expanded SAT_CONVOS_13 snapshot](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.04%E2%80%A226.09.10%E2%80%A2%F0%9F%8C%90Meridian%20%5BHsH%5D%20Michelstein-on-Meinorly%20%E2%80%94%20raw.json), blob `1f841895a2585843373fe33d55a0180c91cc8423`, 706 mapping nodes.

The eleven selected direct user-role messages in the Gendarme cluster were checked in both snapshots; their role and content match, and all eleven are on the base snapshot's current-node ancestry. This is snapshot consistency, not independent corroboration.

The cancellation statements have three chronological stages:

1. **2026-09-04 15:47:17.910Z**, direct message `c67e32f3-43d3-490d-9c64-51c61d0280a9`: an initial degenerate construction in which inverse graticulae superimpose and cancel to a null graticulum.
2. **2026-09-04 15:50:24.133Z**, direct message `e380f83e-ba07-4889-8394-e898a95d448b`: “they don't cancel.”
3. **2026-09-21 16:39:56.240Z**, later direct clarification in the separate archived Aster conversation: `9f123f8a-94e0-48f9-8073-6e6ec67df869`, “More accurately: They don't fully cancel.”

The later clarification is in archived Aster conversation `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`, raw blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`, path `DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.09.20•26.10.17•ASTER — raw.json`. Its raw graph has 1,818 mapping entries; the correction is an outer user-role message on the current-node ancestry. The existing Aster source-custody record gives the raw export SHA-256 as `c28feab87facfbc24de9a97b010ef57126503c960cafd4a2793c1e8903af274d`; that digest was not recomputed in this run.

The September 21 sentence is a later direct wording correction to an assistant summary of the September 4 geometry. It is not a new equation or an independently defined cancellation mechanism.

## 2. Geometry retained from the original cluster

The relevant direct source messages include:

- `dd2d0663-03f6-45ee-aae2-b4e792b02d06` (13:44:08.651Z): two axes in the small torus cross-section form quadrants; a primary circumference-tangent axis doubles them into “eight quadrants”; the source calls these “two overlapping parities”; both a straight orthogonal tangent reference and a curved tube-centric circumference reference are required (“Always both”); a curve per tangent-axis unit is proposed as a curvature measure within a tube segment of any length; “axial asymptopy” is introduced but not defined.
- `fd780628-bf2d-4791-9646-e551c3fa5a91` (13:52:22.306Z): “We don't add a parameter. It's a relationship defined by angle and torus elements.”
- `0df66202-817c-46ef-913d-85e7f07366cf` (14:08:29.123Z): the 2D cross-section is to be graphed as a field indexed by position and vector angle.
- `b2f97b0c-21ab-49ad-a0a4-4871e6503765` (15:19:45.111Z): torus-side distinction is inner/outer, not left/right; straight tangent versus torus circumference introduces prograde/retrograde, chirality and CW/CCW direction; proposed metrics are nested angular relationships among the elements and torus primitives.
- `71ae32d1-1de0-45a0-83d6-11a58d7a7c31` (16:38:16.684Z): ordinary/anti pair is to be a precise left/right mirror; this message spells the object “craticule,” while surrounding messages use “graticule”; L/R is the display change.
- `59abdb3e-4704-4bdb-837d-b45df7836751` and `b6e24d98-1bfb-497c-bf29-de69c194b3bd`: CMY-like overlay and a saturation-to-white cancellation gradient are requested.
- `7a99e50b-d6c8-4d27-b3fc-a7fcca03c11f` (17:20:36.687Z): asks whether near-cancelling plots are calculated or merely applied gradients, and proposes a 3D calculation/reference-vector investigation.
- `2e9e68c5-36ec-4fbb-adfc-b6d2b9a365a6` (18:02:12.059Z): corrects the presentation target: keep a simple gradient and cancellation cross-gradient; a full 3D projection is not wanted.

The later Aster correction changes the cancellation wording, not the directly specified torus/cross-section geometry.

## 3. Correct source reading

The current source-grounded statement is:

- The initial **complete-null** construction was superseded.
- The later “they don't cancel” wording was itself refined to “they don't fully cancel.”
- Therefore, **complete cancellation is excluded**. Partial cancellation is compatible with the later wording, but is not quantified or formally specified; its operation and domain are undefined. The source does not establish whether any partial cancellation is geometric, algebraic, topological or display-only.
- The CMY overlay and saturation-to-white gradient are direct display requests. No source-defined map connects that color-composition operation to a physical cancellation law.
- An exact left/right mirror relation does not imply sign negation. The source separately distinguishes physical inner/outer torus sides from left/right display coordinates.
- The requested two overlapping parities are not yet defined as operators, labels, involutions or constraints.
- The direct request for both straight orthogonal and curved tube-centric tangent references must be preserved. Choosing only one is a fidelity loss.
- The 17:20 3D-calculation request and 18:02 rejection of full 3D projection can be reconciled as a possible internal-3D / simple-2D-display workflow, but that split remains an assistant reconstruction, not an explicitly adopted map.

## 4. Original propositions versus historical translations

| Nathan Direct | Historical assistant translation | Fidelity status |
|---|---|---|
| Two cross-sectional axes, quadrants, a circumference-tangent doubling, and two overlapping parities | Eight sign sectors with two Boolean parity labels | Conditional combinatorial model; the source does not define the parity operators |
| Both straight orthogonal and curved tube-centric tangent references | A selected tangent/geodesic parameterization | Incomplete if either reference is discarded |
| No added parameter; relations are defined by angle and torus elements | Additional local proxies, chirality/reconnection quantities and a 90-degree normalization | Not direct; requires source-defined derivation and dimensional/type checks |
| Ordinary/anti pair is a precise L/R mirror | `M(u,v)=(-u,v)` | Plausible conditional display map if `u` is the L/R coordinate; not a physical torus-side reversal |
| “They don't fully cancel” | “They do not cancel” / “physical cancellation explicitly rejected” | Overstrong; complete cancellation is excluded, but partial cancellation is not ruled out |
| CMY overlay and a simple cancellation cross-gradient | Mirror-odd half-difference treated as the residual/cancellation | Unproved identification; display operator and geometric operator remain distinct |
| Simple 2D gradient/cross-gradient; no full 3D projection | Full 3D projection/readout | Conflicts with the later display correction |

The standard ring-torus metric and a relation such as `rho sin(alpha) = constant` are not Nathan Direct equations. The latter belongs to a particular geodesic problem on a surface of revolution and requires a declared metric, geodesic assumption and angle convention. Those conditions are not supplied by this source cluster.

## 5. Glossary and mapping obligations

| Term | Source-grounded meaning | Missing definition |
|---|---|---|
| Gendarme Graticule | 2D cross-sectional grid for a toroidal bulk | Cross-section map, coordinates and field domain |
| Two short axes | Axes defining the cross-sectional quadrants | Orientation and relation to the torus frame |
| Primary circumference tangent | Additional tangent reference that doubles the regions | Exact tangent field and normalization |
| Straight tangent | Orthogonal straight reference | Transport/frame convention |
| Curved tangent | Tube-centric circumference reference | Curve and curvature definition |
| Curve per tangent-axis unit | Proposed curvature measure within a tube segment of any length | Unit, normalization and map to the tangent references |
| Two overlapping parities | Directly named structural feature | Operators, labels or invariants |
| Axial asymptopy | Directly named behavior | Definition and limiting variable |
| Ordinary/anti graticulae | L/R mirror pair | Exact source coordinate and transformation |
| Incomplete cancellation | Later direct wording | Cancellation operator, domain/codomain and residual readout |
| CMY cross-gradient | Requested display | Color-composition map; no physical identity established |

```text
3D toroidal bulk
   --[cross-section / projection map not defined]-->
2D Gendarme field: position + vector angle
   --> two short axes / four initial regions
   --> primary circumference-tangent doubling
   --> eight source-described regions / two overlapping parities
       [parity operators not defined]
   --> ordinary / anti display pair
       [L/R mirror relation; exact coordinate map not source-defined]
   --> incomplete-cancellation readout
       [operator and residual not defined]

CMY overlay / saturation-to-white cross-gradient
   [separate display-composition layer; no typed map to physical cancellation]
```

## 6. Formalization status

Existing [PR #2261](https://github.com/Satobloc/HsH/pull/2261) was inspected, not modified. It is open, draft and unmerged; head `ace5d9258e4b2dad90328ab54192e6ca642c84c0`. Its successful Actions run #45214768939 checked out the synthetic PR merge ref `6bbcf38429ed55329aecac6c045db5b6c18b9569`, not a standalone exact-head checkout.

The Lean module conditionally formalizes an eight-sector/Boolean-label model and a left/right reflection with mirror-even/mirror-odd decomposition and reconstruction. The merge-reference root Lean build completed successfully. This verifies the encoded conditional algebra only. It does not establish that the two source-described parities are Boolean operators, that the display mirror is the full physical map, or that the odd component is the cancellation residual.

No new Lean theorem was added. A faithful theorem about “partial cancellation” cannot be stated until the source defines the cancellation operation, its typed input/output, and which layer it acts on. Inventing those definitions would formalize an assistant replacement, not Nathan's proposition. Exact-head verification of PR #2261 remains outstanding.

## 7. Discrepancy ledger and next cursor

1. Correct the absolute “no cancellation at all” wording in issues #1322 and #2432. The source says “don't fully cancel”; the amount and operator remain unknown.
2. Keep the exact L/R mirror relation separate from sign negation and from physical inner/outer torus orientation.
3. Define the two parities before mapping them to Boolean labels or operators.
4. Define the straight and curved tangent references together, including their common frame and relationship to the torus primitives.
5. Define the cross-section-to-field map and the position/vector-angle domain.
6. Define the cancellation operator and distinguish geometric, algebraic, topological and CMY display composition.
7. Preserve the simple 2D gradient/cancellation cross-gradient as the display target; do not reintroduce a full 3D projection without a new direct instruction.
8. Only after these source-grounded definitions exist, extend the existing Lean module and run exact-head CI. Do not infer a physical mechanism or start a data-free physical calculation.

No CODATA scoring, physical calculation, fit, prediction, independent measurement, SAT-O1/Blockwave equation modification, shared-symbol registration or theory promotion was performed. Neither SAT-O1 nor Blockwave equations are part of this correction; their original source strings remain untouched.
