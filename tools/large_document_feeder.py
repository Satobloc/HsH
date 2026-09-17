#!/usr/bin/env python3
"""Read-only large-source feeder for bounded worker reading packets.

Source files are never modified. Derived packets and manifest are written only
under --output. PRIOR_ART is unconditionally excluded from this ordinary-worker
tool; quarantine-authorized work requires a separate controlled interface.
"""
from __future__ import annotations
import argparse, hashlib, json, re
from pathlib import Path
from typing import Any

WORD_RE = re.compile(r"\S+")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def words(text: str) -> int:
    return len(WORD_RE.findall(text))


def reject_quarantine(path: Path) -> None:
    if any(p.upper() == "PRIOR_ART" for p in path.parts):
        raise SystemExit("Refusing PRIOR_ART input: this feeder is an ordinary-worker interface and has no quarantine bypass.")


def text_units(text: str) -> tuple[str, list[dict[str, Any]]]:
    lines = text.splitlines(keepends=True)
    units, buf, start = [], [], 1
    for i, line in enumerate(lines, 1):
        if line.strip():
            if not buf: start = i
            buf.append(line)
        elif buf:
            units.append({"text": "".join(buf).rstrip()+"\n", "start": {"line": start}, "end": {"line": i-1}})
            buf = []
    if buf:
        units.append({"text": "".join(buf).rstrip()+"\n", "start": {"line": start}, "end": {"line": len(lines)}})
    return "paragraph-lines", units


def message_text(msg: dict[str, Any]) -> str:
    content = msg.get("content")
    if isinstance(content, str): return content
    if isinstance(content, dict):
        parts = content.get("parts")
        if isinstance(parts, list): return "\n".join(str(x) for x in parts if x is not None)
        if isinstance(content.get("text"), str): return content["text"]
    for key in ("text", "body"):
        if isinstance(msg.get(key), str): return msg[key]
    return ""


def active_mapping_messages(obj: dict[str, Any]) -> list[dict[str, Any]]:
    """Return the active ChatGPT branch in parent-chain order when possible."""
    mapping = obj.get("mapping")
    if not isinstance(mapping, dict): return []
    current = obj.get("current_node")
    if current in mapping:
        chain, seen = [], set()
        while current in mapping and current not in seen:
            seen.add(current)
            node = mapping[current]
            if not isinstance(node, dict): break
            msg = node.get("message")
            if isinstance(msg, dict): chain.append(msg)
            current = node.get("parent")
        chain.reverse()
        return chain
    msgs = [n.get("message") for n in mapping.values()
            if isinstance(n, dict) and isinstance(n.get("message"), dict)]
    def stamp(m: dict[str, Any]) -> tuple[float, str]:
        t = m.get("create_time")
        return (float(t) if isinstance(t, (int, float)) else float("inf"), str(m.get("id") or ""))
    return sorted(msgs, key=stamp)


def conversation_units(obj: Any) -> tuple[str, list[dict[str, Any]]] | None:
    msgs = None; parser = "conversation-messages"
    if isinstance(obj, dict):
        for key in ("messages", "conversation"):
            if isinstance(obj.get(key), list): msgs = obj[key]; break
        if msgs is None and isinstance(obj.get("mapping"), dict):
            has_active = obj.get("current_node") in obj["mapping"]
            msgs = active_mapping_messages(obj)
            parser = "chatgpt-active-branch" if has_active else "chatgpt-mapping-chronological-fallback"
    elif isinstance(obj, list) and all(isinstance(x, dict) for x in obj):
        msgs = obj
    if not msgs: return None
    out = []
    for i, msg in enumerate(msgs):
        if not isinstance(msg, dict): continue
        text = message_text(msg)
        if not text: continue
        author = msg.get("author")
        if isinstance(author, dict): author = author.get("role") or author.get("name")
        mid = msg.get("id") or msg.get("message_id")
        rendered = f"[{author or 'unknown'}] {text}\n"
        out.append({"text": rendered, "start": {"message_index": i, "message_id": mid},
                    "end": {"message_index": i, "message_id": mid}, "message_id": mid,
                    "author": author, "timestamp": msg.get("create_time") or msg.get("timestamp")})
    return (parser, out) if out else None


