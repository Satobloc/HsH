# Geometry-fidelity addendum: common-ancestor, candidate-path, and Q-wrt-R targets

Date: 2026-11-09
Status: SOURCE-FIDELITY CROSSWALK / NO NEW PHYSICAL CLAIM / NO THEORY PROMOTION
Scope: Read-only comparison of primary user-role messages, a Nathan-identified source document, historical assistant translations, and existing Whirligig/Lean artifacts. Claimed mathematics was bracketed except where an existing formal proof or explicit type distinction was relevant. No CODATA scoring.

This is a narrow additive crosswalk to issues #955, #1392, and #1430. It does not repeat the R/Q common-anchor incompatibility, the Core Pack / 4D-superhelix audit, or the June 23 Donut-as-representation audit. The new point is that the archive contains three differently typed targets which should not be silently merged.

## 1. Source custody and attribution

### April 21, 2026: raw role-tagged "Curve Composition System"

- Repository/file: SAT_THEORY_ARCHIVE_2023-25 / Curve Composition System -- raw.json
- Git blob SHA-1: e9ec2076ca5313676f5806db1c48b51511302b7d
- Conversation ID: 69e77d92-f0c4-83ea-9f1c-983ff5c102d3
- Conversation creation: 2026-04-21 13:41:54.196Z
- 98 user-role messages.

Relevant direct user witnesses:

| UTC | Message ID | Source-level content |
|---|---|---|
| 13:41:53.734 | 2a3583e9-ec1e-4849-b487-5145630d9c86 | Two equations are each represented by a solution curve; a composite curve is traced on a torus by a sphere/gimbal arrangement; the output is described as a derivative of both inputs. |
| 14:03:17.724 | 8d3a5081-586f-4f88-9506-8c571100e107 | Choice of rolling path is allowed; closure is sought by arranging common crossings. |
| 14:35:14.030 | 2142cc5b-8a4c-46e4-9ba7-6e8deeaf0e49 | A hollow grooved sphere, gimbal/crossbar, and physical torus are described; the apparatus may have multiple valid outputs and need not have a unique output. |
| 14:44:14.889 / 14:44:28.493 | 81db97ad-2c6c-4970-8d16-319b6d8cc9ab / ce423977-fefa-48fc-af35-957b748ca5c4 | The target is restated as a common equation from which both input equations can be derived. |
| 14:48:37.156 | 9f6a062e-11b0-4c32-83fc-18bdb9a5bae1 | A single curve is preferred if transformations retain a precise isomorphism to the original equation. |
| 16:24:45.917 | 62a3cd8a-b6c7-4383-b95a-e404106de361 | The sphere/torus are described as artificial phase spaces constraining the search to broadly allowable solutions; the target is any valid derivative path, if properly constructed. |
| 16:49:04.580 | e6955b42-2d2a-4396-9f23-d69419f26d45 | The user states an observability argument and identifies a 4D Nth-order superhelix as the preferred language for particle-path descriptions. This is a philosophical/physical premise, not a demonstrated theorem. |
| 17:12:27.704 | ba9ce294-707b-4cdb-90c3-9dcdcccdf5a7 | The user rejects the assistant's argmin action as the SAT Lagrangian/physical description and specifies a 4D Nth-order superhelical curve equation. |
| 17:24:42.053 | bccda52d-8dc0-4c27-8567-e77a4ecdb29c | The UI is described as an artificial measurement/comparison space; the physical description is constrained to continuous particle worldlines and specified transformation classes. |

### June 23, 2026: raw role-tagged "SAT Overview"

- Repository/file: SAT_THEORY_ARCHIVE_2023-25 / SAT Overview -- raw.json
- Git blob SHA-1: 023ff77688672546aeff02deb3745289f6709c90
- Conversation ID: 6a3a279a-10cc-83ea-9abf-4fc1dab9fb55
- Conversation creation: 2026-06-23 06:28:44.124Z
- 221 user-role messages.

Relevant direct user witnesses:

