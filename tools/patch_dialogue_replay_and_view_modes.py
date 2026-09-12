from pathlib import Path

viewer = Path('CONVERSATION_VIEWER/viewer.js')
presentation = Path('CONVERSATION_VIEWER/presentation.js')
index = Path('CONVERSATION_VIEWER/index.html')
viewer_css = Path('CONVERSATION_VIEWER/viewer.css')

v = viewer.read_text(encoding='utf-8')
p = presentation.read_text(encoding='utf-8')
i = index.read_text(encoding='utf-8')
c = viewer_css.read_text(encoding='utf-8')

def once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected one match, found {count}')
    return text.replace(old, new, 1)

# Header controls.
i = once(i,
'''          <label class="compact-control">Speed
            <select id="replaySpeed">
              <option value="0.5">0.5×</option>
              <option value="1" selected>1×</option>
              <option value="2">2×</option>
              <option value="5">5×</option>
              <option value="10">10×</option>
            </select>
          </label>
          <span id="replayStatus" class="status-text">Paused</span>''',
'''          <label class="compact-control">Speed
            <select id="replaySpeed">
              <option value="0.5">0.5×</option>
              <option value="1" selected>1×</option>
              <option value="2">2×</option>
              <option value="5">5×</option>
              <option value="10">10×</option>
            </select>
          </label>
          <label class="compact-control">View
            <select id="displayDensity">
              <option value="compact" selected>Compact</option>
              <option value="full">Full</option>
            </select>
          </label>
          <label class="compact-control internal-toggle"><input id="showInternals" type="checkbox"> Show internals</label>
          <span id="replayStatus" class="status-text">Paused</span>''',
'view controls')

# Cache bust this deployment.
i = i.replace('viewer.css?v=20260912-0018', 'viewer.css?v=20260912-0045')
i = i.replace('presentation.css?v=20260912-0018', 'presentation.css?v=20260912-0045')
i = i.replace('runtime-fixes.css?v=20260912-0018', 'runtime-fixes.css?v=20260912-0045')
i = i.replace('viewer.js?v=20260912-0018', 'viewer.js?v=20260912-0045')
i = i.replace('landmarks.js?v=20260912-0018', 'landmarks.js?v=20260912-0045')
i = i.replace('presentation.js?v=20260912-0018', 'presentation.js?v=20260912-0045')

# Viewer controls + replay plumbing classifier.
v = once(v,
'    "positionLabel", "previousMessage", "nextMessage", "replayToggle", "replayMode", "replaySpeed", "replayStatus", "messageDateTime",\n',
'    "positionLabel", "previousMessage", "nextMessage", "replayToggle", "replayMode", "replaySpeed", "displayDensity", "showInternals", "replayStatus", "messageDateTime",\n',
'control ids')

marker = '  function parseParams() { return new URLSearchParams(location.search); }\n'
helpers = r'''
  function plumbingLikeMessage(msg) {
    if (!msg) return true;
    const role = String(msg.role || "unknown").toLowerCase();
    if (["tool", "system", "developer", "function", "internal"].includes(role)) return true;
    const text = String(msg.text || "");
    const lines = text.split(/\n/);
    const urlCount = (text.match(/https?:\/\//g) || []).length;
    const pathCount = (text.match(/(?:^|\s)(?:\.?\.?\/|[A-Za-z]:\\|[\w.-]+\/[\w./ -]+)/gm) || []).length;
    const markers = /Resource uri:|Citation Marker:|filecite|filenavlist|search result|tool result|function call|files\.(?:search|find|read)|api_tool|github\.|raw source|content_sha|workflow run|\"result\"\s*:/i.test(text);
    const structured = /^\s*[\[{]/.test(text) && /[}\]]\s*$/.test(text);
    return markers || urlCount >= 3 || pathCount >= 5 || (structured && lines.length >= 5);
  }

  function isDialogueMessage(msg) {
    if (!msg) return false;
    const role = String(msg.role || "unknown").toLowerCase();
    if (!["user", "assistant", "companion"].includes(role)) return false;
    if (role === "assistant" && plumbingLikeMessage(msg)) return false;
    return true;
  }
'''
v = once(v, marker, marker + helpers, 'replay helpers')

