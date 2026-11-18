import Mathlib

/-!
# Ariadne: connectedness obstruction for continuous transport

This module formalizes a purely topological necessary condition for representing
an observed split of a connected surface by one continuous transport map.

It does not establish that any experiment has reconstructed the topology
correctly, that a material surface or worldtube exists, or that H(s)H's
physical map is continuous across a breakup event. The bubble-vortex experiment
of Estepa-Cantero et al. (JFM 1045 A27, 2026; DOI
10.1017/jfm.2026.12078) is a source-grounded candidate motivating the
conditional question, not a physical premise encoded here.
-/

namespace HsHVerification.AriadneConnectednessSplitGate

/-- A continuous image of a connected set remains connected. -/
theorem continuous_image_of_connected_is_connected
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : Continuous f) (S : Set X)
    (hS : IsConnected S) :
    IsConnected (f '' S) :=
  hS.image f hf

/-- If the source set is connected, a continuous transport map cannot have a
    disconnected image. Any observed disconnected target therefore rules out
    this *single continuous map across the event* assumption. -/
theorem continuous_transport_split_no_go
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : Continuous f) (S : Set X)
    (hS : IsConnected S)
    (hSplit : ¬ IsConnected (f '' S)) :
    False :=
  hSplit (hS.image f hf)

/-- A homeomorphism is a special case: it cannot take a connected source
    slice to a disconnected target slice. -/
theorem homeomorphism_preserves_connectedness
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (e : X ≃ₜ Y) (S : Set X) (hS : IsConnected S) :
    IsConnected (e '' S) :=
  hS.image e e.continuous

end HsHVerification.AriadneConnectednessSplitGate
