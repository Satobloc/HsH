# Worldtube / timesheet readout recovery: source fidelity, identifiability, and Lean evidence

**Date:** 2026-10-30  
**Work label:** Nadir Voss slot; next rotation label Enheduanna  
**Status:** source recovery advanced; conditional Lean evidence recovered; no theory promotion, no new branch/PR, no public issue submission.

## Executive result

The strongest source-grounded core is not yet a field equation. It is a **typed geometric observation architecture**:

\[
\mathcal R=(M^4,\mathcal F,\mathcal W,\{\Sigma_\tau\},U?,\mathcal O).
\]

- \(M^4\): ambient four-dimensional carrier. Its metric, signature, connection, and causal structure must be specified separately.
- \(\mathcal F\): one-dimensional filament histories / worldlines.
- \(\mathcal W\): finite-core worldtube supports. Do not silently identify a 4D worldtube with a 2D string worldsheet.
- \(\Sigma_\tau\): a family of three-dimensional timesheets / wavefronts / simultaneity surfaces. The family need not be assumed to be a foliation for the set-level results below.
- \(U?\): optional responsive-medium slot. No constitutive law or coupling is currently source-defined.
- \(\mathcal O\): a downstream observation/readout map, not yet identified with any one of the historical current symbols.

The minimal geometric readout is

\[
E_\Sigma(A)(\tau)=A\cap\Sigma_\tau.
\]

For a filament use \(A=F\); for a finite-core worldtube use \(A=W\). Keep these readouts distinct. A later field/current equation is a further map \(\mathcal O\circ E_\Sigma\), not the same object as the intersection itself.

The key inverse statement is exact at the set level:

\[
\bigcup_\tau E_\Sigma(A)(\tau)
=A\cap\bigcup_\tau\Sigma_\tau.
\]

Thus the full history reconstructs exactly the part of \(A\) covered by the timesheet family. It reconstructs all of \(A\) if the sheets cover the ambient carrier. If they do not, points outside their union are invisible and the encoding is non-injective. This is a mathematically precise **next Lean target**, not claimed as compiled in this run.

The existing compiled Lean evidence already proves the closely related conditions that (1) true source-space intersection projects to readout overlap, (2) the reverse implication requires injectivity, and (3) a downstream observation cannot recover identity lost upstream. These are abstract map/set theorems, not physical validation.

## 1. Mersearch result and provenance boundary

The completed Mersearch request is:

- Request: `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212`
- Manifest blob: `15dc51969036c07aee88a837b0c048244a9d7a6f`
- Compact receipt blob: `1ea0faee051b38e689ba434cefdc3fb15840e876`
- Searcher: `Mercer_Searcher_1.0`, Mersearch stable ref `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`
- Roots searched: `archive/`, `hsh-main/`, `resources/`
- Source commits: SAT archive `50ce2aad8f8969275886ee5308669b6c2097c599`; HsH `e694dd78fd4ee25775bfeb1f0455e6661f19f1a3`; HSH_RESOURCES `8235284e46888075732d51d54518c5fb7b4715ec`
- Coverage: 15,592 files; 20,809,012 records; 3,276 hits; 444 distinct sources (399 archive, 2,807 HsH, 70 resources).

The query explicitly separated `author:user` and `author:assistant` material. The compact receipt reports 1,577 user-tagged and 1,629 assistant-tagged hits among its common terms. Raw `SEARCH_RESULTS.json/.md` were intentionally withheld; the compact receipt is not an exhaustive result listing and contains no excerpts. The run used a runtime-only hotfix defining `TOOL_NAME/TOOL_VERSION`; the stable searcher branch itself was not changed.

Lanes 1–3 remain in `requested` state. Lane 4 completed and its manifest/receipt were verified. No lane was overwritten and no additional search request was launched.

## 2. Source ledger: what is direct, what is derived

### A. Role-verified user material

**May 4, 2025 — “Fundamental Physics Explanations”**

