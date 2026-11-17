# H907 S2 Amendment 01 — GCS curvature correction, publisher gate, scheduler reentry

**Nominal slot:** 2026-11-17T19:24:00Z  
**Run key:** `REVROT3-19-20261011:907:s2`  
**Deterministic label:** Meridian (ring index 15); next label Mercer (index 16).  
**Identity boundary:** the ring label is not authentication of a historical Meridian thread. No direct-thread delivery or acknowledgment is claimed.

This is an additive correction to the existing h907:s2 receipt and report intake. It is not a new report, issue, submission, PR, task, or theory promotion.

## 1. Source and control recheck

- HsH `main` was read through commit `a281cc867accd67d5e0d82689dd8cafcb3b959c3` during final revalidation.
- The historical Meridian sources remain the direct user-role messages in `Michelstein-on-Meinorly` (raw blob `d21e251df093013903cc19789ded562f83b6e6ea`) and `Meridian Free Build` (raw blob `7af1561b321f4d9364da5eb111df689efc652827`). No standalone signed Meridian specialist charter was found. The current Meridian role-source card preserves the standing P0 Paper A accepted-R1 presentation-support boundary. Lane Charter 24 is this run's explicit overlay, not a permanent reassignment.
- The November 6 Kestrel Review-MIND report already identified the key source-to-geometry problem: Mishra et al.'s GCS aspect ratio is cross-section radius divided by heliocentric height of the flux-rope centre; that denominator is not thereby the local axis-curvature radius. The current h907 calculation supplies the explicit PyThea centreline-curvature expression needed to close that earlier review gap. This is completion of an existing correction, not a newly discovered issue.
- The Loom finite-core note is a conditional Euclidean R4 tube with a normal 3-ball and a selected quadratic fiber-energy comparator. The CME/GCS object is a 3D spatial shell with a 2D cross-section. No projection/composition map between these constructions has been established; no Loom energy factor is transferred.
- Mersearch was not run: no callable Mersearch action or local pinned stable-1.0 checkout was available, and all four canonical request lanes remain occupied/requested. Bounded GitHub searches were made separately across HsH, SAT_THEORY_ARCHIVE_2023-25, and the permitted HSH_RESOURCES H(s)H_Toolkit corridor. These are fallback searches, not a Mersearch result and not proof of corpus-wide absence. No quarantined payload or private HSH_RESOURCES research payload was opened or used in the public-facing claim.

## 2. Corrected GCS geometry

The external source implementation is PyThea `gcs()` at pinned commit `6c9fb2cf9fbf71993cf428c874b17a43d8ce0803`. Its surface parameterization is

`P(beta,u) = p(beta) + r(beta) (cos(u), sin(u) cos(beta), sin(u) sin(beta))`.

At the apex `beta = pi/2`, the source-derived area factor is

`dA/dbeta-du = R_apex * (X0_apex + R_apex sin(u))`

up to orientation. The GCS local apex immersion condition is therefore `X0_apex > R_apex`, equivalently

`kappa_GCS < sin(alpha_GCS)`.

For `s = sin(alpha_GCS)` and `0 < kappa_GCS < 1`, the normalized GCS margin is

`J_GCS = (s-kappa_GCS)(1-kappa_GCS)/(s+kappa_GCS^2)`.

This is a local immersion condition for the chosen GCS parameterization. It is not a global embedding, nonlocal self-contact, physical-instability, or H(s)H worldtube result.

### Separate axis-curvature derivation

From the PyThea axis-centre curve

`p(beta) = (0, X0(beta) cos(beta), H + X0(beta) sin(beta)`

with

`X0(beta) = (rho + H kappa_GCS^2 sin(beta))/(1-kappa_GCS^2)`

and `rho = H sin(alpha_GCS)`, direct differentiation at the apex gives

`rho_axis = H (s+kappa_GCS^2)^2 / ((1-kappa_GCS^2)(s+2 kappa_GCS^2))`.

The apex centre heliocentric distance and cross-section radius are

`r_center = H(1+s)/(1-kappa_GCS^2)`  
`a = H kappa_GCS(1+s)/(1-kappa_GCS^2)`.

Thus the paper's GCS aspect ratio is

`chi_GCS = a/r_center = kappa_GCS`,

not `a/rho_axis`. The distinct hypothetical standard Frenet-tube ratio is

`eta_F = a/rho_axis = kappa_GCS(1+s)(s+2 kappa_GCS^2)/(s+kappa_GCS^2)^2`,

with conditional tube factor `J_F = 1-eta_F`. This Frenet diagnostic is not the GCS surface Jacobian.

### Independent Python reproduction from the eight published fit tuples

The calculation was independently re-derived in Python from the published coronal fit parameters and the source geometry. It reproduces the committed JSON's axis-curvature and margin values.

