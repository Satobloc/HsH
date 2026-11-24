# Amendment 01 | h957:s0 Mercer | UI source fidelity, formalization status, and ring-routing correction

**This is an additive amendment to the existing h957:s0 receipt.** The original receipt was preserved. This execution found an existing h957 receipt and handoff, so it did not create a second canonical receipt, second handoff, or new publication issue.

## 1. Primary-source correction and new cross-map

Recovered the March 7, 2026 `Switching to English` raw conversation:

- Conversation ID: `69ab6f13-b8f8-832e-8d71-528c15e11037`
- Git blob: `dfdaec331846087af7daf0008eba431520a5b9ad`
- 855,339 bytes.

Nathan Direct, message `0af476ca-9aac-43a5-b9c9-e0fdf038f2b6`, 2026-03-07T05:01:20.951Z: he is unsure that a complete Universal Indicatrix Lagrangian exists and describes the UI primarily as a mapping tool/translator between equations.

Nathan Direct, message `1d6e1ab3-7c21-4765-a5b2-17276da1a749`, 2026-03-07T11:21:18.547Z: the UI is agnostic to what is placed in it, can represent arbitrary paths, and he proposes charting equations against a great-circle reference.

Nathan Direct, message `7bab4773-723b-49fe-940f-02f4f31e4507`, 2026-03-07T11:29:33.422Z: no particle mediation is required; translate problematic equation components and calculate the transforms.

The six-plane SO(4) construction, `L_UI = 1/2 rdot^2 + 1/2 r^2 Omega_{mu nu} Omega^{mu nu}`, and the path-space `integral Dr DR` claim occur in assistant message `2267b5c9-d807-43a8-91a2-64d63633737b`, 2026-03-07T10:36:03.946Z. They are assistant reconstructions, not Nathan Direct equations. The later assistant claim that the UI had already resolved a GR-QM conflict is also an unsupported interpretation; the user subsequently corrected the particle detour.

A conditional bridge connects the assistant-generated DERIVATIVE INDICATRIX two-frequency curve to the UI two-plane marked-point orbit. Rename the derivative paper's scalar amplitudes A,B to avoid collision with the UI rotation matrix R:

```
H(lambda) = (A cos(w1 lambda), A sin(w1 lambda),
             B cos(w2 lambda), B sin(w2 lambda))
rho = sqrt(A^2 + B^2)
x0 = (A/rho, 0, B/rho, 0)
r = rho
R(lambda) = R2(w1 lambda) direct_sum R2(w2 lambda)
```

