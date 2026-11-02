# Elias Track A: four-axis evidence does not transfer into the Threading receipt gate

**Nominal run:** `REVROT3-19-20261011:549:s0`  
**Selection:** h=549; seq=2745; ring index 9, Elias Kern; next ring index 10, Nadir Voss.  
**Disposition:** SOURCE-GROUNDED REVIVAL IN CURRENT RUN / NEGATIVE CROSS-CONTEXT TRANSFER TEST / EXISTING LEAN CONTRACT REUSED / NO POC OR PRODUCTION CHANGE.

## 1. Identity, authority, and continuity

The current Elias workspace README (blob `5546d022693920f6de9b375ba24e52513220bf92`) defines the repository role as Track A workflow-switchboard prototype operator/documentarian, with prototype-only authority and no independent production-workflow or SAT/H(s)H theory authority.

The Elias inbox contains a role-tagged entry dated 2026-09-24 13:47 ET, attributed to Nathan, describing Track A with Nathan and Orson, independent communication with Sable/Tern Track B, one bounded mechanism per lease, durable receipts, and no production authority. The originating raw conversation ID, message UUID, and export locator remain unrecovered. Earlier `CURRENT_WORK.md` language that described a recovered user-role message at 2026-09-24T17:47:46Z is not independently substantiated by a raw source locator. Preserve the narrower classification: ROLE-TAGGED REPOSITORY RECORD / RAW DIRECT-MESSAGE PROVENANCE UNVERIFIED.

The Nathan-signed War Room Declaration (`Satobloc/HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt`, blob `1506a3c8030f446b08990dac88dc45227dfa3463`) supports differentiated self-directed roles, role/workspace/inbox cards, and reporting chosen roles to the Comptroller. It does not independently establish the specific Elias assignment.

No authenticated historical Elias ChatGPT thread was found. The current scheduled execution has no authenticated Elias thread reference. This is a source-grounded relay reconstruction, not literal historical Elias participation or a claim that a new standalone chat was created.

The optional Hale packet `2026-11-02T1700Z_from_s0_to_s1_elias_kern.md` was read. The apparent h548 :48 packet addressed to Elias is explicitly voided/misrouted because its scheduled slot was actually h547. No valid immediate predecessor handoff was available. This is not a missed check-in. The next ring label is Nadir Voss; the :12 lease remains disabled, so the next active Nadir appearance is h553:s0, 2026-11-03T01:00Z.

## 2. Controlling scope

Read the live BEDROCK and its applicable proof/data/provenance controls, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation V3/V4, thread-first rule, scheduler authority, current branch, task graph, Code Grurple roster, Elias README/CURRENT_WORK/INBOX, relevant receipts, Track A prototype documentation, and Sable's independent Track B sticky-gate disposition.

The task graph was last updated 2026-10-30 and contains 15 branches. The live Code Grurple roster remains ACTIVE. Paper A's accepted R1 (`13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`) and Paper B's accepted R1 (`0a1dca42cafd9a02faceff4ec0851659a317b2bb`) remain pinned; actual reader routes remain pending. The November 9 P1, November 30 P2, and December 14 P3 gates remain separate. No paper gate was advanced.

The existing :00 lease remains enabled with its original ID, hourly schedule, and phase. No task, ID, cadence, branch, or ownership change was made. The :12 lease remains disabled. No sixth task was created.

## 3. One bounded Track A operation

The relevant executable is `Satobloc/HSH_RESOURCES/tools/workflow_threading_demo.py`, source Git blob `ce313e46b1b85ae35028b46a4196d2a945b535d8` (8,059 bytes). A local byte-for-byte reconstruction matched that Git blob SHA-1; local SHA-256 was `e7bafa2a54ca14b3f4b50456cd2a6777461565bd2e40264caf53b4813fe6249c`.

The source's built-in command `python3 workflow_threading_demo.py self-test` returned `{"tests": 6, "status": "PASS"}`.

The source defines `OutputReceipt` with exactly six fields:

- `worker`
- `artifact`
- `seed_version`
- `outcome`
- `timestamp`
- `metadata: Dict[str, str]`

`add_receipt()` validates only `seed_version`. `state_threshold_met()` reads receipt count, distinct worker labels, and, when configured, the presence of both `success` and `failure` outcomes. It does not read `metadata`; no four-axis evidence field is typed at the receipt boundary.

### Cross-context transfer test

The earlier Track A four-axis proposal was applied to this distinct Threading prototype context. Two receipt sets had identical gate-relevant fields (four outputs, four distinct worker labels, success and failure present) but different metadata vectors:

1. `source_content=verified`, `formal_proof=verified`, `publisher_readback=verified`, `historical_chat_delivery=unavailable`.
2. All repository evidence axes `not_checked`, with historical chat delivery `unavailable`.

Both returned `state_threshold_met() == True` and `reason == "state-threshold"`. Changing the metadata on an already accepted receipt also left the gate result true.

The source-extracted sandbox test passed nine assertions. Test-script SHA-256: `47e732edc030557cbbedbc01f31254701605be89487e4249c1ee73075330ec2a`; output SHA-256: `8d703749f27963c00559b691fbbd444b4a727b174c367c6d8559b344d38bf90f`.

**Result:** NEGATIVE TRANSFER. The four-axis record is not consumed by the current Threading return gate. The test is a software-behavior check against the exact source, not an observed worker event, independent human review, production behavior, physical calculation, or empirical LLM result.

