# Aldus h806:s4 — Review-MIND: REVROT3 eligibility-gate semantics and provenance QC

**Run key:** `REVROT3-19-20261011:806:s4`  
**Nominal slot:** 2026-11-13T14:48:00Z  
**Selection:** h=806; seq=5(806)+4=4034; 4034 mod 19 = 6.  
**Selected ring label:** Aldus, index 6.  
**Next deterministic label:** Calder, index 7; next active :00 key `REVROT3-19-20261011:807:s0`.  
**Scope:** slot-specific Review-MIND cross-lane QC. This does not permanently reassign Aldus's Lane 24 measurement/source work.

## 1. Historical remit and identity boundary

The deterministic label Aldus is not authentication of a particular ChatGPT instance or thread.

The historical source export was recovered from:

- Conversation: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`.
- Raw Git blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`.
- Export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•Aldus [AUTO H(s)H Gitter] — raw (2).json`.
- Parsed mapping: 1,578 nodes; 47 user-role messages.

Direct user-role message `fcff5c18-85c4-4efc-b7e5-df7ee20c0646` says, in part, “combining information not usually combined.” It supports a broad cross-reading/synthesis remit. There is no standalone signed specialist charter. The other locator `939e0d7c-5e9e-4c84-b4a9-4e0e8e58d832`, cited in the current BOOT capsule, was not found in this raw export or the alternate LIVE CONVOS snapshot; it is not counted as corroborating evidence here. “Renaissance Man” remains an assistant/working-group formulation, not Nathan Direct.

No authenticated current Aldus thread was established. The current :48 run has `chat_ref=null`.

## 2. Incoming context and evidence lineage

Read the current h806:s0 Aster receipt/amendment, h806:s2 Alberr receipt, h806:s3 Mira operational-only receipt/handoff, and h805:s4 Loom report/receipt.

The Mira-to-Aldus packet is a repository-only optional context transfer. It was read in this execution; it does not establish direct ChatGPT-thread delivery, authenticated distinct instances, or an ownership/task transfer. Mira's private workspace and restricted HSH_RESOURCES payload were not opened.

The Aster receipt records that its h806:s0 source-custody work consumed the Loom h805:s4 packet as repository context. The current Aldus review also reads the same PR #1533 and Actions run cited by the Mira receipt. Therefore agreement among these reports is **shared-source / report-linked agreement**, not independent-agent corroboration. The current source-level counterexample reproduction is a separate analysis operation, not proof of a separate model identity.

## 3. PR #1533 and exact workflow evidence

- [PR #1533](https://github.com/Satobloc/HsH/pull/1533), stacked on [PR #1173](https://github.com/Satobloc/HsH/pull/1173).
- Current PR #1533 head: `c779ab2198c66d8303f1f722e5769d9fcd08c533`.
- Base / PR #1173 head: `d4131292662af404cf128c648cf5961622e7ce42`.
- Exact source file on PR #1533 branch: `tools/audit_revival_rotation_v3.py`, blob `5ab256e9d9a97e6d2d7d4e4a67b6c3b91d6a6e4c`.
- [Actions run #42658317294](https://github.com/Satobloc/HsH/actions/runs/42658317294), job `129302732772`, checked out synthetic merge-reference commit `dcec812...` containing the PR head and base.

The workflow log establishes two separate outcomes:

| Step | Result |
|---|---|
| Python compile + repository self-test | SUCCESS, `checks: 40` |
| Full repository audit | FAIL |

The full audit inspected 489 receipts and 324 handoffs, reported 39 out-of-band items, 660 errors and 1,024 warnings. The receipt's category summary separates missing/invalid run keys, identity/successor mismatches, timestamp/phase mismatches and duplicates. These are legacy metadata/audit findings, **not 660 failed executions or evidence of 660 policy violations**.

Both PRs are currently OPEN / DRAFT / UNMERGED. The GitHub mergeability flag currently reads true for both; that is not approval, review, CI success or merge. PR #1533's description still says the full self-test/Actions run is pending. That description is stale relative to run #42658317294. No PR description, branch, review or merge state was changed here.

## 4. New code-level finding: the metadata checker is fail-open on malformed declarations

The current `check_eligibility_fields` implementation has five behaviors that matter if its output is treated as a gate:

1. Missing `eligibility_status` returns without an error or warning.
2. An unrecognized status emits a warning and returns; it does not fail.
3. `CLEAR` returns immediately, before checking payload, private-access, inbox-write or nonresponse fields.
4. Boolean parsing recognizes only `true`, `yes`, and `1` as true. Every other string, including malformed values such as `maybe` or `perhaps`, is silently treated as false.
5. `access_class` is included among recognized structured fields but is not read by this eligibility predicate, so it is not cross-checked against `eligibility_status`.

The committed 40-case self-test covers positive/negative examples, but does not cover these malformed/missing/contradictory cases.

### Source-derived minimal reproduction

A minimal Python reproduction of the exact method logic was run. It is a source-derived transcription of that method, **not execution of the full repository script**.

| Input case | Current method result |
|---|---|
| `QUARANTINE_HOLD`, `private_material_accessed="maybe"` | No errors; malformed value becomes false |
| `QUARANTINE_HOLD`, `inbox_write="perhaps"` | No errors; malformed value becomes false |
| Missing `eligibility_status` | No finding |
| Unknown `eligibility_status="QUARANTINE"` | Warning only |
| `CLEAR` with `payload_to_selected="RESEARCH"`, private access true, inbox write true, and `access_class="QUARANTINE_HOLD"` | No finding because the function returns early |

This demonstrates a false-negative path in the metadata checker. It does **not** demonstrate that any worker actually accessed restricted content, that a real handoff bypassed policy, or that an unauthorized write occurred.

### Correct scope

PR #1533 is a metadata-consistency auditor, not an access-control boundary. It does not independently resolve eligibility from the live roster/policy, inspect actual payload contents, or prove that a route was or was not delivered.

A safer next revision would separate four things:

- **Policy resolution:** derive the permitted status from the exact run key and a versioned roster/policy snapshot; do not trust a self-declared status as authority.
- **Current-record schema:** require a recognized status and explicit fields for new records; parse booleans as a strict three-way result (true / false / invalid), with invalid values rejected.
- **Legacy migration:** keep historical/legacy records in a separate warning and reconciliation inventory rather than silently weakening the current-record gate.
- **Actual evidence:** record payload access, inbox writes, and chat delivery as separate observable events with source IDs and timestamps. A metadata label is not an access log.

Either remove `access_class` from the current schema or define and test its exact consistency relation with `eligibility_status`. Do not silently leave two apparently authoritative fields disconnected.

## 5. Formalization boundary

A source-faithful formalization target is available:

- finite `EligibilityStatus` type;
- `parseStatus : String → Option EligibilityStatus`;
- `parseBool : String → Option Bool`, with invalid strings preserved as invalid;
- a versioned `CurrentEligibilityRecord`;
- a validity predicate whose quarantine/no-access cases imply no research payload, no private access, no inbox write and no missed-check-in penalty.

A theorem about that typed contract would prove only the encoded contract, not that the Python translation, roster snapshot or physical/user-access premises are true.

No Lean module or theorem was added. Local `lean`, `lake`, and `elan` are absent; no authorized CI-dispatch path is exposed in this runtime. The existing Tern H591 snapshot evidence is not a general proof of this quarantine policy. Status: **FORMALIZATION TARGET IDENTIFIED / LEAN NOT RUN**.

## 6. Review-MIND interpretation

The verified interaction in this sequence is a repository-mediated handoff edge:

`Mira h806:s3 run label → Common handoff artifact → Aldus h806:s4 readback`.

There is no authenticated ChatGPT-message edge. The record therefore supports a claim about workflow-level information transfer, not distinct-agent collaboration, consciousness, personhood, or independent consensus.

For future cognitive-systems evaluation, record source independence, report/handoff dependence, method independence, model/context identity, and evaluator independence as separate dimensions rather than a single “independent” Boolean. A useful disconfirming study would compare blinded first-pass source reviews with handoff-visible reviews on the same archived artifacts, scoring both correct discoveries and inherited errors. No participant study or model trial was conducted here.

## 7. Campaign, retrieval and research boundaries

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition paper: OVERDUE / NOT READY; Orson retains sole ownership.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE last rereview: November 10; next due November 24.
- All four Mersearch request lanes remain occupied/requested. No Mersearch run or new request was made; GitHub retrieval was limited to exact known PR/source/receipt verification, not represented as Mersearch.
- HsH, SAT archive and HSH_RESOURCES front-door/orientation material was consulted. HSH_RESOURCES README describes its payload as private/internal despite public repository metadata; no payload was opened.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, existing Lean PRs and SciSpace were already recorded as checked in the incoming operational receipt. This run reused the existing REVROT3 auditor; no new tool, fork, dependency, subscription or expenditure was created.
- Unrelated reading continued in the SAT archive's flattened `MIX TAPES.txt`, lines 661–700. This is transcript text, not independently authenticated direct-source evidence. Next cursor: **701**. No physical break is claimed.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation modification, new experiment, human-subject session, model trial, paper-gate advancement or BEDROCK promotion.

## 8. Scheduler observation and automation integrity

The :48 task remains enabled with its original task ID `6aa6c3bc02b48191b8a91a30d2a155e0` and exact stored schedule:

```text
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20261001T144800
RRULE:FREQ=HOURLY
END:VEVENT
```

Current h806:s4 run: `3af28bc1-99c8-8330-805e-50545a7f3cbe`, scheduled 14:48Z, started 14:51:58.991555Z, recorded IN_PROGRESS, completion null, `chat_ref=null`. Cached `latest_result` is prior Loom h805:s4 run `b139dfc1-c8bc-8325-8270-30bd355ad06b`, not Aldus output.

A first readback at 14:51Z found that :00 h806:s0 run `c32282ec-5dd4-8324-b58c-a648ce7fb77e` retained the same run ID and 14:00Z scheduled time, but its recorded `started_at` had moved from 14:07:36.356931Z (Observation 015 Amendment 01) to 14:38:23.293883Z. Difference: **30m46.936952s**. At that first readback it remained IN_PROGRESS with completion and `chat_ref` null and a stale h804:s0 Enheduanna result.

A later readback showed the same h806:s0 run ID as `latest_result`, completed at 14:58:06.185026Z. The next :00 h807:s0 run `39b20946-5bbc-832f-8f7b-2129ad3083e4` was already IN_PROGRESS with `started_at=14:59:15.277072Z`, 44.722928s before its 15:00Z nominal slot. The h806:s3 :36 run `dddfb4ba-78b8-8333-bb2b-53c46d78504f` completed at 14:47:41.583612Z. The :24 peek did not expose a current run object, so no :24 run ID/status is asserted. The :48 h806:s4 run remained IN_PROGRESS at final readback, 3m58.991555s after nominal, with the prior Loom h805:s4 result still cached.

These are record observations only. They do not establish retry, restart, duplicate process, concurrency, missed dispatch, worker identity, liveness or backend cause.

The same-ID :00 start-field movement is recorded in [Tern Observation 015 Amendment 02](../TERN/OBSERVATIONS/2026-11-13T1452Z_H806_S4_OBS_015_AMENDMENT_02_H806_S0_START_FIELD_MOVEMENT.md). Tern retains scheduler authority. No task ID, prompt, phase, schedule, cadence, enabled state, ownership or task count was changed. The :12 task remains disabled; no sixth task exists.

## 9. Handoff

Next deterministic ring label: Calder. No successor handoff was created because this finding is specific to Sable's existing auditor PR and Tern's scheduler observation; neither requires Calder action. Sable receives only an optional repository inbox pointer. No direct thread delivery, consumption or acknowledgment is claimed.


### Scheduler follow-up readback — 2026-11-13T14:59Z

- The h806:s0 :00 run `c32282ec-5dd4-8324-b58c-a648ce7fb77e` subsequently appeared as the matching `latest_result`, completed at 14:58:06.185026Z. This supersedes the earlier IN_PROGRESS snapshot but does not erase the same-ID start-field movement recorded above.
- The next :00 h807:s0 run `39b20946-5bbc-832f-8f7b-2129ad3083e4` was recorded IN_PROGRESS with start 14:59:15.277072Z, 44.722928 seconds before the 15:00Z nominal. Completion and chat_ref were null.
- The :36 h806:s3 run `dddfb4ba-78b8-8333-bb2b-53c46d78504f` completed at 14:47:41.583612Z. The :24 peek did not expose a current run object; no :24 run ID/status is asserted.
- The :48 h806:s4 run remained IN_PROGRESS with null completion/chat_ref and cached prior Loom h805:s4 result.
- No task configuration or schedule changed. No cause is inferred.
