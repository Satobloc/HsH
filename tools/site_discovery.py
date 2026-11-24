#!/usr/bin/env python3
"""Public archive discovery and rolling display docket; no intake packet required.

Only the two named public repositories are scanned. Not a replacement for
Mersearch's research/full-text index; search covers paths, titles and explicitly
labelled bounded text excerpts. Outputs are atomic and retain last-good data.
"""
import argparse, concurrent.futures, datetime as dt, hashlib, io, json, os, re, time
import urllib.request, urllib.parse
from pathlib import Path

REPOS={'hsh':'Satobloc/HsH','sat':'Satobloc/SAT_THEORY_ARCHIVE_2023-25'}
EXTS={'.pdf','.md','.txt','.tex','.json'}
EXCLUDED=re.compile(r'prior[_ -]?art|quarantine|science[ _-]+made[ _-]+stupid',re.I)
THUMBNAIL_NAME=re.compile(r'^[0-9a-f]{40}\.jpg$')
GENERATED=('PUBLIC_SITE/generated/','indexes/','.github/','tools/','LIBRARY/generated/')

def now(): return dt.datetime.now(dt.timezone.utc).isoformat(timespec='seconds')
def eligible(path):
    return Path(path).suffix.lower() in EXTS and not EXCLUDED.search(path) and not path.startswith(GENERATED) and not any(p.startswith('.') for p in path.split('/'))

def workspace_record(path):
    return path.startswith('WORKSPACES/')
def visual_eligible(path):
    return path.startswith('SAT_VISUALS/') and not EXCLUDED.search(path) and Path(path).suffix.lower() in {'.png','.jpg','.jpeg','.webp'}
def square(width,height): return min(width,height)>=128 and .9<=width/height<=1.1

def request(url,limit=16*1024*1024):
    headers={'User-Agent':'GSF-public-discovery/1.0'}
    if url.startswith('https://api.github.com/') and os.environ.get('GITHUB_TOKEN'): headers['Authorization']='Bearer '+os.environ['GITHUB_TOKEN']
    for attempt in range(3):
        try:
            with urllib.request.urlopen(urllib.request.Request(url,headers=headers),timeout=35) as r:
                data=r.read(limit+1)
                if len(data)>limit: raise ValueError('Source exceeds size limit')
                return data
        except Exception:
            if attempt==2: raise
            time.sleep(1+attempt)

def api(path): return json.loads(request('https://api.github.com/'+path,32*1024*1024))
def tree(repo):
    data=api('repos/'+repo+'/git/trees/main?recursive=1')
    if not data.get('truncated'): return data
    # Never silently accept an incomplete recursive tree.
    records=[]
    def walk(sha,prefix=''):
        part=api('repos/'+repo+'/git/trees/'+sha)
        if part.get('truncated'): raise ValueError('Even nonrecursive tree was truncated')
        for item in part['tree']:
            path=prefix+item['path']
            if item['type']=='tree': walk(item['sha'],path+'/')
            else: records.append({**item,'path':path})
    walk(data['sha']);return {**data,'tree':records,'truncated':False}

def raw(repo,sha,path): return 'https://raw.githubusercontent.com/'+repo+'/'+sha+'/'+urllib.parse.quote(path,safe='/')
def route(repo,path): return 'reader.html?'+urllib.parse.urlencode({'mode':'browse','repo':repo,'path':path,'kind':'file'})
def hinted_date(path):
    matches=re.findall(r'20\d{2}[-_](?:0[1-9]|1[0-2])[-_](?:0[1-9]|[12]\d|3[01])',path)
    return max(matches).replace('_','-') if matches else ''
def atomic(path,value):
    path.parent.mkdir(parents=True,exist_ok=True);tmp=path.with_suffix(path.suffix+'.tmp');tmp.write_text(json.dumps(value,ensure_ascii=False,separators=(',',':')),encoding='utf8');tmp.replace(path)
def load(path,default):
    try:return json.loads(path.read_text())
    except (OSError,ValueError):return default

def excerpt(repo,commit,item):
    if item['kind'] not in ('md','txt') or item.get('size',0)>128000: return {}
    data=request(raw(REPOS[repo],commit,item['path']),128000)
    if hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()!=item['sha']:raise ValueError('Source hash mismatch')
    text=data.decode('utf8');heading=re.search(r'^#\s+(.+)',text,re.M)
    plain=re.sub(r'https?://\S+','↗',text);plain=re.sub(r'[`#*_<>]','',plain);plain=' '.join(plain.split())
    return {'title':heading.group(1).strip()[:160] if heading else item['title'],'excerpt':plain[:1400],'excerpt_scope':'first 1400 cleaned characters; not full text'}

