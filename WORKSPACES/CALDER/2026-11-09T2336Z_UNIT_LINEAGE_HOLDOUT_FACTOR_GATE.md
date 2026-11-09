# Calder h719:s3 — Acquisition-unit holdout factorization for Kelvin-wave observables

**Run key:** `REVROT3-19-20261011:719:s3`  
**Nominal slot:** 2026-11-09 23:36 UTC  
**Actual invocation observed:** 2026-11-09 23:29:14 UTC  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8)  
**Disposition:** substantive architecture improvement implemented in existing PR #1515; first Lean build passed on the pre-cleanup head; exact current-head build pending at receipt creation. No physical calculation or H(s)H prediction.

## 1. Identity and historical remit

The fixed ring arithmetic gives h=719, seq=3598, index 7, Calder; next is Hale. Selection is deterministic routing, not authenticated instance/thread identity.

The repository search found no standalone Nathan-authored Calder specialist charter and no authenticated current Calder conversation. The only recovered role description is the 2026-09-12 historical check-in/self-report in `WORKSPACES/COMMON/CHECKINS.md`, describing empirical angle-clustering, adversarial null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. This is not promoted into a signed charter. The assistant-authored `REV-005-CALDER-REENTRY.md` points to a different Calder identity and was not treated as authentication or substituted as authority.

No cross-thread message, revival, participation, or identity continuity is claimed.

## 2. Source-first physical measurement context

Primary source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics*, DOI `10.1038/s41567-026-03175-w`. The original article PDF was read at the ENS-hosted source mirror. Data availability points to Figshare DOI `10.6084/m9.figshare.30903347`.

Source-reported setup and uncertainty:
- A controlled classical air-water bathtub vortex, approximately 40 cm high, with a finite air core whose radius varies axially.
- The air-water interface is imaged normal to the vortex axis; left/right contours yield core radius `a(z,t)` and horizontal displacement `η(z,t)`.
- Two lenses provide complementary views; the paper also describes two orthogonal cameras for the m=1 mode.
- Typical contour-video acquisition is 300 fps for 30 s. Horizontal/vertical image resolution is 60 μm/px; contour width is 0.5 mm; typical core-radius/position uncertainty is about 0.1 mm.
- PIV circulation uncertainty is about 0.005 m² s⁻¹; PTV vertical-velocity uncertainty is about 0.05 m s⁻¹.
- For probability-density analysis, `a(z,t)` or `η(z,t)` is recorded for 10 min at 100 fps or 3 min at 360 fps, sliced into 1,000 discrete z-values over 2.5 cm, and concatenated into one temporal file.
- The article says `a₀`, `Γ`, and `v_z` are measured for each run.

**Important source-derived sampling implication:** the 1,000 z-slices are derived channels from a recording, not 1,000 independent experimental replicates. Frames, spatial slices, camera views, and derived spectra must inherit their parent acquisition/run identifier. The run/realization is a candidate parent unit, but actual independence and grouping must be confirmed from the data-package manifest and acquisition metadata. No raw Figshare bytes or manifest were downloaded or checksum-verified.

The standard comparator is the paper's classical Rankine-core Kelvin-wave dispersion relation (equation 2). Its Methods say the analysis uses measured `a₀`, fits `(Γ,v_z)` to the dispersion data, then checks those fitted values a posteriori against PIV/PTV measurements. That is a fit/consistency comparison, not a pre-registered independent holdout.

## 3. New architecture result: provenance-preserving holdout

The geometry-to-observable projection and the statistical acquisition-unit map are distinct typed maps:

`geometry → measurement channels`  
`channel → declared acquisition unit`  
`channel → calibration/holdout fold`

The new rule is that the channel-level fold assignment must factor through the declared acquisition-unit map. All channels derived from one acquisition unit stay in one fold. Coarse-graining, extra angular positions, frames, pixels, z-slices, or spectral summaries cannot manufacture additional independent experimental units.

This is an information/provenance refinement to the geometry pipeline, not a claim that statistical independence follows from geometry. The declared unit map is supplied from acquisition provenance; the theorem checks only that fold assignment respects that map.

### Lean formalization

Added `FORMAL_VERIFICATION/HsHVerification/CalderUnitLineageHoldout.lean` and imported it into the existing root aggregator on the existing PR #1515 branch.

The module proves:
1. `unitFold_factorization_iff_unitConsistency`: for a surjective channel-to-acquisition-unit map, a unit-level fold function exists exactly when the channel fold is constant on every unit-map fiber.
2. `fold_conflict_witness`: failure of unit consistency yields two channels from the same declared unit assigned to different folds.
3. `unitFold_unique`: the induced unit-level fold function is unique when every declared unit is represented.

The current PR branch head at receipt creation is `4cfb6803b641ad16cfe0918680f22fa54559e29a`. PR #1515 remains OPEN / DRAFT / UNMERGED and stacked on PR #1402.

**Verification status at receipt creation:**
- Earlier exact-head run #42722289453 succeeded on predecessor head `c613af998c63bd78ab9614a5451938840f528005`, full root build 8,957 jobs, Lean 4.34.0 / Lake 5.0.0. It built the same theorem module and inspected its three `#print axioms` outputs; no `sorryAx` was observed. That head still used the deprecated `push_neg` tactic.
- A warning-only cleanup replaced `push_neg` with `push Not` in commit `4cfb6803b641ad16cfe0918680f22fa54559e29a`.
- New exact-head run #42722996625 was triggered for the cleanup head; checkout identity passed, while the build was still in progress when this receipt was first prepared. Do not treat the earlier run as exact-head verification of the cleanup commit.
- No local `lean` or `lake` executable was installed; the existing repository Actions workflow is the verification route.
- The build workflow does not run tests, lint, nanoda, or a separate global axiom audit. Module-specific axiom output is not a global audit.

