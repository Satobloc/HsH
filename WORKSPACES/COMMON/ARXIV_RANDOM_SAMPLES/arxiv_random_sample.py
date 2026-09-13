#!/usr/bin/env python3
"""Reproducible random pull of arXiv physics abstracts, Jan-Sep 2024/25/26.

Sampling design
---------------
arXiv's search API has no random sort. For each year this script:
1. queries the Jan-1 through Sep-30 submittedDate interval across ALL arXiv;
2. reads totalResults;
3. draws uniformly random start offsets in that result ordering;
4. fetches short windows at those offsets;
5. retains records having at least one physics-family category;
6. deduplicates by arXiv id and randomly selects exactly N retained records.

Conditioning a uniform random sample of the all-arXiv result ordering on physics
membership avoids hand-weighting physics subfields. A fixed seed makes the pull
reproducible. Random-window clustering means this is an approximate probability
sample, not a claim of perfect IID sampling.
"""
from __future__ import annotations
import argparse, csv, json, random, re, time, urllib.error, urllib.parse, urllib.request
import xml.etree.ElementTree as ET
from dataclasses import asdict, dataclass
from pathlib import Path

API = "https://export.arxiv.org/api/query"
NS = {"atom":"http://www.w3.org/2005/Atom","opensearch":"http://a9.com/-/spec/opensearch/1.1/"}
DELAY = 4.0
WINDOW = 100
MAX_WINDOWS = 12
MAX_RETRIES = 5
PHYS_PREFIXES = ("astro-ph", "cond-mat", "gr-qc", "hep-", "nucl-", "physics.", "quant-ph", "math-ph", "nlin.")

@dataclass
class Paper:
    year:int; arxiv_id:str; title:str; abstract:str; published:str; updated:str
    authors:str; primary_category:str; categories:str; link:str

def ws(s): return re.sub(r"\s+"," ",s or "").strip()

def query_for(year:int)->str:
    return f"submittedDate:[{year}01010000 TO {year}09302359]"

def request_feed(query,start,max_results):
    params={"search_query":query,"start":start,"max_results":max_results,"sortBy":"submittedDate","sortOrder":"ascending"}
    url=API+"?"+urllib.parse.urlencode(params)
    headers={"User-Agent":"HsH-ArxivSampler/1.3 contact:nathanmcknight@users.noreply.github.com"}
    last=None
    for attempt in range(MAX_RETRIES):
        try:
            req=urllib.request.Request(url,headers=headers)
            with urllib.request.urlopen(req,timeout=90) as r: return ET.fromstring(r.read())
        except urllib.error.HTTPError as e:
            last=e
            if e.code not in (429,500,502,503,504): raise
            wait=min(90,15*(2**attempt)); print(f"API {e.code}; retry {attempt+1}/{MAX_RETRIES} after {wait}s",flush=True); time.sleep(wait)
        except Exception as e:
            last=e; wait=min(60,10*(2**attempt)); print(f"API error {e}; retry after {wait}s",flush=True); time.sleep(wait)
    raise RuntimeError(f"arXiv API failed after retries: {last}")

def total_results(feed):
    x=feed.find("opensearch:totalResults",NS); return int(x.text) if x is not None and x.text else 0

def physics_record(cats:list[str])->bool:
    return any(c.startswith(PHYS_PREFIXES) for c in cats)

def parse(feed,year):
    out=[]
    for e in feed.findall("atom:entry",NS):
        rid=ws(e.findtext("atom:id",default="",namespaces=NS)); aid=rid.rsplit("/",1)[-1]
        pub=ws(e.findtext("atom:published",default="",namespaces=NS))
        if not pub.startswith(f"{year}-"): continue
        try: month=int(pub[5:7])
        except Exception: continue
        if not 1<=month<=9: continue
        cats=[c.attrib.get("term","") for c in e.findall("atom:category",NS)]
        if not physics_record(cats): continue
        p=e.find("{http://arxiv.org/schemas/atom}primary_category")
        out.append(Paper(
            year,aid,
            ws(e.findtext("atom:title",default="",namespaces=NS)),
            ws(e.findtext("atom:summary",default="",namespaces=NS)),pub,
            ws(e.findtext("atom:updated",default="",namespaces=NS)),
            "; ".join(ws(a.findtext("atom:name",default="",namespaces=NS)) for a in e.findall("atom:author",NS)),
            p.attrib.get("term","") if p is not None else "",
            "; ".join(cats),rid))
    return out

