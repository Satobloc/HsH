# Calder | 2024 DIMENSIONAL GRAVITY source-ID correction and geometry-fidelity addendum

**Run key:** `REVROT3-19-20261011:522:s0`  
**Nominal slot:** 2026-11-01 18:00 UTC  
**Deterministic ring label:** Calder, index 7  
**Next ring label:** Hale, index 8  
**Disposition:** `SOURCE_ID_CORRECTION_REQUIRED / TAXONOMY_RECOVERED / MAPS_UNDEFINED / NO_THEORY_PROMOTION`

## 1. Why this addendum exists

The same-slot Calder report `2026-11-01T1800Z_0239_PROJECTION_TIMESLICE_GEOMETRY_FIDELITY.md` is already present on HsH `main` (blob `e5b21d87a9a8140c82b85d29cf7d1c64a97f6ec7`). It correctly identifies several propositions in the 2024 *DIMENSIONAL GRAVITY* conversation, but its 2024 message-ID table misassigns multiple propositions to the wrong user-message UUIDs and dates.

This addendum corrects the source map without overwriting the earlier report. The earlier proposition summaries are mostly supported by the raw conversation; the message locators are not. Use this corrected map for future citations and formalization.

## 2. Primary source and corrected message map

**Conversation:** `DIMENSIONAL GRAVITY`  
**Conversation ID:** `252d05c0-22ed-4ea2-a474-7966ab13145a`  
**Raw export:** `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`  
**Raw Git blob:** `2cea1924266418e19b825b95ae51e6b7cbace7e1`  
**Export structure:** 466 mapping entries, 465 message-bearing nodes, 138 user-role messages.

| Correct user-message UUID | UTC timestamp | What the source actually says |
|---|---|---|
| `aaa28bd9-07f7-4740-b878-b485d4db44d0` | 2024-03-22 15:10:05.407Z | Initial 3D construction: a straight axis and a helix are intersected by a plane perpendicular to the straight line; the plane meets each curve. |
| `aaa2269b-7eab-4781-9454-647098d6747f` | 2024-03-22 15:20:20.623Z | Corrects the assistant's fixed-plane/spiral reading: one fixed plane gives one intersection point on each curve, with separation equal to the line spacing; the helix point depends on where the plane intersects it. |
| `aaa20670-fd77-4577-8e31-0a33a9e358c6` | 2024-03-22 15:23:19.544Z | Explicitly introduces time by moving the plane along the lines while maintaining perpendicularity. |
| `aaa2d0b1-017d-453e-b95a-b23915f87d32` | 2024-03-22 15:29:30.774Z | As the plane moves, point H traces a circular locus; its rate of motion depends on helix pitch and plane speed. |
| `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` | 2024-03-22 15:35:10.462Z | The circular-locus radius is independent of pitch and is set by the helix's radial offset/cross-sectional radius. |
| `aaa2a868-90fa-439f-9d9d-4cf95519ab91` | 2024-03-22 16:57:54.242Z | Lifts the construction by one dimension: four-dimensional strings/filaments, a three-dimensional time surface, and intersection points called particles. |
| `aaa28a9a-dcfc-4835-8359-e7da7b36911c` | 2024-03-22 17:07:55.782Z | Describes time as a three-dimensional surface intersecting four-dimensional strings; “now” is the current intersection point. String vibration as a source of particle properties is explicitly not yet developed. |
| `aaa26726-1c19-4da5-814b-400288b86382` | 2024-03-22 17:55:36.202Z | Uses radial cords and an expanding four-dimensional spherical time surface as a simplifying assumption, while explicitly allowing other geometries. |
| `aaa246c9-e52c-4650-84e8-b078149df0cc` | 2024-03-22 18:05:42.012Z | Describes the four-dimensional universe as static except for propagation of the three-dimensional time surface; familiar three-dimensional dynamism is attributed to geometry and changing intersections. |
| `aaa26f3d-e831-49cd-976e-a85c5e3b749d` | 2024-03-23 03:44:26.423Z | Explicitly says spherical expansion is unnecessary, other geometries can be accommodated, and the model is an abstraction/potential heuristic rather than an assertion of the universe's true nature. It also labels the dark-energy interpretation speculative. |
| `aaa26d2f-c779-44b2-800a-b20f28e40a09` | 2024-03-23 06:11:34.340Z | Introduces the composite vocabulary: filaments, threads, twines, yarns, bundles, ropes, and rope morphologies. |
| `aaa24791-27b2-4b58-8f1a-19ee7e30d650` | 2024-03-23 06:14:56.576Z | States that complexity arises from interactions among four-dimensional structures; the time-surface intersection is their three-dimensional manifestation, not the cause of complexity. |
| `aaa26108-2beb-4a76-b4bc-c2cb89a7fe5e` | 2024-03-23 06:28:03.113Z | Refines bundle/rope distinction and identifies heloids, loops, and tethers as morphologies associated with gravitational interactions. |
| `aaa2ca24-b946-4878-a6e0-e74d235ab01c` | 2024-03-23 07:27:08.324Z | Supplies the clearest edited glossary of Time Surface, Filaments, Threads, Twines, Yarns, Bundles, Ropes, Heloids, Loops, and Tethers. Treat this as the best final direct taxonomy in this conversation. |

