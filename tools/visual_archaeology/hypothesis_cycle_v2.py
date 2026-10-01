#!/usr/bin/env python3
"""Visual-archaeology hypothesis/check loop v2.

Extends the original transparent classifier with user/source validation,
closed-set stylesheet controls, conservative website-resource admission,
and visual risk measurements.  Machine probabilities remain working
heuristics; they are never silently promoted to ground truth.
"""
from __future__ import annotations

import colorsys
import json
import math
from datetime import datetime, timezone
from pathlib import Path

from PIL import Image, ImageFilter

import hypothesis_cycle as base

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
DERIVED = HERE / "derived"
STATE_PATH = DERIVED / "model_state_v2.json"
REPORT_PATH = DERIVED / "latest_report_v2.md"
RESOURCE_PATH = DERIVED / "resource_candidates.json"
REVIEW_PATH = DERIVED / "review_sheet.html"


def load_manifest():
    return base.load_json(HERE / "sampling_manifest.json", {"items": []})


def _rgb_hsv(rgb):
    r, g, b = [x / 255.0 for x in rgb]
    h, s, v = colorsys.rgb_to_hsv(r, g, b)
    return h * 360.0, s, v


def advanced_features(path: Path):
    """Cheap deterministic measurements only; no OCR and no face identity model."""
    im = Image.open(path).convert("RGB")
    im.thumbnail((128, 128))
    pixels = list(im.getdata())
    n = max(1, len(pixels))

    skin_like = spotify_green = spotify_purple = 0
    hue_bins = set()
    gray = dark = light = 0
    for r, g, b in pixels:
        h, s, v = _rgb_hsv((r, g, b))
        if s < 0.12:
            gray += 1
        if v < 0.18:
            dark += 1
        if v > 0.82:
            light += 1
        if s > 0.18 and v > 0.12:
            hue_bins.add(int(h // 20))
        # Conservative visual-risk proxy, not a claim that a human is present.
        # Combining HSV with broad RGB relations intentionally over-flags some
        # orange/brown material so automatic website admission errs toward review.
        if (0 <= h <= 50 and 0.18 <= s <= 0.78 and 0.20 <= v <= 0.98
                and r > g * 0.92 and g > b * 0.75):
            skin_like += 1
        # Broad brand-color occupancy bands; text/layout evidence is required
        # before these can strongly identify Spotify/Creators screenshots.
        if 105 <= h <= 155 and s >= 0.45 and v >= 0.35:
            spotify_green += 1
        if 255 <= h <= 310 and s >= 0.35 and v >= 0.30:
            spotify_purple += 1

    # Edge-density proxy for text/list-heavy screenshots. This is deliberately
    # not OCR and cannot establish words by itself.
    edge = im.convert("L").resize((128, 128)).filter(ImageFilter.FIND_EDGES)
    ep = list(edge.getdata())
    edge_high = sum(x > 72 for x in ep) / max(1, len(ep))

    # Left-third horizontal banding proxy: episode-list screenshots often carry
    # alternating white/color thumbnail blocks. It is only weak layout evidence.
    w, h = im.size
    band_score = 0.0
    if w >= 12 and h >= 12:
        left = im.crop((0, 0, max(1, w // 3), h)).resize((32, 96))
        rows = []
        for y in range(96):
            row = [left.getpixel((x, y)) for x in range(32)]
            rows.append(sum(sum(px) / 3 for px in row) / (32 * 255))
        transitions = sum(abs(rows[i] - rows[i - 1]) > 0.18 for i in range(1, len(rows)))
        band_score = min(1.0, transitions / 12.0)

    diversity = len(hue_bins) / 18.0
    # Conservative palette-only photo risk. Abstract/generated art can trip this;
    # therefore it is a HOLD signal, never a semantic photograph label.
    photo_palette_risk = min(1.0, 0.55 * diversity + 0.45 * min(1.0, edge_high / 0.22))

    return {
        "skin_tone_like": round(skin_like / n, 4),
        "spotify_green": round(spotify_green / n, 4),
        "spotify_purple": round(spotify_purple / n, 4),
        "hue_diversity": round(diversity, 4),
        "text_density_proxy": round(edge_high, 4),
        "left_third_band_score": round(band_score, 4),
        "photo_palette_risk": round(photo_palette_risk, 4),
        "gray_v2": round(gray / n, 4),
        "dark_v2": round(dark / n, 4),
        "light_v2": round(light / n, 4),
    }


def sidecar_text(path: Path):
    candidates = [
        path.with_suffix(path.suffix + ".txt"),
        path.with_suffix(".txt"),
    ]
    chunks = []
    for p in candidates:
        if p.exists() and p.is_file():
            try:
                chunks.append(p.read_text(encoding="utf-8", errors="replace")[:50000])
            except OSError:
                pass
    return "\n".join(chunks)


def augment_live(observations, manifest):
    by_path = {x["path"]: x for x in manifest.get("items", [])}
    out = []
    for obs in observations:
        rec = by_path.get(obs.get("path"), {})
        p = ROOT / obs.get("path", "")
        extra = {}
        if p.exists() and p.is_file():
            try:
                extra = advanced_features(p)
            except Exception as exc:
                extra = {"advanced_feature_error": f"{type(exc).__name__}: {exc}"}
        labels = set(rec.get("human_labels", []))
        text_terms = [str(x) for x in rec.get("text_terms", [])]
        extracted = str(rec.get("extracted_text", ""))
        sidecar = sidecar_text(p) if p.exists() else ""
        obs.update(extra)
        obs.update({
            "validation": rec.get("validation", {}),
            "display_policy": rec.get("display_policy", "review"),
            "resource_candidate": bool(rec.get("resource_candidate", False)),
            "known_stylesheet": "podcast_stylesheet" in labels,
            "known_general_flavor": "general_flavor_candidate" in labels,
            "known_notebook_photo": "notebook_photo" in labels,
            "known_cosmology_concept": "cosmology_concept" in labels,
            "text_evidence": " ".join(text_terms + [extracted, sidecar]).strip(),
        })
        # Keep v1 names synchronized with the finer measurements where available.
        if "gray_v2" in extra:
            obs["gray"] = extra["gray_v2"]
            obs["dark"] = extra["dark_v2"]
            obs["light"] = extra["light_v2"]
        out.append(obs)
    return out


def add_defaults(obs):
    for k in ["skin_tone_like", "spotify_green", "spotify_purple", "hue_diversity",
              "text_density_proxy", "left_third_band_score", "photo_palette_risk"]:
        obs.setdefault(k, 0.0)
    obs.setdefault("validation", {})
    obs.setdefault("display_policy", "review")
    obs.setdefault("resource_candidate", False)
    obs.setdefault("known_stylesheet", False)
    obs.setdefault("known_general_flavor", False)
    obs.setdefault("known_notebook_photo", False)
    obs.setdefault("known_cosmology_concept", False)
    obs.setdefault("text_evidence", "")
    return obs


def resource_admission(obs, pred, previous):
    """Conservative candidate admission; never publishes an asset."""
    if obs.get("display_policy") == "never_display":
        return {"status": "NO_DISPLAY", "reasons": ["human/source display policy"]}

    reasons = []
    notebook_exception = bool(obs.get("known_notebook_photo"))
    skin = float(obs.get("skin_tone_like", 0.0) or 0.0)
    photo = float(obs.get("photo_palette_risk", 0.0) or 0.0)
    if skin >= 0.05 and not notebook_exception:
        reasons.append(f"skin-tone-like pixel fraction {skin:.3f} >= 0.05")
    if photo >= 0.72 and not notebook_exception:
        reasons.append(f"photographic-palette risk {photo:.3f} >= 0.72")
    if reasons:
        return {"status": "REVIEW_HOLD", "reasons": reasons}

    if not obs.get("resource_candidate"):
        return {"status": "NOT_REQUESTED", "reasons": ["not marked as a resource candidate"]}

    probs = pred.get("probabilities", {})
    role_p = max(probs.get("conceptual_illustration", 0.0), probs.get("podcast_thumbnail_background", 0.0))
    old = (previous or {}).get("predictions", {}).get(obs["image"], {})
    stable = old.get("best_guess") == pred.get("best_guess")
    fams = int(pred.get("evidence_family_count", 0))
    if role_p >= 0.90 and fams >= 2 and stable:
        return {"status": "AUTO_CANDIDATE", "reasons": [f"role p={role_p:.3f}", f"evidence families={fams}", "stable across runs"]}
    return {"status": "STAGING_CANDIDATE", "reasons": [f"role p={role_p:.3f}", f"evidence families={fams}", f"stable={stable}"]}


def report(state, observations, errors, admissions):
    lines = [
        "# Visual hypothesis-cycle v2 report", "",
        f"**Run:** {state['run_number']}  ",
        f"**UTC:** {state['run_utc']}  ",
        "**Status:** experimental; source labels and machine guesses are separate", "",
        "## Recon", "",
        f"- Images evaluated: **{len(state['predictions'])}**",
        f"- Explicit validation updates: **{len(state['validation_updates'])}**",
        f"- Guess changes versus prior v2 run: **{state['guess_changes']}**",
        f"- Stable repeated guesses: **{state['stable_guesses']}**",
        f"- Measurement skips/errors: **{len(errors)}**", "",
        "## Current best guesses", "",
        "| image | best guess | p | evidence families | resource gate |",
        "|---|---:|---:|---:|---|",
    ]
    for image, p in sorted(state["predictions"].items(), key=lambda kv: max(kv[1]["probabilities"].values()), reverse=True):
        prob = p["probabilities"][p["best_guess"]]
        gate = admissions.get(image, {}).get("status", "—")
        lines.append(f"| `{image}` | {p['best_guess']} | {prob:.3f} | {p['evidence_family_count']} | {gate} |")
    lines += ["", "## Sampling subsets", ""]
    for k, v in state["sampling_subsets"].items():
        lines.append(f"- `{k}`: {len(v)}")
    lines += ["", "## Resource-admission backstop", "",
              "`AUTO_CANDIDATE` means eligible for a later website-resource staging/promotion step; it does **not** publish the image. A >=5% skin-tone-like visual fraction or a strong photographic-palette risk forces review unless the source is explicitly a notebook-photo exception. Stylesheets are never display assets.", "",
              "## Epistemic guardrail", "",
              "Stable guesses and pseudo-correlations are internal consistency, not measured accuracy. Only explicit source/human validation updates rule reliability."]
    if errors:
        lines += ["", "## Measurement skips", ""]
        lines += [f"- `{e['path']}` — {e['error']}" for e in errors]
    return "\n".join(lines) + "\n"



def review_sheet(state, admissions):
    """Human-review surface: tiny thumbnails left, concise controls/stats right."""
    import html
    import urllib.parse

    subsets = state.get("sampling_subsets", {})
    priority = set(subsets.get("uncertain_margin", [])) | set(subsets.get("new_or_unstable", [])) | set(subsets.get("resource_review_holds", []))
    collision = set(subsets.get("square_technical_adversarial", []))
    controls = set(subsets.get("stylesheet_controls", []))

    def bucket(image):
        if image in priority: return (0, "NEEDS REVIEW")
        if image in collision: return (1, "COLLISION TEST")
        if image in controls: return (3, "STABLE CONTROL")
        return (2, "STABLE / OTHER")

    rows = []
    for image, pred in state["predictions"].items():
        # standalone: records are not repo paths and therefore cannot be rendered
        # from GitHub raw; retain their controls/stats without inventing a URL.
        repo_path = image if not image.startswith("standalone:") else None
        thumb = ""
        if repo_path:
            raw = "https://raw.githubusercontent.com/Satobloc/HsH/main/" + urllib.parse.quote(repo_path, safe="/")
            thumb = f'<a href="{html.escape(raw)}"><img loading="lazy" src="{html.escape(raw)}" alt=""></a>'
        else:
            thumb = '<span class="noimg">no repo preview</span>'
        guess = pred["best_guess"]
        p = float(pred["probabilities"].get(guess, 0.0))
        gate = admissions.get(image, {}).get("status", "—")
        group = bucket(image)
        rows.append((group, image, f"""<tr data-group="{group[1]}">
<td class="thumb">{thumb}</td>
<td><div class="name">{html.escape(image)}</div>
<div class="stats"><b>{html.escape(guess)}</b> · {p:.3f} · {pred.get("evidence_family_count", 0)} families · {html.escape(gate)}</div>
<div class="checks">
<label><input type="radio" name="accuracy:{html.escape(image)}"> correct</label>
<label><input type="radio" name="accuracy:{html.escape(image)}"> wrong</label>
<label><input type="radio" name="accuracy:{html.escape(image)}"> unsure</label><br>
<label><input type="radio" name="resource:{html.escape(image)}"> approve</label>
<label><input type="radio" name="resource:{html.escape(image)}"> hold</label>
<label><input type="radio" name="resource:{html.escape(image)}"> reject</label>
</div></td></tr>"""))

    rows.sort(key=lambda x: (x[0][0], -float(state["predictions"][x[1]]["probabilities"].get(state["predictions"][x[1]]["best_guess"], 0))))
    body = []
    last = None
    for group, image, row in rows:
        if group[1] != last:
            body.append(f'<tr class="section"><th colspan="2">{group[1]}</th></tr>')
            last = group[1]
        body.append(row)

    return """<!doctype html><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>HsH visual archaeology review</title>
<style>
body{font:14px system-ui,sans-serif;max-width:900px;margin:20px auto;padding:0 12px;color:#171717}
h1{font-size:20px;margin-bottom:4px}.note{font-size:12px;color:#555;margin-bottom:12px}
table{width:100%;border-collapse:collapse}td,th{border:1px solid #ccc;padding:7px;vertical-align:top}
.thumb{width:96px;text-align:center}.thumb img{width:88px;height:70px;object-fit:contain;display:block;margin:auto}
.noimg{font-size:10px;color:#888}.name{font:11px ui-monospace,monospace;overflow-wrap:anywhere}
.stats{margin:4px 0}.checks{line-height:1.7}.checks label{white-space:nowrap;margin-right:9px}
.section th{text-align:left;background:#eee;font-size:11px;letter-spacing:.06em}
@media(max-width:500px){.thumb{width:68px}.thumb img{width:60px;height:55px}body{font-size:12px}}
</style>
<h1>Visual archaeology — human review</h1>
<div class="note">Run """ + str(state["run_number"]) + """ · """ + html.escape(state["run_utc"]) + """ · Checkboxes are a review aid only until explicitly ingested; machine stability is not empirical accuracy.</div>
<table><tbody>""" + "\n".join(body) + """</tbody></table>
<script>
// Preserve an in-progress review locally without converting it into classifier evidence.
for(const el of document.querySelectorAll('input')){const k='hsh-va:'+el.name+':'+el.parentElement.textContent.trim();el.checked=localStorage.getItem(k)==='1';el.addEventListener('change',()=>{for(const peer of document.querySelectorAll('input[name="'+CSS.escape(el.name)+'"]')){const pk='hsh-va:'+peer.name+':'+peer.parentElement.textContent.trim();localStorage.setItem(pk,peer.checked?'1':'0')}})}
</script>"""


def main():
    config = base.load_json(HERE / "hypothesis_rules.json", {})
    manifest = load_manifest()
    cal = base.calibration_index()
    fam = base.family_index()
    seeds = [add_defaults(o) for o in base.seed_observations(cal, fam)]
    live, errors = base.live_observations()
    live = [add_defaults(o) for o in augment_live(live, manifest)]
    observations = seeds + live

    previous = base.load_json(STATE_PATH, {}) or {}
    reliability = previous.get("rule_reliability", {})
    for r in config.get("rules", []):
        reliability.setdefault(r["id"], {"alpha": 2.0, "beta": 2.0})

    preds = base.score_all(observations, config, reliability)
    round_log = []
    signals = []
    for i in range(1, 7):
        signals = base.learn_pseudo_correlations(observations, preds)
        nxt = base.score_all(observations, config, reliability, signals)
        changed = sum(nxt[k]["best_guess"] != preds[k]["best_guess"] for k in nxt)
        round_log.append({"round": i, "changed_best_guess": changed, "signals": signals})
        preds = nxt

    updates = base.validation_updates(observations, preds, reliability, config.get("rules", []))
    if updates:
        preds = base.score_all(observations, config, reliability, signals)

    old_preds = previous.get("predictions", {})
    guess_changes = sum(1 for k in preds if k in old_preds and old_preds[k].get("best_guess") != preds[k].get("best_guess"))
    stable = sum(1 for k in preds if k in old_preds and old_preds[k].get("best_guess") == preds[k].get("best_guess"))
    subsets = base.subsets(observations, preds, previous)
    subsets["stylesheet_controls"] = [o["image"] for o in observations if o.get("known_stylesheet")]
    subsets["resource_review_holds"] = []

    admissions = {}
    for o in observations:
        admissions[o["image"]] = resource_admission(o, preds[o["image"]], previous)
        if admissions[o["image"]]["status"] == "REVIEW_HOLD":
            subsets["resource_review_holds"].append(o["image"])

    run_number = int(previous.get("run_number", 0)) + 1
    state = {
        "schema_version": "0.2",
        "run_number": run_number,
        "run_utc": datetime.now(timezone.utc).isoformat(),
        "predictions": preds,
        "rule_reliability": reliability,
        "validation_updates": updates,
        "pseudo_correlation_signals": signals,
        "round_log": round_log,
        "sampling_subsets": subsets,
        "guess_changes": guess_changes,
        "stable_guesses": stable,
        "resource_admission": admissions,
        "notes": [
            "Machine probabilities are heuristic working scores, not empirical accuracy estimates.",
            "Stylesheet controls are source-validated but non-display.",
            "No OCR dependency: existing text sidecars or manifest text evidence are consumed when present."
        ],
    }
    DERIVED.mkdir(exist_ok=True)
    STATE_PATH.write_text(json.dumps(state, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    REPORT_PATH.write_text(report(state, observations, errors, admissions), encoding="utf-8")
    REVIEW_PATH.write_text(review_sheet(state, admissions), encoding="utf-8")
    RESOURCE_PATH.write_text(json.dumps({
        "generated_utc": state["run_utc"],
        "policy": "staging candidates only; no automatic publication",
        "items": [{"image": k, **v} for k, v in admissions.items() if v["status"] in {"AUTO_CANDIDATE", "STAGING_CANDIDATE", "REVIEW_HOLD"}],
    }, indent=2, sort_keys=True) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
