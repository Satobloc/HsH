#!/usr/bin/env python3
"""Audit LLM accessibility of SAT_THEORY_ARCHIVE_2023-25.

Runs read-only against a checkout of the old archive. All audit machinery and
outputs belong in HsH. The old archive is not modified.

The audit distinguishes:
- canonical/source artifacts vs archive machinery/catalogs vs derived extracts;
- natively readable text vs parser-required formats vs PDF/image extraction;
- exact manifest-backed extractions vs legacy filename-matched extractions;
- structural-index visibility in the current root ..findex.txt;
- migration candidates: derived extraction text still living in the old repo.

It deliberately does not assess theory meaning or authority.
"""
from __future__ import annotations

import argparse, csv, json, os, re, subprocess
from collections import Counter, defaultdict
from pathlib import Path

NATIVE_TEXT = {
    '.txt','.md','.markdown','.json','.jsonl','.csv','.tsv','.tex','.bib','.py',
    '.js','.css','.html','.htm','.xml','.yaml','.yml','.ini','.cfg','.toml','.rst',
    '.lean','.jl','.r','.m','.sh','.bat','.ps1','.sql','.log'
}
PARSER_REQUIRED = {'.doc','.docx','.odt','.rtf','.pages','.epub','.ppt','.pptx','.odp','.xls','.xlsx','.ods'}
PDF = {'.pdf'}
IMAGE = {'.png','.jpg','.jpeg','.tif','.tiff','.bmp','.gif','.webp','.heic','.svg'}
AUDIO = {'.mp3','.wav','.m4a','.aac','.flac','.ogg','.wma'}
VIDEO = {'.mp4','.mov','.avi','.mkv','.webm','.m4v'}
ARCHIVE = {'.zip','.7z','.rar','.tar','.gz','.tgz'}

CONTROL_PREFIXES = (
    '.[⚙️_AI_FILES]/', '.github/', '_AI_REQUESTS/', '_AUTO_EXTRACTED_TEXT/',
)
CATALOG_PREFIXES = ('..[🎛️_NATHAN_DASH]/',)
GENERATED_NAMES = {'..findex.txt','..folder_summary.txt'}


def git_files(root: Path) -> list[str]:
    b = subprocess.check_output(['git','-C',str(root),'ls-files','-z'])
    return [x.decode('utf-8','surrogateescape') for x in b.split(b'\0') if x]


def role(path: str) -> str:
    if path.startswith('_AUTO_EXTRACTED_TEXT/'):
        return 'derived-extraction'
    if path.startswith(CONTROL_PREFIXES):
        return 'archive-machinery'
    if path.startswith(CATALOG_PREFIXES) or Path(path).name in GENERATED_NAMES:
        return 'artifact-catalog-control'
    return 'archive-artifact'


def format_class(ext: str) -> str:
    e=ext.lower()
    if e in NATIVE_TEXT: return 'native-text'
    if e in PDF: return 'pdf'
    if e in IMAGE: return 'image'
    if e in PARSER_REQUIRED: return 'parser-required'
    if e in AUDIO: return 'audio'
    if e in VIDEO: return 'video'
    if e in ARCHIVE: return 'archive-container'
    if not e: return 'extensionless'
    return 'other-binary-or-unknown'


def load_manifests(root: Path):
    by_source={}; manifest_summaries=[]
    mdir=root/'_AUTO_EXTRACTED_TEXT'/'_manifests'
    if not mdir.exists(): return by_source, manifest_summaries
    for p in sorted(mdir.glob('*.json')):
        try: obj=json.loads(p.read_text(encoding='utf-8'))
        except Exception: continue
        manifest_summaries.append({
            'manifest':str(p.relative_to(root)), 'request_id':obj.get('request_id',''),
            'target':obj.get('target',''), 'recursive':obj.get('recursive',''),
            'include_images':obj.get('include_images',''), 'found':obj.get('found',''),
            'succeeded':obj.get('succeeded',''), 'failed':obj.get('failed',''), 'utc':obj.get('utc','')
        })
        for r in obj.get('results',[]):
            s=(r.get('source') or '').replace('\\','/').lstrip('./')
            if not s: continue
            # Later successful records take precedence over earlier failures.
            old=by_source.get(s)
            if old is None or (old.get('status') not in ('OK','LOW_TEXT') and r.get('status') in ('OK','LOW_TEXT')):
                by_source[s]=dict(r, manifest=str(p.relative_to(root)))
    return by_source, manifest_summaries


def build_legacy_extract_map(root: Path):
    edir=root/'_AUTO_EXTRACTED_TEXT'
    by_name=defaultdict(list)
    if edir.exists():
        for p in edir.rglob('*.txt'):
            if '/_manifests/' in str(p).replace('\\','/'): continue
            by_name[p.name.casefold()].append(str(p.relative_to(root)))
    return by_name