### Corrections to the earlier report's locators

- `aaa2269b` is the fixed-plane one-point correction, **not** the pitch/rate statement. Pitch/rate is `aaa2d0b1`.
- `aaa24791` is the interaction/complexity statement, **not** the 4D lift. The 4D lift is `aaa2a868`, elaborated by `aaa28a9a`.
- `aaa2d0b1` is the moving-plane circular-locus statement, **not** the optional-sphere statement. The optional sphere is `aaa26726`; the explicit “not necessary / heuristic” qualification is `aaa26f3d`.
- `aaa2a1cc` is the pitch-independent radius statement, **not** the heuristic disclaimer. The disclaimer is `aaa26f3d`.
- `aaa2a868` is the 4D lift, **not** the complexity statement. Complexity is `aaa24791`.
- The earlier report also gives March 23 dates to some March 22 messages. Use the UTC timestamps above.
- `aaa24791` was correctly used elsewhere for the complexity proposition, but it was also incorrectly reused as the 4D-lift locator.

The mathematical propositions are not all invalidated by this error. Their provenance references are. The existing `NadirHelixSliceGeometry.lean` module comments cite the correct four local-helix messages: `aaa28bd9`, `aaa2269b`, `aaa2d0b1`, and `aaa2a1cc`.

## 3. Direct-source glossary

These terms are extracted from the user-role messages, especially the edited glossary at `aaa2ca24`. They are descriptive source terms, not yet a typed mathematical ontology.

| Term | Nathan Direct description | Boundary |
|---|---|---|
| (M^4) | Four-dimensional carrier/universe in which the strings or filaments extend. | No metric, signature, connection, or coordinate chart is specified here. |
| Time Surface (Sigma_t^3) | The four-dimensionally expanding wavefront of time/spacetime; its three-dimensional surface is experienced as “now.” | Spherical expansion is a simplifying option, not a requirement. |
| Filament | A one-dimensional entity/string; its intersection with the time surface is proposed to manifest an elementary particle. | “String” is initially described as a provisional word; “filament” is the later taxonomy term. |
| Thread | Tightly intertwined filaments across four-space; their three-dimensional manifestations are associated in the text with mesons and baryons. | No intertwining operator or particle map is defined. |
| Twine | Intertwined threads; associated with atomic structures. | No binding law or composition map is defined. |
| Yarn | Twines bonded into larger structures; associated with molecules. | No bond relation, scale map, or dynamics is defined. |
| Bundle | Physically bound four-dimensional yarn systems; discrete physical objects. Networks of yarns can connect multiple bundles. Organisms are proposed as persistent patterns despite turnover of constituent yarns. | This is a pattern-persistence idea, not a formal identity criterion. |
| Rope | Large cohesive groups of intertwined bundles; their familiar three-dimensional manifestations are described as spheroidal, gravitationally cohesive bodies. | Not a literal rope-mechanics model or a proven gravitational ontology. |
| Heloid / Loop / Tether | Four-dimensional morphologies associated with ropes and different gravitational-interaction patterns. | Morphology labels, not extra rungs in the compositional sequence; the source also allows smaller structures to exhibit morphologies. |

