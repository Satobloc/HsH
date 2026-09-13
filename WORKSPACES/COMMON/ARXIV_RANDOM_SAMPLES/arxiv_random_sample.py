#!/usr/bin/env python3
"""Reproducible Jan-Sep arXiv physics sampler.

arXiv has no random sort. This script therefore uses broad physics category
GROUPS, measures each group's Jan-Sep result count, allocates the requested
sample proportionally, then draws short windows from uniformly random offsets
inside each group's submitted-date ordering. Cross-listed papers are
Deduplicated by arXiv id. A fixed seed makes the pull reproducible.

This is an approximate probability sample of the physics corpus, not perfect
IID sampling. The metadata records group counts, allocations, offsets, seed,
and query strings so the pull can be audited/repeated.
"""
from __future__ import annotations
import argparse, csv, json, random, re, time, urllib.error, urllib.parse, urllib.request
import xml.etree.ElementTree as ET
from dataclasses import asdict, dataclass
from pathlib import Path

API = "https://export.arxiv.org/api/query"
NS = {"atom":"http://www.w3.org/2005/Atom","opensearch":"http://a9.com/-/spec/opensearch/1.1/"}
DELAY = 3.5
WINDOW = 40
MAX_RETRIES = 6

GROUPS = {
  "astro": ["astro-ph.CO","astro-ph.EP","astro-ph.GA","astro-ph.HE","astro-ph.IM","astro-ph.SR"],
  "condmat": ["cond-mat.dis-nn","cond-mat.mes-hall","cond-mat.mtrl-sci","cond-mat.other","cond-mat.quant-gas","cond-mat.soft","cond-mat.stat-mech","cond-mat.str-el","cond-mat.supr-con"],
  "hep_gr": ["gr-qc","hep-ex","hep-lat","hep-ph","hep-th"],
  "nuclear": ["nucl-ex","nucl-th"],
  "quantum": ["quant-ph"],
  "physics_a": ["physics.acc-ph","physics.ao-ph","physics.app-ph","physics.atom-ph","physics.atm-clus","physics.bio-ph","physics.chem-ph","physics.class-ph"],
  "physics_b": ["physics.comp-ph","physics.data-an","physics.flu-dyn","physics.gen-ph","physics.geo-ph","physics.hist-ph","physics.ins-det","physics.med-ph","physics.optics","physics.plasm-ph","physics.pop-ph","physics.soc-ph","physics.space-ph"],
  "mathphys_nlin": ["math-ph","nlin.AO","nlin.CD","nlin.CG","nlin.PS","nlin.SI"],
}

@dataclass
class Paper:
    year:int; arxiv_id:str; title:str; abstract:str; published:str; updated:str
    authors:str; primary_category:str; categories:str; link:str; sample_group:str

def ws(s): return re.sub(r"\s+"," ",s or "").strip()

def q_for(year, cats):
    c = " OR ".join(f"cat:{x}" for x in cats)
    return f"({c}) AND submittedDate:[{year}01010000 TO {year}09302359]"

def request_feed(query,start,max_results):
    params={"search_query":query,"start":start,"max_results":max_results,"sortBy":"submittedDate","sortOrder":"ascending"}
    url=API+"?"+urllib.parse.urlencode(params)
    headers={"User-Agent":"HsH-ArxivSampler/1.1 contact:nathanmcknight@users.noreply.github.com"}
    last=None
    for attempt in range(MAX_RETRIES):
        try:
            req=urllib.request.Request(url,headers=headers)
            with urllib.request.urlopen(req,timeout=90) as r: return ET.fromstring(r.read())
        except urllib.error.HTTPError as e:
            last=e
            if e.code not in (429,500,502,503,504): raise
            wait=min(90,10*(2**attempt))
            print(f"API {e.code}; retry {attempt+1}/{MAX_RETRIES} after {wait}s",flush=True)
            time.sleep(wait)
        except Exception as e:
            last=e
            wait=min(60,5*(2**attempt)); print(f"API error {e}; retry after {wait}s",flush=True); time.sleep(wait)
    raise RuntimeError(f"arXiv API failed after retries: {last}")

def total(feed):
    x=feed.find("opensearch:totalResults",NS); return int(x.text) if x is not None and x.text else 0

def parse(feed,year,group):
    out=[]
    for e in feed.findall("atom:entry",NS):
        rid=ws(e.findtext("atom:id",default="",namespaces=NS)); aid=rid.rsplit("/",1)[-1]
        pub=ws(e.findtext("atom:published",default="",namespaces=NS))
        if not pub.startswith(f"{year}-"): continue
        try: m=int(pub[5:7])
        except: continue
        if not 1<=m<=9: continue
        cats=[c.attrib.get("term","") for c in e.findall("atom:category",NS)]
        p=e.find("{http://arxiv.org/schemas/atom}primary_category")
        out.append(Paper(year,aid,ws(e.findtext("atom:title",default="",namespaces=NS)),ws(e.findtext("atom:summary",default="",namespaces=NS)),pub,ws(e.findtext("atom:updated",default="",namespaces=NS)),"; ".join(ws(a.findtext("atom:name",default="",namespaces=NS)) for a in e.findall("atom:author",NS)),p.attrib.get("term","") if p is not None else "","; ".join(cats),rid,group))
    return out

