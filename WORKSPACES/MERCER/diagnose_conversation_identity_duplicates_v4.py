#!/usr/bin/env python3
"""Conversation-identity diagnostic v4.

Read-only extension of diagnose_conversation_identity_duplicates.py (v3). Repairs the
visible-text comparability denominator so it is scoped to content-changed nodes and
adds privacy-preserving structural signatures for changed content that the narrow
ordinary-text projection cannot compare. No message bodies or scalar values are
retained in output.
"""
from __future__ import annotations

import contextlib
import io
import json
from collections import Counter
from typing import Any

import diagnose_conversation_identity_duplicates as base


def structural_shape(value: Any) -> Any:
    """Return representation structure only: types, keys, and list lengths."""
    if isinstance(value, dict):
        return {
            "type": "dict",
            "keys": sorted(value),
            "children": {str(k): structural_shape(value[k]) for k in sorted(value)},
        }
    if isinstance(value, list):
        return {
            "type": "list",
            "length": len(value),
            "item_types": dict(sorted(Counter(type(x).__name__ for x in value).items())),
            "items": [structural_shape(x) for x in value],
        }
    return {"type": type(value).__name__}


def carrier_signature(content: Any) -> dict[str, Any]:
    shape = structural_shape(content)
    return {
        "root_type": type(content).__name__,
        "top_level_keys": sorted(content) if isinstance(content, dict) else [],
        "shape_sha256": base.canonical_hash(shape),
    }


def mapping_diff_signature(mapping_a: Any, mapping_b: Any) -> dict[str, Any]:
    if not isinstance(mapping_a, dict) or not isinstance(mapping_b, dict):
        return {"comparable": False}

    shared = set(mapping_a) & set(mapping_b)
    changed_nodes = 0
    content_changed_nodes = 0
    topology_changed_nodes = 0
    visible_text_changed_nodes = 0
    content_changed_visible_text_comparable_nodes = 0
    content_changed_but_visible_text_equal_nodes = 0
    content_changed_text_uncomparable_nodes = 0
    path_counts: Counter[str] = Counter()
    uncomparable_carrier_pairs: Counter[str] = Counter()

    for node_id in shared:
        a, b = mapping_a[node_id], mapping_b[node_id]
        if base.canonical_hash(a) == base.canonical_hash(b):
            continue
        changed_nodes += 1
        if isinstance(a, dict) and isinstance(b, dict):
            ma, mb = a.get("message"), b.get("message")
            ca = ma.get("content") if isinstance(ma, dict) else None
            cb = mb.get("content") if isinstance(mb, dict) else None
            content_changed = ca != cb
            if content_changed:
                content_changed_nodes += 1
                visible_a = base.message_visible_text_hash(a)
                visible_b = base.message_visible_text_hash(b)
                if visible_a is not None and visible_b is not None:
                    content_changed_visible_text_comparable_nodes += 1
                    if visible_a != visible_b:
                        visible_text_changed_nodes += 1
                    else:
                        content_changed_but_visible_text_equal_nodes += 1
                else:
                    content_changed_text_uncomparable_nodes += 1
                    pair = {
                        "a": carrier_signature(ca),
                        "b": carrier_signature(cb),
                    }
                    uncomparable_carrier_pairs[base.canonical_hash(pair)] += 1
            if a.get("parent") != b.get("parent") or a.get("children") != b.get("children"):
                topology_changed_nodes += 1
            for path, count in base.differing_paths(a, b).items():
                path_counts[path] += count
        else:
            path_counts["node_type_or_value"] += 1

    return {
        "comparable": True,
        "shared_mapping_nodes": len(shared),
        "changed_shared_nodes": changed_nodes,
        "message_content_changed_nodes": content_changed_nodes,
        "content_changed_visible_text_comparable_nodes": content_changed_visible_text_comparable_nodes,
        "visible_text_changed_nodes": visible_text_changed_nodes,
        "content_changed_but_visible_text_equal_nodes": content_changed_but_visible_text_equal_nodes,
        "content_changed_text_uncomparable_nodes": content_changed_text_uncomparable_nodes,
        "text_uncomparable_carrier_shape_pair_hash_counts": dict(sorted(uncomparable_carrier_pairs.items())),
        "topology_changed_nodes": topology_changed_nodes,
        "only_in_a_nodes": len(set(mapping_a) - set(mapping_b)),
        "only_in_b_nodes": len(set(mapping_b) - set(mapping_a)),
        "differing_json_paths": dict(sorted(path_counts.items())),
    }


def main() -> int:
    base.mapping_diff_signature = mapping_diff_signature
    captured = io.StringIO()
    with contextlib.redirect_stdout(captured):
        rc = base.main()
    report = json.loads(captured.getvalue())
    report["diagnostic"] = "raw-conversation-identity-duplicates-v4"
    report["scope"] = (
        "Viewer-resolved accepted JSON inputs; read-only; corrected content-scoped text "
        "comparability plus non-text carrier structural hashes; no message bodies/scalar values retained; "
        "non-text semantic equivalence remains unresolved"
    )
    print(json.dumps(report, indent=2, ensure_ascii=False, sort_keys=True))
    return rc


if __name__ == "__main__":
    raise SystemExit(main())
