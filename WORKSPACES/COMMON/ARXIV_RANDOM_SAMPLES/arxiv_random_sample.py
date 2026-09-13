#!/usr/bin/env python3
"""Reproducible random pull of 100 arXiv physics abstracts/year, Jan-Sep.

Uses arXiv's official OAI-PMH metadata API (the bulk-metadata API), not a
third-party source. Modern arXiv IDs encode submission month as YYMM.NNNNN.
For each year we sample uniformly from the rectangular ID-slot space
  months Jan..Sep x sequence 00001..MAX_SEQUENCE,
query each candidate with OAI-PMH GetRecord(metadataPrefix=arXiv), and reject
nonexistent IDs and records without a physics-family category. Conditional on
acceptance, every extant eligible ID inside that slot space has the same draw
probability. A fixed PRNG seed makes the sample reproducible.

MAX_SEQUENCE is deliberately set above observed monthly arXiv volumes; unused
slots are harmless rejections. The run metadata preserves seed, attempts,
acceptance rate, category rule, and source endpoint.
"""
from __future__ import annotations

import argparse
import csv
import json
import random
import re
import time
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import asdict, dataclass
from pathlib import Path

API = "https://oaipmh.arxiv.org/oai"
OAI_NS = "http://www.openarchives.org/OAI/2.0/"
ARXIV_NS = "http://arxiv.org/OAI/arXiv/"
PHYS_PREFIXES = ("astro-ph", "cond-mat", "gr-qc", "hep-", "nucl-", "physics.", "quant-ph", "math-ph", "nlin.")
MAX_SEQUENCE = 40000
WORKERS = 6
BATCH = 72
MAX_ATTEMPTS_PER_YEAR = 1800

@dataclass
class Paper:
    year: int
    arxiv_id: str
    title: str
    abstract: str
    created: str
    updated: str
    authors: str
    categories: str
    link: str


def ws(s: str) -> str:
    return re.sub(r"\s+", " ", s or "").strip()


def is_physics(categories: list[str]) -> bool:
    return any(c.startswith(PHYS_PREFIXES) for c in categories)


def fetch_id(arxiv_id: str, timeout: int = 45) -> Paper | None:
    params = {
        "verb": "GetRecord",
        "identifier": f"oai:arXiv.org:{arxiv_id}",
        "metadataPrefix": "arXiv",
    }
    url = API + "?" + urllib.parse.urlencode(params)
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "HsH-ArxivRandomSampler/2.0 contact:nathanmcknight@users.noreply.github.com"},
    )
    for attempt in range(4):
        try:
            with urllib.request.urlopen(req, timeout=timeout) as r:
                root = ET.fromstring(r.read())
            err = root.find(f"{{{OAI_NS}}}error")
            if err is not None:
                if err.attrib.get("code") in {"idDoesNotExist", "noRecordsMatch"}:
                    return None
                raise RuntimeError(f"OAI error for {arxiv_id}: {err.attrib.get('code')} {ws(err.text or '')}")
            md = root.find(f".//{{{OAI_NS}}}metadata")
            if md is None:
                return None
            rec = md.find(f"{{{ARXIV_NS}}}arXiv")
            if rec is None:
                return None
            rid = ws(rec.findtext(f"{{{ARXIV_NS}}}id", default=""))
            if not rid:
                return None
            created = ws(rec.findtext(f"{{{ARXIV_NS}}}created", default=""))
            updated = ws(rec.findtext(f"{{{ARXIV_NS}}}updated", default=""))
            title = ws(rec.findtext(f"{{{ARXIV_NS}}}title", default=""))
            abstract = ws(rec.findtext(f"{{{ARXIV_NS}}}abstract", default=""))
            cat_text = ws(rec.findtext(f"{{{ARXIV_NS}}}categories", default=""))
            categories = cat_text.split()
            if not is_physics(categories):
                return None
            author_names = []
            for a in rec.findall(f".//{{{ARXIV_NS}}}author"):
                key = ws(a.findtext(f"{{{ARXIV_NS}}}keyname", default=""))
                fore = ws(a.findtext(f"{{{ARXIV_NS}}}forenames", default=""))
                name = ws(f"{fore} {key}") if fore else key
                if name:
                    author_names.append(name)
            return Paper(
                year=2000 + int(rid[:2]),
                arxiv_id=rid,
                title=title,
                abstract=abstract,
                created=created,
                updated=updated,
                authors="; ".join(author_names),
                categories="; ".join(categories),
                link=f"https://arxiv.org/abs/{rid}",
            )
        except urllib.error.HTTPError as e:
            if e.code in (429, 500, 502, 503, 504) and attempt < 3:
                time.sleep(2 ** (attempt + 1))
                continue
            raise
        except (urllib.error.URLError, TimeoutError):
            if attempt < 3:
                time.sleep(2 ** (attempt + 1))
                continue
            raise
    return None


def candidate_slots(year: int, rng: random.Random):
    yy = year % 100
    slots = [(month, seq) for month in range(1, 10) for seq in range(1, MAX_SEQUENCE + 1)]
    rng.shuffle(slots)
    for month, seq in slots:
        yield f"{yy:02d}{month:02d}.{seq:05d}"


