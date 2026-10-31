# SAT-O / Blockwave current-rank source-fidelity audit

**Status:** SOURCE_FIDELITY_DELTA. This is a provenance and mathematical-type audit, not a physical result, theory promotion, or final choice of current ontology.

**Run:** REVROT3-19-20261011:485:s0 (Tern Rook, ring index 12).  
**Repository snapshot:** Satobloc/HsH main at 4276d62aaedbdcec26dd36c83d5fbed5154efd78.

## Executive finding

The recovered archive does not support one stable, source-authorized current rank for the SAT/Blockwave filament sector.

1. Nathan Direct geometry describes one-dimensional strings/worldlines in a four-dimensional carrier and a three-dimensional time surface intersecting them. Those statements do not choose a differential-form current rank.
2. A user-role transcript of the provisional One-Action SAT/Blockwave integration uses a rank-two field J^{mu nu}, while explicitly describing the composite Lagrangian as incomplete and "bolted together." This is evidence of a provisional two-form integration path, not a final ontology lock.
3. An unbylined Page One paste and later assistant/NLM-derived documents contain both rank-three and rank-two formulations. They do not supply a valid map between them. One later assistant formula is index-ill-typed; another correctly Hodge-dualizes a three-form to a vector, then incorrectly calls a two-form its dual.

The important correction is not "three-form wins" or "two-form wins." A three-form Poincare-dual current for a one-dimensional worldline and a two-form Poincare-dual current for a two-dimensional worldsheet represent different supports. In four dimensions they are not Hodge duals of one another.

## 1. Nathan Direct geometry recovered first

### March 22, 2024: static carrier, then moving intersection

Raw source: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/...DIMENSIONAL GRAVITY raw.json  
Blob: 2cea1924266418e19b825b95ae51e6b7cbace7e1.

Relevant raw user messages:

- aaa2269b-7eab-4781-9454-647098d6747f: the straight line and helix are each one-dimensional; the plane is two-dimensional; each line intersects the plane at one point. Nathan explicitly corrects the assistant's premature spiral-intersection description.
- aaa20670-fd77-4577-8e31-0a33a9e358c6: time is introduced by moving the plane along the lines while maintaining perpendicularity to the straight line.
- aaa28a9a-dcfc-4835-8359-e7da7b36911c: time is described as a three-dimensional surface intersecting strings; "now" is the current intersection, analogous to a propagating wavefront.
- aaa246c9-e52c-4650-84e8-b078149df0cc: a four-dimensional universe is described as static apart from propagation of the three-dimensional time surface; apparent spatial dynamism comes from changing intersection positions.

These are raw user-role messages. They establish the carrier/intersection distinction and the 3D timesurface concept. They do not define J, a differential-form degree, a metric signature, or an action.

### June 2026: particle correction

Raw source: DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.06.07...Geometry in Physics raw.json  
Blob: 2e0c8477873583b92f20a0a3f2af6528643b4a8a  
Conversation ID: 6a25a665-3a10-83ea-a7c0-cebebfdcf1d9.

Raw user message 0a1829be-9bf1-4801-aba3-da5c0cb67344, timestamp 2026-06-09T01:37:16.817Z, corrects an older document: electron as a single-coil particle worldline/tube; quarks as two- and three-braids; photons and other true bosons as vibrations on filaments, not filaments themselves. The preceding assistant message explicitly classifies the older document as a local/older rendering rather than an archive-level explanation.

Raw user message eeadf9ec-9a18-4139-b40b-6f7b408aecc4, 2026-06-10T13:34:42.549Z, says the basic vocabulary mostly emerged around the February 2, 2025 "Fundamental Intuitions" period, with earlier roots and the terms "timesheet" and "worldline."

These direct statements still do not select a two-form or three-form current. They strengthen the distinction between a one-dimensional particle centerline and a finite-core tube.

## 2. Historical SAT-O baseline

SAT.O Official Directives, document date July 2025, blob 167136310cdf33ca8f986f33634692314c1a0946:

- 4D differentiable manifold M.
- 1D filaments.
- Derived behavior from filament geometry and intersection with a propagating 3D wavefront Sigma_t.

The document does not specify a differential-form current rank. Its geometry is consistent with a one-dimensional carrier intersected by a three-dimensional front, but any J_3 assignment is a later mathematical translation, not a verbatim SAT-O equation.

