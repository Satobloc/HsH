#!/usr/bin/env python3
"""Render a compact, thumbnail-first GitHub-native human review sheet.

The classifier's durable state remains authoritative for the hypothesis cycle.  This
renderer also adds a deterministic, broader *review-only* coverage sample from
repository images so Nathan can inspect far more than the small calibrated set
without silently promoting those extra images into empirical validation or model
state.
"""
from __future__ import annotations

import hashlib
import json
import urllib.parse
from pathlib import Path

import hypothesis_cycle as base
import hypothesis_cycle_v2 as v2
from visual_analyzer import analyze

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
STATE = HERE / "derived" / "model_state_v2.json"
OUT = HERE / "derived" / "review_sheet.md"
RAW_ROOT = "https://raw.githubusercontent.com/Satobloc/HsH/main/"
COVERAGE_LIMIT = 96
IMAGE_SUFFIXES = {".png", ".jpg", ".jpeg", ".webp"}
COVERAGE_ROOTS = [ROOT / "DEVELOPMENT_FULL_CONVOS", ROOT / "SAT_VISUALS"]


def raw_url(image: str) -> str | None:
    if image.startswith("standalone:"):
        return None
    return RAW_ROOT + urllib.parse.quote(image, safe="/")


def thumb(image: str, width: int = 108) -> str:
    url = raw_url(image)
    if not url:
        return "*no repo preview*"
    return f'<a href="{url}"><img src="{url}" width="{width}"></a>'


def short_path(image: str) -> str:
    if image.startswith("standalone:"):
        return image.removeprefix("standalone:")
    p = Path(image)
    return "/".join(p.parts[-2:]) if len(p.parts) > 1 else p.name


def manifest_map() -> dict[str, dict]:
    data = base.load_json(HERE / "sampling_manifest.json", {"items": []}) or {"items": []}
    return {x.get("path", ""): x for x in data.get("items", []) if x.get("path")}


def feature_record(image: str, rec: dict | None = None) -> dict:
    """Measure a repo-backed image for display only; never mutates classifier state."""
    if image.startswith("standalone:"):
        return {}
    p = ROOT / image
    if not p.exists() or not p.is_file():
        return {}
    rec = dict(rec or {"path": image})
    rec.setdefault("path", image)
    try:
        obs = base.flatten_analyzer(analyze(p), rec)
        obs = v2.augment_live([obs], {"items": [rec]})[0]
        return v2.add_defaults(obs)
    except Exception as exc:
        return {"display_measurement_error": f"{type(exc).__name__}: {exc}"}


def shape_label(obs: dict) -> str:
    w, h = obs.get("width"), obs.get("height")
    if not isinstance(w, (int, float)) or not isinstance(h, (int, float)) or not h:
        return "shape ?"
    if abs(w - h) / max(w, h) <= 0.04:
        shape = "square"
    elif w > h:
        shape = "landscape"
    else:
        shape = "portrait"
    return f"{int(w)}×{int(h)} {shape}"


def pct(obs: dict, key: str) -> str:
    val = obs.get(key)
    return "?" if not isinstance(val, (int, float)) else f"{100 * float(val):.0f}%"


def tests_line(obs: dict) -> str:
    if not obs:
        return "measurements unavailable"
    if obs.get("display_measurement_error"):
        return f"measurement error: {obs['display_measurement_error']}"
    bits = [
        shape_label(obs),
        f"gray {pct(obs, 'gray')}",
        f"red/magenta {pct(obs, 'red_magenta')}",
        f"cyan/blue {pct(obs, 'cyan_blue')}",
        f"warm {pct(obs, 'warm')}",
    ]
    if isinstance(obs.get("text_density_proxy"), (int, float)):
        bits.append(f"text-density {float(obs['text_density_proxy']):.2f}")
    if isinstance(obs.get("photo_palette_risk"), (int, float)):
        bits.append(f"photo-risk {float(obs['photo_palette_risk']):.2f}")
    return " / ".join(bits)


def category_hint(rec: dict | None) -> str:
    labels = list((rec or {}).get("human_labels", []))
    if not labels:
        return "[? Category]"
    useful = [x for x in labels if x not in {"generated_visualization", "closed_set_control", "training_only"}]
    useful = useful or labels
    return "[" + ", ".join(useful[:3]) + (", …" if len(useful) > 3 else "") + "]"


def top_guesses(pred: dict, n: int = 3) -> str:
    probs = pred.get("probabilities", {})
    ranked = sorted(probs.items(), key=lambda kv: float(kv[1]), reverse=True)[:n]
    return " / ".join(f"{name} {float(p):.3f}" for name, p in ranked) or "—"


def review_cell(image: str, pred: dict, obs: dict, admissions: dict, rec: dict | None, review_only: bool = False) -> str:
    guess = pred.get("best_guess", "—")
    p = float(pred.get("probabilities", {}).get(guess, 0.0)) if guess != "—" else 0.0
    fams = int(pred.get("evidence_family_count", 0))
    gate = admissions.get(image, {}).get("status", "REVIEW_ONLY" if review_only else "—")
    rules = ", ".join(pred.get("matched_rules", [])[:8]) or "none"
    source_note = (rec or {}).get("human_note")
    parts = [
        f"**{short_path(image)} {category_hint(rec)}**",
        f"**Tests:** {tests_line(obs)}",
        f"**Guess:** {guess} **{p:.3f}** · {fams} evidence families · `{gate}`",
        f"**Top 3:** {top_guesses(pred)}",
        f"**Rules:** {rules}",
    ]
    if source_note:
        note = " ".join(str(source_note).split())
        parts.append(f"**Source note:** {note[:260]}{'…' if len(note) > 260 else ''}")
    if review_only:
        parts.append("*Coverage sample only — not added to classifier state or validation.*")
    parts.append("☐ Correct · ☐ Wrong · ☐ Unsure &nbsp;&nbsp; ☐ Approve · ☐ Hold · ☐ Reject")
    return "<br>".join(parts)


