#!/usr/bin/env python3
"""Read-only integrity audit for the five-lease REVROT3 identity rotation.

Standard library only. No GitHub API access, scheduler mutations, private
conversation reads, or artifact writes. Audit only the named Common folders.

Usage:
  python tools/audit_revival_rotation_v3.py --root . --json
  python tools/audit_revival_rotation_v3.py --self-test
"""
from __future__ import annotations

import argparse
import json
import re
import tempfile
from dataclasses import dataclass, field
from datetime import datetime, timedelta, timezone
from pathlib import Path

RING = (
    "Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira", "Aldus",
    "Calder", "Hale", "Elias Kern", "Nadir Voss", "Enheduanna",
    "Tern Rook", "Morrow", "Kestrel", "Meridian", "Mercer", "Ravel", "Orson Vay",
)
EPOCH = datetime(2026, 10, 11, tzinfo=timezone.utc)
PHASE = (0, 12, 24, 36, 48)
KEY = re.compile(r"^REVROT3-19-20261011:(-?\d+):s([0-4])$")
LEGACY_KEY = re.compile(r"^REVROT3-19-(?!20261011)(\d{8}):(\d{2}):s([0-4])$")
BOLD_FIELD = re.compile(r"^\s*-\s*\*\*(.+?):\*\*\s*(.+?)\s*$")
PLAIN_FIELD = re.compile(r"^\s*(?:-\s*)?([A-Za-z][A-Za-z0-9_ -]*):\s*(.*?)\s*$")
STRUCTURED_FIELDS = {
    "run_key", "selected_identity", "selected", "worker_identity",
    "next_identity", "next_selected", "next_run_key",
    "delivery_verified", "checkin_status", "count_this_as_miss",
    "reconstruction_trigger", "participation_class", "status",
    "from_run_key", "to_run_key", "sender_identity", "recipient_identity",
    "from_identity", "to_identity", "from_selected", "recipient_selected",
    "chat_delivery_state", "historical_chat_delivery",
    "delivery_counts_as_invitation", "verified_message_id",
    "chat_message_id", "delivery_receipt_id", "handoff_class",
    "run", "selection", "thread_status", "selected_ring_index", "next_ring_index",
}
KEY_FIELDS = {"run_key", "from_run_key", "to_run_key", "next_run_key"}
METADATA_SECTIONS = {"rotation", "run metadata", "receipt metadata", "handoff metadata"}
STAMP = re.compile(r"^(\d{4}-\d{2}-\d{2}T\d{4}Z)_")

def field_name(value):
    return value.strip().lower().replace(" ", "_").replace("-", "_")

def data(text, conflicts=None):
    """Parse recognized metadata fields, including named Rotation/Run Metadata sections."""
    result = {}
    for line in text.splitlines():
        if line.lstrip().startswith("## "):
            section = line.lstrip()[3:].strip().lower()
            if section not in METADATA_SECTIONS:
                break
            continue
        match = BOLD_FIELD.fullmatch(line) or PLAIN_FIELD.fullmatch(line)
        if not match:
            continue
        key = field_name(match[1])
        if key not in STRUCTURED_FIELDS:
            continue
        value = match[2].strip().strip(chr(96))
        if key in KEY_FIELDS and ";" in value:
            value = value.split(";", 1)[0].strip().strip(chr(96))
        if key in result and result[key] != value:
            if conflicts is not None:
                conflicts.append((key, result[key], value))
            continue
        result[key] = value
    return result

def parse_key(value):
    raw = (value or "").strip().strip(chr(96)).rstrip(";").strip()
    m = KEY.fullmatch(raw)
    if m:
        return int(m[1]), int(m[2])
    legacy = LEGACY_KEY.fullmatch(raw)
    if legacy:
        moment = datetime.strptime(legacy[1] + legacy[2], "%Y%m%d%H").replace(tzinfo=timezone.utc)
        hours = (moment - EPOCH).total_seconds() / 3600
        if hours.is_integer():
            return int(hours), int(legacy[3])
    return None

