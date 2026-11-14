# Mercer h824:s0 | SAT-O1, Blockwave and WWRD source-fidelity audit

**Classification:** LANE00_SOURCE_FIDELITY / ADDITIVE_ARCHIVE_AUDIT / ORIGINALS_PRESERVED / CORRECTIONS_SEPARATE / NO_PHYSICAL_CALCULATION

## 1. Slot, remit and source boundary

- Nominal slot: 2026-11-14T08:00:00Z.
- h=824; seq=4120; ring index 16 = **Mercer**; next index 17 = **Ravel**.
- Run key: REVROT3-19-20261011:824:s0.
- Historical Mercer source: *Quantum Gravity and Experiments*, conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701, raw blob d828fef5352045cb4d9486fdbeabd04043c4c119, direct user message bb8ecf64-8863-4ee7-a078-ca8cc4104974. Its specialist remit includes equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. It is a historical source, not an authenticated current Mercer thread.
- The current user instruction explicitly routed this one-run Lane 00 source-fidelity audit. The live Code Grurple roster still assigns Mercer Paper A/B presentation QA; that assignment was not changed. No manuscript, site, route, paper gate or P0 ownership was modified.
- No authenticated current Mercer ChatGPT thread was found. The automation run has chat_ref=null; repository records are not cross-thread delivery.

## 2. SAT-O1 custody and exact source equations

The SAT-O1 file is unbylined. Its file-index timestamp is **2025-06-09 18:44:50** (the index does not state a timezone or establish composition date). Its first extant SAT archive Git commit is b543eb3fbf16e50500ceadad83dc9a7dc0759e5b at 2025-10-27T00:40:28Z. The HsH 30SEP26_DUMP copy was added at 2026-10-01T20:36:31Z.

Two extant SAT archive copies and the HsH dump copy are byte-identical:

- SAT archive: SATOBLOC/SAT O1 4D.txt
- SAT archive: SAT_O REWRITE/SAT 4D/SAT O1 4D.txt
- HsH: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O1 4D.txt

All three have Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc, 3,521 characters, and independently recomputed SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937. The SAT archive tree index also displays a third root-level SAT_O REWRITE/SAT O1 4D.txt entry, but that exact path returns 404 through the current contents API; it is not counted as a verified copy.

Verbatim core equations from the unbylined artifact:

    γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x), A_y sin(k_y λ + φ_y), A_z sin(k_z λ + φ_z))
    v^μ(λ) = dγ^μ/dλ
    S[γ] = ∫ dλ L(γ^μ, v^μ)
    L = 1/2 m v^μ v_μ - V_tension(γ)

The accompanying prose describes a 4D worldtube as the volume swept out by a vibrating filament. The equations above define only a 1D curve γ : ℝ → ℝ^(3,1). No sweep, thickening, cross-section, or embedding map is supplied. The artifact's use of “worldtube” therefore does not by itself construct a 4D support.

## 3. Blockwave custody correction

The exact HsH file DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt is a **user-supplied attachment**, not an authenticated Nathan Direct composition.

Primary raw evidence:

- Conversation: 68c990dd-df28-832e-b766-c267190aaffa; raw Git blob fa2586add42b4d87afe89a5b00e1e48a01aaee54.
- System-role file-injection node 9ae20939-a3b7-4e7f-ba7c-313f537fd525 at 2025-09-16T16:31:26.687Z records file ID file-LwaFTKkMemPPrLU4qCLpYB, filename 🧱BLOCKWAVE.txt, MIME type text/plain.
- The following file-search tool result 0f3707aa-c0ae-4bb1-bc59-6333c025cf1c at 16:31:34.670Z returns the same file ID and 24,627-character text.
- This run compared that returned text with the HsH archived file: exact content equality **PASS**.

The archived file has Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, 24,627 characters, and independently recomputed SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664. Its HsH copy was added at 2026-10-08T02:42:49Z. The attachment timestamp is an upload event, not a composition date. Embedded prose is assistant-voiced, but its author remains unresolved.

A separate 2025-10-19 conversation (68f4d9b5-b908-832e-940e-6782db174a4a, raw blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77) contains a 2,227-character file-search result with a different file ID, file-KtT9G6tY25mk9yVXQtGK6N, followed by a 4,073-character assistant response 121d607d-53e7-4b5a-8a7a-75d7e09deb3d. That is a separate assistant reconstruction/re-presentation, not the origin of the September attachment.

The earlier h823 Enheduanna report's assistant-origin attribution for the exact 24,627-character file is contradicted by the raw attachment event. The additive correction is already **PUBLISHED_VERIFIED** at [issue #1730](https://github.com/Satobloc/HsH/issues/1730), publisher comment [#6874273525](https://github.com/Satobloc/HsH/issues/1730#issuecomment-6874273525), canonical artifact SHA-256 d422fedc07b37909284ffb9765b7061dbb67f61d34d4363553f72435a726b31a. No duplicate correction issue was created.

