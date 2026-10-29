import HsHVerification.EnheduannaETCSLWitnessInventory

/-!
# Oxford ETCSL editorial-source dependency gate

The Oxford ETCSL Temple Hymns bibliography identifies:
- Sjöberg and Bergmann (1969), TCS 3, pp. 3--154: printed composite,
  score transliteration, translation, handcopy, commentary;
- Civil's 1989 COR11.SPI: legacy electronic composite;
- Krecher/Jagersma's 1996 LIT2.TXT: electronic composite and translation.

This module records a bibliographic *source-use relation*, not a claim that
these editions are identical, historically independent, or physically measured.
The original cuneiform source rows are in EnheduannaETCSLWitnessInventory.
-/

namespace HsHVerification.EnheduannaETCSLSourceDependence

inductive Edition where
  | tcs1969 | civil1989 | krecherJagersma1996 | etcslTempleHymns
  deriving DecidableEq, Repr

/-- Declared bibliographic input layers, including each edition itself. -/
def sourceFamily : Edition → List Edition
  | .tcs1969 => [.tcs1969]
  | .civil1989 => [.civil1989]
  | .krecherJagersma1996 => [.krecherJagersma1996]
  | .etcslTempleHymns => [.etcslTempleHymns, .tcs1969, .civil1989, .krecherJagersma1996]

/-- A conservative formal criterion for distinct SOURCE families only:
no shared recorded bibliographic ancestor. This is not a statistical test. -/
def disjointByRecordedSource (a b : Edition) : Prop :=
  ∀ x, x ∈ sourceFamily a → x ∉ sourceFamily b

theorem printed_1969_is_ETCSL_source :
    Edition.tcs1969 ∈ sourceFamily .etcslTempleHymns := by decide

theorem electronic_1989_is_ETCSL_source :
    Edition.civil1989 ∈ sourceFamily .etcslTempleHymns := by decide

theorem electronic_1996_is_ETCSL_source :
    Edition.krecherJagersma1996 ∈ sourceFamily .etcslTempleHymns := by decide

/-- ETCSL and its named 1969 input are not disjoint by source ancestry. -/
theorem ETCSL_and_1969_share_recorded_source :
    ¬ disjointByRecordedSource .etcslTempleHymns .tcs1969 := by
  intro h
  exact (h .tcs1969 (by decide)) (by decide)

/-- The source family is a list of editorial inputs, not a clay-tablet count. -/
theorem three_named_prior_inputs :
    (sourceFamily .etcslTempleHymns).length = 4 := by decide

#print axioms printed_1969_is_ETCSL_source
#print axioms electronic_1989_is_ETCSL_source
#print axioms electronic_1996_is_ETCSL_source
#print axioms ETCSL_and_1969_share_recorded_source
#print axioms three_named_prior_inputs

end HsHVerification.EnheduannaETCSLSourceDependence
