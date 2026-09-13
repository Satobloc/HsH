#!/usr/bin/env python3
"""Build a broad, non-authoritative SAT/standard terminology keyword bucket.

Inputs are repository files from HsH and SAT_THEORY_ARCHIVE_2023-25.
The script discovers likely timelines, glossaries, SAT↔standard crosswalks,
definition/terminology documents, provenance/first-appearance notes, and
conversation JSON first-appearance/naming candidates.

This is retrieval infrastructure only. A term entering the bucket does NOT mean
it is current SAT, uniquely SAT, authoritative, or correctly interpreted.
"""
from __future__ import annotations
import argparse, csv, json, re
from collections import Counter, defaultdict
from pathlib import Path

TEXT_EXT={'.md','.txt','.json','.csv','.tsv','.tex','.yaml','.yml'}
NAME_HINTS=re.compile(r'(gloss|termin|timeline|chronolog|history|standard|cross.?walk|definition|first.?appear|provenance|dictionary|lexicon|mapping|map.?to)',re.I)
FIRST_HINTS=re.compile(r'\b(first\s+(?:called|named|use|used|appearance|appears|introduced|coined|mention|mentioned)|I\s+(?:call|called|name|named|rename|renamed|term)|now\s+(?:call|called|named)|formerly|previously\s+called|what\s+I\s+call)\b',re.I)
TOKEN=re.compile(r"(?u)\b[A-Za-z][A-Za-z0-9()/_+.'-]{2,}(?:\s+[A-Za-z][A-Za-z0-9()/_+.'-]{1,}){0,4}\b")
STOP={x.lower() for x in '''the and for with from that this into have has had was were are not but you your our their its about which when where what then than can could would should will just more most some any all one two three using used use based via between through over under after before current standard theory physics physical model models system systems paper papers file files chat conversation user assistant nathan'''.split()}


def read_text(p:Path,max_bytes=8_000_000):
    try:
        if p.stat().st_size>max_bytes:return None
        return p.read_text(encoding='utf-8',errors='ignore')
    except Exception:return None

def speaker_texts(obj):
    out=[]
    def walk(x):
        if isinstance(x,dict):
            role=(x.get('role') or x.get('author') or x.get('speaker') or '')
            txt=x.get('text') or x.get('content') or x.get('message')
            if isinstance(role,dict): role=role.get('role') or role.get('name') or ''
            if isinstance(txt,list): txt=' '.join(str(z) for z in txt)
            if isinstance(txt,str) and str(role).lower() in {'user','nathan','human'}: out.append(txt)
            for v in x.values(): walk(v)
        elif isinstance(x,list):
            for v in x: walk(v)
    walk(obj); return out

def candidate_terms(text):
    c=Counter()
    for line in text.splitlines():
        s=line.strip()
        if not s: continue
        # Prefer headings, glossary-like LHS, quoted labels, and capitalized/mixed technical phrases.
        seeds=[]
        if s.startswith('#'): seeds.append(s.lstrip('#').strip())
        if ':' in s and len(s.split(':',1)[0])<100: seeds.append(s.split(':',1)[0].strip(' -*`'))
        if '=' in s and len(s.split('=',1)[0])<80: seeds.append(s.split('=',1)[0].strip(' -*`'))
        seeds += re.findall(r'[“"`\[]([^”"`\]]{2,80})[”"`\]]',s)
        for seed in seeds:
            seed=re.sub(r'\s+',' ',seed).strip()
            if 2<=len(seed.split())<=8 and len(seed)<=100: c[seed]+=3
        for m in TOKEN.finditer(s):
            term=re.sub(r'\s+',' ',m.group(0)).strip()
            words=term.lower().split()
            if all(w in STOP for w in words): continue
            if any(ch.isupper() for ch in term[1:]) or any(ch in term for ch in '()/+-'):
                c[term]+=1
    return c

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--repo',action='append',required=True,help='label=path'); ap.add_argument('--out',type=Path,required=True); a=ap.parse_args()
    a.out.mkdir(parents=True,exist_ok=True)
    sources=[]; term_rows=defaultdict(lambda:{'score':0,'sources':set(),'source_kinds':set()}); first_rows=[]
    for rp in a.repo:
        label,path=rp.split('=',1); root=Path(path)
        for p in root.rglob('*'):
            if not p.is_file() or p.suffix.lower() not in TEXT_EXT: continue
            rel=str(p.relative_to(root)); name_hit=bool(NAME_HINTS.search(rel))
            txt=read_text(p)
            if txt is None: continue
            content_hit=bool(NAME_HINTS.search(txt[:10000]))
            if name_hit or content_hit:
                kind='filename-match' if name_hit else 'content-match'
                sources.append({'repo':label,'path':rel,'kind':kind})
                for term,n in candidate_terms(txt).items():
                    key=term.casefold(); r=term_rows[key]; r['term']=term; r['score']+=n; r['sources'].add(f'{label}:{rel}'); r['source_kinds'].add(kind)
            if p.suffix.lower()=='.json' and ('CONVO' in rel.upper() or 'conversation' in rel.lower()):
                try: obj=json.loads(txt)
                except Exception: continue
                for msg in speaker_texts(obj):
                    if FIRST_HINTS.search(msg):
                        # Store the candidate context without deciding that it truly is a first appearance.
                        snip=re.sub(r'\s+',' ',msg).strip()[:1200]
                        first_rows.append({'repo':label,'path':rel,'candidate_context':snip})
                        for term,n in candidate_terms(msg).items():
                            key=term.casefold(); r=term_rows[key]; r['term']=term; r['score']+=n+2; r['sources'].add(f'{label}:{rel}'); r['source_kinds'].add('conversation-first-appearance-candidate')
    with (a.out/'SOURCE_MANIFEST.csv').open('w',newline='',encoding='utf-8') as f:
        w=csv.DictWriter(f,fieldnames=['repo','path','kind']); w.writeheader(); w.writerows(sorted(sources,key=lambda x:(x['repo'],x['path'])))
    rows=[]
    for r in term_rows.values(): rows.append({'term':r['term'],'score':r['score'],'source_count':len(r['sources']),'source_kinds':'; '.join(sorted(r['source_kinds'])),'sources':' || '.join(sorted(r['sources']))})
    rows.sort(key=lambda x:(-x['source_count'],-x['score'],x['term'].lower()))
    with (a.out/'KEYWORD_BUCKET.csv').open('w',newline='',encoding='utf-8') as f:
        w=csv.DictWriter(f,fieldnames=['term','score','source_count','source_kinds','sources']); w.writeheader(); w.writerows(rows)
    with (a.out/'FIRST_APPEARANCE_CANDIDATES.csv').open('w',newline='',encoding='utf-8') as f:
        w=csv.DictWriter(f,fieldnames=['repo','path','candidate_context']); w.writeheader(); w.writerows(first_rows)
    meta={'source_documents':len(sources),'keyword_candidates':len(rows),'first_appearance_candidate_contexts':len(first_rows),'rule':'retrieval candidates only; no authority/currentness/meaning inferred'}
    (a.out/'SUMMARY.json').write_text(json.dumps(meta,indent=2)+'\n',encoding='utf-8')
    (a.out/'README.md').write_text('# SAT / standard terminology keyword bucket\n\nBroad retrieval bucket assembled from likely timelines, glossaries, terminology/crosswalk/definition/provenance documents and Nathan-authored conversation contexts matching naming/first-appearance language. **No entry is thereby current, authoritative, uniquely SAT, or correctly interpreted.** Use it to search and correlate vocabulary; adjudication remains separate.\n',encoding='utf-8')
    print(meta)
if __name__=='__main__': main()
