# 4D filament support strata: SAT-O / Blockwave / H(s)H source cross-read

**Disposition:** SOURCE CROSS-READ COMPLETE / 1D-TO-4D TERMINOLOGY SHIFT IDENTIFIED / SUPPORT MAP PROPOSED, NOT ESTABLISHED / CURRENT SABLE BUILD MERGE-REF ONLY / GW170817 READOUT MAP MISSING / CODATA COMPARISON HELD / NO THEORY PROMOTION.

## Historical remit

The original Aldus conversation is 6a9dea2e-bb98-83ea-a74f-4beb4baa3153, raw-export Git blob 2f5ea91a449446f64d298b50b0c2ef0d8533900a. User messages fcff5c18-85c4-4efc-b7e5-df7ee20c0646 and 3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d establish the cross-reading remit: combine information not usually combined and read the archive from a perspective distinct from Morrow's ingestion work. “Ensemble Methodologist and Context Architect” was assistant-proposed wording, not a verbatim user-authored title. This is a repository-grounded execution; no authenticated historical Aldus thread or cross-thread delivery is claimed.

## 1. Source-first equations and chronology

### SAT-O 2.0 Module O1

SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt; Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; first extant archive commit recorded as 2025-10-27T00:40:28Z. Unbylined historical document, not a raw Nathan Direct message.

Verbatim source definitions and equations:

~~~text
Filament: a smooth one-dimensional object γ : R → R^{3,1},
parameterized by affine parameter λ.
Worldtube: the 4D volume swept out by the vibrating filament.

γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x),
             A_y sin(k_y λ + φ_y),
             A_z sin(k_z λ + φ_z))
v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = (1/2) m v^μ v_μ − V_tension(γ)
~~~

This source distinguishes a 1D curve from the 4D volume swept out by it.

### Blockwave

Assistant message 3039b226-02d4-41a3-a2d3-c338e25204a9, 2025-10-19T12:31:03.318Z, conversation 68f4d9b5-b908-832e-940e-6782db174a4a, raw-conversation Git blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77. Attachment DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt, Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, first extant HsH commit recorded as 2026-10-08T02:42:49Z. Assistant-generated historical material, not a recovered Nathan Direct derivation. User message f77f769e-8e74-4def-b4c9-bced0edbb8bc at 2025-10-19T14:49:49.631Z reposts it for review, not endorsement.

Verbatim relevant source lines:

~~~text
S[g_{μν}, u^μ, θ; J^{μν}] = ∫ d^4x √(-g) [
  (M_P^2/2) R + (f_θ/2) ∇_μθ ∇^μθ
  − Λ_θ^4(1 − cos θ) + ...
]
u^μ u_μ = −1
J^{μν}: conserved two-form;  ∇_μ J^{μν} = 0
F_{μν}(θ) = ∇_[μ A_{ν]}(θ);  A_μ = α_* ∇_μ θ
~~~

The prose calls J^{μν} a conserved two-form and filament/worldsheet current, but no support embedding or map to the later finite-core worldtube is supplied.

### 3-form editorial direction

In The Tourist Tailor, conversation 68cad3d4-0ccc-8325-be36-94c5b5527997, raw Git blob dd2b6141af86dea54e4ba2e782214128619ce78c, user message 5730114b-8327-4856-b4ec-3c3f98a7a551 at 2025-09-18T15:08:14.620Z asks, “Why adopt the 2-form? Shouldn't the whole book be in 3-form?” User message e92efb17-2499-482e-b930-9ad11221bd7c at 15:19:27.048Z requests the chapters be rewritten in 3-form language. These are direct editorial instructions, not a supplied derivation. User message 71da031e-5a0c-4408-bb9f-0b2cbbfdb6f0 at 14:42:25 raises a rank/current mismatch; d6d42938-f937-4ac6-973b-e5a3c468151b repeats it at 14:47:38 and is not independent corroboration.