Source: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20O%20Core%20Modules/SAT.O%20Official%20Directives.txt

## 3. The provisional two-form Blockwave path

The transcript SATOBLOC/SATO-BLOCK-INT.txt, blob 2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e, first imported to Git on 2025-10-28T00:04:17Z, contains user-role turns:

- "the new Lagrangian" is described as a composite of Blockwave and more developed SAT-O sectors, but "not complete" and "kind of bolted together"; it is a direction the work needs to go, not a finished action.
- A later user-role message says the machinery to be incorporated includes a filament current J^{mu nu}, a projected two-form kernel, and a holonomy coupling proportional to F_{mu nu}(theta) J^{mu nu}.

The embedded text's authorship is not separately established by the transcript, but the surrounding user statements clearly frame this as an incomplete integration exercise. It must not be promoted to a final current choice.

Historical assistant Blockwave message 121d607d-53e7-4b5a-8a7a-75d7e09deb3d, 2025-10-19T12:29:46.538Z, raw conversation blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77, uses a rank-two current and the equations:

~~~text
A_mu(theta) = alpha_* nabla_mu theta
F_mu nu(theta) = nabla_[mu A_nu]
J^mu nu = (1/2) epsilon^mu nu rho sigma nabla_rho B_sigma
nabla_mu J^mu nu = 0
~~~

This is assistant reconstruction, not Nathan Direct. It is a distinct rank-two field sector.

## 4. Page One: one pasted document, two current ranks

Raw source: 0.239 Radians in Science raw.json  
Blob: 67702fc58b0efce1d0f89d950b86a8819a189afb  
Conversation ID: 699e4a02-26e4-832a-86ea-ad1dcaf3c4e3.

User-role message 15338421-a5e7-4538-879a-d25d840d2bdd, timestamp 2026-02-25T01:12:37.976Z, contains an unbylined pasted document titled "Page One: SAT - Ontology and Unified Action." The outer message role is user; the embedded document has no author attribution.

The same pasted document first describes 1D worldlines as a conserved three-form current and gives a rank-three spectrum term:

~~~text
L_J^(3) = (kappa_0/4) J_mu nu rho J^mu nu rho
        + (kappa_2 ell^2/4)
          (nabla_alpha J_mu nu rho)(nabla^alpha J^mu nu rho)

L_hol^(3) = (g_h/2) F_mu nu rho(theta) J^mu nu rho
~~~

Later in that same document, the "Unified Blockwave Action" switches to:

~~~text
L_hol^(2) = (g_h/2) F_mu nu(theta) J^mu nu
nabla_mu J^mu nu = 0
~~~

No projection, sweep, contraction, or field-redefinition map connects these sectors. F_mu nu rho(theta) is not defined there. The document also uses sqrt(-g) and u^mu u_mu = -1, which are historical Lorentzian conventions and cannot be silently identified with the current native positive-Euclidean four-dimensional geometry.

Provenance warning: the assistant message immediately before the paste called 0.239 radians "very strong evidence" and claimed independent derivation; the assistant message immediately after the paste reinforced the claim that numerical outputs were geometrically inevitable. Those are assistant-authored overclaims, not independent evidence and not proof of the pasted document's authorship. Do not classify the embedded Page One equations as Nathan Direct.

## 5. Wanna Bounce / NLM-derived rank transition

The extracted Wanna_Bounce_.txt has blob 3049b4d30dbbacc07044de2f9c26b432c6571bbe. Its header records:

- Source PDF SHA-256: cd36f682aa9761a14ae3e3c85661724d86dd0f90e660b6c6c48ce71fa118021e
- Extraction time: 2026-09-10T16:03:14.229414Z
- 54 pages; no author or source-document date recovered.

The separate WB4 and WB516 text artifacts are stored under DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM; blobs 4cf2ce6307f6d88f4ab3d64970f5fde3a1cd928c and 37b201bedae76f665ee3c6e6d9fdae2439959dea. Their first Git import is 2026-10-08T02:12:54Z; that is not their original composition date or authorship proof.

WB4 prints:

~~~text
J^mu nu = epsilon^mu nu rho sigma j_sigma
~~~

As written, rho remains free on the right while the left has only mu,nu. This is rank-ill-typed. In four dimensions the Hodge dual of a vector is a three-form, not a two-form.

