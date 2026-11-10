# Elias Kern Track A | Proof-status projection and build-mode binding audit

**Run key:** `REVROT3-19-20261011:727:s3`  
**Nominal slot:** 2026-11-10 07:36 UTC  
**Disposition:** `SOURCE-VERIFIED / TWO-RECORD PROJECTION COUNTEREXAMPLE / ACCEPTANCE CONTRACT SPECIFIED / LEAN NEW-PROOF NOT RUN / TRACK-B PENDING / NO POC OR PR CHANGE`

## 1. Identity, authority, and scheduler

The deterministic ring calculation is `h=727`, `seq=5*727+3=3638`, `3638 mod 19=9`: Elias Kern is the selected ring label, with Nadir Voss next at index 10. This does not authenticate an Elias ChatGPT instance or thread.

The :36 automation remains enabled under its existing ID `6a9f52b69ec08191b0a2ba24a074f781` and exact stored schedule `DTSTART;TZID=America/New_York:20261001T143600; RRULE:FREQ=HOURLY`. No task, prompt, ID, cadence, phase, or enabled state was changed. The current occurrence is `fadf6f0f-3044-8322-9d9b-2cd4d4766969`, scheduled 07:36:00Z, started 07:40:36.693791Z, still recorded IN_PROGRESS at the last peek, with `chat_ref=null`.

The Elias workspace README is an assistant-derived role summary, not a standalone Nathan-authored specialist charter. The recoverable remit is Track A workflow-switchboard prototype operation/documentation, sandbox-only, without production-workflow or SAT/H(s)H theory authority. Personal-context retrieval found no authenticated usable current Elias thread or exact current conversation ID. This is source-grounded assistant work under the ring label, not historical Elias participation.

The expected same-hour predecessor h727:s2 had not appeared at the time of this check. The :24 automation's last observed run was h726:s2, scheduled 06:24Z and completed at 07:38:12Z. No h727:s2 receipt or handoff was found. This is an in-flight/delayed predecessor state, not evidence of failure or nonresponse.

Nadir's README and existing inbox explicitly preserve his independent all-plus SO(4)/stacked-holonomy playground and state that earlier Elias packets impose no task or request to inspect/modify Track A. No successor handoff was created and no task was routed to Nadir.

## 2. Live source and control surfaces checked

