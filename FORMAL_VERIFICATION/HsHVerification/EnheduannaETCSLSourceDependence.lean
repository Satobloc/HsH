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


/-!
## Completeness audit against the *whole* Oxford bibliography

The bibliography lists three PRINT source entries (Römer/Hecker/Kaiser 1989,
Sjöberg/Bergmann 1969, and Sjöberg 1973) plus two ELECTRONIC inputs
(Civil 1989 and Krecher/Jagersma 1996). The earlier `sourceFamily`
deliberately represented only one print entry and the two electronic entries.
Its source-overlap theorem remains valid but cannot establish completeness
of Oxford's five listed bibliographic inputs. These are catalogue entries,
not five independent ancient witnesses or five distinct physical tablets.

Primary: https://etcsl.orinst.ox.ac.uk/section4/b4801.htm
  "Print sources used" and "Electronic sources used" (retrieved 2026-10-29).
-/

inductive ListedSource where
  | romerHeckerKaiser1989
  | sjobergBergmann1969
  | sjoberg1973
  | civil1989
  | krecherJagersma1996
  deriving DecidableEq, Repr

def listedPrintSources : List ListedSource :=
  [.romerHeckerKaiser1989, .sjobergBergmann1969, .sjoberg1973]

def listedElectronicSources : List ListedSource :=
  [.civil1989, .krecherJagersma1996]

def allListedBibliographySources : List ListedSource :=
  listedPrintSources ++ listedElectronicSources

/-- The earlier formalized three-input selection, NOT the full bibliography. -/
def earlierSelectedSources : List ListedSource :=
  [.sjobergBergmann1969, .civil1989, .krecherJagersma1996]

theorem five_listed_bibliographic_entries :
    allListedBibliographySources.length = 5 := by decide

theorem earlier_selection_has_three :
    earlierSelectedSources.length = 3 := by decide

theorem earlier_selection_is_drawn_from_list :
    earlierSelectedSources.all (fun s => decide (s ∈ allListedBibliographySources)) = true := by decide

theorem two_print_entries_absent_from_earlier_selection :
    ListedSource.romerHeckerKaiser1989 ∉ earlierSelectedSources ∧
    ListedSource.sjoberg1973 ∉ earlierSelectedSources := by decide

/-- Source-encoding incompleteness, not a theorem that an editorial edition
is independent or that an ancient physical object exists. -/
theorem earlier_selection_not_full_bibliography :
    ¬ (∀ s, s ∈ allListedBibliographySources → s ∈ earlierSelectedSources) := by
  intro h
  have hListed : ListedSource.romerHeckerKaiser1989 ∈ allListedBibliographySources := by decide
  have hAbsent : ListedSource.romerHeckerKaiser1989 ∉ earlierSelectedSources := by decide
  exact hAbsent (h _ hListed)

#print axioms five_listed_bibliographic_entries
#print axioms earlier_selection_has_three
#print axioms earlier_selection_is_drawn_from_list
#print axioms two_print_entries_absent_from_earlier_selection
#print axioms earlier_selection_not_full_bibliography

#print axioms printed_1969_is_ETCSL_source
#print axioms electronic_1989_is_ETCSL_source
#print axioms electronic_1996_is_ETCSL_source
#print axioms ETCSL_and_1969_share_recorded_source
#print axioms three_named_prior_inputs

end HsHVerification.EnheduannaETCSLSourceDependence
