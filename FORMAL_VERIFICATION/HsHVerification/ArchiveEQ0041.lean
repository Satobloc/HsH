import Mathlib

/-!
# Archive EQ0041 — director gauge-fixing gate

Source-critical boundary (Ravel reconstruction, 2026-10-27):
* The bounded Mersearch result
  `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`
  (blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`) found the historical
  assistant/NotebookLM-generated source
  `PRE_HSH_ROUNDUP/3 H(S)H EQUATION ROUNDUP.txt`, archive snapshot
  `7568462eb5d1059be9a10fe66d2cd3b296c1831f`, fetched source blob
  `eee52dad4c4e0663e929c15e1c2670c6f9771dd7`.
* Its verbatim expressions include `E(ρ) ∈ Gr(3,6)` for a planet's “solid
  material frame” and `q_spin = ω/c`.  Those are preserved as historical
  source claims, not imported as premises here.
* The live surveyed-source ledger (blob
  `8c040bc048be1dc81c4e5c6387bbb56a85e1d569`) says the finite-core
  tangent/director frame remains unselected.  Therefore this file proves only
  a representation-independent conditional gate.  It selects no material
  director, no SO(4) rate, and no physical observable.

Lean checks the encoded propositions only.  It does not validate the source
translation, establish a physical material frame, or supply empirical evidence.
-/

namespace HsHVerification.ArchiveEQ0041

/-- A director factors through the base projection exactly when it can be
computed from base data alone. -/
def FactorsThroughBase {Frame Base Director : Type*}
    (project : Frame → Base) (director : Frame → Director) : Prop :=
  ∃ baseDirector : Base → Director,
    ∀ frame, director frame = baseDirector (project frame)

/-- Any director determined only by base data is invariant under a move that
fixes the base projection at the tested frame. -/
theorem factored_director_invariant_under_stabilizer
    {Frame Base Director : Type*}
    (project : Frame → Base) (director : Frame → Director)
    (move : Frame → Frame) (frame : Frame)
    (hfactor : FactorsThroughBase project director)
    (hfix : project (move frame) = project frame) :
    director (move frame) = director frame := by
  rcases hfactor with ⟨baseDirector, hbase⟩
  calc
    director (move frame) = baseDirector (project (move frame)) := hbase (move frame)
    _ = baseDirector (project frame) := congrArg baseDirector hfix
    _ = director frame := (hbase frame).symm

/-- A director change along a projection-preserving move rules out recovery
of that director from the projected/base data alone. -/
theorem director_change_blocks_base_factorization
    {Frame Base Director : Type*}
    (project : Frame → Base) (director : Frame → Director)
    (move : Frame → Frame) (frame : Frame)
    (hfix : project (move frame) = project frame)
    (hchange : director (move frame) ≠ director frame) :
    ¬ FactorsThroughBase project director := by
  intro hfactor
  exact hchange
    (factored_director_invariant_under_stabilizer
      project director move frame hfactor hfix)

/-- The same obstruction is observable after any explicitly supplied readout:
if the readout distinguishes two gauge-related directors, the director did not
factor through base data.  Whether such a readout exists is an empirical,
source-dependent question outside this theorem. -/
theorem observed_change_blocks_base_factorization
    {Frame Base Director Observable : Type*}
    (project : Frame → Base) (director : Frame → Director)
    (observe : Director → Observable)
    (move : Frame → Frame) (frame : Frame)
    (hfix : project (move frame) = project frame)
    (hobserved :
      observe (director (move frame)) ≠ observe (director frame)) :
    ¬ FactorsThroughBase project director := by
  intro hfactor
  apply hobserved
  exact congrArg observe
    (factored_director_invariant_under_stabilizer
      project director move frame hfactor hfix)

end HsHVerification.ArchiveEQ0041


#print axioms factored_director_invariant_under_stabilizer
#print axioms director_change_blocks_base_factorization
#print axioms observed_change_blocks_base_factorization
