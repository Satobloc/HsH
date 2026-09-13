/*
NotebookLM / Gemini Notebook full-chat exporter
Nathan archive acquisition utility

Usage (Chrome/Edge DevTools Snippet):
1. Open the notebook and leave the Chat panel visible.
2. Open DevTools > Sources > Snippets, create a snippet, paste this file, Run.
3. Use the floating "NLM Export" panel.
4. Click HARVEST FULL CHAT. The script walks upward through NotebookLM's
   virtualized chat, harvesting each message before it is unloaded.
5. When it reaches the top (or stalls), export JSON and/or Markdown.

This uses rendered DOM only. It does not call undocumented Google APIs.
NotebookLM's DOM can change; selector fallbacks and a debug export are included.
*/
(() => {
  'use strict';

  if (window.__NLM_ARCHIVER__) {
    window.__NLM_ARCHIVER__.show();
    console.log('NLM Archiver already loaded.');
    return;
  }

  const sleep = ms => new Promise(r => setTimeout(r, ms));
  const norm = s => (s || '').replace(/\u00a0/g, ' ').replace(/[ \t]+\n/g, '\n').replace(/\n{3,}/g, '\n\n').trim();
  const slug = s => norm(s).replace(/[\\/:*?"<>|]+/g, '_').replace(/\s+/g, ' ').slice(0, 120) || 'NotebookLM';
  const nowISO = () => new Date().toISOString();

  function fnv1a(str) {
    let h = 0x811c9dc5;
    for (let i = 0; i < str.length; i++) {
      h ^= str.charCodeAt(i);
      h = Math.imul(h, 0x01000193);
    }
    return ('00000000' + (h >>> 0).toString(16)).slice(-8);
  }

  function download(name, text, mime='text/plain;charset=utf-8') {
    const blob = new Blob([text], {type:mime});
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url; a.download = name; document.body.appendChild(a); a.click(); a.remove();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
  }

  function notebookMeta() {
    const title = norm(
      document.querySelector('editable-project-title .title-label-inner')?.innerText ||
      document.querySelector('editable-project-title')?.innerText ||
      document.title.replace(/\s*-\s*(Gemini Notebook|NotebookLM).*$/i,'')
    );
    const m = location.pathname.match(/\/notebook\/([^/?#]+)/);
    const sourceCountText = [...document.querySelectorAll('*')]
      .map(x => norm(x.textContent))
      .find(x => /^\d+\s+sources$/i.test(x)) || '';
    return {
      notebook_title: title,
      notebook_id: m ? m[1] : null,
      notebook_url: location.href,
      captured_at: nowISO(),
      visible_source_count: sourceCountText ? parseInt(sourceCountText,10) : null,
      user_agent: navigator.userAgent,
      exporter_version: '0.2.0'
    };
  }

  function roleOf(el) {
    if (el.querySelector('.from-user-container, .from-user-message-card-content')) return 'user';
    if (el.querySelector('.to-user-container, .to-user-message-card-content')) return 'assistant';
    const c = el.className || '';
    if (/from-user/i.test(c)) return 'user';
    if (/to-user/i.test(c)) return 'assistant';
    return 'unknown';
  }

  function messageText(el) {
    const candidates = [
      '.message-text-content',
      '.from-user-message-inner-content',
      '.to-user-message-inner-content',
      'labs-tailwind-doc-viewer',
      'mat-card-content'
    ];
    for (const sel of candidates) {
      const node = el.querySelector(sel);
      const t = norm(node?.innerText);
      if (t) return t;
    }
    return norm(el.innerText);
  }

  function citationsOf(el) {
    return [...el.querySelectorAll('.citation-marker, [dialoglabel="Citation Details"], [triggerdescription*="citation" i]')]
      .map(x => ({
        label: norm(x.innerText || x.getAttribute('aria-label')),
        aria_label: x.getAttribute('aria-label') || null,
        disabled: x.getAttribute('data-disabled') || null
      }))
      .filter(x => x.label || x.aria_label);
  }

  function dateLabelsVisible() {
    const labels = [];
    const all = [...document.querySelectorAll('chat-panel *')];
    for (const el of all) {
      if (el.children.length > 3) continue;
      const t = norm(el.innerText);
      if (!t || t.length > 80) continue;
      if (/^(Today|Yesterday)(\s*[•·].*)?$/i.test(t) ||
          /^(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday),\s+[A-Z][a-z]+\s+\d{1,2}(,\s+\d{4})?/i.test(t) ||
          /^[A-Z][a-z]+\s+\d{1,2},\s+\d{4}$/.test(t)) {
        labels.push(t);
      }
    }
    return [...new Set(labels)];
  }

  function scanMessages() {
    let els = [...document.querySelectorAll('chat-panel chat-message')];
    if (!els.length) els = [...document.querySelectorAll('chat-message')];
    return els.map((el, i) => {
      const role = roleOf(el);
      const text = messageText(el);
      if (!text) return null;
      const key = fnv1a(role + '\n' + text);
      return { key, role, text, citations: citationsOf(el), dom_index: i };
    }).filter(Boolean);
  }

  function getChatScroller() {
    const cp = document.querySelector('chat-panel');
    if (cp && cp.scrollHeight > cp.clientHeight + 30) return cp;
    const candidates = [...document.querySelectorAll('chat-panel, .chat-panel, section.chat-panel, [class*="chat-panel"]')]
      .filter(x => x.scrollHeight > x.clientHeight + 30);
    candidates.sort((a,b) => b.scrollHeight - a.scrollHeight);
    return candidates[0] || null;
  }

  function sourceManifest() {
    const rows = [];
    const seen = new Set();
    const buttons = [...document.querySelectorAll('[id^="source-item-more-button-"]')];
    for (const b of buttons) {
      const id = (b.id.match(/source-item-more-button-(.+)$/)||[])[1] || null;
      const title = norm(b.getAttribute('aria-description'));
      const container = b.closest('mat-expansion-panel, [class*="source-item"], [class*="source-container"]') || b.parentElement;
      const rowText = norm(container?.innerText);
      const key = id || title || fnv1a(rowText);
      if (seen.has(key)) continue; seen.add(key);
      rows.push({source_id:id, title:title || null, row_text:rowText || null});
    }
    // fallback for visible source rows where a More button/id is unavailable
    for (const el of document.querySelectorAll('source-picker [aria-label], source-picker [aria-description]')) {
      const t = norm(el.getAttribute('aria-description') || el.getAttribute('aria-label'));
      if (!t || /^(More|Add source|Collapse|Expand|Select)/i.test(t)) continue;
      const key = 'title:' + t;
      if (!seen.has(key)) { seen.add(key); rows.push({source_id:null,title:t,row_text:null}); }
    }
    return rows;
  }

  function studioManifest() {
    const panel = document.querySelector('studio-panel') || document.querySelector('.studio-panel');
    if (!panel) return [];
    const out = [];
    const seen = new Set();
    const candidates = [...panel.querySelectorAll('[class*="artifact"], mat-card, [class*="studio"]')];
    for (const el of candidates) {
      const text = norm(el.innerText);
      if (!text || text.length < 3 || text.length > 1000) continue;
      if (!/(Deep Dive|sources|Slide Deck|Video Overview|Mind Map|Report|Flashcard|Quiz|Infographic|Data Table|ago)/i.test(text)) continue;
      const key = fnv1a(text);
      if (seen.has(key)) continue; seen.add(key);
      out.push({text});
    }
    return out;
  }

  const state = {
    messages: [],
    keys: new Set(),
    scans: 0,
    stopped: false,
    reachedTop: false,
    dateLabels: new Set(),
    log: [],
    sources: [],
    studio: []
  };

  function mergeScan(scan, direction='up') {
    state.scans++;
    dateLabelsVisible().forEach(x => state.dateLabels.add(x));
    if (!scan.length) return 0;
    const oldKeys = new Set(state.messages.map(m => m.key));
    const newItems = scan.filter(m => !oldKeys.has(m.key));
    if (!state.messages.length) {
      state.messages = scan.map(m => ({...m, first_seen_scan:state.scans}));
    } else if (newItems.length) {
      // Find overlap between current DOM window and accumulated sequence.
      const scanKeys = scan.map(x=>x.key), curKeys = state.messages.map(x=>x.key);
      let overlap = null;
      for (let si=0; si<scanKeys.length && !overlap; si++) {
        const ci = curKeys.indexOf(scanKeys[si]);
        if (ci >= 0) overlap = {si,ci};
      }
      const decorated = scan.map(m => ({...m, first_seen_scan:state.scans}));
      if (overlap) {
        const before = decorated.slice(0, overlap.si).filter(m => !oldKeys.has(m.key));
        const after = decorated.slice(overlap.si+1).filter(m => !oldKeys.has(m.key));
        if (before.length) state.messages.splice(overlap.ci, 0, ...before);
        if (after.length) {
          // place after the last overlapping item we can locate
          let last = -1;
          for (const m of decorated) {
            const ix = state.messages.findIndex(x=>x.key===m.key);
            if (ix > last) last = ix;
          }
          state.messages.splice(last+1,0,...after);
        }
      } else if (direction === 'up') {
        state.messages.unshift(...decorated.filter(m => !oldKeys.has(m.key)));
      } else {
        state.messages.push(...decorated.filter(m => !oldKeys.has(m.key)));
      }
    }
    state.keys = new Set(state.messages.map(m=>m.key));
    return newItems.length;
  }

  async function harvestFull() {
    state.stopped = false; state.reachedTop = false;
    panelStatus('Starting…');
    const scroller = getChatScroller();
    if (!scroller) {
      mergeScan(scanMessages());
      panelStatus('Could not identify chat scroller. Visible messages captured; see console.');
      console.warn('NLM Archiver: no scroll container found', scanMessages());
      return;
    }

    // Begin from current location; harvest current DOM first.
    mergeScan(scanMessages(), 'up');
    let stalls = 0, lastTop = scroller.scrollTop, lastCount = state.messages.length;
    let loops = 0;

    while (!state.stopped && loops++ < 2500) {
      mergeScan(scanMessages(), 'up');
      const beforeTop = scroller.scrollTop;
      const step = Math.max(350, Math.floor(scroller.clientHeight * 0.80));
      scroller.scrollTop = Math.max(0, beforeTop - step);
      scroller.dispatchEvent(new Event('scroll', {bubbles:true}));
      await sleep(650);
      mergeScan(scanMessages(), 'up');
      const top = scroller.scrollTop;
      const count = state.messages.length;
      panelStatus(`Harvesting… ${count} messages · scan ${state.scans} · scrollTop ${Math.round(top)}`);

      if (top <= 2) {
        await sleep(1100); // give lazy-loader a chance to prepend older material
        mergeScan(scanMessages(), 'up');
        if (scroller.scrollTop <= 2) stalls++; else stalls = 0;
      } else if (Math.abs(top-lastTop) < 2 && count===lastCount) stalls++;
      else stalls = 0;

      lastTop = top; lastCount = count;
      if (stalls >= 4) {
        state.reachedTop = true;
        break;
      }
    }

    state.sources = sourceManifest();
    state.studio = studioManifest();
    state.log.push({at:nowISO(),event:'harvest_complete',messages:state.messages.length,reachedTop:state.reachedTop,scans:state.scans});
    panelStatus(`${state.reachedTop?'Reached top':'Stopped'} · ${state.messages.length} messages · ${state.sources.length} visible sources · ${state.studio.length} studio candidates`);
  }

  function exportObject() {
    const meta = notebookMeta();
    return {
      metadata: {...meta, reached_top:state.reachedTop, scans:state.scans, captured_date_labels:[...state.dateLabels]},
      messages: state.messages.map((m,i)=>({index:i+1,role:m.role,text:m.text,citations:m.citations,key:m.key})),
      sources: state.sources.length ? state.sources : sourceManifest(),
      studio: state.studio.length ? state.studio : studioManifest(),
      capture_log: state.log
    };
  }

  function toMarkdown(obj) {
    const m=obj.metadata;
    const out=[
      `# ${m.notebook_title || 'NotebookLM export'}`,'',
      `- Notebook ID: ${m.notebook_id || ''}`,
      `- URL: ${m.notebook_url}`,
      `- Captured: ${m.captured_at}`,
      `- Reached top: ${m.reached_top}`,
      `- Messages captured: ${obj.messages.length}`,
      `- Visible source manifest entries: ${obj.sources.length}`,'',
      '## Conversation',''
    ];
    for (const x of obj.messages) {
      out.push(`### ${x.index}. ${x.role === 'user' ? 'Nathan / User' : x.role === 'assistant' ? 'Gemini / Assistant' : x.role}`,'',x.text,'');
      if (x.citations?.length) {
        out.push('Citations:');
        for (const c of x.citations) out.push(`- ${c.aria_label || c.label}`);
        out.push('');
      }
    }
    out.push('## Source manifest','');
    for (const s of obj.sources) out.push(`- ${s.title || s.row_text || '(untitled source)'}${s.source_id ? ` [${s.source_id}]` : ''}`);
    out.push('','## Studio manifest','');
    for (const a of obj.studio) out.push(`- ${a.text.replace(/\n+/g,' · ')}`);
    return out.join('\n');
  }

  // UI
  const host=document.createElement('div');
  host.id='nlm-archiver-panel';
  host.style.cssText='position:fixed;right:16px;bottom:16px;z-index:2147483647;background:#151515;color:#fff;border:1px solid #777;border-radius:10px;padding:10px;width:300px;font:12px/1.35 system-ui;box-shadow:0 4px 20px #0008';
  host.innerHTML=`<div style="display:flex;justify-content:space-between;align-items:center"><b>NLM Export</b><button id="nlmx" style="cursor:pointer">×</button></div>
    <div id="nlmstatus" style="margin:8px 0;max-height:55px;overflow:auto">Ready.</div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:6px">
      <button id="nlmharvest">HARVEST FULL CHAT</button><button id="nlmstop">STOP</button>
      <button id="nlmjson">EXPORT JSON</button><button id="nlmmd">EXPORT MD</button>
      <button id="nlmvis">CAPTURE VISIBLE</button><button id="nlmdebug">DEBUG HTML</button>
    </div>`;
  document.body.appendChild(host);
  for (const b of host.querySelectorAll('button')) b.style.cssText += ';font:11px system-ui;padding:5px;cursor:pointer';
  const status=host.querySelector('#nlmstatus');
  function panelStatus(s){status.textContent=s;console.log('NLM Archiver:',s)}
  host.querySelector('#nlmx').onclick=()=>host.style.display='none';
  host.querySelector('#nlmharvest').onclick=()=>harvestFull().catch(e=>{console.error(e);panelStatus('ERROR: '+e.message)});
  host.querySelector('#nlmstop').onclick=()=>{state.stopped=true;panelStatus('Stopping…')};
  host.querySelector('#nlmvis').onclick=()=>{const n=mergeScan(scanMessages(),'up');state.sources=sourceManifest();state.studio=studioManifest();panelStatus(`Visible captured. ${state.messages.length} total (${n} new).`)};
  host.querySelector('#nlmjson').onclick=()=>{const o=exportObject();download(`${slug(o.metadata.notebook_title)}__NotebookLM_export.json`,JSON.stringify(o,null,2),'application/json;charset=utf-8')};
  host.querySelector('#nlmmd').onclick=()=>{const o=exportObject();download(`${slug(o.metadata.notebook_title)}__NotebookLM_chat.md`,toMarkdown(o),'text/markdown;charset=utf-8')};
  host.querySelector('#nlmdebug').onclick=()=>download(`${slug(notebookMeta().notebook_title)}__DOM_debug.html`,document.documentElement.outerHTML,'text/html;charset=utf-8');

  window.__NLM_ARCHIVER__={state,harvestFull,scanMessages,sourceManifest,studioManifest,exportObject,show:()=>host.style.display='block'};
  panelStatus(`Loaded. ${scanMessages().length} messages currently in DOM.`);
})();