def sample_year(year: int, n: int, rng: random.Random):
    accepted: dict[str, Paper] = {}
    attempted = 0
    slot_iter = candidate_slots(year, rng)
    while len(accepted) < n and attempted < MAX_ATTEMPTS_PER_YEAR:
        ids = []
        for _ in range(min(BATCH, MAX_ATTEMPTS_PER_YEAR - attempted)):
            ids.append(next(slot_iter))
        attempted += len(ids)
        with ThreadPoolExecutor(max_workers=WORKERS) as ex:
            futures = {ex.submit(fetch_id, aid): aid for aid in ids}
            for fut in as_completed(futures):
                p = fut.result()
                if p is None:
                    continue
                # ID month/year is the sampling frame; created is retained for audit.
                if p.year != year:
                    continue
                accepted[p.arxiv_id] = p
                if len(accepted) >= n:
                    # Finish current in-flight batch but ignore overage deterministically below.
                    pass
        print(f"{year}: attempted={attempted} eligible_physics={len(accepted)}", flush=True)

    if len(accepted) < n:
        raise RuntimeError(f"{year}: only {len(accepted)} eligible physics records after {attempted} OAI probes")

    # as_completed order is nondeterministic, so choose deterministically from sorted IDs.
    chosen_ids = rng.sample(sorted(accepted), n)
    papers = [accepted[x] for x in chosen_ids]
    rng.shuffle(papers)
    metadata = {
        "year": year,
        "period": f"{year}-01 through {year}-09, encoded by modern arXiv ID month",
        "sample_size": n,
        "attempted_id_slots": attempted,
        "eligible_records_found": len(accepted),
        "acceptance_rate": len(accepted) / attempted,
        "max_sequence_slot": MAX_SEQUENCE,
        "months": list(range(1, 10)),
        "physics_category_prefixes": list(PHYS_PREFIXES),
        "api": API,
        "metadata_prefix": "arXiv",
        "method": "Uniform random YYMM.NNNNN slot probing via official arXiv OAI-PMH GetRecord; reject nonexistent/non-physics records; fixed-seed selection from eligible records.",
        "caveat": "Uniform over eligible extant modern arXiv IDs within the Jan-Sep rectangular slot frame, provided MAX_SEQUENCE exceeds each month's highest sequence. Cross-listed records qualify if any category is physics-family.",
    }
    return papers, metadata


def write_csv(path: Path, papers: list[Paper]):
    fields = list(Paper.__dataclass_fields__.keys())
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for p in papers:
            w.writerow(asdict(p))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--years", nargs="+", type=int, default=[2024, 2025, 2026])
    ap.add_argument("--n", type=int, default=100)
    ap.add_argument("--seed", type=int, default=20260912)
    ap.add_argument("--out", type=Path, default=Path("results"))
    args = ap.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)
    all_papers: list[Paper] = []
    per_year = {}
    for year in args.years:
        rng = random.Random(args.seed + year)
        papers, meta = sample_year(year, args.n, rng)
        all_papers.extend(papers)
        per_year[str(year)] = meta
        write_csv(args.out / f"arxiv_random_{args.n}_{year}_jan_sep.csv", papers)
        (args.out / f"arxiv_random_{args.n}_{year}_jan_sep.json").write_text(
            json.dumps({"metadata": meta, "papers": [asdict(p) for p in papers]}, indent=2, ensure_ascii=False) + "\n",
            encoding="utf-8",
        )

    combined_meta = {
        "seed": args.seed,
        "years": args.years,
        "n_per_year": args.n,
        "total_records": len(all_papers),
        "source": "official arXiv OAI-PMH API",
        "source_url": API,
        "per_year": per_year,
    }
    write_csv(args.out / "arxiv_random_100_2024_2025_2026_combined.csv", all_papers)
    (args.out / "arxiv_random_100_2024_2025_2026_combined.json").write_text(
        json.dumps({"metadata": combined_meta, "papers": [asdict(p) for p in all_papers]}, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    (args.out / "README.md").write_text(
        "# arXiv random physics abstract pull\n\n"
        f"- 100 abstracts per year; {len(all_papers)} total\n"
        "- Jan-Sep 2024, 2025, 2026\n"
        f"- fixed seed: `{args.seed}`\n"
        "- source: official arXiv OAI-PMH metadata API\n"
        "- sampling frame: modern arXiv ID slots `YYMM.NNNNN`, months 01-09\n"
        "- uniformly shuffled candidate slots; nonexistent and non-physics IDs rejected\n"
        "- physics-family membership is based on arXiv category prefixes, including cross-lists\n"
        "- abstracts and metadata are returned directly by the arXiv-specific OAI metadata format\n\n"
        "This dataset is intended as an auditable random corpus for structural/philosophical comparison, not keyword cherry-picking. Full method and acceptance statistics are in the JSON metadata.\n",
        encoding="utf-8",
    )
    print(f"DONE: wrote {len(all_papers)} records", flush=True)

if __name__ == "__main__":
    main()
