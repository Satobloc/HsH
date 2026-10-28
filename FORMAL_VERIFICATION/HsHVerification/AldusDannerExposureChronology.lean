import Mathlib

/-!
# Danner neutron experiment: bibliographic first-exposure and object identity

Source witnesses (independently checked 2026-10-28):
* Danner et al., "Development and perfomance of a miniaturised spin
  rotator suitable for neutron interferometer experiments", J. Phys.
  Commun. 3 035001, DOI 10.1088/2399-6528/ab0805,
  published 2019-03-06. Object: apparatus/rotator performance.
* Danner et al., "Spin - Rotation Coupling Observed in Neutron
  Interferometry", arXiv:1904.07085 v1, submitted 2019-04-15
  14:46:25 (arXiv source timestamp). Object: interferometric phase.
* Danner et al., "Spin-rotation coupling observed in neutron
  interferometry", npj Quantum Information 6, 23, DOI
  10.1038/s41534-020-0254-8, version of record 2020-02-14.

YYYYMMDD integer keys encode the sourced *calendar dates* only.
These theorems prove consequences of the transcribed dates and object
labels. They do NOT authenticate bibliographic metadata, prove the
first-ever exposure, retrieve ILL-DATA.CRG-2484, or verify any physics.
-/

namespace HsHVerification.AldusDannerExposureChronology

inductive EvidenceObject
  | rotatorApparatus
  | interferometricPhase
  deriving DecidableEq, Repr

structure SourceWitness where
  dateKey : Nat
  object : EvidenceObject
  deriving Repr

def apparatus : SourceWitness :=
  ⟨20190306, .rotatorApparatus⟩

def preprint : SourceWitness :=
  ⟨20190415, .interferometricPhase⟩

def journal : SourceWitness :=
  ⟨20200214, .interferometricPhase⟩

theorem recorded_chronology :
    apparatus.dateKey < preprint.dateKey ∧
    preprint.dateKey < journal.dateKey := by
  decide

theorem apparatus_is_different_observable :
    apparatus.object ≠ preprint.object := by
  decide

theorem preprint_and_journal_share_recorded_object :
    preprint.object = journal.object := by
  decide

theorem earliest_located_phase_record_precedes_journal :
    preprint.dateKey < journal.dateKey := by
  decide

/-!
Additional source-faithful arm-label audit:
arXiv:1904.07085v1 HTML lines 71, 75, 81 name RFG arm II in
the main text, while lines 119 and 127 name RFG arm I in
supplemental Figure 4 and the experimental setup.
The 2020 journal version names RFG arm I in Figure 1 and Methods.
This is a *textual label mismatch*, not a demonstrated apparatus
reconfiguration or a measured phase-sign reversal.
-/

inductive InterferometerArm
  | I
  | II
  deriving DecidableEq, Repr

def preprintMainRfgArm : InterferometerArm := .II
def preprintSupplementRfgArm : InterferometerArm := .I
def journalRfgArm : InterferometerArm := .I

theorem preprint_arm_label_disagrees :
    preprintMainRfgArm ≠ preprintSupplementRfgArm := by
  decide

theorem journal_matches_preprint_supplement :
    journalRfgArm = preprintSupplementRfgArm := by
  decide

#print axioms preprint_arm_label_disagrees
#print axioms journal_matches_preprint_supplement

#print axioms recorded_chronology
#print axioms apparatus_is_different_observable
#print axioms preprint_and_journal_share_recorded_object
#print axioms earliest_located_phase_record_precedes_journal

end HsHVerification.AldusDannerExposureChronology
