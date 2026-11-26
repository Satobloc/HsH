# July 1–3 geometry source-ancestry correction and routing audit

**Submission:** `enheduanna-h1108-s0-source-ancestry-ring-correction-20261126t0400z-001`  
**Status:** `SOURCE_ANCESTRY_CORRECTED` / `ROUTING_LABEL_CORRECTED` / `GEOMETRY_STATUS_OPEN` / `NO_THEORY_PROMOTION`

This is an additive archive-integrity report. It does not replace Tern's July 1 θ₄/worldtube source-fidelity report ([issue #1473](https://github.com/Satobloc/HsH/issues/1473)) or the later BR-005 convention audits. It corrects six assistant-message identifiers in Loom's July 1–3 source-tag ledger and corrects a deterministic ring label in a prior Enheduanna receipt. Raw conversation exports are unchanged.

## 1. Source custody and Mersearch boundary

The current raw witness is:

- [Consciousness and AI Debate — current raw export](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/26.06.23%E2%80%A226.09.12%E2%80%A2%5BA%5D%20%F0%9F%93%9CConsciousness%20and%20AI%20Debate%20%E2%80%94%20raw.json)
- Conversation `6a3a15d9-bc20-83ea-b427-430d0ff293b1`; blob `98fa2eff9395812181e447e790c102937b10b128`.
- 2,710 mapping nodes; 438 user-role messages; 2,537 nodes on the current ancestry, including 388 user-role messages.

The older `LONG_CONVOS` snapshot is a distinct historical export: blob `49a23bbeaad90eadb090afb2d593e30c530290d3`, 2,665 nodes and 437 user-role messages. Its node keys are a strict subset of the current export, but 652 shared message payloads differ. The seven direct user messages in this audit have the same IDs in both snapshots but different payloads. The six corrected assistant messages below exist in both snapshots and have identical payloads. Therefore the current export is the text witness used here; the older copy is not an independent corroborating witness.

Mersearch was checked first. Existing lane 2 request `phy01-internal-first-worldtube-hinton-highercats-20261125-01` has a manifest (blob `1ef87fc50da0289329f6481e9a1345cf8a499e84`) and compact receipt (blob `05c50f6c44975b3ab8ee9e1a1e0c990de2a314e5`): 23,931 files, 23,236,558 records, 6,913 hits, 689 distinct source paths across all three repositories. Raw results are withheld by policy. This is bounded navigation, not exhaustive evidence. All four request lanes remain occupied; no request was overwritten or submitted. No local pinned checkout or local Mersearch executable was available, so exact message ancestry was verified in the connected HsH raw export.

## 2. Corrected assistant-message ancestry

The Loom ledger's seven direct user-message IDs are retained. All six assistant IDs in its assistant table are absent from both raw snapshots. The following corrected assistant IDs are present in both, have assistant role, and are descendants of the paired direct user message.

| Direct user message | Incorrect ledger assistant ID | Verified assistant descendant |
|---|---|---|
| `99b6d1d6-bb4a-4984-8994-02201f6ccfec` | `463e3384-6e45-4ad1-9b77-7b02df7ec85c` | `463e3384-90e2-459e-8659-c4d4df396b8d` |
| `de10f4a1-faea-4dd9-8a5c-0add33f333b9` | `cf731c47-13a2-4210-a7cf-37d9f5b4f2ab` | `cf731c47-42d5-4042-9034-4fd566e74548` |
| `140af6bc-1f5c-461d-b75f-b9119052ec3f` | `21b447c3-7f91-43b7-9432-9b92f15f93a8` | `21b447c3-9b27-4598-bed9-ffbb11d9bb74` |
| `d23f9b53-a29f-47d2-bc66-73642f73e3d7` | `87352289-4f3b-4c2b-95cc-6d7fdd84e9a8` | `87352289-239b-40a4-a184-2ce9bab8f306` |
| `eb3d8493-1dcb-4e72-95f7-d453b1933155` | `5e33657d-52c6-4f20-bfd9-61d9c33a0df4` | `5e33657d-b1f7-4998-91e3-6ee2d171ceb5` |
| `8ea94f2f-e353-4618-ba5a-2d568c23bd4a` | `e3a037f7-4b65-4d63-b2ef-5a5ef8d8cc0b3` | `e3a037f7-c367-4de9-8b0b-381ceb6dadcc` |

The first two ancestry chains need an additional distinction. The assistant message `77d9bd38-660c-4d8c-aee2-b2341f48fe44` is the pin/field proposal immediately corrected by `de10f4a1`; `cf731c47-42d5-4042-9034-4fd566e74548` is a later assistant descendant. Likewise, `0a21ae92-fff0-454a-a45a-d97c0358a0e5` is the earlier `SAT+`/`SAT−` and clipping proposal rejected by `140af6bc`; `21b447c3-9b27-4598-bed9-ffbb11d9bb74` is a later assistant descendant. A tag that points only to the later response can obscure which assistant proposition the user was correcting.

