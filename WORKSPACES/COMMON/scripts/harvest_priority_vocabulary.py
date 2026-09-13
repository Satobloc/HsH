#!/usr/bin/env python3
"""Harvest SAT/H(s)H terminology from curated high-value document classes.

This is a seed-vocabulary generator, not a theory authority surface. It discovers
priority sources (timelines, glossaries, SAT↔standard maps, core/full-theory,
big-paper, roundup/summary/synthesis documents), extracts text, frequency-sorts
unigrams and 2–5 word phrases, suppresses common-English/document noise, preserves
source provenance, and emits a manual-review queue plus a curated machine-readable
vocabulary for downstream tagging.

PDF policy: prefer a same/stem-equivalent text extraction under
_AUTO_EXTRACTED_TEXT; otherwise use pdftotext when available. A PDF that cannot be
extracted is inventoried as unread rather than silently skipped.
"""
from __future__ import annotations

import argparse, csv, html, json, math, re, shutil, subprocess
from collections import Counter, defaultdict
from pathlib import Path
from typing import Iterable

TEXT_EXTS={".md",".txt",".tex",".html",".htm"}
WORD_RE=re.compile(r"[A-Za-zΑ-Ωα-ωθΘΦφΞξ][A-Za-z0-9Α-Ωα-ωθΘΦφΞξ_()'’./+\-⁴₄]*")
COMMON=set("""a an the and or but if then else for from into onto of to in on at by with without as is are was were be been being this that these those it its they them their we our you your i me my he she his her not no yes do does did done can could may might must shall should will would have has had having than such so very more most less least much many some any all each every both either neither one two three first second other another same different new old current later earlier here there when where why how what which who whom whose because while during before after between through over under again further also only just even still already perhaps maybe probably approximately roughly really about around per via versus vs using use used""".split())
DOC_NOISE=set("""section sections chapter chapters page pages figure figures table tables appendix appendices document documents file files folder folders source sources note notes summary summaries introduction conclusion contents index references bibliography version draft final revised revision update updated overview report reports discussion discussions paper papers theory theories model models project archive github readme pdf txt md tex author authors date dates generated assistant user chatgpt prompt response question answer item items example examples see shown following above below respectively etc""".split())
KEEP_SHORT={"sat","hsh","ui","gr","qm","qft","qcd","sm","d4","so4","su2","u1","he3","c","w"}


def norm_space(s:str)->str: return re.sub(r"\s+"," ",s).strip()
def norm_key(s:str)->str:
    s=s.replace("–","-").replace("—","-").replace("‑","-").replace("’", "'")
    return norm_space(s).lower()
def slug(s:str)->str: return re.sub(r"[^a-z0-9]+","-",norm_key(s)).strip("-").upper()

def strip_markup(text:str)->str:
    text=html.unescape(text)
    text=re.sub(r"```.*?```"," ",text,flags=re.S)
    text=re.sub(r"<script.*?</script>|<style.*?</style>"," ",text,flags=re.S|re.I)
    text=re.sub(r"<[^>]+>"," ",text)
    text=re.sub(r"\[[^\]]+\]\([^\)]+\)",lambda m:m.group(0).split("](")[0].lstrip("["),text)
    text=re.sub(r"https?://\S+"," ",text)
    text=re.sub(r"\\[A-Za-z]+(?:\[[^\]]*\])?(?:\{[^{}]*\})?"," ",text)
    return norm_space(text)

def words(text:str)->list[str]: return WORD_RE.findall(text)
def meaningful(tok:str)->bool:
    k=norm_key(tok).strip(".-_/'")
    if not k: return False
    if k in KEEP_SHORT: return True
    if len(k)<3 or k in COMMON or k in DOC_NOISE or k.isdigit(): return False
    return True

def phrase_ok(toks:list[str])->bool:
    if not toks: return False
    keys=[norm_key(x).strip(".-_/'") for x in toks]
    if keys[0] in COMMON or keys[-1] in COMMON: return False
    content=sum(meaningful(x) for x in toks)
    return content>=max(1,len(toks)-1)

