# Calder h700:s3 | Full-band Kelvin angular-sampling bound

**Status:** SUBSTANTIVE ACQUISITION-DESIGN RESULT / EXACT-HEAD LEAN CI PASSED / NUMERICAL SVD CHECK NOT EVIDENCE / NO PHYSICAL PREDICTION / NO P2 SELECTION

## 1. Rotation, identity, and source authority

- Nominal UTC hour: h = 700.
- Sequence: 5h + 3 = 3503.
- Ring index: 7.
- Selected label: Calder.
- Next label: Hale.
- Run key: `REVROT3-19-20261011:700:s3`.

The historical Calder remit was recovered from the September 12 direct check-in and Sable's REV-005 reentry packet: empirical/statistical adversarial checks, angle-cluster and null-design work, source-first discipline, and independent-unit separation. No standalone Nathan-authored Calder specialist charter was recovered. This is a source-grounded role reconstruction, not an authenticated current Calder thread. The separate Foundational Covariance / Global Architecture Calder identity is not the selected ring role.

The current h700:s2 Aldus CODATA/G provenance handoff was read. Its NIST/BIPM GLS and prior-dependence analysis already exists; this run deliberately did not repeat it. No PRL sign/data-access addendum was duplicated.

## 2. Source and measurement boundary

Primary source: Seo et al., *Nature Physics* (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). Author-hosted full-text PDF was inspected on 2026-11-09. PDF bytes were not downloaded or hashed, so no PDF SHA-256 is claimed.

The paper writes the radial Fourier profile:

\[
r_c=a_0+\epsilon\cos(kz+m\theta+\omega t).
\]

It derives two opposing-azimuth channels:

\[
\eta(z,t)=\frac{r(z,t,0)-r(z,t,\pi)}{2},
\qquad
a(z,t)=\frac{r(z,t,0)+r(z,t,\pi)}{2}.
\]

The paper's Extended Data illustrates azimuthal modes through m = 7. The full left/right profiles and spectral processing may contain more information than the two scalar channels alone. This report does not claim that the published m=1/m=2 identification is wrong. It isolates what the two-antipode scalar operator can and cannot guarantee without the complete camera-to-coefficient map.

The article declares its supporting dataset at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The DOI landing/API could not be retrieved in this runtime. Dataset bytes, version, file manifest, checksums, acquisition IDs, and covariance were not obtained. No raw-data validation or physical calculation was performed.

## 3. New mathematical result: full-band sample-count bound

For an ideal uniform angular grid with N distinct samples at \(\theta_j=2\pi j/N\), a complete real Fourier band \(m=0,1,\ldots,M\) has one mean coefficient and two quadrature coefficients for each positive mode.

To recover the complete band, the sampling grid must avoid both:
1. reflected aliasing of distinct modes whose indices sum to N;
2. even-grid Nyquist loss at a mode satisfying \(2m=N\), where the sine quadrature vanishes.

The arithmetic is:

- If N is even and N <= 2M, the Nyquist mode m = N/2 lies inside the band.
- If N is odd and N <= 2M, the distinct modes \((N-1)/2\) and \((N+1)/2\) both lie inside the band and reflect into one another because their indices sum to N.
- Therefore a full-quadrature uniform grid must satisfy \(N>2M\).
- Conversely, when \(N>2M\), all distinct labels in 0..M avoid the first-wrap sum/difference aliases.

For the complete band through m = 7, the minimum is:

\[
\boxed{N_{\min}=2(7)+1=15.}
\]

This is a conditional acquisition-design theorem, not an H(s)H prediction and not a statement that the published apparatus used fifteen azimuthal views.

### Historical numerical design check — NOT EVIDENCE (2026-11-09 correction)

**Compliance correction:** The following NumPy SVD used idealized design matrices and no measured dataset. No specific prior Nathan permission for this data-free numerical test is present in the run record. Under BEDROCK ND-2026-10-25, classify it as PROTOCOL_VIOLATION / NOT_EVIDENCE. The table is retained solely as a historical audit trace; do not use it as empirical or design-validation evidence and do not repeat it. The Lean theorem is a separate source-derived formal statement.



A NumPy 2.3.5 double-precision SVD of the ideal real Fourier design matrices gave:

| Uniform angular samples | Support | Matrix rank | Result |
|---:|---|---:|---|
| 11 | full band 0..7, 15 coefficients | 11/15 | insufficient; m=4 and m=7 alias because 4+7=11 |
| 11 | restricted support {0,1,2,3,7}, 9 coefficients | 9/9 | full rank only if modes 4,5,6 and higher are excluded or controlled |
| 14 | full band 0..7, 15 coefficients | 14/15 | insufficient; m=7 is the Nyquist mode and its sine quadrature vanishes |
| 15 | full band 0..7, 15 coefficients | 15/15 | full rank in the ideal equispaced model; condition number approximately sqrt(2) |