- HsH `main` before this documentation commit: `cc5c5994bc8cbe7f7bdfbf74f570371dc0eeee94` (tree `d0d9523b575dcd3f368cd7f304217ae98e244770`).
- HSH_RESOURCES `main`: `a1cee60e54c857f799d80b0174e6285a9b39465c`; SAT archive `main`: `7a46a3077c20617c0163071bcdd8ab7d2e42e57e`. All three repository API records reported zero forks.
- Live BEDROCK: blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`, 104,153 characters / 667 lines fetched. The 2026-11-08 Primary Operational Guideline takes precedence where it directly conflicts with BEDROCK and remains subordinate to FIE; guideline blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`.
- Steering Charter 2026-10-26: `04822f3e48f746e9e464d893636ed4a670d68683`; Three Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- `NEW_INSTANCE_START_HERE.md`: `43b577d42b8cced83f8836934598081685ea3ff3`; three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`; Revival Rotation V3: `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`.
- Current workflow orientation: `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f`; active automation roster: `6b0bf56316fe14bfd2b0e925154025bd8d04eaa1`; execution leases: `b2342e6603826108a9e3248ee821e4fb93d67671`; task graph: `eafcf5d640f06ae7119e2ea2a697c0606205446c`.
- Elias README: `5546d022693920f6de9b375ba24e52513220bf92`; pre-run CURRENT_WORK: `9a90b425531061597087aab98424ec96c61c6864`.

The task graph's 16 declared branch count versus 18 branch records remains unresolved and under Tern's reconciliation authority. No graph edit was made.

## 3. Existing formalization and the missing join

PR #951 already contains three relevant components; this run did not create a duplicate type or new PR:

1. `EliasReceiptEvidenceAxes.lean`, blob `47bb681a45958754601263600737562188ecebfc`, is a four-field product of categorical statuses for source, formal proof, publisher readback, and chat delivery. Its field-update theorems establish structural field independence, not independent sources, agents, or reasoning.
2. `EliasProofTargetIdentity.lean`, blob `8fa26f99f22eeafcbc6a26cbc2f6f4b1c58646c5`, defines `ProofTarget`, `ProofRecord`, and `acceptedFor`. The target carries repository, PR number, PR head SHA, tested commit SHA, workflow ID, run ID, job ID, module name, and theorem name. The record carries conclusion, module-built, theorem-axiom-output-present, and no-sorry status. `acceptedFor` requires exact target equality and all encoded build conditions.
3. `EliasWorldtubeEvidenceWitnessGate.lean`, blob `938044dc22287c0c953ee59ecf743322c9e5b80d`, defines `ArtifactWitness` with locator, optional digest/scheme, verification record, method, and time, plus source/classification/trace/build/module/review witnesses. `EliasWorldtubeClaimEvidenceGate.lean`, blob `a34720b07942f973000271a961bf6363d1cd55dd`, composes the broader claim-gate statuses.

The gap is not absence of an exact-target type. It is the missing typed adapter joining the `formalProof` field in the four-axis receipt product to an exact `ProofTarget` plus build/artifact witness. The witness module also does not encode whether a tested commit is the exact PR head or a merge reference with authenticated ordered parents. A status-only projection therefore discards target and build-mode information.

The historical `observed0700` vector remains a status record, not a target-bound build record. Issue #1553 corrected the earlier run attribution and is now PUBLISHED_VERIFIED (publisher comment #6758798190; payload SHA-256 `6f3c3d6d2a6be2332276dc5a1e6817ab937163d3f870c38d5c3537634f9b8e4c`). The later successful merge-reference build of the module must not be retroactively substituted for the older vector's missing target identity.

## 4. Two real build records establish a non-injective status projection

| Field | Orson PR #850 | Elias PR #951 |
|---|---|---|
| PR head | `05b55800701b726b88ff34e57a83f0d0c71f3065` | `f9fa0aad45408ab06e5430c834530854746235f0` |
| Live base at tested merge | `598a45b3feb9378eb8f14ff069ec9080137113c2` | `c7dc2c483f50ae03fc7a7c530829170135e18d92` |
| Tested merge commit | `d07c8503e1986a6405bb3a1fadc3a1e4878bc052` | `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209` |
| Ordered parents | `[598a45b3, 05b55800]` | `[c7dc2c48, f9fa0aad]` |
| Actions run / job | `41111552657 / 124254668125` | `42658236405 / 129302583788` |
| Module / theorem | `OrsonPairwisePCR / evaluatorPCRCount_decomposition` | `EliasReceiptEvidenceAxes / observed0700_repository_evidence_verified` |
| Build result | SUCCESS | SUCCESS |
| `sorryAx` / bare `admit` in full log | `0 / 0` | `0 / 0` |
| Correct build classification | `verified_merge_ref` | `verified_merge_ref` |

Both are Lean 4.34.0 / Lake 5.0.0 merge-reference builds under workflow ID `394031735`. The Orson theorem's axiom output lists `propext`, `Classical.choice`, and `Quot.sound`. The Elias theorem output lists `propext`; the historical chat-delivery-unavailable theorem has no axiom dependency. The Elias module blob matches at PR head and tested merge tree. The Elias run built 8,961 jobs; tests, lint, nanoda, and the separate global axiom audit were skipped. Neither record is an exact-head standalone build.

An independent finite Python comparison over these two source-verified records returned: same projected status = true; distinct proof-target identity = true; differing identity fields = PR, head, tested commit, run, job, module, theorem (7 fields); both ordered merge-parent relations verified; both full logs contain zero `sorryAx` and zero bare `admit`. This is a concrete counterexample to injectivity of the status projection, not a Lean theorem and not evidence about physical H(s)H.

PR #951 remains OPEN / DRAFT / UNMERGED. Its PR API `base.sha` is `61cc8b65ffed70296e0121dbae067892a79c81d4`, while the live target branch is `c7dc2c483f50ae03fc7a7c530829170135e18d92`; the tested merge commit's actual parents are `[live target, PR head]`. The PR review list is empty. No independent Track B disposition was found.

## 5. Improved architecture: preserve the witness beside the status

Reuse the existing `ProofTarget`, `ProofRecord`, `acceptedFor`, and `ArtifactWitness` types. Do not create another target identity schema. The next approved formalization should introduce a target-bound proof-build witness and explicit projections:

- `W`: a `ProofBuildWitness` containing the exact `ProofTarget`, `BuildMode`, live base SHA when applicable, tested commit parent list, module blob at PR head, module blob at tested tree, run conclusion, module-built flag, theorem-specific axiom-output flag, full-log `sorryAx`/`admit` result, and separate statuses for tests, lint, nanoda, and global axiom audit.
- `π_target : W → ProofTarget` preserves the exact target identity.
- `π_mode : W → BuildMode` preserves `exactHead` versus `mergeRef`.
- `π_status : W → EvidenceStatus` derives the categorical formal-proof status from the witness; it must not be manually asserted independently of the witness.
- `ReceiptEvidenceBundle` contains the existing four-axis `ReceiptEvidenceAxes` plus an optional typed proof witness. If a proof is marked verified, the witness must be present and accepted for the exact target. The four-axis projection may remain compact, but the target witness must remain available beside it.

Build-tree conditions:

- `exactHead` is valid only when `testedCommitSha = headSha`.
- `mergeRef` is valid only when the tested commit's ordered parents are exactly `[liveBaseSha, headSha]`, using the live target ref and commit object rather than a stale PR API base field.
- The module blob at PR head and tested tree must match before the target's theorem output can be attributed to that module.
- A proof status can be compile-verified while tests/lint/nanoda/global audit are explicitly SKIPPED. Those stages must not be silently upgraded to PASS.
- Independent source-to-formal translation review, source authorship, publisher readback, chat delivery, and physical validation remain separate evidence axes.

The projection `π_status` is many-to-one: the two real merge-reference witnesses above have the same status but different targets and modules. Therefore no inverse from `.verified` to a unique target or build mode exists. Any consumer needing target identity must use the sidecar witness, not infer it from the status label.

## 6. Acceptance and falsification matrix

| Test | Required behavior | Falsification condition |
|---|---|---|
| Status-only `.verified`, no target witness | Reject as target-unbound | Accepted as fully verified |
| Record target differs from expected PR/head/run/job/module/theorem | Reject | Mismatched record accepted |
| Exact-head versus merge-ref | Preserve explicit build mode and parent relation | Merge-ref rendered as exact-head |
| Module blob differs between PR head and tested tree | Reject target attribution | Mismatch accepted |
| Theorem axiom output missing, `sorryAx` present, or bare `admit` present | Reject proof-build acceptance | Missing/failed theorem evidence accepted |
| Tests/lint/nanoda/global audit skipped | Display SKIPPED, not PASS | Skipped stage presented as passed |
| Independent translation review absent | Compile status may pass; review gate remains pending | Compile success represented as translation review |
| PR API base differs from live base/merge parents | Resolve from live ref and tested commit parents | Stale PR metadata used as build-mode proof |

This is a workflow/software evidence test, not a physical prediction. It has no physical calibration/holdout or observational threshold. No real physical system or dataset was selected, and no H(s)H-specific observable was calculated.

## 7. Limits, controls, and next cursor

- Track B remains pending. Sable's current inbox contains earlier optional context but no disposition of this proof-target projection question; PR #951 reviews are empty. The prior Elias cursor explicitly requires waiting for independent Track B disposition before any POC/PR change. No POC, PR, or production code was changed.
- Local `lean`, `lake`, and `elan` are unavailable. No new Lean theorem was authored or compiled. The two existing Actions runs were inspected directly, including job steps and full logs. The Python finite witness is a counterexample search, not a proof.
- The switchboard POC remains sandbox-only and was not executed in this run. No production workflow authority or Track B ownership is claimed.
- Existing tooling was checked before any proposal: Archive Math Hopper, existing Lean PR #951/workflow, and Whirligig. HSH_RESOURCES is the reference/methods layer; the SAT archive remains historical/provenance. SciSpace is available but unnecessary for this repository/CI question. No new tool, dependency, fork, paid service, or subscription was introduced.
- The live Mersearch connector was not exposed in this runtime; the documented request bridge lanes remain occupied. No Mersearch execution is claimed, no request was created or overwritten, and direct known-path GitHub retrieval is only a bounded fallback, not an exhaustive archive search. No SAT-O or Blockwave equation was retrieved or modified.
- P0 Code Grurple remains ACTIVE; P1 November 9 cognition remains overdue / NOT READY and Orson-owned; P2 November 30 geometry remains HOLD; P3 December 14 full theory remains separate and incomplete. No manuscript, paper gate, BEDROCK, or theory status changed.
- FIE rereview was completed by Aldus at 2026-11-10 00:17 UTC; next date-based review is November 24. No duplicate rereview was performed.
- Lateral reading continued in `SAT_THEORY_ARCHIVE_2023-25/FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, blob `9be7a256d08fcb1aacf3e77b807db0e9555681c4`, lines 141-180. This is an archived assistant-authored dialogue, not a scholarly source or external sociolinguistic validation. Next cursor: line 181. No physical break is claimed.
- The existing public issue #1553 is already PUBLISHED_VERIFIED. No new issue, comment, or duplicate submission was created.
- No signet, chat rename, task mutation, new automation, sixth task, or cross-thread delivery claim.

**Next exact action:** wait for an independently evidenced Track B disposition. If approved, add the typed target/build-mode adapter to the existing draft PR #951, then obtain separate exact-head and merge-reference builds and an independent source-to-formal review. Keep PR #951 draft/open/unmerged and keep the POC sandbox-only until those gates are met.
