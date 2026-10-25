(() => {
  "use strict";
  const $ = id => document.getElementById(id);
  const form = $("searchForm"), box = $("q"), mode = $("mode"), output = $("results"), status = $("status"), more = $("more"), go = $("go");
  const shards = new Map();
  let indexPromise, catalogPromise, displayed = 0, current = [];

  async function getJSON(url) {
    const res = await fetch(url, { cache: "no-cache" });
    if (!res.ok) throw new Error(`Search index unavailable (HTTP ${res.status})`);
    return res.json();
  }
  function getIndex() { return indexPromise ||= getJSON("../data/body_search/meta.json"); }
  function getCatalog() { return catalogPromise ||= getJSON("../data/conversations.json").then(x => x.conversations || []); }
  function shardName(word) { const ch = [...word][0] || "_"; return /^[a-z0-9]$/.test(ch) ? ch : "_"; }
  async function shard(ch) {
    if (!shards.has(ch)) shards.set(ch, getJSON("../data/body_search/" + encodeURIComponent(ch) + ".json"));
    return shards.get(ch);
  }
  function normWords(text) {
    const words = String(text || "").replace(/h\s*\(\s*s\s*\)\s*h/ig, "hsh").toLowerCase().match(/[\p{L}\p{N}_]+/gu) || [];
    return [...new Set(words.filter(x => [...x].length > 1))];
  }
  function variants(word, isMath) {
    const out = new Set([word]);
    if (!isMath) return [...out];
    const pairs = [["theta","θ"],["pi","π"],["phi","φ"],["tau","τ"],["delta","δ"],["mu","μ"],["omega","ω"],["alpha","α"],["beta","β"],["gamma","γ"],["hbar","ħ"]];
    for (const [ascii, greek] of pairs) {
      if (word.includes(ascii)) out.add(word.replaceAll(ascii, greek));
      if (word.includes(greek)) out.add(word.replaceAll(greek, ascii));
    }
    if (word.includes("_")) out.add(word.replaceAll("_",""));
    return [...out];
  }
  async function termPostings(word, isMath) {
    const union = new Set();
    for (const term of variants(word, isMath)) {
      const data = await shard(shardName(term));
      const tokens = data.tokens || {};
      const exact = tokens[term];
      if (Array.isArray(exact)) { exact.forEach(x => union.add(x)); continue; }
      if ([...term].length < 3) continue;
      let expanded = 0;
      for (const [key, values] of Object.entries(tokens)) {
        if (!key.startsWith(term)) continue;
        if (++expanded > 300) break;
        values.forEach(x => union.add(x));
      }
    }
    return union;
  }
  const union=(a,b)=>new Set([...a,...b]);
  const intersect=(a,b)=>new Set([...a].filter(x=>b.has(x)));
  const difference=(a,b)=>new Set([...a].filter(x=>!b.has(x)));
  const allIndices=count=>new Set(Array.from({length:count},(_,i)=>i));
  async function phrasePostings(raw, math) {
    const text = raw.replace(/^math:/i,"").replace(/^"|"$/g,"");
    const words = normWords(text);
    if (!words.length) throw new Error("No searchable words of two or more characters in this term.");
    const sets=await Promise.all(words.map(x=>termPostings(x,math)));
    return sets.reduce((a,b)=>intersect(a,b));
  }
  function lex(text) {
    const out = String(text).match(/math:"(?:[^"\\]|\\.)*"|"(?:[^"\\]|\\.)*"|\(|\)|\b(?:AND|OR|NOT|NEAR\/\d+)\b|[^\s()]+/gi) || [];
    const tokenTypes=out.map(t=> /^(AND|OR|NOT)$/i.test(t)?t.toUpperCase() : /^NEAR\/\d+$/i.test(t)?"NEAR":t==="("||t===")"?t:"TERM");
    const expanded=[];
    for(let i=0;i<out.length;i++){
      const prev=expanded.at(-1)?.type, next=tokenTypes[i];
      if ((prev==="TERM"||prev===")")&&(next==="TERM"||next==="("||next==="NOT")) expanded.push({type:"AND",raw:"AND"});
      expanded.push({type:next==="NEAR"?"AND":next,raw:out[i],unverifiedNear:next==="NEAR"});
    }
    return expanded;
  }
  function toRPN(tokens) {
    const ops=[], out=[], prec={OR:1,AND:2,NOT:3};
    for(const t of tokens){
      if(t.type==="TERM") out.push(t);
      else if(t.type==="(") ops.push(t);
      else if(t.type===")"){
        while(ops.length&&ops.at(-1).type!=="(")out.push(ops.pop());
        if(!ops.length)throw new Error("Unmatched right parenthesis.");
        ops.pop();
      }else{
        if(!prec[t.type])throw new Error("Unsupported expression operator.");
        while(ops.length&&ops.at(-1).type!=="("&&prec[ops.at(-1).type]>=(prec[t.type]-(t.type==="NOT"?1:0)))out.push(ops.pop());
        ops.push(t);
      }
    }
    while(ops.length){
      const op=ops.pop();if(op.type==="(")throw new Error("Unmatched left parenthesis.");
      out.push(op);
    }
    return out;
  }
  async function expression(text,searchMode,universeSize){
    const math=searchMode==="math";
    let input = searchMode==="boolean" ? text : normWords(text).map(w=>w).join(searchMode==="any"?" OR ":" AND ");
    if(math)input = text.replace(/^\s*math:/i, ""); // math symbols remain source terms
    const t=lex(input);
    if(!t.length)throw new Error("Enter a search expression.");
    const rpn=toRPN(t);
    const stack=[];
    for(const token of rpn){
      if(token.type==="TERM")stack.push(await phrasePostings(token.raw,math||/^math:/i.test(token.raw)));
      else if(token.type==="NOT"){if(!stack.length)throw new Error("NOT requires an argument.");stack.push(difference(allIndices(universeSize),stack.pop()));}
      else{
        if(stack.length<2)throw new Error("Missing Boolean operand.");
        const b=stack.pop(),a=stack.pop();stack.push(token.type==="OR"?union(a,b):intersect(a,b));
      }
    }
    if(stack.length!==1)throw new Error("Search expression is incomplete.");
    return stack[0];
  }
  function showPage() {
    const next=current.slice(displayed,displayed+50);
    const frag=document.createDocumentFragment();
    for(const c of next) {
      const card=document.createElement("article");card.className="result";
      const title=document.createElement("h2"), anchor=document.createElement("a");
      const url=new URL("../index.html",location.href);
      url.searchParams.set("c",c.id);
      url.searchParams.set("q",box.value.trim());
      anchor.href=url.toString();anchor.textContent=c.title||"Untitled conversation";title.appendChild(anchor);card.appendChild(title);
      const sub=document.createElement("div");sub.className="meta";
      sub.textContent=`${c.start_local||"Date unknown"} · ${Number(c.message_count||0).toLocaleString()} indexed messages · ${c.corpus||"Archive"}`;
      card.appendChild(sub);
      const note=document.createElement("small");note.textContent="Open in original Viewer to inspect matching words and source context.";card.appendChild(note);frag.appendChild(card);
    }
    output.appendChild(frag);displayed+=next.length;more.hidden=displayed>=current.length;
  }
  async function run(evt){
    evt?.preventDefault();
    output.replaceChildren();displayed=0;current=[];more.hidden=true;go.disabled=true;status.textContent="Searching indexed conversations…";
    try{
      const [meta,catalog]=await Promise.all([getIndex(),getCatalog()]);
      const validIds=new Set(meta.conversation_ids||[]);
      const ids=await expression(box.value.trim(),mode.value,meta.conversation_ids.length);
      current=catalog.filter(c=>validIds.has(c.id)&&ids.has(meta.conversation_ids.indexOf(c.id))
        &&($("dev").checked||c.corpus!=="development")&&($("live").checked||c.corpus!=="live"))
        .sort((a,b)=>String(b.start_local||"").localeCompare(String(a.start_local||"")));
      const limitations=mode.value==="math"?" Math: symbol/term normalization is approximate.":"";
      status.textContent=`${current.length} candidate conversations from ${meta.indexed_conversations} indexed public conversations. Index dated ${String(meta.generated_at_utc).slice(0,10)}. Candidate terms can occur in different messages; exact phrases/NEAR not guaranteed.${limitations}`;
      showPage();
    }catch(e){status.textContent="Search error: "+String(e.message||e);}
    finally{go.disabled=false;}
  }
  form.addEventListener("submit",run);
  more.addEventListener("click",showPage);
  document.querySelectorAll("[data-example]").forEach(btn=>btn.addEventListener("click",()=>{
    box.value=btn.dataset.example||"";if(btn.dataset.mode)mode.value=btn.dataset.mode;box.focus();
  }));
  const initial=new URLSearchParams(location.search).get("q");
  if(initial){box.value=initial;run();}
  else getIndex().then(meta=>{status.textContent=`Ready: ${Number(meta.indexed_conversations||0).toLocaleString()} curation-approved public conversations indexed.`;}).catch(()=>{status.textContent="Index not yet available; view the source Viewer directly.";});
})();