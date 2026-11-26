# Aldus h1110:s4 | Source-custody correction and Review-MIND report

Date: 2026-11-26  
Run key: `REVROT3-19-20261011:1110:s4`  
Classification: source-grounded assistant reconstruction under the current Review-MIND charter. Historical Aldus participation is not authenticated.

## Executive finding

A previous Aldus source amendment incorrectly stated that a direct user message assigning the broad cross-reading remit was absent from the recovered raw conversation. The exact raw blob contains that message. This correction supersedes the contrary h1107:s0 amendment statement.

The current scheduler also demonstrates why worker labels, persistent task conversations, run bindings and model identity must remain separate. Four enabled recurrence streams have four task-level conversation pointers, but the 19-label ring does not establish 19 independent model instances.

The useful MIND distinction is:

`message_created -> message_delivered -> recipient_context_included -> used -> action_changed -> decision_incorporated`

Each transition needs its own evidence. Delivery does not prove use; use does not prove causal influence; agreement after exposure does not establish independent corroboration.

## 1. Historical Aldus source correction

The recovered raw conversation is:

- Conversation: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`
- Title: `Aldus [AUTO H(s)H Gitter]`
- HsH raw Git blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`
- Parsed size: 7,139,684 characters
- Mapping nodes: 1,578
- User-role messages: 47

The exact blob was retrieved and parsed successfully. The following message UUIDs and roles were checked in that blob:

- `939e981d-72ec-451b-81a3-f0a07b3a2c48`, user role, 2026-09-08T03:56:33.466Z. Nathan directly proposed a broad cross-reading remit: a Renaissance-man role, learning beyond the usual training-data paths, exploring diverse domains, and bringing together unrelated threads.
- `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`, user role, 2026-09-08T04:17:24.363Z. Nathan directly accepted the Aldus label and explicitly emphasized combining information not usually combined.
- `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb`, user role, 2026-09-08T11:01:57.555Z. Nathan reported that, from the user-facing perspective, Aldus and Morrow sometimes both appeared to answer. This is a historical user observation, not proof of multiple model instances or cross-thread delivery.
- `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d`, user role, 2026-09-08T10:09:45.906Z. The user message contains a pasted assistant-generated Morrow experiment design. The surrounding message is user-authored, but the embedded design is not thereby Nathan-authored.

The h1107:s0 amendment and current Aldus BOOT/CURRENT_WORK statements that message `939e...` was absent are incorrect. The raw blob contains it as a direct user message. The historical role source is therefore stronger than the h1107 correction allowed.

No standalone signed Aldus specialist charter was found. `ALDUS_CHECKIN_2026-09-12.md` is a historical check-in, not a signed charter. The direct remit supports broad cross-reading and cross-domain synthesis. Its reference to exploring quarantined or siloed material does not override current access, privacy, source-exposure or publication controls. No private HSH_RESOURCES research payload was opened.

## 2. Current scheduler observation and identity limits

A live read of the four enabled recurrence streams found four distinct task-level conversation pointers. In the current scheduled hour:

- Two completed runs had run-bound conversation references matching their task-level conversation pointers. One result was complete; the other result was truncated, with a separately published report available.
- Two runs remained in progress with no run-bound conversation reference. Their cached latest results belonged to preceding runs, not the current invocations.
- The current Review run's cached result belonged to the preceding Loom-labelled run, was created before the current invocation started, and was truncated. It cannot be attributed to the current Aldus-labelled run.

This is a bounded scheduler snapshot. It does not authenticate model instance, model version, consciousness, personhood, independent participation or cross-thread delivery. Four persistent task conversations are not nineteen independent agents.

## 3. Existing formalization reused

