#!/usr/bin/env python3
"""Read-only integrity checks across existing HsH metadata surfaces.

Consumes generated metadata only. It does not parse raw conversation bodies, mutate
sources, or infer authorship/theory authority. Results use
PASS/WARN/BLOCKED/FAIL/UNKNOWN and can be emitted as JSON plus compact Markdown.
"""
from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

ORDER = {"PASS": 0, "UNKNOWN": 1, "WARN": 2, "BLOCKED": 3, "FAIL": 4}


def load(root: Path, rel: str) -> tuple[Any, str | None]:
    path = root / rel
    if not path.exists():
        return None, f"missing file: {rel}"
    try:
        return json.loads(path.read_text(encoding="utf-8")), None
    except Exception as exc:
        return None, f"cannot parse {rel}: {exc}"


def result(check_id: str, severity: str, subject: str | None, left: str | None,
           right: str | None, compared: dict[str, Any], note: str,
           warnings: list[str] | None = None) -> dict[str, Any]:
    out = {
        "check_id": check_id,
        "severity": severity,
        "subject_path": subject,
        "left_surface": left,
        "right_surface": right,
        "compared": compared,
        "note": note,
    }
    if warnings:
        out["warnings"] = warnings
    return out


def load_failure(checks: list[dict[str, Any]], rel: str, err: str) -> None:
    checks.append(result(
        f"input.load.{rel}", "FAIL", rel, rel, None, {"error": err},
        "Expected machine-readable input could not be loaded.",
    ))


def accepted(inp: dict[str, Any]) -> int | None:
    for key in ("accepted_json_conversations", "accepted_conversations"):
        value = inp.get(key)
        if isinstance(value, int):
            return value
    return None


def audit_manifest(root: Path, rel: str, checks: list[dict[str, Any]]) -> dict[str, Any] | None:
    data, err = load(root, rel)
    if err or not isinstance(data, dict):
        load_failure(checks, rel, err or "top-level JSON is not an object")
        return None
    records, summary = data.get("records"), data.get("summary")
    if not isinstance(records, list) or not isinstance(summary, dict):
        checks.append(result(
            f"manifest.schema.{rel}", "FAIL", rel, rel, None,
            {"records_type": type(records).__name__, "summary_type": type(summary).__name__},
            "Manifest must expose records[] and summary{}.",
        ))
        return data

    observed = Counter(r.get("status") for r in records if isinstance(r, dict))
    declared = {str(k): v for k, v in summary.items() if isinstance(v, int)}
    mismatches = {
        key: {"observed": observed.get(key, 0), "declared": declared.get(key, 0)}
        for key in sorted(set(observed) | set(declared))
        if observed.get(key, 0) != declared.get(key, 0)
    }
    checks.append(result(
        f"manifest.status_arithmetic.{rel}", "FAIL" if mismatches else "PASS", rel,
        f"{rel}:records[].status", f"{rel}:summary",
        {"records": len(records), "observed": dict(observed), "declared": declared,
         "mismatches": mismatches},
        "Status counts are recomputed from manifest records; raw source bodies are not read.",
    ))

    blockers, warnings = [], []
    for rec in records:
        if not isinstance(rec, dict):
            continue
        rec_warnings = [w for w in rec.get("warnings", []) if isinstance(w, str)]
        warnings.extend(rec_warnings)
        if rec.get("status") in {"collision", "blocked"}:
            blockers.append({
                "old_path": rec.get("old_path"), "new_path": rec.get("new_path"),
                "status": rec.get("status"), "warnings": rec_warnings,
            })
    checks.append(result(
        f"manifest.operational_blockers.{rel}", "BLOCKED" if blockers else "PASS", rel,
        rel, None,
        {"blocker_records": len(blockers),
         "status_counts": {k: observed.get(k, 0) for k in ("collision", "blocked")},
         "records": blockers},
        "Reports normalization blockers without deciding their disposition." if blockers
        else "No collision/blocked records reported.",
        warnings,
    ))
    return data


