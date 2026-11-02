# Tern literature-review pipeline integration and pilot

**Run:** `REVROT3-19-20261011:534:s2`  
**Selected:** Tern Rook, ring index 12.  
**Next ring worker:** Morrow, index 13.  
**Status:** PROVISIONAL WORKFLOW INTEGRATED / PILOT COMPLETED / PUBLICATION BLOCKED BEFORE ISSUE CREATION / NO TASK OR SCHEDULE CHANGE.

## 1. Historical Comptroller authority

The operative Tern remit is supported by Nathan Direct user-role messages in the September 23, 2026 Ariadne raw conversation:

- Conversation: `6ab339d2-8fb4-83ea-b728-c8001a034371`.
- Raw blob: `df9c7a1fbddaa523f0b69cced8d761433490a454`.
- Message `c4f0aae9-3290-42c6-a5d0-b42c19a88255`, 2026-09-23T04:27:14Z: Nathan states that the Comptroller controls the committed scheduled tasks.
- Message `e689eb6e-5814-4a27-a366-796605bd5f4d`, 2026-09-23T04:48:27Z: Nathan states that Comptroller Tern controls allocation; scheduled tasks run hourly, check the current workflow and overall state, and decide what work best fits the time. Other workers may request time; Tern prioritizes.

This is a direct delegation recovered from another conversation, not proof of an authenticated Tern ChatGPT thread. The Tern `Space Shuttle Roderick` raw export is historical context, not a standalone user-authored charter. The earlier 2026-09-19 establishment date remains unverified.

## 2. Live scheduler readback

Nominal scheduled time: 2026-11-02T06:24Z.  
Anchor: 2026-10-11T00:00Z.  
Calculated (h=534); sequence (5h+2=2672); (2672\bmod19=12), selecting Tern. The next ring index is 13, Morrow.

| Phase | Task ID | Live state | Preserved schedule |
|---|---|---|---|
| :00 Archive | `6aa1fe0de5e48191b886496095b1343f` | ENABLED | Hourly, minute 00 |
| :12 Mind | `6aa61b3b2e4081918927a35b61007acc` | DISABLED | Original hourly minute 12; remains disabled |
| :24 Geometry | `6abda4c8eda88191bf23a6f2849e9a17` | ENABLED | Hourly, minute 24 |
| :36 Worldtube | `6a9f52b69ec08191b0a2ba24a074f781` | ENABLED | Hourly, minute 36 |
| :48 Review | `6aa6c3bc02b48191b8a91a30d2a155e0` | ENABLED | Hourly, minute 48 |

The current :24 task retains its original DTSTART `2026-10-01T14:24 America/New_York` and `FREQ=HOURLY`. Four tasks are enabled; :12 is disabled. No sixth task. No task prompt, ID, enabled state, DTSTART, recurrence, phase, or ring was changed.

The current automation run reports no authenticated chat reference. No cross-thread delivery is claimed.

### Correction to the 01:21 scheduler note

The earlier Tern inbox note assigned (h=530) to 01:36Z on November 2. That is one hour early under the controlling UTC anchor:

- 2026-11-02T01:36Z is (h=529), so :36 selects Calder (index 7).
- (h=530) begins at 02:00Z; the :36 occurrence is 02:36Z and selects Tern (index 12).

No durable Tern receipt for the 02:36Z occurrence was found. The earlier statement that an (h=530), :36 run was already in progress at 01:50Z is therefore not verified. This correction does not change any scheduler state.

The :36 task's last visible run at 06:38Z was still the 05:36Z Hale run. The 06:36Z occurrence had not yet appeared in the scheduler readback; no missed run or Morrow consumption is inferred.

## 3. Allocation decision

The 01:21 Tern inbox request is labelled "Nathan via current assistant" and contains no raw user-message locator. It is an assistant-mediated, Nathan-attributed relay, not independently authenticated Nathan Direct. I treated it as a bounded request to evaluate, not as authority to alter the user's schedule or prompts.

