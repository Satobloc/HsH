# Kestrel Receipt Amendment 02 — merge-ref correction and Meridian retarget

This amendment supersedes Amendment 01's classification of Lean run #41468951678 as an exact-head build. It preserves the successful compilation result while correcting the checked-out revision and the current-base limitation.

## Scheduled identity and source-grounded status

- Scheduled slot: 2026-11-02T14:24Z.
- (h=542); (seq=5h+2=2712); (2712\bmod19=14).
- Selected identity: Kestrel (ring index 14); next identity: Meridian (ring index 15).
- Run key: `REVROT3-19-20261011:542:s2`.
- Existing :24 automation ID: `6abda4c8eda88191bf23a6f2849e9a17`; enabled; original hourly America/New_York DTSTART 2026-10-01T14:24 and recurrence unchanged. No sixth task or scheduler mutation.
- Kestrel historical role was read from raw conversation `Science Made Stupid`, conversation ID `6ab070ce-2384-83e9-b76f-4661c55867c4`, blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Nathan Direct user-role message `c6803d67-a76f-48e4-bf71-f49cb7b224ee` (2026-09-21T06:15:43Z) establishes the cross-boundary, whole-picture companion remit; `3c07680d-5205-48a3-93d5-ce33a8cf86a6` (06:19:10Z) supplies the ground rule to reason forward rather than search indefinitely, while remaining revisable.
- Bounded personal-context lookup found no authenticated active Kestrel ChatGPT thread. This is a source-grounded Kestrel reconstruction, not historical-instance participation.

## Controls and source coverage

Read current BEDROCK (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`), Steering Charter (blob `5f4263381afcb065e9062d5b5885593d0baa58db`), Three Paper Campaign (blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`), New Instance Start Here (blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`), Phase Steering (blob `177576d6efb25024255b0f94c6a68dea38fdeff7`), Reference Desk (blob `9d26e8cf1e32cc00cad9198362d7a641431bf6cf`), Revival Rotation V3 (blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`), V4 (blob `6761337dfcd0847226ee7baad84db0a9c496760a`), Thread-first rule (blob `e79707587914edb76afca1c32f9f4dad4d0324b7`), Shared-State Write Safety (blob `3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5`), current task graph (blob `3c341c616aa893bf56ad5ad5919e09a17e0c2b46`, last updated 2026-10-30T06:12Z), workflow branching map (blob `756c506780072591b2f48e22044f3368a57bfa7d`), active automation roster (blob `6b0bf56316fe14bfd2b0e925154025bd8d04eaa1`), and Code Grurple roster (blob `cc96c0bfafc95c54e7960899c7306031e5abce17`).
- Current HsH main head at pre-publication inspection: `d9863cf3cd4a50a1480a0fbde105338ff579fa1d`.
- PR #873 remains OPEN / DRAFT / UNMERGED on `research/kestrel-original-slice-fidelity-20261028t0900z`; head `4d69627b9b701d6c4d15a582282dee49c911dc52`; current base branch `infra/lean4-verification-20261023` at `61cc8b65ffed70296e0121dbae067892a79c81d4`.

## Lean verification correction

The prior Amendment 01, continuity entry, OPEN_QUESTIONS entry, and Meridian handoff say run #41468951678 checked out the exact PR head. That is incorrect.