## 4. Verbatim Blockwave mathematical surface

The attachment describes J^{μν} as a conserved two-form “filament worldsheet” current, distributional on physical filaments, with:

    ∇_μ J^{μν} = 0
    J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ

It also states:

    u^μ u_μ = -1
    P^μ{}^ν ≡ δ^μ{}^ν + u^μ u_ν
    F_{μν}(θ) ≡ ∇_[μ A_{ν]}(θ)
    A_μ(θ) ≡ α_* ∇_μ θ

and includes the action terms (source typography preserved):

    (κ₀/4) J_{μν} P^μ{}_{ρ} P^ν{}_{σ} J^{ρσ}
    (κ₂ ℓ²/4) (∇_α J_{μν}) P^α{}_{β} P^μ{}_{ρ} P^ν{}_{σ} (∇^β J^{ρσ})
    (g_h/2) F_{μν}(θ) J^{μν}
    (1/2) J_{μν} 𝓜^{μν}{}_{ρσ}(θ,u) J^{ρσ}

The file also contains malformed source typography such as ∇α u_μ, u^μ uμ+1, P^μ{}^ν, P^μ{}{ρ}, and J{μν}. These are preserved above as a readable transcription of the intended index pattern, not silently repaired in the original.

## 5. Corrected forms — separate assistant reconstruction, not source edits

Under Lorentzian signature (-,+,+,+) and u^μu_μ=-1, a conventional mixed-index spatial projector is:

\[
P^\mu{}_\nu = \delta^\mu{}_\nu + u^\mu u_\nu.
\]

For a one-form B, define:

\[
(dB)_{\rho\sigma}=2\nabla_{[\rho}B_{\sigma]},\qquad
J^{\mu\nu}=(*dB)^{\mu\nu}
=\frac12\epsilon^{\mu\nu\rho\sigma}(dB)_{\rho\sigma}
=\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma.
\]

The attachment's 1/2 ε^{μνρσ}∇_ρB_σ is half of this common component convention; it may simply be a normalization choice. It is not changed here. With a torsion-free metric-compatible connection, the standard J=*dB construction gives the co-closed-current identity through d²B=0. This is a mathematical identity, not evidence that the physical current exists.

For the phase coupling, the conventional exterior-derivative convention is:

\[
F_{\mu\nu}=2\nabla_{[\mu}A_{\nu]},\qquad
A_\mu=\alpha_*\nabla_\mu\theta.
\]

For constant α_* and a sufficiently smooth scalar on a torsion-free patch:

\[
F=dA=\alpha_*\,d^2\theta=0.
\]

A circle-valued phase can still carry nontrivial global winding/holonomy when the relevant topology, bundle, patching, or defects are specified. The local identity does not prove global holonomy trivial, but neither does compactness alone construct the missing global structure. Consequently the local F·J coupling is zero on smooth patches under these assumptions; a nonzero defect/global contribution needs an explicit model.

A typed version of the quadratic/mixing sector would be:

\[
\mathcal L_J=
\frac{\kappa_0}{4}J_{\mu\nu}P^\mu{}_\rho P^\nu{}_\sigma J^{\rho\sigma}
+\frac{\kappa_2\ell^2}{4}(\nabla_\alpha J_{\mu\nu})P^\alpha{}_\beta P^\mu{}_\rho P^\nu{}_\sigma(\nabla^\beta J^{\rho\sigma})
+\frac{g_h}{2}F_{\mu\nu}J^{\mu\nu}
+\frac12J_{\mu\nu}\mathcal M^{\mu\nu}{}_{\rho\sigma}J^{\rho\sigma}.
\]

This is a notation/type repair under stated conventions, not a derivation, not an edited original, and not a physically validated action.

## 6. Nathan Direct WWRD source and assistant translation

A separate role-tagged primary conversation, *Einstein-Rosen Bridges*, conversation 6a36d67c-efac-83ea-bb94-d25e9d351042, raw blob 849f2a00cb93e50cf16c440ff91468c1f3f2d0f3, supplies the clearest intended meaning:

- 2026-06-22T17:40:29.150Z, user message cbb790dc-0513-43e1-94ad-2d730fc9365d: the question in SAT usually reduces to WWRD.
- 17:40:40.711Z, user message 69592406-47c0-41b1-8cde-10f7e79ffdcf: corrects the assistant's initial “What Would Relativity Do?” reading with “What would rope do.”
- 17:44:04.766Z, user message 746cfbb0-4a9d-4218-be5c-56689d7ea85e: asks what a helical excitation does when passing through a roughly 90-degree two-bend kink.
- 17:44:46.135Z, user message b96ed29f-4a41-43df-8725-5fdcce233dfe: corrects the assistant's abstract “rope-like medium” framing: the question is what a rope purchased from a store would do.
- 17:50:05.623Z, user message df845ae5-bb2f-49b2-ab13-424a37bc4f01: anchors the question in the Lowe's/Petzl experience and suggests WWPD.

The assistant first misread WWRD as relativity, then introduced a global energy-minimization story. The user corrected both. The later assistant response is more faithful in describing a real rope as ringing, oscillating, transferring energy between modes and dissipating rather than instantly finding a global minimum. That remains qualitative assistant language, not measured rope data.

**Source-faithful meaning:** WWRD/WWPD is a first-blush, ordinary-rope heuristic for checking geometric intuition. It is explicitly not a replacement for the mathematical structure and not a physical equivalence between a climbing rope and an H(s)H/SAT filament, worldsheet, or worldtube. No Z3 fusion theorem, three-strand maximum, or “four-plus braids are forbidden” result follows from the analogy. Such claims would require a specified configuration space, material model, boundary/initial conditions, topology and (for “overwhelmingly unlikely”) a probability measure.

The June 15 WWRD SRT captions are auto-generated and speaker-unlabelled; they were not used to attribute individual claims to Nathan or an assistant.

## 7. Glossary and typed mapping

| Term | Stable meaning | Not interchangeable with |
|---|---|---|
| Filament / γ | 1D curve or centerline | finite-core worldtube |
| Worldtube W | 4D swept/finite-core support | its 1D generating curve |
| Worldsheet S | 2D support represented by a two-form current | 4D worldtube |
| Timesheet Σ | 3D hypersurface/slice | material medium |
| J^{μν} | antisymmetric rank-two current / 2-form | SAT-O1 curve or a 3-form current |
| F=dA | 2-form field strength | holonomy by itself |
| P | projector orthogonal to unit timelike u, under stated signature | arbitrary spatial metric |
| WWRD/WWPD | ordinary-rope intuition check | physical equivalence or probability theorem |
| Attachment event | recorded upload event | original composition date or content authorship |

    SAT-O1 curve γ (1D) -- missing sweep/thickening map Φ --> worldtube W (4D)
    Blockwave J (2-form current) -- missing support/duality map --> worldsheet S (2D)
    Timesheet Σ (3D):
      γ ∩ Σ, transverse       -> 0D event
      S ∩ Σ, transverse       -> 1D trace
      W ∩ Σ, transverse       -> 3D slice
    Store-bought rope material body and centerline
      -- actual material evolution --> rope history / 4D support
      -- analogy only, no equivalence map --> WWRD intuition check

The missing maps are substantive. No map from γ to W, from J to W, or from rope history to SAT geometry was recovered.

## 8. Formalization evidence and limits

Two existing Lean 4/Mathlib results were reused; no new module or PR was created.

