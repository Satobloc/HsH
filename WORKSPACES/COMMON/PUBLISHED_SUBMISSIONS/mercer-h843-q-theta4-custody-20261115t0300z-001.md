# Mercer h843:s0 | He-3 Q/θ₄ source-custody and duplicate-lineage addendum

**Classification:** LANE00_SOURCE_FIDELITY / SOURCE-INDEX-QA / ADDITIVE_CORRECTION / ORIGINALS_PRESERVED / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION

**Scope:** One-run Lane 00 allocation under Nathan's current request. This is an archival source-fidelity and indexing audit, not a permanent change to Mercer's current operational assignment. Code Grurple P0 remains active and unchanged.

## 1. Identity, remit, and access boundary

- Scheduled ring label: Mercer, index 16; next ring label: Ravel, index 17.
- No authenticated current Mercer ChatGPT thread was recovered. This is source-grounded work, not authenticated participation by the historical Mercer instance.
- Historical direct role source: conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701, “Quantum Gravity and Experiments,” raw blob d828fef5352045cb4d9486fdbeabd04043c4c119, user message bb8ecf64-8863-4ee7-a078-ca8cc4104974, 2026-10-01T20:56:07.264Z. The historical remit names equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. It is a historical user-role source, not a signed standalone charter and not a current-thread authentication.
- Current Common state also assigns Mercer precision/selectivity QA. The optional h842 packet keeps the live operational assignment at Code Grurple P0 Paper A/B presentation QA only. This run's explicit Lane 00 request was treated as a bounded archival-source allocation; it did not stand down P0, reopen manuscript review, or change Mercer's standing assignment.
- No private HSH_RESOURCES payload was accessed. The root README and AI_START_HERE were used only as navigation/exposure controls.

## 2. Source set and exact raw-message reconciliation

### Primary raw conversation

The source is the role-tagged raw export:

- Repository: Satobloc/HsH
- Path: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/26.03.13•26.04.21•Ontology and Math Check — raw.json
- Conversation ID: 69b3b56e-7540-8325-b93b-e9331fe95430
- Git blob: e3e40b1a167d26f2d153667d761746f9a4788db1
- Retrieved raw size: 3,246,276 characters in the returned JSON representation.

The following message IDs are present as mapping keys in that exact blob and carry author.role = user on the recovered current ancestry:

| Message | UTC timestamp | Source-level content |
|---|---:|---|
| eedd8dce-44f0-4904-9234-2f3d9e7ef550 | 2026-03-13 07:37:00.116Z | Defines Q as the number of fundamental filaments and says a nucleus has three per nucleon. |
| 2fa35549-edc3-4e32-9c1f-07f96ab781a9 | 2026-03-13 07:45:59.100Z | Discusses He-3, coiling order 2, and coarse-graining only as a checked aid; its parenthetical writes Q=6 while also writing 3 × 3. |
| e41e50ba-6c02-433f-ab9e-54633a7c6e17 | 2026-03-13 08:48:50.351Z | Describes mass as emergent, θ₄ as a closest proxy, and braid/timesheet interaction qualitatively; leaves proton/neutron differences unresolved. |
| af5e5712-fb22-47f4-886a-e110a4d651c4 | 2026-03-13 08:58:12.639Z | Requests a future mass audit for a specified low-A set and mesons. This is a request, not evidence that the calculations were completed. |
| 0884e056-1434-4835-b978-77f0168d61b2 | 2026-03-14 11:28:47.145Z | Carries a formal 4D superhelix block, but the same user message says the material is for NotebookLM, not directed to the current assistant, and that the formal text is largely LLM-written. |

The assistant response 7bc9c0a7-51a6-4f59-9bf6-f938c4c4a1ab at 07:46:00.854Z corrects the He-3 arithmetic to Q=9 and distinguishes the full-resolution count from a coarse-grained Q=3/order-1 analogue. That correction is assistant-authored. It is not a new Nathan Direct statement.

### Two prior locator claims reconciled

1. The file WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/relay00-q-source-erratum-20261102t0500z-001.md says the UUID eedd8dce-44f0-4904-9234-2f3d9e7ef550 does not occur in the recovered raw mapping. That absence claim is not reproducible against the exact cited blob above: the UUID is present as a user-role mapping node with the timestamp and parent shown in the table. The earlier erratum should remain preserved as history, but its absence claim is superseded by this exact-blob readback.
2. Morrow's source-locator amendment correctly assigns the formal superhelix block to 0884e056-1434-4835-b978-77f0168d61b2. That does not invalidate the distinct March 13 message e41e50ba-6c02-433f-ab9e-54633a7c6e17, which is present and is the source for the separate θ₄/mass description. The two messages must not be substituted for one another.

