#!/usr/bin/env python3
"""Render an interactive, thumbnail-first review surface for visual archaeology.

Browser-side Save writes only to localStorage. Export produces a small JSON review
packet that can be committed/ingested later. The page never writes to GitHub or
silently turns a click into classifier truth.
"""
from __future__ import annotations
import html, json, urllib.parse
from pathlib import Path

import hypothesis_cycle as base
import render_review_markdown as md

HERE=Path(__file__).resolve().parent
STATE=HERE/"derived"/"model_state_v2.json"
OUT=HERE/"derived"/"review_sheet.html"
RAW="https://raw.githubusercontent.com/Satobloc/HsH/main/"

def raw_url(p:str):
    if p.startswith("standalone:"): return ""
    return RAW+urllib.parse.quote(p,safe="/")

def short(p:str):
    if p.startswith("standalone:"): return p[11:]
    x=Path(p); return "/".join(x.parts[-2:]) if len(x.parts)>1 else x.name

def card(image,pred,gate,rec,review_only=False):
    guess=pred.get("best_guess","—")
    prob=float(pred.get("probabilities",{}).get(guess,0))
    top=sorted(pred.get("probabilities",{}).items(),key=lambda kv:float(kv[1]),reverse=True)[:3]
    toptext=" · ".join(f"{k} {float(v):.3f}" for k,v in top)
    url=raw_url(image)
    thumb=(f'<a href="{html.escape(url)}" target="_blank" rel="noopener"><img loading="lazy" src="{html.escape(url)}" alt=""></a>'
           if url else '<span class="noimg">no repo preview</span>')
    note=" ".join(str((rec or {}).get("human_note","")).split())
    labels=", ".join((rec or {}).get("human_labels",[])[:5])
    gate_text=gate.get("status","REVIEW_ONLY" if review_only else "—")
    reasons="; ".join(gate.get("reasons",[]))
    key=html.escape(image,quote=True)
    detail=(f'<div class="source-note">{html.escape(note)}</div>' if note else '')
    tags=(f'<div class="labels">{html.escape(labels)}</div>' if labels else '')
    ro='<span class="ro">review-only sample</span>' if review_only else ''
    return f'''<tr data-image="{key}">
<td class="thumb">{thumb}</td>
<td class="review">
<div class="path">{html.escape(short(image))} {ro}</div>
{tags}
<div class="guess"><b>{html.escape(guess)}</b> <span class="p">{prob:.3f}</span> · {pred.get("evidence_family_count",0)} evidence families · <code>{html.escape(gate_text)}</code></div>
<div class="top">Top: {html.escape(toptext)}</div>
<div class="reasons">{html.escape(reasons)}</div>
{detail}
<div class="choice-row">
<span>Classification:</span>
<label><input type="radio" name="accuracy:{key}" value="correct"> correct</label>
<label><input type="radio" name="accuracy:{key}" value="wrong"> wrong</label>
<label><input type="radio" name="accuracy:{key}" value="unsure"> unsure</label>
</div>
<div class="choice-row">
<span>Display/resource:</span>
<label><input type="radio" name="resource:{key}" value="approve"> approve</label>
<label><input type="radio" name="resource:{key}" value="hold"> hold</label>
<label><input type="radio" name="resource:{key}" value="reject"> reject</label>
</div>
<div class="fields"><input class="keywords" placeholder="keywords / tags" aria-label="keywords"><textarea class="comments" rows="2" placeholder="other comments / correction / description"></textarea></div>
</td></tr>'''

