# Loom source-fidelity ledger: Cruller, affine lift, and readout-acceleration null

**Run key:** REVROT3-19-20261011:593:s0  
**Lane:** 00 / Nathan Direct geometry fidelity  
**Selected ring label:** Loom (index 1)  
**Next ring label:** Aster (index 2)  
**Status:** SOURCE_AUDIT_ONLY / ADDITIVE TAGGING / NO THEORY PROMOTION

## 1. Scope and source hierarchy

This pass extends, rather than replaces, the existing source records:
- Issue #1117 already holds the direct Cruller/worldtube/slice geometry.
- Issue #1120 already holds the 4D-curvature assertion and the assistant-derived fixed-affine Euclidean lift.
- Issue #1341 already holds the SAT-O1/Blockwave source-equation and ambient-type crosswalk.
- The 2026-11-04T0536Z Loom Klein Fabric addendum already holds the 2026-08-26 direct Klein Fabric source chronology and finite-core/multipole-map work.

No retagging of those covered sources and no duplicate equation transcription.

Primary raw source for the present local cluster:
- Conversation: 6ad7e9c0-e8a0-83e9-984e-94d020de3abf
- Raw export: LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json
- Blob SHA-1: 56a84cb85d5c386efa4ea11d322d11e95e2c7703

## 2. Nathan Direct extraction

| Message | UTC timestamp | Direct content / status |
|---|---|---|
| 69e7e8b1-86e8-4dea-a38b-9193f7327fb5 | 2026-10-20 23:27:04.725 | Distinguishes one instantaneous 3D slice from a 4D worldtube/history. Direct geometry, not a parameterized embedding. |
| c1b42229-00a9-4119-aac3-cefa6cb97157 | 2026-10-20 23:34:44.617 | Cruller description: smooth toroidal/donut form; internal rotation; surface wrinkling, coiling and tension along wrapping “candy-cane” lines; internal filaments/bridges/Kerr-like structures; another worldtube/particle with each rotation; massive structures sink toward a central singularity. Qualitative descriptive geometry, no metric or field equation. |
| a85f97d6-178e-4b6c-adba-f03bd28d9b6b | 2026-10-20 23:23:25.161 | Surface tension/gravity-well/drop metaphor. Direct conceptual imagery, not a constitutive law. |
| f658b2db-32f0-45cd-828b-140691cc9afb | 2026-10-20 23:53:30.041 | “Expanding Minkowski geometry”; 4D curvature of the toroidal history is acceleration; bending and expansion may be distinct; explicitly “no proof, working hypothesis.” |
| 34f444a1-f987-4e81-a438-73b9c3463f38 | 2026-10-21 00:37:49.483 | Direct instruction: start with the Cruller and work backwards. |
| 59cdedb4-be76-455a-87c8-a6089de951b3 | 2026-10-21 23:53:03.096 | “3D rotation absolutely is 4D curvature. All 3D acceleration is.” Direct assertion; no curvature type, metric, affine parameter, slice map or readout map specified. |
| 2bef9e5d-cf4d-4cb2-959f-218e032e5263 | 2026-10-21 06:32:15.993 | Recollection of prior worldtube tension near 10^44 J and a possible minimum-momentum ceiling on bending. No recovered calculation, provenance, units convention, uncertainty or measured input. Not used. |
| a0e0be28-5bd8-45da-9991-1e075f09728d | 2026-10-21 06:34:36.336 | Recollection that maximum bending energy was calculated previously; direct instruction to work in Planck units. No calculation supplied. Not used as input. |
| c5525f53-b7cc-4444-8102-3bf6fdb1c892 | 2026-10-21 13:55:40.205 | Literal native notation cw=t, positive ++++ convention, Forest Normalization; alternative expression tentative. Do not silently replace with earlier w=ct. |
| 090f5160-1020-486d-9c42-df3d7dff2063 | 2026-10-21 00:17:23.235 | Mixed-source message. Only the final user correction is direct: the older reciprocal filament/timesheet-deformation description is superseded by Klein Fabric. This message is not itself the full Klein Fabric definition; the 2026-08-26 direct source is already recorded in the 05:36 Loom addendum. |

### Role-contamination boundary