For constant A,B and rho > 0, `r R(lambda) x0 = H(lambda)`. This identifies the derivative-paper ansatz as a special UI two-plane orbit on the Clifford-torus family. It is a mathematical reconstruction, not a Nathan Direct equation or physical equivalence. The great-circle special case is |w1|=|w2|. The derivative-paper residual/frequency/stability audit already exists in [#157](https://github.com/Satobloc/HsH/issues/157) and [#445](https://github.com/Satobloc/HsH/issues/445); the UI two-plane orbit is already classified in [#229](https://github.com/Satobloc/HsH/issues/229). No duplicate report or closure calculation was created.

The direct/assistant distinction and this conditional bridge were added as an in-place comment to existing issue [#229, comment #7023058319](https://github.com/Satobloc/HsH/issues/229#issuecomment-7023058319). No new issue or published artifact.

## 2. Geometry and discrepancy ledger

- The marked-point orbit is S^3 = SO(4)/SO(3) as a homogeneous space, not a group identity. A full SO(4) frame lift contains three stabilizer directions invisible to a single marked point.
- The UI source's three point controls plus scale are not the same object as six full-frame rotation coordinates. The exact fixed/moving marked-point-pair and ray map remains undefined.
- S^3 is the three-dimensional hypersphere surface; B^4 is its four-dimensional interior. SO(4) is a six-dimensional rotation group; path-history space is a separate infinite-dimensional object. A volume integral over B^4 is not automatically a path integral over histories.
- The assistant's full-frame Frobenius angular norm is not the induced point-path kinetic term. The point term uses ||Omega u||^2; a full-frame norm could be a separate frame action only if its inertia metric and physical carrier are declared. Existing correction work is referenced in #203/#213 and #229, not duplicated here.
- The UI/derivative construction is Euclidean. SAT-O1 explicitly uses R^{3,1}; Blockwave uses a Lorentzian metric and two-form current. No Euclidean-to-Lorentzian signature map was recovered.
- The derivative paper's two-frequency path is a special Clifford-torus family, not a universal path proof. Its detailed radius-residual and frequency/stability defects are already audited in #157/#445.
- The user's great-circle comparison is a proposed canonicalization strategy, not an already-defined projection, distance, or equivalence map. A general torus path needs an explicit reduction if it is to be compared to a great circle.
- The UI's scale-to-physical-time law, harmonic admissibility class, sweep operator, path-space measure, and equation-to-curve/curve-to-equation maps remain unspecified.

## 3. Source custody and original equations

The two-page `Universal Indicatrix in my words CHARACTERIZATION (Nolat)` artifact is a typed transcription of supplied images, not the original notebook pages. The recorded source-PDF SHA-256 is `ad920fa43badd060d10cc05ee7de2c47d933d0fab094fbac14f49d91eacae21a`. The recovered pages contain transcription text and crossed-out-text markers, but no embedded original handwritten pages/diagrams. The source transcript's extra three-rotation-plus-scale, linear-scale-time, and small-harmonic statements therefore remain transcription provenance, not raw message-level evidence.

The SAT archive's DERIVATIVE INDICATRIX text extraction is 18 pages / 462 lines / 14,707 bytes, Git blob `9826b81332967fd08493e4ec6360707e874a773d`, recording source PDF SHA-256 `21c1f03c24d601797da3f42a28512129b5a0396e23e4a4c2e3a6a2b3d4965c6e` and extraction time 2026-09-10T16:02:25Z. Its prose/equations are assistant-generated. A same-title Library PDF was found, but raw bytes were not materializable; no cross-copy byte-identity claim is made.

**SAT-O1 original** `SATOBLOC/SAT O1 4D.txt`:
- Git blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- Previously verified SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`
- Current SAT archive FileIndex row: Created 2025-10-26 19:12:34, Modified 2025-06-09 18:44:50, Last access 2025-10-26 19:12:34; timezone unspecified.
- First extant Git commit: 2025-10-27T00:40:28Z. File is unbylined.
- Verbatim core:
```
gamma^mu(lambda) = (lambda, A_x sin(k_x lambda + phi_x), A_y sin(k_y lambda + phi_y), A_z sin(k_z lambda + phi_z))
v^mu(lambda) = d gamma^mu / d lambda
S[gamma] = integral d lambda L
L = 1/2 m v^mu v_mu - V_tension(gamma)
phi_i - phi_j = 2 pi k/n
```

**Blockwave attachment** `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`:
- Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- Previously verified SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`
- User-supplied attachment event 2025-09-16T16:31:26.687Z; first extant HsH Git commit 2026-10-08T02:42:49Z. Embedded authorship unresolved.
- Verbatim core:
```
J^{mu nu}, nabla_mu J^{mu nu}=0
J^{mu nu} = 1/2 epsilon^{mu nu rho sigma} nabla_rho B_sigma
F_{mu nu}(theta) := nabla_[mu A_{nu]}(theta)
A_mu(theta) := alpha_* nabla_mu theta
```

Original SAT-O1 and Blockwave equations remain unchanged. Corrected SAT-O1 equations: none. Corrected Blockwave equations: none.

## 4. Formalization status

A small pure-Euclidean consistency module was added to the existing Mercer PR #752 branch:
- File: `FORMAL_VERIFICATION/HsHVerification/MercerUIDerivativeConstraint.lean`
- Branch: `research/mercer-s2-stabilizer-nonidentifiability-20261027t1424z`
- New branch head: `ccb1a617c789cdefe8c659973ed7ddf45f9e45b4`
- PR #752 remains OPEN / DRAFT / UNMERGED. Its base is still the older Meridian PR #750 branch; no rebase or merge.
- The module states the four-coordinate norm identity ||H||^2=A^2+B^2, the residual against a radius-A constraint, and the nonzero-B exclusion. It is an unverified formalization candidate, not a Lean proof.
- The PR description was updated to state that the new module is NOT yet exact-head Lean-verified.
- Prior PR #752 run #40521496151 succeeded only on old head `e4c8ead3fc9238d03c0efd4ee06f82a3ab87f9a9`; it does not cover the new module. The first push triggered a failed conversation-json-content workflow with no job records; this is not a Lean failure. No new Lean run exists.
- Local Lean/Lake/Elan are absent and the container has no network access. The existing `lean-verification.yml` has workflow_dispatch, but no dispatch action is exposed in this runtime. No new dependency or tool was installed.
- Existing PR #262 exact-head run #43948452979 and PR #752 old-head run remain conditional results only. No physical premises or source translation are proven.

## 5. Ring-routing correction

The original h957 receipt correctly selects Mercer at index 16 and Ravel as the next ring identity at index 17, but it incorrectly labels h958:s0 as Ravel.

- h957:s0: Mercer, index 16.
- Next ring identity: Ravel, index 17.
- Immediate next :00 scheduled slot h958:s0: Aster, index 2.
- Ravel's next :00 appearance is h961:s0, since 5*961 mod 19 = 17.

The existing optional Ravel handoff file and inbox pointer were amended in place to correct this target. No second handoff was created. It remains repository-only optional context; no Ravel-thread delivery, consumption, or acknowledgment is claimed.

## 6. Operations and gates

- Current main read before these receipt/continuity corrections: `e3db356c8c3fdc8dddf97286d00a6f044df97793`.
- Task graph remains ACTIVE_SEED, 16 declared branches / 18 branch records; no repair.
- P0 Code Grurple remains ACTIVE. Mercer standing P0 is Paper A/B presentation QA only; this Lane 00 overlay did not edit or review manuscript content. P1 November 9 remains OVERDUE / NOT READY; P2 November 30 HOLD; P3 December 14 INCOMPLETE. FIE review next due November 24; no early re-review.
- PWH read-only refresh: WH-02 remains highest-priority unblocked and Calder-owned; PR #1710 open/draft/unmerged, 7 ahead / 6,631 behind current main. WH-05 remains blocked by occupied Mersearch lanes. P0 route status remains NOT_OBSERVED; no route probe or PWH repair.
- Mersearch is not callable; four canonical request lanes remain occupied/requested. No lane overwritten, released, or retriggered. GitHub/Library fallback only.
- HsH, SAT archive and HSH_RESOURCES public metadata show forks_count=0. HSH_RESOURCES README/navigation only; no private payload opened. SciSpace is available but no external literature search was needed. No new tooling, fork, dependency, subscription, or expense.
- Unrelated reading break: SAT archive `fun break - lx.txt`, lines 2382-2421 read; next cursor 2422.
- Existing :00 automation remains enabled with unchanged ID `6aa1fe0de5e48191b886496095b1343f` and stored schedule `DTSTART;TZID=America/New_York:20261001T140000`, `RRULE:FREQ=HOURLY`. Four Workshop Relay tasks are enabled (:00/:24/:36/:48); :12 remains disabled. No sixth task or automation mutation.
- No CODATA scoring, physical calculation, fit, prediction, independent measurement, paper-gate advancement, BEDROCK promotion, task/ID/cadence change, signet, or conversation rename.

## 7. Next deeper cursor

1. Recover the original handwritten UI characterization pages or the raw source images; the typed two-page transcription is not the original.
2. Define the fixed/moving marked-point pair and ray-coincidence map, not merely a one-point SO(4) orbit.
3. Specify the UI scale-to-time law and admissible harmonic family.
4. Define the ray-sweep operator and whether its output is a 3D boundary, a 4D solid, or a path-space object.
5. Specify the measure/action for any proposed integration; distinguish S^3 surface measure, B^4 volume, SO(4) frame measure, and path-history measure.
6. Define a Euclidean-to-Lorentzian signature/carrier map before relating the UI/Clifford-torus family to SAT-O1 or Blockwave.
7. Obtain an exact-head Lean run for the new PR #752 module before treating its statements as verified.

**Final:** EXISTING_H957_RECEIPT_AMENDED / ISSUE_229_SOURCE_PROVENANCE_COMMENT_READBACK_VERIFIED / H936_PUBLICATION_STATUS_RECONCILED / UI_TO_CLIFFORD_TORUS_MAP_CONDITIONAL / PR752_NEW_MODULE_LEAN_NOT_VERIFIED / SAT-O1_BLOCKWAVE_ORIGINALS_UNCHANGED / RAVEL_ROUTING_CORRECTED / NO_NEW_ISSUE_OR_HANDOFF / NO_PHYSICAL_OR_CODATA_RESULT / AUTOMATION_UNCHANGED.