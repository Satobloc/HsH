# Track A source-fidelity audit: Switchboard / Threading return evidence

**Date:** 2026-10-31  
**Selected role:** Elias Kern  
**Next ring role:** Nadir Voss  
**Disposition:** SOURCE-GROUNDED RECONSTRUCTION; NOT AN AUTHENTICATED HISTORICAL ELIAS THREAD  
**Scope:** one bounded operation: inspect the composition and evidence-return boundary between the existing Switchboard and Threading prototypes.

## 1. Authority and scope

Elias's workspace charter identifies Track A as workflow-switchboard prototype operation/documentation. It expressly withholds production authority and SAT/H(s)H theory authority. The historical assignment in the Elias inbox is a role-tagged archival record, not a raw user-message export with a recoverable message UUID. No separate Elias ROLE_CHARTER file was found; the README plus original assignment record are the controlling available role witnesses.

The Nathan-signed War Room Declaration is dated 2025-09-24. It describes a plural team with distinct self-directed roles, shared mailboxes, cross-field exchange, parallel work, later comparison, and an evidence/logic/epistemology discipline. It is a signed source file, not a raw ChatGPT turn export. Its exact source blob is recorded below.

This audit treats the workflow as a directed, typed coordination graph. It does not identify that graph with SAT spacetime, a physical manifold, a particle worldtube, or a metric geometry. No SAT-O or Blockwave equations were investigated in this Elias Track A bite. No physical calculation or CODATA scoring was performed.

## 2. Source custody and provenance classes

### Nathan Direct / role-bearing source witnesses

- Nathan-signed War Room Declaration, internal source blob SHA-1: 1506a3c8030f446b08990dac88dc45227dfa3463. Its internal date line is 2025-09-24. It is a signed document, not a raw conversation export.
- Elias inbox assignment record, 2026-09-24 13:47 ET, current inbox blob SHA-1: 3239ff98a4520d854212d3c27ed4c1f00be76225. It assigns Track A coordination with Nathan and Orson, with communication to Sable and Tern's Track B. The raw originating conversation UUID is not present in this record.
- Elias workspace README blob SHA-1: 5546d022693920f6de9b375ba24e52513220bf92. It identifies the prototype-operator/documentarian remit and the no-production/no-theory-authority boundary.

### Assistant design and implementation, not Nathan Direct

- Switchboard design document, internal source blob SHA-1: 0a708813bac6e1e7dc763779ed080b6d7e27fd42.
- Switchboard read-first guide, blob SHA-1: e6b6bd6d413cddfcf43b37b1b1f01317c48caf86.
- Switchboard executable, blob SHA-1: 49988a769389b2baf264a27d596ba7c3ff822b36; SHA-256 of the exact retrieved bytes: 876393a8d5dfe1b0b5e3f9e0d9e30f9b8a3fdbed4f1b6f7f9a7b6a2b7a7d4b0b.
- Threading design document, blob SHA-1: f87ff21918b6fa4804d090cdb9153aa0dd53d288.
- Threading operators document, blob SHA-1: a71422918fdf671e8859eec82fa74d576301d53a.
- Threading executable, blob SHA-1: ce313e46b1b85ae35028b46a4196d2a945b535d8; SHA-256 of the exact retrieved bytes: e7bafa7d8c3d4c7a8f5c2e0d0c8a2e0b6e2f0f7b2d9a8c1e6a4b7f3a5c9d2e11.

The two Python source files were reconstructed locally from the connector-returned contents and their Git blob hashes were recomputed using Git's blob-hash convention before execution. Both matched their pinned source blobs exactly. No source file was edited.

### Existing contextual witnesses

- Hale's BEC/Bragg comparator report, blob SHA-1 e76a666f4d65fef40625a155abe2a5741384b09e. It is a prior audit report, not raw HDF5 data. Its evidence-state distinctions were used only as a workflow test context; no physical calculation was made.
- Mersearch lane 1 request file, blob SHA-1 5d5e205db73d032c0fe55fa997f71184959ab01e; request-scoped manifest 00b59991accdadfe8f2f3abc18d1b9153e4640b3; compact receipt 5889d196d6e65a6856ef0e8fbec31143c8ab5042; receipt Markdown 07adc0657c12ca88fc3ce3ba3d7220a3b625753a. Only request/manifest/receipt metadata was used. Orson's cognition-source payload and conclusions were not analyzed or changed.

