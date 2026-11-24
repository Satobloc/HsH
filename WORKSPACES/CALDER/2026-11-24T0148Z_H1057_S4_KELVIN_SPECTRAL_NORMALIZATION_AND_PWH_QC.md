# H1057:S4 — Kelvin spectral normalization, sampling grid, and PWH cross-lane QC

**Nominal slot:** 2026-11-24 01:48Z (2026-11-23 20:48 EST)  
**Run key:** REVROT3-19-20261011:1057:s4  
**Host run:** bb170595-1a94-8332-b1cd-e5757f0f9a15; last observed IN_PROGRESS, started 01:55:48.231907Z  
**Deterministic routing:** h=1057; seq=5289; 5289 mod 19=7; Calder, index 7. Next ring label: Hale, index 8, next sequence 5290 / h1058:s0.  
**Identity:** routing label only. No authenticated Calder thread, historical-instance participation, or cross-thread delivery is claimed.

## 1. Historical authority and preflight

The historical Calder evidence is the 2026-09-12 entry in Common CHECKINS, blob 886069e71d4aec7a3f8d199d6d889b930a05c17, lines 53–106. It is a worker-authored self-report, not a signed Nathan-authored specialist charter. It describes adversarial empirical checks, angle-clustering/null design, independent-unit discipline, and negative controls. The current Calder BOOT also distinguishes this empirical/statistical reconstruction from the separate Foundational Covariance / Global Architecture Calder thread. No authenticated current empirical-Calder thread was found.

Live control sources were read, including BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation V3/V4, thread-first rule, scheduler authority, current workflow orientation, and worker autonomy/handoff protocol.

Source identities at preflight:
- HsH main: 08ec0e19043209e562974f2e14d7576902d09f74, committed 2026-11-24 01:53:48Z; BEDROCK blob 2629ab29a5838d933c31727455553d206577a258.
- SAT archive main: 028862e6f1b0ffad2f56f4989a2cd0a769d266fd.
- HSH_RESOURCES main: 0c0f6c3e56042c664cc53d0b70630fa62e9b7dbd.
- Steering Charter blob: 9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89.
- Three Paper Campaign blob: 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4.
- Three-repository onboarding blob: fe40260cda5ce360909f2adfd64a3cc3e2c92a05.
- Revival Rotation V3 blob: 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14.
- Revival Rotation V4 blob: 6761337dfcd0847226ee7baad84db0a9c496760a.
- Thread-first rule blob: e79707587914edb76afca1c32f9f4dad4d0324b7.
- Scheduler authority blob: 9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45.
- Current workflow orientation blob: bd37743d5a70e14a74db64a5fde7a6d9d13f368a.
- Worker autonomy/handoff protocol blob: 812f2f2ffe1ebe6642e780d1591e7b6bab561f0a.

HsH and SAT archive root READMEs were read. HSH_RESOURCES root README was read; no private/internal resource payload was opened or used. No direct Mersearch action is available in the current tool registry. The four canonical Mersearch request files remain status=requested. Lane 2 has a compact three-root receipt but is not released; lanes 1, 3, and 4 have no request-scoped manifest/receipt at their current request IDs. No lane was overwritten and no new request was submitted. GitHub code search was used only as a bounded fallback; it is not represented as a Mersearch run or exhaustive search.

Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, current Lean PR #2458, and available SciSpace/Wolfram connectors were checked. No new tool, fork, branch, dependency, subscription, or expenditure was introduced.

## 2. New source-level result: the spectral-density unit is under-specified

Primary measured-system source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” Nature Physics 22, 409–414 (2026), DOI 10.1038/s41567-026-03175-w. The inspected author-hosted version-of-record PDF is linked from the DOI and at https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf.

Methods lines 235–237 report:
- axial measurement window L=12.5 cm;
- typical acquisition T=30 s at 300 fps;
- optical sampling 60 μm/px;
- contour width 0.5 mm;
- typical core-radius/position uncertainty about 0.1 mm;
- spectral definition S_X(ω,k)=|X̃(ω,k)|²/(L T), with reported units m³ s⁻¹;
- X̃ described as the two-dimensional Fourier transform of X(z,t).

The main Methods specify the denominator L T but do not state the normalization convention used inside X̃. The earlier h1057:s3 report's wording that the Methods “specify the transform and normalization” should therefore be narrowed: the formula and L T denominator are specified; the transform normalization convention is not explicit in the inspected main Methods. Supplementary information was not retrieved, so this is not a claim that no convention is documented anywhere in the supplement.