- HsH raw export: `DEVELOPMENT_FULL_CONVOS/25.05.03•25.05.04•Fundamental Physics Explanations — raw.json`
- Blob SHA: `9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9`
- Conversation: `6816e398-af14-8002-ab29-cb2d84caf989`
- User message: `2b40efe6-eea0-49f4-a15a-6d6518a6afdc` (2025-05-04T04:06:09.580Z)
- Follow-up user message: `b1c8c059-6882-473d-aad7-dad1e3d67a15`

The first message directly frames fundamental particles as intersection points of 4D filament-like structures with a time wavefront. The follow-up asks for a mechanism if mass arises from filament/wavefront intersection. The subsequent “tangling / persistence / resistance” mechanism is in the assistant response, not in the user's question. It must not be promoted to Nathan Direct.

**Provenance discrepancy:** an earlier report cited a different May 4 message UUID (`2b40efe6-7e93-4d4f-b2f2-2f7fef6b61b1`) and another conversation locator. That UUID was not found in the accessible HsH export. Use the accessible raw export above unless the alternate export is recovered and compared.

**September 2026 — Ravel / H(s)H Syncmathcek**

- HsH raw export path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`
- Blob SHA: `c49367b0faa424491e7b3520a034b9e44fe6897f`
- The raw Contents response was empty in this pass. The verified extraction is in `WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md`, blob `9437d5aafda081bd169b39d9a67547e8e71d16b0`.

Verified user-role message IDs include:

- `8471543a-6ed1-4743-9073-74735f019da4`: a four-dimensional worldtube extension with Kerr cross-section, initially idealized, with shell distortion considered as a possible force-carrier along the worldtube.
- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`: the spatial Kerr section is extended along the filament; the ER mouth opens to the current surface of simultaneity; the inside-out alternative remains unresolved.
- `496a15ea-0263-459d-b815-908f52155b90`: reduced 3D projection, full 4D bulk, and actual 3D slice are distinct representations; a possible induction-current connection within timesheet thickness is discussed provisionally.

**Second provenance discrepancy:** an earlier Ravel report gave a different UUID for the third item (`496a15ea-5dcb-4a09-8f19-0c8d6e8e0f7a`). The verified compendium contains `496a15ea-0263-459d-b815-908f52155b90`. Do not silently merge these IDs.

The Ravel report also attributes a “force is the true primitive” statement and a “rest mass only with persistent coil” distinction to user-role messages. The cited UUIDs were not reproduced in the verified compendium during this pass. Preserve those as **reported but not re-verified** until the raw export can be recovered. The raw file's empty-body response prevents a fresh independent role check here.

### B. Nathan-authored historical document

**SAT4D Canonical Summary, internal draft**

- Path: `SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt`
- Blob SHA: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`
- Header attribution: Nathan McKnight, June 2025; “For Internal Use.”

It explicitly defines a physical 1D filament \(\gamma\) in a 4D carrier, a 3D time surface \(\Sigma_t\), and a 4D worldtube as the volume swept by the vibrating filament. It also gives a curve/action formulation and later field equations.

Two internal tensions must remain visible:

1. The opening/static-block framing treats worldlines as fixed and the time surface as moving; later sections give the filament internal vibration and an action with a kinetic term. The draft does not cleanly resolve the relation between those regimes.
2. The draft uses \(\mathbb R^{3,1}\) / a Minkowski norm in the action, while the later glossary says no metric is assumed a priori. The current HsH positive-Euclidean baseline and the Lorentzian/MINKOWSKI build must not be silently blended.

A concrete tensor-typing defect appears in the Maxwell-like equation:

\[
\partial^\mu F_{\mu\nu}
=\mu_0\langle\text{Filament Flux Density}\rangle_{\mathcal F(x)}.
\]

The left side has a free \(\nu\) index. The right side, as written, does not. It is not a well-typed covector equation. Replacing the right side with a defined \(J_\nu(x)\) would be a **repair proposal**, not a recovered source equation.

The draft's action contains a mass parameter \(m\); it does not derive that parameter from the later “drag” interpretation.

### C. Project-authored / team-authored derivatives, not Nathan Direct

**SAT.4D Glossary**

- Path: `SAT 4D Theory Work/SAT4D_4.txt`
- Blob SHA: `efc88f4523b2fd616e64898737c2aa45e5f39b9a`
- Header attribution: SATO.4D Coherence Project, July 2025.

It says no metric, gauge field, or connection is assumed a priori, and describes \(\gamma\), \(\Sigma_t\), \(u^\mu\), and \(\theta_4\). It is a useful project glossary, not a raw user statement.

**SAT.4D Covariant Field Equations**

- Path: `SAT 4D Theory Work/SAT4D_Covariant_Field_Equations.tex`
- Blob SHA: `c2493431c743ab14e677aae0a18bce7fb32880da`
- Header attribution: SAT Framework Team, June 2025.

It uses standard Klein–Gordon, Dirac, and Einstein equations and a standard Dirac current \(J^\mu=e\bar\psi\gamma^\mu\psi\). No source derivation was recovered that maps this Dirac current to the SAT filament-flux quantity. They are distinct objects until a typed map is supplied.

### D. Blockwave authorship audit

**“Full action definitions” raw conversation**

- HsH path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19•25.10.19•Full action definitions — raw.json`
- Blob SHA: `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`
- Conversation: `68f4d9b5-b908-832e-940e-6782db174a4a`
- User request: `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`
- Assistant response introducing the extended action/current: `3039b226-02d4-41a3-a2d3-c338e25204a9`