The detailed equation in assistant message ff0ef513-0f75-4e87-a719-378447788b32 at 15:43:01.515Z is assistant-generated:

~~~text
J_{μνρ} is proposed as the fundamental 3-form,
with J̃^μ = (1/3!) ε^{μνρσ} J_{νρσ}.
~~~

Do not attribute that equation or its physical interpretation to Nathan Direct. The direct 3-form preference does not identify the current's support or establish a map to the Blockwave rank-two current.

## 2. Later Nathan Direct geometry

Ravel raw-conversation Git blob c49367b0faa424491e7b3520a034b9e44fe6897f:

- a63b981d-d614-4da8-9cd3-7a018ed221e3, 2026-09-06T20:10:29.947Z: “Filament should not be thought of as having a trajectory. A filament is the totality of a four dimensional particle trajectory.”
- 3d0ad680-51db-4c79-ad4a-9bbacada24ef, 2026-09-07T07:46:38.573Z: choose a spatial Kerr section and extend it along the filament.
- 496a15ea-0263-459d-b815-908f52155b90, 2026-09-07T10:06:12.842Z: keep the 3D Minkowski diagram, full 4D bulk, and actual 4D view with 3D slice distinct.
- 62b85640-6a36-47b7-b064-94c97106f9b6, 2026-09-10T14:43:07.491Z: asks what measurements should constrain shell deformability, permeability, and stability.

The later direct source changes the working use of “filament” from the earlier 1D curve to a 4D totality. Treat this as a source-level terminology shift; do not silently identify the old 1D curve with the new 4D object.

## 3. Candidate support hierarchy

Candidate reconstruction, not a source equation:

- W⁴: full finite-core worldtube / later 4D filament.
- C¹: possible parameterized base or distinguished centerline, not established as a second physical filament.
- K³_λ: spatial Kerr section associated with parameter λ.
- B³ = ∂W⁴: possible shell worldvolume.
- H² ⊂ W⁴: possible mode/worldsheet.
- Σ_t³: timesheet.

A candidate bundle-like map is π : W⁴ → C¹ with 3D spatial Kerr fibers K³_λ. This is an assistant reconstruction suggested by “choose a spatial Kerr section and extend it along the filament.” The source does not define π, its regularity, the shell/mode embeddings, or their compositions with the timesheet.

For a 4D ambient manifold and transverse intersection with a 3D timesheet:

| Support stratum | k | Poincaré-dual degree 4−k | Hodge-dual degree | Timesheet-slice dimension k−1 |
|---|---:|---:|---:|---:|
| Possible centerline C¹ | 1 | 3 | 1 | 0 |
| Possible mode sheet H² | 2 | 2 | 2 | 1 |
| Possible shell B³ | 3 | 1 | 3 | 2 |
| Full core W⁴ | 4 | 0 | 4 | 3 |

Conditional consequences: a 3-form Poincaré dual belongs to a 1D support, a 2-form to a 2D worldsheet, a 1-form to a 3D shell, and a 0-form to a full 4D support. In 4D, the Hodge dual of a 3-form is a 1-form, not a 2-form. A 3-to-2 degree change requires an explicit sweep/thickening or other support-changing map, not Hodge duality. The required inclusions, push-forwards, boundary maps, and current maps have not been recovered. No physical equivalence is asserted.

## 4. Corrections kept separate

Original Blockwave scalar term, preserved:

~~~text
+(f_θ/2) ∇_μθ ∇^μθ − Λ_θ^4(1 − cos θ)
~~~

Conditional correction under the source's u^μu_μ = −1 mostly-plus convention and the additional assumption f_θ > 0:

~~~text
−(f_θ/2) ∇_μθ ∇^μθ − Λ_θ^4(1 − cos θ)
~~~

This is not a Nathan Direct equation. The potential identity −2Λ_θ^4 sin²(θ/2) = −Λ_θ^4(1−cos θ) is algebraically equivalent.

