# H1008:S3 - Frozen predictive-set separation contract

**Nominal slot:** 2026-11-22T00:36:00Z  
**Ring selection:** h=1008; seq=5h+3=5043; 5043 mod 19=8. Hale (index 8) -> Elias Kern (index 9).  
**Status at report preparation:** CORE THEOREMS COMPILED; FINAL STYLE-CLEANUP HEAD RECHECK IN_PROGRESS; PHYSICAL TEST NOT READY.

## 1. Authority and source boundaries

This is an assistant-level reconstruction under the deterministic Hale ring label, not authenticated participation by a historical Hale instance or current Hale thread. The historical specialist remit is supported by Hale's 2026-09-12 worker self-report in `WORKSPACES/COMMON/CHECKINS.md` and the Sable-maintained `REV-006-HALE-REENTRY.md`: external-literature landscape scanning, matched-period comparison, quantitative/statistical analysis, controls, calibration and source/evidence provenance. No standalone signed Nathan-authored Hale charter was recovered.

Hale was externally exposed by design. This work is not a blind theory review. The current user-supplied Lane Charter 36 is the task-specific overlay; the historical literature/calibration specialty is retained without replacing other worker remits. The first-blush exercise was not performed before current onboarding and must not be retroactively described as blind.

## 2. Substantive architecture improvement

Extended existing draft PR #1487, `Add non-compensatory model-selection preference gate`, in its existing branch:

- Branch: `research/intelligibility-selection-gate-20261108t1336z`
- Current head after a proof-style cleanup: `a5ef0ffbb1e51e6db4c23e2f3061bbec329bfb7b` (the first successful build below compiled the immediately preceding head `daf53428f2e29d331bf5b1cfa99b6eec190ca232`).
- Base: `research/hale-measurement-domain-contract-20261105t0936z`
- Comparison to its actual base: 6 commits ahead, 1 behind at the preflight comparison. No rebase or merge was attempted.
- Changed file: `FORMAL_VERIFICATION/HsHVerification/ModelSelectionPreference.lean`
- Current module blob: `15979ccb712609cddf20decdf440825e9183ee91`; the compiled pre-cleanup module blob was `7183c935e92663b7460ea8613dac468c0d089f6e`.

The new section defines two frozen prediction-region differences over one common observable space:

```lean
def hshExclusivePredictions (hsh standard : Set Observation) :=
  hsh \ standard

def standardExclusivePredictions (hsh standard : Set Observation) :=
  standard \ hsh
```

The input sets are intended to be uncertainty-inclusive, resolution-declared predictive regions after shared calibration and before holdout access. Constructing them from physical models and measurements remains an external obligation.

The new Lean results establish:

1. `hshPredictionSubsetStandard_iff_noHshExclusive`: H(s)H inclusion in the standard region is equivalent to having no H(s)H-exclusive allowed outcome.
2. `standardPredictionSubsetHsh_iff_noStandardExclusive`: the symmetric inclusion condition.
3. `predictiveSetsEqual_iff_noExclusiveOutcomes`: equality of the two regions is equivalent to both exclusive regions being empty.
4. `twoSidedPredictiveSeparation_iff_witnesses`: two-sided set-membership discrimination exists exactly when each model has at least one exclusive observable witness.
5. `strictHshSubsetStandard_has_standardExclusiveOutcome`: strict H(s)H inclusion in the standard region guarantees at least one standard-only outcome.
6. `strictHshSubsetStandard_is_oneSided`: in that strict-subset case, H(s)H can be falsified by a standard-only outcome, but cannot be uniquely favored over the standard comparator by set-membership compatibility alone.
7. `wideningHshRegionAbsorbsFormerStandardOnlyWitness`: widening the H(s)H region after observing a former standard-only outcome removes that outcome's status as an H(s)H falsification witness.

This yields a useful four-way reading of the frozen regions:

- Equal regions: observationally equivalent at the declared set-membership resolution.
- H(s)H strict subset of standard: one-sided falsifiability of H(s)H, but no H(s)H-only support.
- Standard strict subset of H(s)H: the symmetric one-sided case.
- Incomparable regions: both exclusive regions exist, permitting two-sided set-membership discrimination.

The result closes a gap between parameter identifiability and empirical discrimination: identifiable parameters do not guarantee that the resulting model family has any outcome region that differs from the standard comparator.

## 3. Statistical interpretation and limits

This is a set-membership compatibility contract, not a likelihood-ratio test, Bayesian comparison, scoring-rule comparison, calibrated confidence region, or model-confidence-set procedure. Equality of allowed-outcome sets does not imply equality of probability distributions. A strict subset does not by itself establish superior predictive performance.

