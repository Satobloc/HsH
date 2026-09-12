from pathlib import Path

viewer = Path('CONVERSATION_VIEWER/viewer.js')
presentation = Path('CONVERSATION_VIEWER/presentation.js')
viewer_css = Path('CONVERSATION_VIEWER/viewer.css')
presentation_css = Path('CONVERSATION_VIEWER/presentation.css')
index = Path('CONVERSATION_VIEWER/index.html')

v = viewer.read_text(encoding='utf-8')
p = presentation.read_text(encoding='utf-8')
vc = viewer_css.read_text(encoding='utf-8')
pc = presentation_css.read_text(encoding='utf-8')
i = index.read_text(encoding='utf-8')

def replace_once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected one match, found {count}')
    return text.replace(old, new, 1)

# Header clock/date hook.
i = replace_once(
    i,
    '          <span id="replayStatus" class="status-text">Paused</span>\n',
    '          <span id="replayStatus" class="status-text">Paused</span>\n          <span id="messageDateTime" class="message-datetime" title="Current message date and time">📅 —</span>\n',
    'message datetime element',
)

# Viewer id and date helpers.
v = replace_once(
    v,
    '    "positionLabel", "previousMessage", "nextMessage", "replayToggle", "replayMode", "replaySpeed", "replayStatus",\n',
    '    "positionLabel", "previousMessage", "nextMessage", "replayToggle", "replayMode", "replaySpeed", "replayStatus", "messageDateTime",\n',
    'datetime id',
)
v = replace_once(
    v,
    '  function esc(s) {\n',
    '  function formatDay(value) {\n    if (!value) return "Date unknown";\n    const d = new Date(value);\n    return Number.isNaN(d.getTime()) ? String(value) : d.toLocaleDateString([], { year:"numeric", month:"short", day:"numeric" });\n  }\n\n  function esc(s) {\n',
    'formatDay helper',
)

# Catalog date prominence + year.
v = replace_once(
    v,
    '        <div class="title">${esc(c.title)}</div>\n        <div class="meta"><span class="badge ${c.corpus === "live" ? "live" : ""}">${esc(c.corpus)}</span>\n        <span>${Number(c.message_count).toLocaleString()} msgs</span><span>${esc(formatDate(c.start_local).replace(/,.*$/, ""))}</span></div>',
    '        <div class="card-date">${esc(formatDay(c.start_local))}</div>\n        <div class="title">${esc(c.title)}</div>\n        <div class="meta"><span class="badge ${c.corpus === "live" ? "live" : ""}">${esc(c.corpus)}</span>\n        <span>${Number(c.message_count).toLocaleString()} msgs</span></div>',
    'catalog date markup',
)

# Focus dimming helper and current date readout.
v = replace_once(
    v,
    '  function setActive(index, writeUrl = true) {\n',
    '  function updateFocusClasses(index) {\n    el.messages.querySelectorAll(".message").forEach(node => {\n      const n = Number(node.dataset.index);\n      node.classList.toggle("after-focus", Number.isFinite(n) && n > index);\n    });\n  }\n\n  function setActive(index, writeUrl = true) {\n',
    'focus helper',
)
v = replace_once(
    v,
    '    const node = document.getElementById(`m${index + 1}`); if (node) node.classList.add("active");\n    if (writeUrl) updateUrl(index, true);',
    '    const node = document.getElementById(`m${index + 1}`); if (node) node.classList.add("active");\n    updateFocusClasses(index);\n    const currentTime = state.messages[index]?.createTime;\n    if (el.messageDateTime) el.messageDateTime.textContent = currentTime ? `📅 ${new Date(currentTime * 1000).toLocaleString([], { year:"numeric", month:"short", day:"numeric", hour:"numeric", minute:"2-digit" })}` : "📅 time unavailable";\n    if (writeUrl) updateUrl(index, true);',
    'setActive focus/date',
)
v = replace_once(
    v,
    '    el.messages.appendChild(frag); applySpeakerFilters(); highlightRendered();\n',
    '    el.messages.appendChild(frag); applySpeakerFilters(); highlightRendered(); updateFocusClasses(state.activeIndex);\n',
    'render focus classes',
)

# Replace body-bottom pinning with a real caret anchor.
old_pin = '''  function pinTypingEdge(body) {\n    if (!body || !state.replay.follow) return;\n    const viewport = el.messages.getBoundingClientRect(), edge = body.getBoundingClientRect().bottom;\n    const target = viewport.top + viewport.height * 0.25;\n    const delta = edge - target;\n    if (Math.abs(delta) > 1) el.messages.scrollTop += delta;\n  }\n'''
new_pin = '''  function pinTypingCaret(caret) {\n    if (!caret || !state.replay.follow) return;\n    const viewport = el.messages.getBoundingClientRect(), rect = caret.getBoundingClientRect();\n    const target = viewport.top + 28;\n    const delta = rect.top - target;\n    if (Math.abs(delta) > 1) el.messages.scrollTop += delta;\n  }\n'''
v = replace_once(v, old_pin, new_pin, 'caret pin function')

