(() => {
  "use strict";

  const PUBLIC_URL = "data/annotations.json";
  const params = new URLSearchParams(location.search);
  const ADMIN = ["127.0.0.1", "localhost"].includes(location.hostname) && params.get("admin") === "1";
  const ADMIN_TOKEN = params.get("token") || "";
  const PROMOTE_TAGS = new Set(["provenance-anchor", "milestone", "important", "timeline-anchor", "timeline-candidate"]);
  const STATUS_TAGS = new Set(["superseded", "misleading", "counterfactual", "not-currently-held", "rejected", "re-adopted", "current"]);
  const QUICK_TAGS = [
    "provenance-anchor", "milestone", "important", "interesting", "fun", "timeline-candidate",
    "superseded", "misleading", "counterfactual", "not-currently-held", "rejected", "re-adopted", "current"
  ];

  const emptyData = () => ({ schema_version: 1, conversations: {} });
  let data = emptyData();
  let currentConversationId = null;
  let selected = new Set();
  let lastSelected = null;
  let showFullConversation = false;
  let dialogScope = null;

  function clone(value) { return JSON.parse(JSON.stringify(value)); }
  function normalizePayload(payload) {
    if (!payload || typeof payload !== "object" || payload.schema_version !== 1 || typeof payload.conversations !== "object") return emptyData();
    return payload;
  }
  function entry(id) { return data.conversations?.[id] || null; }
  function ranges(id) { return Array.isArray(entry(id)?.ranges) ? entry(id).ranges : []; }
  function messageNumber(index) { return Number(index) + 1; }
  function matchingRanges(id, index) {
    const n = messageNumber(index);
    return ranges(id).filter(r => Number(r.start) <= n && n <= Number(r.end));
  }
  function classRank(value) { return value === "core" ? 3 : value === "supporting" ? 2 : value === "normal" ? 1 : 0; }
  function tagBoost(tags = []) {
    let score = 0;
    for (const tag of tags) {
      if (tag === "provenance-anchor") score += 500;
      else if (tag === "milestone") score += 350;
      else if (tag === "important") score += 180;
      else if (tag === "timeline-anchor") score += 160;
      else if (tag === "timeline-candidate") score += 100;
    }
    return score;
  }
  function rangePriority(r) { return Number(r.priority || 0) * 10 + Number(r.search_weight || 0) + tagBoost(r.tags); }
  function isPromotedRange(r) { return Number(r.priority || 0) > 0 || (r.tags || []).some(tag => PROMOTE_TAGS.has(tag)); }
  function promotedRanges(id) { return ranges(id).filter(isPromotedRange); }

  function isConversationVisible(id) {
    if (ADMIN) return true;
    return entry(id)?.visibility !== "hidden";
  }
  function isMessageVisible(id, index) {
    if (ADMIN) return true;
    return !matchingRanges(id, index).some(r => r.visibility === "hidden");
  }
  function conversationSearchPriority(id) {
    const item = entry(id);
    if (!item) return 0;
    const p = item.provenance || {};
    return classRank(p.class) * 100000 + Number(p.priority || 0) * 100 + Number(item.search_weight || 0);
  }
  function messageSearchPriority(id, index) {
    const matches = matchingRanges(id, index);
    if (!matches.length) return 0;
    return Math.max(...matches.map(rangePriority));
  }
  function compareMessageSearch(id, a, b) {
    return (messageSearchPriority(id, b) - messageSearchPriority(id, a)) || (a - b);
  }
  function defaultAnchor(id) {
    const item = entry(id);
    const explicit = Number(item?.provenance?.default_anchor || 0);
    if (explicit > 0) return explicit - 1;
    const candidates = promotedRanges(id).map(r => ({ index: Math.max(0, Number(r.start || 1) - 1), score: rangePriority(r) }));
    candidates.sort((a, b) => (b.score - a.score) || (a.index - b.index));
    return candidates[0]?.index ?? 0;
  }
  function shouldOpen(id, index) {
    const promoted = promotedRanges(id);
    if (!promoted.length || showFullConversation) return true;
    const n = messageNumber(index);
    return promoted.some(r => n >= Number(r.start) - 1 && n <= Number(r.end) + 1);
  }

  async function loadJson(url, options = {}) {
    const response = await fetch(url, { cache: "no-cache", ...options });
    if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
    return response.json();
  }

  const ready = (async () => {
    let publicData = emptyData();
    try { publicData = normalizePayload(await loadJson(PUBLIC_URL)); } catch (error) { console.debug("Annotations unavailable", error); }
    data = publicData;
    if (ADMIN) {
      try {
        data = normalizePayload(await loadJson("/__viewer_admin/annotations", { headers: { "X-Viewer-Admin-Token": ADMIN_TOKEN } }));
      } catch (error) {
        console.warn("Internal annotation store unavailable; using public annotations only.", error);
      }
    }
    return data;
  })();

  window.HSHAnnotations = {
    ready,
    isAdmin: ADMIN,
    isConversationVisible,
    isMessageVisible,
    conversationSearchPriority,
    messageSearchPriority,
    compareMessageSearch,
    defaultAnchor,
    getConversation: id => entry(id),
    getData: () => data,
  };

  function esc(value) {
    return String(value ?? "").replace(/[&<>"']/g, c => ({ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;" })[c]);
  }
  function niceTag(tag) { return String(tag || "").replace(/-/g, " "); }

  function ensureChrome() {
    const header = document.querySelector(".viewer-header");
    if (!header) return;
    if (!document.getElementById("provenanceBar")) {
      const bar = document.createElement("div");
      bar.id = "provenanceBar";
      bar.className = "provenance-bar";
      bar.hidden = true;
      header.appendChild(bar);
    }
    if (ADMIN && !document.getElementById("annotationAdminBar")) {
      const bar = document.createElement("div");
      bar.id = "annotationAdminBar";
      bar.className = "annotation-admin-bar";
      bar.innerHTML = `
        <strong>Internal annotation mode</strong>
        <button type="button" data-action="conversation">Tag conversation</button>
        <button type="button" data-action="selected" disabled>Tag selected <span class="selection-count">0</span></button>
        <button type="button" data-action="clear">Clear selection</button>
        <button type="button" data-action="publish">Publish public projection</button>
        <button type="button" data-action="export">Export</button>
        <span class="annotation-save-status">Ready</span>`;
      header.appendChild(bar);
      bar.querySelector('[data-action="conversation"]').addEventListener("click", () => openEditor({ type: "conversation" }));
      bar.querySelector('[data-action="selected"]').addEventListener("click", () => selected.size && openEditor({ type: "messages", indices: [...selected].sort((a,b)=>a-b) }));
      bar.querySelector('[data-action="clear"]').addEventListener("click", clearSelection);
      bar.querySelector('[data-action="publish"]').addEventListener("click", publishProjection);
      bar.querySelector('[data-action="export"]').addEventListener("click", exportAnnotations);
    }
    if (ADMIN && !document.getElementById("annotationDialog")) buildDialog();
  }

  function renderProvenanceBar() {
    ensureChrome();
    const bar = document.getElementById("provenanceBar");
    if (!bar || !currentConversationId) return;
    const item = entry(currentConversationId);
    const provenance = item?.provenance || {};
    const promoted = promotedRanges(currentConversationId);
    const core = provenance.class === "core";
    const supporting = provenance.class === "supporting";
    if (!core && !supporting && !promoted.length) { bar.hidden = true; bar.innerHTML = ""; return; }
    bar.hidden = false;
    const label = core ? "Core provenance evidence" : supporting ? "Supporting provenance" : "Promoted passages";
    const priority = Number(provenance.priority || 0);
    bar.innerHTML = `<span class="provenance-badge ${core ? "core" : ""}">${esc(label)}</span>${priority ? `<span>priority ${priority}</span>` : ""}${promoted.length ? `<span>${promoted.length} promoted passage${promoted.length === 1 ? "" : "s"}</span>` : ""}${promoted.length ? `<button type="button" class="provenance-expand-all">${showFullConversation ? "Focus provenance" : "Show full conversation"}</button>` : ""}`;
    bar.querySelector(".provenance-expand-all")?.addEventListener("click", () => {
      showFullConversation = !showFullConversation;
      applyAllMessages();
      renderProvenanceBar();
    });
  }

  function updateAdminBar() {
    if (!ADMIN) return;
    ensureChrome();
    const bar = document.getElementById("annotationAdminBar");
    if (!bar) return;
    bar.querySelector(".selection-count").textContent = `(${selected.size})`;
    bar.querySelector('[data-action="selected"]').disabled = selected.size === 0;
  }

  function badgesFor(id, index) {
    const matches = matchingRanges(id, index);
    const tags = [...new Set(matches.flatMap(r => r.tags || []))];
    const result = [];
    if (matches.some(r => r.visibility === "hidden")) result.push({ text: "private in viewer", cls: "private" });
    for (const tag of tags) {
      if (PROMOTE_TAGS.has(tag) || STATUS_TAGS.has(tag) || ["interesting", "fun"].includes(tag)) result.push({ text: niceTag(tag), cls: STATUS_TAGS.has(tag) ? "status" : "" });
    }
    return result;
  }

  function applyMessage(article) {
    if (!(article instanceof HTMLElement) || !article.classList.contains("message") || !currentConversationId) return;
    const index = Number(article.dataset.index);
    if (!Number.isFinite(index)) return;
    article.classList.toggle("annotation-hidden", !isMessageVisible(currentConversationId, index));
    const focusMode = promotedRanges(currentConversationId).length > 0 && !showFullConversation;
    article.classList.toggle("provenance-collapsed", focusMode && !shouldOpen(currentConversationId, index));
    article.classList.toggle("provenance-promoted", focusMode && shouldOpen(currentConversationId, index) && matchingRanges(currentConversationId, index).some(isPromotedRange));

    let badgeWrap = article.querySelector(".annotation-badges");
    const badges = badgesFor(currentConversationId, index);
    if (badges.length) {
      if (!badgeWrap) {
        badgeWrap = document.createElement("span");
        badgeWrap.className = "annotation-badges";
        article.querySelector(".message-head")?.appendChild(badgeWrap);
      }
      badgeWrap.innerHTML = badges.map(b => `<span class="annotation-badge ${esc(b.cls)}">${esc(b.text)}</span>`).join("");
    } else badgeWrap?.remove();

    let openButton = article.querySelector(".provenance-open-button");
    if (article.classList.contains("provenance-collapsed")) {
      if (!openButton) {
        openButton = document.createElement("button");
        openButton.type = "button";
        openButton.className = "provenance-open-button";
        openButton.textContent = "Open";
        openButton.addEventListener("click", event => {
          event.stopPropagation();
          article.classList.toggle("annotation-open");
          openButton.textContent = article.classList.contains("annotation-open") ? "Close" : "Open";
        });
        article.querySelector(".message-meta")?.prepend(openButton);
      }
    } else openButton?.remove();

    if (ADMIN) installAdminMessageControls(article, index);
  }

  function installAdminMessageControls(article, index) {
    const head = article.querySelector(".message-head");
    if (!head || article.querySelector(".annotation-selector")) return;
    const wrap = document.createElement("span");
    wrap.className = "annotation-selector";
    wrap.innerHTML = `<label title="Select message for range tagging"><input type="checkbox" ${selected.has(index) ? "checked" : ""}> select</label><button type="button">Tag</button>`;
    const checkbox = wrap.querySelector("input");
    checkbox.addEventListener("click", event => {
      event.stopPropagation();
      if (event.shiftKey && lastSelected != null) {
        const [a,b] = [lastSelected,index].sort((x,y)=>x-y);
        for (let i=a; i<=b; i++) selected.add(i);
      } else if (checkbox.checked) selected.add(index); else selected.delete(index);
      lastSelected = index;
      syncSelectionChecks(); updateAdminBar();
    });
    wrap.querySelector("button").addEventListener("click", event => {
      event.stopPropagation();
      selected = new Set([index]); lastSelected = index; syncSelectionChecks(); updateAdminBar();
      openEditor({ type: "messages", indices: [index] });
    });
    head.prepend(wrap);
  }

  function syncSelectionChecks() {
    document.querySelectorAll("#messages .message").forEach(article => {
      const index = Number(article.dataset.index);
      const input = article.querySelector(".annotation-selector input");
      if (input) input.checked = selected.has(index);
    });
  }
  function clearSelection() { selected.clear(); lastSelected = null; syncSelectionChecks(); updateAdminBar(); }
  function applyAllMessages() { document.querySelectorAll("#messages > .message").forEach(applyMessage); }

  function buildDialog() {
    const dialog = document.createElement("dialog");
    dialog.id = "annotationDialog";
    dialog.className = "annotation-dialog";
    dialog.innerHTML = `
      <form method="dialog" class="annotation-form">
        <div class="annotation-dialog-head"><strong>Annotation editor</strong><button value="cancel" class="icon-button">×</button></div>
        <div class="annotation-scope"></div>
        <div class="annotation-grid">
          <label>Content visibility<select name="visibility"><option value="public">Public in viewer</option><option value="hidden">Hidden in public viewer</option></select></label>
          <label>Metadata audience<select name="audience"><option value="public">Public metadata</option><option value="internal">Internal only</option></select></label>
          <label class="conversation-only">Provenance class<select name="provenance_class"><option value="normal">Normal</option><option value="supporting">Supporting provenance</option><option value="core">Core provenance evidence</option></select></label>
          <label>Priority<input name="priority" type="number" min="0" max="100" value="0"></label>
          <label>Search weight<input name="search_weight" type="number" min="-100" max="100" value="0"></label>
          <label class="message-only checkbox-row"><input name="default_anchor" type="checkbox"> Make first selected message the default opening anchor</label>
        </div>
        <label>Label<input name="label" type="text" placeholder="Short public/editorial label"></label>
        <fieldset><legend>Quick tags</legend><div class="quick-tags">${QUICK_TAGS.map(tag => `<label><input type="checkbox" value="${tag}" data-tag> ${niceTag(tag)}</label>`).join("")}</div></fieldset>
        <label>Additional tags<input name="tags" type="text" placeholder="QCD, electrogravity, early-formulation"></label>
        <label>Timeline links<textarea name="timeline_links" rows="3" placeholder="Label | path/to/timeline-document.md\nAnother label | https://…"></textarea></label>
        <label>Internal notes<textarea name="notes" rows="4" placeholder="Editorial/provenance notes; never published"></textarea></label>
        <div class="annotation-dialog-actions"><button type="button" data-delete>Delete exact annotation</button><span class="spacer"></span><button value="cancel">Cancel</button><button type="button" class="primary" data-save>Save</button></div>
      </form>`;
    document.body.appendChild(dialog);
    dialog.querySelector("[data-save]").addEventListener("click", saveDialog);
    dialog.querySelector("[data-delete]").addEventListener("click", deleteDialogAnnotation);
  }

  function contiguousGroups(indices) {
    const values = [...new Set(indices)].sort((a,b)=>a-b);
    const groups = [];
    for (const value of values) {
      const last = groups.at(-1);
      if (!last || value !== last.at(-1) + 1) groups.push([value]); else last.push(value);
    }
    return groups;
  }

  function parseLinks(text) {
    return String(text || "").split(/\n+/).map(line => line.trim()).filter(Boolean).map(line => {
      const [label, ...rest] = line.split("|");
      const target = rest.join("|").trim();
      return target ? { label: label.trim(), target } : { label: line, target: line };
    });
  }
  function linksText(links) { return (links || []).map(x => `${x.label || x.target} | ${x.target}`).join("\n"); }

  function openEditor(scope) {
    if (!ADMIN || !currentConversationId) return;
    ensureChrome(); dialogScope = scope;
    const dialog = document.getElementById("annotationDialog");
    const form = dialog.querySelector(".annotation-form");
    const item = entry(currentConversationId) || {};
    const isConversation = scope.type === "conversation";
    form.querySelectorAll(".conversation-only").forEach(x => x.hidden = !isConversation);
    form.querySelectorAll(".message-only").forEach(x => x.hidden = isConversation);
    dialog.querySelector(".annotation-scope").textContent = isConversation ? `Conversation: ${currentConversationId}` : `${scope.indices.length} message${scope.indices.length === 1 ? "" : "s"}: ${scope.indices.map(i => `#${i+1}`).join(", ")}`;

    let source = item;
    if (!isConversation) {
      const groups = contiguousGroups(scope.indices);
      const exact = groups.length === 1 ? ranges(currentConversationId).find(r => Number(r.start) === groups[0][0] + 1 && Number(r.end) === groups[0].at(-1) + 1) : null;
      source = exact || {};
      form.elements.default_anchor.checked = Number(item.provenance?.default_anchor || 0) === scope.indices[0] + 1;
    }
    form.elements.visibility.value = source.visibility || "public";
    form.elements.audience.value = source.audience || "public";
    form.elements.priority.value = isConversation ? Number(item.provenance?.priority || 0) : Number(source.priority || 0);
    form.elements.search_weight.value = Number(source.search_weight || 0);
    form.elements.label.value = source.label || "";
    form.elements.notes.value = source.notes || "";
    form.elements.timeline_links.value = linksText(source.timeline_links);
    form.elements.tags.value = (source.tags || []).filter(tag => !QUICK_TAGS.includes(tag)).join(", ");
    if (isConversation) form.elements.provenance_class.value = item.provenance?.class || "normal";
    form.querySelectorAll("[data-tag]").forEach(input => { input.checked = (source.tags || []).includes(input.value); });
    dialog.showModal();
  }

  function readDialogFields() {
    const form = document.querySelector("#annotationDialog .annotation-form");
    const quick = [...form.querySelectorAll("[data-tag]:checked")].map(x => x.value);
    const extra = form.elements.tags.value.split(",").map(x => x.trim()).filter(Boolean);
    return {
      visibility: form.elements.visibility.value,
      audience: form.elements.audience.value,
      priority: Math.max(0, Math.min(100, Number(form.elements.priority.value) || 0)),
      search_weight: Math.max(-100, Math.min(100, Number(form.elements.search_weight.value) || 0)),
      label: form.elements.label.value.trim(),
      tags: [...new Set([...quick, ...extra])],
      timeline_links: parseLinks(form.elements.timeline_links.value),
      notes: form.elements.notes.value.trim(),
      provenance_class: form.elements.provenance_class?.value || "normal",
      default_anchor: Boolean(form.elements.default_anchor?.checked),
    };
  }

  async function saveDialog() {
    if (!dialogScope || !currentConversationId) return;
    const fields = readDialogFields();
    data.conversations ||= {};
    const item = data.conversations[currentConversationId] ||= { visibility: "public", audience: "public", provenance: { class: "normal", priority: 0 }, search_weight: 0, tags: [], ranges: [] };
    if (dialogScope.type === "conversation") {
      Object.assign(item, { visibility: fields.visibility, audience: fields.audience, search_weight: fields.search_weight, label: fields.label, tags: fields.tags, timeline_links: fields.timeline_links, notes: fields.notes });
      item.provenance ||= {};
      item.provenance.class = fields.provenance_class;
      item.provenance.priority = fields.priority;
    } else {
      item.ranges ||= [];
      for (const group of contiguousGroups(dialogScope.indices)) {
        const start = group[0] + 1, end = group.at(-1) + 1;
        const existing = item.ranges.find(r => Number(r.start) === start && Number(r.end) === end);
        const payload = { start, end, visibility: fields.visibility, audience: fields.audience, priority: fields.priority, search_weight: fields.search_weight, label: fields.label, tags: fields.tags, timeline_links: fields.timeline_links, notes: fields.notes };
        if (existing) Object.assign(existing, payload); else item.ranges.push(payload);
      }
      if (fields.default_anchor) {
        item.provenance ||= { class: "normal", priority: 0 };
        item.provenance.default_anchor = Math.min(...dialogScope.indices) + 1;
      }
    }
    await persist();
    document.getElementById("annotationDialog").close();
    renderProvenanceBar(); applyAllMessages();
  }

  async function deleteDialogAnnotation() {
    if (!dialogScope || !currentConversationId) return;
    const item = entry(currentConversationId);
    if (!item) return;
    if (dialogScope.type === "conversation") {
      delete data.conversations[currentConversationId];
    } else {
      const exacts = contiguousGroups(dialogScope.indices).map(g => [g[0] + 1, g.at(-1) + 1]);
      item.ranges = ranges(currentConversationId).filter(r => !exacts.some(([s,e]) => Number(r.start) === s && Number(r.end) === e));
      if (Number(item.provenance?.default_anchor || 0) && dialogScope.indices.includes(Number(item.provenance.default_anchor) - 1)) delete item.provenance.default_anchor;
    }
    await persist();
    document.getElementById("annotationDialog").close();
    renderProvenanceBar(); applyAllMessages();
  }

  function status(text, error = false) {
    const node = document.querySelector(".annotation-save-status");
    if (node) { node.textContent = text; node.classList.toggle("error", error); }
  }

  async function persist() {
    if (!ADMIN) return;
    status("Saving…");
    try {
      const response = await fetch("/__viewer_admin/annotations", {
        method: "POST", headers: { "Content-Type": "application/json", "X-Viewer-Admin-Token": ADMIN_TOKEN }, body: JSON.stringify(data, null, 2)
      });
      if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
      status("Saved privately");
    } catch (error) {
      status("Save failed", true); console.error(error);
    }
  }

  async function publishProjection() {
    status("Publishing…");
    try {
      const response = await fetch("/__viewer_admin/publish", { method: "POST", headers: { "X-Viewer-Admin-Token": ADMIN_TOKEN } });
      if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
      const result = await response.json();
      status(`Public projection written (${result.conversations || 0} conversation records)`);
    } catch (error) { status("Publish failed", true); console.error(error); }
  }

  function exportAnnotations() {
    const blob = new Blob([JSON.stringify(data, null, 2) + "\n"], { type: "application/json" });
    const a = document.createElement("a"); a.href = URL.createObjectURL(blob); a.download = "HsH-conversation-annotations.private.json"; a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 1000);
  }

  document.addEventListener("viewer:conversation-loaded", event => {
    currentConversationId = event.detail?.conversation?.id || null;
    selected.clear(); lastSelected = null; showFullConversation = false;
    renderProvenanceBar(); updateAdminBar(); applyAllMessages();
  });

  document.addEventListener("viewer:active-message", event => {
    const index = Number(event.detail?.index);
    if (!Number.isFinite(index)) return;
    const article = document.getElementById(`m${index + 1}`);
    if (article?.classList.contains("provenance-collapsed") && params.has("m")) article.classList.add("annotation-open");
  });

  const messages = document.getElementById("messages");
  if (messages) new MutationObserver(mutations => {
    for (const mutation of mutations) for (const node of mutation.addedNodes) if (node instanceof HTMLElement && node.classList.contains("message")) applyMessage(node);
  }).observe(messages, { childList: true });

  ready.then(() => { ensureChrome(); renderProvenanceBar(); applyAllMessages(); updateAdminBar(); });
})();
