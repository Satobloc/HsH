(() => {
  "use strict";

  let hits = [];
  let cursor = -1;

  const $ = id => document.getElementById(id);

  function esc(value) {
    return String(value ?? "").replace(/[&<>"']/g, c => ({ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;" })[c]);
  }

  function modeLabel(mode) {
    return ({
      all: "all messages",
      user: "Nathan / me",
      chatgpt: "ChatGPT",
      "assistant-any": "any assistant",
      companion: "other assistant / companion",
      internal: "tool / system / developer",
      other: "other / unknown"
    })[mode] || mode;
  }

  function roleMatches(role, mode) {
    role = String(role || "unknown").toLowerCase();
    if (mode === "all") return true;
    if (mode === "user") return role === "user";
    if (mode === "chatgpt") return role === "assistant";
    if (mode === "assistant-any") return role === "assistant" || role === "companion";
    if (mode === "companion") return role === "companion";
    if (mode === "internal") return ["tool", "system", "developer", "function", "internal"].includes(role);
    if (mode === "other") return !["user", "assistant", "companion", "tool", "system", "developer", "function", "internal"].includes(role);
    return true;
  }

  function selectedMode() {
    return $("messageProvenance")?.value || "all";
  }

  function forceRenderAll() {
    const timeline = $("timeline");
    if (!timeline || timeline.value === timeline.max) return;
    const previous = timeline.value;
    timeline.value = timeline.max;
    timeline.dispatchEvent(new Event("change", { bubbles: true }));
    timeline.value = previous;
    timeline.dispatchEvent(new Event("change", { bubbles: true }));
  }

  function clearNativeMarks() {
    document.querySelectorAll("#messages mark").forEach(mark => mark.replaceWith(document.createTextNode(mark.textContent || "")));
    document.querySelectorAll("#messages .message-body").forEach(body => body.normalize());
    document.querySelectorAll("#messages .message").forEach(article => article.classList.remove("search-hit", "provenance-search-hit"));
  }

  function snippet(text, query, radius = 90) {
    const clean = String(text || "").replace(/\s+/g, " ").trim();
    if (!query) return clean.length > 190 ? `${clean.slice(0, 190)}…` : clean;
    const lower = clean.toLowerCase();
    const at = lower.indexOf(query.toLowerCase());
    if (at < 0) return clean.length > 190 ? `${clean.slice(0, 190)}…` : clean;
    const start = Math.max(0, at - radius), end = Math.min(clean.length, at + query.length + radius);
    return `${start ? "…" : ""}${clean.slice(start, end)}${end < clean.length ? "…" : ""}`;
  }

  function renderMarks() {
    const marks = $("timelineMarks"), timeline = $("timeline");
    if (!marks || !timeline || !hits.length) {
      if (marks) marks.innerHTML = "";
      return;
    }
    const denom = Math.max(1, Number(timeline.max) || 1);
    marks.innerHTML = hits.slice(0, 500).map(i => `<span class="timeline-mark provenance-timeline-mark" style="left:${(i / denom) * 100}%"></span>`).join("");
  }

  function renderResults(query, mode) {
    const results = $("searchResults"), status = $("searchStatus"), drawer = $("searchDrawer");
    if (!results || !status || !drawer) return;
    status.textContent = `${hits.length} hit${hits.length === 1 ? "" : "s"} · ${modeLabel(mode)}`;
    results.innerHTML = hits.slice(0, 400).map((index, pos) => {
      const article = $(`m${index + 1}`);
      const speaker = article?.querySelector(".message-speaker")?.textContent || article?.dataset.speaker || article?.dataset.role || "unknown";
      const role = article?.dataset.role || "unknown";
      const text = article?.querySelector(".message-body")?.textContent || "";
      return `<div class="search-result ${pos === cursor ? "current" : ""}" data-provenance-pos="${pos}"><div class="result-meta">#${index + 1} · ${esc(speaker)} · ${esc(role)}</div><div class="snippet">${esc(snippet(text, query))}</div></div>`;
    }).join("") || `<div class="status-text">No matches for ${esc(modeLabel(mode))}.</div>`;
    results.querySelectorAll("[data-provenance-pos]").forEach(node => node.addEventListener("click", () => {
      cursor = Number(node.dataset.provenancePos);
      jumpToCursor();
    }));
    drawer.classList.add("open");
  }

  function runSearch() {
    const mode = selectedMode();
    if (mode === "all") return;
    forceRenderAll();
    clearNativeMarks();
    const query = ($("threadSearch")?.value || "").trim().toLowerCase();
    hits = [];
    document.querySelectorAll("#messages > .message").forEach(article => {
      const index = Number(article.dataset.index);
      if (!Number.isFinite(index) || article.classList.contains("annotation-hidden")) return;
      const role = article.dataset.role || "unknown";
      const text = article.querySelector(".message-body")?.textContent || "";
      const hit = roleMatches(role, mode) && (!query || text.toLowerCase().includes(query));
      article.classList.toggle("provenance-search-hit", hit);
      if (hit) hits.push(index);
    });
    cursor = hits.length ? 0 : -1;
    renderMarks();
    renderResults(query, mode);
  }

  function jumpToCursor() {
    if (!hits.length || cursor < 0) return;
    cursor = (cursor + hits.length) % hits.length;
    const timeline = $("timeline");
    if (timeline) {
      timeline.value = String(hits[cursor]);
      timeline.dispatchEvent(new Event("change", { bubbles: true }));
    }
    renderResults(($("threadSearch")?.value || "").trim(), selectedMode());
  }

  function cycle(delta) {
    if (!hits.length) return;
    cursor += delta;
    jumpToCursor();
  }

  function installControl() {
    if ($("messageProvenance")) return;
    const row = document.querySelector(".search-row"), search = $("threadSearch");
    if (!row || !search) return;
    const label = document.createElement("label");
    label.className = "provenance-search-control";
    label.innerHTML = `Provenance
      <select id="messageProvenance" title="Constrain message search by message provenance">
        <option value="all">All messages</option>
        <option value="user">Nathan / me</option>
        <option value="chatgpt">ChatGPT</option>
        <option value="assistant-any">Any assistant</option>
        <option value="companion">Other assistant / companion</option>
        <option value="internal">Tool / system / developer</option>
        <option value="other">Other / unknown</option>
      </select>`;
    search.insertAdjacentElement("afterend", label);
    label.querySelector("select").addEventListener("change", () => {
      if (selectedMode() === "all") {
        hits = []; cursor = -1;
        document.querySelectorAll("#messages .message").forEach(article => article.classList.remove("provenance-search-hit"));
        search.dispatchEvent(new Event("input", { bubbles: true }));
      } else runSearch();
    });
  }

  function installInterceptors() {
    const search = $("threadSearch"), prev = $("searchPrev"), next = $("searchNext");
    if (!search || search.dataset.provenanceInterceptor === "1") return;
    search.dataset.provenanceInterceptor = "1";
    search.addEventListener("input", event => {
      if (selectedMode() === "all") return;
      event.stopImmediatePropagation();
      runSearch();
    }, true);
    prev?.addEventListener("click", event => {
      if (selectedMode() === "all") return;
      event.preventDefault(); event.stopImmediatePropagation(); cycle(-1);
    }, true);
    next?.addEventListener("click", event => {
      if (selectedMode() === "all") return;
      event.preventDefault(); event.stopImmediatePropagation(); cycle(1);
    }, true);
  }

  function install() {
    installControl();
    installInterceptors();
  }

  document.addEventListener("viewer:conversation-loaded", () => {
    hits = []; cursor = -1;
    if ($("messageProvenance")) $("messageProvenance").value = "all";
  });

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", install);
  else install();
})();
