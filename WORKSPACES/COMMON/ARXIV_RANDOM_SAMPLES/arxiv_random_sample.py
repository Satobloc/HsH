#!/usr/bin/env python3
"""Draw reproducible random samples of physics abstracts from the arXiv API.

Method
------
For each requested year, query Jan 1 through Sep 30 across a broad set of
physics categories. arXiv's API has no random sort, so this script performs a
random-window sample over the full result ordering:

1. Query once to obtain totalResults for the year/category union.
2. Draw uniformly random start offsets across that full result set.
3. Fetch short windows from those random offsets.
4. Deduplicate by arXiv id.
5. Randomly select N papers from the accumulated candidates.

The fixed PRNG seed makes the pull reproducible. This is an approximately
uniform random-window sample of the API result set, not a stratified sample by
subfield and not a claim of perfect IID sampling.

Outputs per year: CSV + JSON. Also writes a combined CSV/JSON and README.
Standard library only.
"""
from __future__ import annotations

import argparse
import csv
import json
import random
import re
import time
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import asdict, dataclass
from pathlib import Path

API = "https://export.arxiv.org/api/query"
NS = {"atom": "http://www.w3.org/2005/Atom", "opensearch": "http://a9.com/-/spec/opensearch/1.1/"}
DELAY = 3.1
WINDOW = 20
WINDOWS_PER_YEAR = 30

# Broad physics corpus. Explicit categories avoid relying on wildcard behavior.
CATEGORIES = [
    "astro-ph.CO", "astro-ph.EP", "astro-ph.GA", "astro-ph.HE", "astro-ph.IM", "astro-ph.SR",
    "cond-mat.dis-nn", "cond-mat.mes-hall", "cond-mat.mtrl-sci", "cond-mat.other",
    "cond-mat.quant-gas", "cond-mat.soft", "cond-mat.stat-mech", "cond-mat.str-el", "cond-mat.supr-con",
    "gr-qc", "hep-ex", "hep-lat", "hep-ph", "hep-th", "math-ph", "nucl-ex", "nucl-th",
    "physics.acc-ph", "physics.ao-ph", "physics.app-ph", "physics.atom-ph", "physics.atm-clus",
    "physics.bio-ph", "physics.chem-ph", "physics.class-ph", "physics.comp-ph", "physics.data-an",
    "physics.flu-dyn", "physics.gen-ph", "physics.geo-ph", "physics.hist-ph", "physics.ins-det",
    "physics.med-ph", "physics.optics", "physics.plasm-ph", "physics.pop-ph", "physics.soc-ph",
    "physics.space-ph", "quant-ph", "nlin.AO", "nlin.CD", "nlin.CG", "nlin.PS", "nlin.SI",
]

@dataclass
class Paper:
    year: int
    arxiv_id: str
    title: str
    abstract: str
    published: str
    updated: str
    authors: str
    primary_category: str
    categories: str
    link: str


def collapse_ws(s: str) -> str:
    return re.sub(r"\s+", " ", s or "").strip()


def search_query(year: int) -> str:
    cats = " OR ".join(f"cat:{c}" for c in CATEGORIES)
    return f"({cats}) AND submittedDate:[{year}01010000 TO {year}09302359]"


def request_feed(query: str, start: int, max_results: int) -> ET.Element:
    params = {
        "search_query": query,
        "start": str(start),
        "max_results": str(max_results),
        "sortBy": "submittedDate",
        "sortOrder": "ascending",
    }
    url = API + "?" + urllib.parse.urlencode(params)
    req = urllib.request.Request(url, headers={"User-Agent": "HsH-arxiv-random-sampler/1.0 (research archive sampling)"})
    with urllib.request.urlopen(req, timeout=60) as r:
        data = r.read()
    return ET.fromstring(data)


def total_results(feed: ET.Element) -> int:
    node = feed.find("opensearch:totalResults", NS)
    return int(node.text) if node is not None and node.text else 0


def parse_entries(feed: ET.Element, year: int) -> list[Paper]:
    out: list[Paper] = []
    for e in feed.findall("atom:entry", NS):
        raw_id = collapse_ws(e.findtext("atom:id", default="", namespaces=NS))
        arxiv_id = raw_id.rsplit("/", 1)[-1]
        title = collapse_ws(e.findtext("atom:title", default="", namespaces=NS))
        abstract = collapse_ws(e.findtext("atom:summary", default="", namespaces=NS))
        published = collapse_ws(e.findtext("atom:published", default="", namespaces=NS))
        updated = collapse_ws(e.findtext("atom:updated", default="", namespaces=NS))
        authors = "; ".join(
            collapse_ws(a.findtext("atom:name", default="", namespaces=NS))
            for a in e.findall("atom:author", NS)
        )
        cats = [c.attrib.get("term", "") for c in e.findall("atom:category", NS)]
        primary = ""
        p = e.find("{http://arxiv.org/schemas/atom}primary_category")
        if p is not None:
            primary = p.attrib.get("term", "")
        link = raw_id
        out.append(Paper(year, arxiv_id, title, abstract, published, updated, authors, primary, "; ".join(cats), link))
    return out


