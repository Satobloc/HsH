import Mathlib
import HsHVerification.RavelCarrierSliceReconstruction

/-!
# Ravel: conditional timesheet-retention gate for joint readouts

## Nathan Direct source anchors

The Library raw export for conversation
`6a9d1a23-4fac-83ea-b76f-6805ece3ee9f` was read directly:
`🎼 Ravel [H(s)H] Syncmathcek — raw (2).json`,
SHA-256 `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`.

- User message `b9805319-9d77-4b43-874a-5af50c0b6ef7`,
  2026-09-07T08:06:58.114Z: filament and timesheet distortions mutually
  accommodate force; force is the primitive.
- User message `496a15ea-0263-459d-b815-908f52155b90`,
  2026-09-07T10:06:12.842Z: distinguishes the reduced 3D diagram, full
  4D bulk, and the actual 4D view with "our 3D slice of it." The message
  does not identify that slice as the timesheet or provide a
  slice-to-timesheet map. It separately describes an induction-current
  connection within timesheet thickness as tentative, not an equation
  or constitutive law.
- User message `3d0ad680-51db-4c79-ad4a-9bbacada24ef`,
  2026-09-07T07:46:38.573Z: choose a spatial Kerr section and extend it
  along the filament; do not use full 4D Kerr spacetime as the section.

The full HsH snapshot in
`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.06•26.09.16•🎼 Ravel [H(s)H] Syncmathcek — raw (2).json`
has Git blob `17cfe3feb830f70009557d063482b35adba0834b` and is byte-identical
to the Library export above (12,408,770 bytes; SHA-256
`b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`).
The earlier HsH snapshot in
`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`
has Git blob `c49367b0faa424491e7b3520a034b9e44fe6897f` and is a shorter
2026-09-06 to 2026-09-10 snapshot, not a mismatching copy of the full
Library export. The two files are versioned snapshots of one conversation,
not independent witnesses. Their first extant HsH commits are respectively
2026-09-23T16:23:41Z (full snapshot) and 2026-09-12T13:25:11Z (shorter
snapshot).

## Formal question

The existing `LabelledSlicePullback` is an explicit assistant
reconstruction that retains a tube representative, a timesheet label,
and a sheet representative. The direct source does not identify its
third representation's 3D slice with this timesheet family; a
slice-to-timesheet map remains an uninstantiated input obligation.
When may a downstream readout discard the latter two and become a
function of the tube representative alone?

This module proves the exact conditional answer: such a reduction exists
if and only if the readout is constant on every fiber of the projection
that forgets the sheet representative and label.

This does **not** assert that a physical response varies with the
timesheet, and does not define a force, current, medium, Kerr connection,
coarse-graining law, or instrument response. It is a source-conditioned
identifiability gate for a future, explicitly specified readout map.
Lean checks only the formalized statement, not the source translation or
physical premises.
-/

namespace HsHVerification.RavelJointAccommodationReadout

open HsHVerification.RavelCarrierSliceReconstruction

universe u v w z

variable {Ambient : Type u} {Base : Type v} {Label : Type z}
variable {Y : Type w}

variable (T : FiberedSupport Ambient Base)
variable (S : EmbeddedSupportFamily Ambient Label)
variable (baseOf : Label → Base)

/-- The source-preserving joint state: tube, timesheet label, and sheet point. -/
abbrev JointState :=
  LabelledSlicePullback T S baseOf

/-- Two joint states lie in the same tube fiber when their tube
representatives are exactly equal. -/
def sameTube (p q : JointState T S baseOf) : Prop :=
  LabelledSlicePullback.toTube T S baseOf p =
    LabelledSlicePullback.toTube T S baseOf q

/-- Equivalence relation that forgets the sheet label and sheet point
while retaining the tube total-space representative. -/
def sameTubeSetoid : Setoid (JointState T S baseOf) where
  r := sameTube T S baseOf
  iseqv := ⟨
    by intro p; rfl,
    by intro p q h; exact h.symm,
    by intro p q r hpq hqr; exact hpq.trans hqr
  ⟩

/-- Quotient of joint slice states by equality of their tube representative. -/
abbrev TubeOnlyQuotient :=
  Quot (sameTubeSetoid T S baseOf)

/-- A readout descends to a tube-only representation if it can be
expressed as a deterministic function on the quotient that forgets
timesheet labels and sheet representatives. -/
def DescendsToTubeOnlyQuotient
    (readout : JointState T S baseOf → Y) : Prop :=
  ∃ g : TubeOnlyQuotient T S baseOf → Y,
    ∀ p, g (Quot.mk (sameTubeSetoid T S baseOf) p) = readout p