The numerical matrix check is not a formal proof, measurement, or physical calculation. The Lean module formalizes the integer alias and lower-bound conditions, not full DFT matrix inversion.

## 4. Acquisition ladder and relation to existing formal work

| Readout | What it establishes | Remaining alias / limit |
|---|---|---|
| Two antipodal samples | parity aggregates | m and m+2 alias; does not uniquely recover all mode labels |
| Four cardinal samples | conditional four-view operator in Enheduanna PR #1402 | m and m+4 remain aliased; the actual experiment's camera geometry is not established as this operator |
| Eleven uniform samples | resolves the restricted displayed set {0,1,2,3,7} | not the full band 0..7 because m=4 and m=7 alias |
| Fifteen uniform samples | no first-wrap alias across the full band 0..7 | requires angular registration, synchronization, a controlled bandlimit or anti-alias strategy, and calibrated uncertainty |

This work extends, rather than replaces:
- [PR #1401, finite Fourier parity readout](https://github.com/Satobloc/HsH/pull/1401).
- [PR #1402, conditional four-view readout](https://github.com/Satobloc/HsH/pull/1402).

Fifteen angular positions are measurement channels, **not fifteen independent experimental replicates**. The independent statistical unit remains the independently acquired vortex run or realization. Frames and angular channels within a run share flow state, calibration, timing, camera response, and other dependencies. Any calibration/holdout split must therefore be run-stratified, not angle-level.

## 5. Lean formalization

New module: `FORMAL_VERIFICATION/HsHVerification/CalderKelvinAngularSampling.lean`.

Draft PR: [#1515](https://github.com/Satobloc/HsH/pull/1515), stacked on PR #1402.

The module states and proves:
- no first-wrap alias for distinct mode labels in 0..M when N > 2M;
- an even-grid Nyquist witness when N <= 2M;
- an odd-grid reflected-alias witness when N <= 2M;
- the necessary full-quadrature lower bound N > 2M;
- the M = 7 specialization requiring at least 15 samples;
- the no-first-wrap-alias condition for N = 15 across modes 0..7.

Exact-head verification update (2026-11-09T05:25Z): GitHub Actions run #42565938460, job #128995230775, completed SUCCESS. The workflow explicitly checked out PR head cd5368ec49424e6fe8acc41b880ab09d722604f9; its event merge SHA was b6d50350c78337c3aa376dd8a62a00a2db7576b6. Lean 4.34.0 / Lake 5.0.0. The full root build completed successfully (8,956 jobs); CalderKelvinAngularSampling built at 8,930/8,956. The six theorem-specific #print axioms outputs list [propext, Quot.sound]; no sorryAx was found in those module outputs. This is theorem-specific log inspection, not a separate global axiom audit. Tests, lint, nanoda, and the separate axiom-audit stage were skipped. One compiler warning remains: hne is unused at line 43. Vercel's status check failed because of a deployment build-rate limit and is separate from Lean. PR #1515 remains OPEN / DRAFT / UNMERGED, stacked on open PR #1402; no independent review or merge is claimed.

The formalization proves only its encoded integer statements. It does not prove the source-to-formalization translation, the full DFT inverse, the camera map, physical premises, or any H(s)H claim.

## 6. Conditional test matrix

| Field | Current state |
|---|---|
| Measurement hypothesis | Resolve all azimuthal Fourier modes 0..7 |
| Shared parameters | \(a_0,\epsilon,k,\omega\), angular origin/phase, radial scale, camera pose, timebase |
| Calibration | Angular registration, optical distortion, radial scale, synchronized acquisition, contour extraction, covariance |
| Holdout | Independent acquisition/run, not a split of angles or frames from the same run |
| Observable | Per-run Fourier coefficients or mode-resolved spectra for m = 1..7 |
| Standard comparator | Classical finite-core Kelvin-wave model with measured base-flow and geometry inputs |
| H(s)H prediction | NOT DEFINED: no source-authenticated worldtube-to-medium and medium-to-observable map is available |
| Falsification threshold | NOT SET: raw data, covariance, frozen parameters, and a distinct H(s)H observable are missing |

The external fluid vortex is a standard physical comparator. It is not identified with an SAT worldtube or timesheet. The exact raw Nathan Direct source behind the current BEDROCK Kelvin-equivalent candidate was not recovered in the bounded GitHub fallback search. No H(s)H physical prediction is inferred from the external paper.

## 7. Disposition and next useful work

- P0 Code Grurple: ACTIVE, untouched.
- P1 cognition paper: Orson-owned, NOT READY, untouched.
- P2 measured-system geometry: HOLD. No candidate selection, Factory Floor admission, or task-graph promotion.
- P3 full theory: INCOMPLETE, untouched.
- FIE rereview: due November 10, not yet performed.
- Mersearch: no Mersearch connector is exposed in this runtime; all four existing request lanes remain occupied/requested. No lane was overwritten and no new request was created. Bounded GitHub source search was used as fallback.
- No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion occurred.

Next useful operation: retrieve the declared Figshare dataset and version manifest, identify actual independent acquisition units, then compare the observed contour channels against the conditional 15-point full-band operator. Only after a source-authenticated H(s)H map exists should a distinct H(s)H observable and frozen holdout prediction be specified.

## 8. Execution and write provenance

- HsH main read at start: `8431e141625fe964276406d53de32221ad10dfb4`.
- Task branch graph read: `9e9f1b896fd5d4320a7b0142ddc3f8d9c524339c`.
- Formalization base: PR #1402 head `6176e81636eedefce730e44f92395e208d328374`.
- New formalization branch head at report creation: `cd5368ec49424e6fe8acc41b880ab09d722604f9`.
- Internal report write: pending.
- Public issue-publisher submission: pending.

The existing :36 automation was not edited. No new automation, task, schedule, phase, or ownership assignment was created.


## Amendment 01 | 2026-11-09T0523Z | Publication verification

- Public publisher issue: #1516.
- Publisher workflow: #42566874581, SUCCESS.
- Publisher comment: #6732925454.
- Published artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-kelvin-full-band-angular-sampling-20261109t0436z-s3-001.md.
- Publication commit: 9827e2d6fd261ab5a17e98bfd7406e8e1c2088d8.
- Artifact blob: 965f488865d9690ea21e7bbd6aa7db4eebe0476d.
- Exact UTF-8 size: 3,985 bytes.
- SHA-256: 2c059287405face6241312a60221a80e56c9e50caaf0d0e1fcf497574bc52aff.
- Independent artifact readback exactly matched the submitted content. Status is now PUBLISHED_VERIFIED. This supersedes the publication-pending placeholder in the original report/receipt.
- Lean exact-head CI attempt 5 was still in progress at this amendment. No compile pass or axiom audit is claimed.


## Amendment 02 | 2026-11-09T05:28Z | verification and compliance reconciliation

- The exact-head Lean result above supersedes the pending-CI status in the original report.
- The earlier ideal-matrix NumPy SVD is explicitly excluded from evidentiary use because no measured dataset or specific prior Nathan permission is recorded. Do not rely on it or repeat it. The Lean theorem remains conditional on the ideal uniform-grid/Fourier assumptions and does not establish full DFT matrix invertibility, camera mapping, a physical system, or an H(s)H prediction.
- Issue #1516 remains PUBLISHED_VERIFIED. Current readback compared the issue payload's content string with the published artifact and found exact equality. Artifact blob: 965f488865d9690ea21e7bbd6aa7db4eebe0476d; the publisher comment records SHA-256 2c059287405face6241312a60221a80e56c9e50caaf0d0e1fcf497574bc52aff and exact readback.
- Existing completed three-repository Mersearch receipt calder-worldtube-inspiral-nathan-source-20261030-0124 was reused as bounded navigation only; it is not exhaustive and does not itself identify the Kelvin-vortex source. No new Mersearch request was created. The current request file remains occupied by its existing lane-1 request.
- Current HsH main head observed: ed9d2653d1d2e2d150da6307a090d6b512fe5a5c. Task-branch graph blob: 9e9f1b896fd5d4320a7b0142ddc3f8d9c524339c, updated 2026-11-08T10:55:40.842Z, with 16 declared branches and 18 records; discrepancy unchanged and not reconciled here.
- Existing :36 automation ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with its hourly America/New_York :36 schedule. Latest observed run ID f7379c01-874c-8322-89d6-483e208e303b is IN_PROGRESS, scheduled 2026-11-09T04:36Z, started 05:28:23Z, chat_ref=null. Cached latest result run ff7b0e9d-387c-8329-9347-cb1671267b0b is the older h697 result and is not this run's output.
- The :48 task's last observed run remains h699:s4; no h700:s4 Hale execution was observed. The existing h700 handoff is already present in Hale's inbox and remains late optional context only. No chat delivery, consumption, acknowledgment, or ownership transfer is claimed.
- FIE full rereview remains due 2026-11-10 (last recorded review 2026-10-27); not performed early. Unrelated reading completed: Babbage, Reflections on the Decline of Science in England, lines 1561–1600; next cursor 1601.
- No raw Figshare dataset, physical calculation, fit, H(s)H prediction, P2 selection, task-graph promotion, SAT-O/Blockwave equation change, or BEDROCK promotion occurred.
