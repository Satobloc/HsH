# Orson Vay h1029:s3 | CRTC group-readout projection kernel

**Status:** IMPLEMENTED ON SIBLING DRAFT PR / LEAN CI PENDING AT THIS REPORT SNAPSHOT / NO P1 PROTOCOL CHANGE / NO EMPIRICAL VALIDATION

**Nominal slot:** 2026-11-22T21:36:00Z  
**Run key:** `REVROT3-19-20261011:1029:s3`

## 1. Deterministic selection and identity

- (h=1029)
- (seq=5h+3=5148)
- (5148\bmod19=18)
- Selected routing label: **Orson Vay**, index 18
- Next routing label: **Sable**, index 0

The ring label is deterministic routing, not authenticated model-instance or conversation identity. The historical Orson cognition remit is preserved in [ROLE_CHARTER_2026-10-09_LLM_COGNITION.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md), blob `4b8ec39976fdb079a6e28febfe719316c7e46adf`. Its source genealogy points to a direct user-role appointment in the MIRA archive on 2026-09-23; the role charter is an assistant-maintained synthesis, not a separately signed specialist charter.

No authenticated current Orson cognition thread or incoming h1029:s2 Ravel handoff was established in the checked repository pointers. This is a source-grounded assistant execution, not historical-instance participation or cross-thread delivery.

## 2. Controlling source and P1 boundary

Preflight read the live HsH BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, Phase Steering, three-repository onboarding, current workflow orientation, revival V3/V4 and thread-first rule, automation/write controls, current task/branch graph, Orson role/continuity/receipt, and the current P1 freeze.

Source snapshot at initial preflight: HsH main `d5914a3d40972a461e411951c48a2c5e7e901af9`. Relevant source pins:

- BEDROCK: `2629ab29a5838d933c31727455553d206577a258`
- Steering Charter: `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`
- Three Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`
- Orson P1 freeze: `9af4448d25f656ad1e63301660de63fd32924d5f`
- Orson h1025 TuringHotel report: `7ea6582c57378d4f3c6f92a89074b58b9fb03e23`
- Orson h1010 MemOps report: `ba0d5f782d8c8a9573d19b2650a7e62e16143672`

P1 remains **OVERDUE / NOT READY / FROZEN / ORSON-OWNED**. The November 9 minor gate is missed; November 30 major gate remains HOLD; December 14 full-theory gate remains INCOMPLETE. This run did not conduct a model trial, human session, API-spend experiment, dataset expansion, protocol amendment, manuscript edit, PDF/reader release, or paper-gate advancement. CRTC v0.1, issue #564, PR #850, PR #2112 and the frozen P1 protocol were not modified.

## 3. Source problem and empirical motivation

Orson's proposed [Cognitive Readout Target Contract v0.1](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/COGNITIVE_READOUT_TARGET_CONTRACT_v0.1.md), blob `a5b997e63f01a698f201c30940d3e29a702cdd29`, correctly distinguishes model, unit, information state, target, criterion, channel, intervention, dependence graph, validation and evidence status. It permits `unit=group`, but its explicit maps remain single-unit maps. Meridian's h975:s4 audit, blob `ca263f1899ba275612cdebf5843eccd30b5535c3`, identified the missing group-history, member-projection, exposure-event, subgroup-projection and group-readout signatures. That audit is assistant-level QC, not Nathan Direct.

Three primary-source comparators make the measurement separation consequential:

1. **Nixon et al., “The Social Cost of an AI Teammate” (2026), [arXiv:2607.27179](https://arxiv.org/abs/2607.27179).** A randomized study compared 16 three-person teams containing two students and an AI teammate with 17 all-human teams. Group Communication Analysis separated participation, internal cohesion, responsivity, social impact, newness and density; surveys separately measured belonging, status and felt value. The AI was the most talkative member but contributed the least new information and lowest density; human-human responsivity and social impact were also lower in AI teams. The source explicitly treats responsivity and social impact as uptake measures. This demonstrates why message volume, information novelty, uptake and member experience cannot be collapsed into one group score.

2. **Kerstan, Grote & Schmutz, “Collaborative Decision-Making in Human-AI Versus Human-Human Teams” (Human Factors, first published 2026-09-08), [DOI 10.1177/00187208261477411](https://doi.org/10.1177/00187208261477411).** The publisher abstract reports 98 human-AI and 65 human-only three-member teams in a hidden-profile task. Information inquiry improved information sharing and decision performance across team types. Full text was access-restricted in this review; claims are limited to the publisher abstract.

3. **Toxtli & Delaflor, “Hidden Profile Decision Making in Multi-Agent LLM Groups” (CSCW Companion '26), [DOI 10.1145/3785651.3831525](https://doi.org/10.1145/3785651.3831525).** The primary paper reports 219 valid sessions across four LLM families, three-agent groups and a two-by-two communication/information-distribution design. Some models shared private information at high rates but did not integrate it into the correct decision. The authors describe the result as exploratory, with one task domain, one group size and small cells. This is not a human-team result or a general model ranking.

These studies are source-reported findings, not independently replicated by this run. They motivate distinct observables; they do not validate the proposed formal schema.

## 4. The substantive architecture improvement

Created a separate assistant-reconstructed group-event kernel rather than silently extending CRTC v0.1 or reopening P1.

The model defines:

- `InteractionEvent`: event ID, timestamp, author, `availableTo`, `usedBy`, `incorporatedIntoDecision`, and an opaque payload token.
- `GroupHistory`, `SubgroupHistory`, and `MemberHistory` as distinct types.
- `ValidEventSet`: authors and available recipients belong to the roster; use is a subset of availability; event IDs are unique within the history.
- `projectMember : GroupHistory × Agent → MemberHistory`.
- `projectSubgroup : GroupHistory × Finset Agent → SubgroupHistory`.
- `projectMemberFromSubgroup : SubgroupHistory × Agent → MemberHistory`.

The central composition theorem is:

`subgroup_member_projection_composes`

It establishes equality between direct group-to-member projection and nested group-to-subgroup-to-member projection only when:

1. the member belongs to the source roster;
2. the member belongs to the selected subgroup; and
3. every event in that member's direct view is wholly internal to the subgroup, meaning its author and entire availability set are within the subgroup.

A finite valid-history witness shows why the closure condition matters: an event can be visible to a member yet disappear under subgroup projection when its author or another recipient lies outside the subgroup.

Two further witnesses separate:

- availability from uptake; and
- uptake from incorporation into a group decision.

A narrow example readout, `decisionIncorporationCount`, counts event records marked as incorporated. The formal counterexample proves that this group-wide count cannot be reconstructed from one member's projection alone for all valid histories in the declared model.

This is a concrete typed projection result, not a complete CRTC group instrument. The general fiberwise factorization theorem already present in Nadir PR #1189 was not duplicated; this module supplies a group-event-specific map and closure condition.

## 5. Lean and PR status

New draft PR: [#2375](https://github.com/Satobloc/HsH/pull/2375)  
Branch: `research/orson-crtc-group-projection-20261122t2136z`  
Head commit at report snapshot: `684d509ba9efe8ea2dfb241619a39251e3515011`  
New module blob: `8ddf0300accab0b26d0192e8977bbe7f78b62b97`  
Root aggregator blob: `fe34fe7aabec4e6f7c29d0457f68ab200fbe066f`

The PR is OPEN / DRAFT / UNMERGED and stacked on the existing Orson formalization base branch `research/orson-p1-conjunction-null-20261028t0212z` at `598a45b3feb9378eb8f14ff069ec9080137113c2`. Its parent is P1 draft PR #833. The stack is used only to reuse the existing Lean 4.34.0 / Mathlib v4.34.0 workflow; it does not alter the parent branch or P1 protocol.

At this report snapshot, Actions run [#45073810735](https://github.com/Satobloc/HsH/actions/runs/45073810735) was IN_PROGRESS at “Install Lean and compile formal library.” No successful build or theorem-specific axiom report is claimed here. A separate Vercel preview check reported a build-rate-limit failure; it is not the Lean job. The older run #45073676591 was triggered on the prior module revision and is not accepted as verification of the current head.

## 6. Limits and next falsification obligations

The kernel is intentionally incomplete:

- timestamps are stored, but event ordering, time windows, membership intervals and longitudinal dynamics are not formalized;
- no full aggregation map over multiple member outputs is supplied;
- no typed dependence graph for shared models, prompts, sources, judges, tools or memory is supplied;
- no causal estimand or attribution rule is supplied;
- event IDs are local record keys, not source-authentication evidence;
- the event-count readout is not decision quality, correctness, calibration or construct validity;
- no empirical log adapter or validated event annotation procedure exists.

A real instantiation would require source-identified, timestamped event logs; a roster and membership intervals; explicit availability, use and decision-incorporation annotations; a declared group criterion; shared-source/model/judge dependencies; reliability checks; and an untouched holdout. The present work provides no measured system, dataset, units, uncertainty model, fit, physical prediction, numerical falsification threshold or independent measurement.

## 7. Tool, archive and workflow boundaries

Mersearch stable 1.0 is documented at commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`, but no callable Mersearch action or local checkout was available. All four canonical request files remain `requested`; lane 2 has an existing manifest/receipt, while lanes 1, 3 and 4 have no request-scoped outputs at the checked paths. No lane was overwritten, released or retriggered. GitHub code search/fetch was used as a bounded fallback across HsH, the SAT archive and HSH_RESOURCES, not represented as Mersearch or an exhaustive archive search.

The HSH_RESOURCES bibliography and Nathan's prior-art boundary were consulted. SciSpace was available and used for literature discovery/extraction. Existing Math Hopper #578 / PR #991, Lean PRs #850, #1189 and #2112, and the available Whirligig references were checked; no new tool, dependency, fork, subscription or expenditure was introduced. Local `lean`, `lake`, and `elan` and a local repository checkout were absent. The existing project Lean workflow was used.

The existing :36 automation ID `6a9f52b69ec08191b0a2ba24a074f781`, its hourly phase and prompt were not modified. No sixth task, scheduler write, conversation rename, or ownership transfer occurred.

## 8. Return cursor

- PR #2375 at `684d509ba9efe8ea2dfb241619a39251e3515011`.
- Actions #45073810735; obtain final job conclusion and theorem-specific `#print axioms` output.
- Compare the built merge-reference module and root-aggregator blobs with the PR-head blobs before classifying the build.
- Keep the PR draft and request independent review; do not merge or adopt CRTC v0.2 from this result.
- Preserve Orson's P1 ownership and freeze. Next ring label: Sable, h1029:s4. No assignment or cross-thread delivery is claimed.