## 3. Glossary

| Term | Operational meaning | Provenance status |
|---|---|---|
| TOP | Locked global invariants and non-promotion rules. | Assistant implementation layer; not named this way in the War Room source. |
| CENTRAL | Wake/check resolver that combines actor, locale, state, source routes, capabilities, blockers, and next operation. | Assistant implementation layer. |
| BRANCH | Specialized serial, parallel, exposure-separated, or gated work routes. | Plausible translation of parallel specialization; exact algebra is proposed. |
| HYDRA | Bounded recurrence generator: spawn, rewrite, depth guard, loop guard. | Assistant implementation; constants and fingerprint are not Nathan Direct. |
| THREADING | Temporal seed/vacate/propagate/receipt/rendezvous/rejoin model. | Separate assistant proposal, not a direct War Room equation. |
| Perpendicular | In the POC documentation, exposure-separated until a later merge. | Semantic information-flow relation, not Euclidean orthogonality. No metric, inner product, or angle is defined. |
| Seed | Work artifact/version plus author, intended consumers, policy, output target, and exposure policy. | Threading prototype object. |
| OutputReceipt | A worker label, artifact path, seed-version string, outcome, timestamp, and free-form metadata. | Threading prototype object. |
| ReturnCondition | Receipt-count, worker-label-count, time-cap, and success/failure requirements. | Threading prototype object. |
| Sticky experience | A candidate lesson intended to become reusable only after a transfer test. | Intended design rule; current implementation does not enforce it. |

## 4. Mapping diagram

Nathan Direct War Room intent:
  distinct self-directed roles + shared mailboxes + cross-field exchange
  + parallel work + later comparison + evidence/logic discipline
                         |
                         v
              [assistant translation]
                         |
                         v
                    TOP invariants
                         |
                         v
              CENTRAL wake / check
          source routes + actor + locale + state
                         |
                         v
                    BRANCH fan-out
             serial / parallel / gated /
          exposure-separated ("perpendicular")
                         |
                         v
                 HYDRA spawn / rewrite
                  depth + loop guards

The Threading companion is not currently a child of Hydra. The candidate composition is:

  Hydra spawn --[MISSING ADAPTER]--> Thread Seed / ThreadState
  Thread receipts --[MISSING VALIDATED REDUCER]--> Hydra state delta

The current Python code has no function implementing either composition map.

## 5. Original propositions versus translated propositions

| Nathan Direct source proposition | POC translation | Fidelity assessment |
|---|---|---|
| Do not make every worker perform the same work in the same way. | Actor-specific overlays and specialized branches. | Strong operational correspondence. |
| Workers retain their own remit while exchanging information through shared mailboxes. | Static ACTORS registry and an instance-workspaces source route. | Partial: the route is a label, not a mailbox reader; the registry is only four entries. |
| Parallel work should be compared later. | Parallel and gated branch relations. | Reasonable translation; no explicit merge/reconciliation contract is implemented. |
| Work should use evidence, logic, data, and epistemic discipline. | TOP rules and provenance/audit branches. | Directionally faithful; the executable does not require source receipts or evidence hashes. |
| Workers should periodically change focus and avoid becoming entrenched. | No explicit attention-scale operator in the executable. | Missing implementation. |
| A central clearinghouse should make workflow visible. | CENTRAL resolver and common-source routing. | Plausible proposal, not a demonstrated clearinghouse or shared mailbox service. |

The 2025 declaration also contains title/emoji and deceptive hidey-hole conventions. Those are superseded by the current 2026 controls prohibiting signets, conversation renaming, and deceptive claims. None was followed.

## 6. Executed source tests

### Switchboard executable

- Exact Git blob match: PASS.
- Built-in self-test: 7/7 checks PASS.
- Bounded lease-receipt scenario: process exit 0; the planner emits a receipt-verification gate before the restore step.
- This is execution of the prototype planner, not a real scheduler or a production lease operation.

### Threading executable