def image(repo,commit,item,out,previous):
    from PIL import Image,ImageOps
    ident=item['sha'];old=previous.get(ident)
    if old and (not old['square'] or (out/old['thumbnail']).exists()):return {**old,'path':item['path']}
    data=request(raw(REPOS[repo],commit,item['path']))
    if hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()!=ident: raise ValueError('Image hash mismatch')
    with Image.open(io.BytesIO(data)) as im:
        im=ImageOps.exif_transpose(im);w,h=im.size
        record={'path':item['path'],'sha':ident,'width':w,'height':h,'square':square(w,h)}
        if record['square']:
            im.thumbnail((480,480));target='thumbnails/'+ident+'.jpg';thumb_dir=thumbnail_root(out);thumb_dir.mkdir(exist_ok=True,parents=True);im.convert('RGB').save(thumb_dir/(ident+'.jpg'),quality=85)
            record.update(thumbnail=target,title=Path(item['path']).stem.replace('_',' '),classification='DAI generic artwork',source_url=raw(REPOS[repo],commit,item['path']))
        return record

def thumbnail_root(out):
    out_path=Path(out)
    if out_path.is_symlink():
        raise ValueError('Refusing symlinked generated-output directory')
    root=out_path/'thumbnails'
    if root.is_symlink():
        raise ValueError('Refusing symlinked generated-thumbnail directory')
    return root

def thumbnail_references(out,visuals):
    root=thumbnail_root(out)
    referenced=set()
    for item in visuals:
        thumb=item.get('thumbnail')
        if item.get('square') and not thumb:
            raise RuntimeError('Square visual is missing its generated thumbnail reference')
        if not thumb:
            continue
        if not isinstance(thumb,str):
            raise ValueError('Thumbnail reference must be a relative string')
        rel=Path(thumb)
        if rel.is_absolute() or len(rel.parts)!=2 or rel.parts[0]!='thumbnails' or not THUMBNAIL_NAME.fullmatch(rel.name):
            raise ValueError('Unsafe generated-thumbnail reference: '+thumb)
        referenced.add(rel.name)
    if root.exists() and not root.is_dir():
        raise RuntimeError('Generated-thumbnail path is not a directory')
    if not root.exists() and referenced:
        raise RuntimeError('Generated-thumbnail directory is missing referenced files')
    for name in referenced:
        path=root/name
        if path.is_symlink() or not path.is_file():
            raise RuntimeError('Missing or unsafe referenced thumbnail: '+name)
    return root,referenced

def validate_thumbnail_inventory(out,visuals):
    # Preflight before replacing the last-good discovery manifest.
    root,referenced=thumbnail_references(out,visuals)
    return {'referenced':len(referenced),'files_present':len(referenced)}

def prune_generated_thumbnails(out,visuals):
    # Called after the new manifest is atomically written. Restrict deletion to
    # regular SHA-1 JPEG derivatives directly inside the generated thumbnail dir.
    root,referenced=thumbnail_references(out,visuals)
    if not root.exists():
        return {'referenced':0,'files':0,'removed':0}
    removed=0
    for path in root.iterdir():
        if path.is_symlink():
            if THUMBNAIL_NAME.fullmatch(path.name):
                raise RuntimeError('Refusing symlinked generated thumbnail: '+path.name)
            continue
        if path.is_file() and THUMBNAIL_NAME.fullmatch(path.name) and path.name not in referenced:
            path.unlink()
            removed+=1
    actual=set()
    for path in root.iterdir():
        if path.is_symlink() and THUMBNAIL_NAME.fullmatch(path.name):
            raise RuntimeError('Refusing symlinked generated thumbnail: '+path.name)
        if path.is_file() and not path.is_symlink() and THUMBNAIL_NAME.fullmatch(path.name):
            actual.add(path.name)
    missing=referenced-actual
    unexpected=actual-referenced
    if missing or unexpected:
        raise RuntimeError('Generated-thumbnail inventory mismatch: missing='+repr(sorted(missing))+' unreferenced='+repr(sorted(unexpected)))
    return {'referenced':len(referenced),'files':len(actual),'removed':removed}