def load_units(path: Path) -> tuple[str, list[dict[str, Any]]]:
    text = path.read_text(encoding="utf-8", errors="replace")
    if path.suffix.lower() == ".json":
        try:
            parsed = conversation_units(json.loads(text))
            if parsed: return parsed
        except json.JSONDecodeError:
            pass
    return text_units(text)


def split_oversized(unit: dict[str, Any], target: int) -> list[dict[str, Any]]:
    if words(unit["text"]) <= target * 2: return [unit]
    toks = unit["text"].split()
    out = []
    for n, pos in enumerate(range(0, len(toks), target)):
        u = dict(unit); u["text"] = " ".join(toks[pos:pos+target]) + "\n"
        u["subrange"] = {"word_start": pos + 1, "word_end": min(pos + target, len(toks)), "part": n + 1}
        out.append(u)
    return out


def packetize(units: list[dict[str, Any]], target: int) -> list[list[dict[str, Any]]]:
    expanded = [piece for u in units for piece in split_oversized(u, target)]
    packets, cur, wc = [], [], 0
    for u in expanded:
        uw = words(u["text"])
        if cur and wc + uw > target * 1.25:
            packets.append(cur); cur, wc = [], 0
        cur.append(u); wc += uw
        if wc >= target: packets.append(cur); cur, wc = [], 0
    if cur: packets.append(cur)
    return packets


def main() -> None:
    ap = argparse.ArgumentParser(description="Feed a large permitted source into bounded, resumable reading packets.")
    ap.add_argument("source", type=Path)
    ap.add_argument("--output", type=Path, required=True)
    ap.add_argument("--target-words", type=int, default=1250)
    ap.add_argument("--source-repo", default=None)
    ap.add_argument("--source-ref", default=None)
    args = ap.parse_args()
    if args.target_words < 200: raise SystemExit("--target-words must be >= 200")
    source = args.source.resolve(); reject_quarantine(source)
    raw = source.read_bytes(); source_hash = sha256(raw); short = source_hash[:12]
    parser, units = load_units(source); packets = packetize(units, args.target_words)
    out = args.output.resolve() / short; out.mkdir(parents=True, exist_ok=True)
    entries = []
    for i, group in enumerate(packets, 1):
        pid = f"{short}:p{i:06d}"; text = "\n".join(u["text"].rstrip() for u in group).rstrip()+"\n"
        pdata = text.encode(); name = f"p{i:06d}.txt"; (out/name).write_bytes(pdata)
        entries.append({"packet_id": pid, "packet_index": i, "file": name,
            "source_path": str(source), "source_sha256": source_hash,
            "source_start": group[0]["start"], "source_end": group[-1]["end"],
            "word_count": words(text), "character_count": len(text), "packet_sha256": sha256(pdata),
            "previous_packet_id": f"{short}:p{i-1:06d}" if i > 1 else None,
            "next_packet_id": f"{short}:p{i+1:06d}" if i < len(packets) else None})
    manifest = {"schema": "hsh-large-document-feeder-v1", "derived": True, "source_modified": False,
        "source": {"path": str(source), "sha256": source_hash, "repository": args.source_repo, "ref": args.source_ref},
        "parser": parser, "target_words": args.target_words, "overlap": {"enabled": False},
        "quarantine": {"prior_art_allowed": False, "policy": "hard-excluded-by-interface"},
        "packet_count": len(entries), "packets": entries}
    (out/"manifest.json").write_text(json.dumps(manifest, indent=2, ensure_ascii=False)+"\n", encoding="utf-8")
    print(json.dumps({"manifest": str(out/"manifest.json"), "packet_count": len(entries), "source_sha256": source_hash}))

if __name__ == "__main__": main()