# Rewrite typealong body mutation around persistent text node + caret.
old_block = '''    state.replay.currentIndex = index; state.replay.shown = 0;\n    state.replay.forceComplete = false; state.replay.forceAdvance = false; state.replay.follow = true;\n    node.classList.add("typing"); body.textContent = ""; pinTypingEdge(body);\n    while (shown < text.length && state.replay.running && token === state.replay.token) {\n      if (state.replay.forceComplete) { shown = text.length; body.textContent = text; state.replay.shown = shown; break; }\n      shown = Math.min(text.length, shown + Math.max(1, Math.round(charsPerSecond / 20)));\n      state.replay.shown = shown; body.textContent = text.slice(0, shown); pinTypingEdge(body);\n      if (!await wait(50, token)) { node.classList.remove("typing"); return false; }\n    }\n    body.textContent = text; state.replay.shown = text.length; state.replay.forceComplete = false; node.classList.remove("typing");\n'''
new_block = '''    state.replay.currentIndex = index; state.replay.shown = 0;\n    state.replay.forceComplete = false; state.replay.forceAdvance = false; state.replay.follow = true;\n    node.classList.add("typing");\n    const textNode = document.createTextNode("");\n    const caret = document.createElement("span"); caret.className = "typing-caret"; caret.setAttribute("aria-hidden", "true");\n    body.replaceChildren(textNode, caret); pinTypingCaret(caret);\n    while (shown < text.length && state.replay.running && token === state.replay.token) {\n      if (state.replay.forceComplete) { shown = text.length; textNode.nodeValue = text; state.replay.shown = shown; pinTypingCaret(caret); break; }\n      shown = Math.min(text.length, shown + Math.max(1, Math.round(charsPerSecond / 20)));\n      state.replay.shown = shown; textNode.nodeValue = text.slice(0, shown); pinTypingCaret(caret);\n      if (!await wait(50, token)) { node.classList.remove("typing"); caret.remove(); return false; }\n    }\n    body.textContent = text; state.replay.shown = text.length; state.replay.forceComplete = false; node.classList.remove("typing");\n'''
v = replace_once(v, old_block, new_block, 'typealong caret block')

# Plumbing-like assistant detection.
p = replace_once(
    p,
    '  function kindFor(article, rawText) {\n',
    '''  function plumbingLike(rawText) {\n    const text = String(rawText || "");\n    const lines = text.split(/\\n/);\n    const urlCount = (text.match(/https?:\\/\\//g) || []).length;\n    const pathCount = (text.match(/(?:^|\\s)(?:\\.?\\.?\\/|[A-Za-z]:\\\\|[\\w.-]+\\/[\\w./ -]+)/gm) || []).length;\n    const markers = /Resource uri:|Citation Marker:|filecite|filenavlist|search result|tool result|function call|files\\.(?:search|find|read)|api_tool|github\\.|raw source|content_sha|workflow run|\\"result\\"\\s*:/i.test(text);\n    const structured = /^\\s*[\\[{]/.test(text) && /[}\]]\\s*$/.test(text);\n    return markers || urlCount >= 3 || pathCount >= 5 || (structured && lines.length >= 5);\n  }\n\n  function kindFor(article, rawText) {\n''',
    'plumbing detector',
)
p = replace_once(
    p,
    '    if (role === "assistant") {\n      if (/tool|function|execution|computer|code/.test(meta)) return "function";\n      return "assistant";\n    }',
    '    if (role === "assistant") {\n      if (/tool|function|execution|computer|code/.test(meta) || plumbingLike(rawText)) return "function";\n      return "assistant";\n    }',
    'assistant plumbing classification',
)
# Any unknown/internal plumbing should be function too.
p = replace_once(
    p,
    '    if (role === "companion") return "other-assistant";\n    return GENERIC.has(raw) ? "internal" : "other-assistant";',
    '    if (role === "companion") return "other-assistant";\n    if (plumbingLike(rawText)) return "function";\n    return GENERIC.has(raw) ? "internal" : "other-assistant";',
    'generic plumbing classification',
)

# CSS sidebar, dates, focus dimming, caret.
vc += '''\n\n/* Sidebar scrolling and temporal emphasis. */\n.sidebar { min-height: 0; overflow: hidden; }\n.conversation-list { flex: 1 1 auto; min-height: 0; overflow-y: auto; overscroll-behavior: contain; scrollbar-gutter: stable; }\n.conversation-card .card-date { color: var(--text); font-size: .82rem; font-weight: 700; letter-spacing: .01em; margin-bottom: 4px; }\n.message.after-focus { opacity: .34; filter: grayscale(.68); transition: opacity .16s ease, filter .16s ease; }\n.message.after-focus:hover { opacity: .68; filter: grayscale(.35); }\n.message.active { opacity: 1; filter: none; }\n.message-datetime { margin-left: auto; color: var(--text); font-size: .78rem; font-weight: 650; padding: 4px 7px; border: 1px solid var(--line); border-radius: 8px; background: color-mix(in srgb, var(--panel-2), transparent 12%); }\n.messages.typealong-active { padding-bottom: 96vh; scroll-behavior: auto; }\n.message.typing .message-body { white-space: pre-wrap; }\n.typing-caret { display: inline-block; width: .11em; min-width: 2px; height: 1.18em; margin-left: .08em; vertical-align: -.18em; background: currentColor; animation: viewer-caret-blink .82s steps(1,end) infinite; }\n@keyframes viewer-caret-blink { 0%, 48% { opacity: 1; } 49%, 100% { opacity: 0; } }\n'''

# Gray plumbing even more strongly.
pc += '''\n.message.kind-tool, .message.kind-function, .message.kind-system, .message.kind-developer, .message.kind-internal { color: #a0a3a8; }\n.message.kind-tool .message-body, .message.kind-function .message-body, .message.kind-system .message-body, .message.kind-developer .message-body, .message.kind-internal .message-body { color: #8e9298; }\n'''

viewer.write_text(v, encoding='utf-8')
presentation.write_text(p, encoding='utf-8')
viewer_css.write_text(vc, encoding='utf-8')
presentation_css.write_text(pc, encoding='utf-8')
index.write_text(i, encoding='utf-8')
print('Patched caret focus, plumbing compaction, sidebar scrolling, and dates.')