def load_index_text(root:Path):
    p=root/'..findex.txt'
    if not p.exists(): return '', ''
    txt=p.read_text(encoding='utf-8',errors='ignore')
    m=re.search(r'Generated UTC:\s*([^\n\\]+)',txt)
    return txt, (m.group(1).strip() if m else '')


def basename_indexed(path:str,index_text:str)->bool:
    if not index_text: return False
    name=Path(path).name
    return name in index_text


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--archive',type=Path,required=True)
    ap.add_argument('--out',type=Path,required=True)
    a=ap.parse_args(); a.out.mkdir(parents=True,exist_ok=True)
    root=a.archive.resolve()
    files=git_files(root)
    manifest_map, manifest_summaries=load_manifests(root)
    legacy_map=build_legacy_extract_map(root)
    index_text,index_generated=load_index_text(root)

    rows=[]; migration=[]; missing=[]; index_gaps=[]
    for rel in files:
        p=root/rel
        rr=role(rel); ext=p.suffix.lower(); fc=format_class(ext)
        try:size=p.stat().st_size
        except OSError:size=0
        idx=basename_indexed(rel,index_text)
        extraction_status=''; extraction_path=''; extraction_basis=''; chars=''; engine=''; manifest=''
        if rr=='archive-artifact' and fc in {'pdf','image'}:
            mr=manifest_map.get(rel)
            if mr:
                extraction_status=mr.get('status','')
                extraction_path=mr.get('output','')
                extraction_basis='manifest-exact'
                chars=mr.get('characters',''); engine=mr.get('engine',''); manifest=mr.get('manifest','')
            else:
                key=(p.stem+'.txt').casefold(); hits=legacy_map.get(key,[])
                if len(hits)==1:
                    extraction_status='LEGACY_NAME_MATCH'
                    extraction_path=hits[0]; extraction_basis='legacy-basename-unique'
                elif len(hits)>1:
                    extraction_status='AMBIGUOUS_LEGACY_MATCH'
                    extraction_path=' || '.join(hits); extraction_basis='legacy-basename-ambiguous'
            if extraction_path:
                migration.append({'source_path':rel,'source_format':fc,'extraction_path_old_archive':extraction_path,'status':extraction_status,'basis':extraction_basis,'engine':engine,'characters':chars,'manifest':manifest})
            else:
                missing.append({'source_path':rel,'format_class':fc,'bytes':size,'reason':'no extraction mapping located'})
        if rr=='archive-artifact' and not idx:
            index_gaps.append({'source_path':rel,'format_class':fc,'bytes':size})

        if rr!='archive-artifact': access='NON_SOURCE_LAYER'
        elif fc=='native-text': access='DIRECT_TEXT'
        elif fc in {'pdf','image'} and extraction_path: access='DERIVED_TEXT_AVAILABLE'
        elif fc in {'pdf','image'}: access='NEEDS_EXTRACTION'
        elif fc=='parser-required': access='NEEDS_FORMAT_PARSER'
        elif fc in {'audio','video'}: access='NEEDS_TRANSCRIPTION_OR_MEDIA_PROCESSING'
        elif fc=='archive-container': access='NEEDS_CONTAINER_INSPECTION'
        else: access='UNKNOWN_OR_BINARY'

        rows.append({
            'path':rel,'role':rr,'extension':ext,'format_class':fc,'bytes':size,
            'llm_access_class':access,'root_index_visible_by_basename':idx,
            'extraction_status':extraction_status,'extraction_path':extraction_path,
            'extraction_basis':extraction_basis,'extraction_engine':engine,
            'extraction_characters':chars,'extraction_manifest':manifest,
        })

    fields=list(rows[0]) if rows else []
    with (a.out/'ACCESSIBILITY_MANIFEST.csv').open('w',newline='',encoding='utf-8') as f:
        w=csv.DictWriter(f,fieldnames=fields); w.writeheader(); w.writerows(rows)
    for name,data in [('EXTRACTION_MIGRATION_CANDIDATES.csv',migration),('MISSING_EXTRACTION_QUEUE.csv',missing),('INDEX_GAPS.csv',index_gaps),('EXTRACTION_MANIFESTS.csv',manifest_summaries)]:
        with (a.out/name).open('w',newline='',encoding='utf-8') as f:
            flds=list(data[0]) if data else ['none']; w=csv.DictWriter(f,fieldnames=flds); w.writeheader();
            if data:w.writerows(data)

    source=[r for r in rows if r['role']=='archive-artifact']
    by_access=Counter(r['llm_access_class'] for r in source)
    by_format=Counter(r['format_class'] for r in source)
    pdf=[r for r in source if r['format_class']=='pdf']; img=[r for r in source if r['format_class']=='image']
    pdf_ok=sum(bool(r['extraction_path']) for r in pdf); img_ok=sum(bool(r['extraction_path']) for r in img)
    idx_ok=sum(r['root_index_visible_by_basename'] for r in source)
    total=len(source); readable=sum(by_access[k] for k in ('DIRECT_TEXT','DERIVED_TEXT_AVAILABLE'))
    pct=lambda n,d: round(100*n/d,2) if d else 0.0
    summary={
        'tracked_files_total':len(rows),'archive_artifacts':total,
        'direct_or_derived_text_accessible':readable,'direct_or_derived_text_accessible_pct':pct(readable,total),
        'access_class_counts':dict(by_access),'format_counts':dict(by_format),
        'pdf_total':len(pdf),'pdf_with_located_extraction':pdf_ok,'pdf_extraction_pct':pct(pdf_ok,len(pdf)),
        'image_total':len(img),'image_with_located_extraction':img_ok,'image_extraction_pct':pct(img_ok,len(img)),
        'root_index_generated_utc':index_generated,'root_index_visible_by_basename':idx_ok,'root_index_visible_pct':pct(idx_ok,total),
        'old_repo_extraction_files_to_migrate_or_rehome':len(migration),'missing_pdf_or_image_extractions':len(missing),
        'index_gaps_by_basename_check':len(index_gaps),'extraction_manifest_files':len(manifest_summaries),
        'audit_scope':'all git-tracked files in current old-archive checkout; source-vs-control classified by path; extraction coverage from manifests plus unique legacy basename matches; index visibility by current root ..findex basename presence'
    }
    (a.out/'SUMMARY.json').write_text(json.dumps(summary,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')

    lines=['# Old SAT archive — LLM accessibility audit','',
           '> Read-only audit of `SAT_THEORY_ARCHIVE_2023-25`. Tooling and outputs live in `HsH`; the old archive was not modified.','',
           f"- Git-tracked files: **{len(rows):,}**",
           f"- Archive artifacts (excluding machinery/catalog/derived-extraction layers): **{total:,}**",
           f"- Direct native text or located derived text: **{readable:,} / {total:,} ({pct(readable,total)}%)**",
           f"- PDFs with located extraction: **{pdf_ok:,} / {len(pdf):,} ({pct(pdf_ok,len(pdf))}%)**",
           f"- Images with located extraction: **{img_ok:,} / {len(img):,} ({pct(img_ok,len(img))}%)**",
           f"- Current root `..findex.txt` basename visibility: **{idx_ok:,} / {total:,} ({pct(idx_ok,total)}%)**",
           f"- Extraction outputs currently located in old repo and therefore migration/re-home candidates: **{len(migration):,}**",
           f"- PDFs/images with no located extraction mapping: **{len(missing):,}**",
           f"- Root index generated UTC: `{index_generated or 'unknown'}`",'',
           '## Access classes','']
    for k,v in by_access.most_common(): lines.append(f'- `{k}`: **{v:,}**')
    lines += ['', '## Format classes','']
    for k,v in by_format.most_common(): lines.append(f'- `{k}`: **{v:,}**')
    lines += ['', '## Interpretation', '',
              '- `DIRECT_TEXT` means GitHub/LLM-readable text without a format-conversion step.',
              '- `DERIVED_TEXT_AVAILABLE` means a PDF/image has a located extraction; quality may still vary and OCR uncertainty is not erased.',
              '- `NEEDS_EXTRACTION` is the highest-priority legibility gap for PDFs/images.',
              '- `NEEDS_FORMAT_PARSER`, media, archives, and unknown binary formats need separate ingestion paths.',
              '- Index visibility is a structural-navigation check only; it does not mean semantic indexing or full-text search coverage.',
              '- Legacy basename matching is explicitly weaker than manifest-backed source→output mapping and should be repaired during migration.', '',
              '## Generated ledgers','',
              '- `ACCESSIBILITY_MANIFEST.csv` — one row per tracked file.',
              '- `EXTRACTION_MIGRATION_CANDIDATES.csv` — old-repo extraction outputs that should be re-homed into HsH.',
              '- `MISSING_EXTRACTION_QUEUE.csv` — PDFs/images with no located extraction.',
              '- `INDEX_GAPS.csv` — source artifacts not visible by basename in the current root structural index.',
              '- `EXTRACTION_MANIFESTS.csv` — extraction-run manifest inventory.',
              '- `SUMMARY.json` — machine-readable totals.', '',
              '## Coverage caveat','',
              'This is a repository-state/accessibility audit, not a content-read audit. It assesses tracked-file visibility and machine-readability, not whether an LLM has actually read, understood, tagged, or semantically indexed each source.']
    (a.out/'SUMMARY.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
    print(json.dumps(summary,indent=2))

if __name__=='__main__': main()
