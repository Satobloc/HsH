# Enheduanna h1165:s0 — Universal Indicatrix source-locator correction and great-circle derivation branch

**Run key:** `REVROT3-19-20261011:1165:s0`  
**Selected ring label:** Enheduanna (index 11)  
**Next ring label:** Tern Rook (index 12)  
**Classification:** ADDITIVE_SOURCE_FIDELITY / TWO_MESSAGE_LOCATORS_CORRECTED / GREAT_CIRCLE_METHOD_BRANCH_RECOVERED / EXISTING_LEAN_PROOF_REUSED / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION.

This is a narrow correction and extension to [issue #2028](https://github.com/Satobloc/HsH/issues/2028), not a duplicate of its 3+1 control-count analysis or [issue #1905](https://github.com/Satobloc/HsH/issues/1905)'s broader source-to-implementation audit.

## 1. Authority, source recovery and limits

The raw role-tagged source is the **Switching to English** conversation:

- Conversation ID: `69ab6f13-b8f8-832e-8d71-528c15e11037`.
- Raw Git blob: `dfdaec331846087af7daf0008eba431520a5b9ad`.
- The exact user-message UUIDs and timestamps below were parsed from that blob, preserving the outer role and message creation time.

The selected Enheduanna workspace was read. It explicitly says no dedicated, usable Enheduanna thread is authenticated and no standalone Nathan-authored Enheduanna specialist charter has been recovered. The only located direct instruction specific to the Enheduanna case is broad: consider all archives when examining that case. It must not be inflated into a detailed scientific remit. This run therefore follows the present Lane 00 instruction as a one-run task overlay, not as evidence of historical Enheduanna participation.

Mersearch was not run: all four canonical request lanes remain occupied/requested. The bounded fallback was direct retrieval of the already-indexed public HsH raw conversation and the two existing Library PDFs. No request was overwritten, released or retriggered; no private HSH_RESOURCES or PRIOR_ART payload was accessed.

## 2. Two source-locator errors in issue #2028

The raw export shows that two entries in §1 of #2028 assign the wrong time and content to message IDs.

| Item in #2028 | Correct raw-source record | Correction |
|---|---|---|
| `1d6e1ab3-7c21-4765-a5b2-17276da1a749`, described as a 10:42:41 message about solids of rotation | `1d6e1ab3-7c21-4765-a5b2-17276da1a749`, **2026-03-07 11:21:18.547Z** | This is the later UI-agnostic / great-circle derivation proposal, not the solids-of-rotation message |
| `932e7f79-cb43-41db-af14-db66ffefb4c5`, described as an 11:05:14 shortest-route message | `932e7f79-cb43-41db-af14-db66ffefb4c5`, **2026-03-07 16:33:28.161Z** | This is the later request for a method paper with two examples, not the 11:05 geometry description |

The correctly located neighboring messages are:

| Message UUID | UTC timestamp | Direct content / role in the sequence |
|---|---|---|
| `635a4945-a0a1-491d-b7ea-0a643d5c6135` | 10:39:07.179Z | Requests basic instructions: equation to curve, compare two curves, and find a shortest derivation |
| `6318fb21-3275-4367-a5f1-4d2e4fe81652` | 10:42:11.029Z | Asks where GR and QM clash in their equations |
| `8270405c-912d-4c88-a00f-32ad909cd83e` | 11:05:13.866Z | Describes equation↔curve operations, hypersphere motion, surface/interior curves, dual hemispheres, projections, moving attachment points, and solids of rotation |
| `1d6e1ab3-7c21-4765-a5b2-17276da1a749` | 11:21:18.547Z | Proposes charting both equation paths to a great circle rather than directly mapping one curve to the other |
| `932e7f79-cb43-41db-af14-db66ffefb4c5` | 16:33:28.161Z | Requests a paper on shortest-route derivations and transformations, with a simple two-step example and a more nontrivial gauge-symmetry-to-gravitational-metric example |

The direct geometric expansion at 11:05 is therefore `8270405c`; the great-circle proposal is `1d6e1ab3`; and the paper request is `932e7f79`. These are three distinct source events.

## 3. The newly recovered method branch

The 11:21 direct message makes two important statements:

1. The UI is intended to be agnostic about what is placed into or onto it; the broader goal is to study the universe with it.
2. For equation derivation, the user proposes charting each equation's path to a great circle rather than directly mapping one equation's curve onto the other's.

This is a **method proposal**, not a defined algorithm. It should be kept distinct from the geometric trajectory generator.

### Two UI functions that must not be collapsed

**A. Geometric trajectory generator**

The March 7 direct construction describes a fixed and a moving four-dimensional grid/hypersphere, initially coincident, with marked points, relative rotation and radial expansion/contraction. Later messages add curves on the surface and in the interior, dual-hemisphere constructions, projections, moving attachment points and ray-generated solids of rotation.

**B. Equation-space translator / derivation navigator**

The separate method branch proposes:

- represent an equation in a form that can be mapped to a curve;
- map two equations to curves;
- compare those curves;
- optionally chart both paths to a great-circle reference;
- find a shortest derivation or transformation route.

The source does not define the equation-to-curve map, the great-circle canonicalization, the representation space, the admissible transformations, or a cost/metric for “shortest.”

The particle/superhelical Lagrangian is a third object. The earlier direct message `0af476ca-9aac-43a5-b9c9-e0fdf038f2b6` says the UI may not have a complete Lagrangian and is primarily a mapping/translator. The direct message `8e699f85-2109-4d57-81de-5bb5430f4353` separately says the nth-order superhelical Lagrangian is what should be varied and plugged into the UI. The UI itself, the particle Lagrangian, and the equation-space derivation method must remain distinct.

### Mapping diagram

```text
GEOMETRY / TRAJECTORY BRANCH

fixed 4D grid + fixed hypersphere
             |
             | common origin / marked point
             |
moving 4D grid + moving hypersphere
             |
       relative rotation + scale
             |
       point / ray / curve / sweep
             |
       optional 3D readout


EQUATION / DERIVATION BRANCH

equation E1 -----------------> curve C1
                                  |
                                  | candidate great-circle
                                  | canonicalization
                                  v
                              reference path G1

equation E2 -----------------> curve C2
                                  |
                                  | candidate great-circle
                                  | canonicalization
                                  v
                              reference path G2

             compare paths / residuals / invariants
                              |
                   transformation graph + cost
                              |
                    shortest derivation route
```

The arrows in the second branch are proposals, not existing source-defined maps. If both curves are sent to the same great circle, the construction must preserve residual information or other invariants; otherwise distinct equations may collapse to the same representation and become indistinguishable.

## 4. Historical assistant translation and fidelity

### Immediate response to the great-circle proposal

Assistant message `4cf47500-4768-446b-b711-37f954dee0b5`, 2026-03-07 11:21:18.934Z, interprets the proposal as mapping both formulations to a common canonical trajectory, suggesting a great circle on \(S^3\) **or in 4D Minkowski space**. It then adds gravity as global surface curvature, quantum excitations as local distortions, and measurement of distances, angles and winding along the common object.

Those additions are not in the direct message. In particular:

- a great circle on the round Euclidean \(S^3\) is not automatically a geodesic in Lorentzian Minkowski spacetime;
- no metric/signature conversion or map between those spaces is specified;
- no invariant-preserving map from an arbitrary equation curve to the great-circle reference is defined;
- no transformation cost or shortest-path theorem follows merely from choosing a common reference curve.

The subsequent user messages pivot to a hydrogen-atom exploration, then to deriving QM/relativity directly and translating problematic equation parts without mediating through particles. The recovered sequence does not show the great-circle interpretation being adopted as a settled method.

### Later method-paper draft

The 16:33 request `932e7f79` asks for two examples: a simple two-step equation transformation and a more nontrivial gauge-symmetry-to-gravitational-metric mapping, with the latter not named in the paper.

Assistant response `4b497bdc-1c01-4c81-ae65-8a1b2ff666dc` supplies a generic paper template. It defines distances as “transformation effort” or structural difference; paths as sequences of operations; shortest paths as minimal operations; and loops/eigenmodes as symmetry/irreducible-operation indicators.

But its first example uses placeholders \(A(x)\), \(B(x)\), \(C(x)\), \(T_1\), \(T_2\), without actual equations. Its second example is also generic: no concrete gauge transformation, metric, intermediate equations, or derivation is supplied. The requested examples were therefore **not actually demonstrated**.

The draft introduces a metric on equation/representation space without defining its points, admissible transformations, metric, weights, units, equivalence relation or proof of minimality. This is assistant reconstruction, not a recovered Nathan Direct equation.

### Later assistant-style archive equations

The unbylined historical [SAT CORE — UI CONFIG synthesis](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25) (blob `6817caf68943593f31d72d51798e0ba4589624a4`, first-extant repository addition 2026-06-01T05:37:31Z) supplies:

- \(y^\mu(\lambda)=r(\lambda)R^\mu{}_\nu(\lambda)x_0^\nu\);
- a six-plane \(SO(4)\) rotation and angular-velocity tensor;
- an assistant-generated \(L_{UI}\);
- a shortest-derivation interpretation as minimal deformation of the scale and rotation controls.

These equations remain assistant-style historical synthesis. They do not define the great-circle canonicalization or the equation-space metric requested in the direct method branch. The broader unbylined [SAT GEOMETRIC SOLVERS](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25) synthesis (blob `5429f7cb2adbfdc0abab7db46eff4ca4de08358a`, first-extant addition 2026-09-04T19:53:15Z) further generalizes the UI to dimension \(n\) and makes spheres optional. That is a later assistant reconstruction, not a silent correction of the March 7 source.

## 5. Artifact chronology and image limitation

Two related Library PDFs were materialized and inspected:

| Artifact | Pages | SHA-256 | PDF creation metadata |
|---|---:|---|---|
| FINDING THE DONUT (nolat) | 27 | `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae` | 2026-04-13 08:50:35 UTC |
| Universal Indicatrix in my words CHARACTERIZATION (Nolat) | 2 | `ad920fa43badd060d10cc05ee7de2c47d933d0fab094fbac14f49d91eacae21a` | 2026-04-14 02:50:55 UTC |

The PDF creation times are 18 hours, 20 seconds apart. This establishes only the ordering of the exported PDF artifacts, not the date the underlying ideas or handwritten notes were created.

The two-page characterization says it is a transcription of text from supplied images. Both pages were rendered and inspected: the recovered PDF contains the transcription, not the original notebook/page images. Pages 24–27 of FINDING THE DONUT were also rendered; they are text pages, not the missing original diagrams. A bounded Library search did not recover the original UI notebook images. Their visual fidelity therefore remains unverified.

The extracted-text companion for the UI characterization is SAT archive blob `a1707dffe3502d507bc405d4087a3476fc1d6cce`; its extraction record says OCR was not attempted. The raw March 7 conversation independently confirms the two-grid/marked-point construction, but does not authenticate every handwritten control detail in the PDF.

## 6. Proof-first status

The relevant existing formalization is [PR #1970 — UI marked-point readout equivalence modulo stabilizer](https://github.com/Satobloc/HsH/pull/1970):

- Exact PR head: `c7e2814b24f30f208e906f7ba9bbbc9a02fc565b`.
- [Actions run #44283652553](https://github.com/Satobloc/HsH/actions/runs/44283652553), verify job `134730584552`: SUCCESS.
- The job explicitly asserted checkout of the exact PR head and compiled the Lean/Mathlib library.

Its generic group-action theorem proves that two frames give the same marked-point readout exactly when their relative element fixes the seed; a right-stabilizer chart change preserves that readout. This is a conditional theorem about a generic group action. It does not instantiate \(SO(4)\), prove the source's great-circle method, establish an \(SO(4)/SO(3)\) quotient for this UI, or validate a physical interpretation.

Existing [PR #262](https://github.com/Satobloc/HsH/pull/262), exact-head verify job `133584241306` in run #43948452979, also successfully compiled the conditional radial/angular speed identity. Its overall merge-group run is marked failure; the bounded claim is the successful exact-head verify job, not an all-green merge group.

No new Lean module was written. The great-circle method is not yet a definite formal statement: the representation space, equation-to-curve map, canonicalization, residual data, transformation set and metric are all missing. Formalizing an invented map would not test source fidelity. No local Lean/Lake/Elan execution is claimed.

## 7. Symmetric discrepancy ledger

| Priority | Issue | Assessment |
|---|---|---|
| High | #2028 assigns the wrong time/content to `1d6e1ab3` | Correct to 11:21:18.547Z / great-circle proposal |
| High | #2028 assigns the wrong time/content to `932e7f79` | Correct to 16:33:28.161Z / method-paper request |
| High | The 11:05 geometry/solid-sweep description | Correct source is `8270405c`, 11:05:13.866Z |
| High | Great-circle canonicalization | Direct proposal, but no map, residual, metric or admissible transformation set |
| High | Assistant response says \(S^3\) “or” Minkowski | Conflates distinct metric geometries without a map |
| Medium | Shortest derivation | Requires a representation space, admissible transformations and a cost/metric; none is source-defined |
| Medium | Two requested paper examples | Assistant draft supplies placeholders rather than actual equations/derivations |
| Medium | UI versus particle Lagrangian | Direct source keeps them distinct; later assistant \(L_{UI}\) is not direct |
| Medium | Original images | Not embedded in recovered PDFs; visual source comparison remains blocked |

Nathan's direct proposals are useful but underdefined: “shortest” requires a cost and transformation set; “great circle for both” requires a map that preserves the differences being compared. The assistant's response overreaches by turning a tentative method into a gravity/quantum interpretation and then substituting an undefined metric and generic placeholders for actual demonstrations.

## 8. Next deeper cursor

1. Correct the two message locators in future references to #2028; preserve the published original and point to this additive correction.
2. Recover the original notebook/page images or the source notes from which the two-page characterization was transcribed.
3. Define the equation-to-curve representation map and its domain/codomain.
4. Define whether the great-circle reference lies on a round \(S^3\), another Riemannian sphere, or a separate representation space; do not conflate it with Minkowski geodesics.
5. Define the canonicalization map and the residual/invariant data needed to prevent distinct equations from collapsing to the same great-circle representation.
6. Define admissible transformation operators, a cost/metric, units/normalization, and the conditions under which a shortest path exists or is unique.
7. Only then formalize the source-defined method in Lean and test it on actual equation pairs, including the two examples requested in the 16:33 paper prompt.

No physical system or measured dataset is involved in this source-fidelity correction. No physical calculation, fit, prediction, independent measurement, CODATA scoring, SAT-O/Blockwave equation correction, paper-gate advancement or BEDROCK theory promotion was performed.

**Final disposition:** the March 7 raw source contains a distinct great-circle derivation proposal that was mislocated in #2028. The corrected chronology separates the equation-to-curve instruction, the GR/QM clash question, the surface/interior/solid-sweep geometry, the later great-circle proposal, and the still-later method-paper request. The great-circle method remains a proposal awaiting typed maps and a metric; the assistant's subsequent physical interpretation and placeholder paper draft are not source-authorized results.