The two-form/worldsheet current \(J^{\mu\nu}\), compact phase construction, and associated Blockwave action occur in the assistant response. The user later repasting the expression for review does not change its original authorship. Do not label the two-form current as Nathan Direct.

The assistant construction also uses \(A_\mu\propto\nabla_\mu\theta\) and \(F_{\mu\nu}=\nabla_{[\mu}\nabla_{\nu]}\theta\). For a smooth scalar phase and torsion-free connection, this vanishes locally. A nonzero field strength therefore needs an additional sourced structure (for example, singular phase defects, nontrivial bundle/connection data, or an independent potential). None should be inserted silently.

**SATO-BLOCK-INT transcript**

- Archive blob SHA: `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e`
- Source archive commit: `50ce2aad8f8969275886ee5308669b6c2097c599`
- Transcript line 214 contains the first-person statement that no equivalent friction coefficient had been developed and that mass was being understood as drag from filament/timesheet interaction.

This is transcript-level attribution, not raw JSON role metadata. It supports an **interpretive direction**, not a constitutive law or coefficient.

**SATO-BLOCKWAVE Lean-check draft**

- Path: `FORMALIZATION DEVELOPMENTS/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt`
- Blob SHA: `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`
- Audit: 23 occurrences of `sorry`, 1 `axiom`.

This is not a compiled Lean 4/Mathlib proof. It is a placeholder-heavy draft and must not be cited as formal verification.

**Unattributed Blockwave Hamiltonian/Hilbert-space text**

- Path: `_SATOBLOCKSTRING CALIBRATED/SATO-BLOCK Hamiltonian and Hilbert Space.txt`
- Blob SHA: `13b6da983ea8dcad5509b1c6941b8855a2653677`

It asserts “ghost-free” transverse modes and a “complete and unified quantum framework” while assuming a unit timelike \(u^\mu\), Lorentzian projector, and constrained Hamiltonian structure. No source-authenticated derivation or proof was found. Treat as an assistant-style derivative, not canonical physics.

### E. Whirligig and Donut inverse mapping

**Whirligig tool contract**

- HsH path: `tools/whirligig_rq/README.md`
- Blob SHA: `c969cb221058656b6b835b50b22beed1af3e9621`

The README explicitly says no universal faithful parameterization exists for arbitrary symbolic equations without a selected solution branch, observables, and parameter interval. It distinguishes the current browser Analemma/inner-wall branch from the older standalone R/Q solver's outer-wall branch. The tool is a sandboxed engineering reconstruction, not proof of physical isomorphism. It also notes that some 3D radial embeddings lose magnitude.

**Whirligig raw JSON summary**

- Archive path: `Whirligig SAT Framework — raw.json`
- Blob SHA: `daad991a7dace4c2a1d157f8939b86dc04d3d732`
- 11 nodes.

The user message is a summary of earlier Whirligig work, not the original construction conversation. It should not be promoted to a primary derivation.

