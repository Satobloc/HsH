#!/usr/bin/env python3
"""Track canonical old-archive state by GitHub tree/blob SHA without cloning it.

Writes a current source-state ledger plus added/changed/deleted deltas. This is
change detection only: source bytes remain canonical in SAT_THEORY_ARCHIVE_2023-25.
"""
from __future__ import annotations
import argparse,csv,datetime as dt,json,os,urllib.request
from pathlib import Path

API='https://api.github.com/repos/{repo}'

def get_json(url,token=None):
    h={'User-Agent':'HsH-old-archive-state-sync/1.0','Accept':'application/vnd.github+json'}
    if token: h['Authorization']=f'Bearer {token}'
    with urllib.request.urlopen(urllib.request.Request(url,headers=h),timeout=120) as r:
        return json.loads(r.read().decode('utf-8'))

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--repo',default='Satobloc/SAT_THEORY_ARCHIVE_2023-25'); ap.add_argument('--ref',default='main'); ap.add_argument('--out',type=Path,required=True); a=ap.parse_args()
    token=os.getenv('GITHUB_TOKEN'); a.out.mkdir(parents=True,exist_ok=True)
    commit=get_json(f"{API.format(repo=a.repo)}/commits/{a.ref}",token)
    commit_sha=commit['sha']; tree_sha=commit['commit']['tree']['sha']
    tree=get_json(f"{API.format(repo=a.repo)}/git/trees/{tree_sha}?recursive=1",token)
    if tree.get('truncated'): raise SystemExit('GitHub recursive tree response was truncated; use a sharded traversal before trusting coverage.')
    now=dt.datetime.now(dt.timezone.utc).isoformat()
    rows=[]
    for x in tree.get('tree',[]):
        if x.get('type')!='blob': continue
        rows.append({'path':x['path'],'blob_sha':x['sha'],'bytes':x.get('size'),'mode':x.get('mode'),'source_repo':a.repo,'source_commit':commit_sha,'observed_utc':now})
    rows.sort(key=lambda r:r['path'])
    current_path=a.out/'CURRENT_STATE.json'; prior={}
    if current_path.exists():
        try:
            old=json.loads(current_path.read_text(encoding='utf-8'))
            prior={r['path']:r for r in old.get('files',[])}
        except Exception: prior={}
    cur={r['path']:r for r in rows}; delta=[]
    for p,r in cur.items():
        if p not in prior: delta.append({'change':'ADDED','path':p,'old_blob_sha':'','new_blob_sha':r['blob_sha'],'bytes':r['bytes']})
        elif prior[p].get('blob_sha')!=r['blob_sha']: delta.append({'change':'CHANGED','path':p,'old_blob_sha':prior[p].get('blob_sha',''),'new_blob_sha':r['blob_sha'],'bytes':r['bytes']})
    for p,r in prior.items():
        if p not in cur: delta.append({'change':'DELETED_OR_MOVED','path':p,'old_blob_sha':r.get('blob_sha',''),'new_blob_sha':'','bytes':r.get('bytes')})
    snapshot={'source_repo':a.repo,'source_ref':a.ref,'source_commit':commit_sha,'tree_sha':tree_sha,'observed_utc':now,'file_count':len(rows),'files':rows}
    current_path.write_text(json.dumps(snapshot,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    with (a.out/'CURRENT_STATE.csv').open('w',newline='',encoding='utf-8') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]) if rows else ['path','blob_sha','bytes','mode','source_repo','source_commit','observed_utc']); w.writeheader(); w.writerows(rows)
    stamp=dt.datetime.now(dt.timezone.utc).strftime('%Y%m%dT%H%M%SZ')
    dpath=a.out/f'DELTA_{stamp}.csv'
    with dpath.open('w',newline='',encoding='utf-8') as f:
        fields=['change','path','old_blob_sha','new_blob_sha','bytes']; w=csv.DictWriter(f,fieldnames=fields); w.writeheader(); w.writerows(delta)
    (a.out/'LATEST_DELTA.json').write_text(json.dumps({'source_commit':commit_sha,'observed_utc':now,'changes':delta},indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    print(json.dumps({'source_commit':commit_sha,'files':len(rows),'changes':len(delta),'added':sum(x['change']=='ADDED' for x in delta),'changed':sum(x['change']=='CHANGED' for x in delta),'deleted_or_moved':sum(x['change']=='DELETED_OR_MOVED' for x in delta)},indent=2))
if __name__=='__main__': main()