def discover(root:Path, manifest:dict)->list[tuple[Path,str,float]]:
    classes=manifest["source_classes"]; always={norm_key(x) for x in manifest.get("always_include",[])}
    exts=set(manifest.get("extensions",[])); excludes=manifest.get("exclude_path_fragments",[])
    out=[]
    for p in root.rglob("*"):
        if not p.is_file() or p.suffix.lower() not in exts: continue
        rel=p.relative_to(root).as_posix(); padded="/"+rel
        if any(x in padded for x in excludes): continue
        hay=norm_key(rel)
        hits=[]
        for c in classes:
            if any(norm_key(q) in hay for q in c["patterns"]): hits.append((c["name"],float(c["weight"])))
        if norm_key(p.name) in always and not hits: hits=[("explicit",5.0)]
        if hits:
            # retain strongest class; all matching classes are recoverable from path itself
            out.append((p,*max(hits,key=lambda x:x[1])))
    return sorted(out,key=lambda x:x[0].as_posix())

def normalized_stem(p:Path)->str: return re.sub(r"[^a-z0-9]+","",p.stem.lower())
def extract_pdf(p:Path,root:Path)->tuple[str,str]:
    extracted=root/"_AUTO_EXTRACTED_TEXT"
    if extracted.exists():
        target=normalized_stem(p)
        candidates=[]
        for q in extracted.rglob("*.txt"):
            qn=normalized_stem(q)
            if qn==target or (target and (target in qn or qn in target)): candidates.append(q)
        if candidates:
            q=min(candidates,key=lambda x:abs(len(normalized_stem(x))-len(target)))
            return q.read_text(encoding="utf-8",errors="replace"),f"text-extract:{q.relative_to(root)}"
    exe=shutil.which("pdftotext")
    if exe:
        cp=subprocess.run([exe,"-layout",str(p),"-"],capture_output=True,text=True,errors="replace")
        if cp.returncode==0 and cp.stdout.strip(): return cp.stdout,"pdftotext"
    return "","unread-pdf"

def read_source(p:Path,root:Path)->tuple[str,str]:
    if p.suffix.lower()==".pdf": return extract_pdf(p,root)
    return p.read_text(encoding="utf-8",errors="replace"),"native-text"