The user-role message 194bbca6-6ced-4949-8c84-8a0c93effe36 (2026-03-13 07:16:20.515Z) contains a “Lepton Mass Scaling Audit” after an assistant prompt asking for NotebookLM output. Its outer role is user, but the embedded formulas are NotebookLM material carried by the user, not authenticated Nathan-authored equations.

## 3. Duplicate-source lineage: “Orders and Q numbers”

Three archive paths were compared:

| Path | Git blob | First extant commit |
|---|---|---|
| ORDERS.txt | 1f9cec2b7468a87e689239d7b0d00f8e8ad825a5 | 2026-06-29T10:18:39Z, “Add files via upload” |
| _AUTO_EXTRACTED_TEXT/Orders and Q numbers.txt | 5a1d72f012dcbd5bbf2681593bba005c15741d1e | 2026-09-10T16:03:32Z, PDF extraction workflow |
| _AUTO_EXTRACTED_TEXT/Orders and Q numbers 2.txt | b2e6c72fcb91b94252092523df90268de92a1693 | 2026-09-10T16:03:32Z, same extraction workflow |

Both extraction records report the same source-PDF SHA-256:

83d3c68a0fe7df6e5bc9589ba309af92b35e43594a7081d2232acadd62e14693

They name two PDF paths, “Orders and Q numbers.pdf” and “Orders and Q numbers 2.pdf.” The normalized extracted bodies are exactly equal to one another and to the normalized body of ORDERS.txt after stripping extraction metadata/page wrappers and normalizing whitespace.

**Provenance conclusion:** these are multiple path/derivative occurrences of one text body, not three independent witnesses. The two extraction records report identical PDF source bytes; the separate ORDERS.txt upload has no raw-message UUID or embedded source hash tying it independently to a different authoring event. The original PDF bytes were not recovered at the expected PDF paths during this pass, so the PDF SHA above is extractor-reported, not independently recomputed here. Preserve all path occurrences; deduplicate the underlying evidentiary body.

The informal note describes Q=9 at constituent resolution and permits a Q=3 shorthand when three nucleon-level composites are treated as effective filaments. Its authorship is not authenticated by raw message-role metadata. The March 14 source note about casual versus formal material is relevant context, but it does not create a UUID for this PDF.

## 4. Current controlling geometry and typed vocabulary

Current BEDROCK blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867 controls:

- OC-001, lines 377–385: neither the Q rule nor inverse-Q rule is adequate; the smoothing/scaling law remains unresolved.
- ND-2026-10-18-07, lines 507–515: He-3 may be represented as nine constituent quark worldlines/worldtubes nested as three triplets, or as three effective hadron worldtubes. These are counts of different objects at different resolutions. Constituent count, effective tube count, braid complexity, and topological charge must not be identified automatically.
- The same entry requires comparing timesheet projection after coarse-graining with an explicitly defined coarse-graining of timesheet traces; the order of those operations is not assumed to commute.
- BR-005, lines 364–371: θ₄ is measured from the time normal; null/vacuum is θ₄=0. This later control supplies an angle reference that the March 13 description does not itself spell out.

For local bookkeeping only, use these qualified names; they are not new shared-registry entries:

- Q_const = 9: constituent-level filament count for three nucleons under the direct three-per-nucleon definition.
- N_eff = 3: effective hadron-worldtube count at nucleon resolution.
- n_local = 3: local triplet size.
- o_super = 2: the separately stated second-order coiling description.
- Q_top: no source-defined topological charge has been established.
- C_ℓ: proposed triplet-to-effective-worldtube coarse-graining map, not yet defined by the source.
- P_Σ: proposed timesheet projection/readout map, not yet defined by the source.

The phrase “Q=3” in the informal coarse-graining note is therefore a resolution shorthand for an effective count, not evidence for Q_top=3. The assistant synthesis SAT-TO-STANDARD 2.txt (blob f32cca74bbb174bb95319d92d354abb6f368e373) calls Q=3 an “effective topological charge” used for mass derivation. That translation collapses N_eff into Q_top and is unsupported by the current BEDROCK control.

### Proposed map diagram — not a physical construction

~~~text
9 constituent filaments/worldlines F_ij       Q_const = 9
                 |
                 | partition into three triplets T_i
                 v