def apportion(counts,n):
    s=sum(counts.values()); raw={g:n*counts[g]/s for g in counts}; alloc={g:int(raw[g]) for g in counts}
    rem=n-sum(alloc.values())
    for g in sorted(counts,key=lambda k:(raw[k]-alloc[k],counts[k]),reverse=True)[:rem]: alloc[g]+=1
    return alloc

def fetch_year(year,n,rng):
    counts={}; queries={}
    for i,(g,cats) in enumerate(GROUPS.items()):
        if i: time.sleep(DELAY)
        q=q_for(year,cats); queries[g]=q; f=request_feed(q,0,1); counts[g]=total(f)
        print(year,g,"total",counts[g],flush=True)
    alloc=apportion(counts,n)
    chosen=[]; allcand={}; offsets={}
    for g,cats in GROUPS.items():
        need=alloc[g]; offsets[g]=[]
        if need<=0 or counts[g]<=0: continue
        cand={}; tries=0; target=max(need*3,need+20)
        while len(cand)<target and tries<8:
            start=rng.randint(0,max(0,counts[g]-WINDOW)); offsets[g].append(start)
            time.sleep(DELAY); f=request_feed(queries[g],start,WINDOW)
            for p in parse(f,year,g): cand[p.arxiv_id]=p; allcand[p.arxiv_id]=p
            tries+=1
        if len(cand)<need: raise RuntimeError(f"{year} {g}: only {len(cand)} candidates for allocation {need}")
        ids=rng.sample(sorted(cand),need); chosen.extend(cand[x] for x in ids)
    # Remove cross-group duplicates and refill from the full candidate pool if needed.
    uniq={p.arxiv_id:p for p in chosen}
    if len(uniq)<n:
        remaining=[x for x in sorted(allcand) if x not in uniq]
        for aid in rng.sample(remaining,n-len(uniq)): uniq[aid]=allcand[aid]
    papers=list(uniq.values())
    if len(papers)>n: papers=rng.sample(papers,n)
    rng.shuffle(papers)
    meta={"year":year,"period":f"{year}-01-01 through {year}-09-30","requested_n":n,"actual_n":len(papers),"seed_stream_note":"global seed + year","group_total_results":counts,"proportional_allocation":alloc,"random_start_offsets":offsets,"groups":GROUPS,"queries":queries,"window_size":WINDOW,"sampling_note":"Proportional broad-subfield stratification using arXiv totalResults, random windows at uniformly random offsets, deduplication, then fixed-seed selection. Approximate probability sample; not perfect IID."}
    return papers,meta

def write_csv(path,papers):
    fields=list(Paper.__dataclass_fields__); path.parent.mkdir(parents=True,exist_ok=True)
    with path.open("w",newline="",encoding="utf-8") as f:
        w=csv.DictWriter(f,fieldnames=fields); w.writeheader(); [w.writerow(asdict(p)) for p in papers]

def main():
    a=argparse.ArgumentParser(); a.add_argument("--years",nargs="+",type=int,default=[2024,2025,2026]); a.add_argument("--n",type=int,default=100); a.add_argument("--seed",type=int,default=20260912); a.add_argument("--out",type=Path,default=Path("results")); x=a.parse_args(); x.out.mkdir(parents=True,exist_ok=True)
    allp=[]; metas={}
    for y in x.years:
        p,m=fetch_year(y,x.n,random.Random(x.seed+y)); allp+=p; metas[str(y)]=m
        write_csv(x.out/f"arxiv_random_{x.n}_{y}_jan_sep.csv",p); (x.out/f"arxiv_random_{x.n}_{y}_jan_sep.json").write_text(json.dumps({"metadata":m,"papers":[asdict(z) for z in p]},indent=2,ensure_ascii=False)+"\n",encoding="utf-8")
    write_csv(x.out/f"arxiv_random_{x.n}_2024_2025_2026_combined.csv",allp)
    (x.out/f"arxiv_random_{x.n}_2024_2025_2026_combined.json").write_text(json.dumps({"metadata":{"seed":x.seed,"years":x.years,"per_year":metas},"papers":[asdict(z) for z in allp]},indent=2,ensure_ascii=False)+"\n",encoding="utf-8")
    (x.out/"README.md").write_text(f"# arXiv random physics abstract pull\n\n- Jan 1-Sep 30 for {', '.join(map(str,x.years))}\n- {x.n} abstracts/year; {len(allp)} total\n- fixed seed `{x.seed}`\n- broad physics corpus split into 8 category groups\n- sample allocated in proportion to arXiv `totalResults` by group, then drawn from uniformly random submitted-date offsets\n- cross-lists deduplicated by arXiv id\n\nThis is a reproducible approximate probability sample, not perfect IID sampling. Full counts, allocations, offsets, queries and categories are in the JSON metadata.\n",encoding="utf-8")
    print("Wrote",len(allp),"papers to",x.out,flush=True)
if __name__=="__main__": main()