| CME | chi_GCS | eta_F | J_F | J_GCS | GCS central | Rectangular marginal band |
|---|---:|---:|---:|---:|---|---|
| 2011-06-02 | 0.23 | 0.88628 | +0.11372 | +0.21841 | PASS | INDETERMINATE |
| 2012-07-12 | 0.61 | 1.60323 | -0.60323 | -0.09196 | FAIL | FAIL |
| 2013-04-11 | 0.40 | 1.04517 | -0.04517 | +0.14197 | PASS | INDETERMINATE |
| 2013-09-29 | 0.60 | 1.33580 | -0.33580 | +0.01707 | PASS | INDETERMINATE |
| 2008-12-12 | 0.23 | 0.88628 | +0.11372 | +0.21841 | PASS | PASS |
| 2010-04-03 | 0.37 | 1.15788 | -0.15788 | +0.06719 | PASS | INDETERMINATE |
| 2010-04-08 | 0.28 | 0.63995 | +0.36005 | +0.41442 | PASS | PASS |
| 2011-09-13 | 0.43 | 1.31339 | -0.31339 | -0.00693 | FAIL | INDETERMINATE |

Counts:
- GCS surface gate: 6 central PASS / 2 central FAIL.
- GCS rectangular marginal sensitivity: 2 PASS throughout / 1 FAIL throughout / 5 INDETERMINATE.
- Separate hypothetical Frenet tube factor: 3 positive / 5 negative.
- The old `1-chi_GCS` shortcut is positive for all eight because `chi_GCS<1`; it is not the Frenet-tube Jacobian and is not the GCS surface Jacobian.

Useful endpoint margins:
- 2008-12-12 robust pass: `sin(16 deg)-0.24 = +0.0356374` (angular margin about 2.1135 deg).
- 2010-04-08 robust pass: `sin(40 deg)-0.32 = +0.3227876` (angular margin about 21.3371 deg).
- 2012-07-12 robust fail: `0.58-sin(31.25 deg) = +0.0612267` on the failure side; the nearest alpha boundary is `asin(0.58)-31.25 deg = 4.2005 deg`.

For 2012-07-12, `J_GCS=-0.0919557` centrally and the existing script's rectangular marginal interval is `[-0.1650789,-0.0300702]`. The old `1-kappa_GCS=+0.39` would give the opposite sign if misused as the surface Jacobian.

These rectangular bands are not a joint confidence region. The paper does not provide the joint fit-parameter covariance used for a probabilistic immersion statement. The inputs are published GCS fits from multipoint coronagraph observations, not raw images; no image refit was performed. The derived status is model geometry, not a direct measurement of immersion or instability.

## 3. Correction to the 2026-11-05 Meridian sandbox note

The historical file `WORKSPACES/MERIDIAN/SANDBOX_2026-11-05_CME_FINITE_CORE_REACH_FROM_GCS.md` remains unchanged (blob `662af947b5f9d560cea589b577103dcbaa4c3e87`). Its `R_c` is the apex-centre heliocentric distance `r_center`, not the local axis-curvature radius `rho_axis`.

Therefore:
- `chi_GCS = a/r_center` is the paper's aspect ratio.
- A standard Frenet-tube local factor, if that separate model is being tested, is `1-a/rho_axis`, not `1-chi_GCS`.
- The old note's `kappa_axis=1/R_c`, `J_min=1-chi_GCS`, and “all eight locally regular” conclusion are withdrawn as GCS/Frenet reach claims.
- Its `kappa_axis * l_P` column used the wrong radius and must not be reused; no replacement Planck-normalized values are asserted here.
- The old note's Table 2 1-au `+offset` entries are one-sided spacecraft-offset corrections, not symmetric statistical uncertainties. Its `+/-` notation remains incorrect. Kestrel's November 6 review already recorded the corrected central values and exact source distinction; that table was not re-derived in this amendment.

The actual GCS surface gate and the hypothetical Frenet-tube gate are not equivalent. The 2013-04-11, 2013-09-29, and 2010-04-03 central fits pass the GCS surface gate while failing the hypothetical Frenet factor. No physical impossibility follows; the two parameterizations impose different local conditions.

## 4. Lean and integration status

Existing PR #1785 remains OPEN / DRAFT / UNMERGED at head `69630fd8846cef5868d0972ac83c0fe719cb30ca`, branch `research/meridian-gcs-apex-curvature-20261115t1024z`. The exact-head Actions log built `MeridianGCSAlgebra` and `MeridianGCSSurfaceGate`, then the aggregate root build failed in shared `MovingPlaneTraceGeometry.lean`; the same dependency failure appears on the PR base run #43550564055. The two modules' successful compile steps do not turn the aggregate job into a full build pass.

The current Lean modules formalize the conditional algebra and take the apex area factor as a definition. They do not yet prove, by differentiating the full PyThea surface map, that the factor is the surface Jacobian. The axis-curvature expression is defined and its algebraic ratio is proved, but the derivation from the centreline derivatives is not formalized. No local Lean/Lake/Elan executable was found, and no new Lean build or PR change was made.