/-- Exact factorization criterion: a readout factors through the
tube-only quotient if and only if it is constant on every fiber of
the joint-state-to-tube projection. -/
theorem readout_descends_iff_constant_on_same_tube_fibers
    (readout : JointState T S baseOf → Y) :
    DescendsToTubeOnlyQuotient T S baseOf readout ↔
      ∀ p q, sameTube T S baseOf p q → readout p = readout q := by
  letI : Setoid (JointState T S baseOf) := sameTubeSetoid T S baseOf
  constructor
  · rintro ⟨g, hg⟩ p q hpq
    calc
      readout p = g (Quot.mk (sameTubeSetoid T S baseOf) p) := (hg p).symm
      _ = g (Quot.mk (sameTubeSetoid T S baseOf) q) := by
        congr 1
        exact Quot.sound hpq
      _ = readout q := hg q
  · intro h
    refine ⟨Quot.lift readout ?_, ?_⟩
    · intro p q hpq
      exact h p q hpq
    · intro p
      rfl

/-- If two sheet representatives of the same tube yield different
readouts, no deterministic tube-only reduction can reproduce both. -/
theorem timesheet_sensitive_readout_forbids_tube_only_reduction
    (readout : JointState T S baseOf → Y)
    (p q : JointState T S baseOf)
    (same : sameTube T S baseOf p q)
    (different : readout p ≠ readout q) :
    ¬ DescendsToTubeOnlyQuotient T S baseOf readout := by
  intro hdesc
  have hinv :=
    (readout_descends_iff_constant_on_same_tube_fibers
      T S baseOf readout).mp hdesc
  exact different (hinv p q same)

/-- Two joint states lie in the same sheet fiber when their
labelled sheet representatives are exactly equal. -/
def sameSheet (p q : JointState T S baseOf) : Prop :=
  LabelledSlicePullback.toSheet T S baseOf p =
    LabelledSlicePullback.toSheet T S baseOf q

/-- Equivalence relation that forgets the tube representative while
retaining the full labelled sheet representative. -/
def sameSheetSetoid : Setoid (JointState T S baseOf) where
  r := sameSheet T S baseOf
  iseqv := ⟨
    by intro p; rfl,
    by intro p q h; exact h.symm,
    by intro p q r hpq hqr; exact hpq.trans hqr
  ⟩

/-- Quotient of joint slice states by equality of their labelled sheet representative. -/
abbrev SheetOnlyQuotient :=
  Quot (sameSheetSetoid T S baseOf)

/-- A readout descends to a sheet-only representation if it can be
expressed as a deterministic function on the quotient that forgets
the tube representative. -/
def DescendsToSheetOnlyQuotient
    (readout : JointState T S baseOf → Y) : Prop :=
  ∃ g : SheetOnlyQuotient T S baseOf → Y,
    ∀ p, g (Quot.mk (sameSheetSetoid T S baseOf) p) = readout p

/-- Symmetric factorization criterion: a readout factors through the
sheet-only quotient if and only if it is constant on every fiber of
the joint-state-to-sheet projection. -/
theorem readout_descends_iff_constant_on_same_sheet_fibers
    (readout : JointState T S baseOf → Y) :
    DescendsToSheetOnlyQuotient T S baseOf readout ↔
      ∀ p q, sameSheet T S baseOf p q → readout p = readout q := by
  letI : Setoid (JointState T S baseOf) := sameSheetSetoid T S baseOf
  constructor
  · rintro ⟨g, hg⟩ p q hpq
    calc
      readout p = g (Quot.mk (sameSheetSetoid T S baseOf) p) := (hg p).symm
      _ = g (Quot.mk (sameSheetSetoid T S baseOf) q) := by
        congr 1
        exact Quot.sound hpq
      _ = readout q := hg q
  · intro h
    refine ⟨Quot.lift readout ?_, ?_⟩
    · intro p q hpq
      exact h p q hpq
    · intro p
      rfl

/-- If two tube representatives on the same labelled sheet yield
different readouts, no deterministic sheet-only reduction can reproduce both. -/
theorem tube_sensitive_readout_forbids_sheet_only_reduction
    (readout : JointState T S baseOf → Y)
    (p q : JointState T S baseOf)
    (same : sameSheet T S baseOf p q)
    (different : readout p ≠ readout q) :
    ¬ DescendsToSheetOnlyQuotient T S baseOf readout := by
  intro hdesc
  have hinv :=
    (readout_descends_iff_constant_on_same_sheet_fibers
      T S baseOf readout).mp hdesc
  exact different (hinv p q same)

#print axioms readout_descends_iff_constant_on_same_tube_fibers
#print axioms timesheet_sensitive_readout_forbids_tube_only_reduction
#print axioms readout_descends_iff_constant_on_same_sheet_fibers
#print axioms tube_sensitive_readout_forbids_sheet_only_reduction

end HsHVerification.RavelJointAccommodationReadout