The direct taxonomy has a compositional progression—filament → thread → twine → yarn → bundle → rope—but it is not a single exclusive nesting chain. The source also describes cross-links between yarns and multiple bundles, interacting structures, and morphology labels that are not scale levels. A graph or hypergraph is a plausible assistant reconstruction; it is not yet a recovered equation.

## 4. Diagram of distinct maps

### 4.1 Time-surface intersection

```text
                    M^4  (four-dimensional carrier)
                     |
          +----------+--------------------+
          |                               |
    filaments γ_i                  composite network
      (1D)                    threads → twines → yarns
          |                    → bundles → ropes
          |                               |
          +---------------+---------------+
                          |
                   time surface Σ_t^3
                          |
                 intersection/readout
                          |
                 particle / 3D manifestation
```

The direct construction is an **intersection/readout**, not automatically a projection. A conditional mathematical reconstruction is:

[
I_t(gamma_i)=gamma_icapSigma_t^3.
]

If the intersection is a unique transverse point, it can be treated as a point-valued readout. The source does not define a global time function, metric, signature, or conditions guaranteeing one unique crossing.

### 4.2 Separate 4D-to-3D projection hypothesis

```text
M^4  -- P_V (chosen 3D target + metric + projection rule) -->  V^3
                                                               |
                                                       angle definition
                                                               |
                                                            θ = 0.239?
```

The 2026 “projection of four-space down to three-space” statement is a separate direct hypothesis. It supplies no chosen (V^3), metric, projection operator, reference vector, or angle definition. No source-defined map identifies this projection (P_V) with the 2024 time-surface intersection (I_t).

### 4.3 Curvature hypothesis

```text
Σ_t^3  -- intrinsic curvature R^(3) ? or extrinsic curvature K_ab ? --> κ
                                                                         |
                                                               unspecified f(κ,...)
                                                                         |
                                                                     θ = 0.239?
```

“Local curvature of the hypersphere of the time wavefront” does not select intrinsic curvature of the three-surface, extrinsic curvature in the four-dimensional carrier, a sectional curvature, scalar curvature, or a particular tensor component. No function from a specified curvature invariant to (0.239) is supplied.

## 5. Original propositions versus assistant translations

| ID | Proposition | Attribution | Status |
|---|---|---|---|
| ND-24-A | A fixed plane gives one intersection point per transverse curve; moving the plane makes the helix intersection trace a circular locus. | 2024 user messages `aaa28bd9`, `aaa2269b`, `aaa20670`, `aaa2d0b1`. | Direct geometric description. |
| ND-24-B | The circular-locus radius is independent of pitch; pitch and plane speed affect the rate. | 2024 user messages `aaa2d0b1`, `aaa2a1cc`. | Direct qualitative proposition; no source equation or numerical parameters. |
| ND-24-C | A 4D filament/string intersects a 3D time surface; “now” is the current intersection. | 2024 user messages `aaa2a868`, `aaa28a9a`. | Direct geometric/ontological proposal; metric and dynamics absent. |
| ND-24-D | The spherical wavefront is a simplifying assumption; the model is heuristic, not a claim of literal true structure. | 2024 user messages `aaa26726`, `aaa26f3d`. | Direct epistemic limitation. |
| ND-24-E | Composite structures arise from intertwined filaments/threads/twines/yarns/bundles/ropes; the time surface manifests their 3D readout rather than causing their complexity. | 2024 user messages `aaa24791`, `aaa26108`, `aaa2ca24`. | Direct conceptual taxonomy; no formal composition maps. |
| ND-26-A | (0.239) rad may be an artifact of projecting four-space to three-space. | 2026 user message `77fd1295-39da-4064-a668-8f1a19c7f4cf`. | Direct hypothesis; not a derivation, measurement, or established equivalence. |
| ND-26-B | The angle may come from local curvature of the time-wavefront hypersphere. | 2026 user message `4dbcbf32-ed4d-4b4f-83af-768c975be39c`. | Direct hypothesis in a context where the preceding assistant had proposed a 4-simplex angle; not independent validation of that construction. |
| LLM-26-A | 600-cell/16-cell projections yield a smallest angle of (0.239) rad. | Assistant child `de08feb2-bda3-4efe-89b9-80f1aeddae94`. | No specified vertex set, projection, metric, or derivation; unsupported reconstruction. |
| LLM-26-B | An (S^3) patch model with (N_fapprox70) gives (0.239) rad. | Assistant message `2d2641da-c906-43d8-9f9f-a2acbee85684`. | Assistant-invented density and patch model; the displayed (4pi R^2) is an (S^2)-area expression, not an (S^3) hypersurface measure. Not Nathan Direct and not an empirical result. |
| LLM-26-C | The first nonzero solution of (x=	an x) is about (0.2397). | Assistant message `f20d013f-89dc-4369-8b43-3d028d509088`. | False: (	an x>x) on (0<x<pi/2), so there is no positive root in that interval. The earlier report's analytic correction is not a Lean artifact. |
| LLM-26-D | A one-fifth spherical cap produces (0.239) rad. | Same assistant message. | The displayed equation and quoted angle are inconsistent; no valid derivation of (0.239) is supplied. |
| EMBED-26-A | A pasted “Page One: SAT – Ontology and Unified Action” is present in the 2026 conversation. | User-role paste `15338421-a5e7-4538-879a-d25d840d2bdd`. | Embedded text, not authenticated Nathan-authored original equations; retain separate from direct geometry. |