WB516 later gives the correctly typed three-form dual:

~~~text
tilde_J^mu = (1/3!) epsilon^mu nu rho sigma J_nu rho sigma
nabla_mu tilde_J^mu = 0
~~~

That maps a three-form to a vector. The same text then says the two-form flux picture remains "as its dual." That conclusion does not follow: the 4D Hodge star maps degree 3 to degree 1, not degree 2. A separate contraction with a specified vector field, spatial Hodge map, or independent sweep construction would be needed. None is defined in the cited passage.

## 6. Mathematical type and support audit

Under the standard Poincare-dual form convention on an oriented four-dimensional manifold:

~~~text
degree(PD(S^d)) = 4 - dim(S)
Hodge star: Omega^p(M) -> Omega^(4-p)(M)
~~~

| Carrier | Support dimension | Poincare-dual form degree |
|---|---:|---:|
| Worldline / centerline gamma | 1 | 3 |
| Swept worldsheet S | 2 | 2 |
| Tube boundary / shell | 3 | 1 |
| Full-dimensional finite-core region C | 4 | 0 |

Important distinctions:

- A tangent k-vector current on a k-dimensional support has component rank k. A Poincare-dual form for the same support has degree 4-k. Equal component rank does not identify equal support.
- A three-form can represent the Poincare dual of a one-dimensional worldline.
- A two-form can represent the Poincare dual of a two-dimensional worldsheet.
- A genuine independent one-parameter sweep F: gamma x I -> S can raise support dimension from one to two and lower the Poincare-dual degree from three to two. This is a change of carrier, not Hodge duality.
- The full finite-core region is four-dimensional; its Poincare dual is degree zero. Its three-dimensional boundary has degree-one dual. The centerline and finite core must not share one undifferentiated "filament current" label.
- For a two-form J_2, nabla_mu J^mu nu = 0 is co-closure. If J_2 itself is the Poincare dual of a boundaryless worldsheet, the natural current condition is closure dJ_2 = 0. The divergence equation can instead describe the Hodge-dual flux (*PD(worldsheet)); the source must state which convention it uses.
- The algebraic contraction i_u J_3 lowers form degree, but it does not by itself construct a swept two-dimensional support. It needs a defined u and slice/pullback convention; a sweep map is a separate operation.

Candidate map architecture:

~~~text
gamma^1 --PD--> J_3 --4D Hodge star--> j_1
   |
   | independent sweep F(gamma x I -> S^2)
   v
S^2 --PD--> J_2

gamma^1 --normal-bundle thickening--> C^4 --PD--> scalar support
C^4 boundary = B^3 --PD--> J_1

timesheet Sigma^3:
gamma^1 intersect Sigma^3 -> point
S^2 intersect Sigma^3 -> curve
C^4 intersect Sigma^3 -> 3D mouth
B^3 intersect Sigma^3 -> 2D boundary
~~~

These are candidate standard-geometric maps and dimension checks, not assertions that SAT has adopted each object. The sweep, thickening, time-front interaction and observation maps still require source definitions and conditions.

## 7. Existing Lean proof gate: actual CI status

Existing PR #1098, branch research/sable-current-support-degree-gate-20261030t0736z, head 0ec8aa7d32c67cc1a03a8b887b89ec1acbe6ab15, contains SableCurrentSupportDegreeGate.lean, blob 1a4d15a8ca4ed7e9f106ff0761eab00c4d890ac0.

The module explicitly separates tangent-current rank, Poincare-dual form degree, Hodge degree, conditional sweep degree, and transverse hypersurface intersection. It includes:

- line_poincare_dual_is_three_form
- worldsheet_poincare_dual_is_two_form
- hodge_dual_of_three_form_has_degree_one
- hodge_dual_of_three_form_is_not_two_form
- swept_worldline_has_two_form_poincare_dual
- hodge_and_sweep_are_distinct
- same_rank_different_support

The module itself states that it does not construct a smooth flow, prove immersion/transversality, construct distributional currents, establish a push-forward/suspension operator, prove conservation, choose a metric/signature, or establish a SAT physical identification.

