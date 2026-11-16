# Elias Kern h875:s4 | Track A current-run identity transfer test

**Nominal slot:** 2026-11-16T11:48:00Z  
**Run key:** `REVROT3-19-20261011:875:s4`  
**Selection:** h=875; seq=4379; 4379 mod 19 = 9; Elias Kern (index 9)  
**Next ring label:** Nadir Voss (index 10)  
**Disposition:** EXACT EXISTING POC REPLAYED / 7+6 SELF-TESTS PASS / CURRENT-RUN IDENTITY TRANSFER PROBE REPRODUCED / NO POC OR PR CHANGE / TRACK B DISPOSITION STILL PENDING.

## 1. Selection correction and authority

The automation exposes nominal `scheduled_for=2026-11-16T11:48:00Z`. Revival Rotation V3 therefore uses the nominal scheduled UTC hour, not the later observed execution start:

```
h = 875
seq = 5*875 + 4 = 4379
4379 mod 19 = 9
```

Elias Kern is the correct selection. An earlier same-turn calculation incorrectly used the execution-time hour 12Z and created a Kestrel h876:s4 receipt. That record is preserved as a superseded audit artifact; additive correction is at [Kestrel selection amendment 01](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-16T1148Z_s4_kestrel_AMENDMENT_01_SELECTION_CORRECTION.md). This Elias h875:s4 receipt is canonical for the scheduled slot.

Elias's source-grounded remit is Track A operation/documentation for the TOP/CENTRAL/BRANCH/HYDRA workflow-switchboard prototype, alongside Nathan and Orson and independently in communication with Sable and Tern's Track B. The controlling direct-user assignment is preserved in Elias INBOX and Tern INBOX, dated 2026-09-24 13:47 ET. The README is an assistant-maintained role summary; the raw originating conversation/message UUID and a standalone signed charter remain unrecovered. Authority is prototype operation/documentation only, not production workflow or SAT/H(s)H theory.

A bounded existing-thread-first search covered personal context, Elias README/CURRENT_WORK/INBOX, prior receipts and historical pointers. No authenticated usable current Elias thread was identified. This is source-grounded revival in the scheduled execution, not historical Elias participation. No separate ChatGPT thread was created and no cross-thread delivery is claimed.

## 2. Existing-tool reconnaissance and exact source execution

The existing Track A POC was inspected before any tooling proposal. Its README defines a sandboxed planner/state transformer, not a scheduler or production authority. Track A and Track B are explicitly independent-but-communicating. No new tool, dependency, fork, branch, subscription, or expenditure was created.

Two exact source files were retrieved from the internal POC repository and copied byte-for-byte into the execution container. Git blob IDs were independently recomputed from the Git blob header and matched the source records.

| Existing POC source | Bytes | Git blob SHA-1 | SHA-256 | Result |
|---|---:|---|---|---|
| Switchboard demo | 18,924 | `49988a769389b2baf264a27d596ba7c3ff822b36` | `876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a` | 7/7 self-tests PASS |
| Threading demo | 8,059 | `ce313e46b1b85ae35028b46a4196d2a945b535d8` | `e7bafa2a54ca14b3f4b50456cd2a6777461565bd2e40264caf53b4813fe6249c` | 6/6 self-tests PASS |

The existing `lease_receipt_gate` scenario emits two gated jobs: `verify_durable_output_receipt`, then `restore_displaced_lease` depending on the verifier. Its recurrence rewrite says to restore only after a durable receipt or explicit failure packet. This is a dependency plan; it does not itself execute or authenticate the verifier.

## 3. Bounded transfer test using the actual :48 scheduler observation

The exact existing :48 automation was read by task ID. It remains enabled with its original schedule:

```
DTSTART;TZID=America/New_York:20261001T144800
RRULE:FREQ=HOURLY
```

The final read-only provider snapshot contained:

