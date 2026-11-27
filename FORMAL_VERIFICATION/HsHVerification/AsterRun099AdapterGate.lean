import Mathlib
import HsHVerification.NadirFrameTelescoping
import HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
# Aster: RUN 099 carrier projection and frame-convention gate

This module is an assistant-authored, source-bounded adapter contract.

The public RUN 099 case supplies three equal-radius centers and a separate
frame channel. The existing carrier function accepts only the centers and
common radius. The historical Rotoexpando/Hagalaz convention records
Q_ij = F_j * F_i^{-1}. The source-defined embedding from the full UI
construction into a Three-Spheres state remains unspecified.

Accordingly, Run099State below is only a candidate solver-side state for the
existing case. It is not the full UI state, a source-defined UI-to-Three-
Spheres map, a physical model, or an SO(4) instantiation.

The results establish:
* the carrier projection forgets frame data;
* a relative-frame readout cannot be decoded from carrier input alone when
  that frame varies;
* carrying the frame channel alongside the carrier input is lossless for
  this declared state;
* the RUN 099 identity-endpoint fixture cannot distinguish right increments
  from left-acting Hagalaz relative frames;
* the declared residual-radius formula has the stated squared identity on
  its real domain.

These are formal statements about the types and assumptions below. They do
not establish source fidelity of an external adapter or physical truth.
-/

namespace HsHVerification.AsterRun099AdapterGate

universe u v w

/-- The exact data consumed by the current equal-radius carrier solver. -/
structure CarrierInput (Center : Type u) where
  centers : Fin 3 → Center
  radius : ℝ

/-- Candidate RUN 099 state: three centers, one common radius, and three
    separately retained frame values. Equal radius is built into this
    solver-side type; it is not a reconstruction of the full UI ontology. -/
structure Run099State (Center : Type u) (Frame : Type v) where
  centers : Fin 3 → Center
  radius : ℝ
  frames : Fin 3 → Frame

/-- Candidate projection implemented by the current carrier function:
    retain centers and common radius, omit all frame values. -/
def carrierProjection (s : Run099State Center Frame) : CarrierInput Center :=
  ⟨s.centers, s.radius⟩

/-- Source-convention relative frame Q_ij = F_j * F_i^{-1}. -/
def relativeFrame [Group Frame] (s : Run099State Center Frame)
    (i j : Fin 3) : Frame :=
  s.frames j * (s.frames i)⁻¹

def relativeFrame01 [Group Frame] (s : Run099State Center Frame) : Frame :=
  relativeFrame s 0 1

/-- Change only the second frame, preserving the carrier input. -/
def replaceFrame1 (s : Run099State Center Frame) (f : Frame) :
    Run099State Center Frame :=
  { s with frames := Function.update s.frames (1 : Fin 3) f }

@[simp] theorem carrierProjection_replaceFrame1
    (s : Run099State Center Frame) (f : Frame) :
    carrierProjection (replaceFrame1 s f) = carrierProjection s := by
  rfl

@[simp] theorem relativeFrame01_replaceFrame1 [Group Frame]
    (s : Run099State Center Frame) (f : Frame) :
    relativeFrame01 (replaceFrame1 s f) = f * (s.frames 0)⁻¹ := by
  simp [relativeFrame01, relativeFrame, replaceFrame1]

/-- If the second frame changes, the source-convention relative frame changes. -/
theorem relativeFrame01_changed [Group Frame]
    (s : Run099State Center Frame) (f : Frame)
    (hf : f ≠ s.frames 1) :
    relativeFrame01 (replaceFrame1 s f) ≠ relativeFrame01 s := by
  intro h
  apply hf
  have h' := congrArg (fun q => q * s.frames 0) h
  simpa [relativeFrame01, relativeFrame, replaceFrame1, mul_assoc] using h'

/-- No deterministic readout on the carrier projection image can recover
    Q_01 when a frame variation is hidden in one carrier fibre. This is a
    source-specific specialization of the existing generic fibre-mismatch
    theorem, not a new general factorization theorem. -/