def path_index(manifest: dict[str, Any]) -> dict[str, list[dict[str, Any]]]:
    out: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for rec in manifest.get("records", []):
        if not isinstance(rec, dict):
            continue
        for key in ("old_path", "new_path"):
            path = rec.get(key)
            if isinstance(path, str):
                out[path].append(rec)
    return out


def metadata_match(viewer_rec: dict[str, Any], candidates: list[dict[str, Any]]) -> bool:
    fields = ("message_count", "start_local", "end_local", "timestamp_source")
    return any(all(viewer_rec.get(field) == rec.get(field) for field in fields)
               for rec in candidates)


def validate(root: Path) -> dict[str, Any]:
    checks: list[dict[str, Any]] = []
    viewer_rel = "CONVERSATION_VIEWER/data/conversations.json"
    external_rel = "CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json"
    nd_rel = "indexes/nathan-direct/MANIFEST.json"
    stage2_rel = "indexes/nathan-direct/stage2/MANIFEST.json"

    viewer, err = load(root, viewer_rel)
    if err or not isinstance(viewer, dict):
        load_failure(checks, viewer_rel, err or "top-level JSON is not an object")
        viewer = {}
    inputs = viewer.get("inputs", [])
    if not isinstance(inputs, list):
        checks.append(result("viewer.inputs.schema", "FAIL", viewer_rel, viewer_rel, None,
                             {"inputs_type": type(inputs).__name__},
                             "Viewer inputs must be a list."))
        inputs = []

    manifests: dict[str, dict[str, Any]] = {}
    for inp in inputs:
        if not isinstance(inp, dict) or inp.get("corpus") == "registered-external":
            continue
        rel = inp.get("path")
        if not isinstance(rel, str):
            continue
        manifest = audit_manifest(root, rel, checks)
        if manifest is None:
            continue
        manifests[rel] = manifest
        left, right = inp.get("source_generated_at_utc"), manifest.get("generated_at_utc")
        if left is None or right is None:
            severity, note = "UNKNOWN", "Freshness marker absent on one side."
        elif left == right:
            severity, note = "PASS", "Viewer records the exact referenced manifest generation marker."
        else:
            severity, note = "WARN", "Viewer and referenced manifest generation markers differ."
        checks.append(result(
            f"viewer.input_freshness.{inp.get('corpus', rel)}", severity, rel,
            f"{viewer_rel}:inputs", rel,
            {"viewer_source_generated_at_utc": left, "manifest_generated_at_utc": right}, note,
        ))

    accepted_parts, missing_acceptance = [], []
    for inp in inputs:
        if not isinstance(inp, dict):
            continue
        n = accepted(inp)
        if n is None:
            missing_acceptance.append(inp.get("path"))
        else:
            accepted_parts.append({"path": inp.get("path"), "corpus": inp.get("corpus"), "accepted": n})
    accepted_total = sum(x["accepted"] for x in accepted_parts)
    counts = viewer.get("counts", {}) if isinstance(viewer.get("counts"), dict) else {}
    source_before = counts.get("source_conversations_before_curation")
    severity = "UNKNOWN" if missing_acceptance or source_before is None else (
        "PASS" if accepted_total == source_before else "FAIL")
    checks.append(result(
        "viewer.accepted_input_arithmetic", severity, viewer_rel,
        f"{viewer_rel}:inputs[*].accepted*", f"{viewer_rel}:counts.source_conversations_before_curation",
        {"accepted_parts": accepted_parts, "accepted_total": accepted_total,
         "source_conversations_before_curation": source_before,
         "missing_acceptance": missing_acceptance},
        "Uses Viewer-declared acceptance semantics; manifest status counts are a separate invariant.",
    ))

    conversations = viewer.get("conversations", []) if isinstance(viewer.get("conversations"), list) else []
    corpora = Counter(c.get("corpus") for c in conversations if isinstance(c, dict))
    declared_total = counts.get("conversations")
    corpus_mismatch = {
        key: {"observed": corpora.get(key, 0), "declared": counts.get(key)}
        for key in ("development", "live")
        if isinstance(counts.get(key), int) and corpora.get(key, 0) != counts.get(key)
    }
    total_ok = isinstance(declared_total, int) and declared_total == len(conversations)
    checks.append(result(
        "viewer.catalog_count_arithmetic", "PASS" if total_ok and not corpus_mismatch else "FAIL",
        viewer_rel, f"{viewer_rel}:conversations[]", f"{viewer_rel}:counts",
        {"observed_total": len(conversations), "declared_total": declared_total,
         "observed_corpora": dict(corpora), "corpus_mismatch": corpus_mismatch},
        "Counts actual Viewer records by declared corpus.",
    ))

    external_paths: set[str] = set()
    external, ext_err = load(root, external_rel)
    if ext_err or not isinstance(external, dict):
        load_failure(checks, external_rel, ext_err or "top-level JSON is not an object")
    else:
        ext_records = external.get("conversations", []) if isinstance(external.get("conversations"), list) else []
        external_paths = {e.get("path") for e in ext_records if isinstance(e, dict) and isinstance(e.get("path"), str)}
        viewer_by_path = {c.get("path"): c for c in conversations if isinstance(c, dict) and isinstance(c.get("path"), str)}
        missing, mismatched = [], []
        for ext in ext_records:
            if not isinstance(ext, dict):
                continue
            current = viewer_by_path.get(ext.get("path"))
            if current is None:
                missing.append(ext.get("path"))
            elif current.get("corpus") != ext.get("corpus") or current.get("message_count") != ext.get("message_count"):
                mismatched.append({"path": ext.get("path"), "registry_corpus": ext.get("corpus"),
                                   "viewer_corpus": current.get("corpus"),
                                   "registry_message_count": ext.get("message_count"),
                                   "viewer_message_count": current.get("message_count")})
        checks.append(result(
            "viewer.external_registry_reconciliation", "FAIL" if missing or mismatched else "PASS",
            external_rel, external_rel, viewer_rel,
            {"registry_records": len(ext_records), "missing_from_viewer": missing, "mismatched": mismatched},
            "Registered external records retain their declared corpus/count semantics; corpus alone does not imply manifest membership.",
        ))

    by_corpus: dict[str, dict[str, list[dict[str, Any]]]] = {}
    for inp in inputs:
        if not isinstance(inp, dict):
            continue
        corpus, rel = inp.get("corpus"), inp.get("path")
        if corpus in {"development", "live"} and isinstance(rel, str) and rel in manifests:
            by_corpus[corpus] = path_index(manifests[rel])
    failures, unknown, compared = [], [], 0
    for rec in conversations:
        if not isinstance(rec, dict) or rec.get("corpus") not in {"development", "live"}:
            continue
        path, corpus = rec.get("path"), rec.get("corpus")
        if path in external_paths:
            continue
        mapping = by_corpus.get(corpus)
        if mapping is None or not isinstance(path, str):
            unknown.append({"path": path, "corpus": corpus, "reason": "manifest adapter unavailable or path missing"})
            continue
        candidates = mapping.get(path, [])
        if not candidates:
            failures.append({"path": path, "corpus": corpus, "reason": "no manifest path candidate"})
            continue
        compared += 1
        if not metadata_match(rec, candidates):
            failures.append({"path": path, "corpus": corpus, "reason": "count/timestamp metadata mismatch"})
    join_severity = "FAIL" if failures else ("UNKNOWN" if unknown else "PASS")
    checks.append(result(
        "viewer.manifest_record_reconciliation", join_severity, viewer_rel,
        viewer_rel, "Viewer-referenced date manifests",
        {"compared_records": compared, "failures": failures, "unknown": unknown},
        "Joins on manifest old/new paths and compares count/timestamp metadata; registered external records are excluded.",
    ))

    nd, nd_err = load(root, nd_rel)
    if nd_err or not isinstance(nd, dict):
        load_failure(checks, nd_rel, nd_err or "top-level JSON is not an object")
        nd = None
    stage2, stage2_err = load(root, stage2_rel)
    if stage2_err or not isinstance(stage2, dict):
        load_failure(checks, stage2_rel, stage2_err or "top-level JSON is not an object")
        stage2 = None

    if nd:
        packaged = nd.get("packaged_unique_user_messages")
        duplicates = nd.get("archive_duplicate_user_records_collapsed")
        input_users = nd.get("input_user_records")
        numeric = all(isinstance(x, int) for x in (packaged, duplicates, input_users))
        checks.append(result(
            "nathan_direct.user_record_arithmetic",
            "PASS" if numeric and packaged + duplicates == input_users else ("UNKNOWN" if not numeric else "FAIL"),
            nd_rel, nd_rel, nd_rel,
            {"packaged_unique_user_messages": packaged,
             "archive_duplicate_user_records_collapsed": duplicates,
             "input_user_records": input_users,
             "computed_sum": packaged + duplicates if numeric else None},
            "Unique packaged user messages plus collapsed archive copies must account for all input user records.",
        ))
        shards = nd.get("shards", []) if isinstance(nd.get("shards"), list) else []
        shard_counts = [s.get("records") for s in shards if isinstance(s, dict)]
        shard_numeric = isinstance(packaged, int) and bool(shard_counts) and all(isinstance(x, int) for x in shard_counts)
        shard_sum = sum(shard_counts) if shard_numeric else None
        checks.append(result(
            "nathan_direct.shard_arithmetic",
            "PASS" if shard_numeric and shard_sum == packaged else ("UNKNOWN" if not shard_numeric else "FAIL"),
            nd_rel, f"{nd_rel}:shards", f"{nd_rel}:packaged_unique_user_messages",
            {"shard_counts": shard_counts, "shard_sum": shard_sum,
             "packaged_unique_user_messages": packaged},
            "Yearly shard counts must sum to the packaged unique message count.",
        ))
        if stage2:
            source_records = stage2.get("source_records")
            values = isinstance(packaged, int) and isinstance(source_records, int)
            checks.append(result(
                "nathan_direct.stage2_source_continuity",
                "PASS" if values and source_records == packaged else ("UNKNOWN" if not values else "FAIL"),
                stage2_rel, f"{nd_rel}:packaged_unique_user_messages", f"{stage2_rel}:source_records",
                {"packaged_unique_user_messages": packaged, "stage2_source_records": source_records},
                "Stage-2 source count must equal upstream packaged unique messages; queue counts are not assumed to partition the source.",
            ))

    severity_counts = Counter(item["severity"] for item in checks)
    overall = max((item["severity"] for item in checks), key=lambda s: ORDER[s], default="UNKNOWN")
    return {
        "schema_version": 1,
        "policy": "read-only metadata integrity; no raw conversation parsing; no authorship/theory inference",
        "overall": overall,
        "severity_counts": dict(severity_counts),
        "checks": checks,
    }