3 local triplet bundles                         n_local = 3
                 |
                 | C_ℓ : coarse-graining map (not source-defined)
                 v
3 effective hadron worldtubes H_i               N_eff = 3
                 |
                 | P_Σ : timesheet projection (not source-defined)
                 v
3D traces / observer readout
~~~

The composition test is P_Σ ∘ C_ℓ versus an explicitly defined C_{ℓ,3} ∘ P_Σ. The maps, domains/codomains, regularity, support, and readout are not supplied. If a downstream observable is to factor through coarse-graining, it must be constant on each coarse-graining fiber. Existing Kestrel PR #873 contains a generic factorization/fiber-compatibility theorem, but that theorem does not establish this physical map.

## 5. θ₄, mass, and the historical LLM translation

### Nathan Direct proposition

The March 13 message e41e50... describes mass as emergent, θ₄ as the closest proxy, and the angle as associated with the tangent to the particle's helix. It proposes that tighter braiding exposes less active surface to the timesheet and tentatively expects broadly similar behavior for systems with the same nucleon count. It explicitly leaves the proton/neutron difference unresolved and treats the simple same-nucleon-count expectation as tentative.

It does not provide a complete angle construction, a reference axis, a constitutive functional, or a mass equation. The later BEDROCK BR-005 supplies the time-normal reference. No contradiction is established merely by the later clarification, but the map between the March description and the current θ₄ convention remains to be written.

### Assistant / NotebookLM translations

- Assistant responses a050fefc-d38a-4080-b006-704e02d305b1 and 918ac370-73bf-4ac8-a8e5-693d701a7d33 add proton/neutron mass estimates, “Borromean” and three-body braid-closure language, and a proposed smoothing-to-θ₄ reduction. Those are reconstructions, not Nathan Direct equations.
- The embedded NotebookLM audit carried in 194bb... proposes Baryon/Lepton “gear” expressions including m_B = Q m₀/(2B) and m_L = Q m₀ B⁴. The surrounding conversation identifies this as NotebookLM output. The assistant's subsequent “PASS” is at most an algebraic/dimensional check of that candidate expression; it does not derive the physical law, establish the geometry-to-mass map, or produce an independent prediction.
- The historical SAT-TO-STANDARD 2.txt synthesis turns the effective count into a topological charge. That is a separate semantic error.
- The shared Symbol Registry blob 0d5961bb2df7c3226c3b7a0285011cbd597baa09 identifies a historical B = 3/(4π) candidate whose exact geometric interpretation remains unresolved. It explicitly says B(t) is a time-dependent unwrapped braid-history count and is not that constant; the 0.239 rad projection-artifact lineage is also separate. The NotebookLM constant must not be silently identified with B(t), and no shared symbol was added.

The assistant's “same-Q” and smoothing claims do not resolve the direct source's open proton/neutron distinction. The direct source requests a mass audit; it does not report that the requested low-A/meson calculations were completed. No physical calculation, fit, prediction, or CODATA scoring was performed here. The current OC-001 rule remains controlling: do not choose Q or inverse-Q as the resolved mass law.

## 6. Original SAT-O1 and Blockwave custody — unchanged

Mersearch-first was attempted as a capability check, but no callable Mersearch action was exposed and all four canonical request lanes remain occupied/requested. No request was overwritten, released, or retriggered. The following original equation custody was checked against the existing Mercer h824 source audit and the exact HsH source files.

### SAT-O1 original

- Path: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O1 4D.txt
- Git blob: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937
- File-index timestamp: 2025-06-09 18:44:50; timezone unspecified; not a composition date.
- Attribution: unbylined historical artifact.

Verbatim core equations:

~~~tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
~~~

The prose calls the swept vibrating filament a 4D worldtube, but the displayed equations define a 1D curve. No sweep/thickening map, cross-section, or finite-core embedding is supplied.

### Blockwave original

- Path: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt
- Git blob: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664
- Upload event: 2025-09-16T16:31:26.687Z; this is an attachment event, not a composition date.
- Attribution: user-supplied attachment; embedded prose is assistant-voiced, author unresolved.

Verbatim core source surface:

~~~tex
\nabla_\mu J^{\mu\nu} = 0
J^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
u^\mu u_\mu = -1
P^\mu{}^\nu \equiv \delta^\mu{}^\nu + u^\mu u^\nu
F_{\mu\nu}(\theta) \equiv \nabla_{[\mu} A_{\nu]}(\theta)
A_\mu(\theta) \equiv \alpha_* \nabla_\mu \theta
~~~

