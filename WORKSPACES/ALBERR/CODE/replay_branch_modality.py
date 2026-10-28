#!/usr/bin/env python3
"""Source-pinned Alberr archive modality audit. No model or physical simulation.

Usage:
  python replay_branch_modality.py /path/to/original_raw.json /path/to/Alberr.txt

Original Git blobs:
  raw:  c98f63fa861b0df478a5fa98dff54d731348c81f (HsH)
  flat: eb72b22ac6ecb95999949d0e43aff4e4e52220bd (SAT archive)
"""
import argparse
import hashlib
import json
from pathlib import Path

RAW_BLOB = "c98f63fa861b0df478a5fa98dff54d731348c81f"
FLAT_BLOB = "eb72b22ac6ecb95999949d0e43aff4e4e52220bd"
SKETCH = "a5b72889-adb6-49a2-ab43-b15dd52dcf19"


def git_blob_sha(payload: bytes) -> str:
    return hashlib.sha1(b"blob " + str(len(payload)).encode() + b"\\0" + payload).hexdigest()


def audit(raw_path: Path, flat_path: Path) -> dict:
    raw_bytes, flat_bytes = raw_path.read_bytes(), flat_path.read_bytes()
    raw_sha, flat_sha = git_blob_sha(raw_bytes), git_blob_sha(flat_bytes)
    if (raw_sha, flat_sha) != (RAW_BLOB, FLAT_BLOB):
        raise ValueError(
            f"Original Git blob mismatch: raw={raw_sha}, flat={flat_sha}; "
            "do not silently substitute a derivative or changed source."
        )
    obj = json.loads(raw_bytes)
    mapping = obj["mapping"]
    selected = set()
    node = obj["current_node"]
    while node is not None:
        if node in selected:
            raise ValueError(f"Cycle in selected ancestry: {node}")
        selected.add(node)
        node = mapping[node]["parent"]

    ledger = {
        key: {"messages": 0, "image_messages": 0, "image_parts": 0,
              "user_parts": 0, "tool_parts": 0, "assistant_parts": 0}
        for key in ("selected", "offpath")
    }
    mismatches = []
    for message_id, entry in mapping.items():
        msg = entry.get("message")
        if msg is None:
            continue
        key = "selected" if message_id in selected else "offpath"
        row = ledger[key]
        row["messages"] += 1
        parts = (msg.get("content") or {}).get("parts") or []
        n_images = sum(
            isinstance(part, dict) and part.get("content_type") == "image_asset_pointer"
            for part in parts
        )
        if not n_images:
            continue
        row["image_messages"] += 1
        row["image_parts"] += n_images
        role = msg["author"]["role"]
        row[f"{role}_parts"] += n_images
        if role == "user":
            attachments = (msg.get("metadata") or {}).get("attachments") or []
            if len(attachments) != n_images:
                mismatches.append((message_id, n_images, len(attachments)))

    sketch = mapping[SKETCH]["message"]
    sketch_parts = sketch["content"]["parts"]
    sketch_images = [p for p in sketch_parts if isinstance(p, dict)
                     and p.get("content_type") == "image_asset_pointer"]
    names = [a.get("name") for a in sketch["metadata"]["attachments"]]
    flat = flat_bytes.decode("utf-8")
    result = {
        "raw_git_blob": raw_sha, "flat_git_blob": flat_sha,
        "selected_nodes_including_root": len(selected),
        "message_count": sum(x["messages"] for x in ledger.values()),
        "ledger": ledger, "user_image_attachment_mismatches": mismatches,
        "selected_sketch_images": len(sketch_images),
        "selected_sketch_filenames": names,
        "flat_contains_sketch_user_text": "*Alle* Fragen sind Doof." in flat,
        "flat_contains_image_pointer_type": "image_asset_pointer" in flat,
        "flat_contains_sketch_filename": names[0] in flat,
    }
    assert result["selected_nodes_including_root"] == 47
    assert result["message_count"] == 579
    assert ledger["selected"] == {
        "messages": 46, "image_messages": 1, "image_parts": 2,
        "user_parts": 2, "tool_parts": 0, "assistant_parts": 0}
    assert ledger["offpath"] == {
        "messages": 533, "image_messages": 20, "image_parts": 56,
        "user_parts": 48, "tool_parts": 8, "assistant_parts": 0}
    assert mismatches == []
    assert len(sketch_images) == 2
    assert result["flat_contains_sketch_user_text"]
    assert not result["flat_contains_image_pointer_type"]
    assert not result["flat_contains_sketch_filename"]
    return result


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("raw", type=Path)
    parser.add_argument("flat", type=Path)
    args = parser.parse_args()
    print(json.dumps(audit(args.raw, args.flat), indent=2, ensure_ascii=False))
