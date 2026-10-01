#!/usr/bin/env python3
"""Render the visual-archaeology state as GitHub-native Markdown.

The Markdown sheet is the durable human-review surface because GitHub renders it
in the blob view.  The HTML sheet remains an optional browser-served surface;
GitHub intentionally displays repository .html blobs as source.
"""
from __future__ import annotations

import json
import urllib.parse
from pathlib import Path

HERE = Path(__file__).resolve().parent
STATE = HERE / "derived" / "model_state_v2.json"
OUT = HERE / "derived" / "review_sheet.md"
RAW_ROOT = "https://raw.githubusercontent.com/Satobloc/HsH/main/"


def thumb(image: str) -> str:
    if image.startswith("standalone:"):
        return "*no repo preview*"
    url = RAW_ROOT + urllib.parse.quote(image, safe="/")
    return f'<a href="{url}"><img src="{url}" width="96"></a>'


def bucket(image: str, subsets: dict) -> tuple[int, str]:
    priority = set(subsets.get("uncertain_margin", [])) | set(subsets.get("new_or_unstable", [])) | set(subsets.get("resource_review_holds", []))
    collision = set(subsets.get("square_technical_adversarial", []))
    controls = set(subsets.get("stylesheet_controls", []))
    if image in priority:
        return 0, "Needs review"
    if image in collision:
        return 1, "Collision test"
    if image in controls:
        return 3, "Stable controls"
    return 2, "Stable / other"


def review_cell(image: str, pred: dict, admissions: dict) -> str:
    guess = pred["best_guess"]
    p = float(pred.get("probabilities", {}).get(guess, 0.0))
    fams = int(pred.get("evidence_family_count", 0))
    gate = admissions.get(image, {}).get("status", "—")
    family_word = "family" if fams == 1 else "families"
    return (
        f"`{image}`<br>**{guess} · {p:.3f}** · {fams} {family_word} · `{gate}`<br>"
        "☐ Correct · ☐ Wrong · ☐ Unsure<br>☐ Approve · ☐ Hold · ☐ Reject"
    )


def main() -> None:
    state = json.loads(STATE.read_text(encoding="utf-8"))
    predictions = state.get("predictions", {})
    admissions = state.get("resource_admission", {})
    subsets = state.get("sampling_subsets", {})

    grouped: dict[str, list[tuple[str, dict]]] = {}
    order: dict[str, int] = {}
    for image, pred in predictions.items():
        rank, label = bucket(image, subsets)
        order[label] = rank
        grouped.setdefault(label, []).append((image, pred))

    lines = [
        "# Visual archaeology — human review",
        "",
        f"**Run {state.get('run_number', '—')} · {state.get('run_utc', '—')}**  ",
        "Primary human-review surface. Machine confidence is heuristic; repeated pseudo-label stability is not empirical accuracy.",
        "",
        "> Review marks in this repository file are display/edit aids. A human choice becomes empirical validation only when it is explicitly ingested into the calibration record.",
        "",
    ]

    for label in sorted(grouped, key=lambda k: order[k]):
        lines += [f"## {label}", "", "| Thumbnail | Review / stats |", "|---|---|"]
        rows = sorted(
            grouped[label],
            key=lambda kv: float(kv[1].get("probabilities", {}).get(kv[1].get("best_guess", ""), 0.0)),
            reverse=True,
        )
        for image, pred in rows:
            lines.append(f"| {thumb(image)} | {review_cell(image, pred, admissions)} |")
        lines.append("")

    OUT.write_text("\n".join(lines), encoding="utf-8")


if __name__ == "__main__":
    main()