def bucket(image: str, subsets: dict) -> tuple[int, str]:
    priority = set(subsets.get("uncertain_margin", [])) | set(subsets.get("new_or_unstable", [])) | set(subsets.get("resource_review_holds", []))
    collision = set(subsets.get("square_technical_adversarial", []))
    controls = set(subsets.get("stylesheet_controls", []))
    if image in priority:
        return 0, "Needs review"
    if image in collision:
        return 1, "Collision tests"
    if image in controls:
        return 3, "Stable controls"
    return 2, "Calibrated / stable set"


def discover_coverage(existing: set[str], limit: int = COVERAGE_LIMIT) -> list[str]:
    """Deterministic broad sample: stable hash order avoids directory clustering."""
    candidates = []
    for root in COVERAGE_ROOTS:
        if not root.exists():
            continue
        for p in root.rglob("*"):
            if not p.is_file() or p.suffix.lower() not in IMAGE_SUFFIXES:
                continue
            rel = p.relative_to(ROOT).as_posix()
            if rel in existing:
                continue
            if "/derived/" in rel or rel.startswith("tools/"):
                continue
            key = hashlib.sha256(rel.encode("utf-8")).hexdigest()
            candidates.append((key, rel))
    candidates.sort()
    return [rel for _, rel in candidates[:limit]]


def classify_review_only(images: list[str], state: dict, manifest: dict[str, dict]) -> tuple[dict, dict]:
    config = base.load_json(HERE / "hypothesis_rules.json", {}) or {}
    reliability = state.get("rule_reliability", {})
    signals = state.get("pseudo_correlation_signals", [])
    preds, obs_index = {}, {}
    for image in images:
        rec = manifest.get(image, {"path": image})
        obs = feature_record(image, rec)
        if not obs or obs.get("display_measurement_error"):
            obs_index[image] = obs
            continue
        pred = base.score_all([obs], config, reliability, signals).get(image)
        if pred:
            preds[image] = pred
        obs_index[image] = obs
    return preds, obs_index


def append_group(lines: list[str], title: str, rows: list[tuple[str, dict, dict, dict | None, bool]], admissions: dict) -> None:
    if not rows:
        return
    lines += [f"## {title}", "", "| Thumbnail | Review / measurements / guesses |", "|---|---|"]
    for image, pred, obs, rec, review_only in rows:
        lines.append(f"| {thumb(image)} | {review_cell(image, pred, obs, admissions, rec, review_only)} |")
    lines.append("")


def main() -> None:
    state = json.loads(STATE.read_text(encoding="utf-8"))
    predictions = state.get("predictions", {})
    admissions = state.get("resource_admission", {})
    subsets = state.get("sampling_subsets", {})
    manifest = manifest_map()

    measured: dict[str, dict] = {}
    grouped: dict[str, list[tuple[str, dict, dict, dict | None, bool]]] = {}
    order: dict[str, int] = {}
    for image, pred in predictions.items():
        rank, label = bucket(image, subsets)
        order[label] = rank
        rec = manifest.get(image)
        obs = feature_record(image, rec)
        measured[image] = obs
        grouped.setdefault(label, []).append((image, pred, obs, rec, False))

    coverage_images = discover_coverage(set(predictions), COVERAGE_LIMIT)
    coverage_preds, coverage_obs = classify_review_only(coverage_images, state, manifest)
    coverage_rows = [
        (image, coverage_preds[image], coverage_obs.get(image, {}), manifest.get(image), True)
        for image in coverage_images if image in coverage_preds
    ]

    lines = [
        "# Visual archaeology — thumbnail review",
        "",
        f"**Run {state.get('run_number', '—')} · {state.get('run_utc', '—')}**  ",
        f"**Classifier set:** {len(predictions)} images · **broad review-only sample:** {len(coverage_rows)} additional repo images.",
        "",
        "The left column is the object; the right column is the compact inspection record. Machine confidence and repeated pseudo-label stability are not empirical accuracy. The broad sample is deliberately review-only and cannot update validation merely by appearing here.",
        "",
    ]

    for label in sorted(grouped, key=lambda k: order[k]):
        rows = sorted(
            grouped[label],
            key=lambda x: float(x[1].get("probabilities", {}).get(x[1].get("best_guess", ""), 0.0)),
            reverse=True,
        )
        append_group(lines, label, rows, admissions)

    append_group(lines, "Broad coverage sample — not classifier state", coverage_rows, admissions)

    lines += [
        "## Reading the checkboxes",
        "",
        "`Correct / Wrong / Unsure` is classification review. `Approve / Hold / Reject` is resource/display review. A checked decision only becomes empirical evidence after it is explicitly ingested into the calibration record; the renderer itself never promotes it.",
        "",
    ]
    OUT.write_text("\n".join(lines), encoding="utf-8")


if __name__ == "__main__":
    main()