Message df68cd5f-3c9a-4f1e-a864-4aa65b027f30, 2026-10-20 22:22:53.355Z, has outer role user but embeds a long assistant-style analysis with first-person assessment and rotating/pulsating-string formulas. The raw export does not authenticate the embedded author. Tag the outer wrapper as USER_ROLE_PASTE / EMBEDDED_ANALYSIS; do not attribute its formulas to Nathan Direct.

## 3. Historical assistant reconstructions

### 3.1 Fixed-affine Euclidean lift

The assistant-authored Meridian correction/continuity material places the direct sentence under a “Nathan Direct correction” heading, then develops the special model

    X(w) = (R cos(ωw), R sin(ωw), 0, w)
    κ₄,E = Rω² / (1 + R²ω²)

and the general graph-lift curvature expression

    κ₄,E² = ((1+|v|²)|a|² - (v·a)²) / (1+|v|²)³.

These are assistant-derived formulas. They are mathematically valid for the specified Euclidean R4 graph curve and fixed affine parameter w. The raw Nathan Direct messages do not define that embedding or identify w as a physically privileged affine parameter. The heading’s provenance scope is therefore too broad: the qualitative correction is direct; the exact model and formula are assistant reconstruction.

The symbolic conditional is:

    Given X(w)=(x(w),w) in Euclidean R4 with w a fixed affine parameter,
    a(w) ≠ 0 implies κ₄,E(w) > 0.

That is not equivalent to the unqualified universal statement “all 3D acceleration is 4D curvature” until the physical status of w and the readout map are source-defined.

### 3.2 Meridian curvature/expansion sandbox

The assistant-authored sandbox WORKSPACES/MERIDIAN/SANDBOX_2026-10-20_COSMOBARYGENESIS_CURVATURE_EXPANSION.md (blob 5925e4025a9d46cb7a6affbd9ed1b84ef2141c41) chooses Euclidean R4 with ++++, a complex-structure-like J satisfying J²=-I, and V(X)=ωJX. It obtains zero divergence with nonzero normal kinematic acceleration in a flat ambient R4. This separates kinematic curve curvature, expansion, and ambient Riemann curvature in that chosen model. It is not a physical derivation or measured system.

### 3.3 Orson resolver-Hessian null