| UTC | Message ID | Source-level content |
|---|---|---|
| 12:03:58.340 | 025057e3-ec0b-4ca4-a1dd-a3a3fe4fb7bc | Identifies "Finding the Donut" as the original formulation. |
| 12:15:12.026 | 6d035146-524e-4f58-aed1-7f0f253f7192 | Describes curve projection, composite closure, rejection of nonclosing candidates, and a minimization strategy; the exact cost functional is recalled tentatively, not supplied. |
| 12:18:27.256 | 638ba456-4aad-4ae5-b902-4204394ea076 | Calls the output a candidate equation on a derivation path; demonstrating that it really is a derivation is a separate step. |
| 12:20:37.874 | c4115122-1cb3-4d3d-98a7-7f28ad4562ed | Distinguishes a closed composite curve as a geometric proof from proving that the procedure itself is a prover. |
| 12:26:47.147 | 1047d5d1-9ed4-4bcd-a329-6fd4ace57dd6 | Makes information preservation a condition and explicitly notes that forcing closure may lose information. |
| 12:55:06.254 | 53f6f51a-0aaf-477e-ad60-b77215c4faa4 | Supplies the input and output curve equations reproduced below. |
| 13:47:59.607 | bb4a205b-7fa0-446c-a1c9-37bc9db05701 | States that the Donut is not part of SAT; it is a representational/search aid, while the rest of SAT supplies the physical interpretation. |

### Nathan-identified "Finding the Donut" document

- Extracted text: _AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt
- Extracted-text blob SHA-1: a788b5cc415f90de2d0382d3596ef07d68604687
- Pages 23-27 inspected.
- The June 23 user-role message identifies this document as the original formulation. The PDF itself has no raw message-role graph, so its detailed wording is Nathan-attributed, not independently role-authenticated line by line.
- Page 27 describes QwrtR as "the derivative of Q wrt R" and calls the apparatus a three-dimensional toy.
- The detailed PDF geometry includes R/Q curves, a common point i_r, equatorial point i_q, orthogonal axes, a Great Annulum, W_obble, W_iggle, vector V, torus contact points, and a traced Curvy_Lisa. This is a more specific formulation than the April 21 raw conversation; it must retain its own source status.

The assistant-produced "SAT 2026 WHIRLIGIG - Donut canon" (blob SHA-1 8f95b9174657617c9976ff76e17fd8ef36ad660c, 18,123 characters) is a composite reconstruction without a raw role graph. Its additional SO(3), holonomy, and other formal structures are not promoted to Nathan Direct.

## 2. Three target types, not one

The archive currently supports three distinct formulations:

1. Common-ancestor target, April 21: find H_common such that both E_A and E_B can be derived from it. This is a common-generator/ancestor relation.
2. Candidate-path target, June 23: construct a composite output E_star and then demonstrate that it lies on a derivation path between E_A and E_B. The source explicitly separates constructing the candidate from proving the derivation.
3. Q-wrt-R target, Nathan-identified PDF: QwrtR is described as a derivative of Q with respect to R. No differential operator, function space, parameter correspondence, or derivative rule is defined.

These may represent an evolving formulation, or different stages of one procedure. The archive does not contain an explicit supersession statement or maps proving their equivalence. They must remain versioned and separate until Nathan Direct specifies the intended relation.

### Explicit June 23 candidate equation

The raw user-role message 53f6f51a-0aaf-477e-ad60-b77215c4faa4 gives:

R(t) = (cos t, sin t)
Q(t) = (2 cos t, sin t)

C(t) = ((R + r cos Theta(t)) cos t,
        (R + r cos Theta(t)) sin t,
        r sin Theta(t))

Theta(t) = arccos((2 cos^2 t + sin^2 t + 1) /
                  (sqrt(2) * sqrt(4 cos^2 t + sin^2 t + 1)))

This is preserved verbatim as a candidate output. The source does not supply the derivation from the two input curves, a decoder, or a proof that this output is on the intended derivation path. The notation also overloads R: it denotes both the input curve R(t) and the unqualified radius R in the output. The role of r, the parameter domain, and the real-valuedness conditions for Theta are not fully specified in that raw message. No notation correction is applied here.

## 3. Typed glossary and mapping diagram

Local report labels only; none are new shared symbol-registry entries.

| Label | Intended type | Source status |
|---|---|---|
| E_A, E_B | Input equations | Directly stated; equation classes/domains unspecified |
| gamma_A, gamma_B | Selected solution curves | Directly intended; branch, parameter interval, and observables unspecified |
| S2 | Sphere / constrained representation surface | Direct source object; physical apparatus and artificial phase-space roles both appear |
| G | Groove/gimbal/crossbar coupling | Direct mechanical description; kinematic map incomplete |
| T2 | Torus surface / output carrier | Direct source object; contact and parameterization conditions incomplete |
| C | Composite curve | Directly named output; derivation status unproved |
| H_common | Common equation from which both inputs derive | April 21 target |
| E_star | Candidate equation on a derivation path | June 23 target |
| QwrtR | Q-with-respect-to-R relation | Nathan-identified PDF wording; operator not defined |
| L_SAT | Physical SAT Lagrangian/description | Direct April 21 correction: 4D Nth-order superhelical curve equation; not the Donut output |