Dimensional check:
- If X has units of length [m] and X̃ is the unnormalized continuous transform ∫∫X(z,t)e^{-i(kz-ωt)} dz dt, then [X̃]=m² s.
- Dividing |X̃|² by L T, with [L T]=m s, gives [S_X]=m³ s.
- The reported m³ s⁻¹ is compatible with a time-normalized transform, for example a 1/T factor in X̃, or another explicitly defined convention yielding [X̃]=m².

Therefore the printed formula and unit are not independently reproducible from the inspected Methods until the Fourier-transform normalization is stated. This is an under-specification, not evidence that the reported result is wrong.

## 3. Source-parameter resolution arithmetic

These are calculations from the paper's reported acquisition settings, not raw-data analysis or an independent measurement.

For T=30 s and acquisition rate f_s=300 s⁻¹:
- nominal frames: f_s T = 9,000;
- frequency-bin spacing: Δf=1/T=0.033333 Hz;
- angular-frequency spacing: Δω=2π/T=0.209440 rad s⁻¹;
- Nyquist frequency: f_N=f_s/2=150 Hz, matching the upper extent of the plotted Fig. 3 frequency axis.

For L=0.125 m:
- Δk=2π/L=50.2655 rad m⁻¹;
- Δk/(2π)=1/L=8 m⁻¹;
- this exactly reproduces the paper's stated 8×2π m⁻¹ wavenumber resolution.

A calibration consistency check gives 2,064 px × 60 μm px⁻¹ = 12.384 cm, about 1.16 mm (0.928%) below the stated 12.5 cm axial window. Given the paper's approximate spatial calibration and measurement-window description, this is a small rounding/calibration difference, not a demonstrated defect.

The Methods also describe 1,000 discrete z values over 2.5 cm for the separate PDF acquisitions. If those points are uniformly spaced, the nominal grid step is about 25.0 μm, or 0.417 of a 60 μm pixel. The reported 0.1 mm measurement uncertainty is about 1.67 pixels; the 0.5 mm contour width is about 8.33 pixels. The 1,000 z values must not be counted as 1,000 independent spatial observations merely from their nominal count. Subpixel interpolation/resampling, contour width, and adjacent-frame dependence imply correlated observations; effective spatial/temporal sample size requires the raw processing and covariance information.

The PDF acquisitions are separate: 10 min at 100 fps for a(z,t), and 3 min at 360 fps for η(z,t), each sampled at 1,000 z values over 2.5 cm and concatenated into its own temporal file. They do not form a shared frame-level time series. PIV is another separate acquisition (6,000 fps for 0.1 s; 37×23 grid; 2.7 mm spatial resolution; reported circulation uncertainty about 0.005 m² s⁻¹). PTV provides v_z with reported uncertainty about 0.05 m s⁻¹.

No effective sample size, confidence interval, spectral uncertainty, cross-spectral covariance, or raw-data statistic was calculated because the Figshare dataset files, version, checksums, sample identifiers, and joint covariance were not retrieved. The data DOI is 10.6084/m9.figshare.30903347.

## 4. Fit versus prediction

The paper's Methods state that a₀=⟨a(z)⟩ is measured, while Γ and v_z are fitted to the dispersion relation in equation (2), then checked a posteriori against the PIV/PTV measurements. This is a fit plus an a-posteriori consistency check, not a blind prediction from independently frozen parameters. The fitted values are not re-labelled as independent predictions here.

## 5. Lean boundary and exact-head correction

Aldus h1057:s3's existing assistant-level PR #2458 now has a successful replacement exact-head run:
- current PR head: 38253869412e76752f2162f1525ec1a3bd99f890;
- Actions run: https://github.com/Satobloc/HsH/actions/runs/45307876478;
- job 138156041423: completed SUCCESS;
- exact PR-head checkout assertion: SUCCESS;
- Lake dependency-manifest generation: SUCCESS;
- Lean library compilation: SUCCESS;
- toolchain file: Lean 4.34.0.

This supersedes the earlier SUBMITTED_NOT_VERIFIED state in issue #2462 comment 7119504443. PR #2458 remains OPEN / DRAFT / UNMERGED, with no independent formal review.

