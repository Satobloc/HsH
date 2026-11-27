import Mathlib
import HsHVerification.NadirFrameTelescoping
import HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
# Aster: RUN 099 carrier projection and frame-convention gate

This module is an assistant-authored, source-bounded adapter contract.

The RUN 099 case manifest supplies three equal-radius centers, a common
hypersphere radius, and one independent F2 x-w frame perturbation. The
current wrapper maps that single F2 channel to the list [I, F2, I].
The identity endpoints are wrapper conventions; the case manifest does not
define a three-frame ontology.

The existing carrier function accepts only centers and the common radius.
The candidate left-acting relative-frame convention Q_ij = F_j * F_i^{-1}
is recorded in NadirFrameTelescoping.lean. That formalization cites a
historical SAT file and a Rotoexpando manuscript locator, but the primary
source text has not been independently read in this run; no new Nathan
Direct attribution is asserted here.

Run099State below is only a candidate solver-side state for the existing
case. It is not the full UI state, a source-defined UI-to-Three-Spheres map,
a physical model, or an SO(4) instantiation.

The results establish:
* the carrier projection forgets frame data;
* the wrapper's single F2 channel has an explicit [I, F2, I] encoding;
* a candidate relative-frame readout cannot be decoded from carrier input
  alone when that frame varies;
* carrying the frame channel alongside the carrier input is lossless for
  this declared state;
* the RUN 099 identity-endpoint adapter cannot distinguish right increments
  from the candidate left-acting relative frames;
* the case manifest's residual-radius formula has the stated squared
  identity on its real domain.

The case notation G, R, r_c, and rho is LOCAL:RUN099. G is the case
discriminant, not Newton's gravitational constant; r_c is the center
circumradius, while rho is the residual common-intersection radius. The
current carrier solver returns G and r_c but does not emit rho, and the
current wrapper does not compute or assert rho. The final theorem below
therefore proves the manifest's algebraic relation only, not an
implementation output.

These are formal statements about the types and assumptions below. They do
not establish source fidelity of an external adapter, the missing
UI-to-Three-Spheres projection, physical truth, or dynamic holonomy.
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

/-- Adapter-only encoding of the single RUN 099 F2 channel as [I, F2, I].
    The identity endpoint frames come from the current wrapper, not from a
    source-defined three-frame state. -/
def run099FrameAssignment [One Frame] (F2 : Frame) : Fin 3 → Frame :=
  fun i => if i = (1 : Fin 3) then F2 else 1

@[simp] theorem run099FrameAssignment_zero [One Frame] (F2 : Frame) :
    run099FrameAssignment F2 0 = 1 := by
  simp [run099FrameAssignment]

@[simp] theorem run099FrameAssignment_one [One Frame] (F2 : Frame) :
    run099FrameAssignment F2 1 = F2 := by
  simp [run099FrameAssignment]

@[simp] theorem run099FrameAssignment_two [One Frame] (F2 : Frame) :
    run099FrameAssignment F2 2 = 1 := by
  simp [run099FrameAssignment]

/-- Candidate state produced by the current wrapper's F2-to-[I,F2,I]
    assignment. This is an adapter map, not a source-defined UI embedding. -/
def run099AdapterState [One Frame]
    (centers : Fin 3 → Center) (radius : ℝ) (F2 : Frame) :
    Run099State Center Frame :=
  { centers := centers
    radius := radius
    frames := run099FrameAssignment F2 }

@[simp] theorem carrierProjection_run099AdapterState [One Frame]
    (centers : Fin 3 → Center) (radius : ℝ) (F2 : Frame) :
    carrierProjection (run099AdapterState centers radius F2) =
      ⟨centers, radius⟩ := by
  rfl

/-- Candidate left-acting relative frame Q_ij = F_j * F_i^{-1}. -/
def relativeFrame [Group Frame] (s : Run099State Center Frame)
    (i j : Fin 3) : Frame :=
  s.frames j * (s.frames i)⁻¹

def relativeFrame01 [Group Frame] (s : Run099State Center Frame) : Frame :=
  relativeFrame s 0 1

@[simp] theorem run099AdapterState_relativeFrame01 [Group Frame]
    (centers : Fin 3 → Center) (radius : ℝ) (F2 : Frame) :
    relativeFrame01 (run099AdapterState centers radius F2) = F2 := by
  simp [run099AdapterState, run099FrameAssignment, relativeFrame01, relativeFrame]

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

/-- If the second frame changes, the candidate relative frame changes. -/
theorem relativeFrame01_changed [Group Frame]
    (s : Run099State Center Frame) (f : Frame)
    (hf : f ≠ s.frames 1) :
    relativeFrame01 (replaceFrame1 s f) ≠ relativeFrame01 s := by
  intro h
  apply hf
  have h' := congrArg (fun q => q * s.frames 0) h
  simpa [relativeFrame01, relativeFrame, replaceFrame1, mul_assoc] using h'