## 4. Formalization and translation boundary

Existing draft PR #951, branch `research/elias-tracka-publisher-status-20261028t23z`, head `8fa5e72666284173569fe60bb68b678cd923702a`, contains `EliasReceiptEvidenceAxes.lean` (blob `47bb681a45958754601263600737562188ecebfc`) and `EliasStickyLifecycleGate.lean` (blob `68e58be08526502848a68b2a77f0cb3d14036419`). The root aggregator imports both.

`EliasReceiptEvidenceAxes` defines a four-component product of `EvidenceStatus` values: source content, formal proof, publisher readback, and historical ChatGPT delivery. It proves that one field can change without changing the others, and that repository evidence can be verified while historical chat delivery remains unavailable.

The latest PR workflow #41455330592 succeeded on merge ref `811a5ea5bfe5a5696ce42039431488fa06b1d1ee` using Lean 4.34.0 / Lake 5.0.0. The new sticky lifecycle module and root aggregator were built; the aggregator imports the four-axis module. This is a merge-ref build, not a separate standalone exact-head build. Tests, lint, nanoda, and the separate automated axiom audit were skipped. The four-axis module's theorem-specific axiom output was not independently re-audited in this pass.

Lean proves only the formalized product and propositions. It does not prove that the Python `metadata` dictionary maps to those fields, that the Python gate consumes them, that the source-to-formal translation is faithful, or that any physical premise is true.

No faithful projection map from `OutputReceipt` to `ReceiptEvidenceAxes` is currently defined. The free-form metadata keys have no source-level validator, status vocabulary, witness binding, or consumer. Therefore the Python-to-Lean correspondence is FORMALIZATION_BLOCKED_DEFINITION, not proved.

The four operational axes are also not a complete epistemic ledger for Lane 00. Source attribution, translation fidelity, counterexample search, compilation, observational validation, and physical-premise validation remain distinct, as required by Nathan's current instruction. They should not be collapsed into the four operational receipt fields.

## 5. Glossary and mapping

| Term | Stable meaning | Current implementation status |
|---|---|---|
| `OutputReceipt` | One Threading output record | Six fields; evidence is only free-form metadata |
| `metadata` | Unvalidated string-to-string annotations | Stored but ignored by the rejoin gate |
| `state_threshold_met` | State-based rejoin predicate | Counts outputs/workers and optional outcome classes |
| `ReceiptEvidenceAxes` | Proposed product of four evidence statuses | Lean specification; no Python projection |
| `repositoryEvidenceVerified` | Source, proof, and publisher readback all verified | Lean predicate only |
| `endToEndDeliveryVerified` | Repository evidence plus verified historical chat delivery | Lean predicate only |
| `TransferReceipt` | Candidate-bound second-context test record | Proposed Lean contract; no independent reviewer identity authenticated here |

```text
Python OutputReceipt
  worker / artifact / seed_version / outcome / timestamp
  metadata: free-form Dict[str, str]
              |
              +---- state_threshold_met reads only:
                    receipt count, distinct workers, outcomes
                              |
                              v
                       Boolean rejoin readiness

Lean ReceiptEvidenceAxes
  sourceContent / formalProof / publisherReadback / historicalChatDelivery
              |
              +---- no source-defined projection from Python metadata
```

## 6. Discrepancy ledger

| ID | Original source proposition | Translation or implementation | Discrepancy |
|---|---|---|---|
| D1 | Threading receipts preserve evidence metadata | `metadata` is free-form | No typed evidence contract |
| D2 | Four-axis status is independently represented in Lean | Four fields exist in Lean | No Python-to-Lean map or validator |
| D3 | Rejoin readiness should reflect accumulated evidence | Gate checks count, worker strings, and outcome labels | Evidence metadata cannot affect readiness |
| D4 | Candidate experience should require transfer evidence | Sticky lifecycle is a Lean proposal | No POC implementation or actual second-worker promotion |
| D5 | Proof, translation, observation, attribution, and physical truth are distinct | Four operational axes cover only some workflow events | Epistemic ledger remains incomplete |
| D6 | Track A and Track B should communicate without premature convergence | Sable's independent disposition remains separate | This test is not Track B review or production approval |

## 7. Disposition and next cursor

Sable's Track B disposition remains: KEEP hash-deduplicated candidate capture; MODIFY to explicit candidate/promoted states with provenance; TEST distinct-context transfer with a receipt; REJECT implicit promotion; DEFER production integration.

This run supplies a negative cross-context test. It does not satisfy the independent-review component of the proposed transfer receipt and does not promote the candidate. No Python POC source, production workflow, Lean source, branch, or PR was modified. No new tool or dependency was introduced; the exact existing standard-library demo was reused.

Next: define a source-backed typed mapping from the Threading receipt to the four evidence statuses, identify the witness/provenance required for each status, and make the gate consume the typed record in a sandbox-only revision. Then obtain a genuinely independent Track B review before any implementation promotion. Preserve the wider Nathan Direct geometry-fidelity Lane 00 as a separate source-recovery task; this report is a Track A workflow-evidence crosswalk, not a full SAT/H(s)H geometry reconstruction.

No Mersearch request was submitted because this bounded code-source test did not require SAT-O/Blockwave archive recovery. No CODATA scoring, physical calculation, invented physical fixture, theory promotion, paper advancement, Orson cognition reassignment, scheduler change, signet operation, or conversation rename occurred.