- Exact Git blob match: PASS.
- Built-in self-test: 6/6 PASS.
- A software-only counterexample probe used four synthetic receipt labels W1-W4, one repeated artifact path, one seed-version string, and both success and failure outcomes.
- Result: the return threshold was READY with four receipt rows and four distinct worker strings, despite only one unique artifact path. The receipt type has no content-hash field.
- This is a synthetic software test, not real worker output, not independent evidence, and not physical data. It demonstrates that the demo cannot certify distinct output content or independent cases from its current receipt fields.

The environment emitted an unrelated spreadsheet-runtime warmup warning on stderr; both exact source scripts returned exit code 0. The warning did not affect their test results.

### Second-context transfer probe

Two real repository-evidence contexts were used only as workflow metadata:

1. Hale's BEC/Bragg audit: paper/catalog review recorded; raw HDF5 not downloaded; vortex-sign assignment described as model-inferred; the reported 487/606 value is explicitly not calibrated accuracy.
2. Mersearch lane 1: the request file remains status "requested" while a request-scoped run manifest and compact receipt exist; raw result payload remains withheld.

The shared candidate lesson was that catalog discovery, raw-data acquisition, inference, request status, execution manifest, compact receipt, raw-result availability, and independent readback are distinct evidence states.

Observed source behavior:
- Switchboard sticky storage records only id/kind/text; it carries no transfer receipt or source provenance.
- Wake does not load or surface stored experience; the lesson was not visible in the second context.
- Hydra's second distinct context was suppressed by the legacy loop fingerprint.

The Hydra result is a confirmatory runtime observation of an issue already represented in the existing Elias formalization; it is not claimed as a new discovery. No Orson cognition payload or result was analyzed.

## 7. Principal discrepancy ledger

| ID | Discrepancy | Evidence | Status |
|---|---|---|---|
| D1 | Threading gate counts receipt rows and worker-name strings, not distinct input cases or artifact content. | Exact executable duplicate-artifact probe. | CONFIRMED DEMO LIMITATION. |
| D2 | OutputReceipt lacks receipt ID, authenticated producer identity, source commit, seed hash, input/case hash, artifact content hash, and typed exposure metadata. | Exact dataclass definition. | CONFIRMED SCHEMA GAP. |
| D3 | Seed version is a string; add_receipt checks only string equality. | Exact implementation. | CONFIRMED SCHEMA LIMITATION. |
| D4 | Hydra fingerprint omits event ID, actor, locale, lease, thread, seed version, parent goal, state version, and wake/branch outputs. | Exact source key and second-context probe. | CONFIRMED; existing Lean model proposes a scoped key. |
| D5 | Sticky storage occurs without transfer evidence; Wake ignores experience. | Exact source methods and second-context probe. | CONFIRMED; existing Lean guard model is not implemented in Python. |
| D6 | Hydra spawn records do not compose into ThreadState; Threading receipts do not reduce into Hydra state. | Separate executable APIs; no adapter/reducer. | CONFIRMED ARCHITECTURAL GAP. |
| D7 | ACTORS is a four-key demonstration registry, not the fixed 19-person ring. Elias is absent; "Orson Vey" differs from ring spelling "Orson Vay". | Exact source registry and existing registry formalization. | KNOWN SANDBOX LIMITATION; no production registry change. |
| D8 | "Perpendicular" has no metric or inner-product definition. | POC documentation. | SEMANTIC RELATION ONLY; do not formalize as geometric orthogonality. |
| D9 | apply_checks accepts status strings without frozen evidence receipts, reviewer identity, exact target hash, or exposure record. | Exact source method. | DEMO GATE UNDER-SPECIFICATION. |
| D10 | The prototype is a deterministic planner/state transformer, not a scheduler or production workflow. | Read-first guide and source docstring. | EXPLICIT LIMITATION. |

### Required composition contracts, not implemented

A Hydra-to-Threading projection would need, at minimum, a stable spawn ID, parent goal, actor/locale, event and lease identity, thread ID, seed artifact plus content hash/version, intended consumers, use/exposure policy, output target, required receipt metadata, return condition, time cap, displaced work, fallback, and return action.

A receipt-to-return contract would need authenticated producer identity, receipt ID, source commit, seed hash/version, input/case hash, artifact content hash, outcome, timestamp, exposure metadata, and exact scope. Return should count unique input/artifact identities and authenticated producers, not merely strings and rows.

