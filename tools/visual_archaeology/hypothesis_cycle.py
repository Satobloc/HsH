#!/usr/bin/env python3
"""Iterative, inspectable visual-hypothesis loop.

This is deliberately not a self-training semantic oracle.  It combines deterministic
measurements, transparent priors, source/human role labels, adversarial samples,
and bounded self-consistency checks.  Pseudo-labels never become ground truth.
"""
from __future__ import annotations

import json, math, statistics
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
DERIVED = HERE / "derived"
DERIVED.mkdir(exist_ok=True)

TECH_LABELS = {
    "model_diagram", "parameter_plot", "comparison_plot", "field_map",
    "simulation_random", "mock_method_demo", "research_process",
    "generated_visualization", "ui_screenshot", "project_infographic"
}
NUMERIC = ["gray", "red_magenta", "cyan_blue", "green", "warm", "lr_color_distance", "square_num"]


def load_json(path, default=None):
    p = Path(path)
    if not p.exists():
        return default
    return json.loads(p.read_text(encoding="utf-8"))


def sigmoid(x):
    if x >= 0:
        z = math.exp(-x); return 1 / (1 + z)
    z = math.exp(x); return z / (1 + z)


def calibration_index():
    out = {}
    p = HERE / "seed_calibration.jsonl"
    if not p.exists(): return out
    for line in p.read_text(encoding="utf-8").splitlines():
        if not line.strip(): continue
        try: rec = json.loads(line)
        except json.JSONDecodeError: continue
        out[rec.get("image", "")] = rec
    return out


def family_index():
    out = {}
    data = load_json(HERE / "known_families.json", {"families": []})
    for fam in data.get("families", []):
        for member in fam.get("members", []): out[member] = fam.get("family_id")
    return out


def flatten_analyzer(result, manifest_rec):
    f = result["features"]; whole = f["whole"]
    labels = set(manifest_rec.get("human_labels", []))
    return {
        "image": manifest_rec["path"], "path": manifest_rec["path"],
        "sha256": f.get("sha256"), "width": f.get("width"), "height": f.get("height"),
        "square": bool(f.get("square")), "square_num": 1.0 if f.get("square") else 0.0,
        "gray": whole.get("gray", 0.0), "dark": whole.get("dark", 0.0), "light": whole.get("light", 0.0),
        "red_magenta": whole.get("red_magenta", 0.0), "cyan_blue": whole.get("cyan_blue", 0.0),
        "green": whole.get("green", 0.0), "warm": whole.get("warm", 0.0),
        "lr_color_distance": f.get("lr_color_distance", 0.0),
        "known_technical": bool(labels & TECH_LABELS),
        "human_labels": sorted(labels), "human_note": manifest_rec.get("human_note"),
        "family_id": manifest_rec.get("family_id"), "measurement_source": "live_file"
    }


def seed_observations(cal, fam_index):
    data = load_json(HERE / "seed_measurements_2026-09-30.json", {"items": []})
    out = []
    for x in data.get("items", []):
        name = x["image"]; key = "standalone:" + name
        labels = set(cal.get(key, {}).get("labels", []))
        out.append({
            "image": key, "path": name,
            "width": x.get("width"), "height": x.get("height"),
            "square": bool(x.get("square")), "square_num": 1.0 if x.get("square") else 0.0,
            "gray": x.get("gray_fraction", 0.0), "dark": 0.0, "light": 0.0,
            "red_magenta": x.get("red_magenta", 0.0), "cyan_blue": x.get("cyan_blue", 0.0),
            "green": 0.0, "warm": 0.0, "lr_color_distance": x.get("lr_color_distance", 0.0),
            "known_technical": bool(labels & TECH_LABELS),
            "human_labels": sorted(labels), "human_note": cal.get(key, {}).get("notes"),
            "family_id": cal.get(key, {}).get("family_id") or fam_index.get(key),
            "measurement_source": "fixed_seed_2026-09-30"
        })
    return out


def live_observations():
    from visual_analyzer import analyze
    manifest = load_json(HERE / "sampling_manifest.json", {"items": []})
    out, errors = [], []
    for rec in manifest.get("items", []):
        p = ROOT / rec["path"]
        if not p.exists():
            errors.append({"path": rec["path"], "error": "missing in checkout"}); continue
        try: out.append(flatten_analyzer(analyze(p), rec))
        except Exception as e: errors.append({"path": rec["path"], "error": f"{type(e).__name__}: {e}"})
    return out, errors


def cond(obs, c):
    key, op, val = c; got = obs.get(key)
    if op == "eq": return got == val
    if op == "gte": return isinstance(got,(int,float)) and got >= val
    if op == "gt": return isinstance(got,(int,float)) and got > val
    if op == "lte": return isinstance(got,(int,float)) and got <= val
    if op == "lt": return isinstance(got,(int,float)) and got < val
    if op == "between": return isinstance(got,(int,float)) and val[0] <= got <= val[1]
    if op == "contains_any":
        text = str(got or "").lower(); return any(str(v).lower() in text for v in val)
    raise ValueError(f"unknown op {op}")


