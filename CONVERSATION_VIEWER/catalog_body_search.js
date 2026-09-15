(() => {
  "use strict";

  const META_URL = "data/body_search/meta.json";
  const SHARD_BASE = "data/body_search/";
  const shardCache = new Map();
  let metaPromise = null;
  let catalogPromise = null;
  let searchSerial = 0;
  let debounce = null;

  const filter = document.getElementById("conversationFilter");
  const list = document.getElementById("conversationList");
  const showDevelopment = document.getElementById("showDevelopment");
  const showLive = document.getElementById("showLive");
  if (!filter || !list) return;

  filter.placeholder = "Search titles, dates, or message bodies…";

  function esc(s) {
    return String(s ?? "").replace(/[&<>"']/g, c => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[c]);
  }

  function normalizeTokens(value) {
    const normalized = String(value || "").replace(/h\s*\(\s*s\s*\)\s*h/gi, "hsh").toLocaleLowerCase();
    const hits = normalized.match(/[\p{L}\p{N}_]+/gu) || [];
    return [...new Set(hits.filter(x => x.length >= 2))];
  }

  function shardKey(token) {
    const first = token[0] || "_";
    return /^[a-z0-9]$/.test(first) ? first : "_";
  }

  async function loadJson(url) {
    const res = await fetch(url, { cache: "no-cache" });
    if (!res.ok) throw new Error(`HTTP ${res.status} loading ${url}`);
    return res.json();
  }

  function getMeta() {
    if (!metaPromise) metaPromise = loadJson(META_URL);
    return metaPromise;
  }

  function getCatalog() {
    if (!catalogPromise) catalogPromise = loadJson("data/conversations.json").then(x => x.conversations || []);
    return catalogPromise;
  }

  async function getShard(key) {
    if (!shardCache.has(key)) shardCache.set(key, loadJson(`${SHARD_BASE}${encodeURIComponent(key)}.json`).catch(() => ({ tokens: {} })));
    return shardCache.get(key);
  }

  async function postings(token) {
    const shard = await getShard(shardKey(token));
    const tokens = shard.tokens || {};
    if (Array.isArray(tokens[token])) return new Set(tokens[token]);
    if (token.length < 3) return new Set();

    // Prefix fallback makes incremental typing useful without storing a separate
    // prefix index. Cap broad expansions to keep pathological queries bounded.
    const found = new Set();
    let expanded = 0;
    for (const [key, values] of Object.entries(tokens)) {
      if (!key.startsWith(token)) continue;
      expanded += 1;
      if (expanded > 300) return new Set();
      for (const value of values) found.add(value);
    }
    return found;
  }

  async function bodyMatches(query) {
    const tokens = normalizeTokens(query);
    if (!tokens.length) return [];
    const sets = await Promise.all(tokens.map(postings));
    if (sets.some(s => !s.size)) return [];
    sets.sort((a, b) => a.size - b.size);
    const intersection = [...sets[0]].filter(value => sets.slice(1).every(s => s.has(value)));
    const meta = await getMeta();
    const ids = meta.conversation_ids || [];
    return intersection.map(i => ids[i]).filter(Boolean);
  }

  function formatDay(value) {
    if (!value) return "Date unknown";
    const d = new Date(value);
    return Number.isNaN(d.getTime()) ? String(value) : d.toLocaleDateString([], { year:"numeric", month:"short", day:"numeric" });
  }

  function allowedByCorpus(c) {
    if (c.corpus === "development" && showDevelopment && !showDevelopment.checked) return false;
    if (c.corpus === "live" && showLive && !showLive.checked) return false;
    return true;
  }

  function visibleByAnnotation(c) {
    return !window.HSHAnnotations || window.HSHAnnotations.isConversationVisible(c.id);
  }

  function alreadyRenderedIds() {
    const ids = new Set();
    list.querySelectorAll(".conversation-card[data-id]").forEach(node => ids.add(node.dataset.id));
    list.querySelectorAll(".version-item[data-version-id]").forEach(node => ids.add(node.dataset.versionId));
    return ids;
  }

  function removeBodyResults() {
    list.querySelectorAll("[data-body-search-added='true']").forEach(node => node.remove());
  }

  function appendBodyResults(conversations, query) {
    removeBodyResults();
    if (!conversations.length || filter.value.trim() !== query) return;

    const label = document.createElement("div");
    label.dataset.bodySearchAdded = "true";
    label.className = "body-search-divider";
    label.textContent = `Message-body matches · ${conversations.length}`;
    list.appendChild(label);

    for (const c of conversations) {
      const card = document.createElement("div");
      card.className = "conversation-card body-search-match";
      card.dataset.id = c.id;
      card.dataset.bodySearchAdded = "true";
      card.innerHTML = `<div class="card-date">${esc(formatDay(c.start_local))}</div>
        <div class="title">${esc(c.title)}</div>
        <div class="meta"><span class="badge">body</span><span>${Number(c.message_count || 0).toLocaleString()} msgs</span></div>`;
      card.addEventListener("click", () => {
        const url = new URL(location.href);
        url.searchParams.set("c", c.id);
        url.searchParams.set("m", "1");
        url.searchParams.set("q", query);
        location.assign(url.toString());
      });
      list.appendChild(card);
    }
  }

  async function runBodySearch() {
    const serial = ++searchSerial;
    const query = filter.value.trim();
    removeBodyResults();
    if (!query || !normalizeTokens(query).length) return;

    try {
      const [ids, catalog] = await Promise.all([bodyMatches(query), getCatalog()]);
      if (serial !== searchSerial || filter.value.trim() !== query) return;
      const existing = alreadyRenderedIds();
      const wanted = new Set(ids);
      const matches = catalog
        .filter(c => wanted.has(c.id) && !existing.has(c.id) && allowedByCorpus(c) && visibleByAnnotation(c))
        .sort((a, b) => String(b.start_local || "").localeCompare(String(a.start_local || "")) || String(a.title || "").localeCompare(String(b.title || "")));
      appendBodyResults(matches, query);
    } catch (error) {
      console.warn("Conversation body search unavailable:", error);
    }
  }

  function schedule() {
    clearTimeout(debounce);
    debounce = setTimeout(runBodySearch, 90);
  }

  // viewer.js has already bound its metadata filter by the time this script runs.
  // Its synchronous render happens first; this module then appends body-only hits.
  filter.addEventListener("input", schedule);
  showDevelopment?.addEventListener("change", schedule);
  showLive?.addEventListener("change", schedule);
})();
