# Workshop Relay :36 | Nadir Voss | h1149:s3

**Nominal slot:** 2026-11-27T21:36:00Z  
**Run key:** `REVROT3-19-20261011:1149:s3`  
**Selection:** Nadir Voss (ring index 10); next Enheduanna (index 11)  
**Disposition:** `REGISTERED_PAIR_COARSE_GRAIN_COMPOSITION_FORMALIZED / EXACT_HEAD_LEAN_BUILD_PASS / NO_PHYSICAL_VALIDATION / P2_HOLD`

This is assistant-level work under a deterministic routing label. It is not authenticated participation by a historical Nadir instance or current Nadir ChatGPT thread.

## 1. Historical authority and boundaries

The historical “Quantum Gravity and Experiments” conversation was recovered:

- Conversation ID: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`
- Raw Git blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`
- 43 mapping nodes; eight user-role messages.

The direct user messages `bb8ecf64-8863-4ee7-a078-ca8cc4104974` and `11122adb-75c5-4418-9b59-29730a034811` authorize an independent mathematical/theoretical playground, competing architectures and derivations, with explicit source-versus-invention separation and no target-fitting of old magic numbers or particle labels. No standalone signed Nadir specialist charter was recovered. The current Nadir workspace is assistant-maintained; its `CURRENT_WORK.md` pointer remains h1111:s3. The latest later published Nadir artifact inspected was h1145:s4, a separate Review-MIND literature/QC report.

The October 25 and current Nathan Direct calculation gates remain controlling: no invented physical fixture, data-free physical calculation, fit, or physical prediction was made. This run is an abstract map-composition theorem, not a Lane 24 Cycle 09 reopening. Nadir's Cycle 08 remains COMPLETE / BACKSEAT / HOLD.

Preflight read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4 and thread-first controls, current main, PWH queue, task graph, recent receipts, Nadir README/BOOT/CURRENT_WORK/INBOX and the historical raw source.

## 2. Source context and the missing cross-scale condition

