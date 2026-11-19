# Meridian h956:s4 | Review-MIND source and Lean QC of Kestrel's turbulent-blob sampling clock

**Nominal slot:** 2026-11-19T20:48:00Z  
**Run key:** `REVROT3-19-20261011:956:s4`  
**Selected ring label:** Meridian (index 15)  
**Next deterministic ring label:** Mercer (index 16)  
**Disposition:** `SOURCE_EQUATION_DISCREPANCY_IDENTIFIED / CURRENT_LEAN_BUILD_PASS_REPLAYED / FORMALIZATION_SCOPE_NARROWED / P2_HOLD / P0_UNCHANGED / PUBLISHED_VERIFIED`

## 1. Selection, authority, and access boundary

The fixed-ring calculation is:

\[
h=956,\qquad seq=5h+4=4784,\qquad 4784\bmod19=15.
\]

The next ring label is `ring[16] = Mercer`. This is deterministic routing, not authentication of either historical worker or a ChatGPT thread.

Meridian's historical role is source-referenced through direct-user role-setting messages identified in the Meridian source-recovery/role ledgers and current `BOOT.md`. No standalone signed specialist charter was found. The title “Geometric Formalization & Representation Lead” is assistant-authored, not Nathan Direct. The original raw conversation export was located by its recorded path/blob, but the GitHub connector returned an empty content field; therefore this run does not quote or claim a fresh verbatim parse of those original messages.

The controlling Meridian workspace assignment remains Code Grurple P0: Paper A accepted-R1 presentation-repair support only, preserving the pinned Paper A source; Mercer retains independent A/B presentation QA. This Review-MIND task is a one-run overlay and does not replace or reallocate P0. No manuscript, reader, site, solver, or worker-local workspace was modified.

No authenticated current Meridian thread was established. `WORKSPACES/MERIDIAN/INBOX.md` is absent, the current :48 run has no `chat_ref`, and the Kestrel-to-Meridian packet is explicitly `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`. No direct-thread delivery, assignment, response obligation, ownership transfer, consumption, or acknowledgment is claimed.

## 2. Primary source and the critical equation discrepancy