The external statistical literature provides the next layer rather than a substitute for this result:

- Hansen, Lunde and Nason (2011), "The Model Confidence Set," *Econometrica* 79(2), 453-497, DOI `10.3982/ECTA5771`. Their MCS preserves model-selection uncertainty: uninformative data can leave multiple models in the confidence set, while informative data can narrow it.
- Arnold, Gavrilopoulos and Schulz (2026), "Sequential model confidence sets," *Journal of the Royal Statistical Society: Series B* 88(5), 1662-1681, DOI `10.1093/jrsssb/qkag066`. This extends model-confidence-set reasoning to sequential monitoring with e-processes and confidence sequences, with time-uniform nonasymptotic coverage guarantees.

The practical sequence is therefore: establish distinct allowed-outcome regions; then use a calibrated statistical comparison that respects covariance, acquisition units, multiplicity, model-selection uncertainty and the predeclared stopping/holdout protocol. The Lean result supplies only the first logical screen.

## 4. Concrete finite-core measurement-map exemplar

A directly inspected primary-source exemplar is Barckicke, Falcon and Gissinger, "Kelvin wave propagation along vortex cores," *Nature Physics* (2026), DOI `10.1038/s41567-026-03175-w`, [author-hosted PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf).

The experiment uses a controlled water-air bathtub vortex, with a 21-cm-diameter, 45-cm-tall cylindrical confinement and a roughly 40-cm vortex. The paper reports a 2,064 x 1,564 pixel optical camera, 60 micrometres per pixel, a 0.5-mm contour width, approximately 0.1-mm uncertainty in core radius and position, and typical 300-fps, 30-second recordings. PIV circulation uncertainty is about 0.005 m^2/s and PTV vertical-velocity uncertainty about 0.05 m/s. The paper's standard comparator is a Rankine-core Kelvin-wave dispersion model with measured core radius and independently measured flow quantities; the reported representative fit uses a0=1.9 mm, Gamma=0.022 m^2/s and vz=0.57 m/s, described as consistent with the corresponding measurements.

The two antipodal samples define eta=(r0-rpi)/2 and a=(r0+rpi)/2. For the idealized single-harmonic map, these are odd/even parity projections, so the two-point map alone aliases m with m+2. This conditional alias result is already formalized in Nadir PR #1189; it was not duplicated here.

Crucially, the paper does not use only those two scalar values: its Methods also describe full left/right contour profiles and spatiotemporal Fourier spectra, plus PIV and particle-tracking measurements. The paper reports m=1 bending waves in the position spectrum and m=2 fluted waves in the radius spectrum. The two-point alias theorem therefore applies to the two-sample projection alone; it is not a refutation of the paper's full analysis. It instead shows why the complete acquisition/processing operator, not an intermediate projection, must define the final observable space used in the predictive-set comparison.

The fitting Methods fix a0 from the measured radius and fit (Gamma, vz) to the dispersion data, then check the fitted pair a posteriori against independent measurements. The accessible Methods do not establish a pre-registered untouched holdout. For any future H(s)H comparison, calibration and holdout must be explicitly separated; a same-data fit or a post-hoc consistency check must not be relabelled as a blind prediction.

The paper points to Figshare DOI `10.6084/m9.figshare.30903347`. The DOI is a source locator, but this run did not retrieve or hash the raw files, determine a dataset version/file inventory, or reconstruct covariance. No independent data calculation was performed. This is a classical hydrodynamic measurement-method exemplar, not a physical equivalence to H(s)H and not a P2 system selection.

## 5. H(s)H implications remain conditional

No source-grounded finite-core/worldtube-to-instrument map currently supplies an H(s)H predictive region for a selected measured system. No corresponding standard predictive region has been instantiated on a common observable space for a selected P2 system.

Consequently:

- No numerical thickness, twist, contact-surface or other geometric parameter is inferred.
- No additional worldtube feature is forced by this theorem.
- Thickness, twist and contact remain separate candidate structures whose projection/readout maps must be specified before they can constrain an observable.
- No P2 system was selected; no raw data were downloaded or analyzed.
- No calibration, fit, holdout prediction, falsification threshold or independent measurement was performed.
- No SAT-O or Blockwave original equation was changed, copied into a corrected source, or promoted.
- No BEDROCK theory promotion or paper-gate advancement occurred.

P2 remains HOLD.

## 6. Exact-head verification state