- Run #41468951678 / job #125357139451: event `pull_request`, conclusion SUCCESS.
- The actual job log says: `HEAD is now at 072ed737a34ee71c8162873ab7e487dad044aeb3 Merge 4d69627b9b701d6c4d15a582282dee49c911dc52 into c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- The workflow uses `actions/checkout@v4` without an explicit `ref`; the job log confirms GitHub's synthetic PR merge-ref checkout.
- The tested tree therefore combined PR head `4d696...` with base `c7dc2...`. It did not check out the PR head SHA alone. The current PR base is now `61cc8...`, so this run also does not verify the current head+base merge combination.

What the run did establish:
- `HsHVerification.KestrelProjectedIncidence` built at target 8931/8954.
- Root aggregator and full 8,954-job library build completed.
- Lean 4.34.0 / Lake 5.0.0.
- Theorem-specific axiom output: `hallway_factorization_iff_fiber_compatibility` → `Classical.choice`; `hallway_factorization_unique` → `Quot.sound`; `hallway_factorization_exists_of_source_injective` → `Classical.choice`.
- Captured full log contains zero `sorryAx` and zero `admit` occurrences. Separate global axiom audit, tests, lint and nanoda were skipped.

**Correct status: MERGE_REF_BUILD_PASS on tested tree (head 4d696 + base c7dc2) / CURRENT_BASE_MERGE_NOT_VERIFIED (base 61cc8) / EXACT_HEAD_ONLY_NOT_VERIFIED.** This is genuine compilation evidence for the PR code in that merge tree, not an exact-head-only build, current-base merge build, global axiom audit, or physical validation.

The workflow file offers `workflow_dispatch`, but the available GitHub connector exposes no dispatch action; the local runtime has no Lean, Lake or Elan and no HsH checkout. No exact-head-only run was attempted. No PR code was changed, rebased or merged.

## Mathematical and physical boundary

The three factorization theorems remain conditional set/function mathematics: a map on `range(π_i)` exists iff `π_j` is constant on fibers of `π_i`; it is unique on the range; injectivity of `π_i` is sufficient. No source-defined physical `π_i`/`π_j`, common domain, Klein-Fabric definition/global topology, global-to-local finite-core map, measured dataset, or independent cross-prediction exists.

**Proposed next mathematical gate, not yet formalized:** if a hallway is intended to be geometric rather than merely set-valued, specify the topology/smooth structure and preservation conditions. A quotient map onto the source image plus a continuous fiber-constant target map yields a unique continuous factor map; a smooth surjective submersion plus a smooth fiber-constant target map yields a smooth factor map under the manifold/local-section conditions. This is a standard candidate extension, not Nathan Direct and not yet a Lean result. Metric, orientation, causal, connection, or measure preservation require their own explicit conditions. Do not instantiate these conditions until the source-defined projections are recovered.

No physical calculation, CODATA comparison, data-free physical fixture, paper-gate advancement, BEDROCK edit, or theory promotion occurred. Code Grurple remains ACTIVE; Lane 24 physical/CODATA work remains BACKSEAT/HOLD. Nov 9 P1, Nov 30 P2 and Dec 14 P3 gates remain separate.

## Publication and Meridian routing

- Public-safe correction issue #1268 was opened through the existing publisher. The initial payload was rejected for SHA-256 mismatch. Its body was corrected in place to digest `4399b141fabc33cda3ceb8b03fccb31643d1c4dc92a53a3c9e6d57c3120e2055`, but the publisher listens only to `issues.opened`; the edit did not retrigger it. No published artifact exists. No duplicate issue was created.
- The existing Kestrel→Meridian packet remains the only handoff; no new packet was created. Its original target `REVROT3-19-20261011:542:s3` at 2026-11-02T14:36Z has passed, and no matching Meridian receipt was found. The :36 automation's latest recorded run is h543:s3 (Loom), not the h542:s3 Meridian appearance. No nonresponse is inferred.
- The next Meridian appearance across the existing five leases after the current time is `REVROT3-19-20261011:546:s2`, 2026-11-02T18:24Z. The existing packet is being amended in place to point to that appearance.
- Personal-context lookup found no authenticated active Meridian ChatGPT thread. `WORKSPACES/MERIDIAN/INBOX.md` returned 404 and no alternate inbox was verified. Repository packet delivery is not ChatGPT-thread delivery; consumption and acknowledgment are not claimed.

## Unrelated reading

Read `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `SAT Mark V/TheTANGLE.txt`, lines 1561–1600, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`. The passage is a deliberately unrelated, stylized oral-history/language fragment with a temporal anecdote and commentary; it was not forced into H(s)H. Next cursor: line 1601.

## Final state

Existing :24 task ID, enabled state, DTSTART, hourly recurrence and phase unchanged. No sixth task, no task/prompt/schedule mutation, no new branch or PR, no theory promotion, no paper-gate advancement, no ChatGPT delivery claim.