def run(args):
    out=Path(args.out);previous=load(out/'discovery.json',{});old={x['id']:x for x in previous.get('documents',[])};old_images={x['sha']:x for x in previous.get('visuals',[])};stamp=now();documents=[];visuals=[];repos={};errors=[];had_previous=bool(old)
    for name,repo in REPOS.items():
        try:
            data=load(Path(args.tree_dir)/(name+'.json'),None) if args.tree_dir else tree(repo)
            if not data or data.get('truncated') or not isinstance(data.get('tree'),list): raise ValueError('Incomplete tree')
            repos[name]={'repository':repo,'commit':data['sha'],'status':'complete','checked_at':stamp}
        except Exception as e:
            repos[name]={'repository':repo,'status':'stale','error':str(e)}
            for prior in old.values():
                if prior.get('repo') != name:
                    continue
                path=prior.get('path','')
                # Reapply current policy during last-good retention: a path excluded
                # after the previous snapshot must not survive merely because this
                # repository could not be refreshed.
                if not eligible(path):
                    continue
                if workspace_record(path):
                    # Preserve last-good metadata, but never retain raw reader/excerpt
                    # surfaces from an older workspace snapshot.
                    safe=dict(prior)
                    safe['reader']=None
                    safe['presentation_state']='PRESENTATION_PENDING'
                    safe.pop('excerpt',None)
                    safe.pop('excerpt_scope',None)
                    documents.append(safe)
                else:
                    documents.append(prior)
            if name=='hsh':
                # Retain only last-good visuals whose paths still pass current policy.
                visuals.extend(x for x in previous.get('visuals',[]) if visual_eligible(x.get('path','')))
            errors.append(name+': '+str(e))
            continue
        for f in data['tree']:
            if f['type']!='blob' or not eligible(f['path']):continue
            ident=name+':'+f['path'];prior=old.get(ident);changed=not prior or prior['sha']!=f['sha'];ext=Path(f['path']).suffix.lower()[1:]
            is_workspace=workspace_record(f['path'])
            item={'id':ident,'repo':name,'path':f['path'],'sha':f['sha'],'size':f.get('size',0),'kind':ext,'title':Path(f['path']).stem.replace('_',' '),'reader':None if is_workspace else route(name,f['path']),'status':'Working record' if name=='hsh' else 'Historical archive','path_date_hint':hinted_date(f['path']),'first_seen':prior.get('first_seen',stamp) if prior else stamp,'changed_at':stamp if changed and had_previous else (prior or {}).get('changed_at',''),'revision_detected':changed and had_previous}
            if is_workspace:
                # Keep repository metadata discoverable, but do not expose raw workspace
                # source through a default reader target, excerpt, or rolling docket.
                item['presentation_state']='PRESENTATION_PENDING'
            elif prior and not changed:
                for k in ('title','excerpt','excerpt_scope'):
                    if k in prior:item[k]=prior[k]
            documents.append(item)
        if name=='hsh':
            files=[f for f in data['tree'] if f['type']=='blob' and visual_eligible(f['path'])]
            with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
                tasks={pool.submit(image,name,data['sha'],f,out,old_images):f for f in files}
                for future in concurrent.futures.as_completed(tasks):
                    try:visuals.append(future.result())
                    except Exception as e:errors.append('image '+tasks[future]['path']+': '+str(e))
    documents.sort(key=lambda x:(x.get('changed_at',''),x.get('path_date_hint',''),x['path']),reverse=True)
    candidates=[x for x in documents if not workspace_record(x['path']) and not x.get('excerpt') and x.get('size',0)<=128000 and x['kind'] in ('md','txt') and repos[x['repo']]['status']=='complete'][:args.excerpts]
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        tasks={pool.submit(excerpt,x['repo'],repos[x['repo']]['commit'],x):x for x in candidates}
        for future in concurrent.futures.as_completed(tasks):
            try:tasks[future].update(future.result())
            except Exception as e:errors.append('excerpt '+tasks[future]['path']+': '+str(e))
    # Bounded front-page docket; complete inventory remains searchable.
    docket=[x['id'] for x in documents if x['kind'] in ('pdf','md','txt') and not x['path'].startswith(('PUBLIC_SITE/','WORKSPACES/'))][:48]
    visuals.sort(key=lambda x:x['path'])
    validate_thumbnail_inventory(out,visuals)
    result={'schema_version':1,'updated':stamp,'search_scope':'titles, paths, formats and bounded excerpts; use Mersearch for full-text research','repositories':repos,'documents':documents,'docket':docket,'visuals':visuals,'errors':errors,'square_rule':{'min_dimension':128,'min_ratio':.9,'max_ratio':1.1}}
    if not documents:raise RuntimeError('No last-good or current document inventory; refusing empty publication')
    atomic(out/'discovery.json',result)
    thumbnail_inventory=prune_generated_thumbnails(out,visuals)
    print(json.dumps({'documents':len(documents),'docket':len(docket),'square_visuals':sum(x['square'] for x in visuals),'thumbnail_inventory':thumbnail_inventory,'errors':len(errors),'repositories':repos}))
    return 0 if all(x['status']=='complete' for x in repos.values()) else 2

def main():
    p=argparse.ArgumentParser();p.add_argument('--out',default='PUBLIC_SITE/generated');p.add_argument('--tree-dir');p.add_argument('--excerpts',type=int,default=150);p.add_argument('--search');a=p.parse_args()
    if a.search is not None:
        data=load(Path(a.out)/'discovery.json',{});terms=a.search.casefold().split();hits=[x for x in data.get('documents',[]) if all(t in (' '.join(str(x.get(k,'')) for k in ('title','path','kind','excerpt'))).casefold() for t in terms)];print(json.dumps({'scope':data.get('search_scope'),'hits':hits},ensure_ascii=False));return 0
    return run(a)
if __name__=='__main__':raise SystemExit(main())