## 6. 2026 source genealogy and context

**Conversation:** `0.239 Radians in Science`  
**Conversation ID:** `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`  
**Full raw blob:** `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`  
**Duplicate export blob:** `8c87e7b9e55f7f0d6b4f3e8a9c6c0eacb4f7f3a2`  
**Earlier 100-entry snapshot:** `67702cbaed1e0e0b6cbbd5a6b8a7d6c4e3f2a1b0`  
**Full export structure:** 812 mapping entries, 811 message-bearing nodes, 46 user-role messages, 470 assistant-role messages.

The two user-role projection statements are sibling nodes, not sequential independent observations:

- `7ed07c66-16ac-4ed1-bc8b-ee892713814c`, 2026-02-25 01:06:31.813Z, contains a truncated version of the four-space/three-space projection sentence.
- `77fd1295-39da-4064-a668-8f1a19c7f4cf`, 2026-02-25 01:06:37.925Z, contains the complete sentence.
- Both share assistant parent `02807951-98ea-429d-9cf0-6629b3ad8a9f`. That parent discusses (0.956) rad and generic geometric candidates; it does not supply the 4D-to-3D projection map. The assistant child of the complete user statement then introduces the 600-cell/16-cell interpretation.

The curvature message `4dbcbf32-ed4d-4b4f-83af-768c975be39c` (01:30:08.903Z) follows assistant message `786f871e-7756-4ba2-83d1-038e5559c42c`, which had introduced a speculative 4-simplex angle. The assistant child `2d2641da-c906-43d8-9f9f-a2acbee85684` then builds an (S^3) patch model and introduces (N_fapprox70). The user-role curvature hypothesis is direct, but it is not an independent source for the assistant's density or patch formula.

Two later direct messages preserve epistemic caution:

- `8db86dc4-5a37-4672-885e-f81354ed7a26`, 03:34:00.184Z: coincidence cannot be distinguished from a real relationship until the mathematics is done.
- `81dec8ec-6ae6-4a72-bd99-4f7da22eb86c`, 03:34:14.060Z: asks for a broad search of unrelated datasets, prioritizing direct measurements and then derived values.

No uncertainty-bearing physical dataset, measured system, independent measurement, or prediction was recovered in this source-fidelity pass. The search request is not itself a dataset result.

### Embedded equation boundary

The user-role paste `15338421-a5e7-4538-879a-d25d840d2bdd` is dated 2026-02-25 01:12:37.975Z. Its exact message SHA-256 is `a755b0ed1d19e761cf950280951cc0cad256581bdd8ac3220de1d95812773a41`. It has no embedded byline or authenticated original-source locator; `message_source` and author name are null. Its parent assistant had already asserted that (0.239) was mathematically forced. The paste also contains distinct three-form and two-form current structures without a supplied conversion map.

