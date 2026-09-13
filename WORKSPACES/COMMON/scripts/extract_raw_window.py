#!/usr/bin/env python3
import argparse, json
from pathlib import Path
from datetime import datetime, timezone


def text_of(msg):
    c=(msg or {}).get('content') or {}
    out=[]
    for p in c.get('parts') or []:
        if isinstance(p,str): out.append(p)
        elif isinstance(p,dict) and isinstance(p.get('text'),str): out.append(p['text'])
    return '\n'.join(out).strip()


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('request', type=Path)
    ap.add_argument('--output-dir', type=Path, default=Path('WORKSPACES/COMMON/extraction_outputs'))
    a=ap.parse_args()
    req=json.loads(a.request.read_text(encoding='utf-8'))
    src=Path(req['source_path']); after=float(req.get('after_create_time',0)); limit=int(req.get('user_limit',20)); ctx=int(req.get('context_each_side',1))
    obj=json.loads(src.read_text(encoding='utf-8'))
    mapping=obj.get('mapping') or {}
    rows=[]
    for nid,node in mapping.items():
        msg=(node or {}).get('message')
        if not isinstance(msg,dict): continue
        txt=text_of(msg)
        if not txt: continue
        au=msg.get('author') or {}
        rows.append({'node_id':nid,'message_id':msg.get('id') or nid,'parent':(node or {}).get('parent'),'role':au.get('role'),'author_name':au.get('name'),'recipient':msg.get('recipient'),'create_time':msg.get('create_time'),'text':txt})
    rows.sort(key=lambda r:(r['create_time'] is None,r['create_time'] or 0,r['node_id']))
    user_idxs=[i for i,r in enumerate(rows) if r['role']=='user' and isinstance(r['create_time'],(int,float)) and r['create_time']>after][:limit]
    chosen=set()
    for i in user_idxs:
        for j in range(max(0,i-ctx),min(len(rows),i+ctx+1)): chosen.add(j)
    selected=[rows[i] for i in sorted(chosen)]
    a.output_dir.mkdir(parents=True,exist_ok=True)
    stem=a.request.stem
    outj=a.output_dir/(stem+'.json')
    outm=a.output_dir/(stem+'.md')
    payload={'request':req,'source_title':obj.get('title'),'conversation_id':obj.get('id') or obj.get('conversation_id'),'selected':selected,'selected_user_count':len(user_idxs),'next_user_create_time':(rows[user_idxs[-1]]['create_time'] if user_idxs else None)}
    outj.write_text(json.dumps(payload,ensure_ascii=False,indent=2),encoding='utf-8')
    with outm.open('w',encoding='utf-8') as f:
        f.write(f"# Raw extraction: {stem}\n\n- source: `{src.as_posix()}`\n- title: `{obj.get('title')}`\n- conversation id: `{payload['conversation_id']}`\n- selected user messages: {len(user_idxs)}\n\n")
        for r in selected:
            ts=r['create_time']
            iso=datetime.fromtimestamp(ts,timezone.utc).isoformat() if isinstance(ts,(int,float)) else 'None'
            f.write(f"## {r['role']} — `{r['message_id']}` — `{iso}` — recipient `{r['recipient']}`\n\n")
            f.write(r['text']+'\n\n---\n\n')

if __name__=='__main__': main()