Decision: integrate literature review as a Tern-managed process overlay, not as a new automation. No existing task prompt needs amendment. The four lane-specific prompts remain untouched. The stage model is recorded in `WORKSPACES/TERN/LITERATURE_REVIEW_PIPELINE.md`.

The pipeline uses existing capacity:
- Tern: question intake, internal-first recovery, protocol, stage allocation, duplicate control, provenance ledger, and next cursor.
- Hale: external discovery and primary-source retrieval/extraction, without displacing his current publisher-retry work.
- Domain owner: retains interpretation and authorship.
- :48 Review: optional independent QC only when the selected worker's charter and current workload fit; not a permanent reassignment.
- Mira: quarantine-side citation/prior-art stage not engaged in this run. The current boundary does not permit inbox use or research-payload transfer; no payload or handoff was sent. The ring Mira and quarantine-side Mira are not assumed to be the same authenticated worker.
- Cross: not engaged; no task requiring his factual/provenance remit arose.

No new tooling or paid service was introduced. Existing SciSpace, Scholar Sidekick, Academic Writing Toolkit, archive/GitHub search, and the current citation workflow were sufficient. No new Mersearch request was made: all four request lanes remain occupied/unreleased.

## 4. Real pilot: peer exposure versus deliberation

### Question

In the existing cognition review queue, what distinguishes passive exposure to peer answers from reciprocal deliberation, and can post-discussion private re-ratings count as independent evidence?

### Internal-first and duplicate control

Reviewed the P1 issue #564, Orson's latest 03:48 receipt, the existing VEY-012 study index, and Hale's existing Review-MIND evidence map (`WORKSPACES/HALE/2026-10-30_1648Z_REVIEW_MIND_HUMAN_LLM_TEAM_INTERACTION_EVIDENCE_MAP.md`, blob `b2f6d62316481e12250a7d81974ac761cbaefc0b`). Hale's map already distinguishes source ancestry from exposure ancestry and proposes separate conditions for independent outputs, common-source outputs, one-way peer exposure, and reciprocal exchange. This pilot narrows one LLM-only source contrast; it does not duplicate Hale's broader human-LLM evidence map.

The arXiv source was already in the existing study index. No duplicate study card was created.

### Search and verification

SciSpace query:

> Which empirical studies directly compare independent large-language-model judgments with judgments made after exposure to other models' answers or group discussion, and measure changes in accuracy, error correlation, agreement, or convergence?

The search returned 10 candidates. Two high-relevance records were advanced to citation identity checks:

1. *The Wisdom of Artificial Deliberative Crowds*, arXiv:2609.22497. Scholar Sidekick matched title/identifier and returned no retraction signal. The full 30-page primary PDF was reviewed. This is an arXiv preprint; peer-review status is not established.
2. *Effective Sample Size Under Peer Exposure in Multi-LLM Deliberation*, OSF DOI 10.17605/osf.io/aw9vf. The title/identifier pair matched, but the OSF landing page/API and full text were not retrieved. This remains `LEAD_ONLY`, not evidence.

The other eight search candidates were not advanced beyond abstract/metadata screening. This is a bounded pilot, not a systematic review.

### New extraction from the accessible preprint

The paper separates:
- Stage i1: independent initial answers.
- Stage c: reciprocal deliberation by groups of three models from different providers.
- Stage i2: private re-ratings after each model receives its own initial answer and the discussion transcript.

Study 1 also includes a social-influence-only condition: models see the other two initial estimates and revise without dialogue. The paper reports that this passive exposure improves over the independent baseline, while reciprocal deliberation performs better. This is the discriminating contrast.

Further findings:
- Study 2: 100 NeurIPS 2024 submissions, 18 ratings per paper organized into six groups of three; 82/100 paper-level post-discussion private ratings reproduce the group's agreed value exactly.
- Study 3: 25 sabotage trajectories; 417/447 individual post-discussion re-ratings reproduce consensus exactly (93.29%). The paper separately reports 14 non-zero paired differences and three non-comparable ratings. The analysis unit for the 14 is not explicit in that sentence; preserve as a unit ambiguity, not a proven arithmetic error.
- Study 4: 44 World Cup events; the deliberative crowd is not significantly different from the real-money market benchmark (p=0.26; BF01=3.63), but the market had more current information.
- Heterogeneity matters: clone groups did not show the same gain as heterogeneous groups; the dominant model varied by task.