Mapping diagram:

E_A -- select solution/branch --> gamma_A -- encode? --> curve_A on S2
E_B -- select solution/branch --> gamma_B -- encode? --> curve_B on S2
curve_A + curve_B -- groove/gimbal/sphere/torus procedure --> C on T2
C -- decoder/derivation witness not supplied --> E_star (candidate path equation)
E_star -- derivation witness not supplied --> E_A and/or E_B

Separate April 21 target:
H_common -- derivation map not supplied --> E_A
H_common -- derivation map not supplied --> E_B

Separate PDF target:
QwrtR = "derivative of Q wrt R" (operator and domain not supplied)

Separate physical SAT description:
L_SAT = 4D Nth-order superhelical curve equation
Donut apparatus != SAT physical ontology

## 4. Original propositions versus historical translations

| Source proposition | Historical assistant translation | Fidelity finding |
|---|---|---|
| Multiple outputs/pathways are acceptable; no a priori unique solution is required. | Assistant proposes a canonical map and later a canonical representative selected by a simplicity/minimization functional. | Adds uniqueness/canonicality not required by Nathan Direct. A deterministic selection rule may choose one candidate, but it is not the same as requiring one possible output. |
| April 21 asks for a common equation from which both inputs can be derived. | Assistant recasts the task as a product-space joint flow with projections and a common parent system. | Plausible reconstruction, not a source-defined derivation calculus. It needs typed maps and an explicit recoverability target. |
| June 23 calls the composite equation a candidate on a derivation path. | Historical reconstructions often treat the composite curve itself as the derivative/derivation result. | Closure and curve construction do not establish derivation. The direct source explicitly makes derivation a separate proof task. |
| PDF calls the result Q-wrt-R. | Later code and summaries sometimes treat this as a defined derivative operator. | No derivative operator, domain, parameter correspondence, or inverse is recovered. |
| Sphere, gimbal, and torus are a representation/search apparatus. | Assistant translates sphere and torus into two coordinate charts on one state space and replaces rolling with chart change. | Additional mathematical interpretation; not a faithful description of the separately described physical apparatus without a source-defined map. |
| Donut is not part of SAT. SAT's physical description is the 4D Nth-order superhelix. | Assistant turns the apparatus into a physical/variational ontology in some reconstructions. | Type/ontology conflation. The Donut is an instrument, not the SAT physical primitive. |

### Symmetric critique of Nathan Direct

- "Any equation" can be represented as a curve is broader than the source specification supports. A faithful encoder needs the equation class, solution branch, parameter interval, observable set, and equivalence relation. The current Whirligig README correctly warns that no universal faithful parameterization exists for arbitrary symbolic equations without these choices.
- The April 21 phrase "common equation from which both can be derived" is clear about direction but not about what "derive" means. No derivation calculus, map domains/codomains, or admissible transformations are specified.
- The June 23 claim that a closed composite curve is a proof is valid only for the geometric closure property being encoded. The user immediately distinguishes that from proving the Donut is a general-purpose prover; that qualification must remain attached.
- The information-preservation condition is local to the proposed encoder/decoder and target. It is not a universal information-conservation law. Closure can be achieved while losing distinctions unless the relevant equivalence classes and recoverability target are specified.
- The "infinite number of derivational pathways" statement remains a Nathan Direct hypothesis, not a theorem, until the derivation relation and allowed transformations are defined.

### Symmetric critique of assistant reconstructions

- The first assistant response introduces canonical mappings, product manifolds, vector fields, Lissajous flows, and projection dynamics before the input equation classes or maps are specified.
- A later response treats the sphere and torus as coordinate charts on one underlying state space. That is an optional representation proposal, not an extraction from the physical sphere/torus apparatus.
- The assistant's variational action argmin integral L_SAT ds was explicitly rejected by the user as the SAT Lagrangian/physical description. It must not be retained as Nathan Direct.
- A closed torus trace, a common ancestor equation, an intermediate candidate equation, and a derivative operator are different mathematical types. Historical summaries that use them interchangeably are not source-faithful.

## 5. Formalization and existing Lean verification

No new Lean module was created. The source does not yet define the actual encoder, target T, decoder, derivation relation, or admissible equivalence classes needed to instantiate a source-faithful theorem. The generic factorization condition in existing work is relevant but not an instantiation of the Donut.