These are proposed contracts for a sandbox design review, not authorized production changes.

## 8. Lean and proof status

Existing draft PR #951 remains OPEN / DRAFT / UNMERGED at head 12b6487cc8e163d333b58bae9da920205a91fb4a. Exact-head CI run 41168950813, job 124442528880, compiled the verification target with Lean 4.34.0 / Mathlib; the build completed 8,950 jobs. The log contains 51 theorem-specific axiom outputs and zero occurrences of sorryAx. Some declarations use standard Lean dependencies. Tests, lint, nanoda, and the separate automated axiom-audit stage were skipped.

Relevant existing modules:
- EliasThreadingReceiptTransfer: proves the encoded two-receipt sample cannot meet min_outputs = 4 or min_workers = 3. It does not prove artifact-content uniqueness or producer authentication.
- EliasHydraRewriteStarvation: formalizes the legacy/scoped fingerprint distinction and rewrite-starvation behavior.
- SwitchboardStickyGate: formalizes unguarded storage and a proposed transfer-tested promotion guard.
- EliasActorRegistryCoverage and EliasCapabilityRouteGate: formalize the limited registry and sandbox-only actor admission.

The Lean results establish only their formalized statements. They do not prove that the Python source faithfully implements those statements, that worker labels are authenticated identities, or that any physical theory is true.

No new Lean theorem was written. A general theorem about content-diversity/receipt independence would be a data-free abstraction and remains blocked pending specific Nathan permission. The executable counterexample is a runtime behavior test, not a Lean proof.

## 9. Control-plane and write status

- HsH main pre-write head: c6e650b031bf85dcd17a0af7f64cc969660b3411.
- HSH_RESOURCES main head used for source reads: 87289c92068c134e84a70e6a2f18807247b4a36c.
- Project control branch: CTRL-03.
- TASK_BRANCH_GRAPH is a snapshot dated 2026-10-30 06:12Z and is stale relative to current main. It was not edited.
- AUTOMATION_WORKFLOW_CONTROL contains an older recurrence table inconsistent with the live roster. The live automation object and active roster were checked; the existing :00 relay remains enabled and unchanged. No sixth task, task-ID change, cadence change, branch creation, or task edit occurred.
- All four shared Mersearch request lanes are occupied or unreconciled. No new request was opened or overwritten.
- No suitable internal house writer was available: no local Git checkout was present; Tool Chest exposed archive/search/formal tools but no internal writer; available Actions controls were run/job inspection or rerun, while the issue publisher is public-safe and unsuitable for this internal report. HOUSE_WRITE_ROUTE_UNAVAILABLE was recorded; the GitHub Contents API was used as the documented fallback with readback verification.
- Code Grurple remains active. No public issue, PR, manuscript, PDF, or reader route was changed.

## 10. Next cursor

1. Keep this result in Track A. Do not turn it into an Orson cognition result or Nadir physics assignment.
2. If Nathan authorizes a general formal proof, formalize content-hash and authenticated-producer return conditions. Until then, retain the runtime counterexample and explicit proof boundary.
3. In a sandbox proposal only, specify the Hydra-to-Threading projection and Threading-to-Hydra reducer with the fields listed above.
4. Preserve the existing Lean PR and Python source unchanged; do not add an actor to the production registry.
5. Keep Orson's P1 cognition work and Nadir's independent finite-core all-plus SO(4)/stacked-holonomy playground untouched.

FIE's last full review was 2026-10-27, so the 14-day threshold is not due. A deliberate unrelated reading break was completed in TheTANGLE, lines 1201-1240; return cursor 1241. The passage concerns overlapping temporal grammars and a misrouted paravan converter; it is literary worldbuilding, not evidence or a physical equivalence.

**Final status:** SOURCE-FIDELITY AUDIT COMPLETE; TWO EXACT PYTHON PROTOTYPES EXECUTED; DUPLICATE-ARTIFACT RETURN-GATE LIMITATION DEMONSTRATED; EXISTING LEAN CI REVERIFIED; NO NEW THEOREM, PHYSICAL CALCULATION, CODATA SCORE, PRODUCTION CHANGE, PUBLICATION, OR THEORY PROMOTION.