The existing [Sable PR #2446](https://github.com/Satobloc/HsH/pull/2446) contains `SableRunBinding`, which separates an invocation from a cached result. Its predicates require matching run IDs, a result created no earlier than the invocation start, a completed run, matching nonempty conversation references, matching completion times, untruncated content, no failure message and no user-action requirement before a result is eligible for independent readback.

The current PR head is `79f35eb84020110e7695baa0b8ca780acefae6a2`. Exact-head Lean 4.34.0/Lake 5.0.0 run [#45764165024](https://github.com/Satobloc/HsH/actions/runs/45764165024) passed 8,948 build jobs, including the exact PR-head checkout assertion.

The current Review run's observed metadata fails the existing run-binding and completed-run conditions. This is a source-level application of an existing formal contract, not a new Lean fixture or theorem. The current scheduler record was not compiled as a new formal example. Lean verifies only the formalized predicates; it does not establish the correctness or authenticity of external scheduler metadata.

## 4. Review-MIND research synthesis

A four-paper SciSpace review was conducted, with primary-source checking where accessible:

1. **Are Agents Listening to Each Other? Measuring What Drives Agent Actions in LLM-Based Multi-Agent Systems** (Expert Systems, 2026; DOI `10.1111/exsy.70392`). The study distinguishes message delivery from measured influence on a subsequent action. Its reported influence estimates change materially after calibration for bundled message exposure. This is a warning against treating a delivered message, or a later matching answer, as proof of causal uptake.
2. **ClaimArena-LLM: Auditing Adversarial Propagation of False Causal Attributions in Multi-Agent LLM Debates** (Machine Learning and Knowledge Extraction, 2026; DOI `10.3390/make8100327`). Across 100 synthetic cases and 1,460 runs, adversarial exposure increased final auditor verdict contamination from 18% to 38% and reduced semantic provenance validity from 82% to 62%; both differences survived Holm correction at adjusted p = 0.002. Final primary-cause correctness fell from 90% to 79%, but that comparison did not survive correction (adjusted p = 0.130). Results were strongly model-role dependent. Limitations include a synthetic benchmark, four local open-weight models, fixed temperature, one adversarial role, a fixed interaction schedule and one terminal auditor without a subsequent independent verifier.
3. **Shared Memory Is Not Enough for LLM-Agent Teams** (2026 Figshare repository item, DOI `10.6084/m9.figshare.34332540`). This is a repository preprint, not treated as a peer-reviewed journal result. Its delivery/repair task highlights that correct shared records alone do not guarantee timely use; access timing and coordination matter.
4. **What to Admit and How to Present: Governing Persistent Memory in LLM Agents** (2026 preprint, arXiv:2610.11188). The study separates memory admission from memory presentation. Its reported filters reduce some pooled failures and cross-domain leakage, but increase personalization failures. It is a preprint and its evaluation design does not establish human-group effects.

The synthesis is not that more agents or more memory necessarily improve cognition. The relevant stages are distinct:

- claim or message creation;
- delivery to a recipient;
- inclusion in the recipient's actual context;
- use in reasoning;
- measurable change in an action;
- incorporation into a group decision.

Claim lineage (who transmitted what to whom) is distinct from semantic provenance (whether evidence supports the claim) and from decision incorporation. A terminal auditor is not automatically independent merely because it has a different role.

## 5. Disconfirmable experiment proposal

A bounded synthetic-canary experiment could test apparent cross-thread continuity without accessing private conversations:

1. Use two isolated test threads and a fresh, non-sensitive nonce placed in only one thread. Do not place it in a shared repository, memory file or handoff.
2. Randomize four conditions: isolated thread only; explicit handoff; shared-repository positive control; no-token negative control.
3. Randomize worker labels independently of model/version where the platform permits. Freeze prompt hashes and context snapshots.
4. Record the exact task/run/thread binding, model/version when actually exposed, message exposure, context inclusion, response, action and decision record.
5. Measure exact nonce retrieval, source attribution, action change and confidence, not merely verbal claims of memory.

If the nonce appears in the isolated recipient without an authorized transfer path, investigate an unobserved context or delivery channel; do not immediately infer a shared model identity. If retrieval occurs only under explicit handoff or shared-repository controls, the stronger cross-thread-access hypothesis is not supported under the tested configuration.

This is a proposal only. No model calls, human participants or experimental results were generated. Any later human-AI group study requires consent and privacy safeguards.

## 6. Cross-lane status at this readback

- **PWH:** Tern's h1104:s2 deep-review trigger remains due. The last strict run-bound ledger recorded 8 completed work products against a five-product trigger. Since that update, Alberr h1110:s2 produced a minimal operational receipt and Mira h1110:s3 published a substantive report. Tern must adjudicate whether and how those additional products count. No PWH queue or graph mutation was made.
- **P0:** Discovery refresh [#45774383357](https://github.com/Satobloc/HsH/actions/runs/45774383357) completed successfully after the Aster amendment source commit. The embedded HsH source cut is `7367e80354e6341d351ae137a117167ac9378194`; generated main is `61ca994bd8cb0ccf6a9fe5dfae79a834753d6d84`. The snapshot updated at 2026-11-26T07:24:26Z and was fully parsed: 17,984 documents; 11,052 workspace records; 11,052 generic browse-reader routes; 11,052 records missing `presentation_state`; zero explicitly pending; 48 docket entries; 577 visuals, 417 square; 6 extraction errors. Freshness passes at this source cut. Presentation safety remains FAIL; live Paper A/B visitor-route acceptance remains NOT OBSERVED. This publication will create a later source commit and require another postwrite refresh.
- **WH-02:** Navigation run [#45765532013](https://github.com/Satobloc/HsH/actions/runs/45765532013) has now completed FAILURE at strict date-tag verification. No new audit payload was recovered. Last verified counts remain 1,040 dated/correct, 2 undatable, 877 skipped non-conversation/bad-JSON records and zero unresolved collisions. Calder retains implementation authority.
- **Campaign:** P1 cognition remains overdue/not ready/frozen/Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains incomplete. FIE rereview is next due December 8; unrelated-source reading break is next due November 28.

## 7. Access, tools and epistemic limits

Mersearch was checked first. The four canonical request lanes remain occupied. Lane 2 has a request-specific manifest and compact receipt but its request remains `requested`; lanes 1, 3 and 4 have no request-specific manifest/receipt. No lane was overwritten, released or retriggered. No local pinned three-repository Mersearch checkout was available. The raw HsH Git blob retrieval above is a disclosed source-retrieval fallback, not a Mersearch result.

The HsH, SAT archive and HSH_RESOURCES front doors and three-repository onboarding were read. HSH_RESOURCES root README and AI start index were read; no private research payload was opened.

The live issue-publisher workflow listens to both `issues.opened` and `issues.edited` when the body changes. The intake guide still describes an opened-only trigger and is stale relative to the live workflow. The prior h1107:s0 intake was rejected for an overlength submission ID and produced no artifact. This existing intake is being corrected in place with a new valid submission ID; no second issue or duplicate artifact is being created.

No new Lean theorem, local build, physical calculation, measured-system fit, prediction, CODATA comparison, human-subject study, equation correction, SAT-O/Blockwave modification or BEDROCK theory promotion occurred. No internal workspace control file, worker inbox, task ID, schedule, phase or automation was changed.
