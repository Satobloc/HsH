#!/usr/bin/env python3
"""Validate opt-in paper packets and atomically build the public PDF series index.

No intake dock, hand-edited central registry or Site deployment is needed.
PDFs must already be typeset and visually checked by the publishing author.
"""
import argparse, datetime, hashlib, json, re, subprocess
from pathlib import Path, PurePosixPath

ID=re.compile(r'^[a-z0-9]+(?:-[a-z0-9]+)*$')
ROOT='PUBLIC_SITE/PAPERS'
OUTPUT='PUBLIC_SITE/generated/papers.json'

def repo_path(root, value, suffix=None):
    if not isinstance(value,str) or not value: raise ValueError('Missing repository path')
    path=PurePosixPath(value)
    if path.is_absolute() or any(p in ('..','.') or p.startswith('.') for p in path.parts) or '\\' in value or ':' in value:
        raise ValueError('Unsafe repository path: '+value)
    if re.search(r'prior[_ -]?art|quarantin',value,re.I): raise ValueError('Excluded source: '+value)
    resolved=(root/value).resolve()
    if not resolved.is_relative_to(root.resolve()) or not resolved.is_file():raise ValueError('File not found: '+value)
    if suffix and path.suffix.lower()!=suffix:raise ValueError('Expected '+suffix+': '+value)
    return resolved

def required_text(d,key):
    value=d.get(key)
    if not isinstance(value,str) or not value.strip():raise ValueError('Required text: '+key)
    return value.strip()

def document(root,d,parent=None):
    if d.get('schema_version')!=1:raise ValueError('schema_version must be 1')
    ident=required_text(d,'id')
    if not ID.fullmatch(ident):raise ValueError('id must be a lowercase hyphenated slug')
    title=required_text(d,'title');preface=required_text(d,'preface');status=required_text(d,'status')
    date=required_text(d,'date');datetime.date.fromisoformat(date)
    authors=d.get('authors')
    if not isinstance(authors,list) or not authors or not all(isinstance(x,str) and x.strip() for x in authors):raise ValueError('authors must be a nonempty text list')
    pdf=required_text(d,'pdf');data=repo_path(root,pdf,'.pdf').read_bytes()
    if not data.startswith(b'%PDF-') or b'%%EOF' not in data[-2048:]:raise ValueError('Incomplete PDF: '+pdf)
    try:
        from pypdf import PdfReader
    except ImportError:pass
    else:
        reader=PdfReader(repo_path(root,pdf))
        if reader.is_encrypted or not len(reader.pages):raise ValueError('PDF must have readable, unencrypted pages')
    source=d.get('source')
    if source:repo_path(root,source)
    result={k:v for k,v in dict(id=ident,title=title,preface=preface,status=status,date=date,authors=authors,pdf=pdf,source=source,pdf_sha256=hashlib.sha256(data).hexdigest()).items() if v is not None}
    if parent:
        if d.get('parent_id')!=parent:raise ValueError('parent_id mismatch')
        seq=d.get('sequence')
        if isinstance(seq,bool) or not isinstance(seq,int) or seq<1:raise ValueError('sequence must be a positive integer')
        result.update(parent_id=parent,sequence=seq)
    return result

def build(root,revision):
    papers=[];seen=set()
    for file in sorted((root/ROOT).glob('*/paper.json')):
        d=json.loads(file.read_text())
        if d.get('published') is not True:continue
        paper=document(root,d)
        if paper['id']!=file.parent.name or paper['id'] in seen:raise ValueError('Duplicate or folder-mismatched paper id')
        seen.add(paper['id']);entries=[];ids=set();sequences=set()
        for followup in sorted((file.parent/'addenda').glob('*.json')):
            a=json.loads(followup.read_text())
            if a.get('published') is not True:continue
            entry=document(root,a,paper['id'])
            if entry['id'] in ids or entry['sequence'] in sequences:raise ValueError('Duplicate addendum id or sequence in '+paper['id'])
            ids.add(entry['id']);sequences.add(entry['sequence']);entry['metadata_path']=followup.relative_to(root).as_posix();entries.append(entry)
        paper.update(metadata_path=file.relative_to(root).as_posix(),addenda=sorted(entries,key=lambda x:(x['sequence'],x['id'])))
        if d.get('reader_id'):
            if not ID.fullmatch(d['reader_id']):raise ValueError('Invalid reader_id')
            paper['reader_id']=d['reader_id']
        papers.append(paper)
    papers.sort(key=lambda x:(x['date'],x['id']),reverse=True)
    content_hash=hashlib.sha256(json.dumps(papers,sort_keys=True).encode()).hexdigest()
    return {'schema_version':1,'revision':revision,'updated':datetime.datetime.now(datetime.timezone.utc).isoformat(timespec='seconds'),'content_hash':content_hash,'papers':papers}

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--root',type=Path,default=Path('.'));ap.add_argument('--revision');ap.add_argument('--out',default=OUTPUT);ap.add_argument('--check',action='store_true');args=ap.parse_args()
    root=args.root.resolve();revision=args.revision or subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()
    if not re.fullmatch('[0-9a-f]{40}',revision):raise ValueError('Revision must be a full git SHA')
    result=build(root,revision)
    if args.check:print('Validated',len(result['papers']),'published papers');return
    dest=root/args.out;dest.parent.mkdir(parents=True,exist_ok=True)
    if dest.exists():
        old=json.loads(dest.read_text())
        if old.get('content_hash')==result['content_hash']:print('Paper index unchanged');return
    temp=dest.with_suffix('.json.tmp');temp.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');temp.replace(dest)
    print('Published index:',len(result['papers']),'papers,',sum(len(p['addenda']) for p in result['papers']),'addenda')

if __name__=='__main__':main()