def write_tsv(path:Path,rows:Iterable[dict],fields:list[str]):
    path.parent.mkdir(parents=True,exist_ok=True)
    with path.open("w",encoding="utf-8",newline="") as f:
        w=csv.DictWriter(f,fieldnames=fields,delimiter="\t",extrasaction="ignore"); w.writeheader(); w.writerows(rows)

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("--hsh-root",type=Path,required=True); ap.add_argument("--archive-root",type=Path,required=True)
    ap.add_argument("--manifest",type=Path,required=True); ap.add_argument("--curation",type=Path,required=True); ap.add_argument("--output",type=Path,required=True)
    args=ap.parse_args(); manifest=json.loads(args.manifest.read_text()); cur=json.loads(args.curation.read_text())
    args.output.mkdir(parents=True,exist_ok=True)
    inventory=[]; freq=Counter(); docfreq=Counter(); weighted=Counter(); prov=defaultdict(Counter); forms=defaultdict(Counter)
    roots=[("HsH",args.hsh_root),("ARCHIVE",args.archive_root)]
    for repo,root in roots:
        for p,cls,weight in discover(root,manifest):
            text,method=read_source(p,root); rel=f"{repo}/{p.relative_to(root).as_posix()}"
            inventory.append({"repository":repo,"path":rel,"source_class":cls,"weight":weight,"method":method,"characters":len(text),"status":"READ" if text else "UNREAD"})
            if not text: continue
            cleaned=strip_markup(text); toks=words(cleaned); seen=set()
            for n in range(1,6):
                for i in range(0,len(toks)-n+1):
                    chunk=toks[i:i+n]
                    if n==1 and not meaningful(chunk[0]): continue
                    if n>1 and not phrase_ok(chunk): continue
                    raw=" ".join(chunk); key=norm_key(raw)
                    if key in COMMON or key in DOC_NOISE: continue
                    freq[key]+=1; weighted[key]+=weight; prov[key][rel]+=1; forms[key][raw]+=1; seen.add(key)
            for key in seen: docfreq[key]+=1
    mins=cur.get("minimums",{}); force_in={norm_key(x) for x in cur.get("force_include",[])}; force_out={norm_key(x) for x in cur.get("force_exclude",[])}
    canon={norm_key(k):v for k,v in cur.get("canonicalize",{}).items()}
    rows=[]
    for key,n in freq.items():
        wc=len(key.split()); minf=mins.get("unigram_frequency",3) if wc==1 else mins.get("ngram_frequency",2)
        if n<minf or docfreq[key]<mins.get("document_frequency",1): continue
        form=forms[key].most_common(1)[0][0]; label=canon.get(key,form)
        specificity=1+0.35*(wc-1); dfbonus=1+math.log1p(docfreq[key]); score=weighted[key]*specificity*dfbonus
        if re.search(r"[A-Z]{2,}|[-()⁴₄]",form): score*=1.15
        status="ACCEPTED" if key in force_in else "EXCLUDED" if key in force_out else "CANDIDATE"
        rows.append({"term":label,"normalized":key,"tag":f"TERM:{slug(label)}","words":wc,"frequency":n,"document_frequency":docfreq[key],"weighted_frequency":round(weighted[key],2),"score":round(score,2),"status":status,"top_sources":" | ".join(f"{s} ({c})" for s,c in prov[key].most_common(8))})
    rows.sort(key=lambda r:(-r["score"],-r["frequency"],r["normalized"]))
    write_tsv(args.output/"source_inventory.tsv",inventory,["repository","path","source_class","weight","method","characters","status"])
    write_tsv(args.output/"priority_vocabulary_candidates.tsv",rows,["term","normalized","tag","words","frequency","document_frequency","weighted_frequency","score","status","top_sources"])
    review=[r for r in rows if r["status"]=="CANDIDATE"]
    write_tsv(args.output/"manual_review.tsv",review,["term","normalized","tag","words","frequency","document_frequency","weighted_frequency","score","status","top_sources"])
    accepted=[r for r in rows if r["status"]=="ACCEPTED"]
    payload={"schema":"priority-vocabulary-v1","rule":"Only ACCEPTED terms enter the downstream tagger. CANDIDATE terms require curation.","accepted":accepted,"candidate_count":len(review),"source_count":len(inventory)}
    (args.output/"priority_vocabulary_curated.json").write_text(json.dumps(payload,indent=2,ensure_ascii=False),encoding="utf-8")
    (args.output/"priority_vocabulary_all.json").write_text(json.dumps({"entries":rows,"sources":inventory},indent=2,ensure_ascii=False),encoding="utf-8")
    with (args.output/"SUMMARY.md").open("w",encoding="utf-8") as f:
        f.write("# Priority Vocabulary Harvest\n\n")
        f.write("Machine extraction only; source terms are candidates until manually accepted. No candidate is a theory-status claim.\n\n")
        f.write(f"- priority source files inventoried: {len(inventory)}\n- readable/extracted: {sum(x['status']=='READ' for x in inventory)}\n- unread: {sum(x['status']=='UNREAD' for x in inventory)}\n- frequency-filtered term/phrase candidates: {len(rows)}\n- manually/explicitly accepted terms: {len(accepted)}\n\n")
        f.write("## Highest-scoring candidates\n\n")
        for r in rows[:150]: f.write(f"- `{r['term']}` — f={r['frequency']}, df={r['document_frequency']}, score={r['score']}\n")

if __name__=="__main__": main()
