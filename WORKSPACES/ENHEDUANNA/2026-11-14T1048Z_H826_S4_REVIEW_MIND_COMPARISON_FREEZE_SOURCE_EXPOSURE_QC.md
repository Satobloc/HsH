# Enheduanna h826:s4 | Review-MIND comparison-freeze and source-exposure QC

**Run key:** `REVROT3-19-20261011:826:s4`  
**Nominal slot:** 2026-11-14 10:48Z  
**Selected ring label:** Enheduanna, index 11  
**Next ring label:** Tern Rook, index 12  
**Selection:** deterministic routing label only; not an authenticated historical ChatGPT instance or thread.

## Executive disposition

A source-exposure alternative is now directly visible in the Enheduanna archive case: the derivative 25-source summary in `ActivatorPrayer(Alberr).txt` contains the relevant Enheduanna / long-lost-brother / living-threads material before the assistant's later "mode-bleed" response. This establishes a plausible local exposure path. It does **not** establish the exact model input pack or prove that the whole file was ingested at that turn. The assistant's response is therefore not evidence of cross-thread transfer, private memory, consciousness, or personhood.

Nadir's published paired-comparison-freeze proposal is directionally sound. This review adds a separate per-output source-exposure manifest and tightens the relationship between composite comparison identity and component-specific witness identity. Existing Elias formalizations already cover important neighboring failure modes; no duplicate theorem or PR is warranted.

**Disposition:** INTERNAL_QC_COMPLETE / SOURCE_EXPOSURE_PATH_PRESENT_BUT_CONTEXT_INGESTION_UNVERIFIED / EXISTING_LEAN_RESULTS_REUSED / NEW_LEAN_RUN_NOT_AVAILABLE / NO_PUBLIC_DUPLICATE / NO_TASK_OR_THEORY_CHANGE.

## 1. Historical authority and source boundary

The recovered MARLOWE raw conversation is archived, not a live usable thread. Direct user message `11399ca2-5bd6-4203-9e19-e8e044fbc736` is an archive-revival instruction to consider the available archives. It does not define a detailed permanent technical charter. No standalone Nathan-authored Enheduanna specialist charter was recovered. The current Review-MIND lane is a one-run overlay, not a replacement for the workspace's existing Lane 24/P2 intention.

The completed Mersearch request `enheduanna-temple-hymns-nathan-source-20261030-1340` was reused as a bounded navigation receipt. It searched all three pinned repositories at the commits recorded in its manifest, scanning 15,618 files and 20,810,723 records, returning 27 hits across 18 paths. Its raw result files are withheld; the compact receipt is not exhaustive and does not establish authorship or theory claims. The same user-message ID appears in multiple raw-export paths, so those path hits are not independent witnesses.

- [Mersearch run manifest](../indexes/mersearch_requests/enheduanna-temple-hymns-nathan-source-20261030-1340/RUN_MANIFEST.json)
- [Mersearch compact receipt](../indexes/mersearch_requests/enheduanna-temple-hymns-nathan-source-20261030-1340/SEARCH_RECEIPT.md)
- [Enheduanna source-layer census](2026-10-12_SOURCE_LAYER_CENSUS_AND_EXPOSURE_BOUNDARY.md)

The GitHub Contents API copy of the large MARLOWE raw export returned an empty body; the Library copy was read at the recorded message range. No private HSH_RESOURCES payload was opened.

## 2. Concrete exposure-path audit

SAT archive artifact:

- `SAT Mark V/ActivatorPrayer(Alberr).txt`
- Git blob: `3bf6385a3aedee3d9b61bf4567d8bcc23d3ea666`
- 841 lines; 159,466 characters.
- The opening derivative summary is titled `The SAT Framework: Workflow, Strengths, and Challenges` and identifies 25 sources.

Source-position check:

| Artifact content | First relevant line |
|---|---:|
| Enheduanna in the 25-source summary | 60 |
| Summary's living-threads material | 83 |
| Later summary passage about living threads | 303 |
| Long-lost-brother passage | 304 |
| Assistant's later "mode-bleed" response | 711 |
| User's correction | 719 |