def markdown(report: dict[str, Any]) -> str:
    lines = [
        "# Cross-source integrity validator", "", f"**Overall:** `{report['overall']}`", "",
        "Read-only metadata audit. It does not parse raw conversation bodies, mutate sources, or infer authorship/theory authority.",
        "", "| Severity | Count |", "|---|---:|",
    ]
    for severity in ("FAIL", "BLOCKED", "WARN", "UNKNOWN", "PASS"):
        lines.append(f"| {severity} | {report['severity_counts'].get(severity, 0)} |")
    lines += ["", "## Checks", ""]
    for item in report["checks"]:
        subject = f" — `{item['subject_path']}`" if item.get("subject_path") else ""
        lines.append(f"- **{item['severity']}** `{item['check_id']}`{subject}: {item['note']}")
        if item["severity"] in {"FAIL", "BLOCKED", "WARN", "UNKNOWN"}:
            detail = json.dumps(item.get("compared", {}), ensure_ascii=False, sort_keys=True)
            if len(detail) > 1000:
                detail = detail[:997] + "..."
            lines.append(f"  - `{detail}`")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    here = Path(__file__).resolve()
    default_root = here.parents[2] if len(here.parents) >= 3 else Path.cwd()
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=default_root)
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--md-out", type=Path)
    parser.add_argument("--fail-on-fail", action="store_true",
                        help="return exit status 1 only when a FAIL check exists")
    args = parser.parse_args()
    root = args.repo_root.resolve()
    report = validate(root)
    text = markdown(report)
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
