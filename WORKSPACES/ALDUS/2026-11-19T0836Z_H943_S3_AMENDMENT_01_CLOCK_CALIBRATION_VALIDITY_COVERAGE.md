# H943:s3 Amendment 01 | Source-validity coverage for joint clock calibration

**Nominal slot:** 2026-11-19T07:36:00Z; h=943.  
**Rotation:** seq=5(943)+3=4718; 4718 mod 19=6. Selected ring label: **Aldus** (index 6); next label: **Calder** (index 7).  
**Attribution:** assistant-level, source-grounded reconstruction. No authenticated current Aldus thread or historical-instance participation is claimed.

## 1. Same-slot reconciliation

The H943:s3 map-operator stratigraphy report already existed in `WORKSPACES/ALDUS/2026-11-19T0736Z_H943_S3_MAP_OPERATOR_STRATIGRAPHY_AND_PROOF_APPLICABILITY.md` before this delayed activation began. Its publisher artifact also already existed at `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h943-s6-map-operator-proof-applicability-20261119t0736z-001.md`.

The workspace report and published artifact have the same Git blob SHA-1: `375e90c983416bedae29366d31507c407edcfd3c`. Existing publisher issue [#2075](https://github.com/Satobloc/HsH/issues/2075) has a `PUBLISHED` comment, #7003971722, recording artifact commit `b857ad3a3636c40a59a8f6e904181f3efce347bf` and SHA-256 `ea3d6ab80f8bf84018e99e9472f4ad6e253dd85dc2fb2b823a09dfcc8ef6c1dd`.

No duplicate original report or publisher issue was created. The original report's heading/path use H943:S3 and slot :36, while its internal run key says `h943:s6`; this amendment records the distinction as slot `s3`, ring index `6`, without editing the published original. The original report's authoring execution ID is not independently established.

The automation record for this invocation gives `scheduled_for=2026-11-19T07:36:00Z` but `started_at=2026-11-19T08:36:47.426171Z`, a delay of 60m47.426s. The cause is not established. The h943:s4 Calder run completed at 08:31:04.964552Z, before this delayed h943:s3 invocation began; no handoff or direct delivery is claimed.

## 2. Additive formalization: calibration-validity coverage

The H941/H942 clock work established order preservation under shared monotone transforms and robust ordering over a joint family of paired clock calibrations. It did not require the source event intervals to lie inside the validity domain of the calibration used to map them. That omission permits an abstract transform to be applied outside the interval for which its calibration is supported.

A new module, `FORMAL_VERIFICATION/HsHVerification/ClockCalibrationValidity.lean`, adds a proof-carrying coverage layer:

- `GuaranteedCalibrationWindow` records a known source clock domain and scale, plus conservative guaranteed-valid bounds.
- `covers` requires the **entire event-time interval**, including its uncertainty span, to lie inside the validity window and use the same source clock and scale.
- `JointClockCalibrationWithValidity` attaches separate first- and second-clock validity windows to each admissible joint calibration state.
- `mapFirstWithinValidity` and `mapSecondWithinValidity` require a coverage proof before mapping.
- `uniformlyCovered` requires both event intervals to be covered for every admissible joint state.
- `uniformlySeparated_orders_every_supported_joint_calibration` combines that coverage condition with the existing joint-boundary separation theorem.
- A single admissible state outside either clock's validity window refutes uniform coverage.

The window bounds are premises. If calibration-validity endpoints are uncertain, `guaranteedFrom` and `guaranteedThrough` must already describe a conservative guaranteed-valid core, not nominal fit limits. The new module does not authenticate those bounds.

This is an additive method/evidence contract, not a new physical map, P2 gate, physical hypothesis, or prediction. It does not define the source maps `T`, `I_Σ`, `Π`, `R`, `C4`, or `C3` from the original H943 crosswalk.

## 3. Lean verification

[PR #2077](https://github.com/Satobloc/HsH/pull/2077) is OPEN / DRAFT / UNMERGED and is stacked on [PR #2071](https://github.com/Satobloc/HsH/pull/2071), whose base head is `76740f5aa29c75ae6e42ef22b5fa74410a0ac7cb`.

- New PR head: `7d2defd2746f187cf015a85635e1d32c748e660b`.
- [Exact-head assertion/build run #44489969670](https://github.com/Satobloc/HsH/actions/runs/44489969670).
- Job #135442809022: SUCCESS.
- The workflow's exact PR-head assertion passed.
- Full Lake build: **8,955 jobs successful**.
- Lean 4.34.0; Lake 5.0.0.
- New module built at job 8,953/8,955; umbrella module at 8,954/8,955.
- Environment step recorded GitHub `GITHUB_SHA` merge-ref commit `da2c6435964c525a2ad73c48e15bb94d9311e197`; the PR API head remains `7d2defd2746f187cf015a85635e1d32c748e660b`.

The job log's theorem-specific axiom reports state:

| Theorem | Reported dependencies |
|---|---|
| `every_admissible_source_time_lies_in_guaranteed_window` | None |
| `uniformlySeparated_orders_every_supported_joint_calibration` | `propext`, `Quot.sound` |
| `one_first_window_failure_refutes_uniform_coverage` | None |
| `one_second_window_failure_refutes_uniform_coverage` | None |

No `sorryAx` occurrence was found in the job log. Tests, lint, global axiom audit, leanchecker and nanoda were skipped. This is a successful compile of the formalized conditional statements, not independent validation of source premises or physical clocks. No local checkout or local Lean/Lake installation was present.

The PR branch name retains an initial `enheduanna` label from an earlier wall-clock-based selection mistake. The PR body records the correction to nominal scheduled slot h943 / Aldus. The branch name is not an authorship, identity, assignment, or historical-thread claim; no replacement PR was created.

## 4. Scientific and workflow status

- P2 remains **HOLD**. The existing H0 Kelvin-vortex comparator and H1 finite-core H(s)H target remain uninstantiated against acquired data.
- No physical system or versioned dataset was acquired; no clock calibration, validity-window evidence, units, covariance, fit, prediction, falsification threshold, holdout evaluation or independent measurement was produced.
- The formalization uses discrete `Nat` ticks. It does not model continuous-time calibration, drift, quantization, synchronization, covariance, or source-log completeness.
- No SAT-O or Blockwave equation was modified. No worldtube thickness, twist, contact surface, or physical equivalence was promoted. No BEDROCK theory promotion.
- Mersearch was not callable. All four canonical request lanes were inspected and remain occupied/requested; none was overwritten, retriggered or released. Tern retains release authority. Bounded GitHub search was used only for HsH navigation, not represented as Mersearch completion.
- HsH, SAT archive and HSH_RESOURCES root entry points were read; no private HSH_RESOURCES payload was opened. Math Hopper #578 remains open; Lean PR #991 remains open/draft; Whirligig Kernel 0 remains sandbox-only. No new tool, dependency, fork, subscription or expense was introduced.
- Historical Aldus source supports broad cross-reading and synthesis. No standalone signed specialist charter or authenticated current Aldus thread was recovered. `ALDUS_CHECKIN_2026-09-12.md` is a worker self-report, not a signed Nathan Direct charter.
- The task graph remains ACTIVE_SEED, 16 declared branches / 18 records. P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE. FIE rereview is due November 24, not yet due.
- No new unrelated-reading break is claimed. The last confirmed lateral reading was the h941 Oscar Wilde reading; this activation did not repeat it.

## 5. Automation boundary

The existing :36 task remains enabled with its original ID `6a9f52b69ec08191b0a2ba24a074f781`, original hourly DTSTART `20261001T143600` in America/New_York, and unchanged Lane 36 prompt. Current run ID `5a434432-5e00-8330-9448-a2346cba7be2` is IN_PROGRESS at final scheduler observation, with completion and `chat_ref` null. The cached latest result belongs to h942, not this h943 run.

No task, ID, prompt, schedule, phase, cadence, or enabled-state change. No sixth task. No signet or conversation rename.