The source system considered is the air-water vortex experiment in Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). Its cited data DOI is [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The article distinguishes a Basler side-view contour acquisition from a Phantom top-view PIV acquisition and other derived measurement streams. The accessible Methods do not establish an explicit common event-identity map or a complete cross-view sample join. This is a source-reporting boundary, not evidence that the experiment lacked synchronization or registration.

Existing Nadir modules already separate:
- opposing-radius sample identity (`NadirVortexPairedSampleIdentity`);
- cross-modal clock/spatial window registration and sample-alignment evidence (`NadirVortexCrossModalJoinGate`);
- projection/coarse-graining factorization (`NadirProjectionCoarseGrainFactorization`).

The missing composition obligation was **registration preservation under coarse-graining**. A fine-scale cross-modal join is not enough if the two channels' coarse maps no longer commute with one common coarse event identity.

## 3. New typed composition contract

Let admitted samples from two channels be \(A\) and \(B\), with event-registration maps

\[
r_A:A\to E,\qquad r_B:B\to E.
\]

The registered-pair domain is the pullback

\[
R=\{(a,b)\in A\times B:r_A(a)=r_B(b)\}.
\]

This is not an arbitrary Cartesian product or positional zip.

Let channel coarse-graining maps be \(c_A:A\to\bar A\) and \(c_B:B\to\bar B\). Let the coarse channel event maps be \(\bar r_A:\bar A\to\bar E\) and \(\bar r_B:\bar B\to\bar E\), with a common event coarsening \(e:E\to\bar E\).

The new compatibility condition is the pair of commutative squares:

\[
\bar r_A\circ c_A=e\circ r_A,\qquad
\bar r_B\circ c_B=e\circ r_B.
\]

Under these explicit conditions, the induced coarse-pair map

\[
Q:R\to\bar R
\]

is well-defined: a fine registered pair maps to a coarse registered pair.

For a fine joint readout \(F:R\to O\), the existing factorization theorem now applies to this registered-pair map:

\[
\boxed{
F\text{ descends to a deterministic readout on }\operatorname{im}Q
\iff
Q(p)=Q(q)\Rightarrow F(p)=F(q).
}
\]

If two fine registered pairs collapse to the same coarse pair but have different readout values, no deterministic coarse readout can preserve both. This is a no-go for the sufficiency of that coarse representation at the declared resolution.

The codomain is restricted to the actual image `Set.range Q`; the formalization does not assume every possible coarse registered pair is realized. This matters when event coarsening is many-to-one, since equality of coarse event labels alone could admit pairs that were never fine-registered.

**Architecture improvement:** cross-modal registration must commute with the selected change of scale, and the joint observable must be constant on the resulting coarse fibers. This is stronger than checking each channel's coarse-graining separately.

## 4. Lean formalization

Added `NadirRegisteredPairCoarseGrainFactorization.lean` to the existing Nadir formalization branch and imported it into the existing verification root.

- Existing PR: [#1189](https://github.com/Satobloc/HsH/pull/1189)
- Branch: `research/nadir-affine-translation-quotient-20261101t0324z`
- New exact head: `f00322aa8e99ef599166f9fe2bde80f61e36ac21`
- New module blob: `c79c70ef57c165ba6c34aa9cdabcad747a9f3206`
- Root aggregator blob: `b31ba7ba886e587aeef0a0096b84ba4bd9d09b81`
- New declarations: registered-pair pullback type, coarse-registration compatibility, induced coarse registered-pair map, registration-preservation theorem, joint-readout factorization iff fiberwise constancy, and a no-go theorem for a fiber mismatch.
- Four theorem-specific `#print axioms` commands are included.

The exact-head Actions run [#46071512385](https://github.com/Satobloc/HsH/actions/runs/46071512385), job `140749607805`, completed **SUCCESS** at exact checkout `f00322aa8e99ef599166f9fe2bde80f61e36ac21`.

- Lean 4.34.0; Lake 5.0.0.
- Full root build: 8,964 jobs successful.
- New module: built at 8,958/8,964.
- `commonEvent_eq_second`: no axioms.
- `coarseRegisteredPairMap_preserves_registration`: no axioms.
- `coarseJointReadout_factors_iff_fiberwise`: `Classical.choice`.
- `no_coarse_joint_readout_of_fiber_mismatch`: `Classical.choice`.

The two `Classical.choice` dependencies arise from the existing image-factorization construction's representative choice. No `sorryAx` or `admit` appeared in the retrieved job log. However, tests, lint, leanchecker, nanoda, and the global axiom audit were skipped; `nanoda-allow-sorry` was true. This is exact-head compilation and theorem-specific axiom reporting, not a repository-wide proof-placeholder audit. No `#eval` fixture was added because no physical data or numerical example was authorized.

The PR remains OPEN / DRAFT / UNMERGED. It has 19 changed files and 107 commits. Its base is another research branch, not main. GitHub compare reports the PR head 161 commits ahead and 29,797 behind current main; the base branch itself is 58 commits ahead and 29,797 behind main. The compare endpoint caps its detailed commit listing. No rebase, merge, or promotion was attempted. The previous exact-head build #45616238757 verifies only the earlier PR head, not this new module.

A source-scope and verification note was added to [PR #1189](https://github.com/Satobloc/HsH/pull/1189#issuecomment-7228716179). It is not an independent review or merge request.

Lean can verify only the formalized map statements. It does not validate the source experiment's clock maps, spatial calibration, event IDs, sample alignment, coarse maps, or physical interpretation. The total maps in this module are defined only on already-admitted samples; missing/unregistered samples and approximate time-window joins need separate modeling and external evidence.

## 5. Physical and campaign status

No Figshare data bytes were retrieved. No raw sample keys, synchronized event map, spatial calibration, covariance, fit, physical calculation, H(s)H forward map, independent holdout, or numerical falsification threshold was produced. The article is a source-context candidate, not an admitted P2 system or an H(s)H prediction.

- P0 presentation safety: FAIL.
- Paper A/B live-route acceptance: NOT_OBSERVED.
- Deployment: NOT_VERIFIED.
- Release/standdown: NOT_AUTHORIZED.
- P1 cognition: overdue, frozen, Orson-owned.
- P2 November 30: HOLD.
- P3 December 14: incomplete.
- FIE rereview: December 8.
- Unrelated-source break: November 28.

The latest discovery refresh #46071288674 succeeded at event head `41c2410a73c4569ec802621de8e74793a1cc2a73`; current main `4e971712e5301c54ea9698e5c6c4f3f4b6a3bd06` is two generated-discovery-only commits ahead. Navigation #46071288456 completed FAILURE at source head `41c2410a73c4569ec802621de8e74793a1cc2a73`. Its strict date-tag audit reported 1,040 correctly dated conversations, 2 undatable conversations, and 883 skipped non-conversation/bad-JSON records; 75 runner-local renames were not persisted. Viewer, chronology, indexing, tests, and deployment steps were skipped. The source-level reader defect remains unresolved; no P0 implementation or release action was taken.

The PWH queue remains Tern-owned and stale at its h1081:s3 deep-review cursor; the task graph remains 18 records versus `branch_count=16`. No queue, graph, worker-local checkpoint, SAT-O/Blockwave equation, manuscript, or BEDROCK theory state was changed. All four Mersearch lanes remain occupied; no query, overwrite, release, or retrigger occurred. No new tool, dependency, fork, subscription, or expenditure.

## 6. Next cursor

1. Check exact-head run #46071512385 to completion; if successful, inspect the four theorem-specific axiom reports and the full job conclusion. If it fails, repair only the demonstrated proof issue and rerun the exact corrected head.
2. Obtain independent review of the typed pullback and coarse-registration compatibility assumptions before any merge.
3. Only after actual source data, validated clock/spatial registration, event/sample identifiers, coarse maps, units and uncertainty records exist, determine whether the proposed map can be instantiated. Otherwise retain `MAP_OR_REGISTRATION_INCOMPLETE`.
4. Do not treat the abstract theorem as a physical discriminator or P2 paper result.

**Successor:** Enheduanna, `REVROT3-19-20261011:1149:s4`. The repository workspace still records no authenticated current Enheduanna thread or standalone signed specialist charter. Any context packet is optional and repository-only; no direct-thread delivery, consumption, acknowledgment, assignment, or ownership transfer is implied.

**Scheduler:** the existing :36 Worldtube task was not modified; no sixth task was created.
