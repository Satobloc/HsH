(() => {
  "use strict";

  const knownViewerIds = new Set();
  const sourceIds = new Map();

  function esc(value) {
    return String(value ?? "").replace(/[&<>"']/g, ch => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[ch]);
  }

  function rememberIds(root = document) {
    root.querySelectorAll?.(".conversation-card[data-id]").forEach(card => {
      if (card.dataset.id) knownViewerIds.add(card.dataset.id);
    });
    root.querySelectorAll?.(".version-item[data-version-id]").forEach(item => {
      if (item.dataset.versionId) knownViewerIds.add(item.dataset.versionId);
    });
  }

  function copyId(event, value) {
    event.preventDefault();
    event.stopPropagation();
    if (!value) return;
    navigator.clipboard?.writeText(value).catch(() => {});
    const node = event.currentTarget;
    if (!node) return;
    const prior = node.textContent;
    node.textContent = "copied";
    window.setTimeout(() => { node.textContent = prior; }, 700);
  }

  function makeTag(value, label = "ID") {
    const tag = document.createElement("span");
    tag.className = "conversation-id-tag";
    tag.tabIndex = 0;
    tag.dataset.fullId = value;
    tag.title = `Copy ${label === "CID" ? "source conversation" : "viewer conversation"} ID: ${value}`;
    tag.textContent = `${label} ${value.slice(0, 12)}`;
    tag.addEventListener("click", event => copyId(event, value));
    tag.addEventListener("keydown", event => {
      if (event.key === "Enter" || event.key === " ") copyId(event, value);
    });
    return tag;
  }

  function decorateList() {
    const list = document.getElementById("conversationList");
    if (!list) return;
    rememberIds(list);

    list.querySelectorAll(".conversation-card[data-id]").forEach(card => {
      if (card.querySelector(":scope > .meta .conversation-id-tag")) return;
      const meta = card.querySelector(":scope > .meta");
      if (meta) meta.appendChild(makeTag(card.dataset.id, "ID"));
    });

    list.querySelectorAll(".version-item[data-version-id]").forEach(item => {
      if (item.querySelector(".conversation-id-tag")) return;
      const small = item.querySelector("small");
      if (small) {
        small.append(" · ");
        small.appendChild(makeTag(item.dataset.versionId, "ID"));
      }
    });
  }

  function viewerIdMatch(query) {
    const q = String(query || "").trim().toLowerCase();
    if (!/^[0-9a-f]{4,40}$/.test(q)) return null;
    const matches = [...knownViewerIds].filter(id => id.toLowerCase().startsWith(q));
    return matches.length === 1 ? matches[0] : null;
  }

  function installIdLookup() {
    const input = document.getElementById("conversationFilter");
    if (!input) return;
    input.placeholder = "Filter conversations, dates, or IDs…";
    input.title = "Filter normally, or enter a viewer conversation ID/prefix and press Enter.";
    input.addEventListener("keydown", event => {
      if (event.key !== "Enter") return;
      const id = viewerIdMatch(input.value);
      if (!id) return;
      event.preventDefault();
      const url = new URL(location.href);
      url.searchParams.set("c", id);
      url.searchParams.set("m", "1");
      url.searchParams.delete("q");
      location.href = url.toString();
    });
  }

  function rawConversationId(raw) {
    if (Array.isArray(raw) && raw.length === 1) raw = raw[0];
    if (!raw || typeof raw !== "object") return null;
    const value = raw.conversation_id || raw.conversationId || null;
    return typeof value === "string" && value.trim() ? value.trim() : null;
  }

  async function sourceConversationId(convo) {
    if (!convo?.id || !convo?.raw_url) return null;
    if (sourceIds.has(convo.id)) return sourceIds.get(convo.id);
    try {
      const response = await fetch(convo.raw_url, { cache: "default" });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const text = await response.text();
      const raw = JSON.parse(text);
      const id = rawConversationId(raw);
      sourceIds.set(convo.id, id);
      return id;
    } catch (_) {
      sourceIds.set(convo.id, null);
      return null;
    }
  }

  function renderHeaderIds(convo, sourceId = null) {
    const meta = document.getElementById("conversationMeta");
    if (!meta || !convo?.id) return;
    const base = meta.dataset.idBase || meta.textContent.replace(/\s·\sID\s[0-9a-f]+(?:\s·\sCID\s[0-9a-f-]+)?$/i, "");
    meta.dataset.idBase = base;
    meta.textContent = `${base} · ID ${convo.id}${sourceId ? ` · CID ${sourceId}` : ""}`;
    meta.title = `Viewer ID: ${convo.id}${sourceId ? `\nSource conversation ID: ${sourceId}` : ""}`;
  }

  document.addEventListener("viewer:conversation-loaded", event => {
    const convo = event.detail?.conversation;
    decorateList();
    renderHeaderIds(convo);
    sourceConversationId(convo).then(id => {
      if (id) renderHeaderIds(convo, id);
    });
  });

  function init() {
    const list = document.getElementById("conversationList");
    if (list) {
      decorateList();
      new MutationObserver(() => decorateList()).observe(list, { childList: true, subtree: true });
    }
    installIdLookup();

    const style = document.createElement("style");
    style.textContent = `
      .conversation-id-tag {
        display: inline-block;
        border: 1px solid color-mix(in srgb, var(--line), var(--accent) 26%);
        border-radius: 999px;
        padding: 1px 5px;
        font: 600 .64rem/1.25 ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
        letter-spacing: .01em;
        color: var(--accent-2);
        background: color-mix(in srgb, var(--panel-2), transparent 16%);
        cursor: copy;
        user-select: none;
      }
      .conversation-id-tag:focus { outline: 1px solid var(--accent); outline-offset: 1px; }
      .version-item .conversation-id-tag { font-size: .6rem; padding: 0 4px; }
    `;
    document.head.appendChild(style);
  }

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init, { once: true });
  else init();
})();
