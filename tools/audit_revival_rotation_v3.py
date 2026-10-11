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
FIELD = re.compile(r"^\s*-\s*\*\*(.+?):\*\*\s*(.+?)\s*$", re.M)
STAMP = re.compile(r"^(\d{4}-\d{2}-\d{2}T\d{4}Z)_")

def data(text):
    return {k.strip().lower().replace(" ", "_"): v.strip().strip(chr(96))
            for k, v in FIELD.findall(text)}

def parse_key(value):
    m = KEY.fullmatch((value or "").strip(chr(96)))
    return (int(m[1]), int(m[2])) if m else None

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
        d = data(p.read_text(encoding="utf-8"))
        key = parse_key(d.get("run_key"))
        if not key:
            self.error(p, "invalid/missing run_key")
            return
        h, s = key
        self.check_stamp(p, h, s)
        if key in self.receipts:
            self.error(p, f"duplicate receipt, earlier: {self.receipts[key]}")
        self.receipts[key] = p.name
        if d.get("selected_identity") != identity(h, s):
            self.error(p, f"selected identity not ring[{5*h+s} mod 19]")
        if "next_identity" in d and d["next_identity"] != identity(*next_hop(h, s)):
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
        d = data(p.read_text(encoding="utf-8"))
        src = parse_key(d.get("from_run_key"))
        dst = parse_key(d.get("to_run_key"))
        if not src or not dst:
            self.error(p, "invalid/missing from_run_key or to_run_key")
            return
        h, s = src
        self.check_stamp(p, h, s)
        if src in self.handoffs:
            self.error(p, f"duplicate handoff, earlier: {self.handoffs[src]}")
        self.handoffs[src] = p.name
        if dst != next_hop(h, s):
            self.error(p, f"wrong successor key: {dst} != {next_hop(h,s)}")
        if d.get("sender_identity") != identity(*src):
            self.error(p, "sender identity mismatch")
        if d.get("recipient_identity") != identity(*dst):
            self.error(p, "recipient identity mismatch")
        f = re.search(r"_from_s([0-4])_to_s([0-4])_", p.name)
        if f and (int(f[1]), int(f[2])) != (s, dst[1]):
            self.error(p, "filename routing slots mismatch")
        chat = d.get("chat_delivery_state", "").upper()
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
                else:
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
        r.mkdir(parents=True)
        h.mkdir()
        receipt = r / "2026-10-11T1236Z_s3_aldus.md"
        packet = h / "2026-10-11T1236Z_from_s3_to_s4_calder.md"
        receipt.write_text("- **run_key:** REVROT3-19-20261011:12:s3\n- **selected_identity:** Aldus\n- **next_identity:** Calder\n- **next_run_key:** REVROT3-19-20261011:12:s4\n- **delivery_verified:** false\n", encoding="utf-8")
        packet.write_text("- **from_run_key:** REVROT3-19-20261011:12:s3\n- **to_run_key:** REVROT3-19-20261011:12:s4\n- **sender_identity:** Aldus\n- **recipient_identity:** Calder\n- **chat_delivery_state:** UNAVAILABLE\n- **delivery_counts_as_invitation:** false\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "PASS"
        receipt.write_text(receipt.read_text() + "- **count_this_as_miss:** true\n", encoding="utf-8")
        assert Audit().check(temp)["status"] == "FAIL"
        receipt.write_text(receipt.read_text().replace("- **count_this_as_miss:** true\n", ""), encoding="utf-8")
        packet.write_text(packet.read_text().replace(":s4\n", ":s3\n"), encoding="utf-8")
        assert Audit().check(temp)["status"] == "FAIL"
    return {"status": "PASS", "checks": 6}

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