def main():
    state=json.loads(STATE.read_text(encoding="utf-8"))
    preds=state.get("predictions",{})
    gates=state.get("resource_admission",{})
    manifest=md.manifest_map()
    subset=state.get("sampling_subsets",{})

    priority=set(subset.get("resource_review_holds",[]))|set(subset.get("uncertain_margin",[]))|set(subset.get("new_or_unstable",[]))
    controls=set(subset.get("stylesheet_controls",[]))
    collision=set(subset.get("square_technical_adversarial",[]))
    groups={"NEEDS REVIEW":[],"COLLISION TESTS":[],"CALIBRATED / STABLE":[],"STABLE CONTROLS":[]}
    for image,pred in preds.items():
        g="NEEDS REVIEW" if image in priority else "COLLISION TESTS" if image in collision else "STABLE CONTROLS" if image in controls else "CALIBRATED / STABLE"
        groups[g].append((image,pred,gates.get(image,{}),manifest.get(image),False))

    cov=md.discover_coverage(set(preds),md.COVERAGE_LIMIT)
    cp,co=md.classify_review_only(cov,state,manifest)
    coverage=[(x,cp[x],{"status":"REVIEW_ONLY","reasons":["not classifier state"]},manifest.get(x),True) for x in cov if x in cp]

    order=["NEEDS REVIEW","COLLISION TESTS","CALIBRATED / STABLE","STABLE CONTROLS"]
    sections=[]
    for name in order:
        rows=groups[name]
        rows.sort(key=lambda x:float(x[1].get("probabilities",{}).get(x[1].get("best_guess",""),0)),reverse=True)
        if rows:
            sections.append(f'<tbody><tr class="section"><th colspan="2">{name}</th></tr>'+''.join(card(*r) for r in rows)+'</tbody>')
    sections.append('<tbody><tr class="section"><th colspan="2">BROAD REVIEW-ONLY SAMPLE</th></tr>'+''.join(card(*r) for r in coverage)+'</tbody>')

    page=f'''<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>HsH visual archaeology review</title>
<style>
:root{{font-family:system-ui,-apple-system,sans-serif;color:#171717;background:#fafafa}}body{{max-width:1050px;margin:18px auto;padding:0 12px}}h1{{font-size:20px;margin:0}}.sub{{font-size:12px;color:#555;margin:4px 0 12px}}.bar{{position:sticky;top:0;z-index:5;background:#fafafae8;backdrop-filter:blur(5px);padding:8px 0;border-bottom:1px solid #ccc;display:flex;gap:8px;align-items:center;flex-wrap:wrap}}button,.import{{border:1px solid #aaa;border-radius:5px;background:white;padding:6px 9px;cursor:pointer}}#status{{font-size:12px;color:#555}}table{{width:100%;border-collapse:collapse;margin-top:10px}}td,th{{border:1px solid #ccc;padding:7px;vertical-align:top}}.thumb{{width:118px;text-align:center;background:white}}.thumb img{{width:108px;height:90px;object-fit:contain;display:block;margin:auto}}.noimg{{font-size:10px;color:#888}}.section th{{text-align:left;background:#e9e9e9;font-size:11px;letter-spacing:.08em}}.path{{font:11px ui-monospace,monospace;font-weight:700;overflow-wrap:anywhere}}.labels,.top,.reasons,.source-note{{font-size:11px;color:#555;margin-top:3px}}.guess{{margin-top:4px}}.p{{font-variant-numeric:tabular-nums}}.choice-row{{margin-top:6px;line-height:1.8}}.choice-row>span{{font-size:11px;font-weight:700;margin-right:5px}}label{{white-space:nowrap;margin-right:8px}}.fields{{display:grid;grid-template-columns:1fr 2fr;gap:5px;margin-top:6px}}input.keywords,textarea.comments{{font:12px system-ui;width:100%;box-sizing:border-box;border:1px solid #bbb;border-radius:4px;padding:5px}}.ro{{font:9px system-ui;color:#666;background:#eee;padding:2px 4px;border-radius:3px}}@media(max-width:600px){{.thumb{{width:76px}}.thumb img{{width:68px;height:60px}}.fields{{grid-template-columns:1fr}}body{{font-size:12px}}}}
</style></head><body>
<h1>Visual archaeology · human review</h1><div class="sub">Run {state.get("run_number","—")} · {html.escape(state.get("run_utc","—"))} · {len(preds)} classifier objects + {len(coverage)} broad review-only objects. Guesses are hypotheses, not ground truth.</div>
<div class="bar"><button id="save">Save locally</button><button id="export">Export review JSON</button><label class="import">Import JSON<input id="import" type="file" accept=".json,application/json" hidden></label><button id="clear">Clear local review</button><span id="status">○ no unsaved changes</span></div>
<table>{''.join(sections)}</table>
<script>
const PREFIX='hsh-va-review-v2:'; const status=document.getElementById('status');
function keyFor(row,kind){{return PREFIX+row.dataset.image+':'+kind}}
function markDirty(){{status.textContent='● unsaved changes';status.style.color='#8a5200'}}
function saveRow(row){{
  const data={{}};
  for(const r of row.querySelectorAll('input[type=radio]')) if(r.checked) data[r.name.startsWith('accuracy:')?'accuracy':'resource']=r.value;
  data.keywords=row.querySelector('.keywords').value; data.comments=row.querySelector('.comments').value;
  localStorage.setItem(keyFor(row,'data'),JSON.stringify(data));
}}
function loadRow(row,d){{
  if(!d)return;
  for(const r of row.querySelectorAll('input[type=radio]')){{const kind=r.name.startsWith('accuracy:')?'accuracy':'resource';r.checked=d[kind]===r.value}}
  row.querySelector('.keywords').value=d.keywords||''; row.querySelector('.comments').value=d.comments||'';
}}
for(const row of document.querySelectorAll('tr[data-image]')){{try{{loadRow(row,JSON.parse(localStorage.getItem(keyFor(row,'data'))||'null'))}}catch(e){{}};row.addEventListener('input',markDirty);row.addEventListener('change',markDirty)}}
document.getElementById('save').onclick=()=>{{for(const row of document.querySelectorAll('tr[data-image]'))saveRow(row);const t=new Date().toISOString();localStorage.setItem(PREFIX+'saved',t);status.textContent='✓ saved locally · '+t;status.style.color='#166534'}};
function packet(){{
 const items=[];
 for(const row of document.querySelectorAll('tr[data-image]')){{let d;try{{d=JSON.parse(localStorage.getItem(keyFor(row,'data'))||'null')}}catch(e){{}};if(!d){{d={{}};for(const r of row.querySelectorAll('input[type=radio]'))if(r.checked)d[r.name.startsWith('accuracy:')?'accuracy':'resource']=r.value;d.keywords=row.querySelector('.keywords').value;d.comments=row.querySelector('.comments').value}};if(d.accuracy||d.resource||d.keywords||d.comments)items.push({{image:row.dataset.image,...d}})}}
 return {{schema_version:'0.2',source:'Nathan visual-review UI',run_number:{int(state.get("run_number",0))},exported_utc:new Date().toISOString(),items}};
}}
document.getElementById('export').onclick=()=>{{document.getElementById('save').click();const blob=new Blob([JSON.stringify(packet(),null,2)+'\n'],{{type:'application/json'}});const a=document.createElement('a');a.href=URL.createObjectURL(blob);a.download='visual_review_run_{int(state.get("run_number",0))}.json';a.click();setTimeout(()=>URL.revokeObjectURL(a.href),1000)}};
document.getElementById('import').onchange=async e=>{{const f=e.target.files[0];if(!f)return;const d=JSON.parse(await f.text());const by=new Map((d.items||[]).map(x=>[x.image,x]));for(const row of document.querySelectorAll('tr[data-image]'))if(by.has(row.dataset.image)){{loadRow(row,by.get(row.dataset.image));saveRow(row)}}status.textContent='✓ imported + saved locally';status.style.color='#166534'}};
document.getElementById('clear').onclick=()=>{{if(!confirm('Clear this browser\'s saved review?'))return;for(const row of document.querySelectorAll('tr[data-image]')){{localStorage.removeItem(keyFor(row,'data'));loadRow(row,{{}});for(const r of row.querySelectorAll('input[type=radio]'))r.checked=false;row.querySelector('.keywords').value='';row.querySelector('.comments').value=''}}localStorage.removeItem(PREFIX+'saved');status.textContent='○ local review cleared';status.style.color='#555'}};
const saved=localStorage.getItem(PREFIX+'saved');if(saved){{status.textContent='✓ locally saved · '+saved;status.style.color='#166534'}}
</script></body></html>'''
    OUT.write_text(page,encoding="utf-8")

if __name__=="__main__": main()