| Field | Value |
|---|---|
| Task ID | `6aa6c3bc02b48191b8a91a30d2a155e0` |
| Current provider run ID | `391a214e-fce0-8321-b212-53812eea86a9` |
| Scheduled for | 2026-11-16T11:48:00Z |
| Started | 2026-11-16T12:49:07.035298Z |
| Recorded status | `in_progress` |
| Completed | null |
| Current-run `chat_ref` | null |
| Cached latest-result run ID | `409076b2-8ad0-832a-92c8-f57a2de15d46` |
| Cached result created | 2026-11-16T10:56:23.042589Z |
| Cached result `chat_ref` | non-null, but belongs to the different cached run |

The current run ID and cached result run ID do not match. The current run has no observed thread binding. The cached result's chat reference cannot be composed into the current run.

The exact Threading demo module was then exercised with a bounded synthetic adapter probe. Two synthetic `OutputReceipt` records carried the actual current-run and cached-prior-run IDs in their free-form metadata. The probe did not claim these were real worker outputs.

**Observed prototype behavior:** `ThreadState.add_receipt` accepted both records because their `seed_version` matched. `state_threshold_met` returned true with two receipts and two worker-label strings, and `should_rejoin` returned `ready=true`, reason `state-threshold`, even though one metadata record referred to the prior cached run and the actual current run had `chat_ref=null`.

This is a software counterexample to treating the existing count-based state threshold as semantic delivery evidence. It is not evidence of actual worker participation, independent agents, recipient delivery, or acknowledgment.

## 4. Source-level interpretation and existing v0.2 map

The current `OutputReceipt` fields are worker string, artifact, seed version, outcome, timestamp, and free-form metadata. `add_receipt` validates only seed-version equality. `distinct_workers` counts distinct strings. The type does not require provider RunKey, current-run ObservedThreadKey, authenticated ActorKey, artifact digest, SourceRunWitness, or delivery acknowledgment.

The existing [execution-envelope composition map v0.2](EXECUTION_ENVELOPE_COMPOSITION_MAP_v0.2.md) already supplies the appropriate proposed distinction:

- RunKey binds execution namespace, task ID, and provider run ID.
- ObservedThreadKey exists only from a non-null `chat_ref` on that exact current run.
- CachedResultKey remains attached to its own result run ID.
- ActorKey requires an authenticated principal; a worker/ring label is not one.
- SourceRunWitness and DeliveryKey are separate from a count-based OutputReceipt.

The new :48 probe is a cross-task transfer application of that existing proposal, not a new schema and not independent Track B validation. The prototype remains sandboxed. No POC, adapter, PR #951, or production workflow was changed.

## 5. Formalization, protected lanes, and limits

PR #951 remains OPEN / DRAFT / UNMERGED. Its current formalization is separate from this Python execution. Local Lean, Lake, and Elan are unavailable; no new Lean module, compile, theorem, exact-head CI run, or global axiom audit is claimed. The v0.2 map remains an assistant reconstruction/proposal. Any future Lean proof would check only its formalized conditional statement, not the Python-to-Lean translation or production behavior.

The independent Track B ELIAS-2224 disposition remains pending. This packet does not request or imply a response, review, task, implementation, or ownership transfer. It does not satisfy ELIAS-2224.

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY; Orson-owned and protected.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24, 2026.

No physical calculation, fit, prediction, independent measurement, model trial, human-subject session, manuscript change, or theory promotion occurred. No Mersearch request was overwritten or retriggered; the exact-source role/POC retrieval did not require a new archive query. No public issue or duplicate publisher submission was created because this is an internal sandbox transfer test and the existing #1812 issue already covers the preceding receipt-gate finding.

## 6. Reading, handoff, and automation integrity

Unrelated reading completed: H. G. Wells, *The Time Machine*, Project Gutenberg eBook #35, lines 141-222. Next cursor: line 223.

The existing :48 automation ID, enabled state, VEVENT, prompt, and phase were preserved. No sixth task, reassignment, cadence change, signet, or conversation rename. The current run remained IN_PROGRESS at final readback, with completion and current-run `chat_ref` null. The cached result is prior-run-only.

The next ring label is Nadir Voss. No handoff to Nadir is made because this Track A switchboard result is outside his protected Lane 24 geometry remit. No direct Elias-thread delivery, consumption, acknowledgment, or worker participation is claimed.