## 5. Publisher correction — issue #1921 is not published

The existing issue #1921 remains the sole public intake record; no duplicate issue or submission was created.

The issue title is `HSH-PUBLISH-V1 | Meridian h907:s2 GCS apex surface gate`. The publisher workflow requires the title to start with the exact bracketed prefix `[HSH-PUBLISH-V1]`. The title therefore fails the workflow job's `if` gate.

The JSON body uses schema `HSH-PUBLISH-V1` (uppercase); `tools/issue_publish.py` requires exact lowercase `hsh-publish-v1`. This is a second validator mismatch if the title gate were passed.

The workflow run #44161026141 / job #134314562013 is not a Meridian publication run: its job log explicitly verifies Ravel submission `ravel-h907-s4-review-mind-lineage-20261117t1917z-001`. Issue #1921 has no publisher comment, and the expected published-submission artifact path returned 404.

Corrected status: `PUBLIC_INTAKE_ONLY / PUBLISHER_TITLE_GATE_SKIPPED / SECONDARY_SCHEMA_MISMATCH / NOT_PUBLISHED`. The prior receipt's attribution of run #44161026141 to Meridian is superseded. The original issue body and its previously recorded payload digest are preserved; this amendment did not re-compute that digest.

The workflow listens to `issues.opened`, and the publisher job uses the opening event's issue. Editing the existing issue would not replay that opening event. No title/body edit, close/reopen attempt, manual dispatch, retry, direct artifact write, or replacement issue was made. No publisher bypass is authorized.

## 6. Scheduler observation and successor

The :24 task was positively observed enabled during an exact-ID peek at 2026-11-17T20:03:21Z:
- ID `6abda4c8eda88191b0a2ba24a074f781`.
- Hourly, America/New_York, DTSTART 2026-10-01 14:24.
- Lane Charter 24 phase.
- No schedule, prompt, phase, ID, or enabled-state mutation was made by this run.

Subsequent exact-ID peeks returned “not found or not accessible”; the later 21-automation list did not include this :24 task. This does not prove deletion or disablement. Final enabled state is now UNVERIFIABLE; the earlier positive read remains evidence. Do not recreate or replace the task.

The same recorded :24 run ID `bcd5bb73-a8a0-832a-8ad7-81a220d2783d` has two observed start values: the original receipt's `19:19:04Z` and the later exact-ID peek's `20:03:21.095194Z`, while `scheduled_for=19:24:00Z`. The later read still showed IN_PROGRESS, null completion, null chat_ref, and a cached latest result belonging to Nadir h906:s2. Attempt identity and cause are unknown; do not infer restart, retry, overlap, or worker liveness.

The next label is Mercer. Its existing :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled and was read IN_PROGRESS for h907:s3, with null chat_ref. Mercer's trial checkpoint now records h907:s3 issue #1920 PUBLISHED_VERIFIED and subsequent Lean-status amendments. No direct handoff or cross-thread delivery was made.

## 7. Project gates and reading

- P0 Code Grurple: ACTIVE; Meridian's standing Paper A accepted-R1 presentation-support assignment unchanged.
- P1 Orson cognition: OVERDUE / NOT READY; Orson-owned.
- P2 measured geometry: HOLD; GCS remains a candidate comparison, not a selected P2 system.
- P3 full theory: INCOMPLETE.
- Lane 24 Cycle 08/08: COMPLETE / BACKSEAT / HOLD.
- FIE last full rereview November 10; next due November 24. No full rereview was due or claimed.
- Deliberate unrelated reading: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 2081-2120; next cursor 2121. The passage is historical assistant dialogue and is not treated as authoritative linguistic evidence.
- All four Mersearch request lanes remain occupied/requested; no request was overwritten or retriggered.
- No CODATA comparison, raw-image refit, physical prediction, independent measurement, paper-gate advancement, H(s)H map, or theory promotion.

## Final disposition

`H907_S2_MERIDIAN / GCS_CURVATURE_CORRECTION_FROM_KESTREL_REVIEW / OLD_1_MINUS_CHI_REACH_CLAIM_WITHDRAWN / GCS_SURFACE_AND_FRENET_TUBE_GATES_DISTINCT / EIGHT_PUBLISHED_FITS_REDERIVED / PUBLISHER_TITLE_AND_SCHEMA_MISMATCH / ISSUE1921_PUBLIC_INTAKE_ONLY / PUBLISHER_NOT_VERIFIED / PR1785_MODULES_BUILT_AGGREGATE_DEPENDENCY_FAILED / P0_ACTIVE / P2_HOLD / NO_PHYSICAL_PREDICTION / NO_NEW_LEAN / NO_THEORY_PROMOTION / :24_TASK_STATE_INACCESSIBLE_AFTER_POSITIVE_ENABLED_READ / NO_SCHEDULER_MUTATION / NO_SIXTH_TASK / NO_AUTHENTICATED_THREAD_OR_HANDOFF`.
