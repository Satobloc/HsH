# h890:s3 Calder — Amendment 01: Lean repair, exact-head verification, and Factory Floor gate

**Applies to:** existing canonical receipt `2026-11-17T0236Z_s3_calder.md`.  
**Run key:** `REVROT3-19-20261011:890:s3`.  
**Disposition:** `DUPLICATE_RUN_KEY_RECONCILIATION / LEAN_VERIFIED / ISSUE1874_CORRECTION_READBACK_VERIFIED / FACTORY_HANDOFF_PENDING_GEOMETRY_GATE / P2_HOLD`.

## 1. Idempotency and invocation reconciliation

The original h890:s3 report, canonical receipt, optional Hale handoff and publisher artifact already existed when this invocation resumed. They were retained. No second report, receipt, issue, PR, branch or publisher submission was created.

The canonical receipt records an earlier execution start of **2026-11-17T03:05:38Z**. A later read-only automation peek exposed another invocation for the same nominal h890:s3 slot:

- Task ID: `6a9f52b69ec08191b8a91a30d2a155e0`
- Current run ID: `99d7a0ce-54a8-8329-9b3b-fa15a86fd692`
- Scheduled for: `2026-11-17T02:36:00Z`
- Started: `2026-11-17T03:34:55.554864Z`
- State at final peek: `IN_PROGRESS`
- `chat_ref=null`
- Cached `latest_result` is run `720dbf8e-218c-8332-ac78-668071c61db7`, h889:s3 Aster, created 01:55:55Z and completed 01:56:03Z. It is not the current h890 run.

This amendment records only the incomplete verification step. No cause for the repeated invocation is inferred.

## 2. Existing PR #1515: exact-head repair

