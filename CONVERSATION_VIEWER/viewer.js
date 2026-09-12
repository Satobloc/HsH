(() => {
  "use strict";

  const MANIFEST_URL = "data/conversations.json";
  const INITIAL_RENDER = 80;
  const RENDER_STEP = 80;

  const state = {
    catalog: [], filteredCatalog: [], conversation: null, raw: null, messages: [], rendered: 0,
    activeIndex: 0, speakerEnabled: new Map(), searchQuery: "", searchHits: [], searchCursor: -1,
    replay: { running: false, token: 0, cruiseFrame: null },
  };

  const ids = [
    "sidebar", "sidebarToggle", "conversationFilter", "showDevelopment", "showLive", "conversationList",
    "conversationMeta", "conversationTitle", "prevConversation", "nextConversation", "copyLink", "sourceLink",
    "threadSearch", "searchPrev", "searchNext", "searchStatus", "speakerFilters", "timeline", "timelineMarks",
    "positionLabel", "previousMessage", "nextMessage", "replayToggle", "replayMode", "replaySpeed", "replayStatus",
    "viewerNotice", "messages", "loadMoreSentinel", "searchDrawer", "closeSearchDrawer", "searchResults"
  ];
  const el = Object.fromEntries(ids.map(id => [id, document.getElementById(id)]));

  const speakerColors = {
    user: "var(--user)", assistant: "var(--assistant)", system: "var(--system)",
    tool: "var(--tool)", developer: "var(--developer)"
  };

  function colorForSpeaker(name) {
    const key = String(name || "unknown").toLowerCase();
    if (speakerColors[key]) return speakerColors[key];
    let hash = 0;
    for (const ch of key) hash = ((hash << 5) - hash + ch.charCodeAt(0)) | 0;
    return `hsl(${Math.abs(hash) % 360} 55% 67%)`;
  }

  function formatDate(value) {
    if (!value) return "date unknown";
    const d = new Date(value);
    return Number.isNaN(d.getTime()) ? String(value) : d.toLocaleString([], { year:"numeric", month:"short", day:"numeric", hour:"numeric", minute:"2-digit" });
  }

  function esc(s) {
    return String(s ?? "").replace(/[&<>"']/g, c => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[c]);
  }

  function parseParams() { return new URLSearchParams(location.search); }

  function updateUrl(index = state.activeIndex, replace = true) {
    if (!state.conversation) return;
    const url = new URL(location.href);
    url.searchParams.set("c", state.conversation.id);
    url.searchParams.set("m", String(index + 1));
    if (state.searchQuery) url.searchParams.set("q", state.searchQuery); else url.searchParams.delete("q");
    (replace ? history.replaceState : history.pushState).call(history, {}, "", url);
  }

  function activeBranchNodeIds(data, mapping) {
    const current = data && data.current_node;
    if (!current || !mapping[current]) return null;
    const ids = [], seen = new Set();
    let id = current;
    while (id && mapping[id] && !seen.has(id)) {
      seen.add(id); ids.push(id); id = mapping[id].parent;
    }
    return ids.reverse();
  }

  function textFromPart(value) {
    if (value == null) return "";
    if (["string","number","boolean"].includes(typeof value)) return String(value);
    if (Array.isArray(value)) return value.map(textFromPart).filter(Boolean).join("\n");
    if (typeof value === "object") {
      if (typeof value.text === "string") return value.text;
      if (value.content != null) return textFromPart(value.content);
      if (value.parts != null) return textFromPart(value.parts);
      if (value.result != null) return textFromPart(value.result);
      if (value.name && value.url) return `${value.name}: ${value.url}`;
      return "";
    }
    return String(value);
  }

  function contentText(content) {
    if (content == null) return "";
    if (typeof content === "string") return content;
    if (Array.isArray(content)) return content.map(textFromPart).filter(Boolean).join("\n");
    if (typeof content === "object") {
      if (content.parts != null) return textFromPart(content.parts);
      if (content.text != null) return textFromPart(content.text);
      if (content.result != null) return textFromPart(content.result);
      if (content.content != null) return textFromPart(content.content);
    }
    return textFromPart(content);
  }

  function normalizeMappingConversation(data) {
    const mapping = data && data.mapping;
    if (!mapping || typeof mapping !== "object") return [];
    const active = activeBranchNodeIds(data, mapping);
    let nodes;
    if (active) nodes = active.map(id => [id, mapping[id]]);
    else {
      nodes = Object.entries(mapping).filter(([,node]) => node && node.message);
      nodes.sort((a,b) => Number(a[1].message?.create_time || 0) - Number(b[1].message?.create_time || 0));
    }
    const out = [];
    for (const [nodeId, node] of nodes) {
      const msg = node && node.message;
      if (!msg || typeof msg !== "object") continue;
      const author = msg.author && typeof msg.author === "object" ? msg.author : {};
      const role = author.role || "unknown";
      const name = author.name || role;
      const text = contentText(msg.content).trim();
      if (!text && !["user","assistant","system","developer","tool"].includes(role)) continue;
      out.push({
        nodeId, role, speaker: name,
        text: text || `[${role} message with no displayable text]`,
        createTime: Number(msg.create_time || msg.update_time || 0) || null,
        recipient: msg.recipient || null,
        contentType: msg.content && msg.content.content_type || null,
      });
    }
    return out;
  }

  function normalizeGeneric(data) {
    const list = Array.isArray(data) ? data : (Array.isArray(data?.messages) ? data.messages : []);
    return list.map((msg, i) => {
      const author = typeof msg?.author === "object" ? msg.author : {};
      const role = msg?.role || author.role || msg?.speaker || "unknown";
      return {
        nodeId: msg?.id || String(i), role, speaker: author.name || role,
        text: contentText(msg?.content ?? msg?.text ?? msg?.message ?? "").trim(),
        createTime: Number(msg?.create_time || msg?.timestamp || 0) || null,
      };
    }).filter(m => m.text);
  }

  function normalizeConversation(data) {
    if (Array.isArray(data) && data.length === 1 && data[0] && data[0].mapping) data = data[0];
    const mapped = normalizeMappingConversation(data);
    return mapped.length ? mapped : normalizeGeneric(data);
  }

  function renderCatalog() {
    const needle = el.conversationFilter.value.trim().toLowerCase();
    const showDev = el.showDevelopment.checked, showLive = el.showLive.checked;
    state.filteredCatalog = state.catalog.filter(c => {
      if (c.corpus === "development" && !showDev) return false;
      if (c.corpus === "live" && !showLive) return false;
      return !needle || c.title.toLowerCase().includes(needle) || c.path.toLowerCase().includes(needle);
    });
    el.conversationList.innerHTML = state.filteredCatalog.map(c => `
      <div class="conversation-card ${state.conversation?.id === c.id ? "active" : ""}" data-id="${c.id}">
        <div class="title">${esc(c.title)}</div>
        <div class="meta"><span class="badge ${c.corpus === "live" ? "live" : ""}">${esc(c.corpus)}</span>
        <span>${Number(c.message_count).toLocaleString()} msgs</span><span>${esc(formatDate(c.start_local).replace(/,.*$/, ""))}</span></div>
      </div>`).join("");
    el.conversationList.querySelectorAll(".conversation-card").forEach(card => card.addEventListener("click", () => loadConversation(card.dataset.id, 0, true)));
  }

  function setLoading(label) {
    el.viewerNotice.hidden = false;
    el.viewerNotice.innerHTML = `<h3>${esc(label)}</h3><p>Loading and normalizing the selected raw conversation export…</p>`;
    el.messages.innerHTML = "";
  }

  async function loadConversation(id, requestedIndex = 0, push = false) {
    stopReplay();
    const convo = state.catalog.find(c => c.id === id);
    if (!convo) return;
    state.conversation = convo; renderCatalog(); setLoading(convo.title);
    el.conversationTitle.textContent = convo.title;
    el.conversationMeta.textContent = `${convo.corpus} · ${formatDate(convo.start_local)} → ${formatDate(convo.end_local)} · ${Number(convo.message_count).toLocaleString()} indexed messages`;
    el.sourceLink.href = convo.github_url; el.sourceLink.classList.remove("disabled");
    try {
      const res = await fetch(convo.raw_url, { cache: "no-cache" });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const raw = await res.json();
      const messages = normalizeConversation(raw);
      if (!messages.length) throw new Error("No displayable messages were found in this export.");
      state.raw = raw; state.messages = messages; state.rendered = 0;
      state.activeIndex = Math.max(0, Math.min(Number(requestedIndex) || 0, messages.length - 1));
      state.searchQuery = ""; state.searchHits = []; state.searchCursor = -1; state.speakerEnabled.clear();
      for (const msg of messages) state.speakerEnabled.set(msg.speaker, true);
      el.threadSearch.value = ""; el.viewerNotice.hidden = true; el.timeline.max = String(messages.length - 1); el.timeline.value = String(state.activeIndex);
      buildSpeakerFilters(); renderNext(Math.max(INITIAL_RENDER, state.activeIndex + 20)); applySpeakerFilters(); jumpToMessage(state.activeIndex, false);
      updateConversationButtons(); updateUrl(state.activeIndex, !push);
    } catch (error) {
      el.viewerNotice.hidden = false;
      el.viewerNotice.innerHTML = `<h3>Could not load conversation</h3><p>${esc(error.message || error)}</p><p><a class="button-link" target="_blank" rel="noopener" href="${esc(convo.github_url)}">Open source on GitHub</a></p>`;
      console.error(error);
    }
  }

  function buildSpeakerFilters() {
    const speakers = [...state.speakerEnabled.keys()];
    el.speakerFilters.innerHTML = speakers.map(name => `<button class="speaker-chip" data-speaker="${esc(name)}" style="--chip:${colorForSpeaker(name)}">${esc(name)}</button>`).join("");
    el.speakerFilters.querySelectorAll(".speaker-chip").forEach(chip => chip.addEventListener("click", () => {
      const name = chip.dataset.speaker; state.speakerEnabled.set(name, !state.speakerEnabled.get(name));
      chip.classList.toggle("off", !state.speakerEnabled.get(name)); applySpeakerFilters();
    }));
  }

  function renderMessage(index) {
    const msg = state.messages[index], article = document.createElement("article");
    article.className = "message"; article.id = `m${index + 1}`; article.dataset.index = String(index); article.dataset.speaker = msg.speaker;
    article.style.setProperty("--speaker", colorForSpeaker(msg.speaker));
    const time = msg.createTime ? new Date(msg.createTime * 1000).toLocaleString() : "timestamp unavailable";
    article.innerHTML = `<div class="message-head"><span class="message-speaker">${esc(msg.speaker)}</span><span class="message-meta">#${index + 1} · ${esc(time)}${msg.contentType ? ` · ${esc(msg.contentType)}` : ""}</span></div><div class="message-body"></div>`;
    article.querySelector(".message-body").textContent = msg.text;
    article.addEventListener("click", () => setActive(index, true));
    return article;
  }

  function renderNext(target = state.rendered + RENDER_STEP) {
    if (!state.messages.length) return;
    target = Math.min(target, state.messages.length);
    const frag = document.createDocumentFragment();
    while (state.rendered < target) { frag.appendChild(renderMessage(state.rendered)); state.rendered += 1; }
    el.messages.appendChild(frag); applySpeakerFilters(); highlightRendered();
  }

  function ensureRendered(index) { if (index >= state.rendered) renderNext(index + 20); }

  function setActive(index, writeUrl = true) {
    if (!state.messages.length) return;
    index = Math.max(0, Math.min(index, state.messages.length - 1)); state.activeIndex = index;
    el.timeline.value = String(index); el.positionLabel.textContent = `${index + 1} / ${state.messages.length}`;
    el.messages.querySelectorAll(".message.active").forEach(x => x.classList.remove("active"));
    const node = document.getElementById(`m${index + 1}`); if (node) node.classList.add("active");
    if (writeUrl) updateUrl(index, true);
  }

  function jumpToMessage(index, smooth = true) {
    if (!state.messages.length) return;
    index = Math.max(0, Math.min(index, state.messages.length - 1)); ensureRendered(index); setActive(index, true);
    document.getElementById(`m${index + 1}`)?.scrollIntoView({ behavior: smooth ? "smooth" : "auto", block: "center" });
  }

  function applySpeakerFilters() {
    el.messages.querySelectorAll(".message").forEach(node => node.classList.toggle("filtered", state.speakerEnabled.get(node.dataset.speaker) === false));
  }

  function searchThread() {
    const q = el.threadSearch.value.trim(); state.searchQuery = q; state.searchHits = []; state.searchCursor = -1;
    if (q) {
      const needle = q.toLocaleLowerCase();
      state.messages.forEach((m, i) => { if (m.text.toLocaleLowerCase().includes(needle)) state.searchHits.push(i); });
      if (state.searchHits.length) { const pos = state.searchHits.findIndex(i => i >= state.activeIndex); state.searchCursor = pos >= 0 ? pos : 0; }
    }
    el.searchStatus.textContent = `${state.searchHits.length} hit${state.searchHits.length === 1 ? "" : "s"}`;
    renderTimelineMarks(); renderSearchResults(); highlightRendered(); updateUrl(state.activeIndex, true);
    el.searchDrawer.classList.toggle("open", Boolean(q));
  }

  function highlightRendered() {
    const q = state.searchQuery, needle = q.toLocaleLowerCase();
    el.messages.querySelectorAll(".message").forEach(node => {
      const index = Number(node.dataset.index), body = node.querySelector(".message-body"), text = state.messages[index]?.text || "";
      node.classList.toggle("search-hit", Boolean(q) && state.searchHits.includes(index));
      if (!q) { body.textContent = text; return; }
      const lower = text.toLocaleLowerCase(); let from = 0; const frag = document.createDocumentFragment();
      while (true) {
        const at = lower.indexOf(needle, from); if (at < 0) break;
        frag.append(document.createTextNode(text.slice(from, at))); const mark = document.createElement("mark");
        mark.textContent = text.slice(at, at + q.length); frag.append(mark); from = at + q.length;
      }
      frag.append(document.createTextNode(text.slice(from))); body.replaceChildren(frag);
    });
  }

  function renderTimelineMarks() {
    if (!state.messages.length || !state.searchHits.length) { el.timelineMarks.innerHTML = ""; return; }
    const denom = Math.max(1, state.messages.length - 1);
    el.timelineMarks.innerHTML = state.searchHits.slice(0, 500).map(i => `<span class="timeline-mark" style="left:${(i / denom) * 100}%"></span>`).join("");
  }

  function snippet(text, query, radius = 85) {
    const lower = text.toLocaleLowerCase(), at = lower.indexOf(query.toLocaleLowerCase());
    const start = Math.max(0, at - radius), end = Math.min(text.length, at + query.length + radius);
    return `${start ? "…" : ""}${text.slice(start, end).replace(/\s+/g," ")}${end < text.length ? "…" : ""}`;
  }

  function renderSearchResults() {
    if (!state.searchQuery) { el.searchResults.innerHTML = ""; return; }
    el.searchResults.innerHTML = state.searchHits.slice(0, 400).map((index, pos) => {
      const m = state.messages[index];
      return `<div class="search-result ${pos === state.searchCursor ? "current" : ""}" data-pos="${pos}"><div class="result-meta">#${index + 1} · ${esc(m.speaker)}</div><div class="snippet">${esc(snippet(m.text, state.searchQuery))}</div></div>`;
    }).join("") || `<div class="status-text">No matches.</div>`;
    el.searchResults.querySelectorAll(".search-result").forEach(node => node.addEventListener("click", () => { state.searchCursor = Number(node.dataset.pos); jumpToSearchCursor(); }));
  }

  function jumpToSearchCursor() {
    if (!state.searchHits.length) return;
    state.searchCursor = (state.searchCursor + state.searchHits.length) % state.searchHits.length;
    jumpToMessage(state.searchHits[state.searchCursor], true); renderSearchResults();
  }

  function cycleSearch(delta) { if (state.searchHits.length) { state.searchCursor += delta; jumpToSearchCursor(); } }

  function updateConversationButtons() {
    const idx = state.catalog.findIndex(c => c.id === state.conversation?.id);
    el.prevConversation.disabled = idx <= 0; el.nextConversation.disabled = idx < 0 || idx >= state.catalog.length - 1;
  }

  function neighboringConversation(delta) {
    const idx = state.catalog.findIndex(c => c.id === state.conversation?.id), next = state.catalog[idx + delta];
    if (next) loadConversation(next.id, 0, true);
  }

  function replaySpeed(index = null) {
    const base = Number(el.replaySpeed.value) || 1;
    if (index == null) return base;
    return state.messages[index]?.role === "assistant" ? base * 10 : base;
  }

  function stopReplay() {
    state.replay.running = false; state.replay.token += 1;
    if (state.replay.cruiseFrame) cancelAnimationFrame(state.replay.cruiseFrame);
    state.replay.cruiseFrame = null; el.replayToggle.textContent = "▶ Replay"; el.replayStatus.textContent = "Paused";
  }

  function wait(ms, token) { return new Promise(resolve => setTimeout(() => resolve(token === state.replay.token), Math.max(10, ms))); }

  async function typealongMessage(index, token) {
    ensureRendered(index); jumpToMessage(index, true);
    const node = document.getElementById(`m${index + 1}`); if (!node) return false;
    const body = node.querySelector(".message-body"), text = state.messages[index].text;
    const charsPerSecond = 48 * replaySpeed(index); let shown = 0; body.textContent = "";
    while (shown < text.length && state.replay.running && token === state.replay.token) {
      shown = Math.min(text.length, shown + Math.max(1, Math.round(charsPerSecond / 20)));
      body.textContent = text.slice(0, shown); node.scrollIntoView({ block: "nearest" });
      if (!await wait(50, token)) return false;
    }
    body.textContent = text; return state.replay.running && token === state.replay.token;
  }

  async function runSequentialReplay(typealong) {
    const token = ++state.replay.token; state.replay.running = true; el.replayToggle.textContent = "⏸ Pause";
    for (let i = state.activeIndex; i < state.messages.length && state.replay.running && token === state.replay.token; i++) {
      setActive(i, true); let ok = true;
      if (typealong) ok = await typealongMessage(i, token);
      else {
        ensureRendered(i); jumpToMessage(i, true);
        const dwell = Math.min(7000, Math.max(650, (state.messages[i].text.length / (42 * replaySpeed(i))) * 1000));
        el.replayStatus.textContent = `Message ${i + 1} / ${state.messages.length}`; ok = await wait(dwell, token);
      }
      if (!ok) break; state.activeIndex = i;
      if (typealong && !await wait(Math.min(900, 300 + state.messages[i].text.length * 0.7) / replaySpeed(i), token)) break;
    }
    if (token === state.replay.token) stopReplay();
  }

  function runCruise() {
    const token = ++state.replay.token; state.replay.running = true; el.replayToggle.textContent = "⏸ Pause"; el.replayStatus.textContent = "Cruising";
    let last = performance.now();
    function step(now) {
      if (!state.replay.running || token !== state.replay.token) return;
      const dt = Math.min(50, now - last); last = now; el.messages.scrollTop += (42 * replaySpeed() * dt) / 1000;
      if (el.messages.scrollTop + el.messages.clientHeight >= el.messages.scrollHeight - 500 && state.rendered < state.messages.length) renderNext();
      if (el.messages.scrollTop + el.messages.clientHeight >= el.messages.scrollHeight - 3 && state.rendered >= state.messages.length) { stopReplay(); return; }
      state.replay.cruiseFrame = requestAnimationFrame(step);
    }
    state.replay.cruiseFrame = requestAnimationFrame(step);
  }

  function toggleReplay() {
    if (!state.messages.length) return;
    if (state.replay.running) { stopReplay(); return; }
    const mode = el.replayMode.value;
    if (mode === "cruise") runCruise(); else runSequentialReplay(mode === "typealong");
  }

  function currentVisibleMessage() {
    const nodes = [...el.messages.querySelectorAll(".message:not(.filtered)")]; if (!nodes.length) return state.activeIndex;
    const top = el.messages.getBoundingClientRect().top + 120; let best = nodes[0], dist = Infinity;
    for (const node of nodes) { const d = Math.abs(node.getBoundingClientRect().top - top); if (d < dist) { dist = d; best = node; } }
    return Number(best.dataset.index);
  }

  function bindEvents() {
    el.conversationFilter.addEventListener("input", renderCatalog); el.showDevelopment.addEventListener("change", renderCatalog); el.showLive.addEventListener("change", renderCatalog);
    el.threadSearch.addEventListener("input", searchThread); el.searchPrev.addEventListener("click", () => cycleSearch(-1)); el.searchNext.addEventListener("click", () => cycleSearch(1));
    el.closeSearchDrawer.addEventListener("click", () => el.searchDrawer.classList.remove("open"));
    el.prevConversation.addEventListener("click", () => neighboringConversation(-1)); el.nextConversation.addEventListener("click", () => neighboringConversation(1));
    el.previousMessage.addEventListener("click", () => jumpToMessage(state.activeIndex - 1)); el.nextMessage.addEventListener("click", () => jumpToMessage(state.activeIndex + 1));
    el.timeline.addEventListener("input", () => { const i = Number(el.timeline.value); el.positionLabel.textContent = `${i + 1} / ${state.messages.length}`; });
    el.timeline.addEventListener("change", () => jumpToMessage(Number(el.timeline.value), false)); el.replayToggle.addEventListener("click", toggleReplay);
    el.sidebarToggle.addEventListener("click", () => el.sidebar.classList.toggle("open"));
    el.copyLink.addEventListener("click", async () => {
      updateUrl(state.activeIndex, true);
      try { await navigator.clipboard.writeText(location.href); el.copyLink.textContent = "Copied"; setTimeout(() => el.copyLink.textContent = "Copy link", 900); }
      catch { prompt("Copy this link:", location.href); }
    });
    el.messages.addEventListener("scroll", () => {
      if (el.messages.scrollTop + el.messages.clientHeight > el.messages.scrollHeight - 900 && state.rendered < state.messages.length) renderNext();
      if (!state.replay.running) setActive(currentVisibleMessage(), true);
    }, { passive: true });
    document.addEventListener("keydown", event => {
      if (event.target.matches("input,textarea,select")) return;
      if (event.key === "/") { event.preventDefault(); el.threadSearch.focus(); }
      else if (event.key.toLowerCase() === "j") jumpToMessage(state.activeIndex + 1);
      else if (event.key.toLowerCase() === "k") jumpToMessage(state.activeIndex - 1);
      else if (event.code === "Space") { event.preventDefault(); toggleReplay(); }
    });
    window.addEventListener("popstate", () => {
      const p = parseParams(), id = p.get("c"), m = Math.max(0, Number(p.get("m") || 1) - 1);
      if (id && id !== state.conversation?.id) loadConversation(id, m, false); else if (state.messages.length) jumpToMessage(m, false);
    });
  }

  async function boot() {
    bindEvents();
    try {
      const res = await fetch(MANIFEST_URL, { cache: "no-cache" }); if (!res.ok) throw new Error(`manifest HTTP ${res.status}`);
      const data = await res.json(); state.catalog = Array.isArray(data.conversations) ? data.conversations : []; renderCatalog();
      const p = parseParams(), id = p.get("c") || state.catalog[0]?.id, m = Math.max(0, Number(p.get("m") || 1) - 1);
      if (p.get("q")) el.threadSearch.value = p.get("q");
      if (id) { await loadConversation(id, m, false); if (el.threadSearch.value) searchThread(); }
    } catch (error) {
      el.viewerNotice.innerHTML = `<h3>Viewer manifest unavailable</h3><p>${esc(error.message || error)}</p><p>Run <code>python tools/build_conversation_viewer.py</code> from the repository root, then serve the repo over HTTP.</p>`;
      console.error(error);
    }
  }

  boot();
})();