### Interpretation and limits

The paper supports a narrow within-study result: reciprocal deliberation can outperform passive peer-answer exposure on the tested tasks. It does not establish that consensus is independent evidence, estimate cross-model error covariance, or give an effective sample size for repeated calls.

There are three model families, one per provider. Eighteen ratings per item are repeated calls from a small set of models, not eighteen independent model families. Temperature/random seeds were not fixed; sample sizes were constrained by cost. The paper says data/code would be made available shortly on OSF and were available upon request; no public data/code link was retrieved.

The critical evidence distinction is therefore:
- distinct model families;
- repeated calls from one model family;
- source/training ancestry;
- one-way exposure;
- reciprocal communication;
- post-discussion revision;
- evaluator/adjudicator dependence.

Post-discussion private ratings are exposure-conditioned and must not be counted as independent replications of the group's conclusion.

### Calculations

Scripted arithmetic:
- (82/100=82.00\%\).
- (417/447=93.2885906\%\) (reported as 93.29%).

These are descriptive ratios from the paper's reported counts, not new measurements or a reanalysis of raw data.

## 5. Existing formalization and P1 status

- Orson PR #850 remains draft. Current head: `6b08ffbcc7ca64d5a9a55447b586e31aaef34a5b`. The visible workflow run is a successful merge-reference build, not an exact-head-only verification. No new Lean module or PR was created.
- Rotation PR #687 remains draft; current head `1cfcdd8f154ea0a0ae18a267375a6c64a7da901c`; no workflow run found for that head. The finite 19-hour coverage calculation was script-checked; no Lean build was run because Lean/Lake are not installed in the local runtime and no existing PR was modified.
- P1 issue #564 remains open. Orson's latest receipt recommends a methods-only disposition, but no final author disposition is recorded. This pilot does not make that decision.
- November 9 P1 gate, November 30 P2 gate, and December 14 full-theory gate remain separate. No gate advanced.

## 6. Publication status

A public-safe evidence-note payload was prepared for the existing issue publisher:
- Submission ID: `tern-literature-review-pilot-peer-exposure-20261102t0624z-s2-001`.
- UTF-8 bytes: 6,461.
- SHA-256: `472c0a3ef26aea6a33a8fdab31269d1bbd2ddc839ea268b315d009f3937e5306`.

The `create_issue` call was blocked by OpenAI safety checks before issue creation. No issue number exists, no publisher workflow ran, and no published artifact/readback exists. No alternate write route or duplicate issue was attempted. Status: `BLOCKED_BEFORE_CREATION`.

## 7. Reading, review, and next cursor

- Unrelated reading break completed: `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`, lines 693-732. Next cursor: line 733.
- Last full FIE review: October 27. Next due: November 10. No early re-review.
- Current Tern run has no authenticated chat reference. Repository records are not claims of cross-thread delivery.
- Next ring worker: Morrow, :36 slot at h=534. The scheduler had not surfaced the 06:36Z occurrence at the last check; handoff is context-only and no consumption is claimed.
- Next Tern appearance across enabled slots: :00 at h=542, 2026-11-02T14:00Z.
- Hale's next appearance: :24 at h=537, 2026-11-02T09:24Z. His current PR #1251 publisher-retry work retains priority; any literature follow-up is optional context only.
- Orson's next appearance: :36 at h=535, 2026-11-02T07:36Z. His P1 ownership remains unchanged.

**Final:** workflow overlay provisional; one bounded pilot completed; publisher blocked before issue creation; four existing automations and the disabled :12 phase preserved; no prompt, task, ID, cadence, theory, or paper-gate change.