def fetch_year(year,n,rng):
    q=query_for(year)
    first=request_feed(q,0,1); total=total_results(first)
    if total<n: raise RuntimeError(f"{year}: totalResults={total}, smaller than requested n={n}")
    print(f"{year}: all-arXiv totalResults={total}",flush=True)
    cand={}; offsets=[]
    for i in range(MAX_WINDOWS):
        start=rng.randint(0,max(0,total-WINDOW)); offsets.append(start)
        if i: time.sleep(DELAY)
        feed=request_feed(q,start,WINDOW)
        for p in parse(feed,year): cand[p.arxiv_id]=p
        print(f"{year}: window {i+1}, offset={start}, physics candidates={len(cand)}",flush=True)
        if len(cand)>=max(n*2,150): break
    if len(cand)<n: raise RuntimeError(f"{year}: only {len(cand)} unique physics candidates after {len(offsets)} random windows")
    ids=rng.sample(sorted(cand),n); papers=[cand[i] for i in ids]; rng.shuffle(papers)
    meta={
      "year":year,"period":f"{year}-01-01 through {year}-09-30","n":n,
      "all_arxiv_total_results":total,"candidate_pool_unique_physics":len(cand),
      "windows_requested":len(offsets),"window_size":WINDOW,"random_start_offsets":offsets,
      "query":q,"physics_category_prefixes":PHYS_PREFIXES,
      "sampling_note":"Uniform random offsets in the all-arXiv submittedDate-ordered Jan-Sep result set; retain records with a physics-family category; deduplicate; fixed-seed simple random sample from retained candidates. Approximate probability sample because records arrive in windows rather than independent single draws."
    }
    return papers,meta

def write_csv(path,papers):
    path.parent.mkdir(parents=True,exist_ok=True); fields=list(Paper.__dataclass_fields__)
    with path.open("w",newline="",encoding="utf-8") as f:
        w=csv.DictWriter(f,fieldnames=fields); w.writeheader();
        for p in papers: w.writerow(asdict(p))

def main():
    a=argparse.ArgumentParser(); a.add_argument("--years",nargs="+",type=int,default=[2024,2025,2026]); a.add_argument("--n",type=int,default=100); a.add_argument("--seed",type=int,default=20260912); a.add_argument("--out",type=Path,default=Path("results")); x=a.parse_args()
    x.out.mkdir(parents=True,exist_ok=True); allp=[]; metas={}
    for y in x.years:
        p,m=fetch_year(y,x.n,random.Random(x.seed+y)); allp+=p; metas[str(y)]=m
        write_csv(x.out/f"arxiv_random_{x.n}_{y}_jan_sep.csv",p)
        (x.out/f"arxiv_random_{x.n}_{y}_jan_sep.json").write_text(json.dumps({"metadata":m,"papers":[asdict(z) for z in p]},indent=2,ensure_ascii=False)+"\n",encoding="utf-8")
        time.sleep(DELAY)
    write_csv(x.out/f"arxiv_random_{x.n}_2024_2025_2026_combined.csv",allp)
    (x.out/f"arxiv_random_{x.n}_2024_2025_2026_combined.json").write_text(json.dumps({"metadata":{"seed":x.seed,"years":x.years,"per_year":metas},"papers":[asdict(z) for z in allp]},indent=2,ensure_ascii=False)+"\n",encoding="utf-8")
    (x.out/"README.md").write_text(f"# arXiv random physics abstract pull\n\n- Window: Jan 1-Sep 30 for {', '.join(map(str,x.years))}\n- Sample: {x.n} abstracts/year; {len(allp)} total\n- Fixed seed: `{x.seed}`\n- Source: arXiv Atom search API\n- Method: random offsets over the complete date-bounded arXiv result ordering; condition on physics-category membership; deduplicate; random select.\n\nThis is reproducible and designed for structural comparison. It is an approximate probability sample rather than perfect IID sampling because API records are fetched in short windows. Exact offsets and source metadata are preserved in the JSON files.\n",encoding="utf-8")
    print(f"Wrote {len(allp)} papers to {x.out}",flush=True)
if __name__=="__main__": main()
