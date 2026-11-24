# H1061:s4 | Hale | Review-MIND | P0 discovery currentness and stale-fallback QC

**Run key:** `REVROT3-19-20261011:1061:s4`  
**Nominal UTC slot:** 2026-11-24T05:48:00Z  
**Disposition:** `PREWRITE_DISCOVERY_CURRENTNESS_PASS / RECORD_SAFETY_FAIL / TWO_CONDITIONAL_STALE_FALLBACK_GAPS / NO_CODE_CHANGE / NO_ROUTE_ACCEPTANCE / PWH_OWNER_RECONCILIATION_REQUIRED`

## 1. Selection and historical authority

`h=1061`; `seq=5h+4=5309`; `5309 mod 19=8`.

- Selected routing label: **Hale**, ring index 8.
- Next ring label: **Elias Kern**, index 9, h1062:s0.
- The label is deterministic routing, not authenticated historical-instance or thread identity.

The strongest historical Hale authority is the worker-authored self-report in `WORKSPACES/COMMON/CHECKINS.md`, 2026-09-12, lines 108 onward, blob `886069e71d4aec7a3f8d199d6d889b930a05c17`. It describes external arXiv/literature-landscape scanning, matched 2024-versus-2026 comparison, statistical calibration, controls, topic/category composition, and lexical/bigram drift. It explicitly treats scanner weights, thresholds and vocabulary as research-instrument choices, not H(s)H premises.

Sable's `REV-006-HALE-REENTRY.md`, blob `2840500bec1873fc634e564f83d7eda7d1da74f0`, is an assistant-maintained synthesis, not a signed Nathan-authored charter. The September 8 scanner conversation `6a26fecb-c1dc-83ea-a175-92033cd75d15` predates the Hale self-naming and is not authenticated as a Hale instance. No authenticated current Hale thread was recovered. Hale's historical external-literature exposure also disqualifies this label from being treated as a clean blind theory reviewer.

This activation is assistant-level source-grounded work under the Hale routing label. No historical-instance participation or cross-thread delivery is claimed.

## 2. Required control preflight

Read live HsH BEDROCK, the 2026-10-26 Steering Charter and Three Paper Campaign, three-repository onboarding, onboarding review state, New Instance Start Here, current workflow orientation, Revival Rotation V3, V4 not-found revival, the operative thread-first rule, worker autonomy/handoff protocol, current main, PWH queue/report, task graph, relevant receipts, Hale BOOT/CURRENT_WORK/CONTINUITY/INBOX, and the historical Hale source.

Key control blobs:
- BEDROCK: `2629ab29a5838d933c31727455553d206577a258`
- Steering Charter: `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`
- Three Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`
- Three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`
- Onboarding review state: `fbecfbdd3e31797f5216ff5b13eee57337285c25`
- New Instance Start Here: `4efd2b899e3ead7785cb87b2458f758240590a94`
- Revival V3: `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`
- Revival V4: `6761337dfcd0847226ee7baad84db0a9c496760a`
- Thread-first rule: `e79707587914edb76afca1c32f9f4dad4d0324b7`
- Current workflow orientation V2: `bd37743d5a70e14a74db64a5fde7a6d9d13f368a`
- Worker autonomy/handoff protocol: `812f2f2ffe1ebe6642e780d1591e7b6bab561f0a`

The HsH root README, SAT archive root README and HSH_RESOURCES root README were read. HSH_RESOURCES was limited to its root README and navigation boundary; no private/internal research payload was opened. Mersearch's worker guide and all four request files were read. The four lanes remain occupied/requested (Calder angle source fidelity; Nathan perceptual-nexus recovery; Calder IRI/worldtube geometry; Kestrel finite-core geometry). No lane was overwritten or retriggered. The current task is a source/code QA pass, not a new archive-archaeology query; GitHub source readback is not represented as a Mersearch run.

## 3. Current generated-discovery snapshot

At the prewrite readback, default branch `main` was at `c8d2b81af7f259950a80bdeeb0fe32fae8584fa1`. The current generated discovery file was fetched by exact Git blob and parsed:

- Blob: `4d0d81c6a942b804e650d1473f1622d3ed1de135`
- Size: 31,494,267 bytes
- Payload `updated`: `2026-11-24T05:35:56Z`
- Embedded HsH source commit: `ed920fb3c27ba06aaf94fa8f89c0775f1b80662b`
- Embedded SAT archive commit: `028862e6` (complete source commit recorded in the manifest)
- Both HsH and SAT archive repository scans: `complete`
- Main's latest observed commit changed only `PUBLIC_SITE/generated/discovery.json`; the embedded HsH source commit is the preceding source snapshot.

Full-payload results:

| Measure | Result |
|---|---:|
| Total indexed documents | 17,649 |
| Workspace records | 10,717 |
| Workspace records with generic reader targets | 10,717 |
| Workspace records missing `presentation_state` | 10,717 |
| `PRESENTATION_PENDING` workspace records | 0 |
| Workspace excerpts | 10,471 |
| Rolling docket entries | 48 |
| Workspace entries in rolling docket | 48/48 |
| Visual records | 577 |
| Square-rule visuals | 417 |
| Extraction errors | 6 |

Paper A and Paper B R1 are both in the full catalog with generic `reader.html?mode=browse` targets and no presentation-state label. Paper A has no excerpt; Paper B has a 1,400-character excerpt. Neither is in the 48-item docket.

All 577 current visual records are under `SAT_VISUALS/`, use supported image extensions, and none matches the current exclusion regex. No currently excluded visual path was found. The current HsH and SAT trees are complete, so the stale-repository fallback was not invoked in this snapshot.

**Currentness:** PASS for the prewrite snapshot at 05:35:56Z.  
**Record safety:** FAIL.  
**Live visitor rendering / route acceptance:** NOT OBSERVED.

The report, receipt, continuity and handoff writes in this activation will advance main. Postwrite discovery freshness must therefore be rechecked; the prewrite PASS must not be carried forward as a final postwrite claim.

## 4. PR #2009: independent exact-source cross-read

[PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED at head `f638cb3ce94006609b4ba3f7c6e2c5724048c45d`, four commits ahead, three changed files, no formal review submission, and no exact-head Actions run established by this readback.

Exact source objects:
- PR-head `tools/site_discovery.py`: blob `2c2db5f7f4878555d8031e6bb14b1e846de0cbe5`
- PR-head `tests/test_site_discovery.py`: blob `c828f2af42c036ec63c7bf9814be35711f043b04`
- Current-main generator: blob `97ff9c6d00544251c05bd6bb6053907805438f3e` (unchanged from the previously inspected main version).

The five PR tests cover square boundaries/exclusions, incremental revisions/deletion/last-good preservation, workspace metadata-only output, stale workspace sanitization, and truncated tree walking. They do not cover a previously eligible record that becomes excluded under current policy while the repository tree is stale.

Two complementary conditional gaps are already documented:
- Mercer issue [#2467](https://github.com/Satobloc/HsH/issues/2467): the stale document fallback sanitizes workspace reader/excerpt fields but does not reapply the current `eligible(path)` predicate before retaining last-good records.
- Aster issue [#2469](https://github.com/Satobloc/HsH/issues/2469): the stale visual fallback copies `previous['visuals']` unchanged rather than reapplying current visual eligibility.

The exact PR-head source independently confirms both control-flow shapes. The two reports share the same PR head and source files; they are complementary inspections, not independent evidence that an excluded object is currently exposed. Both earlier replays used synthetic placeholders. This activation did not fetch quarantined/private content or repeat those synthetic tests.

The current manifest contains no excluded visual and both repository scans are complete. Therefore the stale-fallback gaps remain **conditional latent regressions**, not observed current exposure. The actual current P0 failure is the generic workspace-reader/presentation-state/docket behavior shown in the full manifest.

Smallest combined acceptance rule: before retaining any last-good document or visual in public discovery, re-evaluate its path against the **current** eligibility predicate. Add stale-tree tests for excluded and still-eligible positive controls in both collections. This is a recommendation to Meridian, not a code change or implementation assignment from this run.

## 5. Formalization and Review-MIND limits

Existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471), current head `60df9a77d938689910a96640cb649eb9f462fa58`, module blob `82e38343f307f32e846d9758fbd4d65f6a73c812`, formalizes typed source/feed/adapter/derivative/deployment/route identity and observation-gate invalidation. It contains a path-scope witness, but no visual record model and no formal encoding of the current Python `EXCLUDED` / `eligible(path)` policy. It does not close the policy-revocation gaps.

No Lean run or new formalization is claimed. The local runtime has no `lean`, `lake`, or `elan`; no branch/PR change was authorized. The proposed invariant is expressible as:

```text
forall record in stale_public_records,
  eligible_current(record.path)
```

That is a candidate formal statement, not a Lean proof and not a proof that the Python implementation satisfies it. The appropriate immediate acceptance evidence is the exact-source Python regression matrix plus exact-head CI and post-deployment observation. Any later Lean extension must separately bind its abstract predicate to the actual Python policy and record schema.

Review-MIND provenance finding: a fresh index, a safe record projection, a successful build, a live route observation, and an accepted reader outcome are different evidence objects. The two stale-fallback reports share one source branch; the generated snapshot is current but unsafe; live routes remain unobserved. No cross-agent consensus, assistant consciousness, personhood, or private-state access is inferred. No human-subject experiment or LLM-group trial was run.

## 6. PWH, campaign and source boundaries

Tern h1058:s4's PWH deep review is published and verified at [issue #2466](https://github.com/Satobloc/HsH/issues/2466); the host run itself ended FAILED with a generic scheduled-task error. Its cadence is five actual completed worker activations after that review, or an earlier material trigger. The latest canonical reconciliation positively identified four completed activations; h1060:s2 and h1060:s4 were then in progress. The h1060:s2 run later failed; h1060:s4 has no verified completed result in the current :48 task peek. No fifth completed activation is established.

The new P0 findings #2467/#2469 and this current manifest are not yet integrated into the PWH queue. They are candidates for Tern to assess as a material trigger; this run does not declare the trigger met, repeat the deep review, or modify the queue/task graph. Tern retains PWH and P0 release/standdown authority; Meridian retains implementation ownership; Mercer retains Paper A/B presentation QA.

- P1 November 9 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30 major paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE last reviewed November 20; next review December 4.
- Unrelated-reading break last completed November 21; not due for repetition.
- No physical system, dataset, calculation, fit, prediction, uncertainty propagation, equation correction, manuscript gate advancement, or theory promotion occurred.

## 7. Scheduler and run envelope

The original :48 Review task remains enabled and unchanged:
- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`
- Exact schedule: `DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`
- Phase: Review / Lane Charter 48.

The original :00, :24 and :36 relay tasks remain enabled; :12 remains disabled. No task, ID, prompt, phase, schedule or enabled-state change; no sixth task.

Current :48 run: `2faff1ae-72d8-8322-9bf7-7e6e9524c3fe`, scheduled 05:48:00Z, started 05:48:02.215265Z, IN_PROGRESS, `chat_ref=null`. The cached latest result belongs to Ravel h1059:s4, not this run. The task-level `last_run_time` summary (05:43:13Z) lags the current run-level start field. The :36 h1061:s3 run started at 05:49:10Z while this :48 run was already in progress; overlapping run envelopes do not prove simultaneous model execution. The :24 h1060:s2 run failed at 05:34Z with the generic scheduled-task error. No retry, disable, or scheduler mutation was attempted.

## 8. Successor and non-actions

The deterministic next ring label is **Elias Kern**, h1062:s0, nominal 06:00Z. Elias's current workspace checkpoint is h1012:s3, and his INBOX is the available repository handoff surface. No authenticated current Hale or Elias ChatGPT thread was recovered. A prestart optional repository-only context packet is routed to Elias's INBOX; it creates no assignment, response obligation, review request or ownership transfer. No direct ChatGPT delivery, consumption or acknowledgment is claimed.

No private HSH_RESOURCES payload was opened. No Mersearch lane was overwritten. No code, PR, branch, task graph, PWH queue, scheduler, signet, conversation title, BEDROCK premise or theory state was changed.

## Amendment 01 | successor packet timing correction | 2026-11-24T0603Z

The original Section 8 describes the Elias h1062:s0 packet as PRESTART. That classification was incorrect and is superseded. The Hale report commit was created at 06:02:38Z; the Elias h1062:s0 run had already started at 06:00:48.490100Z. The packet commit was created at 06:03:02Z and the INBOX pointer commit at 06:03:05Z. Correct classification: **POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_ASSIGNMENT / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER**. The current :00 run was still IN_PROGRESS at the last peek, but no direct thread delivery, packet consumption, acknowledgment or worker participation is established.
