#!/usr/bin/env python3
"""Semantics-aware extension of Mercer's cross-source integrity validator.

This is a read-only transition wrapper. It preserves the established validator's
non-Viewer checks while replacing the Viewer acceptance/external/manifest join
checks that predate production resolved-input + exact-path dedup semantics.
"""
from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path
from typing import Any

import validate_cross_source_integrity as base
from viewer_input_semantics import reconstruct

REPLACED = {
    "viewer.accepted_input_arithmetic",
    "viewer.external_registry_reconciliation",
    "viewer.manifest_record_reconciliation",
}


def _load_payload(root: Path, rel: str) -> dict[str, Any]:
    payload, err = base.load(root, rel)
    if err or not isinstance(payload, dict):
        raise ValueError(err or f"{rel}: top-level JSON is not an object")
    return payload


def validate(root: Path) -> dict[str, Any]:
    report = base.validate(root)
    checks = [c for c in report["checks"] if c.get("check_id") not in REPLACED]
    viewer_rel = "CONVERSATION_VIEWER/data/conversations.json"
    viewer, err = base.load(root, viewer_rel)
    if err or not isinstance(viewer, dict):
        # Base validator already reports the load failure; do not manufacture a second diagnosis.
        report["checks"] = checks
        return _finish(report)

    try:
        sem = reconstruct(root, viewer, lambda rel: _load_payload(root, rel))
    except Exception as exc:
        checks.append(base.result(
            "viewer.resolved_input_reconstruction", "FAIL", viewer_rel,
            f"{viewer_rel}:inputs", "Viewer-declared input payloads",
            {"error": str(exc)},
            "Production resolved-input semantics could not be reconstructed.",
        ))
        report["checks"] = checks
        return _finish(report)

    declared = sem["declared_accepted_total"]
    rebuilt = sem["reconstructed_accepted_total"]
    missing = sem["missing_declared_acceptance"]
    checks.append(base.result(
        "viewer.accepted_input_reconstruction",
        "UNKNOWN" if missing else ("PASS" if declared == rebuilt else "FAIL"),
        viewer_rel, f"{viewer_rel}:inputs[*].accepted*", "resolved existing-source reconstruction",
        {"declared_accepted_total": declared, "reconstructed_accepted_total": rebuilt,
         "missing_declared_acceptance": missing,
         "declared_parts": sem["declared_parts"]},
        "Compares Viewer-declared pre-dedup acceptance with the production resolved existing-source reconstruction.",
    ))

    counts = viewer.get("counts", {}) if isinstance(viewer.get("counts"), dict) else {}
    source_before = counts.get("source_conversations_before_curation")
    post = sem["post_dedup_total"]
    checks.append(base.result(
        "viewer.post_dedup_cardinality",
        "UNKNOWN" if not isinstance(source_before, int) else ("PASS" if source_before == post else "FAIL"),
        viewer_rel, "resolved accepted inputs after exact-path precedence",
        f"{viewer_rel}:counts.source_conversations_before_curation",
        {"reconstructed_post_dedup_total": post,
         "source_conversations_before_curation": source_before,
         "duplicate_path_count": len(sem["duplicate_paths"]),
         "duplicate_paths": [{"path": d["path"],
                              "input_count": len(d["inputs"]),
                              "winner": {k: d["winner"].get(k) for k in
                                         ("source", "source_kind", "source_index", "corpus", "status", "resolved_from")}}
                             for d in sem["duplicate_paths"]]},
        "Compares post-dedup Viewer cardinality with the same exact-path winner rule used by production navigation.",
    ))

    conversations = viewer.get("conversations", []) if isinstance(viewer.get("conversations"), list) else []
    viewer_by_path = {c.get("path"): c for c in conversations
                      if isinstance(c, dict) and isinstance(c.get("path"), str)}
    winner_by_path = sem["winners"]
    missing_paths, mismatched = [], []
    for path, winner in winner_by_path.items():
        current = viewer_by_path.get(path)
        if current is None:
            missing_paths.append(path)
            continue
        if current.get("corpus") != winner.get("corpus") or current.get("message_count") != winner.get("message_count"):
            mismatched.append({
                "path": path,
                "winner_corpus": winner.get("corpus"), "viewer_corpus": current.get("corpus"),
                "winner_message_count": winner.get("message_count"),
                "viewer_message_count": current.get("message_count"),
                "winner_source": winner.get("source"), "winner_source_index": winner.get("source_index"),
            })
    extra_paths = sorted(set(viewer_by_path) - set(winner_by_path))
    checks.append(base.result(
        "viewer.resolved_winner_reconciliation",
        "FAIL" if missing_paths or mismatched or extra_paths else "PASS",
        viewer_rel, "resolved input winners", f"{viewer_rel}:conversations[]",
        {"winner_records": len(winner_by_path), "viewer_records": len(viewer_by_path),
         "missing_from_viewer": missing_paths, "extra_in_viewer": extra_paths,
         "mismatched": mismatched},
        "Reconciles the final Viewer against resolved winner provenance, including Viewer-declared external inputs and exact-path precedence.",
    ))

    external_inputs = [i for i in viewer.get("inputs", [])
                       if isinstance(i, dict) and i.get("corpus") == "registered-external"]
    external_sources = {i.get("path") for i in external_inputs if isinstance(i.get("path"), str)}
    external_winners = [w for w in winner_by_path.values() if w.get("source") in external_sources]
    checks.append(base.result(
        "viewer.external_input_lineage", "PASS", viewer_rel,
        f"{viewer_rel}:inputs[corpus=registered-external]", "resolved winner provenance",
        {"declared_external_inputs": sorted(external_sources),
         "surviving_external_winners": len(external_winners),
         "surviving_paths": sorted(w["path"] for w in external_winners)},
        "Uses the external registry declared by the Viewer generation rather than a hard-coded legacy registry path.",
    ))

    report["checks"] = checks
    return _finish(report)


def _finish(report: dict[str, Any]) -> dict[str, Any]:
    severity_counts = Counter(item["severity"] for item in report["checks"])
    report["severity_counts"] = dict(severity_counts)
    report["overall"] = max((item["severity"] for item in report["checks"]),
                            key=lambda s: base.ORDER[s], default="UNKNOWN")
    report["schema_version"] = 2
    report["viewer_semantics"] = "production-resolved-existing-source-v1"
    return report


def main() -> int:
    here = Path(__file__).resolve()
    default_root = here.parents[2] if len(here.parents) >= 3 else Path.cwd()
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=default_root)
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--md-out", type=Path)
    parser.add_argument("--fail-on-fail", action="store_true")
    args = parser.parse_args()
    root = args.repo_root.resolve()
    report = validate(root)
    text = base.markdown(report)
    if args.json_out:
        path = args.json_out if args.json_out.is_absolute() else root / args.json_out
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(report, indent=2, ensure_ascii=False, sort_keys=True) + "\n", encoding="utf-8")
    if args.md_out:
        path = args.md_out if args.md_out.is_absolute() else root / args.md_out
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
    if not args.json_out and not args.md_out:
        print(text)
    if args.fail_on_fail and any(item["severity"] == "FAIL" for item in report["checks"]):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
