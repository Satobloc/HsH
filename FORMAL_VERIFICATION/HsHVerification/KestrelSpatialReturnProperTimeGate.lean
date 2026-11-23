import Mathlib

/-!
# Compact spatial return versus unwrapped proper time

Source condition: Nathan's 2026-11-08 Crullerverse description treats the
toroidal circumference as a spatial direction while distinguishing proper
time from that spatial coordinate and describing progression along it.

This module formalizes only the conditional representation constraint:
if a spatial state returns after one positive coordinate period while a
real-valued proper-time parameter is strictly increasing, the combined
spatial-state/time pair does not return. A single-valued real time scalar
that is itself periodic cannot be strictly increasing.

The module does not establish that the Crullerverse is physically compact,
supply a metric or circumference, construct a universal cover, derive a
timesheet, choose among the mouth/timesheet alternatives, or validate a
physical model. The real parameter below is an abstract progression
parameter, not an additional physical dimension.
-/

namespace HsHVerification.KestrelSpatialReturnProperTimeGate

/-- The spatial state returns after one winding of a compact coordinate. -/
def SpatialReturn {X : Type*} (space : ℝ → X) (start period : ℝ) : Prop :=
  space (start + period) = space start

/-- The minimal coordinate-time pair returns to the same event state. -/
def EventStateReturn {X : Type*} (space : ℝ → X)
    (properTime : ℝ → ℝ) (start period : ℝ) : Prop :=
  (space (start + period), properTime (start + period)) =
    (space start, properTime start)

/-- A spatial return with strictly advancing proper time is not an
event-state return. The spatial coordinate may close while the unwrapped
proper-time parameter continues. -/
theorem spatial_return_with_strict_time_advance_is_not_event_return
    {X : Type*} (space : ℝ → X) (properTime : ℝ → ℝ)
    (start period : ℝ) (hperiod : 0 < period)
    (hspace : SpatialReturn space start period)
    (htime : StrictMono properTime) :
    SpatialReturn space start period ∧
      ¬ EventStateReturn space properTime start period := by
  constructor
  · exact hspace
  · intro hevent
    have htime_eq :
        properTime (start + period) = properTime start :=
      congrArg Prod.snd hevent
    have htime_lt :
        properTime start < properTime (start + period) :=
      htime (by linarith)
    exact (ne_of_gt htime_lt) htime_eq

/-- A single-valued real proper-time scalar that is periodic on the spatial
loop cannot be strictly increasing along that loop. No continuity or
differentiability assumption is needed for this endpoint obstruction. -/
theorem periodic_real_proper_time_not_strictly_increasing
    (properTime : ℝ → ℝ) (period : ℝ) (hperiod : 0 < period)
    (hperiodic : ∀ s, properTime (s + period) = properTime s) :
    ¬ StrictMono properTime := by
  intro hstrict
  have htime_lt : properTime 0 < properTime period := hstrict hperiod
  have htime_eq : properTime period = properTime 0 := by
    simpa using hperiodic 0
  rw [htime_eq] at htime_lt
  exact (lt_irrefl (properTime 0)) htime_lt

#print axioms spatial_return_with_strict_time_advance_is_not_event_return
#print axioms periodic_real_proper_time_not_strictly_increasing

end HsHVerification.KestrelSpatialReturnProperTimeGate
