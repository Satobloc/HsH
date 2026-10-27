import Mathlib
import HsHVerification.EnheduannaTempleLayers

/-!
# Temple Hymns: edition-declared count arithmetic and later-layer sensitivity

These 42 natural numbers are the line-count labels in the Good Works Library
2026-09-19 English rendering of ETCSL c.4.80.1, I--XLII:
https://tianmu.org/good-work-library/sumerian/hymns-and-temple-songs/the-temple-hymns

A 2021 peer-reviewed mathematical claim (Tatiana Bonch-Osmolovskaya,
DOI 10.1080/17513472.2021.2003615) reports total divisible by 100 and
both halves equal. The labels are a derivative representation, NOT an
independent ancient witness, a new measurement, or proof of deliberate
composition. Source reading by Sophus Helle, enheduana.org/authorship,
identifies hymn IX (15 declared lines) as a later Shulgi addition.

Removing IX is a conditional textual-layer sensitivity analysis. It does
NOT establish that a historically attested earlier manuscript had exactly
these other 41 hymn counts, nor that Enheduanna authored the earlier core.
-/

namespace HsHVerification.EnheduannaDeclaredCounts

/-- Actual transcribed labels in the identified modern textual source. -/
def counts : List Nat :=
  [23, 13, 8, 12, 15, 9, 13, 17, 15, 11, 10, 10, 9, 7,
   10, 11, 10, 8, 9, 22, 8, 10, 10, 7, 11, 12, 23, 10,
   15, 16, 10, 8, 8, 22, 8, 10, 10, 14, 12, 12, 8, 14]

/-- Exclude the 9th source entry without reassigning original positions. -/
def withoutNinth : List Nat := counts.take 8 ++ counts.drop 9

theorem declared_hymns_42 : counts.length = 42 := by decide

theorem declared_total_500 : counts.sum = 500 := by decide

theorem declared_halves_250 :
    (counts.take 21).sum = 250 ∧ (counts.drop 21).sum = 250 := by
  decide

theorem ninth_label_15 : counts[8]! = 15 := by decide

theorem excluding_ninth_485 : withoutNinth.sum = 485 := by decide

theorem excluding_ninth_not_hundred_multiple :
    withoutNinth.sum % 100 ≠ 0 := by decide

theorem excluding_ninth_breaks_original_half_balance :
    (counts.take 8 ++ (counts.drop 9).take 12).sum = 235 ∧
    (counts.drop 21).sum = 250 := by decide

/-- Reuses the earlier formal chronology obstruction, not a new historical
proof. The two conjuncts have different evidence status: modern numerical
source labels and source-reported Shulgi dating. -/
theorem count_and_chronology_gates :
    withoutNinth.sum % 100 ≠ 0 ∧
    ¬ EnheduannaTempleLayers.ClosedAt
      EnheduannaTempleLayers.reportedLayerEra
      EnheduannaTempleLayers.Era.oldAkkadian := by
  constructor
  · exact excluding_ninth_not_hundred_multiple
  · exact EnheduannaTempleLayers.reported_addition_not_closed_in_old_akkadian

#print axioms declared_hymns_42
#print axioms declared_total_500
#print axioms declared_halves_250
#print axioms ninth_label_15
#print axioms excluding_ninth_485
#print axioms excluding_ninth_not_hundred_multiple
#print axioms excluding_ninth_breaks_original_half_balance
#print axioms count_and_chronology_gates

end HsHVerification.EnheduannaDeclaredCounts