def match_rules(obs, rules):
    matched = []
    for r in rules:
        if any(req not in matched for req in r.get("requires", [])): continue
        if all(cond(obs, c) for c in r.get("all", [])): matched.append(r["id"])
    return matched


def score_all(obs_list, config, reliability, corr_signals=None):
    rules = config["rules"]; classes = config["classes"]
    by_id = {r["id"]: r for r in rules}; output = {}
    for obs in obs_list:
        matched = match_rules(obs, rules)
        logits = {k: v.get("base_logit", -2.0) for k,v in classes.items()}
        evidence = {k: [] for k in classes}
        for rid in matched:
            r = by_id[rid]; rel = reliability.get(rid, {"alpha":2.0,"beta":2.0})
            post = rel["alpha"]/(rel["alpha"]+rel["beta"])
            w = r["weight"] * (0.5 + post)
            logits[r["target"]] += w
            evidence[r["target"]].append({"rule":rid,"weight":round(w,4),"family":r.get("evidence_family")})
        for sig in corr_signals or []:
            if sig["target"] not in logits: continue
            val = obs.get(sig["feature"])
            if not isinstance(val,(int,float)): continue
            hit = val >= sig["cut"] if sig["direction"] == "high" else val <= sig["cut"]
            if hit:
                logits[sig["target"]] += sig["weight"]
                evidence[sig["target"]].append({"rule":"SELF_CONSISTENCY","weight":sig["weight"],"family":"pseudo-correlation","feature":sig["feature"]})
        probs = {k: sigmoid(v) for k,v in logits.items()}
        for child, meta in classes.items():
            parent = meta.get("parent")
            if parent: probs[child] = min(probs[child], probs[parent])
        best = max(probs, key=probs.get)
        fams = {e.get("family") for e in evidence[best] if e.get("family") and e.get("weight",0)>0}
        output[obs["image"]] = {
            "best_guess": best, "probabilities": {k:round(v,4) for k,v in probs.items()},
            "matched_rules": matched, "evidence": evidence,
            "independent_evidence_families": sorted(fams),
            "evidence_family_count": len(fams)
        }
    return output


def learn_pseudo_correlations(obs_list, preds):
    signals=[]
    for target in next(iter(preds.values()))["probabilities"] if preds else []:
        high=[o for o in obs_list if preds[o["image"]]["probabilities"][target] >= .67]
        rest=[o for o in obs_list if preds[o["image"]]["probabilities"][target] < .67]
        if len(high)<2 or len(rest)<2: continue
        for feat in NUMERIC:
            a=[float(o.get(feat,0.0)) for o in high]; b=[float(o.get(feat,0.0)) for o in rest]
            da=statistics.mean(a); db=statistics.mean(b); diff=da-db
            threshold=.22 if feat=="square_num" else .08
            if abs(diff)<threshold: continue
            signals.append({
                "target":target,"feature":feat,"direction":"high" if diff>0 else "low",
                "cut":round((da+db)/2,4),"weight":round(min(.12, max(.03, abs(diff)*.20)),4),
                "high_n":len(high),"rest_n":len(rest),"mean_delta":round(diff,4),
                "epistemic_status":"self-consistency only; not validation"
            })
    # keep strongest feature signal per class to stop self-reinforcement
    best={}
    for s in signals:
        if s["target"] not in best or abs(s["mean_delta"])>abs(best[s["target"]]["mean_delta"]): best[s["target"]]=s
    return list(best.values())


def subsets(obs_list, preds, previous):
    out={"all":[o["image"] for o in obs_list]}
    out["uncertain_margin"]=[o["image"] for o in obs_list if .38 <= max(preds[o["image"]]["probabilities"].values()) <= .70]
    out["square_technical_adversarial"]=[o["image"] for o in obs_list if o.get("square") and (o.get("known_technical") or any(t in o.get("path","").lower() for t in ["output","chart","plot","viz","figure"]))]
    out["metadata_positive"]=[o["image"] for o in obs_list if any(t in o.get("path","").lower() for t in ["podcast","episode","thumbnail"])]
    out["palette_lineage"]=[o["image"] for o in obs_list if o.get("square") and o.get("gray",0)>=.60 and o.get("red_magenta",0)>=.01]
    seen=set(); fb=[]
    for o in obs_list:
        fam=o.get("family_id") or o["image"]
        if fam not in seen: seen.add(fam); fb.append(o["image"])
    out["family_blocked"]=fb
    old=(previous or {}).get("predictions",{})
    out["new_or_unstable"]=[o["image"] for o in obs_list if o["image"] not in old or old[o["image"]].get("best_guess") != preds[o["image"]]["best_guess"]]
    return out