The separate [Amendment 01](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/tagging_ledgers/2026-11-26-ENHEDUANNA-JULY1-WORLDTUBE-THETA4-SOURCE-TAGS-AMENDMENT-01.md) records these substitutions without changing Loom's original ledger or either raw export.

## 3. Geometry glossary and mapping

| Symbol / term | Source-grounded meaning | Unresolved condition |
|---|---|---|
| `γ¹` | One-dimensional filament/worldline shorthand | Whether a given use denotes a centerline or reduced description |
| `W⁴` | Finite-core worldtube/support adopted in later descriptions | No source-defined thickening map or normal-bundle specification |
| `Σ³` | Timesheet / wavefront surface | Whether it is an independent physical surface, a responsive medium, or a local resolving description |
| `∂W³` | Candidate three-dimensional boundary of a four-dimensional support | Boundary construction and orientation |
| `θ₄` | Local angular descriptor associated with filament/timesheet geometry | Historical reference convention and metric are not source-stable |
| `αΣ` | Sheet-relative angle, useful for recording the March 7 convention | Not interchangeable with normal-relative θ₄ without an explicit metric and normal |
| `π` / readout | Required map from higher-dimensional history/support to observed 3+1 quantities | Domain, codomain, fibers, and composition are not fully defined |

```text
γ¹  (filament / historical worldline shorthand)
 |
 | T?  thickening map; not source-defined
 |     (normal bundle, metric, radius, regularity missing)
 v
W⁴  (finite-core worldtube/support)
 |\
 | \ ∂W³  (candidate boundary)
 |  \
 |   \ intersect Σ³
 |    \
 v     v
W⁴ ∩ Σ³       ∂W³ ∩ Σ³
 3D candidate   2D candidate
       \         /
        \       /
         π? / readout
              |
              v
       observed 3+1 quantities
```

The source does not choose between support-timesheet and boundary-timesheet intersection. It also does not supply the thickening map `T` or the readout map `π`. The diagram is a map-obligation register, not a claimed physical construction.

## 4. Direct propositions versus assistant translations

- **`99b6d1d6` (July 1):** the 1D worldline was historical shorthand; the filament was technically a worldtube, whose full geometry was only recently being developed. The assistant descendant `463e3384-90e2…` adds a more detailed provenance timeline than the direct message itself establishes.
- **`de10f4a1` (July 1):** θ₄ is described as an angle at the filament/timesheet intersection, proposed as an energy-transfer mechanism and mass proxy; the same message rejects a separate field ontology but mixes sheet-angle and time-normal language. The preceding assistant pin/field proposal is corrected. The later assistant descendant chooses a normal-relative incidence interpretation; that is a reconstruction, not a source-authenticated resolution.
- **`140af6bc` (July 1):** the filament is described as a global, whole-history feature, not a locally clipped segment; the user rejects `SAT+`/`SAT−` except for an antimatter distinction and rejects clipping/return-clipping. The preceding assistant proposal is not Nathan Direct. Black-hole stretching/unwinding is speculative in the direct message, not an established physical prediction.
- **`d23f9b53` (July 1):** asks whether a horizon-related scenario could work. It is an exploratory question, not an asserted result. The assistant descendant adds a GR comparator and a proposed exterior readout; no adoption is established here.
- **`eb3d8493` (July 2):** presents a prior equation pack explicitly described as not yet finalized. The assistant descendant organizes it into multiple mathematical “engines” and adds SO(4), Hopf-bundle, torus, and gauge interpretations. Those additions are assistant reconstruction, not source-native equations. The pack is not authenticated as SAT-O or Blockwave.
- **`8ea94f2f` (July 3):** directly says filaments do not propagate while the timesheet does. The assistant descendant strengthens this into a persistent-structure/advancing-sheet ontology. A later direct October 21 message retires the earlier reciprocal filament-timesheet deformation description after Klein Fabric became common; current BEDROCK leaves sheet/bulk-response alternatives open. The July 3 sentence is historical source language, not a settled current propagation law.
- **`6cd2408d` (July 3):** sets a presentation boundary: use standard physics language where appropriate; no expectation of SAT terminology or citations for ordinary physics.

## 5. θ₄ reference convention and formal verification