theorem no_relativeFrame01_factorization
    [Group Frame]
    (s : Run099State Center Frame) (f : Frame)
    (hf : f ≠ s.frames 1) :
    ¬ ∃ induced : Set.range carrierProjection → Frame,
      ∀ t, induced
        (HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection
          carrierProjection t) = relativeFrame01 t := by
  exact
    HsHVerification.NadirProjectionCoarseGrainFactorization.no_inducedCoarseGraining_of_fiber_mismatch
      carrierProjection (fun t => t) relativeFrame01
      (replaceFrame1 s f) s
      (carrierProjection_replaceFrame1 s f)
      (relativeFrame01_changed s f hf)

/-- Consequently, no decoder after an arbitrary deterministic carrier solver
    can reconstruct Q_01 from the carrier result alone. -/
theorem no_frame_decoder_from_carrier_solver
    [Group Frame]
    {Output : Type w}
    (solver : CarrierInput Center → Output)
    (s : Run099State Center Frame) (f : Frame)
    (hf : f ≠ s.frames 1) :
    ¬ ∃ decode : Output → Frame,
      ∀ t, decode (solver (carrierProjection t)) = relativeFrame01 t := by
  intro h
  rcases h with ⟨decode, hdecode⟩
  apply no_relativeFrame01_factorization s f hf
  exact ⟨fun input => decode (solver input), hdecode⟩

/-- A lossless candidate adapter carries the carrier input and the frame
    channel separately. -/
def augmentedView (s : Run099State Center Frame) :
    CarrierInput Center × (Fin 3 → Frame) :=
  (carrierProjection s, s.frames)

def augmentedUnview
    (view : CarrierInput Center × (Fin 3 → Frame)) :
    Run099State Center Frame :=
  { centers := view.1.centers
    radius := view.1.radius
    frames := view.2 }

theorem augmentedUnview_augmentedView
    (s : Run099State Center Frame) :
    augmentedUnview (augmentedView s) = s := by
  cases s
  rfl

theorem augmentedView_injective :
    Function.Injective (augmentedView (Center := Center) (Frame := Frame)) := by
  intro s t h
  have h' := congrArg augmentedUnview h
  simpa [augmentedUnview, augmentedView, carrierProjection] using h'

/-- Source-convention relative frames compose in reverse edge order:
    Q_12 * Q_01 = Q_02. Reuses Nadir's already-formalized group identity. -/
theorem relativeFrame_comp [Group Frame]
    (s : Run099State Center Frame) :
    relativeFrame s 1 2 * relativeFrame s 0 1 = relativeFrame s 0 2 := by
  simpa [relativeFrame] using
    HsHVerification.NadirFrameTelescoping.leftRelative_comp
      (s.frames 0) (s.frames 1) (s.frames 2)

/-- Left-acting Hagalaz relative frame Q_ij = F_j F_i^{-1} equals the right
    increment E_ij = F_i^{-1} F_j exactly when the endpoint frames commute. -/
theorem leftRelative_eq_edge_iff_commute [Group Frame]
    (a b : Frame) :
    HsHVerification.NadirFrameTelescoping.leftRelative a b =
      HsHVerification.NadirFrameTelescoping.edge a b ↔ a * b = b * a := by
  unfold HsHVerification.NadirFrameTelescoping.leftRelative
    HsHVerification.NadirFrameTelescoping.edge
  constructor
  · intro h
    have h' := congrArg (fun x => a * x * a) h
    simpa [mul_assoc] using h'
  · intro h
    have h' := congrArg (fun x => a⁻¹ * x * a⁻¹) h
    simpa [mul_assoc] using h'

/-- An identity start frame makes left and right conventions coincide. -/
theorem leftRelative_eq_edge_of_identity_start [Group Frame] (b : Frame) :
    HsHVerification.NadirFrameTelescoping.leftRelative (1 : Frame) b =
      HsHVerification.NadirFrameTelescoping.edge (1 : Frame) b := by
  simp [HsHVerification.NadirFrameTelescoping.leftRelative,
    HsHVerification.NadirFrameTelescoping.edge]

