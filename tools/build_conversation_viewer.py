#!/usr/bin/env python3
"""Build the lightweight manifest consumed by the HsH Conversation Viewer.

The viewer deliberately does not duplicate multi-megabyte raw conversation exports.
Instead, it uses the existing conversation-date manifests to build a compact catalog,
then fetches the selected raw JSON conversation on demand in the browser.

A reversible curation layer can hide whole conversations or omit selected message
ranges from the public viewer without altering source conversation exports. Partial
curation produces derived viewer-only copies with omission markers so source message
coordinates remain stable.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path
from typing import Any
from urllib.parse import quote

DEFAULT_DEV = Path("indexes/manifests/development-conversation-dates.json")
DEFAULT_LIVE = Path("indexes/manifests/live-conversation-dates.json")
DEFAULT_OUTPUT = Path("CONVERSATION_VIEWER/data/conversations.json")
DEFAULT_CURATION = Path("CONVERSATION_VIEWER/CURATION.json")
DEFAULT_EXTERNAL = Path("CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json")
DEFAULT_CURATED_DIR = Path("CONVERSATION_VIEWER/data/curated")
DATE_PREFIX_RE = re.compile(r"^\d{2}\.\d{2}\.\d{2}•\d{2}\.\d{2}\.\d{2}•")
RAW_SUFFIX_RE = re.compile(r"\s+[—-]\s+raw(?:\s*\(\d+\))?\.json$", re.I)
OMISSION_TEXT = "[Omitted from the public Conversation Viewer by a curation rule.]"


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8-sig") as handle:
        data = json.load(handle)
    if not isinstance(data, dict):
        raise ValueError(f"expected object in {path}")
    return data


def canonical_path(record: dict[str, Any]) -> str | None:
    candidate = record.get("new_path") or record.get("old_path")
    if not isinstance(candidate, str) or not candidate.lower().endswith(".json"):
        return None
    return candidate.replace("\\", "/")


def display_title(path: str) -> str:
    name = Path(path).name
    name = DATE_PREFIX_RE.sub("", name, count=1)
    name = RAW_SUFFIX_RE.sub("", name)
    if name.lower().endswith(".json"):
        name = name[:-5]
    return name.strip() or Path(path).stem


def stable_id(path: str) -> str:
    return hashlib.sha1(path.encode("utf-8")).hexdigest()[:12]


def encoded_path(path: str) -> str:
    return quote(path, safe="/")


def normalize_record(record: dict[str, Any], corpus: str, owner: str, repo: str, branch: str) -> dict[str, Any] | None:
    path = canonical_path(record)
    if path is None:
        return None
    count = record.get("message_count")
    if not isinstance(count, int) or count <= 0:
        return None
    status = str(record.get("status") or "")
    if status in {"skipped", "collision", "blocked"}:
        return None

    encoded = encoded_path(path)
    return {
        "id": stable_id(path),
        "title": display_title(path),
        "path": path,
        "corpus": corpus,
        "start_local": record.get("start_local"),
        "end_local": record.get("end_local"),
        "message_count": count,
        "timestamp_source": record.get("timestamp_source"),
        "warnings": record.get("warnings") or [],
        "raw_url": f"https://raw.githubusercontent.com/{owner}/{repo}/{branch}/{encoded}",
        "github_url": f"https://github.com/{owner}/{repo}/blob/{branch}/{encoded}",
    }


def text_from_part(value: Any) -> str:
    if value is None:
        return ""
    if isinstance(value, (str, int, float, bool)):
        return str(value)
    if isinstance(value, list):
        return "\n".join(filter(None, (text_from_part(x) for x in value)))
    if isinstance(value, dict):
        if isinstance(value.get("text"), str):
            return value["text"]
        for key in ("content", "parts", "result"):
            if value.get(key) is not None:
                return text_from_part(value[key])
        if value.get("name") and value.get("url"):
            return f"{value['name']}: {value['url']}"
    return ""


def content_text(content: Any) -> str:
    return text_from_part(content)


def active_branch_node_ids(data: dict[str, Any], mapping: dict[str, Any]) -> list[str] | None:
    current = data.get("current_node")
    if not isinstance(current, str) or current not in mapping:
        return None
    ids: list[str] = []
    seen: set[str] = set()
    node_id: str | None = current
    while node_id and node_id in mapping and node_id not in seen:
        seen.add(node_id)
        ids.append(node_id)
        parent = mapping[node_id].get("parent") if isinstance(mapping[node_id], dict) else None
        node_id = parent if isinstance(parent, str) else None
    return list(reversed(ids))


def normalize_mapping_conversation(data: dict[str, Any]) -> list[dict[str, Any]]:
    mapping = data.get("mapping")
    if not isinstance(mapping, dict):
        return []
    active = active_branch_node_ids(data, mapping)
    if active:
        nodes = [(node_id, mapping[node_id]) for node_id in active]
    else:
        nodes = [(node_id, node) for node_id, node in mapping.items() if isinstance(node, dict) and node.get("message")]
        nodes.sort(key=lambda pair: float((pair[1].get("message") or {}).get("create_time") or 0))

    out: list[dict[str, Any]] = []
    for node_id, node in nodes:
        if not isinstance(node, dict):
            continue
        msg = node.get("message")
        if not isinstance(msg, dict):
            continue
        author = msg.get("author") if isinstance(msg.get("author"), dict) else {}
        role = str(author.get("role") or "unknown")
        speaker = str(author.get("name") or role)
        text = content_text(msg.get("content")).strip()
        if not text and role not in {"user", "assistant", "system", "developer", "tool"}:
            continue
        out.append({
            "node_id": node_id,
            "role": role,
            "speaker": speaker,
            "text": text or f"[{role} message with no displayable text]",
            "create_time": float(msg.get("create_time") or msg.get("update_time") or 0) or None,
        })
    return out


def normalize_generic_conversation(data: Any) -> list[dict[str, Any]]:
    if isinstance(data, list):
        items = data
    elif isinstance(data, dict) and isinstance(data.get("messages"), list):
        items = data["messages"]
    else:
        return []

    out: list[dict[str, Any]] = []
    for index, msg in enumerate(items):
        if not isinstance(msg, dict):
            continue
        author = msg.get("author") if isinstance(msg.get("author"), dict) else {}
        role = str(msg.get("role") or author.get("role") or msg.get("speaker") or "unknown")
        speaker = str(author.get("name") or msg.get("speaker") or role)
        text = content_text(msg.get("content", msg.get("text", msg.get("message", "")))).strip()
        if not text:
            continue
        out.append({
            "node_id": str(msg.get("id") or index),
            "role": role,
            "speaker": speaker,
            "text": text,
            "create_time": float(msg.get("create_time") or msg.get("timestamp") or 0) or None,
        })
    return out


def normalize_conversation(data: Any) -> list[dict[str, Any]]:
    if isinstance(data, list) and len(data) == 1 and isinstance(data[0], dict) and data[0].get("mapping"):
        data = data[0]
    if isinstance(data, dict):
        mapped = normalize_mapping_conversation(data)
        if mapped:
            return mapped
    return normalize_generic_conversation(data)


def normalize_ranges(value: Any, field: str, label: str) -> list[tuple[int, int]]:
    if value in (None, []):
        return []
    if not isinstance(value, list):
        raise ValueError(f"{label}: {field} must be a list of [start, end] ranges")
    ranges: list[tuple[int, int]] = []
    for pair in value:
        if not isinstance(pair, list) or len(pair) != 2 or not all(isinstance(x, int) for x in pair):
            raise ValueError(f"{label}: invalid {field} range {pair!r}")
        start, end = pair
        if start < 1 or end < start:
            raise ValueError(f"{label}: invalid {field} range {pair!r}")
        ranges.append((start, end))
    return ranges


def in_ranges(message_number: int, ranges: list[tuple[int, int]]) -> bool:
    return any(start <= message_number <= end for start, end in ranges)


def load_curation(path: Path) -> dict[str, Any]:
    if not path.exists():
        return {"schema_version": 1, "rules": []}
    payload = load_json(path)
    if payload.get("schema_version") != 1:
        raise ValueError(f"unsupported curation schema_version in {path}")
    if not isinstance(payload.get("rules"), list):
        raise ValueError(f"curation rules must be a list in {path}")
    return payload


def resolve_curation_rules(conversations: list[dict[str, Any]], payload: dict[str, Any]) -> dict[str, dict[str, Any]]:
    by_id = {item["id"]: item for item in conversations}
    by_path = {item["path"]: item for item in conversations}
    resolved: dict[str, dict[str, Any]] = {}

    for index, raw_rule in enumerate(payload["rules"], start=1):
        if not isinstance(raw_rule, dict):
            raise ValueError(f"curation rule {index} must be an object")
        label = f"curation rule {index}"
        selector_id = raw_rule.get("conversation_id")
        selector_path = raw_rule.get("path")
        if not selector_id and not selector_path:
            raise ValueError(f"{label}: supply conversation_id or path")

        candidates: list[dict[str, Any]] = []
        if selector_id:
            item = by_id.get(str(selector_id))
            if item:
                candidates.append(item)
        if selector_path:
            item = by_path.get(str(selector_path).replace("\\", "/"))
            if item and item not in candidates:
                candidates.append(item)
        if len(candidates) != 1:
            raise ValueError(f"{label}: selector did not resolve uniquely")
        item = candidates[0]
        if selector_id and str(selector_id) != item["id"]:
            raise ValueError(f"{label}: conversation_id and path disagree")
        if selector_path and str(selector_path).replace("\\", "/") != item["path"]:
            raise ValueError(f"{label}: conversation_id and path disagree")
        if item["id"] in resolved:
            raise ValueError(f"{label}: duplicate rule for conversation {item['id']}")

        visibility = str(raw_rule.get("visibility") or "public")
        if visibility not in {"public", "hidden"}:
            raise ValueError(f"{label}: visibility must be 'public' or 'hidden'")
        omit_ranges = normalize_ranges(raw_rule.get("omit_ranges"), "omit_ranges", label)
        only_ranges = normalize_ranges(raw_rule.get("only_ranges"), "only_ranges", label)
        if visibility == "hidden" and (omit_ranges or only_ranges):
            raise ValueError(f"{label}: hidden conversations cannot also define message ranges")

        resolved[item["id"]] = {
            "visibility": visibility,
            "omit_ranges": omit_ranges,
            "only_ranges": only_ranges,
            "note": str(raw_rule.get("note") or "").strip(),
        }
    return resolved


def write_curated_copy(item: dict[str, Any], rule: dict[str, Any], curated_dir: Path) -> tuple[int, int]:
    source_path = Path(item["path"])
    if not source_path.exists():
        raise ValueError(f"curation source file missing: {source_path}")
    with source_path.open("r", encoding="utf-8-sig") as handle:
        raw = json.load(handle)
    messages = normalize_conversation(raw)
    if not messages:
        raise ValueError(f"curation found no displayable messages in {source_path}")

    omit_ranges: list[tuple[int, int]] = rule["omit_ranges"]
    only_ranges: list[tuple[int, int]] = rule["only_ranges"]
    maximum = len(messages)
    for field, ranges in (("omit_ranges", omit_ranges), ("only_ranges", only_ranges)):
        for start, end in ranges:
            if end > maximum:
                raise ValueError(f"{item['id']}: {field} range [{start}, {end}] exceeds {maximum} messages")

    omitted = 0
    output_messages: list[dict[str, Any]] = []
    for source_number, msg in enumerate(messages, start=1):
        should_omit = in_ranges(source_number, omit_ranges)
        if only_ranges and not in_ranges(source_number, only_ranges):
            should_omit = True
        text = OMISSION_TEXT if should_omit else msg["text"]
        if should_omit:
            omitted += 1
        output_messages.append({
            "id": msg["node_id"],
            "role": msg["role"],
            "author": {"role": msg["role"], "name": msg["speaker"]},
            "content": text,
            "create_time": msg["create_time"],
            "source_message": source_number,
            "omitted": should_omit,
        })

    curated_dir.mkdir(parents=True, exist_ok=True)
    out_path = curated_dir / f"{item['id']}.json"
    derived = {
        "schema_version": 1,
        "derived_view": True,
        "source_path": item["path"],
        "source_viewer_id": item["id"],
        "curation_note": rule["note"],
        "messages": output_messages,
    }
    with out_path.open("w", encoding="utf-8", newline="\n") as handle:
        json.dump(derived, handle, ensure_ascii=False, indent=2)
        handle.write("\n")
    return len(messages), omitted


def apply_curation(conversations: list[dict[str, Any]], curation: dict[str, Any], curated_dir: Path) -> tuple[list[dict[str, Any]], dict[str, int]]:
    curated_dir.mkdir(parents=True, exist_ok=True)
    for stale in curated_dir.glob("*.json"):
        stale.unlink()

    rules = resolve_curation_rules(conversations, curation)
    visible: list[dict[str, Any]] = []
    hidden = 0
    partial = 0
    omitted_messages = 0

    for original in conversations:
        item = dict(original)
        rule = rules.get(item["id"])
        if rule and rule["visibility"] == "hidden":
            hidden += 1
            continue
        if rule and (rule["omit_ranges"] or rule["only_ranges"]):
            actual_count, omitted = write_curated_copy(item, rule, curated_dir)
            item["message_count"] = actual_count
            item["raw_url"] = f"data/curated/{item['id']}.json"
            item["curated"] = True
            item["curation"] = {
                "omitted_messages": omitted,
                "note": rule["note"],
                "source_coordinates_preserved": True,
            }
            partial += 1
            omitted_messages += omitted
        visible.append(item)

    return visible, {
        "hidden_conversations": hidden,
        "partially_curated_conversations": partial,
        "omitted_messages": omitted_messages,
    }


def build_manifest(dev: Path, live: Path, external_path: Path, curation_path: Path, curated_dir: Path, owner: str, repo: str, branch: str) -> dict[str, Any]:
    conversations: list[dict[str, Any]] = []
    inputs = [(dev, "development"), (live, "live")]
    input_meta: list[dict[str, Any]] = []
    source_timestamps: list[str] = []

    for path, corpus in inputs:
        if not path.exists():
            input_meta.append({"path": path.as_posix(), "corpus": corpus, "status": "missing"})
            continue
        payload = load_json(path)
        records = payload.get("records")
        if not isinstance(records, list):
            raise ValueError(f"missing records array in {path}")
        accepted = 0
        for record in records:
            if not isinstance(record, dict):
                continue
            item = normalize_record(record, corpus, owner, repo, branch)
            if item:
                conversations.append(item)
                accepted += 1
        generated = payload.get("generated_at_utc")
        if isinstance(generated, str) and generated:
            source_timestamps.append(generated)
        input_meta.append({
            "path": path.as_posix(),
            "corpus": corpus,
            "status": "loaded",
            "records": len(records),
            "accepted_json_conversations": accepted,
            "source_generated_at_utc": generated,
        })

    if external_path.exists():
        external_payload = load_json(external_path)
        if external_payload.get("schema_version") != 1:
            raise ValueError(f"unsupported external conversation schema_version in {external_path}")
        external_records = external_payload.get("conversations")
        if not isinstance(external_records, list):
            raise ValueError(f"external conversations must be a list in {external_path}")
        accepted_external = 0
        required = {"id", "title", "path", "corpus", "message_count", "raw_url", "github_url"}
        for raw in external_records:
            if not isinstance(raw, dict):
                raise ValueError(f"invalid external conversation entry in {external_path}")
            missing = sorted(required - set(raw))
            if missing:
                raise ValueError(f"external conversation missing {missing}: {raw}")
            if not isinstance(raw.get("message_count"), int) or raw["message_count"] <= 0:
                raise ValueError(f"external conversation has invalid message_count: {raw}")
            item = dict(raw)
            item["external"] = True
            conversations.append(item)
            accepted_external += 1
        input_meta.append({
            "path": external_path.as_posix(),
            "corpus": "registered-external",
            "status": "loaded",
            "records": len(external_records),
            "accepted_conversations": accepted_external,
        })

    by_path: dict[str, dict[str, Any]] = {}
    for item in conversations:
        old = by_path.get(item["path"])
        if old is None or item["corpus"] == "live":
            by_path[item["path"]] = item
    conversations = list(by_path.values())
    source_total = len(conversations)

    curation = load_curation(curation_path)
    conversations, curation_counts = apply_curation(conversations, curation, curated_dir)

    def sort_key(item: dict[str, Any]) -> tuple[str, str]:
        return (str(item.get("start_local") or ""), item["path"].casefold())

    conversations.sort(key=sort_key, reverse=True)
    for index, item in enumerate(conversations):
        item["order"] = index

    curation_sha = hashlib.sha256(curation_path.read_bytes()).hexdigest()[:16] if curation_path.exists() else None
    return {
        "schema_version": 1,
        "source_state_at_utc": max(source_timestamps) if source_timestamps else None,
        "repository": f"{owner}/{repo}",
        "branch": branch,
        "design": "manifest-only by default; derived viewer copies only for partially curated conversations",
        "curation": {
            "source": curation_path.as_posix(),
            "sha256_16": curation_sha,
            **curation_counts,
        },
        "counts": {
            "conversations": len(conversations),
            "development": sum(x["corpus"] == "development" for x in conversations),
            "live": sum(x["corpus"] == "live" for x in conversations),
            "source_conversations_before_curation": source_total,
        },
        "inputs": input_meta,
        "conversations": conversations,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--development-manifest", type=Path, default=DEFAULT_DEV)
    parser.add_argument("--live-manifest", type=Path, default=DEFAULT_LIVE)
    parser.add_argument("--external-conversations", type=Path, default=DEFAULT_EXTERNAL)
    parser.add_argument("--curation", type=Path, default=DEFAULT_CURATION)
    parser.add_argument("--curated-dir", type=Path, default=DEFAULT_CURATED_DIR)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--owner", default="Satobloc")
    parser.add_argument("--repo", default="HsH")
    parser.add_argument("--branch", default="main")
    args = parser.parse_args()

    payload = build_manifest(
        args.development_manifest,
        args.live_manifest,
        args.external_conversations,
        args.curation,
        args.curated_dir,
        args.owner,
        args.repo,
        args.branch,
    )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", encoding="utf-8", newline="\n") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)
        handle.write("\n")

    counts = payload["counts"]
    curation_counts = payload["curation"]
    print(
        f"viewer_manifest={args.output}; conversations={counts['conversations']}; "
        f"development={counts['development']}; live={counts['live']}; "
        f"hidden={curation_counts['hidden_conversations']}; "
        f"partial={curation_counts['partially_curated_conversations']}; "
        f"omitted_messages={curation_counts['omitted_messages']}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