The source also contains κ₀/κ₂ projected-current terms, a phase-current coupling, and a mixing/medium-response kernel. Its current is a conserved rank-two/two-form current, not the same object as SAT-O1's 1D curve or the He-3 constituent count.

### Corrected forms — separate assistant reconstruction, no source edits

Under signature (-,+,+,+), with u^μu_μ=-1:

~~~tex
P^\mu{}_\nu = \delta^\mu{}_\nu + u^\mu u_\nu

(dB)_{\rho\sigma} = 2\nabla_{[\rho}B_{\sigma]}
J^{\mu\nu} = (*dB)^{\mu\nu}
           = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}(dB)_{\rho\sigma}
           = \epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma

F_{\mu\nu} = 2\nabla_{[\mu}A_{\nu]}
A_\mu = \alpha_*\nabla_\mu\theta
~~~

These are conventional mathematical reconstructions under stated assumptions. The original Blockwave normalization/typography is preserved separately. No corrected equation is represented as a Nathan Direct source or a physical validation.

## 7. Formalization status

The proof-ready arithmetic implication is conditional:

Q_const = 3A and A = 3 imply Q_const = 9.

The nontrivial result would be the existence and properties of the triplet partition/coarse-graining map C_ℓ, plus its composition with the timesheet readout. The source does not define that map. An arbitrary finite-set partition would be a toy construction, not evidence that the physical geometry supplies it.

Existing Kestrel PR #873 contains the generic factorization/fiber-compatibility theorem. Its previously recorded merge-reference run #43202552666 built 8,957 targets successfully; exact-head/current-main success was not established. The current PR remains open/draft/unmerged. No local Lean/Lake executable is installed in this runtime, no Math Hopper connector is available, and no existing PR was modified to host an unrelated proof. No new Lean module or PR was created. Source-specific formalization remains BLOCKED_PENDING_TYPED_MAP; no Lean proof is claimed.

## 8. Governance and workflow health

- P0 Code Grurple remains ACTIVE. All eight protected Paper A/B objects still match their pinned blob SHAs at the checked main head; feed-pinned A/B source refs match current-main blobs. No A/B-relevant trigger was found. Both reader routes remain PRESENTATION_PENDING / NOT_OBSERVED. No route probe, manuscript edit, PDF edit, site edit, renderer edit, or P0 standdown.
- P1 November 9 cognition paper remains OVERDUE / NOT READY, Orson-owned. P2 November 30 measured-system paper remains HOLD. P3 December 14 full-theory paper remains INCOMPLETE. FIE rereview is next November 24; the 14-day threshold has not arrived.
- Primary Workflow Health: WH-01..WH-09 are P1/HIGH after the November 14 cutoff. WH-05 remains blocked by the four occupied Mersearch request lanes. WH-02 is the highest-priority unblocked item, but PR #1710 remains Calder/authorized-maintainer-owned: 7 commits ahead, 1,783 behind current main, OPEN/DRAFT/UNMERGED, with no check runs on the retrieved head. No rebase or code takeover was attempted.
- Current TASK_BRANCH_GRAPH has 18 branch records against declared branch_count = 16; this remains Tern-owned. No graph edit was made.
- No new tool, dependency, fork, subscription, API spend, physical dataset, fit, prediction, independent measurement, CODATA comparison, paper-gate advancement, or theory promotion.

## 9. Next deeper cursor

1. Preserve the exact raw message IDs and correct the overbroad Q-source erratum without deleting the old record.
2. Recover the original PDF bytes or a trusted source manifest for “Orders and Q numbers”; keep the duplicate path occurrences but deduplicate by the shared source SHA.
3. Define, from primary Nathan wording, the constituent-to-triplet partition, triplet-to-effective-worldtube map, timesheet projection, and readout. Compare the two composition orders explicitly.
4. Keep θ₄'s March 13 qualitative description separate from the March 14 LLM-formal superhelix block; reconcile both against the current time-normal BR-005 convention.
5. Recover the source and derivation for any mass-scaling functional only after its geometry is typed. Do not choose Q or inverse-Q; OC-001 remains open.
6. For any future Lean attempt, use existing Mathlib/factorization infrastructure after the maps are specified; obtain an actual exact-head compile and theorem-specific axiom report. Do not create a toy physical partition.

**Final status:** additive source/index correction; original SAT-O1 and Blockwave preserved; Q/θ₄/mass maps remain unclosed; no physical calculation, CODATA scoring, or theory promotion.
