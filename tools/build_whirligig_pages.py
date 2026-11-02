#!/usr/bin/env python3
"""Assemble the existing Conversation Viewer with the standalone Whirligig route.

The Viewer remains the project-site root. This build adds exactly one instrument
route and does not create or replace a public-site homepage.
"""
from __future__ import annotations

import argparse
import re
import shutil
from pathlib import Path


UNIVERSAL_LINK = re.compile(
    r'\s*·\s*<a href="\.\./universal-indicatrix/index\.html"[^>]*>'
    r'Universal Indicatrix \(blind lab\)</a>'
)

REQUIRED_MARKERS = (
    "Whirligig", "Analemma", "Donomphulon", "P_ivot", "Curvy Lisa",
    "pairPreset", "differenceStatus",
)


def build(root: Path, output: Path) -> Path:
    root = root.resolve()
    viewer = root / "CONVERSATION_VIEWER"
    instrument = root / "PUBLIC_SITE" / "instruments" / "whirligig" / "index.html"
    output = output.resolve()

    if not (viewer / "index.html").is_file():
        raise FileNotFoundError("Existing Conversation Viewer root is missing")
    if not instrument.is_file():
        raise FileNotFoundError("Canonical Whirligig instrument source is missing")
    if output.exists():
        raise FileExistsError(f"Refusing to overwrite existing build directory: {output}")
    if output == root or root in output.parents is False:
        raise ValueError("Build output must be a new directory inside the repository root")

    html = instrument.read_text(encoding="utf-8")
    missing = [marker for marker in REQUIRED_MARKERS if marker not in html]
    if missing:
        raise ValueError("Whirligig source failed content checks: " + ", ".join(missing))

    # The canonical instrument includes a sibling Universal Indicatrix link.
    # This build intentionally publishes Whirligig only, so suppress that
    # one unavailable sibling link in the generated copy, not in source.
    html, removed = UNIVERSAL_LINK.subn("", html)
    if removed != 1:
        raise ValueError(f"Expected exactly one sibling instrument link, found {removed}")
    if "../universal-indicatrix/index.html" in html:
        raise ValueError("Generated Whirligig page still contains an unpublished sibling route")

    shutil.copytree(viewer, output)
    route = output / "laboratory" / "whirligig"
    route.mkdir(parents=True)
    (route / "index.html").write_text(html, encoding="utf-8")

    # Carry any future instrument-local assets without changing the Viewer.
    assets = instrument.parent / "assets"
    if assets.is_dir():
        shutil.copytree(assets, route / "assets")

    if not (output / "index.html").is_file():
        raise RuntimeError("Viewer root was not preserved in the output")
    if not (route / "index.html").is_file():
        raise RuntimeError("Whirligig route was not created")
    if (output / "glass-sausage-factory").exists():
        raise RuntimeError("Unexpected replacement homepage appeared in output")

    return route / "index.html"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path("."))
    parser.add_argument("--output", type=Path, default=Path("_site"))
    args = parser.parse_args()
    result = build(args.root, args.output)
    print(f"Built Whirligig route: {result}")


if __name__ == "__main__":
    main()