Primary source: Takumi Matsuzawa, Minhui Zhu, Nigel Goldenfeld and William T. M. Irvine, “Nonlinear diffusion and decay of a blob of turbulence spreading into a quiescent fluid,” *PNAS* 123(7), e2526858123 (2026), DOI [10.1073/pnas.2526858123](https://doi.org/10.1073/pnas.2526858123). The relevant source is [Supporting Information §A.4, Eqs. (54)–(57)](https://guava.physics.ucsd.edu/~nigel/REPRINTS/2026/Matsuzawa%20decay%20and%20spread%20of%20turbulence%20PNAS%202026.pdf), especially the displayed Eq. (55). The main paper defines \(q=u_i u_i/2\) as turbulent kinetic energy per unit mass. For \(n=-2\), \(c\) therefore has dimensions of length squared, so \(d/\sqrt{2c}\) is dimensionless; the logarithm of a dimensional time interval still requires a reference time.

The SI defines the assumed decay law

\[
q(t)=c(t-t_0)^n,\qquad t>t_0,
\]

and chooses an interval \(\Delta(t)\) by the fixed-RMS-displacement condition

\[
\int_t^{t+\Delta(t)}U_{\rm rms}(t')\,dt'=d.
\tag{54}
\]

For \(n=-2\), \(U_{\rm rms}=\sqrt{2q}=\sqrt{2c}/(t-t_0)\), so direct integration gives

\[
d=\sqrt{2c}\,
\ln\!\left(\frac{t+\Delta-t_0}{t-t_0}\right).
\]

Therefore the Eq. (54) solution is

\[
\boxed{
\Delta_{\rm Eq54}(t)
=(t-t_0)\left[
\exp\!\left(\frac{d}{\sqrt{2c}}\right)-1
\right].
\}
\]

However, the published SI text layer prints the \(m=0\Leftrightarrow n=-2\) branch of Eq. (55) as

\[
\boxed{
\Delta_{\rm printed}(t)
=(t-t_0)\exp\!\left(\frac{d}{\sqrt{2c}}-1\right),
\]

with `−1` inside the exponent. This is not algebraically equivalent to the Eq. (54) solution.

There is an independent check from the adjacent \(m\ne0\) branch of Eq. (55), where \(m=n/2+1\). Its \(m\to0\) limit is

\[
\lim_{m\to0}
\left[
\left(
1+\frac{md}{\sqrt{2c}}(t-t_0)^{-m}
\right)^{1/m}-1
\right]
=
\exp\!\left(\frac{d}{\sqrt{2c}}\right)-1,
\]

again placing `−1` outside the exponential.

**Source-critical conclusion:** the displayed \(n=-2\) branch is internally inconsistent with both Eq. (54) and the continuous \(m\to0\) limit of the neighboring branch. This is most plausibly a typographical/source-equation error. The corrected expression above is an assistant-derived mathematical correction, **not** an author-issued erratum and not a replacement for the verbatim source.

Let \(x=d/\sqrt{2c}\). The distinction matters:

- Eq. (54) / \(m\to0\) derivation: \(\rho_{\rm derived}=e^x-1\), so \(\log(1+\rho_{\rm derived})=x\).
- Literal printed Eq. (55): \(\rho_{\rm printed}=e^{x-1}\), so \(\log(1+\rho_{\rm printed})=\log(1+e^{x-1})\).

Both choices produce a constant relative interval and therefore constant log spacing for a fixed run. Only the first satisfies the stated fixed-displacement condition. The Kestrel module currently formalizes the literal printed factor, not the Eq. (54)-derived factor.

The SI's following prose also writes \(\log t_k-\log t_{k-1}=\log(1+c)\), although `c` is already the power-law amplitude and the virtual origin is retained in Eq. (57) as \(\log(t-t_0)\). For an unambiguous recurrence ledger, use a separate symbol \(\rho\) for the relative step and the shifted coordinate \(\log(t-t_0)\). Treat the source's `log t` / `log(t-t0)` wording as a notation requiring clarification, not as an H(s)H result.

## 3. Acquisition schedule is piecewise, not globally log-uniform

The SI says the 1,050-second acquisition consists of three parts:

1. An initial approximately one-second constant-frame-rate segment, whose exact duration depends on the chosen virtual origin and initial RMS velocity.
2. A middle segment using the \(n=-2\) Eq. (55) trigger rule.
3. A final segment clamped to the timing box's minimum supported frame rate \(f_{\min}\).

Consequently, equal increments in the logarithmic coordinate apply to the ideal recurrence in the middle segment, not automatically to every frame across the full 1,050-second record. The next clock ledger should include at least `segment_id`, `trigger_mode`, `f_min`, and a clamp/boundary marker, in addition to the existing physical timestamp, frame index, actual interval, schedule virtual origin, fitted virtual origin, forcing-stop event, last-ring-arrival event, and timestamp uncertainty.

Dimensional note: the SI's \(\log(t-t_0)\) is shorthand for a logarithm after choosing a time unit. A dimensionally explicit coordinate is

\[
\tau=\ln\!\left(\frac{t-t_0}{t_{\rm ref}}\right),
\qquad
t=t_0+t_{\rm ref}e^\tau,
\qquad t_{\rm ref}>0.
\]

The discrete log increment is unchanged by \(t_{\rm ref}\), but the inverse map and chain-rule factor are not. This is a normalization clarification, not a new physical time.

## 4. Independent audit of Kestrel PR #2126

Kestrel's [report](https://github.com/Satobloc/HsH/issues/2127) and [draft PR #2126](https://github.com/Satobloc/HsH/pull/2126) were fetched and compared with the primary SI.

The Lean module defines:

`relativeStep d c = exp (d / sqrt (2*c) - 1)`

and proves positivity, the algebraic offset recurrence, constant log-clock increment for any positive relative step, inverse maps, and a generic chain-rule statement. These theorems are valid for the formalized real-valued definitions. They do **not** prove that the chosen `relativeStep` solves Eq. (54). The generic `logClock_step` theorem remains useful and correct; the source-specific instantiation needs the Eq. (54) / \(m\to0\) reconciliation.

A source-faithful follow-up should keep the original printed expression and corrected derivation separately, define

\[
\rho(d,c)=\exp\!\left(\frac{d}{\sqrt{2c}}\right)-1,
\]

and prove the integral/limit identity under explicit assumptions \(c>0\), \(d>0\), and \(t>t_0\). The positivity proof for this corrected \(\rho\) requires \(d>0\). A dimensionally explicit log-clock module should add \(t_{\rm ref}>0\) and use \(t_0+t_{\rm ref}e^\tau\); the chain-rule multiplier becomes \(t_{\rm ref}e^\tau\).

The [Kestrel workspace report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-19T2036Z_H956_S3_TURBULENT_BLOB_LOGTIME_COORDINATE_AND_PREDICTION_GATE.md), [published artifact](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-h956-s3-turbulent-blob-logtime-coordinate-20261119t2036z-001.md), and original receipt initially recorded `LEAN_PENDING`. The publisher artifact SHA-256 is `44305ef2fdb7d35fd7f4df5ab6e258a8713be49ab84ccd27c244ce4b9196ecd0`; issue #2127 and the artifact were independently compared byte-for-byte. The pending status was superseded by the later exact-head update in PR comment #7021948789:

- PR head: `d364994731889a46434d67b3b2a6717066f029fb`.
- [Actions run #44612550693](https://github.com/Satobloc/HsH/actions/runs/44612550693), job #135872666923: **SUCCESS**.
- Lean 4.34.0 / Lake 5.0.0; full Lake build: 8,948 jobs; Kestrel module built at 8,926/8,948.
- Actual `#eval` outputs: `400` and `35/2`.
- Theorem-specific axiom output lists `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appears in those outputs.
- Tests, lint, global axiom audit, leanchecker and nanoda were skipped.
- PR remains open, draft and unmerged on `research/kestrel-logtime-sampling-20261119t2036z`, based on the existing isolated Lean project branch.

This is an exact-head compilation and actual `#eval` run of the **current formalized statements**. It is not a proof of the Eq. (54) translation, the corrected \(\rho\), dimensional normalization, experimental acquisition, or H(s)H. No new Lean code or run was created in this Review-MIND pass; the corrected formalization remains a proposed follow-up under the originating Kestrel lane. The separate Vercel preview failure was a free-tier daily deployment limit, not a Lean failure; no paid upgrade is warranted.

## 5. Physical evidence boundary and H(s)H interpretation

The identifiable system is a water-tank turbulent blob measured with PIV/3D PTV. The source reports large- and small-blob 2D2C PIV ensembles (`n=21` and `n=10`) and a separate single-realization 3D PTV record (`n=1`). It reports frame intervals from 2.5 ms to 1 s and a 1,050-second acquisition scheme. The 400 ratio is the endpoint interval ratio, not the per-frame geometric sampling factor.

The source's fitted decay exponents differ from the \(n=-2\) trigger-design assumption. Schedule design, fitted dynamics, and physical event times must remain distinct.

No raw Zenodo/HDF5 bytes, complete per-frame timestamp series, per-run trigger manifest, calibration covariance, or raw realization-level covariance was acquired here. No raw-data reanalysis, fit, independent prediction, numeric falsification threshold, or independent measurement was performed.

The study does not define an H(s)H time-surface, worldtube thickness, twist, contact surface, or medium-to-force law. No equivalence between logarithmic sampling time and H(s)H time geometry is proposed. P2 issue #565 remains `SELECT REAL SYSTEM + SOURCE MATH / HOLD`; this is not a system selection or paper-gate advancement.

## 6. Workshop controls and repository coverage

- Live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival V3/V4/thread-first rules, current branch, task graph, PWH queue, current receipts, Meridian BOOT/CURRENT_WORK, historical role ledgers, and Kestrel's h956:s3 report/receipt/optional packet were inspected.
- HsH main head immediately before report publication: `47f90d7f3b56bb1a03a0003877ddb4e9be0865e0` (after the optional Mercer packet, INBOX pointer, and Common HANDOFFS index were committed); the current task graph reports 16 declared branches. The PWH queue retains 18 records.
- SAT archive root/index and an unrelated reading break were completed. HSH_RESOURCES root README and public `indexes/AI_START_HERE.md` were read; no private payload was opened.
- Mersearch was not callable. All four current Mersearch request files remain `requested`/occupied; none was overwritten, retriggered, or released. GitHub repository search was a bounded fallback, not represented as a Mersearch run. No internal SAT archive hit for this PNAS paper was found in the bounded search.
- No new tooling was proposed or built; the existing Kestrel Lean PR and repository CI were reused. SciSpace was not needed for this primary-source equation audit. No new dependency, fork, subscription, or paid service was created.
- P0 Code Grurple remains ACTIVE ([canonical issue #1747](https://github.com/Satobloc/HsH/issues/1747)). The eight protected Paper A/B source and presentation-control blobs were re-fetched and all eight exactly match the established fingerprints. The discovery-index policy mismatch remains an open source-layer issue; actual reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No live reader-route probe was attempted, so no route status was promoted and no site repair or standdown was attempted.
- P1 cognition remains OVERDUE / NOT READY / Orson-owned ([issue #564](https://github.com/Satobloc/HsH/issues/564)). This assistant-level run does not count toward Orson's four-of-five authenticated specialist-work target; no Orson protocol, dataset, or manuscript was changed.
- P2 November 30 remains HOLD ([issue #565](https://github.com/Satobloc/HsH/issues/565)); P3 December 14 remains INCOMPLETE. FIE last review was November 10 and next due November 24, so no stale-triggered rereview was due.
- No SAT-O or Blockwave equation was retrieved, copied, corrected, or modified in this pass. No BEDROCK theory promotion, Factory Floor intake, CODATA comparison, or physical prediction occurred.

Unrelated reading break: SAT archive, `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 2280–2319. This is an archived Old Saxon / Old High Franconian vocabulary list, not scientific evidence. Return cursor: line 2320.

## 7. Automation, receipt, and handoff

The existing :48 automation remains enabled with its exact original ID `6aa6c3bc02b48191b8a91a30d2a155e0`, exact schedule

`DTSTART;TZID=America/New_York:20261001T144800`  
`RRULE:FREQ=HOURLY`

and unchanged prompt/phase. No task, ID, schedule, cadence, enabled-state, or phase mutation; no sixth task; no signet or conversation rename.

At the final scheduler observation, the :48 run ID `937194fd-69e4-8320-8539-563879e13881` was still `IN_PROGRESS`, scheduled 20:48Z, started 20:48:54.797275Z, with null completion and null `chat_ref`. The scheduler's `latest_result` still belongs to the preceding h955:s4 Nadir run, not this h956:s4 execution. Sibling observations at final peek: :00 h957:s0 run `b1dde18f-1e34-8333-a500-7533b54f3049` was IN_PROGRESS (started 21:00:29.861594Z; its latest completed result remains h956:s0); :24 h956:s2 run `6a116939-35a8-8322-abc6-9a98bebe7bc7` FAILED at 20:49:38.137933Z after starting 20:24:33.421403Z; :36 h956:s3 run `a29bc1c0-1cac-8323-96e8-b90ff584d984` COMPLETED at 20:56:44.713432Z; :12 remains disabled. The observed runs overlap and complete out of nominal slot order. No cause, restart, duplicate, or thread identity is inferred.

No direct-thread handoff, task, response obligation, or ownership transfer is claimed. The [prestart optional Mercer h956:s5 seed](../REVIVAL_ROTATION_HANDOFFS/2026-11-19T2048Z_from_s4_meridian_to_s5_mercer_PRESTART_OPTIONAL_SOURCE_EQUATION_QC.md) is repository-only, with one pointer in [Mercer INBOX](../../MERCER/INBOX.md) and one in the [Common HANDOFFS index](../HANDOFFS.md). Packet commit `74a1ca3b3ca2103543ff32ecf065f5ea32992b89`, packet blob `3c049d427ae4fe067a92a39a483c4a082e05890c`; INBOX commit `5c8004fb094339c16200b83981e8d2aa767bd36b`; HANDOFFS index commit `47f90d7f3b56bb1a03a0003877ddb4e9be0865e0`. Each pointer was independently read back exactly once. This is not a scheduled task. No direct-thread delivery, consumption, or acknowledgment is claimed.

**Final:** `H956_S4_ASSISTANT_LEVEL_REVIEW_MIND / PNAS_EQ55_SOURCE_DERIVATION_DISCREPANCY / PR2126_EXACT_HEAD_BUILD_PASS_REPLAYED / EQ54_CORRECTION_ASSISTANT_DERIVED_NOT_AUTHOR_ERRATUM / DIMENSIONAL_TREF_AND_PIECEWISE_TRIGGER_GAPS / P0_P1_P2_P3_UNCHANGED / PUBLISHED_VERIFIED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK / AUTOMATION_RUN_STILL_IN_PROGRESS`.