def canonical_identity(value):
    if not value:
        return None
    raw = value.strip().strip(chr(96))
    for name in sorted(RING, key=len, reverse=True):
        if raw == name or re.match(rf"^{re.escape(name)}(?=$|[\s,(\-—])", raw):
            return name
    return raw

def identity_hint(text, which):
    header = []
    for line in text.splitlines():
        if line.lstrip().startswith("## "):
            section = line.lstrip()[3:].strip().lower()
            if section not in METADATA_SECTIONS:
                break
        header.append(line)
    source = "\n".join(header)
    for name in sorted(RING, key=len, reverse=True):
        if which == "selected":
            patterns = (
                rf"\bselected\s+ring\[\d+\]\s+{re.escape(name)}\b",
                rf"(?<!next )\bindex\s*=\s*\d+\s+{re.escape(name)}\b",
                rf"\bselected\s+ring\s+index\s*:\s*\d+\s*=\s*{re.escape(name)}\b",
                rf"(?<!next )\bring\s+index\s+\d+\s*=\s*{re.escape(name)}\b",
            )
        else:
            patterns = (
                rf"\bnext\s+ring\[\d+\]\s+{re.escape(name)}\b",
                rf"\bnext\s+index\s*=\s*\d+\s+{re.escape(name)}\b",
                rf"\bnext\s+ring\s+index\s*:\s*\d+\s*(?:=|:)\s*{re.escape(name)}\b",
                rf"\bnext\s+index\s*:\s*\d+\s*(?:=|:)\s*{re.escape(name)}\b",
                rf"\bnext\s+index\s+\d+\s*=\s*{re.escape(name)}\b",
            )
        if any(re.search(pattern, source, flags=re.I) for pattern in patterns):
            return name
    return None

def identity(h, s):
    return RING[(5 * h + s) % len(RING)]

def next_hop(h, s):
    return h + (s == 4), (s + 1) % 5