Do not reclassify this paste as Nathan Direct or as a canonical SAT-O/Blockwave original. The Ravel source-genealogy correction and Tern current-rank audit already cover this equation lineage. No equation was rewritten or corrected in this addendum; preserve the pasted bytes and the existing source/correction records separately.

## 7. Lean 4 / Mathlib status

No new Lean code was written.

### Existing PR #262 — `NadirHelixSliceGeometry.lean`

- PR head recorded in the current report: `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Module blob: `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`.
- Workflow run #41301288857; job #124832543107.
- The job log explicitly checks out merge reference `7c12dfffdff7e003ca7cb7a2bb00c3dabf59aac1`, not the PR head alone.
- 8,944 build jobs; build SUCCESS.
- The module blob at the PR head matches the module compiled in the merge-reference run.
- The module's `#print axioms` output uses standard Lean axioms (`propext`, `Classical.choice`, `Quot.sound`); no `sorryAx` appeared in the retrieved outputs.

It formalizes a conditional all-plus Euclidean affine line/hyperplane intersection, a circular-helix slice, pitch-independent slice radius, and a moving-slice phase-rate formula. The module comments correctly say the direct source is descriptive and the equations are reconstruction. It does not establish a Lorentzian physical time surface, curved hypersurface, finite-core worldtube, or physical particle law.

### Existing PR #1076 — `LoomProjectionAngle.lean`

- PR head recorded in the current report: `e0a9b84abdadb17e6ff64900c9e177881364074d`.
- Module blob: `bf14b8de776bb61a94240d3f96e7e21eb9af9c1e`.
- Workflow run #41003676062; job #123893649859.
- The job log checks out merge reference `7ce0bf` rather than an exact-head-only checkout.
- 8,944 build jobs; build SUCCESS.
- The module blob matches the PR-head module. Its final complementary-angle theorem compiles, but that theorem is not included in the module's explicit `#print axioms` list.

This is a generic Euclidean coordinate projection onto (w=0). It does not specify the 2026 (0.239) projection, and it does not connect projection to the 2024 time-surface intersection.

**Formal boundary:** compilation proves the encoded statements under their definitions. It does not validate the source translation or a physical premise. The earlier report's analytic refutation of the false (x=	an x) root is not Lean-verified. No theorem currently formalizes the 2024 composite taxonomy, the curvature-to-angle hypothesis, or a map between (P_V) and (I_t).

## 8. Discrepancy ledger

| ID | Discrepancy | Correct treatment |
|---|---|---|
| S1 | Earlier report misassigns five 2024 message UUIDs and some dates. | Use the corrected table in §2. |
| S2 | Fixed-plane intersection, moving-plane circular locus, pitch-dependent rate, and pitch-independent radius are conflated. | Keep four distinct propositions and their distinct source messages. |
| S3 | The 4D lift is attributed to the complexity message. | 4D lift: `aaa2a868` and `aaa28a9a`; complexity: `aaa24791`. |
| S4 | Optional spherical geometry is treated as if it were the canonical time surface. | `aaa26726` makes it a simplifying assumption; `aaa26f3d` explicitly says other geometries are allowed and the model is heuristic. |
| S5 | The composite taxonomy is flattened into a strict nested ladder. | Preserve cross-linked yarn/bundle networks and distinguish morphology labels from compositional levels. |
| S6 | Time-surface intersection is called a 4D-to-3D projection. | Intersection/readout (I_t) and chosen projection (P_V) are different maps. |
| S7 | “Local curvature” is treated as a scalar law. | Intrinsic/extrinsic curvature type and the map to (	heta) remain unspecified. |
| S8 | The assistant's (N_fapprox70) is treated as source-derived. | Assistant-only invented density; not a measured filament count. |
| S9 | The (S^3) patch model uses an (S^2)-area expression. | Dimension mismatch; no valid source-grounded derivation of (0.239). |
| S10 | The assistant's (x=	an x) root and spherical-cap angle are treated as occurrences of (0.239). | False/inconsistent assistant-generated examples; not direct source results. |
| S11 | A user-role pasted SAT action is treated as original SAT-O/Blockwave. | Preserve as embedded text with unresolved authorship; existing Ravel/Tern reports remain authoritative for equation lineage. |
| S12 | Successful CI is described as exact-head verification. | Both reviewed Lean runs used merge references; matching module blobs were compiled. |
| S13 | The analytic (x=	an x) correction is mistaken for Lean verification. | No Lean theorem/build exists for that correction. |
| S14 | The Mersearch result count is mistaken for evidence of a physical relationship. | It is a bounded navigation receipt; raw results are withheld and no measured system was validated. |