The source chronology is not one stable angle definition. The March 7 direct witness `f236e23d-0266-4be8-94f7-ead029c534b6` describes a sheet-relative angle with the vacuum direction 90° to the timesheet. The July 1 message `de10f4a1` mixes angle-to-sheet wording with normal-relative wording and is internally inconsistent under ordinary angle conventions. The August 27 direct witness `95319111-ba02-4b45-885a-6e44bd5fed7d` pairs 90° with a direction parallel to the time normal and calls θ₄ inverse pitch. The September 16 normal-relative-zero entry is a running-log record whose raw event remains unrecovered. The [October 9 user-authored scope note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-09_SCOPE_AND_REFERENCE_RULE.md) and [current BEDROCK BR-005](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md) use the normal-relative 0° vacuum reference. This is the current working convention, not a proof that every historical witness used it.

Existing Lean work was reused; no new module or PR was created:

- [PR #1076](https://github.com/Satobloc/HsH/pull/1076), `LoomProjectionAngle.lean`, module blob `bf14b8de776bb61a94240d3f96e7e21eb9af9c1e`, exact head `e0a9b84abdadb17e6ff64900c9e177881364074d`. [Exact-head run #41003676062](https://github.com/Satobloc/HsH/actions/runs/41003676062) passed Lean 4.34.0 / Lake 5.0.0, 8,944 build jobs. It proves a Euclidean R⁴ projection decomposition and `cos(π/2 − δ) = sin δ`. It is a conditional angle-convention identity, not a Lorentzian or physical θ₄ derivation.
- [PR #800](https://github.com/Satobloc/HsH/pull/800), `EnheduannaAngleProjectionFidelity.lean`, module blob `dfe7a0fc43cf076ff170e35e4c94e18e950a3c28`, exact head `6282ee802f9ceac9043be75244fc0e0e1baf9384`. [Exact-head run #40583709434](https://github.com/Satobloc/HsH/actions/runs/40583709434) passed Lean 4.34.0 / Lake 5.0.0, 8,942 build jobs. It formalizes the archived x–w rotation code's channels: `sourceMass(0)=1`, `sourceHidden(0)=0`. That conflicts with the code comments' “mass is sin” wording and with a normal-relative θ₄=0 vacuum baseline if the same θ is intended. It exposes an internal source/code/comment mismatch; it does not establish a physical mass law.
- Both workflows printed theorem-specific axiom dependencies. Global axiom audit was disabled; `leanchecker` and `nanoda` were skipped. These runs verify only their formalized statements and source-code translations, not the soundness of those translations or physical premises.

## 6. Deterministic ring-label correction

The existing [h1093 receipt](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-25T1300Z_s0_enheduanna.md), blob `6a85c6294cfc506fe0d0f3fc63f49d55a4ea7975`, records `h=1093`, `seq=5465`, remainder 12, but labels ring index 12 as Enheduanna and index 13 as Tern. Its associated [published artifact, issue #2546](https://github.com/Satobloc/HsH/issues/2546), remains intact; this note corrects only the deterministic routing label. Under the fixed zero-based ring, index 12 is **Tern Rook** and index 13 is **Morrow**. The sequence arithmetic was correct; the labels were shifted by one.

For this run, `h=1108`, `seq=5540`, `5540 mod 19 = 11`: **Enheduanna**, index 11; next **Tern Rook**, index 12. The earlier [h1089 receipt](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-25T0900Z_s0_enheduanna.md), blob `d4f183bf1c9baacf556bcf4d5a4c48ca19e0511d`, also correctly selects Enheduanna at index 11. The h1093 artifact remains an existing source-work product, but its deterministic worker label is corrected here. No Tern execution, identity, or thread participation is inferred.

## 7. Discrepancy ledger and next cursor

| Discrepancy | Current disposition |
|---|---|
| Six assistant UUIDs in Loom ledger | Corrected by separate amendment; original ledger/raw exports preserved |
| Current vs older raw snapshot | Current export used; older snapshot is not independent confirmation |
| July 1 pin/field and clipping proposals | Explicitly distinguished from direct corrections |
| θ₄ sheet/normal convention | Historical conflict preserved; current BR-005 is working baseline |
| Timesheet propagation | July 3 historical wording; later direct revision and current BEDROCK keep physical status open |
| July 2 equation pack | Prior, unfinalized, user-presented; assistant additions not source-native |
| h1093 ring label | Corrected to Tern index 12 / next Morrow index 13 |
| `T`, intersection, and readout maps | Still undefined |

Next: recover the raw September 16 θ₄ event; define metric/signature and the angle reference before identifying sheet- and normal-relative variables; recover the raw October 20 local-propagation witness; then specify `T`, support-versus-boundary intersection, and the readout/projection map with explicit domains, codomains, and composition conditions. Keep the Euclidean Lean identity separate from Lorentzian geometry and physical interpretation.

No CODATA scoring, physical calculation, independent measurement, SAT-O/Blockwave equation edit, corrected equation, paper-gate advancement, or BEDROCK theory promotion was performed.