@dataclass
class Audit:
    errors: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)
    receipts: dict[tuple[int, int], str] = field(default_factory=dict)
    handoffs: dict[tuple[int, int], str] = field(default_factory=dict)
    out_of_band: list[str] = field(default_factory=list)

    def error(self, p, msg):
        self.errors.append(f"{p.name}: {msg}")

    def check_stamp(self, p, h, s):
        match = STAMP.match(p.name)
        expected = (EPOCH + timedelta(hours=h, minutes=PHASE[s])).strftime("%Y-%m-%dT%H%MZ")
        if not match:
            self.warnings.append(f"{p.name}: timestamp not machine-readable")
        elif match[1] != expected:
            self.error(p, f"timestamp {match[1]} != {expected}")

    def receipt(self, p):
        text = p.read_text(encoding="utf-8")
        conflicts = []
        d = data(text, conflicts)
        for key_name, earlier, later in conflicts:
            self.error(p, f"conflicting structured field {key_name}: {earlier!r} vs {later!r}")
        raw_key = d.get("run_key") or d.get("run")
        key = parse_key(raw_key)
        if not key:
            self.error(p, "invalid/missing run_key")
            return
        h, s = key
        if LEGACY_KEY.fullmatch((raw_key or "").strip().strip(chr(96))):
            self.warnings.append(f"{p.name}: legacy display-date run_key normalized to epoch-hour form")
        self.check_stamp(p, h, s)
        if key in self.receipts:
            self.error(p, f"duplicate receipt, earlier: {self.receipts[key]}")
        self.receipts[key] = p.name
        selected_raw = d.get("selected_identity") or d.get("selected") or d.get("worker_identity")
        selected = canonical_identity(selected_raw) or identity_hint(text, "selected")
        if not selected_raw and selected:
            self.warnings.append(f"{p.name}: selected identity recovered from explicit ring-index header")
        if selected != identity(h, s):
            self.error(p, f"selected identity not ring[{5*h+s} mod 19]")
        next_raw = d.get("next_identity") or d.get("next_selected")
        next_identity = canonical_identity(next_raw) or identity_hint(text, "next")
        if next_identity and next_identity != identity(*next_hop(h, s)):
            self.error(p, "next identity mismatch")
        if "next_run_key" in d and parse_key(d["next_run_key"]) != next_hop(h, s):
            self.error(p, "next run key mismatch")
        f = re.search(r"_s([0-4])_", p.name)
        if f and int(f[1]) != s:
            self.error(p, "filename slot != run_key slot")
        delivered = d.get("delivery_verified", "").lower() in ("true", "yes")
        status = d.get("checkin_status", "").upper()
        if not delivered and d.get("count_this_as_miss", "").lower() in ("true", "yes", "1"):
            self.error(p, "undelivered invitation counted as missed check-in")
        if status in ("INVITATION_UNDELIVERED", "DELIVERY_BLOCKED") and d.get("reconstruction_trigger", "").upper() in ("MISSED_TWO_VERIFIED_INVITATIONS", "TWO_MISSED"):
            self.error(p, "new instance triggered by undelivered invitation")
        if "REVIVED_INSTANCE_EXECUTED" in d.get("participation_class", "") and "NO_ACCESS" in d.get("status", ""):
            self.error(p, "NO_ACCESS receipt claims genuine revived execution")

    def handoff(self, p):
        text = p.read_text(encoding="utf-8")
        conflicts = []
        d = data(text, conflicts)
        for key_name, earlier, later in conflicts:
            self.error(p, f"conflicting structured field {key_name}: {earlier!r} vs {later!r}")
        raw_src = d.get("from_run_key") or d.get("run_key") or d.get("run")
        src = parse_key(raw_src)
        dst = parse_key(d.get("to_run_key"))
        if not src:
            self.error(p, "invalid/missing from_run_key or legacy Run key")
            return
        h, s = src
        if not dst:
            candidate = next_hop(h, s)
            f = re.search(r"_from_s([0-4])_to_s([0-4])_", p.name)
            next_hint = canonical_identity(d.get("recipient_identity") or d.get("to_identity") or d.get("recipient_selected")) or identity_hint(text, "next")
            if f and (int(f[1]), int(f[2])) == (s, candidate[1]) and next_hint == identity(*candidate):
                dst = candidate
                self.warnings.append(f"{p.name}: legacy handoff omitted to_run_key; successor derived from ring rule, filename and next-identity witness")
            else:
                self.error(p, "invalid/missing to_run_key; legacy successor could not be independently cross-checked")
                return
        if LEGACY_KEY.fullmatch((raw_src or "").strip().strip(chr(96))) or LEGACY_KEY.fullmatch((d.get("to_run_key") or "").strip().strip(chr(96))):
            self.warnings.append(f"{p.name}: legacy display-date handoff key normalized to epoch-hour form")
        self.check_stamp(p, h, s)
        if src in self.handoffs:
            self.error(p, f"duplicate handoff, earlier: {self.handoffs[src]}")
        self.handoffs[src] = p.name
        if dst != next_hop(h, s):
            self.error(p, f"wrong successor key: {dst} != {next_hop(h,s)}")
        sender_raw = d.get("sender_identity") or d.get("from_identity") or d.get("from_selected")
        recipient_raw = d.get("recipient_identity") or d.get("to_identity") or d.get("recipient_selected")
        sender = canonical_identity(sender_raw) or identity_hint(text, "selected")
        recipient = canonical_identity(recipient_raw) or identity_hint(text, "next")
        if not d.get("sender_identity") and sender:
            self.warnings.append(f"{p.name}: sender identity recovered from documented alias/index field")
        if not d.get("recipient_identity") and recipient:
            self.warnings.append(f"{p.name}: recipient identity recovered from documented alias/index field")
        if sender != identity(*src):
            self.error(p, "sender identity mismatch")
        if recipient != identity(*dst):
            self.error(p, "recipient identity mismatch")
        f = re.search(r"_from_s([0-4])_to_s([0-4])_", p.name)
        if f and (int(f[1]), int(f[2])) != (s, dst[1]):
            self.error(p, "filename routing slots mismatch")
        chat_raw = d.get("chat_delivery_state") or d.get("historical_chat_delivery")
        chat = (chat_raw or "").upper()
        if chat in ("UNAVAILABLE_NOT_SENT", "CHAT_POST_UNAVAILABLE", "CHAT_DELIVERY_UNAVAILABLE"):
            chat = "UNAVAILABLE"
            self.warnings.append(f"{p.name}: unavailable chat status normalized from explicit alias")
        invitation = d.get("delivery_counts_as_invitation", "").lower()
        if chat == "UNAVAILABLE" and invitation in ("true", "yes", "1"):
            self.error(p, "unavailable chat delivery counted as an invitation")
        if chat == "VERIFIED_CHAT_MESSAGE" and not any(d.get(k) for k in
           ("verified_message_id", "chat_message_id", "delivery_receipt_id")):
            self.error(p, "claimed chat delivery lacks message-level evidence")
        if not chat:
            self.warnings.append(f"{p.name}: chat_delivery_state missing")

    def check(self, root):
        base = Path(root) / "WORKSPACES" / "COMMON"
        for subdir, inspect in (("REVIVAL_ROTATION_RECEIPTS", self.receipt),
                                ("REVIVAL_ROTATION_HANDOFFS", self.handoff)):
            directory = base / subdir
            if not directory.is_dir():
                self.warnings.append(f"{subdir}: missing or empty")
                continue
            for file in sorted(directory.glob("*.md")):
                if file.is_symlink():
                    self.error(file, "symlinks not accepted")
                    continue
                if subdir == "REVIVAL_ROTATION_RECEIPTS" and not re.search(r"_s[0-4]_", file.name):
                    self.warnings.append(f"{file.name}: supporting note in receipts directory, not a run receipt")
                    continue
                # Manual continuations and retrospectively recovered records are
                # valuable evidence but NOT proof of a nominal scheduler firing.
                # Never apply strict on-time stamp/run-key assertions to them.
                full_text = file.read_text(encoding="utf-8")
                beginning = full_text[:800]
                if "_manual" in file.name.lower() or "Retrospective recovery receipt" in beginning:
                    kind = "manual" if "_manual" in file.name.lower() else "retrospective"
                    self.out_of_band.append(f"{file.name}: {kind}")
                    self.warnings.append(f"{file.name}: {kind} evidence, excluded from scheduled-run totals")
                    continue
                if subdir == "REVIVAL_ROTATION_HANDOFFS":
                    fields = data(full_text)
                    first_line = next((line.strip() for line in full_text.splitlines() if line.strip()), "")
                    context_marker = (
                        first_line.lower().startswith("# optional handoff")
                        or fields.get("handoff_class", "").upper().startswith("CONTEXT_ONLY")
                        or "CONTEXT_ONLY / NO_TASK_TRANSFER" in beginning
                    )
                    no_run_keys = not fields.get("from_run_key") and not fields.get("to_run_key")
                    if context_marker and no_run_keys:
                        self.out_of_band.append(f"{file.name}: context-only handoff")
                        self.warnings.append(f"{file.name}: context-only handoff, excluded from scheduled-run totals")
                        continue
                inspect(file)
        for key, name in self.receipts.items():
            if key not in self.handoffs:
                self.warnings.append(f"{name}: terminal handoff missing for this recorded run")
            predecessor = (key[0] - (key[1] == 0), (key[1] - 1) % 5)
            if predecessor in self.receipts and predecessor not in self.handoffs:
                self.warnings.append(f"{name}: predecessor has receipt but no handoff")
        return {
            "status": "FAIL" if self.errors else "PASS_WITH_WARNINGS" if self.warnings else "PASS",
            "read_only": True, "receipts": len(self.receipts), "handoffs": len(self.handoffs),
            "out_of_band": self.out_of_band,
            "errors": self.errors, "warnings": self.warnings,
            "limit": "Repository evidence only; never establishes actual ChatGPT thread receipt."
        }

