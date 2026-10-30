import HsHVerification.AlberrLoaderContract

/-!
# Alberr: aggregate SAT-O loader contract

Conditional mathematics for the eight observed archive file positions.
Source facts are established separately by full-text file inspection; these
theorems do not assert that a Python import was executed or a physical model
was tested.
-/

namespace HsHVerification.AlberrLoader

def AggregateReady (files : Fin 8 → ModuleWitness) : Prop :=
  ∀ i, MeetsImportContract (files i)

theorem one_missing_export_blocks_aggregate
    (files : Fin 8 → ModuleWitness) (i : Fin 8)
    (h : (files i).exposesGetStructure = false) :
    ¬ AggregateReady files := by
  intro hall
  exact missing_export_blocks_contract (files i) h (hall i)

theorem one_invalid_syntax_blocks_aggregate
    (files : Fin 8 → ModuleWitness) (i : Fin 8)
    (h : (files i).parses = false) :
    ¬ AggregateReady files := by
  intro hall
  exact invalid_syntax_blocks_contract (files i) h (hall i)

theorem all_missing_exports_block_aggregate
    (files : Fin 8 → ModuleWitness)
    (h : ∀ i, (files i).exposesGetStructure = false) :
    ¬ AggregateReady files := by
  exact one_missing_export_blocks_aggregate files 0 (h 0)

#print axioms one_missing_export_blocks_aggregate
#print axioms one_invalid_syntax_blocks_aggregate
#print axioms all_missing_exports_block_aggregate

end HsHVerification.AlberrLoader