For smooth single-valued θ in a torsion-free connection, A = α_* dθ implies F = dA = α_* d²θ = 0. A nonzero field requires additional structure such as defects, multivalued phase, or a non-exact potential. Calder's sign crosswalk and Aster's source-boundary audit already preserve these corrections; their work is not overwritten.

## 5. Lean verification

Existing proof reused; no duplicate module created. SableCurrentSupportDegreeGate.lean is in PR #1098, current head d2839a9454f16a2ad7661544d9d0c12b664e55c5, module blob e3f1ec5e4312c61a70216895c0c61db8bad4720b.

Latest run #41328086467 checked out refs/remotes/pull/1098/merge at merge commit bbb95297c1866db4fd4b8f6e6d8f590c85385a68, not the current PR head. lake build succeeded; target module built at 8931/8945. Log: zero sorryAx, zero admit; #eval and #print axioms executed. Source-identity theorems blockwave_rank_two_does_not_supply_form_or_support and editorial_direction_does_not_attest_equation report no axioms. Degree arithmetic uses standard propext and, where needed, Quot.sound; independent_sweep_raises_support_by_one reports no axioms.

Earlier exact-head run #41176686005 was for older head 7666f2cb..., not the current head. Current status: MERGE-REF BUILD PASS / EXACT-HEAD NOT VERIFIED. Tests, lint, nanoda, and automated axiom-audit did not run. The module explicitly does not construct a smooth flow, prove immersion/transversality, construct distributional currents, establish push-forwards, prove current conservation, choose metric/orientation/signature, or establish an H(s)H physical identification. Lean checks encoded statements, not source-translation soundness, map existence, physical premises, or observational truth.

## 6. Measured systems and CODATA

The existing Calder package uses GW170817 as a real binary-neutron-star inspiral benchmark. Retained published summaries: low-spin 90% HPD Λ̃ ∈ [70,720], high-spin one-sided 90% Λ̃ ∈ [0,630], arrival delay +1.74 ± 0.05 s, initial distance 40 ± 8 Mpc. Raw posterior sample bytes were not retrieved; endpoint sensitivity is not a joint posterior. GW170817 is not a direct Kerr-core measurement. No H(s)H map from the proposed worldtube/shell to a Love response or waveform phase was recovered; no new fit or comparison was performed.

The latest published NIST recommended set remains CODATA 2022. Its adjustment reports 133 input data, 79 adjusted constants, 54 degrees of freedom, initial χ² = 109.6 (p = 0.001%), and expansion factors 1.7 and 2.5 for specified input groups. Proton/helion mass inputs involve cryogenic Penning-trap cyclotron-frequency ratios; neutron mass uses neutron-capture gamma-ray wavelength/recoil measurements. The input-data correlation table is not the adjusted-constant covariance matrix needed for a proton-neutron-helion mass-defect uncertainty. Pairwise adjusted covariance was not retrieved; no mass-defect calculation was made. In the existing GW170817 Planck-native radius conversion, G and ħ cancel; it is not a CODATA test.

WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

## 7. Controls and next work

- All four Mersearch request lanes were occupied; the existing completed WWRD request was reused. No new request or lane overwrite.
- Existing Lean PRs and Math Hopper/Whirligig resources were checked. No new tool, branch, PR, dependency, or fork was created.
- No change to BEDROCK, automation, task graph, paper gate, or theory status.
- Last full FIE review was 2026-10-27; 14-day rereview is not due. The immediately preceding relay turn completed the unrelated reading break; no duplicate break was taken.

Next mathematical work: specify and conditionally prove π, Kerr-fiber construction, shell and mode-sheet embeddings, transverse timesheet intersections, current push-forwards, and observable/readout map. Next empirical work requires an independently measured system and a forward H(s)H prediction with uncertainties. CODATA comparison remains gated on adjusted-constant covariance.