/-- No deterministic readout on the carrier projection image can recover
    the candidate Q_01 when a frame variation is hidden in one carrier
    fibre. This specializes the existing generic fibre-mismatch theorem. -/
theorem no_relativeFrame01_factorization
    [Group Frame]
    (s : Run099State Center Frame) (f : Frame)
    (hf : f ≠ s.frames 1) :
    ¬ ∃ induced :
      Set.range (fun t : Run099State Center Frame => carrierProjection t) → Frame,
      ∀ t : Run099State Center Frame,
        induced
          (HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection
            (fun t : Run099State Center Frame => carrierProjection t) t) =
          relativeFrame01 t := by
  exact
    HsHVerification.NadirProjectionCoarseGrainFactorization.no_inducedCoarseGraining_of_fiber_mismatch
      (fun t : Run099State Center Frame => carrierProjection t)
      (fun t : Run099State Center Frame => t)
      (fun t : Run099State Center Frame => relativeFrame01 t)
      (replaceFrame1 s f) s
      (carrierProjection_replaceFrame1 s f)
      (relativeFrame01_changed s f hf)

/-- Consequently, no decoder after an arbitrary deterministic carrier solver
    can reconstruct the candidate Q_01 from carrier input alone. -/
theorem no_frame_decoder_from_carrier_solver
    [Group Frame]
    {Output : Type w}
    (solver : CarrierInput Center → Output)
    (s : Run099State Center Frame) (f : Frame)
    (hf : f ≠ s.frames 1) :
    ¬ ∃ decode : Output → Frame,
      ∀ t : Run099State Center Frame,
        decode (solver (carrierProjection t)) = relativeFrame01 t := by
  intro h
  rcases h with ⟨decode, hdecode⟩
  apply no_relativeFrame01_factorization s f hf
  refine ⟨fun input => decode (solver input.1), ?_⟩
  intro t
  simpa [HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection] using
    hdecode t

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
  simpa only [augmentedUnview_augmentedView] using h'

/-- Candidate left-acting relative frames compose in reverse edge order:
    Q_12 * Q_01 = Q_02. Reuses Nadir's already-formalized group identity. -/
theorem relativeFrame_comp [Group Frame]
    (s : Run099State Center Frame) :
    relativeFrame s 1 2 * relativeFrame s 0 1 = relativeFrame s 0 2 := by
  simpa [relativeFrame] using
    HsHVerification.NadirFrameTelescoping.leftRelative_comp
      (s.frames 0) (s.frames 1) (s.frames 2)

/-- Candidate left-acting relative frame Q_ij = F_j F_i^{-1} equals the
    right increment E_ij = F_i^{-1} F_j exactly when the endpoint frames
    commute. -/
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

/-- The current RUN 099 wrapper assignment [I, F2, I] has identity endpoints,
    so its loop test cannot distinguish the two conventions. -/
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

/-- LOCAL:RUN099:G = 1 - (r_c/R)^2, where G is the case discriminant. -/
noncomputable def carrierDiscriminant (R r_c : ℝ) : ℝ :=
  1 - (r_c / R) ^ 2

/-- LOCAL:RUN099:rho = R * sqrt(G). The case manifest declares this
    residual common-intersection radius, but the current solver/wrapper does
    not emit it. This definition formalizes the manifest contract only. -/
noncomputable def residualCarrierRadius (R r_c : ℝ) : ℝ :=
  R * Real.sqrt (carrierDiscriminant R r_c)

/-- On the manifest's real domain and for positive R,
    rho^2 = R^2 - r_c^2. -/
theorem residualCarrierRadius_sq
    (R r_c : ℝ) (hR : 0 < R)
    (hG : 0 ≤ carrierDiscriminant R r_c) :
    (residualCarrierRadius R r_c) ^ 2 = R ^ 2 - r_c ^ 2 := by
  have hRne : R ≠ 0 := ne_of_gt hR
  rw [residualCarrierRadius, mul_pow, Real.sq_sqrt hG]
  unfold carrierDiscriminant
  field_simp [hRne]

#print axioms relativeFrame_comp
#print axioms no_relativeFrame01_factorization
#print axioms no_frame_decoder_from_carrier_solver
#print axioms augmentedView_injective
#print axioms run099AdapterState_relativeFrame01
#print axioms leftRelative_eq_edge_iff_commute
#print axioms run099_identity_endpoint_conventions_coincide
#print axioms residualCarrierRadius_sq

end HsHVerification.AsterRun099AdapterGate
