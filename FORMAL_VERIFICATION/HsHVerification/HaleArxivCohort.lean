import Mathlib

/-!
# Hale: original arXiv-ID cohort versus latest-version metadata date

Source-locked external observational record:
Satobloc/HSH_RESOURCES/
  EXPOSURE_STATS/arXiv_analysis/2026-09-13_RANDOM_100x3_JAN_SEP/
  arxiv_random_100_2024_jan_sep.json
Git blob cc67a93d4977ee277e6da78c3c0f50622e47f5ad

Actual record arXiv:2406.04125 has ID year 2024, OAI-PMH arXiv-format
"created" date 2025-03-08. The sampler selects cohorts from the YYMM
prefix, not the OAI-PMH "created" field. arXiv official OAI documentation
states the arXiv format contains latest-version metadata and arXivRaw
contains version history; arXiv API staff clarified the created-date
semantics in the July 2025 discussion.

This file verifies only an explicit source-to-field mapping distinction.
It does not prove the archived JSON is authentic, validate original
submission dates, estimate population trends, or imply SAT/H(s)H physics.
-/

namespace HsHVerification.HaleArxivCohort

structure ArchiveRecord where
  idYear : Nat
  metadataCreatedYear : Nat
  deriving Repr, DecidableEq

def originalCohort (r : ArchiveRecord) : Nat := r.idYear
def metadataDateCohort (r : ArchiveRecord) : Nat := r.metadataCreatedYear

def withLatestMetadataYear (r : ArchiveRecord) (year : Nat) : ArchiveRecord :=
  { r with metadataCreatedYear := year }

theorem original_cohort_unchanged_by_metadata_update
    (r : ArchiveRecord) (newYear : Nat) :
    originalCohort (withLatestMetadataYear r newYear) =
      originalCohort r := by
  rfl

theorem metadata_date_cohort_tracks_update
    (r : ArchiveRecord) (newYear : Nat) :
    metadataDateCohort (withLatestMetadataYear r newYear) =
      newYear := by
  rfl

/-- Source record arXiv:2406.04125, archived metadata "created" 2025-03-08. -/
def recorded2406_04125 : ArchiveRecord :=
  { idYear := 2024, metadataCreatedYear := 2025 }

theorem recorded_years_disagree :
    originalCohort recorded2406_04125 ≠
      metadataDateCohort recorded2406_04125 := by
  decide

theorem two_grouping_maps_not_extensionally_equal :
    ¬ (∀ r : ArchiveRecord,
        originalCohort r = metadataDateCohort r) := by
  intro h
  exact recorded_years_disagree (h recorded2406_04125)

#print axioms original_cohort_unchanged_by_metadata_update
#print axioms metadata_date_cohort_tracks_update
#print axioms recorded_years_disagree
#print axioms two_grouping_maps_not_extensionally_equal

end HsHVerification.HaleArxivCohort