/-- An identity terminal frame also makes the conventions coincide. -/
theorem leftRelative_eq_edge_of_identity_end [Group Frame] (a : Frame) :
    HsHVerification.NadirFrameTelescoping.leftRelative a (1 : Frame) =
      HsHVerification.NadirFrameTelescoping.edge a (1 : Frame) := by
  simp [HsHVerification.NadirFrameTelescoping.leftRelative,
    HsHVerification.NadirFrameTelescoping.edge]

/-- The RUN 099 frame assignment (I, F, I) has an identity endpoint on each
    edge, so its loop test cannot distinguish the two conventions. -/
theorem run099_identity_endpoint_conventions_coincide [Group Frame]
    (f : Frame) :
    (HsHVerification.NadirFrameTelescoping.leftRelative (1 : Frame) f =
      HsHVerification.NadirFrameTelescoping.edge (1 : Frame) f) ∧
    (HsHVerification.NadirFrameTelescoping.leftRelative f (1 : Frame) =
      HsHVerification.NadirFrameTelescoping.edge f (1 : Frame)) ∧
    (HsHVerification.NadirFrameTelescoping.leftRelative (1 : Frame) (1 : Frame) =
      HsHVerification.NadirFrameTelescoping.edge (1 : Frame) (1 : Frame)) := by
  exact ⟨leftRelative_eq_edge_of_identity_start f,
    leftRelative_eq_edge_of_identity_end f,
    leftRelative_eq_edge_of_identity_start (1 : Frame)⟩

/-- RUN 099 defines G = 1 - (r_c/R)^2. -/
def carrierDiscriminant (R r_c : ℝ) : ℝ :=
  1 - (r_c / R) ^ 2

/-- Candidate residual common-intersection radius rho = R * sqrt(G).
    This is meaningful as a real radius only on the declared G >= 0 domain. -/
def residualCarrierRadius (R r_c : ℝ) : ℝ :=
  R * Real.sqrt (carrierDiscriminant R r_c)

/-- On the real domain and for positive R, rho^2 = R^2 - r_c^2. -/
theorem residualCarrierRadius_sq
    (R r_c : ℝ) (hR : 0 < R)
    (hG : 0 ≤ carrierDiscriminant R r_c) :
    (residualCarrierRadius R r_c) ^ 2 = R ^ 2 - r_c ^ 2 := by
  unfold residualCarrierRadius carrierDiscriminant
  rw [Real.sq_sqrt hG]
  have hRne : R ≠ 0 := ne_of_gt hR
  field_simp [hRne]
  ring

#print axioms relativeFrame_comp
#print axioms no_relativeFrame01_factorization
#print axioms no_frame_decoder_from_carrier_solver
#print axioms augmentedView_injective
#print axioms leftRelative_eq_edge_iff_commute
#print axioms run099_identity_endpoint_conventions_coincide
#print axioms residualCarrierRadius_sq

/-- Abstract finite-group witness: the identity-start case agrees, while
    a noncommuting pair in S3 distinguishes the two conventions. This is a
    group-theoretic execution check, not a physical rotation fixture. -/
def swap01 : Equiv.Perm (Fin 3) := Equiv.swap (0 : Fin 3) 1
def swap12 : Equiv.Perm (Fin 3) := Equiv.swap (1 : Fin 3) 2

#eval decide
  (HsHVerification.NadirFrameTelescoping.leftRelative
    (1 : Equiv.Perm (Fin 3)) swap12 =
   HsHVerification.NadirFrameTelescoping.edge
    (1 : Equiv.Perm (Fin 3)) swap12)

#eval decide
  (HsHVerification.NadirFrameTelescoping.leftRelative swap01 swap12 =
   HsHVerification.NadirFrameTelescoping.edge swap01 swap12)

end HsHVerification.AsterRun099AdapterGate