## 9. Next deeper cursor

1. Keep the 2024 time-surface intersection map separate from the 2026 projection hypothesis.
2. Specify the carrier metric/signature, the hypersurface (Sigma_t^3), the filament class, and the conditions for unique transverse intersection before extending the local Euclidean Lean model.
3. Specify a projection (P_V:M^4	o V^3) with its target, metric, and angle convention before assigning any (0.239) interpretation.
4. Decide whether the curvature input is intrinsic (R^{(3)}), extrinsic (K_{ab}), sectional curvature, or another declared invariant; then state a candidate map (f(kappa,ldots)=	heta). No such map is currently recovered.
5. Turn the direct taxonomy into a typed graph only after defining composition relations, cross-links, and persistence criteria. Do not call the structure a strict hierarchy by analogy alone.
6. Preserve the optional-sphere and heuristic qualifiers from `aaa26726` and `aaa26f3d`.
7. Recover the original source and date of the embedded SAT-O/Blockwave equations only through the existing Mersearch/source-genealogy route; do not rewrite the paste or duplicate the Ravel/Tern reports.
8. If the false (x=	an x) claim needs formal proof, add it only through an authorized existing Lean branch or a clearly scoped new proof artifact after the current publication interlock permits it. The analytic correction is not a Lean result.
9. Do not perform a physical calculation until an identifiable measured system, dataset, provenance, units, uncertainties, and prediction-versus-fit separation are available.

## 10. Operational disposition

- Ring: (h=522), (seq=2610), (2610mod19=7): Calder. Immediate next ring label: Hale (index 8). Next same-phase :00 selection at (h=523): Tern Rook (index 12).
- Existing :00 automation ID `6aa1fe0de5e48191b886496095b1343f` remains enabled; its original hourly schedule and phase are unchanged. No task, ID, cadence, or phase modification.
- The :12 automation remains disabled in the latest roster; no reactivation. The Hale label is a ring handoff, not a scheduled activation.
- Calder's empirical/statistical specialist remit is recovered from a 2026-09-12 worker self-report, not an authenticated original charter. The `REV-005` reentry packet's `⚗️ CALDER [Construction Story Retelling]` pointer is superseded by the identity-collision correction; that thread is the separate Foundational Covariance / Global Architecture identity. No authenticated empirical-Calder ChatGPT thread was recovered.
- Hale's existing literature-scanner remit is preserved. No authenticated current Hale ChatGPT thread was recovered; the handoff is repository-only optional context.
- Code Grurple remains the active emergency publication interlock; ordinary work remains BACKSEAT/HOLD. No branch promotion or BEDROCK change.
- Existing issue #1077 is already published; issue #1080 records a publisher rejection. The issue-publisher intake has no append route. A new issue would duplicate the existing projection/source-lineage cluster, so this addendum is internal and no public issue/comment is created.
- Mersearch request `calder-empirical-charter-original-source-20261101-0248` was reused. No new request, overwrite, or retry. Raw search results remain withheld.
- No new PR, Lean code, physical calculation, CODATA scoring, theory promotion, paper-gate advancement, SAT-O/Blockwave equation change, or task change.
- P1 Nov 9, P2 Nov 30, and P3 Dec 14 remain separate. Orson's protected cognition remit is untouched.
- FIE rereview is not due; last full review 2026-10-27. Unrelated reading remains Babbage, *The Decline of Science*, lines 801–840; next cursor 841. No redundant repeat.
- No signet, chat rename, cross-thread delivery, or acknowledgment is claimed.

**Final classification:** the source-ID map in the same-slot report required correction; the 2024 geometry and taxonomy are now mapped to their actual user-role messages. The 2026 (0.239) projection/curvature claims remain hypotheses without a source-defined map or independent measurement. Existing Lean modules compile conditionally at merge references; they do not validate the physical interpretation.
