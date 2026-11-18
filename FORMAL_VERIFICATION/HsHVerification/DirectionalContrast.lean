import Mathlib

/-!
Directional outcome classifier for the existing three-model comparison freeze.
Assistant-authored 2026-11-18.

The classifier preserves the direction of a pass/fail contrast and prevents
"both models fail" from being reported as a relative advantage. A relative
advantage is a candidate comparison result only; it is not empirical support.

No physical model, dataset, threshold, or measurement is encoded.
-/

namespace HsHVerification.DirectionalContrast

inductive Outcome where
  | pass
  | fail
  | unscorable
deriving DecidableEq, Repr

inductive Result where
  | freezeMismatch
  | sameModelVersion
  | bothPass
  | coreDisfavored
  | coreRelativeAdvantage
  | bothFail
  | unscorable
deriving DecidableEq, Repr

/-- Direction-preserving result under a declared exact freeze and distinct
    model versions. The "core relative advantage" label is not support. -/
def classify (sameFreeze distinctVersions : Bool)
    (standard core : Outcome) : Result :=
  if !sameFreeze then .freezeMismatch
  else if !distinctVersions then .sameModelVersion
  else
    match standard, core with
    | .pass, .pass => .bothPass
    | .pass, .fail => .coreDisfavored
    | .fail, .pass => .coreRelativeAdvantage
    | .fail, .fail => .bothFail
    | _, _ => .unscorable

theorem both_fail_is_not_relative_advantage :
    classify true true .fail .fail = .bothFail := rfl

theorem both_pass_is_non_discriminating :
    classify true true .pass .pass = .bothPass := rfl

theorem standard_pass_core_fail_is_directionally_adverse :
    classify true true .pass .fail = .coreDisfavored := rfl

theorem standard_fail_core_pass_is_only_relative_advantage :
    classify true true .fail .pass = .coreRelativeAdvantage := rfl

theorem cross_freeze_preempts_outcome :
    classify false true .fail .pass = .freezeMismatch := rfl

theorem same_version_preempts_outcome :
    classify true false .fail .pass = .sameModelVersion := rfl

theorem unscorable_does_not_become_relative_advantage :
    classify true true .unscorable .pass = .unscorable := rfl

end HsHVerification.DirectionalContrast