Fresh exact-head verification of existing PRs:

| PR | Head SHA | Lean run | Result | Scope/limit |
|---|---|---:|---|---|
| #873 | 1971e3d58a28f7c6de5cf024039dbcedb133121c | #42153410233 | SUCCESS, 8,955 build jobs | Generic factorization/fiber-compatibility theorem. The run's head SHA matches the PR head, correcting the earlier #1430 description that treated it as merge-ref-only. |
| #811 | 37d33d29551deb4278d159efb0548826520e2737 | #40622766255 | SUCCESS, 8,945 jobs | Conditional torus-surface and vertical-displacement results; not a proof of the historical derivation path. |
| #633 | 92ec9eb0b3336b022f210f45a81d4170461e52b3 | #40409479006 | SUCCESS, 8,939 jobs | Generic product-projection limits; not the source-defined Donut map. |
| #844 | 466b969f9cd6a59dd8e1f193c348762940943102 | #40791410292 | SUCCESS, 8,944 jobs | Conditional antipodal/common-anchor statements for the encoded spherical adapter. |

PR #873's exact-head log reports:
- hallway_factorization_iff_fiber_compatibility: Classical.choice;
- hallway_factorization_unique: Quot.sound;
- hallway_factorization_exists_of_source_injective: Classical.choice.

The build succeeded under Lean 4.34.0 / Lake 5.0.0 with the recorded Mathlib revision. The separate axiom-audit step was skipped; theorem-specific #print axioms output is not a global axiom audit. These results prove the formalized conditional statements only. They do not establish source-to-formal translation fidelity, the existence of the actual Donut maps, physical premises, or empirical truth. No local Lean/Lake executable is installed in this runtime; the verified runs above are GitHub Actions runs.

The exact SAT-O1 and Blockwave originals, dates, and blob hashes remain preserved in issue #1430, section 5. No corrected SAT-O1 or Blockwave equation was produced here; no original was overwritten.

## 6. Existing tools, source routes, and boundaries

- Mersearch is not exposed as a callable tool in this runtime. All four shared request lanes are occupied, and no request-scoped run manifest or search receipt was present. No lane was overwritten or retriggered. GitHub search and direct raw-blob retrieval were used as an explicitly limited fallback, not represented as Mersearch results.
- The existing Math Hopper extractor and three-repository Actions pilot were checked. The implementation exists, but the end-to-end pilot is not recorded as verified. It was not run because the role-tagged raw JSON is the authoritative source for this task.
- Existing Whirligig code and documentation were reused. The older Python R/Q solver (outer-wall contact and a chosen great-circle approximation) and the current browser Analemma/inner-wall mechanism are separate implementations; neither is promoted to the historical Donut geometry or to a physical equivalence. Issue #955 already records the source/code common-anchor incompatibility.
- SciSpace is available as an existing research integration but was not needed for primary archive attribution. No new tool, dependency, paid service, fork, branch, or PR was created. Fork enumeration was not independently completed through the available connector, so no exhaustive "no forks" claim is made.
- HSH_RESOURCES was consulted only at its permitted root/index and historical-source surfaces; its PRIOR_ART directory and worker-private inboxes were not accessed.
- The WWRD climbing-rope mechanics remains a first-blush geometric heuristic only; no physical equivalence or map was asserted.

## 7. Next deeper cursor

1. Recover the raw role-tagged conversation/message UUIDs behind the Nathan-identified "Finding the Donut" pages 25-27 and the October 21 Analemma correction. Until then, retain the PDF's detailed geometry as attributed rather than role-authenticated.
2. Ask which target is intended to govern: QwrtR, H_common, or E_star. Do not silently collapse derivative, common ancestor, and intermediate candidate.
3. Specify the input equation class, solution branch, parameter intervals, encoding maps, gimbal/contact map, output type, decoder, derivation relation, admissible equivalence classes, and selection functional.
4. Only then instantiate the existing fiber-compatibility theorem in Lean and run exact-head CI. A proof of closure alone is not a proof of derivation.
5. Compare the Donut procedure with current HsH worldtube/timesheet geometry only through explicit projection and composition maps with stated conditions. No analogy-based equivalence.
6. Keep the historical SAT-O1 and Blockwave equations unchanged and separate from any proposed corrected equation.

No physical calculation, synthetic fixture, CODATA scoring, observational validation, or BEDROCK theory promotion is claimed.