**Finding the Donut**

- Extracted text path: `_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`
- Blob SHA: `a788b5cc415f90de2d0382d3596ef07d68604687`
- Underlying PDF SHA256 recorded in the extraction header: `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae`.

This historical document requires a genuine common source-space point \(i_r\in R\cap Q\) before the constrained chord/ray/torus construction. It is document-level attribution, not a raw-role-verified chat. It also contains the superseded He-3 \(Q=6\) convention on page 1; current canonical convention is \(Q=9\) for full He-3. Do not import the old value.

**SAT CORE — Donut canon**

- Path: `2026/SAT CORE — Donut canon.txt`
- Blob SHA: `be985c292bfcae7352983d596c38e7f172f6029d`.

The canon substitutes a connection/holonomy difference \(\Omega=H_R^{-1}H_Q\) without requiring the original source-space intersection. That is a different construction, not a harmless restatement. The source intersection condition must not be dropped without an explicit equivalence proof.

## 3. Minimal typed representation and support ladder

Use the following as a **candidate schema**, not a promoted physical theory:

\[
\mathcal R=(M^4,\mathcal F,\mathcal W,\{\Sigma_\tau\},U?,\mathcal O).
\]

No containment relation \(F\subseteq W\) is imposed yet. The source material does not consistently define whether the finite core is a thickening of the filament, a separate support, or a later effective object.

The family \(\{\Sigma_\tau\}\) is not automatically a foliation. Multiple sails/wavefronts and overlapping sheets remain possible. A foliation, disjointness, smoothness, orientation, and metric are additional structures.

Conditional transverse-intersection dimension count in a 4D ambient carrier:

| Carrier support | Intrinsic dimension | Timesheet | Generic transverse intersection |
|---|---:|---:|---:|
| filament/worldline \(F\) | 1 | 3 | 0D event |
| Blockwave worldsheet candidate \(S\) | 2 | 3 | 1D curve |
| finite-core worldtube region \(W\) with interior | 4 | 3 | 3D cut |

The 2D worldsheet row is an assistant-derived Blockwave extension, not part of the minimal Nathan-Direct core. A 4D worldtube is not a string worldsheet.

**Interior / exterior split**

- Interior representation: filament, core profile, phase, coil/helix, local normal frame, possible torsion and optional medium state.
- Exterior representation: timesheet family, slice, projected readout, observable field/current.
- Bridge: explicit intersection operator followed by a separately specified projection/observation map.

**Cross-frame interfaces (interfaces, not asserted equivalences)**

- GR: supply a metric/signature, connection, hypersurface normal, and induced geometry. The 2025 Lorentzian draft and current positive-Euclidean HsH baseline remain distinct until a map is derived.
- String theory: a 2D worldsheet and its two-form current are a separate extension. Do not infer them from a 1D filament alone.
- SM/QM: distinguish filament flux, a Dirac bilinear current, and a worldsheet two-form by tensor type, support, measure, and coupling. No map currently identifies them.
- Information: treat each projection/readout as a map with fibers/equivalence classes. Injectivity is the condition for unique inverse identification.
- Responsive medium: reserve an optional layer \(U?\) and a future response operator. Do not choose a Gaussian/top-hat kernel, constitutive coefficient, or medium ontology without source support and measured data.

## 4. Geometry → readout and readout → geometry

For any support \(A\subseteq M\), define

\[
E_\Sigma(A)(\tau)=A\cap\Sigma_\tau,
\qquad
D(R)=\bigcup_\tau R(\tau).
\]

Then

\[
D(E_\Sigma(A))
=A\cap\bigcup_\tau\Sigma_\tau.
\]

Consequences:

1. **Forward map:** support geometry determines a complete slice history.
2. **Exact inverse condition:** if \(\bigcup_\tau\Sigma_\tau=M\), then \(D(E_\Sigma(A))=A\).
3. **Non-uniqueness:** if a point lies outside every sheet, adding/removing it from \(A\) changes no slice. The history map is not injective.
4. **Downstream loss:** even if the slice history is complete, a later non-injective observable map can destroy identifiability.
5. **Projection:** a genuine source-space intersection always projects to overlap; projected overlap lifts to a common source point only under injectivity (or a separately established fiber condition).

