#!/usr/bin/env python3
"""Compile published LaTeX paper packets to their declared PDF paths."""
from __future__ import annotations
import hashlib
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PAPERS = ROOT / "PUBLIC_SITE" / "PAPERS"

def main() -> int:
    count = 0
    for meta_path in sorted(PAPERS.glob("*/paper.json")):
        meta = json.loads(meta_path.read_text(encoding="utf-8"))
        if meta.get("published") is not True:
            continue
        source_rel = meta.get("source")
        pdf_rel = meta.get("pdf")
        if not source_rel or Path(source_rel).suffix.lower() != ".tex":
            continue
        source = ROOT / source_rel
        pdf = ROOT / pdf_rel
        if not source.is_file():
            raise SystemExit(f"Missing LaTeX source for {meta.get('id')}: {source_rel}")
        if source.parent != pdf.parent:
            raise SystemExit(f"PDF and LaTeX source must share a packet directory: {meta.get('id')}")
        for _ in range(2):
            subprocess.run(
                ["pdflatex", "-interaction=nonstopmode", "-halt-on-error", "-jobname=paper", source.name],
                cwd=source.parent,
                check=True,
            )
        if not pdf.is_file() or pdf.stat().st_size == 0:
            raise SystemExit(f"LaTeX did not produce a PDF for {meta.get('id')}")
        for suffix in (".aux", ".log", ".out", ".toc", ".fls", ".synctex.gz"):
            aux = source.parent / ("paper" + suffix)
            if aux.exists():
                aux.unlink()
        digest = hashlib.sha256(pdf.read_bytes()).hexdigest()
        print(f"COMPILED {meta.get('id')} {digest}")
        count += 1
    print(f"COMPILED_COUNT={count}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