def fetch_sample(year: int, n: int, rng: random.Random) -> tuple[list[Paper], dict]:
    query = search_query(year)
    first = request_feed(query, 0, 1)
    total = total_results(first)
    if total < n:
        raise RuntimeError(f"Only {total} results available for {year}, need {n}")
    print(f"{year}: totalResults={total}")

    candidates: dict[str, Paper] = {}
    offsets: list[int] = []
    attempts = 0
    target_candidates = max(n * 3, 250)
    while len(candidates) < target_candidates and attempts < WINDOWS_PER_YEAR:
        max_start = max(0, total - WINDOW)
        start = rng.randint(0, max_start)
        offsets.append(start)
        if attempts > 0:
            time.sleep(DELAY)
        feed = request_feed(query, start, WINDOW)
        entries = parse_entries(feed, year)
        for p in entries:
            # Keep only papers whose initial submission falls inside the requested window.
            if p.published.startswith(f"{year}-"):
                month = int(p.published[5:7]) if len(p.published) >= 7 else 99
                if 1 <= month <= 9:
                    candidates[p.arxiv_id] = p
        attempts += 1
        print(f"{year}: window {attempts}/{WINDOWS_PER_YEAR}, start={start}, unique_candidates={len(candidates)}")

    if len(candidates) < n:
        raise RuntimeError(f"Insufficient unique candidates for {year}: {len(candidates)} < {n}")

    keys = sorted(candidates)
    chosen_ids = rng.sample(keys, n)
    chosen = [candidates[k] for k in chosen_ids]
    rng.shuffle(chosen)
    meta = {
        "year": year,
        "period": f"{year}-01-01 through {year}-09-30",
        "n": n,
        "total_results_reported_by_api": total,
        "candidate_pool_unique": len(candidates),
        "windows_requested": attempts,
        "window_size": WINDOW,
        "random_start_offsets": offsets,
        "categories": CATEGORIES,
        "query": query,
        "sampling_note": "Approximately uniform random-window sample over arXiv API submittedDate ordering; deduplicated by arXiv id, then simple random sample from accumulated candidates.",
    }
    return chosen, meta


def write_csv(path: Path, papers: list[Paper]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = list(Paper.__dataclass_fields__.keys())
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for p in papers:
            w.writerow(asdict(p))


def write_json(path: Path, papers: list[Paper], meta: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps({"metadata": meta, "papers": [asdict(p) for p in papers]}, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--years", nargs="+", type=int, default=[2024, 2025, 2026])
    ap.add_argument("--n", type=int, default=100)
    ap.add_argument("--seed", type=int, default=20260912)
    ap.add_argument("--out", type=Path, default=Path("results"))
    args = ap.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)
    all_papers: list[Paper] = []
    all_meta: dict[str, dict] = {}

    for year in args.years:
        # Year-specific stream, reproducible while avoiding identical random draws across years.
        rng = random.Random(args.seed + year)
        papers, meta = fetch_sample(year, args.n, rng)
        all_papers.extend(papers)
        all_meta[str(year)] = meta
        write_csv(args.out / f"arxiv_random_{args.n}_{year}_jan_sep.csv", papers)
        write_json(args.out / f"arxiv_random_{args.n}_{year}_jan_sep.json", papers, meta)
        time.sleep(DELAY)

    write_csv(args.out / f"arxiv_random_{args.n}_2024_2025_2026_combined.csv", all_papers)
    (args.out / f"arxiv_random_{args.n}_2024_2025_2026_combined.json").write_text(
        json.dumps({"metadata": {"seed": args.seed, "years": args.years, "per_year": all_meta}, "papers": [asdict(p) for p in all_papers]}, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )

    readme = f"""# arXiv random physics abstract pull\n\nGenerated through the arXiv API by `arxiv_random_sample.py`.\n\n- Years: {', '.join(map(str, args.years))}\n- Window each year: January 1 through September 30\n- Sample size: {args.n} abstracts per year\n- Total abstracts: {len(all_papers)}\n- Fixed seed: {args.seed}\n- Corpus: broad physics-category union listed in the JSON metadata\n- Sampling: random windows over the full submitted-date-ordered API result set, followed by deduplication and simple random selection from the candidate pool\n\nThis is designed as a reproducible random research sample for structural comparison. It is not stratified to match arXiv subfield frequencies exactly, and random-window clustering means it should be treated as an approximate random pull rather than a mathematically perfect IID draw.\n"""
    (args.out / "README.md").write_text(readme, encoding="utf-8")
    print(f"Wrote {len(all_papers)} papers to {args.out}")


if __name__ == "__main__":
    main()