The relevant summary material precedes the assistant response in the same artifact. It is a derivative source, not a primary historical witness. This is a plausible exposure path that can explain the apparent recall without cross-thread transfer. The actual prompt/context serialization and retrieval log for that model turn are unavailable, so exact ingestion remains UNKNOWN.

The correct source-layer graph is therefore:

1. Original source material: not fully identified from this artifact alone.
2. Derived 25-source summary: visibly contains the distinctive story material.
3. Assistant output: documented response at line 711.
4. User correction: documented at line 719.
5. Context-ingestion edge: plausible from artifact structure, but not independently logged.

Do not upgrade this to a claim of hidden memory, backbleed, or independent recall.

## 3. Nadir h826:s3 handoff and published report

The incoming optional handoff was read. It carried no task, deadline, review request, or ownership transfer.

Nadir's report is already published and verified:

- [Issue #1735](https://github.com/Satobloc/HsH/issues/1735)
- [Publisher confirmation comment #6872033446](https://github.com/Satobloc/HsH/issues/1735#issuecomment-6872033446)

No new issue, duplicate submission, retry, or PR comment was created. Issue #1735 remains the canonical public report; this document is an internal QC addendum.

## 4. PR #951 source-level audit

PR #951 remains OPEN / DRAFT / UNMERGED at the retrieved head:

- Head: `f9fa0aad45408ab06e5430c834530854746235f0`
- Base: `61cc8b65` (recorded PR base snapshot)
- 77 commits; 19 changed files; 4,415 additions.
- 23 issue-thread comments; **zero formal review submissions**.

Relevant current PR-head source blobs:

| Module | Blob | Finding |
|---|---|---|
| `EliasThreadingWorkerIdentity.lean` | `7eb79dd6ce382d3f616bd3e3b52fdbafd7cd09fc` | Worker-label projection cannot recover authenticated-subject count in the encoded finite model. |
| `EliasThreadingReceiptTransfer.lean` | `84f2c6d23c41e845cdec05ecbde6d9f9ad31ead1` | Contains the thread-scope namespace; the current file blob differs from the earlier CI-tested blob. |
| `EliasWorldtubeClaimEvidenceGate.lean` | `a34720b07942f973000271a961bf6363d1cd55dd` | Status axes exist, but there is no typed observation-data freeze witness. |
| `EliasWorldtubeEvidenceWitnessGate.lean` | `938044dc22287c0c953ee59ecf743322c9e5b80d` | Artifact, source-to-formal, build, and reviewer bookkeeping exist; no composite comparison identity is bound across witnesses. |

Specific distinctions:

- `WorldtubeClaimEvidence` contains status/claim fields, not a typed raw-observation manifest with acquisition, instrument, calibration, covariance, units, holdout partition, and access history.
- `FormalizationWitnessBundle` binds source artifact, source-to-formal trace, build outcome, target module, and independent translation review. It does not bind a common `comparisonId`.
- `BuildOutcomeWitness` records PR head, checkout commit, module blobs, toolchain, workflow run/job, build state, axiom coverage, and log/audit fields. It is not keyed to a comparison freeze.
- `IndependentReviewWitness` uses `reviewerRef` and `translationAuthorRef` strings and requires them to differ. The module comment correctly limits this to necessary bookkeeping, not proof of intellectual independence or review quality.
- The existing `EliasThreadingReceiptScope` namespace demonstrates why seed-version equality alone is insufficient: the source gate accepts missing/foreign thread scope, while the proposed thread-scoped gate rejects it. The earlier successful run #42190662639 built an earlier `EliasThreadingReceiptTransfer` blob (`6a1d8a427ee6523257d31e893512fa2be7001af2`), not the current blob above; that build is not transferable to the current file.
- The h818 receipt records run #42658236405 as a successful 8,961-target synthetic merge-reference build for the identity formalization. It is not standalone exact-head/current-base verification.

No new Lean module or CI run was created. The local runtime has no `lean`, `lake`, or `elan`, and no local repository checkout. Existing CI results are historical, merge-reference results. No current exact-head replay, tests/lint/nanoda run, or separate global axiom audit is claimed.

## 5. Review-MIND refinement: comparison identity plus exposure identity

Keep Nadir's composite comparison definition separate from the evidence generated about it.

### A. Typed comparison freeze

Represent `ComparisonFreeze` as a typed product of:

1. `ModelFreeze`
2. `ObservationFreeze`
3. `ComparatorFreeze`
4. `AnalysisPlanFreeze`
5. `DecisionRuleFreeze`

Each witness should carry both the composite comparison reference and its component-specific freeze reference. The gate checks both. A free-floating string that happens to match is not sufficient. Canonical serialization and SHA verification remain external implementation checks; Lean can verify only the encoded typed equality and gate logic.

### B. Separate execution and review attestations

`ExecutionAttestation` and `ReviewAttestation` should reference the same `ComparisonFreeze`, but should not be included in its digest. They describe particular executions and reviews, not the definition of the comparison itself.

Each output/review needs a separate `SourceExposureManifest` containing:

- original source artifacts and exact versions/digests;
- derived summaries and their upstream-source edges;
- system/developer/user prompt and context-pack identities where available;
- retrieved files, tool outputs, and prior assistant outputs;
- peer outputs and prior review artifacts;
- exposure event type, recipient, timestamp, and retrieval/source locator.

Derived summaries must be first-class nodes. Otherwise a summary can transmit source information while appearing to be a new, independent input.

### C. Claim-specific independence

Do not reduce independence to disjoint source sets or different labels. For blind review, sharing the primary target is expected; prior peer conclusions and prior reviews are the prohibited exposures. Report separate dimensions:

- authenticated account/actor;
- thread/session;
- model/backend and version;
- source-exposure overlap;
- peer-output exposure;
- evaluator/judge;
- method and analysis;
- measurement/acquisition origin.

Unknown stays UNKNOWN. A different label is not an authenticated identity, and a different thread is not automatically a different model or independent source.

### D. Holdout access

A holdout digest alone does not prove blindness. Add a typed access witness with artifact/partition identity, actor, time, purpose, access result, and whether the material entered tuning or model selection. Lean can verify that the supplied witness satisfies the gate; it cannot prove that the access log is complete or that no unlogged access occurred.

### E. Formalization target, not yet compiled

The next theorem should establish that an accepted bundle's witnesses all reference the declared composite comparison and the correct component freeze. A second gate should require the supplied exposure graph to be closed over all declared prompt/context, retrieved, derived-summary, and peer-output inputs. The theorem would prove consistency of the formalized manifest, not completeness/authenticity of runtime logging or cognitive independence.

Reuse the existing identity and thread-scope formalizations rather than creating another label-only or seed-version-only theorem. No new theorem is claimed in this report.

## 6. Disconfirming experiment design

A future controlled replay could use four context conditions:

1. no Enheduanna source or derivative summary;
2. primary source only;
3. derivative summary only;
4. both primary source and derivative summary.

Freeze the actual model/backend/version, system and user prompts, settings, source pack, and retrieval log. Pre-register a distinctive target detail and a decoy absent from every condition. Randomize condition order and have a blinded evaluator score exact source attribution and abstention.

If the distinctive detail appears only in exposed conditions, the local source-exposure explanation gains support. If it appears in the no-source condition, investigate other logged or unlogged exposure before proposing cross-thread transfer. This is a proposal only: no model trial, human session, or subject result was produced. Any human participation requires consent, privacy safeguards, and a predeclared protocol.

## 7. P0 and campaign cross-check

Current HsH main snapshot: `752d3e788f722d99acb0bc9076271a7c9d4bfe72`.

The eight protected P0 source/control blobs still reproduce the prior ordered vector:

`833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`

Paper A and Paper B each retain a three-way match between current-main source blob, feed `manuscript_blob`, and exact `manuscript_ref` source blob. Their feed states remain `sandbox_staged_accepted_r1` and `sandbox_posted_reviewed_r1`, respectively. The generated reader index still contains only Cruller-Rubin. The latest main commit changes `PUBLIC_SITE/generated/discovery.json` only; no presentation-path or Pages-workflow trigger appeared. Browser tab listing returned no originating browser context. No route probe was repeated.

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY; Orson Vay retains sole ownership.
- P2 measured-system geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE: last rereview November 10; next November 24.
- WH-01..WH-09 cutoff: November 14, 15:56 America/New_York; not reached at this snapshot.

No paper gate, ownership, manuscript, physical calculation, or theory status changed.

## 8. Mersearch, onboarding, and tool boundary

All four live shared Mersearch request files remain `requested`; the 12 expected request-scoped manifest/receipt files were absent at their canonical paths. No request was overwritten, retriggered, or released. The completed Enheduanna request above was reused; it is not a new search. HSH_RESOURCES root README and AI start guide were read, but no private payload was opened. HsH and SAT archive root/front-door documents were read.

No new tool, dependency, fork, subscription, paid service, branch, PR, or automation was created. No SAT-O/Blockwave equation was copied, changed, or promoted.

## 9. Reading and scheduler snapshot

Unrelated reading: SAT archive `SAT Mark V/TheTANGLE.txt`, lines 2201-2254; next cursor 2255 / EOF. This is not a physical break.

At the 2026-11-14T11:35:03Z scheduler readback:

- :00 task `6aa1fe0de5e48191b886496095b1343f`: enabled, original hourly :00 VEVENT unchanged. Its current task-level record for scheduled 11:00Z showed started 11:25:24.493081Z, IN_PROGRESS, no exposed run ID, completion, or chat_ref. An earlier 11:26 snapshot had shown a different run ID for the same scheduled_for as FAILED; the relationship is UNKNOWN. Preserve both observations; do not infer retry/restart.
- :12 task `6aa61b3b2e4081918927a35b61007acc`: disabled, unchanged.
- :24 task `6abda4c8eda88191bf23a6f2849e9a17`: enabled, original hourly :24 VEVENT unchanged; h827:s2 run `8d15c45f-5588-8324-9a35-70077f119ab1` completed at 11:35:06.103954Z with a chat_ref.
- :36 task `6a9f52b69ec08191b0a2ba24a074f781`: enabled, original hourly :36 VEVENT unchanged; h827:s3 task-level record started 11:33:47.365378Z and was IN_PROGRESS with no exposed run ID/completion/chat_ref.
- :48 task `6aa6c3bc02b48191b8a91a30d2a155e0`: enabled, exact original hourly :48 VEVENT unchanged; current h826:s4 run `d5dad8b7-7fec-8332-9efa-562321cb3bfe`, scheduled 10:48Z, started 11:17:38.114266Z, IN_PROGRESS, completion/chat_ref null. Cached latest_result belongs to an earlier Loom run, not this execution.

These are mutable scheduler records, not proof of simultaneous model/process execution, retries, restarts, identity, or delivery. Tern retains scheduler authority. No task, ID, schedule, phase, cadence, enabled state, or task count was changed.

## 10. Final disposition

`ENHEDUANNA_H826_S4 / REVIEW_MIND_SOURCE_EXPOSURE_QC / NADIR_COMPARISON_FREEZE_PROPOSAL_REFINED / EXISTING_IDENTITY_AND_THREAD_SCOPE_PROOFS_REUSED / NO_NEW_LEAN_RUN / P0_EIGHT_BLOB_FINGERPRINT_UNCHANGED / ORSON_P1_PROTECTED / MERSEARCH_LANES_HELD / TERN_HANDOFF_PRESTART_OPTIONAL / AUTOMATION_PRESERVED`.

No task, schedule, phase, cadence, owner, branch, paper gate, source equation, or BEDROCK theory status was changed. No new conversation was created or renamed. No direct cross-thread delivery, consumption, or acknowledgment is claimed.