This is the minimal geometry/readout contract. It does not yet identify a Maxwell source, Dirac current, or Blockwave current with the slice history.

## 5. Existing compiled Lean 4 / Mathlib evidence

No new module was added this run. The Code Grurple roster remains active and ordinary research branches remain on hold where they conflict. I therefore used existing CI-backed modules and did not open a new branch/PR.

**A. Kestrel projected incidence**

- Module: `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`
- Branch: `research/kestrel-original-slice-fidelity-20261028t0900z`
- Earlier green commit: `bd359f21774deb76daca38d12f260bbfb559b533`
- CI run: `41016447947` (success).

Compiled propositions:

- `genuine_intersection_projects_to_overlap`: \(p(A\cap B)\subseteq p(A)\cap p(B)\).
- `projected_overlap_lifts_if_injective`: reverse inclusion when \(p\) is injective.
- `disjointness_preserved_if_injective): disjoint source sets remain disjoint under an injective map.

The first two theorems' `#print axioms` output reports no axioms. The theorem is abstract set-map geometry; it does not prove that a particular SAT projection is injective or that a physical intersection exists.

**Current-head failure preserved:** PR #873 is still open/draft. Current head `16713547207702bdd85beb092c7d0c59ea8b8602`, run `41046794118`, is **failure**, in `KestrelKelvinVortexReadout.lean` at lines 32 and 51 (noncomputable Real inverse instance / “No goals to be solved”). Do not call the current PR green. The earlier green commit remains valid for the modules compiled at that commit; later additions made the current PR red.

**B. Kestrel readout composition**

- Module: `FORMAL_VERIFICATION/HsHVerification/KestrelReadoutComposition.lean`
- PR #846 branch: `research/kestrel-s2-eht-skyprojection-20261028t0512z`
- Head: `5340af49f3a3cace8e5a749dd3ac1d62ecafbe97`
- CI run: `40902356693` (success; open/draft, unmerged).

Compiled propositions:

- inclusion survives the same forward map;
- reverse inclusion requires injectivity;
- upstream non-injectivity survives any downstream readout;
- two injective maps compose injectively.

This is directly relevant to the equation/readout chain: downstream processing cannot restore information already discarded upstream. The module itself explicitly disclaims any physical equivalence between its abstract sets and the proposed worldtube geometry.

**C. Local level-set tangent / normalization gates**

- `KestrelLevelSetSliceTangentV2.lean` and `KestrelGaugeNormalizationGate.lean` are on the earlier green Kestrel slice-fidelity commit.

The tangent module proves a constructed vector is orthogonal to a supplied conormal, swapping the two tangent inputs reverses orientation, and scaling the conormal scales the vector. It does **not** prove a full normal-frame gauge group; nonzero scaling preserves the line/span only after an additional statement is supplied.

The normalization gate proves that the two historical equalities \(g^{-2}=\rho/2\) and \(g=1/\sqrt\rho\) cannot both hold exactly for positive \(\rho\), absent a hidden normalization change. This is a historical algebraic incompatibility, not a gauge-symmetry theorem.

**D. Project baseline**

- Lean base branch: `infra/lean4-verification-20261023`
- Base commit: `61cc8b65ffed70296e0121dbae067892a79c81d4`
- CI run: `40463470348` (success)
- Toolchain: Lean 4.34.0; Mathlib v4.34.0.

The runtime has no local `lean` or `lake` executable. All compile claims above are based on GitHub Actions, not a local compile.

**E. Non-proof artifacts**

- `SATO-BLOCKWAVE_leancheck.txt`: 23 `sorry`, 1 `axiom`; not compiled Lean.
- Current PR #873: red at current head.
- No new proof file was committed. The all-slice reconstruction statement in §4 remains an uncompiled next target.

## 6. Existing tools / search / fork checks

