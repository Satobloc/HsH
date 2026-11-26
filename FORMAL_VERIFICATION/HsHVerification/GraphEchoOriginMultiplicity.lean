import Mathlib

/-!
Source-linked formalization of GraphEcho's path/provenance distinction.

Historical source:
Sikun Wang, Yixi Zhou, Lei Fan, and Fan Zhang,
"GraphEcho: Structural Redundancy and Evidence Provenance in LLM Graph Agents,"
arXiv:2609.17695v1 (2026-09-15), Section 2, equations (1)-(2).

The paper defines path multiplicity as the number of traversal paths and
provenance-label multiplicity as the number of distinct labels reached by
those paths. This module formalizes only the finite-map cardinality
relationship between those two counts.

A provenance label is NOT assumed to identify a statistically independent
study, dataset, observation, or causal origin. The paper's document IDs are
representation-level labels; source independence requires separate lineage
and empirical adjudication.

This is a mathematical consequence of a finite path-to-label map. It does
not reproduce GraphEcho's benchmark, validate its model outputs, establish
that its annotations identify true source origins, or establish any
physical/geometric equivalence.
-/

namespace HsHVerification.GraphEchoOriginMultiplicity

/-- Number of represented traversal paths in a finite path space. -/
def pathCount (Path : Type*) [Fintype Path] : Nat :=
  Fintype.card Path

/-- Number of distinct provenance labels reached by a finite path-to-label map. -/
def provenanceLabelCount {Path Label : Type*}
    [Fintype Path] [DecidableEq Path] [DecidableEq Label]
    (originLabel : Path → Label) : Nat :=
  (Finset.univ.image originLabel).card

/-- Distinct labels cannot outnumber the paths that map to them. -/
theorem provenance_label_count_le_path_count
    {Path Label : Type*}
    [Fintype Path] [DecidableEq Path] [DecidableEq Label]
    (originLabel : Path → Label) :
    provenanceLabelCount originLabel ≤ pathCount Path := by
  simpa [provenanceLabelCount, pathCount] using
    (Finset.card_image_le (s := Finset.univ) (f := originLabel))

/-- Equality of path count and distinct-label count holds exactly when
    the path-to-label map is injective on the finite path space. -/
theorem provenance_label_count_eq_path_count_iff_injective
    {Path Label : Type*}
    [Fintype Path] [DecidableEq Path] [DecidableEq Label]
    (originLabel : Path → Label) :
    provenanceLabelCount originLabel = pathCount Path ↔
      Function.Injective originLabel := by
  constructor
  · intro h
    have hCard :
        (Finset.univ.image originLabel).card =
          (Finset.univ : Finset Path).card := by
      simpa [provenanceLabelCount, pathCount] using h
    have hInj :
        Set.InjOn originLabel (↑(Finset.univ : Finset Path)) :=
      (Finset.card_image_iff (s := Finset.univ) (f := originLabel)).mp hCard
    intro p q hpq
    exact hInj (by simp) (by simp) hpq
  · intro hInj
    have hCard :
        (Finset.univ.image originLabel).card =
          (Finset.univ : Finset Path).card :=
      Finset.card_image_of_injective (s := Finset.univ) hInj
    simpa [provenanceLabelCount, pathCount] using hCard

/-- If two distinct paths share one provenance label, the number of distinct
    labels is strictly smaller than the number of paths. -/
theorem duplicate_origin_label_implies_strict
    {Path Label : Type*}
    [Fintype Path] [DecidableEq Path] [DecidableEq Label]
    (originLabel : Path → Label)
    (p q : Path) (hneq : p ≠ q)
    (hdup : originLabel p = originLabel q) :
    provenanceLabelCount originLabel < pathCount Path := by
  have hle := provenance_label_count_le_path_count originLabel
  have hne :
      provenanceLabelCount originLabel ≠ pathCount Path := by
    intro hEq
    have hInj :=
      (provenance_label_count_eq_path_count_iff_injective originLabel).mp hEq
    exact hneq (hInj hdup)
  exact lt_of_le_of_ne hle hne

#print axioms provenance_label_count_le_path_count
#print axioms provenance_label_count_eq_path_count_iff_injective
#print axioms duplicate_origin_label_implies_strict

end HsHVerification.GraphEchoOriginMultiplicity