The existing module contains the covariance-pushforward composition theorem and three spectral-power identities: addition with cross-term, quadratic scaling, and quarter-turn phase invariance. The source uses a generic real normalization argument; it does not encode positive L,T, the Fourier-transform normalization convention, windowing, sampling, the physical dispersion relation, or finite-sample uncertainty. The successful build verifies only those formalized algebraic statements. The source contains theorem-specific #print axioms commands, but their actual output was not retrieved in this QC pass; no theorem-specific axiom result or global axiom audit is claimed. Tests, lint, leanchecker, and nanoda were not established.

## 6. PWH and cross-lane status

Aster h1056:s4 recorded the five-product threshold since the latest completed deep review, Meridian h1055:s3:
1. Mercer h1055:s4;
2. Ravel h1056:s0;
3. Sable h1056:s2;
4. Loom h1056:s3;
5. Aster h1056:s4.

The next PWH deep review is therefore due. The central PWH queue still points to Elias h1054:s2, and Tern CURRENT_WORK remains at h1055. Tern retains queue/task-graph authority. Aster's optional repository-only packet targeting Tern h1058:s4 is already present in Tern INBOX. No duplicate packet, queue edit, or ownership change was made; no consumption or acknowledgment is claimed.

P0 Code Grurple remains ACTIVE / RECORD SAFETY FAIL. The latest main commit-level discovery refresh was current at the preflight main commit, but its 31.6 MB generated payload was not parsed in this activation; no live route acceptance is claimed. PR #2009 remains open/draft/unmerged. The previous exact-head local 5/5 test replay is not CI or full-suite acceptance.

Campaign protection:
- P1 November 9 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30: HOLD.
- P3 December 14: INCOMPLETE.
- FIE: last full review November 20; next December 4.

No human-subject session, model trial, raw physical dataset analysis, new Lean module, new physical prediction, SAT-O/Blockwave equation correction, or theory promotion occurred.

## 7. Scheduler and continuity

The :48 Review automation remains enabled with its original task ID 6aa6c3bc02b48191b8a91a30d2a155e0, DTSTART 2026-10-01 14:48 America/New_York, hourly recurrence, and Review phase. The :00, :24, and :36 tasks remain enabled; :12 remains disabled. No task, ID, prompt, schedule, phase, ownership, or enabled state changed. No sixth task was created.

The current host run was still IN_PROGRESS at the last peek, with chat_ref=null. The cached latest result belonged to Aster h1056:s4, not this Calder run. No current-thread identity or cross-thread delivery is claimed.

**Disposition:** SOURCE-GROUNDED STATISTICAL QC / UNIT-CONVENTION UNDER-SPECIFIED / RESOLUTION ARITHMETIC MATCHES REPORTED Δk / 1000-POINT SPATIAL GRID NOT INDEPENDENT BY COUNT ALONE / FIT-VS-PREDICTION SEPARATED / EXACT-HEAD LEAN BUILD PASS / AXIOM OUTPUT NOT RETRIEVED / PWH DEEP REVIEW DUE TERN-OWNED / ORSON P1 PROTECTED / FOUR RELAYS PRESERVED / NO SIXTH TASK / NO THEORY PROMOTION.


## Amendment 01 — 2026-11-24T0206Z — actual Lean job log retrieved

The GitHub job log for PR #2458 Actions run #45307876478, job 138156041423, was subsequently retrieved and inspected (766 log lines). This supersedes the earlier statement in section 5 that theorem-specific axiom output was not retrieved.

The log reports “Build completed successfully (8949 jobs).” The exact-head checkout assertion, Lake dependency-manifest generation, and Lean library compilation succeeded on head 38253869412e76752f2162f1525ec1a3bd99f890.

The three target spectral theorem outputs are:
- spectralPower_addition_identity: [propext, Classical.choice, Quot.sound].
- spectralPower_scale_identity: [propext, Classical.choice, Quot.sound].
- spectralPower_phaseQuarterTurn_invariant: [propext, Classical.choice, Quot.sound].

No sorryAx appears in these three target-theorem axiom outputs. This is a theorem-specific result, not a global axiom audit. The workflow's nanoda step and separate axiom-audit step were explicitly skipped. No global claim about all declarations in the repository is made.

The correction does not change the physical boundary: the formalized identities operate on a complex amplitude pair and generic real normalization. They do not encode the paper's Fourier-transform convention, L/T positivity, finite-record estimator, windowing, sample covariance, or physical dispersion relation.
