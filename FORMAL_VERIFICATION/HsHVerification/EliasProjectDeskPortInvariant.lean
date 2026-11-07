import Mathlib

namespace HsHVerification.EliasProjectDeskPortInvariant

/-
Source boundary:
  HsH/CONVERSATION_VIEWER/desk.html, blob dfb3b929edf26d346162abdb9cb82f268de5506f.

This is a source-extracted abstraction of the current port renderer:
  * the destination is selected by the port key (or row id for INTERVENE);
  * state color is a separate readout;
  * evidence depth controls which indexed ports are lit.

It does not formalize the missing dependency-path-to-cell map, dynamic edge
guards, browser behavior, or the correctness of the source-to-model translation.
-/

inductive PortKey
  | edge
  | trouble
  | owner
  | intervene
  deriving DecidableEq, Repr

structure PortTargets where
  edge : String
  trouble : String
  owner : String
  rowId : String
  deriving DecidableEq, Repr

def targetFor (targets : PortTargets) : PortKey → String
  | .edge => targets.edge
  | .trouble => targets.trouble
  | .owner => targets.owner
  | .intervene => targets.rowId

structure CellChannels where
  stateColor : String
  evidenceDepth : Nat
  deriving DecidableEq, Repr

structure RenderedPort where
  target : String
  stateColor : String
  lit : Bool
  deriving DecidableEq, Repr

def renderPort (targets : PortTargets) (key : PortKey)
    (cell : CellChannels) (portIndex : Nat) : RenderedPort :=
  { target := targetFor targets key
    stateColor := cell.stateColor
    lit := portIndex < cell.evidenceDepth }

theorem target_invariant_under_readout_change
    (targets : PortTargets) (key : PortKey)
    (cell₁ cell₂ : CellChannels) (portIndex : Nat) :
    (renderPort targets key cell₁ portIndex).target =
      (renderPort targets key cell₂ portIndex).target := by
  rfl

theorem state_color_independent_of_evidence_depth
    (targets : PortTargets) (key : PortKey)
    (stateColor : String) (depth₁ depth₂ portIndex : Nat) :
    (renderPort targets key
      ⟨stateColor, depth₁⟩ portIndex).stateColor =
      (renderPort targets key
      ⟨stateColor, depth₂⟩ portIndex).stateColor := by
  rfl

theorem lit_port_is_depth_threshold
    (targets : PortTargets) (key : PortKey)
    (cell : CellChannels) (portIndex : Nat) :
    (renderPort targets key cell portIndex).lit =
      (portIndex < cell.evidenceDepth) := by
  rfl

/-- Actual source-extracted grurple row destinations and first two cells. -/
def grurpleTargets : PortTargets :=
  { edge := "WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md"
    trouble := "PUBLIC_SITE/build_suggestions"
    owner := "WORKSPACES/PAPERS"
    rowId := "grurple" }

def grurplePriorityCell : CellChannels :=
  { stateColor := "active", evidenceDepth := 4 }

def grurpleExecutionCell : CellChannels :=
  { stateColor := "blocked", evidenceDepth := 3 }

#eval (renderPort grurpleTargets .edge grurplePriorityCell 0).target
#eval (renderPort grurpleTargets .edge grurpleExecutionCell 0).target
#eval (renderPort grurpleTargets .edge grurplePriorityCell 0).lit
#eval (renderPort grurpleTargets .edge grurpleExecutionCell 3).lit

#print axioms target_invariant_under_readout_change
#print axioms state_color_independent_of_evidence_depth
#print axioms lit_port_is_depth_threshold

end HsHVerification.EliasProjectDeskPortInvariant