The assistant-authored sandbox WORKSPACES/ORSON_VAY/SANDBOX_2026-10-05_RESOLVER_HESSIAN_ACCELERATION.md (blob 530fc7a45c40994d61f38ed4227f74578ba4e5ca) considers a straight carrier X(s), scalar time resolver T(X), fixed linear projection P, and r(t)=P X(s(t)):

    r¨(t) = P [ X''/T_s² - X' T_ss/T_s³ ]
    T_s  = ∇T · X'
    T_ss = X'ᵀ Hess(T) X' + ∇T · X''

For X''=0, the resolver-Hessian term can produce nonzero coordinate-time acceleration. But P X(s) remains a straight spatial locus under fixed linear P. This is non-affine parameterization/readout acceleration, not spatial-path curvature. The sandbox itself says a physical reading fails if T is merely gauge and has no operationally privileged status. Its arbitrary scripted fixture was not rerun.

This is not a physical counterexample to the Cruller model. It is a conditional null against identifying coordinate-time acceleration uniquely with curvature of the 4D carrier when the time resolver is unspecified.

## 4. Original vs translated propositions

| Layer | Proposition | Epistemic status |
|---|---|---|
| Nathan Direct | A 3D instantaneous slice is related to a 4D worldtube/history; Cruller material rotates, wrinkles/coils, forms filaments and worldtubes; 4D curvature is acceleration; all 3D acceleration is 4D curvature. | Direct qualitative geometry plus an emphatic but untyped assertion; earlier message explicitly says no proof / working hypothesis. |
| Assistant translation A | Embed a 3D path as X(w)=(x(w),w) in Euclidean R4 with fixed affine w; then nonzero 3D acceleration implies positive Euclidean curve curvature. | Conditional mathematical reconstruction; not a direct equation. |
| Assistant translation B | Use a non-affine scalar resolver T(X) and fixed projection P; coordinate acceleration can appear even for a straight carrier. | Conditional readout/parameterization null; not a physical mechanism without operationally privileged T. |
| Assistant proposal C | C² / punctured-cover / mapping-torus constructions for the Cruller/Klein Fabric relationship. | Proposal only; not direct source and not promoted. |
| Historical artifacts | SAT-O1 curve action and Blockwave rank-2 worldsheet current. | Distinct historical source objects; no automatic map to the current 4D Cruller/worldtube. |

## 5. Glossary

- **Cruller:** Nathan Direct qualitative toroidal/material-history construction; not yet a parameterized manifold or field configuration.
- **Instantaneous slice:** Directly distinguished 3D view/surface of the history; the source does not yet define a complete foliation or simultaneity function.
- **Worldtube:** Directly named 4D history/continuation of a structure; its support, thickness and material labels remain to be specified.
- **Filament / bridge:** Direct descriptive internal structures in the Cruller account; no source-defined current or embedding supplied here.
- **4D curvature:** Ambiguous source term; could mean curve curvature, 4-acceleration, worldtube/normal-bundle curvature, or ambient Riemann curvature.
- **κ₄,E:** Assistant-derived Euclidean curve curvature under a chosen embedding and affine parameter.
- **Affine parameter w:** Assistant-added condition in the fixed-affine lift; not located in the direct messages above.
- **Resolver T:** Assistant sandbox scalar time function; operational status unknown.
- **Projection P / readout P_t:** Map from the 4D material history or slice to a 3D observed path; not yet source-defined.
- **a₃:** Coordinate-time 3D acceleration; must be distinguished from geometric curvature of the spatial locus.
- **Klein Fabric:** Direct supersession/construction already recovered in the 05:36 Loom addendum; not re-opened or re-tagged here.
- **SAT-O1 γ¹:** Historical 1D curve in Lorentzian R^{3,1}; its text verbally calls a 4D swept volume a worldtube but supplies no thickening map.
- **Blockwave J^{μν}:** Historical rank-2 current on 2D worldsheets; not a 4D finite-core volume.

## 6. Mapping diagram

    CRULLER / MATERIAL HISTORY W⁴
      [direct qualitative object; no embedding or core map]
                 |
                 | intersection with a 3D slice Σ³_t
                 | [slice/worldtube distinction direct;
                 |  complete slice family not defined]
                 v
             T³_t
      [3D trace / instantaneous configuration]
                 |
                 | observation / projection P_t
                 | [missing]
                 v
              r³(t)
                 |
                 | d²/dt²
                 v
              a³(t)
      [coordinate acceleration; not automatically
       geometric path curvature]

Two competing assistant readout models remain distinct:

    Fixed-affine lift:  X(w)=(x(w),w)  -> κ₄,E
    Non-affine resolver: X(s), T(X), P -> r¨(t) with Hess(T) term

No composition law or equivalence between these models is established.

Historical object-type comparison (already recorded in #1120/#1341):
- SAT-O1: 1D curve γ¹ in Lorentzian R^{3,1}; first extant file commit 2025-10-27T00:40:28Z, blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; unbylined/undated O1 file, matching the O1 section of the June 2025 SAT4D Live Draft at document level.
- Blockwave Clean Action: rank-2 J^{μν} current on 2D worldsheets; original attachment present in raw conversation 2025-09-16T16:31:34Z; file blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; first extant HsH commit 2026-10-08T02:42:49Z; embedded author unresolved. The raw malformed quadratic-current token and the separate assistant-normalized candidate are already preserved in #1341; no duplicate transcription here.
- Current H(s)H source: 4D material/worldtube object with a 3D slice/trace, using literal cw=t and ++++ in the later direct notation. No map from either historical object to this one is supplied.

## 7. Discrepancy ledger

1. Direct “4D curvature” has no selected mathematical type.
2. Direct source does not specify the affine parameter w assumed by the assistant’s Euclidean graph lift.
3. “Minkowski” language, later ++++ convention, literal cw=t, and historical Lorentzian R^{3,1} have no source-defined conversion map.
4. A user-role message embeds assistant-style analysis; role alone cannot authenticate the embedded equations.
5. Meridian continuity/correction headings place an assistant-derived formula under a “Nathan Direct correction” label; qualitative assertion and formula provenance must be split.
6. Coordinate-time acceleration can include a resolver-Hessian term; spatial-path curvature is a different observable.
7. SAT-O1 curve, Blockwave worldsheet current, and current H(s)H 4D region are different dimensions/types; no projection/thickening/support maps connect them.
8. The reported 10^44 J worldtube tension and prior maximum-bending-energy calculation are unrecovered recollections, not measured inputs. Not used.
9. The C²/mapping-torus Cruller proposal remains assistant-generated and is not source truth.

## 8. Formalization and tools

- PR #1245: Lean 4.34.0 / Mathlib merge-ref run #41410202260 succeeded. The conditional Euclidean lifted-curve/circular-helix lemma compiled in an 8,945-job build; retrieved theorem-specific axiom output showed standard dependencies and no sorryAx. This was not an exact-head-only run and does not prove the universal direct statement.
- PR #873: latest merge-ref run #41758925555 failed with unsolved goals in KestrelMovingSlice.lean. Its generic map modules do not establish the source-specific composition.
- Local Lean/Lake/Elan are unavailable. No new Lean theorem or CI run.
- Math Hopper is an extraction/provenance layer, not a theorem prover; the three-repository pilot remains configured but not end-to-end verified.
- Whirligig is an existing 3D mechanical sandbox, not a physical 4D equivalence.
- SciSpace is available but not needed for this archive-source question. No new tooling or paid service.
- All three repositories were consulted: HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES tool orientation.

## 9. Mersearch and archive controls

- Existing completed Mersearch request enheduanna-page-one-origin-20261031-0100 was read as a locator for Blockwave source genealogy; it is not a Mersearch result for the present curvature question.
- Current Mersearch bridge/request lanes were checked; all four lanes remain occupied or unreconciled. No new request was opened or existing lane overwritten.
- The canonical Blockwave raw conversation export was verified directly: blob fa2586add42b4d87afe89a5b00e1e48a01aaee54; attachment file-LwaFTKkMemPPrLU4qCLpYB appears at 2025-09-16T16:31:34.670358Z. Its outer role is tool/attachment; embedded author remains unresolved.
- No quarantined path was opened in this run.
- No source equation file was modified.

## 10. Current controls and continuity

- HsH main head read: 0ef22c3b68e08b43ee510e32b705a8c9c6778ae5. Code Grurple interlock remains active. No new branch, PR, Factory Floor admission, BEDROCK edit, or paper-gate advancement.
- Paper gates remain separate: Nov 9 minor, Nov 30 major, Dec 14 full-theory. None advanced.
- FIE last full review 2026-10-27; next due 2026-11-10.
- Unrelated reading/break last completed in the 05:36 Loom run: fun break - lx.txt, lines 381-420; next cursor 421.
- Orson's protected LLM-cognition allocation was not altered; this pass only cited an existing Orson geometry sandbox.
- No CODATA scoring, physical calculation, fit, prediction, or independent measurement.

## 11. Publication status

A public-safe additive note was submitted through the existing publisher as issue #1355:
- Title: [HSH-PUBLISH-V1] Readout-acceleration null and Cruller source provenance: affine-slice qualification.
- Submission ID: loom-readout-acceleration-affine-slice-fidelity-20261104t1700z-s0-001.
- Publisher comment: REJECTED: SHA-256 mismatch.
- Canonical PUBLISHED_SUBMISSIONS artifact lookup: 404 / absent.
- No checksum/readback success; no publication claim.
- Existing publisher only triggers on issues.opened. PR #1251, which proposes issues.edited retry for corrected submissions, is still draft/open/unmerged. Do not create a duplicate issue or claim publication. Keep #1355 as the rejected audit record; retry only if the existing publisher gains a supported same-issue retry path.

## 12. Next deeper cursor

Start with the complete primary Cruller geometry and marked material flow, following direct instruction 34f444a1-f987-4e81-a438-73b9c3463f38. Retrieve the raw messages that define the material labels, rotation/filament birth, slice family and any affine parameter. Compare the assistant’s C²/mapping-torus and fixed-affine constructions against those originals; do not import either as source truth. Then determine whether the direct model supplies a physically privileged affine w, a slice family Σ_t, and a readout P_t.

**Disposition:** source-fidelity delta recorded; direct/assistant provenance separated; no theory promotion.