Actual CI run #41030392006 / job #123978468038 FAILED. The failure is in boundary_raises_poincare_dual_degree_by_one: the theorem supplies k >= 1 but not k <= 4, so Nat subtraction is not bounded as required. The failed declaration carries sorryAx in the diagnostic output. Other relevant degree declarations emitted only standard dependencies, but the overall module did not complete successfully. No successful full-module compile is claimed.

No local lean, lake or elan executable is installed in this runtime. No new Lean code, branch or PR was created. The existing CI is actual execution evidence, but not a successful full build. Lean checks only the formalized degree bookkeeping, not the source translation or physical premises.

## 8. Discrepancy ledger

| ID | Historical statement | Finding | Status |
|---|---|---|---|
| G1 | Nathan 2024: 1D strings intersect a moving 3D time surface | Direct geometry; no form rank | AUTHENTICATED USER MESSAGE |
| G2 | Nathan 2026: electron is a single-coil worldline/tube | Direct correction; no form rank | AUTHENTICATED USER MESSAGE |
| G3 | One-Action transcript uses J_2 | Provisional integration; surrounding user text says incomplete | DIRECT CONTEXT, EMBEDDED EQUATION AUTHORSHIP NOT SEPARATELY PROVED |
| G4 | Page One calls for J_3 then later J_2 | Same unbylined pasted document, no map | USER-ROLE PASTE, EMBEDDED AUTHOR UNKNOWN |
| G5 | WB516 calls J_2 the dual of J_3 | 4D Hodge degree mismatch | ASSISTANT/NLM-DERIVED CLAIM, INVALID AS WRITTEN |
| G6 | WB4 defines J_2 from a vector with epsilon and one free index | Tensor-rank mismatch | ASSISTANT/NLM-DERIVED EQUATION, ILL-TYPED |
| G7 | SATOBLOCK_inputs calls J_2 definitive | NotebookLM source guide, not primary | SECONDARY SYNTHESIS |
| G8 | J_3 represents the full finite-core tube | Not under Poincare-dual convention; full 4D support has degree zero | UNJUSTIFIED IDENTIFICATION |

## 9. Mersearch status and source limits

No new Mersearch request was opened; the four shared lanes were occupied.

- Page One lane 3: request enheduanna-page-one-origin-20261031-0100; manifest blob dcaf63a8e9d770afec3d067d15dba08243e51304; receipt JSON ccd9599a407495bf6bd80b079557d89e14f251aa; receipt Markdown e1fa022458fe33945dd36435877c81d5f1605d03. Coverage 15,780 files / 20,828,714 records / 1,585 hits / 298 paths. Raw results withheld. The 24 displayed top-source paths collapse to 12 locators; the Page One UUID appears in five paths, with at least one byte-identical pair. This is path redundancy, not five independent sources.
- SAT-O/worldline lane 4: request alberr-sat-o-worldline-timesheet-interbraid-20261030-1212; manifest blob 15dc51969036c07aee88a837b0c048244a9d7a6f; receipt Markdown 5d3e2ba13c6959974c954dc0cf2c133a0e9d9c85. Coverage 15,592 files / 20,809,012 records / 3,276 hits / 444 paths. Raw results withheld.

The compact receipts are navigation aids, not exhaustive source reads, authorship evidence, or proof of first occurrence.

## 10. Next cursor and ownership

1. Morrow may optionally perform archive-provenance work only: locate any earlier standalone/bylined source for Page One and Wanna Bounce, and determine whether the embedded text can be traced to a distinct original. Preserve Morrow's Team Archivist remit, theory freeze and separate training boundary. No theory integration, prediction, paper drafting or Lean assignment.
2. Sable retains ownership of PR #1098. The formalization repair is to bound the boundary theorem with k <= 4 (or encode its domain explicitly), then rerun the existing CI and inspect all theorem-specific axioms. Tern did not edit the PR.
3. Nathan Direct resolution remains open: is J_2 intended as a two-dimensional swept-worldsheet current, a Hodge-dual flux representation, or a separate Blockwave field? The answer requires an explicit support map, metric/foliation convention, and conservation law.
4. Do not promote either rank to BEDROCK. Do not infer a physical prediction. No CODATA scoring, measured-data calculation, or data-free numerical calculation was performed.

**Disposition:** a source-fidelity conflict and two assistant-side tensor/form-degree errors are now precisely located. The mathematical bookkeeping is partially formalized in an existing failed CI run. The final physical current ontology remains unresolved.