def self_test():
    assert len(RING) == 19 and len(set(RING)) == 19
    assert len({identity(h, s) for h in range(4) for s in range(5) if 5*h+s < 19}) == 19
    assert next_hop(12, 4) == (13, 0)
    assert (identity(12, 3), identity(12, 4)) == ("Aldus", "Calder")
    with tempfile.TemporaryDirectory() as temp:
        base = Path(temp) / "WORKSPACES" / "COMMON"
        r = base / "REVIVAL_ROTATION_RECEIPTS"
        h = base / "REVIVAL_ROTATION_HANDOFFS"
        r.mkdir(parents=True); h.mkdir()
        receipt = r / "2026-10-11T1236Z_s3_aldus.md"
        packet = h / "2026-10-11T1236Z_from_s3_to_s4_calder.md"
        receipt.write_text("- **run_key:** REVROT3-19-20261011:12:s3\n- **selected_identity:** Aldus\n- **next_identity:** Calder\n- **next_run_key:** REVROT3-19-20261011:12:s4\n- **delivery_verified:** false\n", encoding="utf-8")
        packet.write_text("- **from_run_key:** REVROT3-19-20261011:12:s3\n- **to_run_key:** REVROT3-19-20261011:12:s4\n- **sender_identity:** Aldus\n- **recipient_identity:** Calder\n- **chat_delivery_state:** UNAVAILABLE\n- **delivery_counts_as_invitation:** false\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "PASS"
        receipt.write_text("run_key: REVROT3-19-20261011:12:s3\nselected_identity: Aldus\nnext_identity: Calder\nnext_run_key: REVROT3-19-20261011:12:s4\ndelivery_verified: false\n", encoding="utf-8")
        packet.write_text("from_run_key: REVROT3-19-20261011:12:s3\nto_run_key: REVROT3-19-20261011:12:s4\nsender_identity: Aldus\nrecipient_identity: Calder\nchat_delivery_state: UNAVAILABLE\ndelivery_counts_as_invitation: false\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "PASS"
        receipt.write_text(receipt.read_text() + "count_this_as_miss: true\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "FAIL"
        receipt.write_text(receipt.read_text().replace("count_this_as_miss: true\n", ""), encoding="utf-8")
        packet.write_text(packet.read_text().replace(":s4\n", ":s3\n"), encoding="utf-8")
        assert Audit().check(temp)["status"] == "FAIL"

        receipt.write_text("- run_key: REVROT3-19-20261011:12:s3; h=12, seq=63, index=6 Aldus; next index=7 Calder.\n", encoding="utf-8")
        packet.write_text("from_run_key: REVROT3-19-20261011:12:s3\nto_run_key: REVROT3-19-20261011:12:s4\nfrom_selected: Aldus-selected, current assistant reconstruction\nrecipient_selected: Calder (7)\nhistorical_chat_delivery: UNAVAILABLE_NOT_SENT\ndelivery_counts_as_invitation: false\n", encoding="utf-8")
        result = Audit().check(temp)
        assert result["status"] == "PASS_WITH_WARNINGS" and not result["errors"]

        assert parse_key("REVROT3-19-20261011:12:s3") == (12, 3)
        assert not LEGACY_KEY.fullmatch("REVROT3-19-20261011:12:s3")
        assert parse_key("REVROT3-19-20261012:07:s3") == (31, 3)
        assert parse_key("REVROT3-19-20261010:23:s4") == (-1, 4)

        optional = h / "2026-10-31T0224Z_from_s2_to_s0_sable.md"
        optional.write_text("# Optional handoff | Orson Vay -> Sable\n\nRepository-only context.\n", encoding="utf-8")
        result = Audit().check(temp)
        assert result["status"] == "PASS_WITH_WARNINGS"
        assert result["handoffs"] == 1 and any("context-only handoff" in w for w in result["warnings"])

        malformed = h / "2026-10-11T1236Z_from_s3_to_s0_unknown.md"
        malformed.write_text("# Handoff\nNo machine run keys.\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "FAIL"

        conflicts = []
        parsed = data("run_key: REVROT3-19-20261011:12:s3\nrun_key: REVROT3-19-20261011:12:s4\n## Narrative\nrun_key: REVROT3-19-20261011:12:s0\n", conflicts)
        assert parsed["run_key"] == "REVROT3-19-20261011:12:s3"
        assert conflicts == [("run_key", "REVROT3-19-20261011:12:s3", "REVROT3-19-20261011:12:s4")]

    with tempfile.TemporaryDirectory() as temp:
        base = Path(temp) / "WORKSPACES" / "COMMON"
        r = base / "REVIVAL_ROTATION_RECEIPTS"
        h = base / "REVIVAL_ROTATION_HANDOFFS"
        r.mkdir(parents=True); h.mkdir()
        receipt = r / "2026-10-31T0224Z_s2_orson_vay.md"
        receipt.write_text("## Rotation\n- Run key: REVROT3-19-20261011:482:s2\n- Selected ring index: 18 = Orson Vay\n- Next ring index: 0: Sable\n## Continuity and authority\n- Run key: narrative must not override metadata.\n", encoding="utf-8")
        result = Audit().check(temp)
        assert result["status"] == "PASS_WITH_WARNINGS" and not result["errors"]
        assert result["receipts"] == 1

    with tempfile.TemporaryDirectory() as temp:
        base = Path(temp) / "WORKSPACES" / "COMMON"
        r = base / "REVIVAL_ROTATION_RECEIPTS"
        h = base / "REVIVAL_ROTATION_HANDOFFS"
        r.mkdir(parents=True); h.mkdir()
        receipt = r / "2026-10-11T1236Z_s3_aldus.md"
        receipt.write_text("run_key: REVROT3-19-20261011:12:s3\nselected_identity: Aldus\n", encoding="utf-8")
        packet = h / "2026-10-11T1236Z_from_s3_to_s4_calder.md"
        packet.write_text("**Run:** REVROT3-19-20261011:12:s3\n**Selection:** (h=12), ring index 6 = Aldus; next index 7 = Calder.\n", encoding="utf-8")
        result = Audit().check(temp)
        assert result["status"] == "PASS_WITH_WARNINGS" and not result["errors"]
        assert result["handoffs"] == 1 and any("successor derived" in w for w in result["warnings"])
        bad = h / "2026-10-11T1236Z_from_s3_to_s0_wrong.md"
        bad.write_text("**Run:** REVROT3-19-20261011:12:s3\n**Selection:** ring index 6 = Aldus; next index 7 = Calder.\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "FAIL"
    return {"status": "PASS", "checks": 17}

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--root", type=Path, default=Path("."))
    p.add_argument("--json", action="store_true")
    p.add_argument("--self-test", action="store_true")
    a = p.parse_args()
    result = self_test() if a.self_test else Audit().check(a.root)
    if a.json or a.self_test:
        print(json.dumps(result, indent=2))
    else:
        print(f"{result['status']}: {result['receipts']} receipts, {result['handoffs']} handoffs")
        for line in result["errors"] + result["warnings"]:
            print("  " + line)
    if result["status"] == "FAIL":
        raise SystemExit(1)

if __name__ == "__main__":
    main()
