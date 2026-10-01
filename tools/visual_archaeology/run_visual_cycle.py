#!/usr/bin/env python3
"""Entry point for visual archaeology v2 with signed-rule validation semantics."""
from __future__ import annotations

import json
from pathlib import Path

import hypothesis_cycle as base
import hypothesis_cycle_v2 as v2

HERE = Path(__file__).resolve().parent
DERIVED = HERE / "derived"
STATE = DERIVED / "model_state_v2.json"
MARKER = DERIVED / "signed_validation_v1.marker"
RULES = HERE / "hypothesis_rules.json"


def signed_validation_updates(obs_list, preds, reliability, rules):
    """Update reliability according to the sign of a rule's contribution.

    A positive-weight rule is supported by truth=True; a negative-weight rule is
    supported by truth=False.  This fixes the v1 updater's positive-only assumption.
    """
    by_id = {r["id"]: r for r in rules}
    changed = []
    for o in obs_list:
        truth = o.get("validation") or {}
        if not truth:
            continue
        matched = set(preds[o["image"]]["matched_rules"])
        for rid in matched:
            rule = by_id[rid]
            target = rule["target"]
            if target not in truth or truth[target] not in (True, False):
                continue
            weight = float(rule.get("weight", 0.0))
            if weight == 0:
                continue
            supports = (truth[target] is True and weight > 0) or (truth[target] is False and weight < 0)
            reliability.setdefault(rid, {"alpha": 2.0, "beta": 2.0})
            if supports:
                reliability[rid]["alpha"] += 1
                verdict = "support"
            else:
                reliability[rid]["beta"] += 1
                verdict = "contradict"
            changed.append({
                "image": o["image"],
                "rule": rid,
                "target": target,
                "truth": truth[target],
                "weight_sign": "positive" if weight > 0 else "negative",
                "verdict": verdict,
            })
    return changed


def migrate_bad_negative_reliability_once():
    """Clear negative-rule reliability learned under the old unsigned updater once."""
    if MARKER.exists() or not STATE.exists():
        return
    try:
        state = json.loads(STATE.read_text(encoding="utf-8"))
        rules = json.loads(RULES.read_text(encoding="utf-8")).get("rules", [])
    except (OSError, json.JSONDecodeError):
        return
    neg = {r["id"] for r in rules if float(r.get("weight", 0.0)) < 0}
    rel = state.setdefault("rule_reliability", {})
    reset = []
    for rid in neg:
        if rid in rel:
            rel[rid] = {"alpha": 2.0, "beta": 2.0}
            reset.append(rid)
    state.setdefault("migration_notes", []).append({
        "migration": "signed_validation_v1",
        "reset_negative_rule_reliability": sorted(reset),
        "reason": "previous updater treated all matched rules as positive assertions"
    })
    STATE.write_text(json.dumps(state, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main():
    DERIVED.mkdir(exist_ok=True)
    migrate_bad_negative_reliability_once()
    base.validation_updates = signed_validation_updates
    v2.main()
    if not MARKER.exists():
        MARKER.write_text(
            "signed validation v1 active; negative-rule legacy reliability reset before first corrected run\n",
            encoding="utf-8",
        )


if __name__ == "__main__":
    main()
