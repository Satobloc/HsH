(() => {
  "use strict";

  const rawByBody = new WeakMap();
  const timers = new WeakMap();
  const GENERIC = new Set(["user", "assistant", "system", "developer", "tool", "unknown", "chatgpt", "openai"]);

  function escapeHtml(value) {
    return String(value ?? "").replace(/[&<>"']/g, c => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[c]);
  }

  function displayName(rawSpeaker) {
    const raw = String(rawSpeaker || "unknown").trim();
    const key = raw.toLowerCase();
    if (key === "user") return "Nathan";
    if (key === "assistant") return "ChatGPT";
    if (key === "tool") return "Function / tool";
    if (key === "developer") return "Developer";
    if (key === "system") return "System";
    return raw;
  }

  function kindFor(article, rawText) {
    const raw = String(article.dataset.speaker || "unknown").toLowerCase();
    const role = String(article.dataset.role || raw || "unknown").toLowerCase();
    const meta = article.querySelector(".message-meta")?.textContent?.toLowerCase() || "";
    if (role === "user") {
      const looksLikePaste = rawText.length > 2400 || /<<file\s+name=|<file\b|```[\s\S]*```/i.test(rawText);
      return looksLikePaste ? "user-paste" : "user";
    }
    if (["tool", "developer", "system"].includes(role)) return role;
    if (role === "assistant") {
      if (/tool|function|execution|computer|code/.test(meta)) return "function";
      return "assistant";
    }
    if (role === "companion") return "other-assistant";
    return GENERIC.has(raw) ? "internal" : "other-assistant";
  }

  function inlineFormat(raw) {
    const held = [];
    let text = String(raw ?? "");
    const hold = html => `\u0000H${held.push(html) - 1}\u0000`;

    text = text.replace(/`([^`\n]+)`/g, (_, code) => hold(`<code>${escapeHtml(code)}</code>`));
    text = text.replace(/\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g, (_, label, url) =>
      hold(`<a href="${escapeHtml(url)}" target="_blank" rel="noopener">${escapeHtml(label)}</a>`));
    text = escapeHtml(text);
    text = text.replace(/\*\*([^*\n]+)\*\*/g, "<strong>$1</strong>");
    text = text.replace(/__([^_\n]+)__/g, "<strong>$1</strong>");
    text = text.replace(/~~([^~\n]+)~~/g, "<del>$1</del>");
    text = text.replace(/(^|[\s(])\*([^*\n]+)\*(?=$|[\s).,!?:;])/g, "$1<em>$2</em>");
    text = text.replace(/(^|[\s(])_([^_\n]+)_(?=$|[\s).,!?:;])/g, "$1<em>$2</em>");
    text = text.replace(/\u0000H(\d+)\u0000/g, (_, i) => held[Number(i)] || "");
    return text;
  }

  function renderMarkdown(rawText) {
    let text = String(rawText ?? "").replace(/\r\n?/g, "\n");
    const blocks = [];
    text = text.replace(/```([^\n`]*)\n?([\s\S]*?)```/g, (_, language, code) => {
      const idx = blocks.push({ language: language.trim(), code }) - 1;
      return `\n\u0000BLOCK${idx}\u0000\n`;
    });

    const lines = text.split("\n");
    const out = [];
    let list = null;
    const closeList = () => {
      if (list) out.push(`</${list}>`);
      list = null;
    };

    for (const line of lines) {
      const block = line.match(/^\u0000BLOCK(\d+)\u0000$/);
      if (block) {
        closeList();
        const item = blocks[Number(block[1])];
        const language = item.language ? `<span class="code-language">${escapeHtml(item.language)}</span>` : "";
        out.push(`<div class="code-block">${language}<pre><code>${escapeHtml(item.code.replace(/\n$/, ""))}</code></pre></div>`);
        continue;
      }
      if (!line.trim()) {
        closeList();
        out.push('<div class="md-gap"></div>');
        continue;
      }
      const heading = line.match(/^(#{1,6})\s+(.+)$/);
      if (heading) {
        closeList();
        const level = Math.min(6, heading[1].length + 1);
        out.push(`<h${level} class="md-heading">${inlineFormat(heading[2])}</h${level}>`);
        continue;
      }
      if (/^\s*([-*_])(?:\s*\1){2,}\s*$/.test(line)) {
        closeList(); out.push("<hr>"); continue;
      }
      const quote = line.match(/^\s*>\s?(.*)$/);
      if (quote) {
        closeList(); out.push(`<blockquote>${inlineFormat(quote[1])}</blockquote>`); continue;
      }
      const unordered = line.match(/^\s*[-+*]\s+(.+)$/);
      if (unordered) {
        if (list !== "ul") { closeList(); list = "ul"; out.push("<ul>"); }
        out.push(`<li>${inlineFormat(unordered[1])}</li>`); continue;
      }
      const ordered = line.match(/^\s*\d+[.)]\s+(.+)$/);
      if (ordered) {
        if (list !== "ol") { closeList(); list = "ol"; out.push("<ol>"); }
        out.push(`<li>${inlineFormat(ordered[1])}</li>`); continue;
      }
      closeList();
      out.push(`<p>${inlineFormat(line)}</p>`);
    }
    closeList();
    return out.join("");
  }

  function highlightTextNodes(root, query) {
    const q = String(query || "").trim();
    if (!q) return;
    const needle = q.toLocaleLowerCase();
    const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT);
    const nodes = [];
    while (walker.nextNode()) {
      const parent = walker.currentNode.parentElement;
      if (parent && !["CODE", "PRE", "SCRIPT", "STYLE"].includes(parent.tagName)) nodes.push(walker.currentNode);
    }
    for (const node of nodes) {
      const text = node.nodeValue || "";
      const lower = text.toLocaleLowerCase();
      if (!lower.includes(needle)) continue;
      const frag = document.createDocumentFragment();
      let from = 0;
      while (true) {
        const at = lower.indexOf(needle, from);
        if (at < 0) break;
        frag.append(document.createTextNode(text.slice(from, at)));
        const mark = document.createElement("mark");
        mark.textContent = text.slice(at, at + q.length);
        frag.append(mark);
        from = at + q.length;
      }
      frag.append(document.createTextNode(text.slice(from)));
      node.replaceWith(frag);
    }
  }

  function renderBody(body, rawText, query = "") {
    if (!body || body.dataset.view === "raw") return;
    body.innerHTML = renderMarkdown(rawText);
    if (query) highlightTextNodes(body, query);
    body.dataset.presented = "true";
  }

  function addCollapseToggle(article, body, rawText, kind) {
    if (article.querySelector(".expand-toggle")) return;
    const toolish = ["tool", "function", "internal", "developer", "system"].includes(kind);
    const threshold = toolish ? 900 : 6500;
    if (rawText.length <= threshold) return;
    article.classList.add("collapsible");
    if (toolish) article.classList.add("compact-output");
    const meta = article.querySelector(".message-meta");
    if (!meta) return;
    const button = document.createElement("button");
    button.type = "button"; button.className = "expand-toggle"; button.textContent = toolish ? "Show output" : "Expand";
    button.addEventListener("click", event => {
      event.stopPropagation();
      const expanded = article.classList.toggle("expanded");
      button.textContent = expanded ? "Collapse" : (toolish ? "Show output" : "Expand");
    });
    meta.prepend(button);
  }

  function addRawToggle(article, body, rawText) {
    if (article.querySelector(".raw-toggle")) return;
    const head = article.querySelector(".message-head");
    const meta = article.querySelector(".message-meta");
    if (!head || !meta) return;
    const button = document.createElement("button");
    button.type = "button";
    button.className = "raw-toggle";
    button.textContent = "Raw";
    button.title = "Toggle between formatted and source text for this message";
    button.addEventListener("click", event => {
      event.stopPropagation();
      const raw = body.dataset.view !== "raw";
      body.dataset.view = raw ? "raw" : "rendered";
      button.textContent = raw ? "Rendered" : "Raw";
      if (raw) body.textContent = rawText;
      else renderBody(body, rawText, document.getElementById("threadSearch")?.value || "");
    });
    meta.prepend(button);
  }

  function enhanceMessage(article) {
    if (!(article instanceof HTMLElement) || !article.classList.contains("message")) return;
    const body = article.querySelector(".message-body");
    const speaker = article.querySelector(".message-speaker");
    if (!body || !speaker) return;

    let rawText = rawByBody.get(body);
    if (rawText == null) {
      rawText = body.textContent || "";
      rawByBody.set(body, rawText);
    }
    const rawSpeaker = article.dataset.speaker || speaker.textContent || "unknown";
    speaker.textContent = displayName(rawSpeaker);

    article.classList.remove("kind-user", "kind-user-paste", "kind-assistant", "kind-other-assistant", "kind-tool", "kind-function", "kind-system", "kind-developer", "kind-internal");
    const kind = kindFor(article, rawText); article.classList.add(`kind-${kind}`);
    addRawToggle(article, body, rawText); addCollapseToggle(article, body, rawText, kind);

    if (!article.classList.contains("search-hit") && !article.classList.contains("typing") && body.dataset.view !== "raw") {
      renderBody(body, rawText);
    }
  }

  function enhanceSpeakerChips() {
    document.querySelectorAll(".speaker-chip").forEach(chip => {
      const raw = chip.dataset.speaker || chip.textContent || "unknown";
      chip.textContent = displayName(raw);
      const key = raw.toLowerCase();
      let color = "var(--other-assistant)";
      if (["user", "nathan"].includes(key)) color = "var(--user)";
      else if (["assistant", "chatgpt"].includes(key)) color = "var(--assistant)";
      else if (["tool", "developer", "system"].includes(key)) color = "var(--tool)";
      chip.style.setProperty("--chip", color);
    });
  }

  function enhanceAll() {
    document.querySelectorAll("#messages > .message").forEach(enhanceMessage);
    enhanceSpeakerChips();
  }

  const messages = document.getElementById("messages");
  if (messages) {
    new MutationObserver(mutations => {
      for (const mutation of mutations) {
        for (const node of mutation.addedNodes) {
          if (node instanceof HTMLElement && node.classList.contains("message")) enhanceMessage(node);
        }
      }
      enhanceSpeakerChips();
    }).observe(messages, { childList: true });
  }

  const list = document.getElementById("conversationList");
  if (list) new MutationObserver(enhanceSpeakerChips).observe(list, { childList: true, subtree: true });

  const search = document.getElementById("threadSearch");
  search?.addEventListener("input", () => {
    if (!search.value.trim()) setTimeout(enhanceAll, 0);
  });

  document.getElementById("replayToggle")?.addEventListener("click", () => setTimeout(enhanceAll, 120));

  // Typealong temporarily replaces rendered HTML with text. Re-render only after the full source text has returned.
  setInterval(() => {
    document.querySelectorAll("#messages > .message").forEach(article => {
      const body = article.querySelector(".message-body");
      if (!body || body.dataset.view === "raw" || article.classList.contains("search-hit") || article.classList.contains("typing")) return;
      const raw = rawByBody.get(body);
      if (raw != null && body.textContent === raw && !body.querySelector("p, pre, ul, ol, blockquote, .md-heading")) renderBody(body, raw);
    });
  }, 450);

  enhanceAll();
})();