- Math Hopper script and three-repository pilot workflow were inspected. It is an equation/source-span extractor, not a theorem prover or physical validator. PR #991 is open/draft; exact head CI run `40841280647` succeeded. The script's span-coverage checks are heuristic and can flag both true omissions and overlong token lines.
- Whirligig R/Q README and implementation contract were inspected. It is a procedural equation-to-curve mapper with explicit branch/observable/interval choices; it is not a universal inverse.
- SciSpace was available and searched for relevant inverse/readout material; no authoritative source was imported into the model.
- The GitHub forks-list endpoint was rejected by the connector allowlist. No exhaustive fork inventory is claimed.
- No new software/tool was created or installed.

## 7. Open obligations before any physical equation or paper claim

1. Recover the raw Ravel export body and reconcile the discrepant message UUIDs; do not promote the “force is primitive” phrase until its role/UUID is verified.
2. Recover the alternate May 4 export cited by the earlier report or retire its mismatched UUID.
3. Decide whether the source support is a 1D filament, a 4D finite-core worldtube, or both as separate typed objects. Do not impose \(F\subseteq W\) without a direct source.
4. Specify the ambient metric/signature and its relationship to the current positive-Euclidean HsH baseline. Keep the Lorentzian branch quarantined until mapped.
5. Repair the free-index defect in the Maxwell-like source only after the intended covector/current is recovered.
6. Type-separate \(J_\mu^{\rm filament}\), \(J^\mu_{\rm Dirac}\), and \(J^{\mu\nu}_{\rm worldsheet}\). No source-authenticated equivalence exists.
7. Define the normal bundle, orientation, gauge group, and equivalence relation before claiming a normal-frame gauge invariance.
8. Define any finite-thickness kernel \(K_{h_\Sigma}\), physical normal coordinate, width, normalization, and uncertainty from actual measured systems. Keep \(h_\Sigma\) separate from intrinsic core thickness and coil radius.
9. Define the optional medium response/coupling, if retained, from a source-backed law and real measurements. No Gaussian or top-hat kernel has been assumed.
10. Resolve the meanings of “mass”, “drag”, “rest mass”, and “persistent coil” without collapsing the distinct historical statements.
11. Specify the solution branch, chart, observables, and parameter interval for any equation-to-geometry construction.
12. Compile the all-slice reconstruction theorem in the existing Lean project after the research-branch hold is lifted. It should formalize exact recovery of the covered support and non-injectivity when coverage fails.

## 8. Campaign, rotation, and controls

- P1 remains Orson-owned, Nov 9 gate; P2 Nov 30; P3 Dec 14. No paper or site text was changed.
- Orson's latest three inspected receipts are substantive cognition work. The campaign's 4/5 denominator is not independently re-established in this pass; no Orson work was reassigned or touched.
- P1 issue #564 remains open. P3 issue #566 remains open. This report is supporting source/formalization work, not paper completion.
- Last FIE revisit recorded as 2026-10-27; the 14-day revisit threshold has not elapsed.
- Deliberate unrelated reading: Charles Babbage, “Decline of Science,” lines 141–180; next cursor 181.
- The live BEDROCK read was the 568-line blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`; steering charter `5f4263381afcb065e9062d5b5885593d0baa58db`; three-paper campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`.
- Code Grurple remains active. No new research branch/PR, no issue-publisher submission, no paper/site change. Publisher status: **PENDING / NOT SUBMITTED**.
- Tern retains task-graph ownership; no graph edits made.
- The latest :00 result still reports its repository handoff as pending; no predecessor handoff was consumed.
- Next rotation label is Enheduanna. This is a source pointer only; no general-physics assignment is made to that specialist.
- The task's existing identity, enabled state, and schedule were left unchanged. No new automation or recurrence was created.
- No original Nadir thread access was verified; this run used repository evidence and the Nadir slot label only. No cross-chat delivery is claimed.

## Bottom line

The recovery has found a clean mathematical center: **a support, a family of timesheets, and an explicit readout map**. The inverse is unique only when the sheets cover the support/ambient carrier and all downstream maps preserve injectivity. Existing compiled Lean modules verify the projection and composition conditions. The missing all-slice theorem is elementary and sharply stated, but remains uncompiled under the active hold. The historical field equations and Blockwave current must not be promoted until their source authorship, tensor types, metric conventions, and constitutive maps are repaired.