1. [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133), module RavelCarrierSheetDimensionGate. Actual Actions run [#43212754624](https://github.com/Satobloc/HsH/actions/runs/43212754624) completed successfully: 8,953 build jobs. The verified head was 3ba3880c70256e79f0ced72e40d0e11dc384e7e0; the base was 61cc8b65ffed70296e0121dbae067892a79c81d4. The PR remains OPEN / DRAFT / UNMERGED. Its expected transverse-intersection dimension is k + 3 - 4 = k - 1: 1D carrier → 0D trace; 2D worldsheet → 1D trace; 4D full-dimensional support → 3D slice. The module explicitly conditions this on embeddings/complements/transversality. It does not prove a particular physical intersection exists or is transverse.

2. [Loom PR #759](https://github.com/Satobloc/HsH/pull/759), theorem constant_smul_exact_phase_has_zero_field_strength. Actual Actions run [#41369984551](https://github.com/Satobloc/HsH/actions/runs/41369984551) completed successfully: 8,952 build jobs. Head 45f6d5167c064d04dbba436c220c900b479b873f; base d8a36337650c93ee21d8c8443639fb844e5e7c83. The PR remains OPEN / DRAFT / UNMERGED. It formalizes d(α dθ)=0 for a sufficiently smooth scalar and constant α. The theorem's reported dependencies include propext, Classical.choice, and Quot.sound. Tests, lint, nanoda and global axiom audit were skipped in that workflow.

These are successful merge-reference CI results, not current-main integration proofs. Lean checks only the formalized statements. It does not prove the soundness of translating the source, the torsion-free connection assumption, global defect/holonomy structure, the physical current, or the proposed worldtube correspondence.

## 9. Original versus translated propositions

| Source proposition | Historical translation | Fidelity assessment |
|---|---|---|
| SAT-O1 defines a 1D curve and describes a 4D swept worldtube | Curve/action retained; sweep left implicit | Partial; the required map is absent |
| Blockwave attachment defines a conserved 2-form current on worldsheet support | October 19 assistant re-presents a “one clean action” | Separate reconstruction; not the September attachment's origin |
| WWRD asks what an ordinary rope would do | Assistant first substitutes relativity, then global minimization | Corrected by the user; keep it heuristic |
| A=α dθ and F=dA | Holonomy coupling treated as a quantization engine | Locally zero on smooth torsion-free patches; global structure is unspecified |
| J^{μν} is a 2-form current | Sometimes treated as a generic filament/worldtube object | Type/support conflation; no conversion map |

## 10. Discrepancy ledger

1. **High — Blockwave source attribution:** h823 Enheduanna's assistant-origin claim for the exact 24,627-character file was wrong. Raw attachment metadata and exact text comparison establish a September 16 user-supplied attachment event. Embedded authorship remains unresolved. Correction already published at issue #1730; not duplicated.
2. **High — SAT-O1 curve/worldtube:** γ is 1D; the claimed 4D swept support requires an explicit thickening/sweep map.
3. **High — support mismatch:** Blockwave J^{μν} is a 2-form current with worldsheet support; SAT-O1 γ is a 1D curve; neither is automatically a 4D worldtube.
4. **Medium — phase coupling:** A=α dθ makes local F vanish on smooth torsion-free patches for constant α. Nontrivial global holonomy needs explicit circle-valued/bundle/defect structure.
5. **Medium — tensor typography:** projector and response-kernel indices are malformed in the attachment; the corrected typed forms above are separate reconstructions.
6. **High — WWRD overreach:** the ordinary-rope question is an intuition check, not a material equivalence, universal braid law, Z3 derivation, or probability result.
7. **Open — authorship:** neither SAT-O1 nor the embedded Blockwave prose has authenticated Nathan Direct equation-level authorship.
8. **Open — empirical status:** no identifiable measured rope/system, material parameters, acquisition provenance, units, uncertainty, or independent dataset was supplied for physical calculation. None was invented.

## 11. P0 and governance readback

The live Code Grurple roster blob cc96c0bfafc95c54e7960899c7306031e5abce17 keeps Mercer on Paper A/B presentation QA. This one-run source-fidelity task did not change that assignment or touch either manuscript/site.

At HsH main 1ab83ddddb25878e7e04e78ea1f881685c13ce12, the eight protected P0 paths remain exact. The ordered path/blob vector SHA-256 is unchanged: 833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161. Both feed-pinned manuscript commits still resolve to the exact Paper A/B blobs. The generated paper index contains only the Cruller-Rubin entry; no A/B presentation derivatives or deployed build identity were found. Both routes remain PRESENTATION_PENDING / NOT_OBSERVED, neither PASS nor FAIL. The Browser connector has no originating tabs, and the public routes could not be read through the web fetch path. No route probe, manuscript/site edit, trigger, or P0 standdown.

The current main branch is 179 commits ahead / 0 behind the h820 baseline f6408e605abcfa80fe3a3add50cfd22946dd83a7; the protected P0 vector is unchanged. Mersearch was not callable in this runtime; the shared request bridge currently contains Calder's lane-1 request. No request was overwritten or retriggered. GitHub/Library retrieval was fallback, not Mersearch.

P0 remains ACTIVE; P1 November 9 remains OVERDUE / NOT READY and Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE last full review November 10; next November 24. No CODATA scoring, physical calculation, fitting, prediction, independent measurement, paper-gate advancement, new tooling, or BEDROCK promotion.

## 12. Next deeper cursor

1. Recover the exact companion Blockwave attachment/version family (🧱BLOCKWAVE.txt.txt, SAT—Blockwave Ideal Model.txt) without merging same-named files.
2. Specify a candidate thickening map from γ to a finite-core W, including its domain, codomain, regularity and cross-section.
3. Specify whether the Blockwave 2-form current is Poincaré-dual to a 2D worldsheet and what map, if any, relates that support to a 4D finite-core worldtube.
4. Define the global phase bundle/defect data before using holonomy to support the local F·J coupling.
5. Keep WWRD at first-blush intuition level until a real rope, material specification, boundary/initial conditions and measured observations are available.
6. Do not infer Z3 or a three-strand ceiling from rope intuition; require an explicit topological/probabilistic model.

**No original equation file was changed. No corrected equation was substituted into an original. No physical calculation or CODATA comparison was performed.**