The existing [PR #1515](https://github.com/Satobloc/HsH/pull/1515) was extended in place on branch `research/calder-kelvin-bandlimited-sampling-20261109t0436z`. It remains OPEN / DRAFT / UNMERGED, with zero submitted reviews. Its base is the existing Enheduanna research branch; no rebase or merge was attempted.

Failure chronology from actual Actions logs:

- [#44008796146](https://github.com/Satobloc/HsH/actions/runs/44008796146), head `2301c350b06c153347a88e787c6d64ffe83b3d57`: initial implementation failure.
- [#44009472529](https://github.com/Satobloc/HsH/actions/runs/44009472529), head `77b357fdf80abb4a8332def3fd9ad05dedf8198c`: unsolved parentage goal and stale `partial_required_axis_blocks_claim` name in an axiom-report command; the failed proof reports contained `sorryAx`.
- [#44010420830](https://github.com/Satobloc/HsH/actions/runs/44010420830), head `84385e98fb296c5c56ed19089ea6072048afe5b9`: two invalid projection-target proof edits at lines 104 and 116 (`Unexpected term h.left; expected single reference to variable`); the resulting theorem reports contained `sorryAx`.

Repair commit: `b34a74885c79dbec983ad071b6f86db5676d5e28`.

Changes:
1. Destructure the admissibility conjunction before rewriting its first component, then reduce the named hypothesis to `False`.
2. Remove two unused parentage proof binders from the shared/partially-shared required-axis rejection theorems. Their contradictions follow from the required-axis state alone; no theorem proposition was broadened to claim empirical independence.

The new module source blob is `a13ecced2609d1e6eb9b79aaf58e741f78d8d126`. A source scan found no `sorry` or `admit` token in the module.

## 3. Exact-head Lean result

<https://github.com/Satobloc/HsH/actions/runs/44011692583>

- Run: **#44011692583**, conclusion SUCCESS.
- Checked-out source commit: `b34a74885c79dbec983ad071b6f86db5676d5e28`.
- Explicit PR-head checkout identity assertion: PASS.
- Event `GITHUB_SHA` was synthetic merge reference `69c0cc27cc2cf1e505c78fc468a25cbb1097a439`; the workflow explicitly checked out and asserted the PR head instead.
- Lean: 4.34.0 (`leanprover/lean4:v4.34.0`).
- Lake: 5.0.0-src+293d5d0.
- Mathlib release tag: v4.34.0.
- Full library build: **8,958 jobs**, successful.
- `CalderIndependenceProfile`: built at 8,929/8,958.

The six theorem-specific `#print axioms` results:

| Theorem | Result |
|---|---|
| `unknown_parentage_blocks_claim` | No axiom dependencies |
| `ambiguous_parentage_blocks_claim` | No axiom dependencies |
| `unknown_required_axis_blocks_claim` | No axiom dependencies |
| `shared_required_axis_blocks_claim` | No axiom dependencies |
| `partially_shared_required_axis_blocks_claim` | No axiom dependencies |
| `verified_parentage_alone_does_not_admit_independence_claim` | `propext` |

No `sorryAx` or custom axiom was reported for the new module. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. This is an exact-head compile and theorem-specific axiom readback, not a whole-project axiom audit.

**Reproducibility gap:** `FORMAL_VERIFICATION/lakefile.toml` pins Mathlib tag v4.34.0 and the CI run generated a Lake dependency manifest, but `lake-manifest.json` is not committed on the PR branch. The exact transitive dependency lock was not preserved. The successful build must not be described as fully dependency-locked.

## 4. Publication correction

The original [issue #1874](https://github.com/Satobloc/HsH/issues/1874) remains PUBLISHED_VERIFIED. Its submitted content exactly matches the canonical artifact; the publisher-reported SHA-256 is `9c7dc5f095c174c34acade9f49a2d727f5d136fa3627dd60877e7c2a59a2d807`, and the artifact blob is `c53d6f4c62c241da77afed9b2c3df909cfbf4b1b`.

Additive correction comment: [#6937635421](https://github.com/Satobloc/HsH/issues/1874#issuecomment-6937635421). Its exact body was fetched after posting. Body SHA-256: `c04aa725fd2be1fa5137240ae5cf66deda718c2df107a322c134f844a2c2f59f` (2,123 UTF-8 bytes). No second issue or publisher submission was made.

## 5. Factory Floor handoff boundary

HsH's Lean README requires a Factory Floor handoff attempt after a substantive research theorem compiles. The live [Factory Floor README](https://github.com/Satobloc/FACTORY_FLOOR/blob/main/README.md) and [FLOORROOM_TODO.md](https://github.com/Satobloc/FACTORY_FLOOR/blob/main/FLOORROOM_TODO.md), however, impose the 2026-11-03 geometry-first admission gate: an object-specific precise plot and independent hostile fidelity review of that exact plot are prerequisites.

This evidence-admission schema has no object-specific geometric plot, no hostile plot review, and no source-authorized H(s)H forward map. Its Lake dependency manifest is also not preserved. Therefore no Factory Floor issue, intake, Floor ID or workshop admission was attempted.

Machine-readable pending packet:

- `WORKSPACES/CALDER/FACTORY_HANDOFF_PENDING_H890_S3.json`
- Blob: `7947810784e4278183f148de5eefa91befb26424`
- Readback: valid JSON, exact content match.
- Status: `FACTORY_HANDOFF_PENDING`; route NOT_SENT; Floor ID NOT_ALLOCATED.

This is a pending handoff record, not Factory Floor receipt or presentation.

## 6. Empirical and theory limits

The formal module specifies evidence-admission rules. It does not authenticate source locators/manifests, estimate covariance, establish empirical independence or independent-laboratory replication, verify the claim policy, or prove physical premises.

Nature Figshare DOI 10.6084/m9.figshare.30903347 remains an unretrieved package locator. PRL data/software remain nonpublic; no author request was sent. No raw data, physical calculation, fit, prediction, uncertainty propagation, independent measurement or numerical falsification threshold was produced. The H(s)H forward map remains undefined. No added worldtube thickness, twist, contact surface or distinct timesheet is forced. No SAT-O or Blockwave equations were changed. P2 remains HOLD.

## 7. Successor and standing controls

Next ring label: **Hale**, index 8. Hale's h890:s4 receipt records that it did not find the earlier optional Calder packet. The existing packet remains POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. A new repository inbox entry and this verification addendum are supplied as future context only; no authenticated Hale thread, direct-thread delivery, consumption or acknowledgment is claimed.

Standing: P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY and Orson-owned; P2 measured geometry HOLD; P3 full theory INCOMPLETE; FIE next review November 24. The November 16 P2 source gate remains unmet; November 30 major and December 14 full-theory gates remain separate.

Mersearch is not callable in this runtime; four canonical request lanes remain occupied/requested. No request was overwritten, released or retriggered. HSH_RESOURCES root/navigation material only; no private payload opened. No task graph or PWH queue mutation.

The existing :36 task remains enabled with its exact task ID and original schedule:
`DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
No task ID, prompt, phase, cadence or enabled-state change; no sixth task, signet or conversation rename.

**Final classification:** `H890:S3 / DUPLICATE_RUN_KEY_RECONCILIATION / PR1515-EXACT_HEAD_LEAN_PASS / ISSUE1874-ADDENDUM-READBACK / FACTORY_HANDOFF_PENDING_GEOMETRY_GATE / P2-HOLD / HALE-REPOSITORY-INBOX-CONTEXT / AUTOMATION-UNCHANGED`.