def validation_updates(obs_list, preds, reliability, rules):
    # Only explicit validation fields may update rule accuracy. Human descriptive labels
    # and pseudo-labels are intentionally insufficient.
    by_id={r["id"]:r for r in rules}; changed=[]
    for o in obs_list:
        truth=o.get("validation") or {}
        if not truth: continue
        matched=set(preds[o["image"]]["matched_rules"])
        for rid in matched:
            target=by_id[rid]["target"]
            if target not in truth: continue
            reliability.setdefault(rid,{"alpha":2.0,"beta":2.0})
            if truth[target] is True: reliability[rid]["alpha"]+=1; verdict="support"
            elif truth[target] is False: reliability[rid]["beta"]+=1; verdict="contradict"
            else: continue
            changed.append({"image":o["image"],"rule":rid,"verdict":verdict})
    return changed


def make_report(state, errors):
    lines=["# Visual hypothesis-cycle report","",f"**Run:** {state['run_number']}  ",f"**UTC:** {state['run_utc']}  ","**Status:** experimental / pseudo-labels are not ground truth","",
           "## What changed",""]
    lines.append(f"- Images evaluated: **{len(state['predictions'])}**")
    lines.append(f"- Explicit validation updates this run: **{len(state['validation_updates'])}**")
    lines.append(f"- Bounded pseudo-correlation signals used in the last round: **{len(state['pseudo_correlation_signals'])}**")
    lines.append(f"- Guess changes versus prior run: **{state['guess_changes']}**")
    lines.append(f"- Stable repeated guesses: **{state['stable_guesses']}** (stability is not empirical accuracy)")
    if errors: lines.append(f"- Measurement skips/errors: **{len(errors)}**")
    lines += ["","## Current best guesses","","| image | best guess | p | evidence families |", "|---|---:|---:|---:|"]
    for image,p in sorted(state["predictions"].items(), key=lambda kv:max(kv[1]["probabilities"].values()), reverse=True):
        prob=p["probabilities"][p["best_guess"]]
        lines.append(f"| `{image}` | {p['best_guess']} | {prob:.3f} | {p['evidence_family_count']} |")
    lines += ["","## Sampling subsets",""]
    for k,v in state["sampling_subsets"].items(): lines.append(f"- `{k}`: {len(v)}")
    lines += ["","## Guardrail", "", "The loop may become more internally consistent as independent cues converge, but without explicit validated labels it cannot honestly claim improving classification accuracy. Repeated stability, pseudo-correlations and higher heuristic probability are reported separately from empirical validation."]
    if errors:
        lines += ["","## Measurement skips","",* [f"- `{e['path']}` — {e['error']}" for e in errors]]
    return "\n".join(lines)+"\n"


def main():
    config=load_json(HERE/"hypothesis_rules.json",{})
    cal=calibration_index(); fam=family_index()
    observations=seed_observations(cal,fam)
    live, errors=live_observations(); observations.extend(live)
    previous=load_json(DERIVED/"model_state.json",{}) or {}
    reliability=previous.get("rule_reliability",{})
    for r in config.get("rules",[]): reliability.setdefault(r["id"],{"alpha":2.0,"beta":2.0})

    preds=score_all(observations,config,reliability)
    round_log=[]; signals=[]
    for i in range(1,7):
        signals=learn_pseudo_correlations(observations,preds)
        nxt=score_all(observations,config,reliability,signals)
        changed=sum(nxt[k]["best_guess"]!=preds[k]["best_guess"] for k in nxt)
        round_log.append({"round":i,"changed_best_guess":changed,"signals":signals})
        preds=nxt
    updates=validation_updates(observations,preds,reliability,config.get("rules",[]))
    if updates: preds=score_all(observations,config,reliability,signals)

    old=previous.get("predictions",{})
    guess_changes=sum(k in old and old[k].get("best_guess")!=v["best_guess"] for k,v in preds.items())
    stable=sum(k in old and old[k].get("best_guess")==v["best_guess"] for k,v in preds.items())
    state={
        "schema_version":"0.1","run_number":int(previous.get("run_number",0))+1,
        "run_utc":datetime.now(timezone.utc).isoformat(),
        "model":"transparent nested priors + bounded pseudo-correlation + explicit-validation beta updates",
        "prediction_semantics":"heuristic probability, not calibrated posterior probability",
        "observations":observations,"predictions":preds,"rule_reliability":reliability,
        "validation_updates":updates,"pseudo_correlation_signals":signals,
        "round_log":round_log,"sampling_subsets":subsets(observations,preds,previous),
        "guess_changes":guess_changes,"stable_guesses":stable,"measurement_errors":errors
    }
    (DERIVED/"model_state.json").write_text(json.dumps(state,indent=2,ensure_ascii=False)+"\n",encoding="utf-8")
    (DERIVED/"latest_report.md").write_text(make_report(state,errors),encoding="utf-8")
    hist=DERIVED/"run_history.jsonl"
    with hist.open("a",encoding="utf-8") as fh:
        fh.write(json.dumps({"run_number":state["run_number"],"run_utc":state["run_utc"],"images":len(preds),"guess_changes":guess_changes,"stable_guesses":stable,"validation_updates":len(updates),"measurement_errors":len(errors)},ensure_ascii=False)+"\n")
    print(f"visual hypothesis run {state['run_number']}: {len(preds)} images, {guess_changes} changed guesses, {len(errors)} errors")

if __name__ == "__main__": main()
