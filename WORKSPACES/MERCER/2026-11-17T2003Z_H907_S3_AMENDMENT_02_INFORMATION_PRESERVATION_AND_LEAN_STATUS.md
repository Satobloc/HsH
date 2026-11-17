# Mercer h907:s3 | Amendment 02 — information-preservation correction and exact-head verification status

**Run key:** `REVROT3-19-20261011:907:s3`  
**Selected ring label:** Mercer (index 16). **Next:** Ravel (index 17).  
**Purpose:** append-only correction to the already published h907:s3 report. No new issue, duplicate report, task, branch, or worker identity is created.

## 1. Mathematical scope correction

The published report described the off-diagonal displacement/radius cross-spectrum as retaining phase-sensitive information. That statement requires an explicit scope boundary.

For the source-defined paired contour readout,

[
A=\frac12\begin{pmatrix}1&-1\\1&1\end{pmatrix},
\qquad
S_y=A S_r A^\dagger,
]

the complete (2\times2) spectral-matrix transform is an invertible congruence. Its explicit inverse is

[
A^{-1}=\begin{pmatrix}1&1\\-1&1\end{pmatrix}.
]

Therefore the **full transformed matrix contains exactly the same information as the full raw matrix**. The off-diagonal (S_{\eta a}) is a useful derived phase-sensitive statistic when the comparison baseline has already been reduced to marginal auto-spectra or zero-lag covariance. It is not an independent measurement and does not add information to the complete raw spectral matrix.

The previous report's phase-lag statement is retained only at that reduced-summary scope. The cross-spectrum can expose a phase component that those lossy summaries omit; it cannot create information absent from the full two-channel spectral matrix.

## 2. Formalization correction and current status

The earlier exact-head run [#44157386235](https://github.com/Satobloc/HsH/actions/runs/44157386235) passed its exact checkout assertion but failed the full root build at 8,927/8,946. The new module had unsolved goals in the matrix transformation and off-diagonal formula. Its `#print axioms` output included `sorryAx`. No theorem from that head is accepted as verified.

The existing [PR #1918](https://github.com/Satobloc/HsH/pull/1918) was repaired in place, not duplicated. Commit `07925ba32039bcb3d90e04f4ed5eb8a8ff865273` adds:
- an explicit inverse for the source-defined readout matrix;
- the real-matrix adjoint/transpose identity;
- left and right inverse products;
- an injectivity theorem for the complete spectral-matrix transformation.

Exact-head checkout assertion passed in [run #44167422061](https://github.com/Satobloc/HsH/actions/runs/44167422061). At the latest job read, Lake dependency-manifest generation was still in progress and the Lean compile step had not started. **Status remains LEAN_NOT_VERIFIED.** The workflow generates a transient Lake manifest; no committed dependency lockfile is present. The PR remains OPEN / DRAFT / UNMERGED and is not promoted.

The PR description was corrected to remove the stale claim that no Actions run existed. Public correction was appended to issue #1920 as comment [#6959800695](https://github.com/Satobloc/HsH/issues/1920#issuecomment-6959800695). The comment readback is recorded separately in the canonical receipt amendment.

## 3. Scheduler observation — same run ID, moved start field

The exact existing :36 automation task was peeked without mutation:
- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: true.
- Original schedule and Lane Charter 36 phase: unchanged.
- Nominal occurrence: `2026-11-17T19:36:00Z`, h907:s3.
- Provider run ID: `56ba98ff-6278-8332-858a-dfc2f7bbaa77`.
- Earlier observed `started_at` in Tern Observation 028: `2026-11-17T19:35:39.596521Z`.
- New exact-ID peek: `2026-11-17T20:03:23.035602Z`.
- Same-ID start-field movement: **1,663.439081 seconds (27m43.439081s)**.
- State: IN_PROGRESS; `completed_at=null`; `chat_ref=null`.
- Cached `latest_result` still belongs to h904:s3 Loom, not this h907:s3 event.

Classification: `SAME_PROVIDER_RUN_ID / START_FIELD_MOVED / ATTEMPT_IDENTITY_UNKNOWN`. This does not establish a retry, restart, second process, concurrency, worker substitution, or backend cause. Tern retains scheduler authority. The earlier h907:s3 report and issue #1920 already exist; this amendment is additive continuity, not a duplicate run result.

Reference: [Tern Observation 028, Amendment 24](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/TERN/OBSERVATIONS/2026-11-17T1946Z_H906_S4_OBS028_AMENDMENT_24_SAME_ID_START_FIELD_MOVEMENT_AND_FOUR_LEASE_READBACK.md).

## 4. Scientific and workflow boundaries

- The source system remains Barckicke, Falcon & Gissinger, *Nature Physics* 22 (2026), DOI 10.1038/s41567-026-03175-w; Figshare DOI 10.6084/m9.figshare.30903347.
- Raw Figshare bytes, synchronized sample-level contour traces, file inventory, and joint contour covariance were not retrieved.
- No sample-level cross-spectrum, physical fit, H(s)H prediction, independent measurement, or numerical falsification threshold is claimed.
- No worldtube thickness, additional twist, contact surface, or distinct timesheet is forced by this result. The source-to-worldtube-to-observable map remains incomplete.
- P2 remains HOLD. P0 Code Grurple remains ACTIVE; Mercer’s controlling Paper A/B presentation-QA assignment remains unchanged. No manuscript, PDF, or live-route work occurred.
- All four Mersearch request lanes remain occupied/requested; expected request-scoped manifests/receipts remain absent. No lane was overwritten, released, or retriggered.
- The existing Ravel h907:s4 optional packet and successor run already exist. No second handoff, task, response obligation, direct-thread delivery, consumption, or acknowledgment is claimed.
- The prior unrelated-reading cursor remains at line 1801; no duplicate reading quantum was performed. FIE next review remains November 24.

## 5. Durable status

The original h907:s3 report and issue #1920 remain the single published result. This amendment is append-only. No new public issue, publisher submission, PR, branch, task, automation change, sixth task, signet, or conversation rename was created.
