(() => {
  "use strict";

  const LANDMARKS_URL = "data/landmarks.json";
  const select = document.getElementById("landmarkSelect");
  const timeline = document.getElementById("timeline");
  const timelineMarks = document.getElementById("timelineMarks");
  const messages = document.getElementById("messages");
  const search = document.getElementById("threadSearch");

  let all = [];
  let current = [];
  let currentConversationId = null;
  let painting = false;

  function conversationId() {
    return new URLSearchParams(location.search).get("c");
  }

  function validLandmark(item) {
    return item && typeof item === "object" && Number.isInteger(Number(item.message)) && Number(item.message) > 0 && typeof item.label === "string" && item.label.trim();
  }

  function renderSelect() {
    if (!select) return;
    select.innerHTML = '<option value="">Landmarks</option>' + current.map((item, i) => {
      const kind = item.kind ? ` · ${item.kind}` : "";
      return `<option value="${i}">#${Number(item.message)} — ${escapeHtml(item.label)}${escapeHtml(kind)}</option>`;
    }).join("");
    select.disabled = current.length === 0;
    select.title = current.length ? `${current.length} named landmark${current.length === 1 ? "" : "s"}` : "No named landmarks for this conversation yet";
  }

  function escapeHtml(value) {
    return String(value ?? "").replace(/[&<>"']/g, c => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[c]);
  }

  function paintTimeline() {
    if (!timelineMarks || !timeline || painting || !current.length) return;
    painting = true;
    try {
      timelineMarks.querySelectorAll(".timeline-mark.landmark").forEach(node => node.remove());
      const max = Math.max(1, Number(timeline.max) || 1);
      for (const item of current) {
        const index = Math.max(0, Number(item.message) - 1);
        const mark = document.createElement("span");
        mark.className = "timeline-mark landmark";
        mark.style.left = `${Math.min(100, (index / max) * 100)}%`;
        mark.title = `#${item.message} — ${item.label}`;
        timelineMarks.appendChild(mark);
      }
    } finally {
      painting = false;
    }
  }

  function markRenderedMessages() {
    if (!messages) return;
    messages.querySelectorAll(".message.landmark-hit").forEach(node => {
      node.classList.remove("landmark-hit");
      node.removeAttribute("data-landmark-label");
    });
    for (const item of current) {
      const node = document.getElementById(`m${Number(item.message)}`);
      if (!node) continue;
      node.classList.add("landmark-hit");
      node.dataset.landmarkLabel = item.label;
      const meta = node.querySelector(".message-meta");
      if (meta && !meta.querySelector(".landmark-label")) {
        const badge = document.createElement("span");
        badge.className = "landmark-label";
        badge.textContent = ` · ◆ ${item.label}`;
        badge.style.color = "var(--landmark)";
        meta.appendChild(badge);
      }
    }
  }

  function refreshConversation(force = false) {
    const id = conversationId();
    if (!force && id === currentConversationId) return;
    currentConversationId = id;
    current = all.filter(item => item.conversation_id === id).sort((a, b) => Number(a.message) - Number(b.message));
    renderSelect();
    setTimeout(() => { paintTimeline(); markRenderedMessages(); }, 0);
  }

  if (select) {
    select.addEventListener("change", () => {
      const item = current[Number(select.value)];
      if (!item || !timeline) return;
      const index = Math.max(0, Number(item.message) - 1);
      timeline.value = String(index);
      timeline.dispatchEvent(new Event("input", { bubbles: true }));
      timeline.dispatchEvent(new Event("change", { bubbles: true }));
      const url = new URL(location.href);
      url.searchParams.set("m", String(item.message));
      history.replaceState({}, "", url);
    });
  }

  if (search) search.addEventListener("input", () => setTimeout(paintTimeline, 0));

  const urlObserver = new MutationObserver(() => refreshConversation());
  const title = document.getElementById("conversationTitle");
  if (title) urlObserver.observe(title, { childList: true, characterData: true, subtree: true });

  const timelineObserver = new MutationObserver(() => {
    if (!painting) setTimeout(paintTimeline, 0);
  });
  if (timelineMarks) timelineObserver.observe(timelineMarks, { childList: true });

  const messageObserver = new MutationObserver(() => setTimeout(markRenderedMessages, 0));
  if (messages) messageObserver.observe(messages, { childList: true, subtree: false });

  window.addEventListener("popstate", () => setTimeout(() => refreshConversation(true), 0));

  fetch(LANDMARKS_URL, { cache: "no-cache" })
    .then(res => res.ok ? res.json() : Promise.reject(new Error(`landmarks HTTP ${res.status}`)))
    .then(data => {
      all = Array.isArray(data.landmarks) ? data.landmarks.filter(validLandmark) : [];
      refreshConversation(true);
    })
    .catch(error => {
      console.warn("Landmark layer unavailable:", error);
      all = [];
      refreshConversation(true);
    });
})();
