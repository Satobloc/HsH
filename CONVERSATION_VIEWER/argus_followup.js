(() => {
  "use strict";

  const params = new URLSearchParams(location.search);
  const ADMIN = ["127.0.0.1", "localhost"].includes(location.hostname) && params.get("admin") === "1";
  const ADMIN_TOKEN = params.get("token") || "";
  const openKeyPrefix = "hsh-viewer-open:";
  let currentConversationId = params.get("c") || null;

  function messageIndex(article) {
    const index = Number(article?.dataset?.index);
    return Number.isFinite(index) ? index : null;
  }

  function openKey(index) {
    return `${openKeyPrefix}${currentConversationId || "unknown"}:${index}`;
  }

  function rememberedOpen(index) {
    try { return sessionStorage.getItem(openKey(index)) === "1"; }
    catch { return false; }
  }

  function rememberOpen(index, isOpen) {
    try {
      if (isOpen) sessionStorage.setItem(openKey(index), "1");
      else sessionStorage.removeItem(openKey(index));
    } catch {}
  }

  function interactiveTarget(target) {
    return Boolean(target?.closest?.("button, a, input, select, textarea, label, summary, dialog, .annotation-selector, .annotation-quick-controls"));
  }

  function setExpanded(article, open) {
    if (!article?.classList?.contains("provenance-collapsed")) return;
    const index = messageIndex(article);
    article.classList.toggle("annotation-open", Boolean(open));
    article.classList.toggle("annotation-manual-open", Boolean(open));
    article.setAttribute("aria-expanded", open ? "true" : "false");
    const button = article.querySelector(".provenance-open-button");
    if (button) button.textContent = open ? "Close" : "Open";
    if (index != null) rememberOpen(index, open);
  }

  function restoreExpanded(article) {
    const index = messageIndex(article);
    if (index == null || !article.classList.contains("provenance-collapsed")) return;
    if (rememberedOpen(index)) setExpanded(article, true);
  }

  function installClickOpen() {
    const messages = document.getElementById("messages");
    if (!messages || messages.dataset.clickOpenInstalled === "1") return;
    messages.dataset.clickOpenInstalled = "1";
    messages.addEventListener("click", event => {
      if (interactiveTarget(event.target)) return;
      const article = event.target.closest?.(".message.provenance-collapsed");
      if (!article || !messages.contains(article)) return;
      setExpanded(article, !article.classList.contains("annotation-open"));
    });
  }

  function exactRange(data, index) {
    const item = data?.conversations?.[currentConversationId];
    if (!item) return null;
    const n = index + 1;
    return (item.ranges || []).find(r => Number(r.start) === n && Number(r.end) === n) || null;
  }

  function ensureExactRange(data, index) {
    data.conversations ||= {};
    const item = data.conversations[currentConversationId] ||= {
      visibility: "public", audience: "public", provenance: { class: "normal", priority: 0 }, search_weight: 0, tags: [], ranges: []
    };
    item.ranges ||= [];
    let range = exactRange(data, index);
    if (!range) {
      range = {
        start: index + 1, end: index + 1,
        visibility: "public", audience: "internal",
        priority: 0, search_weight: 0, label: "",
        tags: [], timeline_links: [], notes: ""
      };
      item.ranges.push(range);
    }
    range.tags ||= [];
    return range;
  }

  async function persist(data, statusNode) {
    if (!ADMIN || !ADMIN_TOKEN) throw new Error("Internal annotation token unavailable");
    if (statusNode) statusNode.textContent = "saving…";
    const response = await fetch("/__viewer_admin/annotations", {
      method: "POST",
      headers: { "Content-Type": "application/json", "X-Viewer-Admin-Token": ADMIN_TOKEN },
      body: JSON.stringify(data, null, 2)
    });
    if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
    if (statusNode) statusNode.textContent = "saved";
  }

  async function quickAction(article, action) {
    const api = window.HSHAnnotations;
    const index = messageIndex(article);
    if (!ADMIN || !api || index == null || !currentConversationId) return;
    const data = api.getData();
    const range = ensureExactRange(data, index);
    const controls = article.querySelector(".annotation-quick-controls");
    const statusNode = controls?.querySelector(".quick-status");

    if (action === "upgrade") range.priority = Math.min(100, Number(range.priority || 0) + 10);
    if (action === "downgrade") range.priority = Math.max(0, Number(range.priority || 0) - 10);
    if (action === "flag") {
      const has = range.tags.includes("flagged");
      range.tags = has ? range.tags.filter(t => t !== "flagged") : [...range.tags, "flagged"];
    }
    if (action === "promote") {
      const has = range.tags.includes("important");
      range.tags = has ? range.tags.filter(t => t !== "important") : [...range.tags, "important"];
      range.search_weight = has ? Math.min(0, Number(range.search_weight || 0)) : Math.max(25, Number(range.search_weight || 0));
      if (!has) range.priority = Math.max(25, Number(range.priority || 0));
    }

    try {
      await persist(data, statusNode);
      renderQuickState(article, range);
      setTimeout(() => { if (statusNode) statusNode.textContent = ""; }, 900);
    } catch (error) {
      if (statusNode) statusNode.textContent = "save failed";
      console.error(error);
    }
  }

  function renderQuickState(article, range = null) {
    const controls = article.querySelector(".annotation-quick-controls");
    if (!controls) return;
    const data = window.HSHAnnotations?.getData?.();
    const index = messageIndex(article);
    range ||= index == null ? null : exactRange(data, index);
    const priority = Number(range?.priority || 0);
    controls.querySelector(".quick-priority").textContent = `P${priority}`;
    controls.querySelector('[data-quick="flag"]')?.classList.toggle("active", Boolean(range?.tags?.includes("flagged")));
    controls.querySelector('[data-quick="promote"]')?.classList.toggle("active", Boolean(range?.tags?.includes("important")));
  }

  function installQuickControls(article) {
    if (!ADMIN || !article || article.querySelector(".annotation-quick-controls")) return;
    const meta = article.querySelector(".message-meta") || article.querySelector(".message-head");
    if (!meta) return;
    const wrap = document.createElement("span");
    wrap.className = "annotation-quick-controls";
    wrap.setAttribute("aria-label", "Internal curation controls");
    wrap.innerHTML = `
      <span class="quick-priority">P0</span>
      <button type="button" data-quick="downgrade" title="Downgrade priority by 10">−</button>
      <button type="button" data-quick="upgrade" title="Upgrade priority by 10">+</button>
      <button type="button" data-quick="flag" title="Toggle internal review flag">Flag</button>
      <button type="button" data-quick="promote" title="Toggle search/provenance promotion">Promote</button>
      <span class="quick-status" aria-live="polite"></span>`;
    wrap.addEventListener("click", event => {
      const button = event.target.closest("button[data-quick]");
      if (!button) return;
      event.stopPropagation();
      quickAction(article, button.dataset.quick);
    });
    meta.prepend(wrap);
    renderQuickState(article);
  }

  function enhanceArticle(article) {
    if (!(article instanceof HTMLElement) || !article.classList.contains("message")) return;
    restoreExpanded(article);
    installQuickControls(article);
  }

  function enhanceAll() {
    installClickOpen();
    document.querySelectorAll("#messages > .message").forEach(enhanceArticle);
  }

  document.addEventListener("viewer:conversation-loaded", event => {
    currentConversationId = event.detail?.conversation?.id || params.get("c") || null;
    queueMicrotask(enhanceAll);
  });

  document.addEventListener("viewer:active-message", event => {
    const index = Number(event.detail?.index);
    if (!Number.isFinite(index)) return;
    const article = document.getElementById(`m${index + 1}`);
    if (article) enhanceArticle(article);
  });

  const messages = document.getElementById("messages");
  if (messages) new MutationObserver(mutations => {
    for (const mutation of mutations) {
      for (const node of mutation.addedNodes) {
        if (node instanceof HTMLElement && node.classList.contains("message")) enhanceArticle(node);
      }
    }
  }).observe(messages, { childList: true });

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", enhanceAll);
  else enhanceAll();
})();
