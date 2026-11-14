import Mathlib
import HsHVerification.EliasActorRegistryCoverage

/-!
# Elias Track A: actor registration and capability-route separation

Source basis:
- The internal Top/Central/Branch/Hydra prototype, exact source Git blob
  `49988a769389b2baf264a27d596ba7c3ff822b36`.
- Historical Elias actor-registry sandbox note, HsH blob
  `8fe4070dbbfb0fa6ddcf580f48b1ac4b0a5ac9a8`.
- Current Elias workspace charter: prototype-only authority, explicit actor
  identity, before/after evidence, and transfer-test-before-sticky rule.

The Python source was executed separately from an exact source copy. This Lean
module formalizes a proposed routing specification, not the Python runtime or
the source-to-spec translation.

The key distinction found in the sandbox test:
- a `capability` context tag may justify routing to the capability directory;
- it does not, by itself, establish a missing capability or justify spawning
  the capability-scout action.

No production implementation, TOP rule, scheduler, or theory status is changed.
-/

namespace HsHVerification.EliasCapabilityRouteGate

open HsHVerification.EliasActorRegistryCoverage

/-- Preserve the four historical source keys and add one explicit sandbox actor. -/
def sandboxActorKeys : List String :=
  prototypeKeys ++ ["Elias Kern"]

def actorRegistered (name : String) : Bool :=
  sandboxActorKeys.contains name

theorem original_source_omits_elias :
    "Elias Kern" ∉ prototypeKeys :=
  named_elias_unregistered.2

theorem sandbox_explicitly_registers_elias :
    actorRegistered "Elias Kern" = true := by
  decide

theorem sandbox_unknown_actor_fails_closed :
    actorRegistered "Nonexistent Actor" = false := by
  decide

theorem original_actor_keys_are_preserved :
    ∀ name, name ∈ prototypeKeys → name ∈ sandboxActorKeys := by
  intro name h
  simp [sandboxActorKeys, h]

/-- Orthogonal signals used by source discovery and action routing. -/
structure CapabilitySignals where
  capabilityContext : Bool
  requiresCapability : Bool
  missingCapability : Bool
  blocked : Bool
  toolRequested : Bool
  pluginRequested : Bool
  deriving DecidableEq, Repr

/-- Source discovery can consult the capability directory from context or need. -/
def routesCapabilityDirectory (s : CapabilitySignals) : Bool :=
  s.capabilityContext || s.requiresCapability ||
    s.missingCapability || s.blocked ||
    s.toolRequested || s.pluginRequested

/-- Action routing requires a gap or an explicit blocked/tool/plugin request. -/
def routesCapabilityScout (s : CapabilitySignals) : Bool :=
  s.missingCapability || s.blocked || s.toolRequested || s.pluginRequested

def eliasContextOnly : CapabilitySignals :=
  ⟨true, false, false, false, false, false⟩

def missingToolContext : CapabilitySignals :=
  ⟨true, true, true, true, true, true⟩

theorem context_only_reads_directory_without_spawning_scout :
    routesCapabilityDirectory eliasContextOnly = true ∧
    routesCapabilityScout eliasContextOnly = false := by
  decide

theorem missing_tool_still_spawns_scout :
    routesCapabilityDirectory missingToolContext = true ∧
    routesCapabilityScout missingToolContext = true := by
  decide

theorem scout_route_requires_gap_or_explicit_request
    (s : CapabilitySignals)
    (h : routesCapabilityScout s = true) :
    s.missingCapability = true ∨
      s.blocked = true ∨
      s.toolRequested = true ∨
      s.pluginRequested = true := by
  simp [routesCapabilityScout] at h
  tauto

/-- The POC's priority order: freshness precedes capability, blockers, and work. -/
inductive NextOperation where
  | incorporateFreshDirective
  | capabilityScout
  | resolveHighestBlocker
  | requestedOperation
  deriving DecidableEq, Repr

def chooseNext (fresh missing blockers : Bool) : NextOperation :=
  if fresh then .incorporateFreshDirective
  else if missing then .capabilityScout
  else if blockers then .resolveHighestBlocker
  else .requestedOperation

theorem fresh_directive_preempts_every_other_operation
    (missing blockers : Bool) :
    chooseNext true missing blockers = .incorporateFreshDirective := by
  simp [chooseNext]

/-- TOP's locked/unlocked construction guard, represented as a closed policy. -/
inductive TopMutation where
  | locked
  | unlocked
  deriving DecidableEq, Repr

def switchboardConstructionAllowed : TopMutation → Bool
  | .locked => true
  | .unlocked => false

theorem locked_top_allows_construction :
    switchboardConstructionAllowed .locked = true := rfl

theorem unlocked_top_rejects_construction :
    switchboardConstructionAllowed .unlocked = false := rfl

theorem actor_admission_does_not_bypass_fresh_directive :
    actorRegistered "Elias Kern" = true ∧
    chooseNext true false false = .incorporateFreshDirective := by
  constructor
  · exact sandbox_explicitly_registers_elias
  · rfl

#print axioms original_source_omits_elias
#print axioms sandbox_explicitly_registers_elias
#print axioms sandbox_unknown_actor_fails_closed
#print axioms original_actor_keys_are_preserved
#print axioms context_only_reads_directory_without_spawning_scout
#print axioms missing_tool_still_spawns_scout
#print axioms scout_route_requires_gap_or_explicit_request
#print axioms fresh_directive_preempts_every_other_operation
#print axioms locked_top_allows_construction
#print axioms unlocked_top_rejects_construction
#print axioms actor_admission_does_not_bypass_fresh_directive

end HsHVerification.EliasCapabilityRouteGate