Lean checks only the formalized map/factorization statement. It does not authenticate acquisition IDs, prove actual statistical independence, estimate covariance, validate an instrument, or establish a physical model.

## 4. Conditional test matrix and geometric necessity boundary

| Item | Current status |
|---|---|
| Standard hypothesis | Classical Rankine-core Kelvin-wave model, article equation (2) |
| H(s)H hypothesis | No source-committed forward map from H(s)H geometry to `Sη(ω,k)` and `Sa(ω,k)` is yet defined |
| Shared parameters | `a₀`, `Γ`, `v_z`, axial profile, forcing condition, camera/contour calibration |
| Calibration | Predeclare whole acquisition/run units; estimate shared nuisance/calibration parameters only on calibration units |
| Holdout | Entire untouched acquisition/run units, not frames, z-slices, camera channels, or derived spectra from a calibration run |
| Observable | Joint position and radius spectra `Sη(ω,k)` and `Sa(ω,k)`, with PIV/PTV auxiliary measurements |
| Standard comparator | Published Rankine-core dispersion relation with source-reported measurement uncertainties |
| Falsification threshold | A predeclared covariance-aware joint predictive region on untouched units; no numerical threshold until raw data, acquisition IDs, and covariance are available |
| Current H(s)H scoreability | `PREDICTION_NOT_FORMED / UNSCORABLE`; no H(s)H forward map or raw data package |
| P2 disposition | HOLD; this is a real measurement platform and methods candidate, not an admitted H(s)H test |

The measured fluid core radius is a standard hydrodynamic parameter, not automatically H(s)H worldtube thickness. Azimuthal modes m=1 and m=2 are classical Kelvin modes, not the SAT τ twist sectors. The air-water free surface is not automatically an H(s)H contact surface. No timesheet measurement is present. Finite worldtube thickness, twist, contact surfaces, and timesheet curvature remain optional/unmapped for this system until an explicit source-derived projection predicts an observable not already explained by the standard model.

## 5. Existing-tool and source-workflow check

- All four Mersearch request lanes were occupied; no request was overwritten and no new request was created. Existing request metadata/receipts were preserved.
- Existing Math Hopper pilot issue #578 and PR #991 were checked; they do not replace this proof or the current Lean CI path.
- Existing Whirligig sandbox was checked; it remains a separate exploratory instrument, not a physical equivalence or required dependency.
- SciSpace is available in the connected app set but was unnecessary for this source-grounded internal formalization.
- No local Lean/Lake installation, new tool, dependency, fork, paid service, or subscription was added. No new PR was created; existing PR #1515 was extended.
- No SAT-O or Blockwave source equation was quoted, normalized, corrected, or modified. No theory premise was promoted.

## 6. Campaign and continuity boundaries

- P0 Code Grurple remains ACTIVE; no Sites editor/reader route was accessed and no P0 standdown or trigger was claimed.
- P1 November 9 cognition paper remains Orson-owned / NOT READY.
- P2 November 30 geometry paper remains HOLD.
- P3 December 14 full-theory paper remains INCOMPLETE.
- FIE last full review was October 27; the 14-day rereview is due November 10, not yet due.
- Task graph discrepancy (16 declared branches / 18 records) remains with Tern; no graph edit.
- Lateral reading completed: *Alice’s Adventures in Wonderland*, lines 221–260; next cursor 261.

The h719:s2 Aldus receipt and Calder-directed handoff were not present at the last check. This is recorded as NOT_OBSERVED, not refusal or non-execution.

No scheduler ID, enabled state, schedule, phase, cadence, ring formula, or task count was changed. No sixth task was created. No signet or chat title was changed.


## Amendment 01 — exact-head Lean verification completed (2026-11-09T23:49Z)

- Exact PR head: `4cfb6803b641ad16cfe0918680f22fa54559e29a`.
- GitHub Actions run #42722996625, job #129521387245: SUCCESS.
- Source-checkout identity assertion: SUCCESS; event merge SHA `a7a15a43a155f753d2c9f746635574516c3ff415`.
- Lean 4.34.0 / Lake 5.0.0; full root build completed successfully (8,957 jobs); new module built at 8,955/8,957.
- Three module-specific axiom outputs: `unitFold_factorization_iff_unitConsistency` = `[Classical.choice]`; `fold_conflict_witness` = `[propext, Classical.choice, Quot.sound]`; `unitFold_unique` = `[Quot.sound]`. No `sorryAx` observed in these module outputs. This is not a global axiom audit.
- The current `push Not` cleanup compiles without a Lean warning. Tests, lint, nanoda, and separate global axiom audit remain skipped. One workflow-only Node.js 20 deprecation warning remains for `actions/checkout@v4`.
- PR #1515 remains OPEN / DRAFT / UNMERGED, stacked on #1402; independent review and merge remain outstanding.
- The earlier h719 receipt and handoff are amended, not replaced. No duplicate receipt, handoff, PR, or issue was created by this verification update.