The first exact merge-reference build, [Actions run #44967975883](https://github.com/Satobloc/HsH/actions/runs/44967975883), compiled the immediately preceding PR head `daf53428f2e29d331bf5b1cfa99b6eec190ca232`. Its merge-reference checkout was `2fa2ca3fd7027c9228a94018a110487cb3b0a76c`; the `ModelSelectionPreference.lean` blob at that merge reference exactly matched the PR-head blob `7183c935e92663b7460ea8613dac468c0d089f6e`. Lean 4.34.0 / Lake 5.0.0 completed the full build successfully (8,947 jobs). All seven new declarations elaborated. Five theorem-specific axiom reports list the standard foundations `[propext, Classical.choice, Quot.sound]`; two report no axioms. No `sorryAx`, `admit`, or custom axiom was found in the new section. Tests, lint, leanchecker, nanoda and global axiom audit were skipped.

That build emitted one `unnecessarySimpa` style warning in the new section. A follow-up commit `a5ef0ffbb1e51e6db4c23e2f3061bbec329bfb7b` changed the two terminal `simpa using hMem` proof steps to `simp at hMem`; the current module blob is `15979ccb712609cddf20decdf440825e9183ee91`. The second merge-reference verification, [Actions run #44968403111](https://github.com/Satobloc/HsH/actions/runs/44968403111), is IN_PROGRESS at the last observation, still before the Lean compile step. Therefore the core theorem statements/proofs have a successful actual build on the immediately preceding identical mathematical content, but the final style-cleanup blob is not yet verified.

PR #1487 remains OPEN / DRAFT / UNMERGED and stacked on #1387. No rebase, merge, reviewer approval or final-head verification is claimed. Vercel's separate free-tier build-rate-limit failure is not Lean CI evidence.

## 7. Operational preflight and preservation

- Live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, Primary Operational Guideline, onboarding, revival rotation, scheduler authority, current task graph, PWH queue, Hale continuity/INBOX and REV-006 were read.
- Main-branch documents were read through the GitHub connector; the append-only clone-ledger update was committed and read back at `58a8ab9f9aa7f45710ab56bcd5bc4a22ecfe4729`.
- Task graph: 18 records, 16 declared branches. No graph mutation.
- PWH: WH-02 remains Calder-owned; WH-05 remains blocked by the occupied Mersearch lanes. No ownership or queue mutation.
- P0 Code Grurple remains ACTIVE. P1 cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 HOLD. P3 INCOMPLETE. November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE.
- FIE next review remains November 24. Shared unrelated-reading cursor remains 3086; no duplicate break claimed.
- Mersearch was not callable; all four canonical request lanes remain occupied/requested. GitHub search/fetch was bounded fallback, not Mersearch.
- Existing Lean project and PR #1487 were reused. Math Hopper #578 / PR #991, Whirligig Kernel 0 and SciSpace availability were checked. No new tool, dependency, fork, subscription or expense.
- HSH_RESOURCES root README and arXiv API documentation only; no PRIOR_ART or private research payload was opened.
- Clone ledger append was independently read back: 255 valid JSONL rows, 255 unique event IDs, zero parse errors. Three new h1008:s3 API-only events cover HsH, SAT archive search and HSH_RESOURCES documentation access. Container scan found no `.git` directories in inspected paths and no repository archives under `/mnt/data`. Unexposed automation provisioning and GitHub Traffic attribution remain UNKNOWN.

## 8. Scheduler and handoff boundary

The existing :24 task's h1008:s2 run (deterministic label Calder) was still IN_PROGRESS, scheduled 00:24Z and started 00:37:57.994123Z, with `chat_ref=null`. The current :36 run was scheduled 00:36Z and started 00:38:21.241577Z, also IN_PROGRESS with `chat_ref=null`. Their observed starts were 23.247454 seconds apart despite twelve minutes between nominal slots. This establishes overlapping run records, not duplicate execution, retry, concurrent worker identity or cause.

No h1008:s2 receipt or handoff was found at the time of this report. The :36 task's cached latest result still belonged to Ravel h1006:s3; it is stale and was not attributed to this run. No direct-thread delivery, consumption, acknowledgement or cross-thread participation is claimed.

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its exact hourly America/New_York DTSTART `20261001T143600`, original prompt and Lane Charter 36 phase unchanged. No sixth task, task mutation, signet or conversation rename.

## 9. Tocktick / return capsule

- **Focus:** frozen H(s)H versus standard predictive-region separation.
- **Immediate:** finish exact-head Lean run #44967975883; independently inspect job logs and theorem-specific axiom output.
- **Stop condition:** no physical comparison until a source-grounded geometry-to-instrument map, measured system, provenance, units, covariance, calibration and untouched holdout exist; P2 remains HOLD and P0 remains active.
- **Return locator:** PR #1487 head `daf53428f2e29d331bf5b1cfa99b6eec190ca232`; issue publisher submission to be recorded separately; next ring label Elias Kern. No handoff or assignment was created.
