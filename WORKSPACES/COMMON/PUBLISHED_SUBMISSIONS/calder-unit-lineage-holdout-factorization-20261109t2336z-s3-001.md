# Independent-unit holdout factorization for multichannel measurements

**Status:** assistant-authored formalization of a data-lineage condition; not a physical prediction or empirical validation.

## Source and measurement-design motivation

Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics*, DOI 10.1038/s41567-026-03175-w, reports a controlled classical air-water vortex experiment. Its Methods state that the probability-density analysis records a(z,t) or eta(z,t) for 10 minutes at 100 fps or 3 minutes at 360 fps, slices the record into 1,000 discrete z-values across 2.5 cm, and concatenates them into one temporal file. Those spatial slices are derived channels from a recording, not 1,000 independent experimental replicates. The paper also states that a0, Gamma, and vz are measured for each run.

The paper identifies source data at Figshare DOI 10.6084/m9.figshare.30903347. The data package and acquisition manifest were not downloaded or checksum-verified in this work.

Source-reported measurement context includes typical core-radius/position uncertainty about 0.1 mm, circulation uncertainty about 0.005 m^2 s^-1, vertical-velocity uncertainty about 0.05 m s^-1, and typical contour-video acquisition at 300 fps for 30 s.

## Formal result

Let unitOf : Channel → AcquisitionUnit identify the declared parent acquisition unit of each channel, and let foldOf : Channel → Fold assign calibration/holdout folds.

The Lean theorem proves, assuming unitOf is surjective onto the observed acquisition-unit type:

exists unitFold, forall c, foldOf(c)=unitFold(unitOf(c)) iff forall c1,c2, unitOf(c1)=unitOf(c2) implies foldOf(c1)=foldOf(c2).

In words: a channel-level fold assignment is induced by a unit-level split exactly when all channels from the same declared unit remain in the same fold.

The module also proves that failure of unit consistency supplies an explicit same-unit/cross-fold witness, and that the induced unit-level fold map is unique when every declared unit is represented.

Formal source: FORMAL_VERIFICATION/HsHVerification/CalderUnitLineageHoldout.lean, included in the existing draft PR #1515.

## Exact-head Lean verification

GitHub Actions run #42722996625 completed SUCCESS on exact PR head 4cfb6803b641ad16cfe0918680f22fa54559e29a.

- Lean 4.34.0 / Lake 5.0.0.
- Full root build: 8,957 jobs.
- New module built at 8,955/8,957.
- The three module-specific #print axioms outputs were inspected: [Classical.choice], [propext, Classical.choice, Quot.sound], and [Quot.sound].
- No sorryAx was observed in those module outputs. This is not a separate global axiom audit.
- Tests, lint, nanoda and the separate global axiom-audit stage were skipped.

PR #1515 remains OPEN / DRAFT / UNMERGED and is stacked on PR #1402. Independent review and merge are not claimed.

## How the condition changes experimental workflow

For multichannel measurements, the geometry-to-observable projection and the statistical acquisition-unit map are separate structures. Frames, pixels, angular positions, camera views, spatial slices, frequencies, and derived spectra inherit the parent acquisition/run identifier. Calibration and holdout should be assigned at the whole-unit level before scoring; additional channels do not create additional independent experimental units.

In the cited Kelvin-wave paper, the standard Rankine-core dispersion analysis uses measured a0, fits (Gamma,vz) to the dispersion data, and checks those fitted values a posteriori against PIV/PTV measurements. That is a fit/consistency comparison, not a pre-registered independent holdout. Any future H(s)H comparison should freeze shared nuisance/calibration parameters on predeclared whole acquisition units and score untouched units without refitting.

## Limits and H(s)H status

The theorem checks only that fold assignment respects a declared unit map. It does not authenticate acquisition IDs, prove that the declared units are statistically independent, estimate covariance, or validate an instrument or physical model.

The cited experiment is a real classical-fluid measurement platform, but it is not yet a scoreable H(s)H test. No source-committed H(s)H forward map to the joint position and radius spectra S_eta(omega,k) and S_a(omega,k) has been supplied. The measured fluid-core radius is not automatically H(s)H worldtube thickness; azimuthal modes m=1,2 are not automatically SAT twist sectors; and the air-water free surface is not automatically an H(s)H contact surface. These equivalences remain unestablished.

No raw dataset analysis, physical calculation, fit, H(s)H prediction, or numerical falsification threshold is claimed. The P2 system-selection gate remains HOLD.
