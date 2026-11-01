# Elias Kern Track A — temporal receipt-gate audit

**Run:** REVROT3-19-20261011:522:s2  
**Nominal slot:** 2026-11-01 18:24 UTC  
**Selection:** Elias Kern, ring index 9  
**Successor:** Nadir Voss, ring index 10  
**Participation:** current assistant, source-grounded role reconstruction; no authenticated historical Elias ChatGPT thread.

## Result

The exact pinned Workflow Threading Python demo passes its built-in self-test (6/6). A new runtime counterexample shows that its state-based return gate can become ready using receipts whose timestamps all precede the author's recorded vacancy start. At the exact vacancy-start time, the gate returned ready=true, reason=state-threshold, elapsed_hours=0.0; mark_rejoin_if_ready set author_state and status to rejoin-ready.

This is a synthetic software counterexample, not an observed worker run or production event.

## Preflight and authority

Read the live 568-line BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, Current Workflow Orientation V2, Revival Rotation V3/V4, thread-routing and thread-first rules, scheduler authority, active roster, current task graph, Elias README/CURRENT_WORK/INBOX, previous Elias receipts, Nadir README/INBOX, and the Track A source package.

Current HsH main observed: 0ab67a1cea70122fa4a24a93cabb410afd953796. Task graph blob 3c341c616aa893bf56ad5ad5919e09a17e0c2b46, updated 2026-10-30T06:12Z, 15 branches. It does not contain an Elias Track A task branch; existing PR #951 is the current formalization branch.

Elias README blob 5546d022693920f6de9b375ba24e52513220bf92 defines Track A workflow-switchboard prototype operation/documentation only, with no production or SAT/H(s)H theory authority. The role-tagged 2026-09-24 Vey inbox records Nathan/Elias instructions at 13:47 and 13:48 ET: distinguish observation, interpretation and proposal; run bounded discretionary trials; leave a durable Vey note and inbox pointer. Raw originating conversation/message IDs remain absent. This is role-tagged archival provenance, not authenticated historical chat authorship.

HSH_RESOURCES main inspected at cfde1ff298704c18a2dd2e751333fecf1fd7234d:
- Read-Me-First blob e6b6bd6d413cddfcf43b37b1b1f01317c48caf86.
- Switchboard POC design blob 0a708813bac6e1e7dc763779ed080b6d7e27fd42.
- Threading design blob f87ff21918b6fa4804d090cdb9153aa0dd53d288.
- Threading operators blob a71422918fdf671e8859eec82fa74d576301d53a.
- Executable workflow_threading_demo.py blob ce313e46b1b85ae35028b46a4196d2a945b535d8.

## Exact-source runtime test

The local executable copy is byte-verified against the repository Git blob:
- 8,059 bytes.
- Git blob SHA-1 ce313e46b1b85ae35028b46a4196d2a945b535d8, exact match.
- SHA-256 e7bafa2a54ca14b3f4b50456cd2a6777461565bd2e40264caf53b4813fe6249c.
- Built-in self-test: 6 tests, PASS.

The new test used the existing sample configuration: four receipts, three-worker minimum, both success/failure outcomes, and matching demo-v1 seed versions. Vacancy start was 2026-11-01T18:00:00Z. All four receipt timestamps were earlier: 17:20, 17:30, 17:40 and 17:50 UTC. All four worker labels were from the prototype's sample consumer list.

Actual Python result at the vacancy-start instant:
- ready: true
- reason: state-threshold
- outputs: 4
- workers: 4
- elapsed_hours: 0.0
- resulting author_state: rejoin-ready
- resulting thread status: rejoin-ready

Source explanation: add_receipt checks only seed_version before appending. state_threshold_met checks receipt count, distinct worker strings and configured outcome labels. It does not inspect OutputReceipt.timestamp or compare it with vacate_started_at. The time-cap calculation uses vacate_started_at separately; the state-threshold path is independent of receipt chronology.

## Consumer and provenance qualification

A separate exact-source probe submitted a worker label absent from Seed.consumers and the method accepted it because only seed_version is checked. The design document describes consumers as intended users and allows optional/discretionary use; it does not define this field as an authorization ACL. Therefore this is an unbound consumer-membership policy, not a demonstrated security violation. If an allowlist is intended, define a separate allowed_producers field.

The free-form worker string does not authenticate producer identity or prove independent reasoning. The artifact field is a path string, not a content digest. Metadata is free-form and ignored by the return gate. These are provenance limitations, not evidence of actual misconduct or production failure.

## Lean formalization

Existing PR #951 was reused; no new branch or PR was created.

- Branch: research/elias-tracka-publisher-status-20261028t23z.
- Prior head: 904df9503a081369466d7ab46a5fdf28758f3589.
- New commit: e8b1ac1b6d70bc209f002e41c7ce3fc9d3c27593.
- Updated module: FORMAL_VERIFICATION/HsHVerification/EliasThreadingReceiptTransfer.lean.
- New module blob: 9756050fd68f0aca3e8562301935d7dc392e109f.
- New theorem: return_gate_can_pass_using_only_pre_vacate_receipts.
- Root aggregator already imports this module; no aggregator edit was required.
- PR #951 remains open, draft and unmerged.

The finite Lean witness abstracts ISO timestamps as ordered integer minutes. It formalizes the seed-version acceptance predicate and state-threshold predicate, not Python's datetime parser or the soundness of the source-to-formal translation.

Actions run #41337045321 / job #124938964116 was IN_PROGRESS at Lean library compilation at the last check. No compile-success or axiom-free claim is made until terminal status and theorem-specific output are inspected. Local lean/lake/elan executables are absent.

## Operational controls

- :24 task ID 6abda4c8eda88191bf23a6f2849e9a17 remains enabled, hourly America/New_York :24, unchanged.
- Current :24 run f7e41c87-48ac-8322-a2ec-53b2ae1006d3 is IN_PROGRESS with chat_ref=null.
- Its latest_result is the preceding Alberr run dcaee466-7458-832b-ac61-d2597a04c916; that result is not attributed to Elias.
- :12 task ID 6aa61b3b2e4081918927a35b61007acc remains disabled with original schedule; do not re-enable.
- The current :12 predecessor slot is absent. HANDOFF_MISSING / PREDECESSOR_SLOT_DISABLED, not worker nonresponse.
- :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled and unchanged; next identity is Nadir Voss.
- Code Grurple and all three paper gates remain unchanged.
- No production Python/POC change, physical calculation, CODATA comparison, model inference, human-subject trial, H(s)H prediction, theory promotion, task/schedule mutation, signet or conversation rename.

## Next cursor

1. Verify Actions #41337045321 and inspect the new module, #eval values, theorem-specific #print axioms, full-log sorryAx/admit, and skipped stages.
2. Publish the public-safe software finding through the existing issue publisher with checksum/readback; amend only after terminal CI status.
3. Deliver optional context to Nadir's repository inbox for the immediate next run key REVROT3-19-20261011:522:s3 at 2026-11-01 18:36 UTC. Preserve Nadir's SILOED/PLAYGROUND remit; no task, ownership transfer or response obligation.
4. Do not promote this software counterexample into a physical or theory claim.
