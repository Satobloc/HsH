/* Mersearch: human research interface. Browser-only, no third-party dependencies.
   Archive content is ALWAYS rendered with textContent, never innerHTML. */
(() => {
  'use strict';
  const $ = id => document.getElementById(id);
  const E = (tag, cls='', value) => {
    const node=document.createElement(tag);
    if(cls)node.className=cls;
    if(value!==undefined)node.textContent=String(value);
    return node;
  };
  const put=(node,...children)=>(node.append(...children),node);
  const clean=node=>node.replaceChildren();
  const txt=(v,n=1000)=>String(v??'').slice(0,n);
  const archives=[
    ['Satobloc/SAT_THEORY_ARCHIVE_2023-25','Original SAT archive'],
    ['Satobloc/HsH','H(s)H workspace'],
    ['Satobloc/HSH_RESOURCES','Research resources']
  ];
  const filters=['eraFilter','versionFilter','authorFilter','repoFilter','fieldFilter','confidenceFilter','retrospectiveFilter'];
  const state={online:false,profile:'static',mode:'text',view:'results',result:null,imported:false,
    query:'',page:0,pageSize:20,sequence:0,saved:[],catalog:null,catalogMode:false};
  const safeUrl=value=>{
    if(!value||typeof value!=='string')return '';
    try{const u=new URL(value,location.href);return /^(https?):$/.test(u.protocol)?u.href:'';}
    catch{return '';}
  };
  function link(parent,url,label,css=''){
    let adjusted=typeof url==='string'&&url.startsWith('CONVERSATION_VIEWER/')
      ?'../'+url.slice('CONVERSATION_VIEWER/'.length):url;
    if(typeof adjusted==='string'&&adjusted.startsWith('../')&&
       ['127.0.0.1','localhost'].includes(location.hostname)){
      adjusted='https://satobloc.github.io/HsH/'+adjusted.slice(3);
    }
    const href=safeUrl(adjusted);
    if(!href)return null;
    const a=E('a',css,label);a.href=href;a.target='_blank';a.rel='noopener noreferrer';parent.append(a);return a;
  }
  function notify(kind,title,detail,action){
    const n=$('notice');n.hidden=false;n.className='notice '+(kind||'');
    $('noticeIcon').textContent=kind==='warning'?'!':kind==='success'?'✓':'◎';
    $('noticeTitle').textContent=title;$('noticeText').textContent=detail;
    const old=n.querySelector('.notice-action');if(old)old.remove();
    if(action){
      const b=E('button','notice-action',action.text);
      b.type='button';
      b.style.cssText='border:1px solid #c7d6cf;background:#fff;border-radius:7px;padding:8px;font-size:11px;white-space:nowrap';
      b.addEventListener('click',action.run);
      n.insertBefore(b,$('noticeDismiss'));
    }
  }
  function connection(online,label){
    state.online=online;const n=$('connectionState');
    n.className='connection '+(online?'online':'offline');
    clean(n);put(n,E('i'),document.createTextNode(' '+label));
  }
  function coverage(data={}){
    const active=new Set(data.archives_searched||data.archives_discovered||[]);
    const missing=new Set(data.missing_archives||[]);
    const known=Array.isArray(data.archives_searched)||Array.isArray(data.archives_discovered);
    $('scopeHeadline').textContent=known?active.size+'/3 FOUND':'UNKNOWN';
    const list=$('archiveRows');clean(list);
    archives.forEach(([repo,name])=>{
      const status=active.has(repo)?'active':missing.has(repo)||state.profile==='public'?'missing':'pending';
      put(list,E('div','archive-row'));const row=list.lastChild;
      put(row,E('span','archive-light '+status),E('span','',name),
        E('small','',status==='active'?'Available':status==='missing'?'Not searched':'Unknown'));
    });
    $('scopeNote').textContent=!known?'Connect a search service or import a result file to see corpus coverage.'
      :data.coverage_status==='complete'?'All three repositories reported. Format and size exclusions may still apply.'
      :state.profile==='public'?'Public search is restricted to approved public files. Private resources stay private.'
      :'Some archives were not searched. Results are not an exhaustive historical inventory.';
    if(state.profile==='public'){
      const opt=$('repoFilter').querySelector('option[value="Satobloc/HSH_RESOURCES"]');
      if(opt)opt.disabled=true;
    }
  }
  async function api(url,options={},timeout=15000){
    const ac=new AbortController(),timer=setTimeout(()=>ac.abort(),timeout);
    try{
      const r=await fetch(url,{cache:'no-store',signal:ac.signal,...options});
      if(!r.ok)throw Error('HTTP '+r.status);
      const data=await r.json();
      if(data.ok===false)throw Error(data.error||'Search service error');
      return data;
    }finally{clearTimeout(timer);}
  }
  async function connect(){
    try{
      const caps=await api('./api/capabilities',{},3200);
      const spec=caps.capabilities||caps;
      if(!spec.fields&&!spec.query_operators)throw Error('No Mersearch service');
      state.profile=caps.profile||'local';
      connection(true,state.profile==='public'?'Public search online':'Local search online');
      try{const c=await api('./api/coverage',{},5000);coverage(c.coverage||c);}
      catch{coverage();}
      notify('success','Mersearch is connected',
        state.profile==='public'?'Only approved public material is searchable.':
          'Your local research service is connected. Coverage and exclusions accompany each search.');
      setTimeout(()=>{if($('notice').classList.contains('success'))$('notice').hidden=true;},6500);
      const q=new URLSearchParams(location.search).get('q');
      if(q){$('searchQuery').value=q;updateClear();search();}
    }catch{
      // GitHub Pages cannot run Python. Offer an explicitly limited public
      // catalog that contains titles and links from the curated Viewer only.
      try{
        const catalog=await api('./data/catalog.json',{},8000);
        if(catalog.kind!=='public-conversation-catalog'||!Array.isArray(catalog.hits))
          throw Error('Not a public catalog artifact');
        state.catalog=catalog;state.profile='public';
        connection(false,'Public catalog search');
        $('connectionState').className='connection catalog';
        coverage(catalog);
        for(const name of ['math','advanced']){
          const b=document.querySelector('[data-querymode="'+name+'"]');
          if(b){b.disabled=true;b.title='Requires the full Mersearch engine';}
        }
        $('authorFilter').disabled=true;$('retrospectiveFilter').disabled=true;
        notify('','Public conversation catalog available',
          'Search conversation titles, file paths and dates. Full text, equations and cross-archive chronology require the Mersearch research engine.',
          {text:'About coverage',run:()=>$('aboutDialog').showModal()});
        const q=new URLSearchParams(location.search).get('q');
        if(q){$('searchQuery').value=q;updateClear();search();}
      }catch{
        state.profile='static';connection(false,'Preview / import mode');coverage();
        notify('warning','Search service not connected',
          'No public catalog is deployed yet. Import a Mersearch JSON export or use the research service locally.',
          {text:'Import JSON ↑',run:()=>$('importFile').click()});
        const q=new URLSearchParams(location.search).get('q');
        if(q){$('searchQuery').value=q;updateClear();}
      }
    }
  }
  function quote(s){return '"'+String(s).replace(/\\/g,'\\\\').replace(/"/g,'\\"')+'"';}
  function expression(){
    const s=$('searchQuery').value.trim();if(!s)return '';
    let main=state.mode==='math'?'math:'+quote(s):state.mode==='exact'?quote(s)
      :state.mode==='advanced'?s
      :$('fieldFilter').value?$('fieldFilter').value+':'+quote(s):s;
    const extra=[];
    for(const [id,key] of [['eraFilter','era'],['versionFilter','version'],
          ['authorFilter','role'],['repoFilter','repo'],['confidenceFilter','date_confidence']]){
      if($(id).value)extra.push(key+':'+$(id).value);
    }
    if($('retrospectiveFilter').checked)extra.push('NOT retrospective:true');
    return extra.length?'('+main+') AND '+extra.join(' AND '):main;
  }
  function updateClear(){$('clearQuery').hidden=!$('searchQuery').value;}
  function filterCounter(){
    const n=filters.filter(id=>id==='retrospectiveFilter'?$(id).checked:Boolean($(id).value)).length;
    $('filterCount').textContent=n?String(n):'';$('filterCount').hidden=!n;
  }
  function searchMode(mode){
    state.mode=mode;
    document.querySelectorAll('[data-querymode]').forEach(b=>{
      const on=b.dataset.querymode===mode;
      b.classList.toggle('selected',on);b.setAttribute('aria-pressed',String(on));
    });
    if(mode==='advanced'){$('advancedPanel').hidden=false;$('advancedToggle').setAttribute('aria-expanded','true');}
    $('searchQuery').placeholder=mode==='math'?'An equation, e.g. B = 3/(4*pi)'
      :mode==='exact'?'Words together, in the original order…'
      :mode==='advanced'?'Boolean query, e.g. light NEAR/12 helix'
      :'A phrase, number, equation, or question…';
  }
  function normal(raw){
    if(!raw||typeof raw!=='object')throw Error('Not a JSON search record');
    const d=raw.results||raw.result||raw;
    if(!Array.isArray(d.hits))throw Error('Expected a Mersearch SEARCH_RESULTS.json with a hits array');
    if(d.hits.length>25000)throw Error('Too many records for browser inspection; export fewer than 25,000');
    return d;
  }
  async function importFile(file){
    if(!file)return;
    if(file.size>45*1024*1024){notify('warning','File is too large','Import files under 45 MB.');return;}
    try{
      const d=normal(JSON.parse(await file.text()));
      state.result=d;state.imported=true;state.catalogMode=false;state.page=0;state.query=d.query||'';
      view('results');
      if(d.query){$('searchQuery').value=d.query;updateClear();}
      if(d.result_mode==='files')$('resultMode').value='files';
      coverage(d);render();
      notify('success','Imported '+txt(file.name,90),
        d.hits.length+' source records loaded. This is an imported result set, not a new live search.');
    }catch(e){notify('warning','Could not import file',e.message);}
  }
  function searchCatalog(){
    const catalog=state.catalog;
    if(!catalog)return;
    if(state.mode!=='text'&&state.mode!=='exact'){
      notify('warning','Full-text engine required',
        'The public catalog searches titles, paths and dates only. Choose Text or Exact phrase.');return;
    }
    const query=$('searchQuery').value.trim().toLowerCase();
    if(!query){notify('warning','Enter a search','Try SAT, phase shift, or a conversation title.');return;}
    const terms=state.mode==='exact'?[query]:(query.match(/"[^"]+"|\S+/g)||[])
      .map(x=>x.replace(/^"|"$/g,'')).filter(Boolean);
    const field=$('fieldFilter').value;
    const era=$('eraFilter').value,version=$('versionFilter').value,
      repo=$('repoFilter').value,confidence=$('confidenceFilter').value;
    const matches=catalog.hits.filter(hit=>{
      const title=(hit.title||'').toLowerCase(),path=(hit.path||'').toLowerCase();
      const haystack=field==='title'?title:field==='name'?(path.split('/').pop()||'')
        :field==='path'?path:title+' '+path;
      if(!terms.every(term=>haystack.includes(term)))return false;
      if(repo&&hit.repository!==repo)return false;
      if(confidence&&hit.chronology?.date_confidence!==confidence)return false;
      if(version){
        const names={
          'stringing-along':['stringing along','stringing-along'],
          'toy-theory':['toy theory','toy-theory'],
          'sat-2':['sat 2.0','sat-2'],
          'sat-mark-iv':['mark iv','mark 4'],
          'sat-mark-iv-2':['mark iv.2','mark 4.2'],
          'sat-mark-v':['mark v','mark 5'],
          'sat-x':['sat x','sat-x'],
          'sat-xy':['sat xy','sat-xy'],
          'sat-z':['sat z','sat-z'],
          'sat-o':['sat o','sat.o'],
          'chronophysical':['chronophysical'],
          'sato-blockwave':['blockwave'],
          'hsh':['h(s)h','hyperhelical','hsh']
        };
        if(!(names[version]||[version]).some(x=>(title+' '+path).includes(x)))return false;
      }
      if(era){
        const date=(hit.chronology?.earliest_message_at||'');
        if(!date)return false;
        const year=+date.slice(0,4),month=+date.slice(5,7);
        const label=(month<=4?'early':month<=8?'mid':'late')+'-'+year;
        if(label!==era)return false;
      }
      return true;
    });
    state.result={...catalog,hits:matches,query,kind:'public-catalog-query',scope_note:catalog.scope_note};
    state.imported=true;state.catalogMode=true;state.page=0;state.query=query;
    view('results');
    const u=new URL(location.href);u.searchParams.set('q',$('searchQuery').value.trim());
    history.replaceState(null,'',u);
    coverage(catalog);
    render();
    notify('','Catalog results, not message full-text',
      'Matches are from public conversation titles and paths only. The full Mersearch engine is broader.',
      {text:'Search public code ↗',run:()=>{
        const github='https://github.com/search?q='+
          encodeURIComponent('repo:Satobloc/SAT_THEORY_ARCHIVE_2023-25 '+query)+'&type=code';
        window.open(github,'_blank','noopener');
      }});
  }

  async function search(){
    const expr=expression();
    if(!expr){notify('warning','Enter a search','Try 0.24, refractive index, or Chronophysical.');$('searchQuery').focus();return;}
    if(!state.online&&state.catalog){searchCatalog();return;}
    if(!state.online){
      notify('warning','Live search is unavailable',
        'Import an existing Mersearch JSON result set, or use GitHub code search as a limited fallback.',
        {text:'GitHub search ↗',run:()=>{
          const q='repo:Satobloc/SAT_THEORY_ARCHIVE_2023-25 '+$('searchQuery').value.trim();
          window.open('https://github.com/search?q='+encodeURIComponent(q)+'&type=code','_blank','noopener');
        }});
      return;
    }
    state.imported=false;state.catalogMode=false;state.query=expr;state.page=0;
    view('results');
    const u=new URL(location.href);u.searchParams.set('q',$('searchQuery').value.trim());
    history.replaceState(null,'',u);
    await loadPage(0);
  }
  async function loadPage(page){
    const sequence=++state.sequence;
    $('searchButton').disabled=true;$('searchButton').textContent='Searching…';
    const wait=E('div','empty-state');
    put(wait,E('h3','','Following the thread…'),E('p','','Searching the archive. Large local repositories may take some time.'));
    $('resultsBody').replaceChildren(wait);
    try{
      const d=await api('./api/search',{
        method:'POST',headers:{'Content-Type':'application/json'},
        body:JSON.stringify({expr:expression(),sort:$('sortSelect').value,
          result_mode:$('resultMode').value,offset:page*state.pageSize,limit:state.pageSize})
      },120000);
      if(sequence!==state.sequence)return;
      state.page=page;state.result=normal(d);coverage(state.result);
      $('notice').hidden=true;render();
    }catch(e){
      if(sequence!==state.sequence)return;
      state.result=null;render();
      notify('warning','Search did not complete',
        e.name==='AbortError'?'The search took too long. Try a narrower query.':e.message);
    }finally{
      if(sequence===state.sequence){
        $('searchButton').disabled=false;$('searchButton').replaceChildren(document.createTextNode('Search '),E('span','','↗'));
      }
    }
  }
  function pageInfo(){
    if(!state.result)return {hits:[],total:0,start:0};
    const d=state.result,all=Array.isArray(d.hits)?d.hits:[];
    const total=d.pagination?.total_hits??d.coverage?.total_results_before_limit??all.length;
    if(!state.imported)return {hits:all,total,start:state.page*state.pageSize};
    const k=$('sortSelect').value,order=[...all];
    const key=h=>k==='date'?h.timestamp||'9999':k==='origin'?
      h.passage_chronology?.estimated_origin_start||h.chronology?.estimated_origin_start||'9999'
      :String(h[k]||'').toLowerCase();
    order.sort((a,b)=>String(key(a)).localeCompare(String(key(b))));
    return {hits:order.slice(state.page*state.pageSize,(state.page+1)*state.pageSize),
      total:all.length,start:state.page*state.pageSize};
  }
  function dateText(h){
    if(h.timestamp)return txt(h.timestamp,10)+' · message';
    const p=h.passage_chronology||{},d=h.chronology||{};
    if(p.estimated_origin_start)return p.estimated_origin_start+' · estimated';
    if(d.estimated_origin_start)return d.estimated_origin_start+' · estimated';
    if(d.archive_date)return d.archive_date+' · archived';
    return 'Undated';
  }
  function repository(h){
    if(h.repository==='Satobloc/SAT_THEORY_ARCHIVE_2023-25')return 'ORIGINAL SAT';
    if(h.repository==='Satobloc/HsH')return 'H(s)H';
    if(h.repository==='Satobloc/HSH_RESOURCES')return 'RESOURCES';
    return txt(h.repository||'ARCHIVE',25);
  }
  function confidence(h){
    const p=h.passage_chronology||{},d=h.chronology||{};
    const level=p.date_confidence&&p.date_confidence!=='undetermined'?p.date_confidence:d.date_confidence;
    if(level==='direct-message-timestamps')return ['Timestamped','direct'];
    if(level==='low-version-inference')return ['Estimated era','inferred'];
    return ['Uncertain date',''];
  }
  function evidence(h){
    const d=h.chronology||{},p=h.passage_chronology||{};
    const box=E('div','provenance');box.hidden=true;box.append(E('h4','','Chronology & provenance'));
    const grid=E('div','provenance-grid');
    const rows=[
      ['Message date',p.earliest_message_at||d.earliest_message_at||'Not established'],
      ['Estimated origin',d.estimated_origin_start?d.estimated_origin_start+' – '+d.estimated_origin_end:'Unknown'],
      ['Archive-folder date',d.archive_date||'Unknown'],
      ['Dates within text',d.earliest_date_mentioned?d.earliest_date_mentioned+' – '+d.latest_date_mentioned:'None found'],
      ['Version range',(d.earliest_version_mentioned||'Unknown')+' → '+(d.latest_version_mentioned||'Unknown')],
      ['Dating evidence',d.date_confidence||'Not classified'],
      ['Document kind',d.document_type||h.kind||'Not classified'],
      ['Source location',h.locator||h.message_id||'Unknown']
    ];
    rows.forEach(([a,b])=>put(grid,put(E('div'),E('span','',a),E('strong','',b))));
    box.append(grid);
    (d.warnings||d.contradictions||[]).slice(0,4).forEach(w=>box.append(E('p','warning-text','⚠ '+w)));
    const items=d.date_evidence||[];
    if(items.length){
      const block=E('div','evidence');block.append(E('h4','','Evidence excerpts'));
      items.slice(0,7).forEach(a=>put(block,put(E('div','evidence-line'),
        E('strong','',a.kind||'Evidence'),E('span','',txt((a.value||'')+' · '+(a.locator||'')+' '+(a.excerpt||''),300)))));
      box.append(block);
    }
    if(h.identical_file_sources?.length>1){
      box.append(E('h4','','Identical archived copies'));
      h.identical_file_sources.slice(0,25).forEach(m=>{
        const row=E('p');row.append(document.createTextNode((m.repository||'')+': '));
        link(row,m.source_url,m.path||'Source');box.append(row);
      });
    }
    return box;
  }
  function highlightExcerpt(container,excerpt){
    const source=txt(excerpt,1300);
    const raw=$('searchQuery').value.trim();
    const terms=(raw.match(/[A-Za-z0-9_.-]{3,}/g)||[])
       .filter(x=>!['AND','NOT','NEAR','MATH','ROLE','VERSION','ERA','REPO'].includes(x.toUpperCase()))
       .slice(0,5);
    if(!terms.length){container.textContent=source;return;}
    const escapeRegex=s=>Array.from(s).map(c=>'.*+?^$[]{}()|\\'.includes(c)?'\\'+c:c).join('');
    const re=new RegExp('('+[...new Set(terms)].map(escapeRegex).join('|')+')','ig');
    let index=0,match;
    while((match=re.exec(source))!==null){
      if(match.index>index)container.append(document.createTextNode(source.slice(index,match.index)));
      container.append(E('mark','',match[0]));
      index=re.lastIndex;
      if(!match[0].length)break;
    }
    if(index<source.length)container.append(document.createTextNode(source.slice(index)));
  }
  function card(h,i){
    const art=E('article','result-card');art.style.animationDelay=Math.min(i,8)*18+'ms';
    const glyph=E('div','result-glyph',['conversation-message','notebooklm-message'].includes(h.kind)?'≋':'▤');
    glyph.setAttribute('aria-hidden','true');
    const body=E('div'),meta=E('div','result-meta');
    put(meta,E('span','repo-pill',repository(h)),E('span','meta-divider','·'),
      E('span','',dateText(h)));
    const [label,cls]=confidence(h);
    meta.append(E('span','confidence-chip '+cls,label));
    const title=E('h3');
    if(!link(title,h.source_url||h.viewer_url,txt(h.title||h.path||'Untitled record',180)))
      title.textContent=txt(h.title||h.path||'Untitled record',180);
    const excerpt=E('p','result-excerpt');
    highlightExcerpt(excerpt,h.excerpt||'');
    const foot=E('div','result-foot');
    put(foot,E('span','',h.speaker||h.role||'Speaker not identified'));
    if(h.locator)foot.append(E('span','',h.locator));
    if(h.source_url)link(foot,h.source_url,'Open original ↗');
    else if(h.viewer_url)link(foot,h.viewer_url,'Open viewer ↗');
    const button=E('button','','View source evidence ↓');
    button.type='button';button.setAttribute('aria-expanded','false');
    const details=evidence(h);
    button.addEventListener('click',()=>{
      details.hidden=!details.hidden;button.setAttribute('aria-expanded',String(!details.hidden));
      button.textContent=details.hidden?'View source evidence ↓':'Hide source evidence ↑';
    });
    foot.append(button);
    put(body,meta,title,excerpt,foot,E('div','result-path',txt(h.path||'',270)),details);
    return put(art,glyph,body);
  }
  function chart(hits){
    const dest=$('timelineChart');dest.replaceChildren();
    const by=new Map();let undated=0;
    hits.forEach(h=>{
      const p=h.passage_chronology||{},d=h.chronology||{};
      const direct=h.timestamp||p.earliest_message_at||d.earliest_message_at;
      const date=direct||d.estimated_origin_start;
      if(!date||!/^20\d\d-\d\d/.test(date)){undated++;return;}
      const y=+date.slice(0,4),m=+date.slice(5,7);
      if(y<2023||y>2035||m<1||m>12){undated++;return;}
      const key=y+' Q'+Math.ceil(m/3),row=by.get(key)||{direct:0,inferred:0};
      row[direct?'direct':'inferred']++;by.set(key,row);
    });
    const bins=[...by].sort((a,b)=>a[0].localeCompare(b[0])).slice(0,18);
    if(!bins.length)dest.append(E('p','','Visible results have no dated records to plot.'));
    else{
      const max=Math.max(...bins.map(x=>x[1].direct+x[1].inferred));
      bins.forEach(([label,n],index)=>{
        const bin=E('div','time-bin');bin.title=label+': '+n.direct+' timestamped, '+n.inferred+' estimated';
        const one=E('div','time-bar'),two=E('div','time-bar inferred');
        one.style.height=(95*n.direct/max)+'px';two.style.height=(95*n.inferred/max)+'px';
        put(bin,one,two);
        if(index===0||index===bins.length-1||index%Math.max(1,Math.ceil(bins.length/6))===0)
          bin.append(E('small','',label));
        dest.append(bin);
      });
    }
    $('timelineUndated').textContent=undated?undated+' undated / outside range':'';
    const caption=$('timelinePanel').querySelector('.timeline-head small');
    caption.textContent='Counts for the currently loaded results only, not the entire archive.';
  }
  function savedView(){
    const body=$('resultsBody');body.replaceChildren();
    $('viewLabel').textContent='BOOKMARKS';$('resultHeading').textContent='Saved searches';
    $('resultSubheading').textContent='Saved only in this browser, not uploaded or shared.';
    $('timelinePanel').hidden=true;$('pager').hidden=true;$('exportButton').disabled=true;
    if(!state.saved.length){
      put(body,put(E('div','empty-state'),E('h3','','No saved trails yet.'),
        E('p','','Run a query, then choose Save search above the results.')));
      return;
    }
    state.saved.forEach((s,i)=>{
      const box=E('article','result-card'),area=E('div'),h=E('h3'),go=E('button','inline-link',s.query);
      go.addEventListener('click',()=>{$('searchQuery').value=s.query;updateClear();view('results');search();});
      h.append(go);put(area,E('div','result-meta','SAVED · '+(s.date||'LOCAL')),h);
      const remove=E('button','inline-link','Remove');remove.addEventListener('click',()=>{
        state.saved.splice(i,1);saveState();savedView();
      });area.append(remove);put(box,E('div','result-glyph','⌕'),area);body.append(box);
    });
  }
  function render(){
    if(state.view==='saved'){savedView();return;}
    const {hits,total,start}=pageInfo();
    $('viewLabel').textContent=state.view==='timeline'?'CHRONOLOGY':'RESULTS';
    $('timelinePanel').hidden=state.view!=='timeline';
    const reported=state.result?.pagination?.total_hits??state.result?.coverage?.total_results_before_limit??total;
    $('resultHeading').textContent=state.result?
      (state.imported&&reported>total?total.toLocaleString()+' loaded of '+reported.toLocaleString()+' matches':
        total.toLocaleString()+' result'+(total===1?'':'s')+' in the record'):
      'Your research starts here.';
    $('resultSubheading').textContent=state.result?
      (state.catalogMode?'Public catalog · titles and paths only':state.imported?'Imported results':'Live search')+' · '+(state.result.coverage_status||'scope unknown')+
      ' · '+(total?'Showing '+(start+1)+'–'+Math.min(total,start+hits.length):'No matching passages')
      :'Search the archive, or import an existing Mersearch result set.';
    const out=$('resultsBody');out.replaceChildren();
    if(!hits.length){
      put(out,put(E('div','empty-state'),E('div','empty-graphic','◎'),
        E('h3','',state.result?'No matches in this result set.':'A good question leaves a trail.'),
        E('p','',state.result?'Try another term or loosen your filters.':'Trace a calculation, a theory name, or a laboratory result.')));
    }else hits.forEach((h,i)=>out.append(card(h,i)));
    if(state.view==='timeline')chart(hits);
    const pages=Math.max(1,Math.ceil(total/state.pageSize));
    $('pager').hidden=!state.result||pages<=1;
    $('pageLabel').textContent=(state.page+1)+' / '+pages;
    $('prevPage').disabled=state.page===0;$('nextPage').disabled=state.page>=pages-1;
    $('exportButton').disabled=!state.result;
  }
  function view(name){
    state.view=name;
    document.querySelectorAll('[data-view]').forEach(b=>{
      b.classList.toggle('is-active',b.dataset.view===name);
      if(b.dataset.view===name)b.setAttribute('aria-current','page');
      else b.removeAttribute('aria-current');
    });
    render();
  }
  function saveState(){try{localStorage.setItem('mersearch.saved.1',JSON.stringify(state.saved.slice(0,40)));}catch{}}
  function saveQuery(){
    const q=$('searchQuery').value.trim();if(!q)return;
    if(state.saved.some(x=>x.query===q)){notify('','Already saved','That query is in Saved searches.');return;}
    state.saved.unshift({query:q,date:new Date().toISOString().slice(0,10)});
    saveState();notify('success','Search saved','It stays in this browser until you remove it.');
  }
  function exportData(){
    if(!state.result)return;
    const blob=new Blob([JSON.stringify(state.result,null,2)],{type:'application/json'});
    const url=URL.createObjectURL(blob),a=E('a');
    a.href=url;a.download='mersearch-'+new Date().toISOString().slice(0,10)+'.json';
    document.body.append(a);a.click();a.remove();setTimeout(()=>URL.revokeObjectURL(url),1200);
  }
  function turnPage(delta){
    const next=state.page+delta;
    if(next<0)return;
    if(state.imported){state.page=next;render();}
    else if(state.online)loadPage(next);
    $('resultsSection').scrollIntoView({behavior:'smooth',block:'start'});
  }
  function initialize(){
    if(['127.0.0.1','localhost'].includes(location.hostname)){
      document.querySelectorAll('a[href="../"]').forEach(a=>a.href='https://satobloc.github.io/HsH/');
    }
    try{
      const stored=JSON.parse(localStorage.getItem('mersearch.saved.1')||'[]');
      if(Array.isArray(stored))state.saved=stored.filter(x=>x&&typeof x.query==='string').slice(0,40);
    }catch{}
    $('searchForm').addEventListener('submit',e=>{e.preventDefault();search();});
    $('searchQuery').addEventListener('input',updateClear);
    $('clearQuery').addEventListener('click',()=>{$('searchQuery').value='';updateClear();$('searchQuery').focus();});
    document.querySelectorAll('[data-querymode]').forEach(b=>b.addEventListener('click',()=>searchMode(b.dataset.querymode)));
    $('advancedToggle').addEventListener('click',()=>{
      $('advancedPanel').hidden=!$('advancedPanel').hidden;
      $('advancedToggle').setAttribute('aria-expanded',String(!$('advancedPanel').hidden));
    });
    filters.forEach(f=>$(f).addEventListener('change',filterCounter));
    $('resetFilters').addEventListener('click',()=>{
      filters.forEach(f=>{if(f==='retrospectiveFilter')$(f).checked=false;else $(f).value='';});
      filterCounter();
    });
    document.querySelectorAll('[data-example]').forEach(b=>b.addEventListener('click',()=>{
      const q=b.dataset.example||'';
      if(q.startsWith('math:')){searchMode('math');$('searchQuery').value=q.slice(5);}
      else{searchMode('text');$('searchQuery').value=q;}
      updateClear();$('searchQuery').focus();if(state.online||state.catalog)search();
    }));
    document.querySelectorAll('[data-view]').forEach(b=>b.addEventListener('click',()=>view(b.dataset.view)));
    ['sortSelect','resultMode'].forEach(id=>$(id).addEventListener('change',()=>{
      if(state.online&&state.result&&!state.imported&&state.view!=='saved')loadPage(0);else render();
    }));
    $('importFile').addEventListener('change',async e=>{
      await importFile(e.target.files?.[0]);$('importFile').value='';
    });
    $('importOpen').addEventListener('click',()=>$('importFile').click());
    $('exportButton').addEventListener('click',exportData);
    $('noticeDismiss').addEventListener('click',()=>{$('notice').hidden=true;});
    $('prevPage').addEventListener('click',()=>turnPage(-1));
    $('nextPage').addEventListener('click',()=>turnPage(1));
    $('helpOpen').addEventListener('click',()=>$('helpDialog').showModal());
    $('aboutLink').addEventListener('click',e=>{e.preventDefault();$('aboutDialog').showModal();});
    document.querySelectorAll('[data-close-dialog]').forEach(b=>b.addEventListener('click',()=>b.closest('dialog').close()));
    [$('helpDialog'),$('aboutDialog')].forEach(d=>d.addEventListener('click',e=>{if(e.target===d)d.close();}));
    const save=E('button','outline-button','☆ Save search');save.type='button';save.addEventListener('click',saveQuery);
    document.querySelector('.result-actions').insertBefore(save,$('exportButton'));
    const share=E('button','outline-button','↗ Share query');share.type='button';
    share.addEventListener('click',async()=>{
      const q=$('searchQuery').value.trim();
      if(!q){notify('warning','No query yet','Enter some search terms before sharing.');return;}
      const url=new URL(location.href);url.searchParams.set('q',q);
      try{
        await navigator.clipboard.writeText(url.toString());
        notify('success','Query link copied','The link stores the search terms, not a copy of the search results.');
      }catch{
        notify('warning','Unable to access clipboard','Copy this page address after searching, or use your browser’s Share command.');
      }
    });
    document.querySelector('.result-actions').insertBefore(share,$('exportButton'));
    window.addEventListener('keydown',e=>{
      const tag=e.target?.tagName?.toLowerCase()||'';
      if((e.key==='/'&&!['input','textarea','select'].includes(tag))||((e.ctrlKey||e.metaKey)&&e.key.toLowerCase()==='k')){
        e.preventDefault();$('searchQuery').focus();
      }
    });
    updateClear();filterCounter();connect();
  }
  initialize();
})();
