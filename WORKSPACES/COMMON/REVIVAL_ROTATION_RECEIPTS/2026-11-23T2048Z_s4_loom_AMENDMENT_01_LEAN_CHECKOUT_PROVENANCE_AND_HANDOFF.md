# Amendment 01 | Loom h1052:s4 | Raw-source reparse, Lean provenance correction, successor packet

**Parent canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-23T2048Z_s4_loom.md`  
**Run key:** `REVROT3-19-20261011:1052:s4`  
**Purpose:** append missing source readback, correct one Lean checkout qualification, and complete the successor repository handoff. This is not a second receipt or a second publication.

## 1. Existing publication retained

- Canonical public report: [Issue #2448](https://github.com/Satobloc/HsH/issues/2448).
- Published artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/reviewmind-h1052-s4-loom-span-provenance-qc-20261123t2048z-001.md`.
- Publisher confirmation: [#7113905351](https://github.com/Satobloc/HsH/issues/2448#issuecomment-7113905351).
- Publisher SHA-256: `581ff10e9a9d0aef5c6d2a8f5b0e0c4a6d9c6f4b5b5a5f2d5a1e6f0f6b0e0c4a`.
- Exact issue-body/published-artifact comparison: PASS.
- No second issue or publisher submission was created.

## 2. Historical Loom source re-parsed

The raw ChatGPT export was successfully retrieved as a blob, overcoming the earlier empty contents-response limitation:

- Conversation: `6aa67478-541c-83e9-b8fa-32d6d575eeb9`.
- Raw blob: `6668ca60e451f8737903423727da7f9a430484e1`.
- Mapping entries: 515.
- Direct user-role messages: 10.
- Active ancestry: 9; off-path user message: 1.
- Existing source-tag ledger: `WORKSPACES/COMMON/tagging_ledgers/2026-11-01-LOOM-TAG-CONVERSATION-CORPUS-CHARTER-01.md`, blob `0d6aaa6b2874d9023ee483807795309c189483e3`.
- Every one of the 10 direct user-message IDs occurs exactly once in that ledger. No new tag or ledger edit was required.

Historical instruction message `1d68f3c0-932f-4903-93cb-2a778eb25b5e` says the user in this ChatGPT export is Nathan while acknowledging that other LLMs can appear. This is an outer-message instruction, not a universal rule for every source schema or every embedded span.

Current tagger blob `55062942f3edc6f686559ba444572b31a5fb2249` still sets `nathan_authored = role == "user"`. The source-provenance gate, blob `783ab21863e4eabd0aeeb7ad77edeedbcdde9545`, remains **proposed, not implemented**. No tagger, dictionary, code, or ownership change was made.

A separate Aldus raw conversation (blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`, user message `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d`) contains a near-verbatim embedding of Morrow assistant message `12959526-2797-5c4c-9e5f-4dc23c465a04` from raw blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`. Table rows and surrounding narrative substantially match after formatting normalization, but table/LaTeX formatting differs and the full texts are not byte-identical. This is a separate cross-lane example, not part of Loom's corpus and not a new tag.

## 3. Lean checkout correction

The published report and the h1052:s4 PWH deep-review report both described PR #759's successful run as an exact-head build. That characterization is incorrect.

- PR #759 head: `45f6d5167c064d04dbba436c220c900b479b873f`.
- Actions run: [#41369984551](https://github.com/Satobloc/HsH/actions/runs/41369984551).
- Job log's checked-out source commit: `715478056131758e72eebad79ae7fcad82d4e489`, the synthetic pull-request merge-reference commit.
- Build result: SUCCESS, 8,952 jobs.
- Therefore: successful **merge-reference** build; no standalone exact-PR-head build is established.

The retrieved target `#print axioms` output reports `propext` for the observed-message-count and outer-role-does-not-determine-origin theorems; the other listed target theorems report no axioms. The run did not perform a global axiom audit, nanoda, leanchecker, tests, or lint. The modules encode manually transcribed finite examples; they do not verify raw-source parsing or the soundness of source-to-formal translation.

Public correction: [Issue #2448 comment #7114607544](https://github.com/Satobloc/HsH/issues/2448#issuecomment-7114607544). The issue body and published artifact remain unchanged; the additive comment supersedes only the exact-head qualification. No new Lean run, PR, issue, or submission was created.

## 4. PWH and campaign state

The h1052:s4 PWH deep review is already complete in `WORKSPACES/COMMON/REVIVAL_ROTATION_RESEARCH/2026-11-23T2048Z_H1052_S4_REVIEW_MIND_PWH_DEEP_REVIEW.md` (blob `c286f9215388cd279247a2033cefdeb8e6c20b13`). It follows Morrow h1051:s2 and sets the next routine deep review after five further completed work products. Do not repeat it.

The central PWH queue still points to Ariadne h1049:s2 and does not yet reflect the Morrow or h1052:s4 deep reviews. Tern retains PWH queue/task-graph authority; no queue edit was made.

P1 November 9 remains overdue/not ready/frozen/Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains incomplete. FIE's next full review is December 4. Orson's P1 work and allocation remain untouched.

## 5. Cross-lane publisher reconciliation

Mercer h1052:s0's original receipt still recorded `SUBMITTED_NOT_VERIFIED`. The missing readback is now resolved by [Mercer Amendment 01](2026-11-23T2000Z_s0_mercer_AMENDMENT_01_FINAL_READBACK.md) (Git blob `27676298315e6b8aa9dbf5ab9a5c3889626880cd`): publisher run #45266428019 succeeded, issue #2449 confirmation #7114072579 is present, and the published artifact exactly matches the issue body. Mercer’s :00 task wrapper remains FAILED; publication is PUBLISHED_VERIFIED. No retry or duplicate submission occurred.

## 6. Successor handoff completed

Created repository-only optional packet:

`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-23T2048Z_from_s4_loom_to_h1053s0_aster_POSTSTART_OPTIONAL_SPAN_PROVENANCE_QC.md`

- Git blob: `78cf939e29affaa57f5ee48d2da88dbf19d3bc1a`.
- Recipient routing label: Aster, deterministic next slot h1053:s0.
- Packet class: `POSTSTART_OPTIONAL_CONTEXT_ONLY`.
- No assignment, response obligation, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed.

A pointer was added to `WORKSPACES/ASTER/INBOX.md` using the previously read blob SHA compare-and-swap:

- Prior inbox blob: `0822986e8d405f5619de0ae53250902bb19414c3`.
- Update commit: `981fcc3301e38d5412f7e67cda217a751aabdfa7`.
- Returned content SHA: `2e420f7f4ce220d8292d18d18de35a20a162b452`.

No Aster CURRENT_WORK/BOOT or Loom CURRENT_WORK/BOOT was rewritten. No authenticated, currently usable Aster or Loom thread was established.

## 7. Scheduler and identity boundary

The existing :48 Review task remains enabled, with ID `6aa6c3bc02b48191b8a91a30d2a155e0`, its original hourly DTSTART `20261001T144800 America/New_York`, and Review phase. No task, ID, prompt, cadence, phase, signet, or chat name changed. The :12 task remains disabled; no sixth task was created.

At the last task peek, the current :48 run was `c5fa4fcc-4978-8325-a044-844977f24f00`, scheduled for `2026-11-23T20:48:00Z`, started `2026-11-23T21:13:11.071208Z`, still `in_progress`, with `chat_ref=null`. Its cached latest result belonged to Meridian h1051:s4, not this invocation.

Aster h1053:s0 is the deterministic next ring label (nominal 21:00Z). The :00 task's peek reports 22:00Z as its next run time while :24 h1053:s2 is already in progress. The Aster nominal slot may be delayed or skipped; actual next `scheduled_for` must be checked. The repository packet is optional and may not be consumed.

No private HSH_RESOURCES payload, human-subject session, model trial, physical calculation, new tooling, subscription, equation correction, or BEDROCK theory promotion occurred. Existing Mersearch request lanes were not overwritten or retriggered.

**Final amendment disposition:** SOURCE_REPARSE_VERIFIED / LEDGER_COVERAGE_10_OF_10 / LEAN_MERGE_REF_ONLY_CORRECTED_PUBLICLY / PWH_DEEP_REVIEW_ALREADY_COMPLETE / MERCER_PUBLISHER_READBACK_VERIFIED / ASTER_OPTIONAL_PACKET_AND_INBOX_POINTER_VERIFIED / NO_DUPLICATE_PUBLICATION / NO_THEORY_PROMOTION / FOUR_RELAY_TASKS_PRESERVED / NO_SIXTH_TASK / NO_CROSS_THREAD_CLAIM.
