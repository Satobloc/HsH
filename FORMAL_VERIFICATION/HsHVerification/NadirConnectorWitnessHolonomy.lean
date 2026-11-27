import Mathlib

/-!
# Connector-witnessed relative holonomy

This module formalizes the group-algebra part of a basepoint-aligned
holonomy comparison.

The elements hR and hQ are holonomies of closed loops after each loop has
been based and trivialized in its own fiber. The element u represents a
specified connector transport from the hR base fiber to the hQ base fiber,
expressed in compatible trivializations. The expression below transports
hQ back before comparing it with hR.

This module does NOT construct a connection, a path, a parallel-transport
operator, a basepoint witness, an SO(3)/SO(4) representation, or a physical
readout. It proves only the abstract group identities once those objects
have been supplied. It also does not prove connector-path independence.
-/

namespace HsHVerification.NadirConnectorWitnessHolonomy

variable {G : Type*} [Group G]

/-- Relative holonomy after transporting the second loop back to the first
base fiber. The connector element u is oriented from the hR fiber to the
hQ fiber. -/
def relativeHolonomy (hR hQ u : G) : G :=
  hR⁻¹ * u⁻¹ * hQ * u

/-- When both loops already share a basepoint and frame, the connector is
the identity and the historical product is recovered. -/
theorem sameBasepoint_reduces (hR hQ : G) :
    relativeHolonomy hR hQ 1 = hR⁻¹ * hQ := by
  simp [relativeHolonomy]

/-- Under independent gauge changes at the two basepoints, the connector
and both loop holonomies transform so that the relative comparison changes
only by conjugation at the first basepoint. -/
theorem gaugeCovariant (hR hQ u gx gy : G) :
    relativeHolonomy
      (gx⁻¹ * hR * gx)
      (gy⁻¹ * hQ * gy)
      (gy⁻¹ * u * gx)
      =
    gx⁻¹ * relativeHolonomy hR hQ u * gx := by
  simp only [relativeHolonomy]
  group

/-- A conjugacy-invariant scalar or class-function readout is independent
of the choice of gauge at the common comparison basepoint. -/
def IsConjugacyInvariant {α : Type*} (f : G → α) : Prop :=
  ∀ g x, f (g⁻¹ * x * g) = f x

theorem conjugacyInvariant_readout
    {α : Type*} (f : G → α)
    (hf : IsConjugacyInvariant f)
    (hR hQ u gx gy : G) :
    f (relativeHolonomy
      (gx⁻¹ * hR * gx)
      (gy⁻¹ * hQ * gy)
      (gy⁻¹ * u * gx))
      =
    f (relativeHolonomy hR hQ u) := by
  rw [gaugeCovariant]
  exact hf gx (relativeHolonomy hR hQ u)

#print axioms sameBasepoint_reduces
#print axioms gaugeCovariant
#print axioms conjugacyInvariant_readout

end HsHVerification.NadirConnectorWitnessHolonomy
