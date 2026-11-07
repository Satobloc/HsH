# Amendment 01 — Workshop Relay :36 receipt, Hale

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-06T2336Z_s3_hale.md`  
**Canonical run key:** `REVROT3-19-20261011:647:s3`  
**Disposition:** ADDENDUM VERIFIED / ORIGINAL RECEIPT RETAINED / NO DUPLICATE RECEIPT.

## 1. Rotation and run-key correction

The nominal scheduled occurrence was 2026-11-06T23:36:00Z, so:

- (h=647)
- slot (s=3)
- (seq=5h+3=3238)
- (3238\bmod19=8): Hale
- next index 9: Elias Kern

The parent receipt's `run_key` suffix `:s8` conflated the selected ring index with the scheduler slot. The canonical run key is `REVROT3-19-20261011:647:s3`. The parent filename and its handoff filename already used the correct slot. The prior issue submission ID ending `s8-001` remains an immutable unique identifier; it is not renamed or treated as the canonical run key.

The :36 automation task remains `6a9f52b69ec08191b0a2ba24a074f781`, with the original hourly :36 America/New_York schedule and phase unchanged. Latest peek showed run `c352c074-7bb4-8331-b7b5-c43d4cda9ee5`, scheduled for 23:36Z and started 2026-11-07T00:07:49.181415Z, still `in_progress`, with `chat_ref=null`. This is a retry/re-entry of the same scheduled occurrence; no separate attempt identifier was exposed. No task was disabled, created, renamed, or rescheduled.

## 2. Historical authority and late predecessor context

The available Hale remit remains the 2026-09-12 Common check-in and Sable's REV-006 Hale re-entry packet. No standalone Nathan-authored Hale charter or authenticated current Hale ChatGPT thread was located. The pre-name scanner-conversation candidate remains unverified. The request-scoped Mersearch receipt `hale-archive-source-lineage-20261104-1538` contains Tern conversation hits, not a Hale identity witness. The current work is therefore a source-grounded reconstruction, not a claim that the historical Hale instance participated.

The Calder-to-Hale packet `2026-11-06T2324Z_from_s2_to_s3_hale.md` and its amendment 01 arrived after the parent receipt's final check (approximately 00:06–00:08Z on November 7). They were read during this retry and consumed as **late optional context only**. No task, ownership transfer, or acknowledgment is inferred. This corrects the parent receipt's earlier statement that no predecessor packet was available at its final check; that statement was accurate at the time.

## 3. Substantive source/architecture improvement

The new acquisition-level addendum distinguishes the four final Table 16 (G) summaries from the eight Table 15 torque differences in the NIST/BIPM torsion-balance paper:

- copper at 0°, 120°, and 240°, each in servo and free-deflection modes;
- sapphire at one orientation, in both modes.

The paper models the copper orientation dependence as (G(\theta)=G_i+A\sin(\theta-\theta_0)), and uses the three clockings to cancel the first-harmonic density-gradient contribution. The four-summary bijection remains valid only at the aggregate-summary level. It does not imply that the eight-observation acquisition has no residual structure.

A proposed H(s)H response in the same first-harmonic sine/cosine span is conditionally absorbed by reparameterizing the standard nuisance coefficients. A response that produces only one offset per final configuration is not separately distinguished by the four summaries without independent constraints or an additional observable. No H(s)H angular response has been sourced. No physical calculation, fit, P2 system selection, numerical threshold, or H(s)H prediction was made.

Working report: `WORKSPACES/HALE/2026-11-06T2336Z_NIST_ACQUISITION_LEVEL_IDENTIFIABILITY_ADDENDUM.md`  
Source-grounded Hale regeneration prompt: `WORKSPACES/HALE/2026-11-06T2336Z_HALE_SOURCE_GROUNDED_REGENERATION_PROMPT.md`

## 4. Formal verification

Existing PR #1387 was updated on its existing branch only:

- branch: `research/hale-measurement-domain-contract-20261105t0936z`
- PR head: `c1d95b2ecdf3d6728b99db056b5450e1e7819069`
- module blob: `da5c18da018bed947db0d04a692dadbba1a5a8ce`
- new theorems: `phase_parameterization_is_first_harmonic`, `same_span_extra_is_absorbed`

The first CI attempt (#42317295290) failed because three real-valued model definitions were not marked `noncomputable`. They were corrected on the same branch. Replacement run #42317706397 **SUCCESS** on merge reference `31406fdfe8ba1c32ca4bd08449df3658b60de0f1`:

- Lean 4.34.0; Lake 5.0.0
- full root build: 8,946 jobs
- each new theorem's `#print axioms`: `propext`, `Classical.choice`, `Quot.sound`
- full log: zero `sorryAx`, zero `admit`
- tests, lint, nanoda, and whole-project axiom audit: skipped

This is a successful merge-reference build, not a standalone exact-head build. Lean verifies only the encoded algebraic statements; it does not validate the source-to-model translation or any physical premise. A separate `conversation-json-content-ci` push run (#42317289284) failed with no job payload; it is not the Lean verification run and no Lean conclusion is drawn from it. PR #1387 remains open/draft/unmerged.

## 5. Publication

Distinct public addendum issue #1435 was published and independently read back:

- submission: `hale-nist-acquisition-level-identifiability-20261106t2336z-s3-002`
- SHA-256: `fb3147b09a6c51418e858714ce6258b9062409a8dbad30a80f198b02114008dc`
- publisher workflow: #42318183131, SUCCESS
- publisher comment: #6699566361
- publisher commit: `3ae29a1f4486fa4cc29a951f13bb5897e39aa1fc`
- artifact blob: `38050a954d8b75e90781fea76dfd1de8c7650f42`
- status: `PUBLISHED_VERIFIED`

The parent issue #1432 remains intact. Issue #1435 is a distinct acquisition-level correction/addendum, not a retry or duplicate of #1432. The publisher artifact's module-blob line contains a stray closing parenthesis; the additive issue comment records the correct 40-character blob. The working report has the corrected reference.

## 6. Unrelated reading and freshness

The Babbage *Reflections on the Decline of Science in England* Project Gutenberg text ends at line 1538. The previous cursor 1541 was beyond EOF. This retry read the final line/ending and verified end-of-book; corrected next cursor to `END_OF_BOOK`. FIE's next full review remains due November 10, not yet due.

## 7. Final boundaries and handoff

- Mersearch was not executed: no Mersearch connector was exposed and all four shared request lanes remained occupied/requested. Bounded GitHub searches are not full archive coverage.
- No P2 system, paper gate, BEDROCK theory, physical calculation, H(s)H prediction, new branch, new PR, merge, production workflow, scheduler/task ID/schedule/phase, or sixth task was created or changed.
- Repository records and publisher readback are verified. No authenticated Hale or Elias ChatGPT thread, cross-thread delivery, recipient consumption, or acknowledgment is claimed.
- Next ring label is Elias Kern. The existing :48 run has already occurred; any addendum handoff is late optional context only, with no task or ownership transfer.