# Skip non-dialogue in sequential replay.
v = once(v,
'''    for (let i = state.activeIndex; i < state.messages.length && state.replay.running && token === state.replay.token; i++) {
      setActive(i, true); let ok = true;''',
'''    for (let i = state.activeIndex; i < state.messages.length && state.replay.running && token === state.replay.token; i++) {
      if (!isDialogueMessage(state.messages[i])) continue;
      setActive(i, true); let ok = true;''',
'replay dialogue filter')

# Bind UI preferences.
v = once(v,
'''    el.threadSearch.addEventListener("input", searchThread); el.searchPrev.addEventListener("click", () => cycleSearch(-1)); el.searchNext.addEventListener("click", () => cycleSearch(1));
''',
'''    el.threadSearch.addEventListener("input", searchThread); el.searchPrev.addEventListener("click", () => cycleSearch(-1)); el.searchNext.addEventListener("click", () => cycleSearch(1));
    el.displayDensity?.addEventListener("change", () => document.dispatchEvent(new CustomEvent("viewer:viewmode", { detail: { density: el.displayDensity.value, showInternals: Boolean(el.showInternals?.checked) } })));
    el.showInternals?.addEventListener("change", () => document.dispatchEvent(new CustomEvent("viewer:viewmode", { detail: { density: el.displayDensity?.value || "compact", showInternals: Boolean(el.showInternals.checked) } })));
''',
'preference events')

# Presentation applies classes and preserves per-message Expand controls.
p = once(p,
'  const GENERIC = new Set(["user", "assistant", "system", "developer", "tool", "unknown", "chatgpt", "openai"]);\n',
'''  const GENERIC = new Set(["user", "assistant", "system", "developer", "tool", "unknown", "chatgpt", "openai"]);

  function applyViewMode(density = "compact", showInternals = false) {
    document.body.classList.toggle("viewer-full", density === "full");
    document.body.classList.toggle("viewer-compact", density !== "full");
    document.body.classList.toggle("viewer-show-internals", Boolean(showInternals));
    document.body.classList.toggle("viewer-hide-internals", !showInternals);
  }
''',
'view mode helper')

# Initialize and listen for controls.
p = once(p,
'''  document.getElementById("replayToggle")?.addEventListener("click", () => setTimeout(enhanceAll, 120));
''',
'''  document.getElementById("replayToggle")?.addEventListener("click", () => setTimeout(enhanceAll, 120));
  document.addEventListener("viewer:viewmode", event => {
    const detail = event.detail || {};
    applyViewMode(detail.density || "compact", Boolean(detail.showInternals));
  });
  applyViewMode(document.getElementById("displayDensity")?.value || "compact", Boolean(document.getElementById("showInternals")?.checked));
''',
'view mode listener')

# CSS behavior.
c += r'''

/* Dialogue-first reading modes. Internals remain in source order and can be restored globally. */
.viewer-hide-internals .message.kind-tool,
.viewer-hide-internals .message.kind-function,
.viewer-hide-internals .message.kind-system,
.viewer-hide-internals .message.kind-developer,
.viewer-hide-internals .message.kind-internal { display: none !important; }

.viewer-full .message.collapsible:not(.typing) .message-body,
.viewer-full .message.compact-output.collapsible:not(.typing) .message-body {
  max-height: none !important;
  overflow: visible !important;
  -webkit-mask-image: none !important;
  mask-image: none !important;
}
.viewer-full .expand-toggle { display: none !important; }
.viewer-compact .expand-toggle { display: inline-block; }
.internal-toggle { user-select: none; white-space: nowrap; }
.internal-toggle input { accent-color: var(--accent); }
'''

viewer.write_text(v, encoding='utf-8')
presentation.write_text(p, encoding='utf-8')
index.write_text(i, encoding='utf-8')
viewer_css.write_text(c, encoding='utf-8')
print('Applied dialogue-only replay, hidden internals, and Compact/Full view controls.')
