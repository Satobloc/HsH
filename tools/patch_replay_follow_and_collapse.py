from pathlib import Path

viewer = Path('CONVERSATION_VIEWER/viewer.js')
presentation = Path('CONVERSATION_VIEWER/presentation.js')
css = Path('CONVERSATION_VIEWER/viewer.css')

v = viewer.read_text(encoding='utf-8')
p = presentation.read_text(encoding='utf-8')
c = css.read_text(encoding='utf-8')

def replace_once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected exactly one match, found {count}')
    return text.replace(old, new, 1)

v = replace_once(
    v,
    '    replay: { running: false, token: 0, cruiseFrame: null, mode: null, currentIndex: -1, shown: 0, forceComplete: false, forceAdvance: false },',
    '    replay: { running: false, token: 0, cruiseFrame: null, mode: null, currentIndex: -1, shown: 0, forceComplete: false, forceAdvance: false, follow: true },',
    'replay follow state',
)

v = replace_once(
    v,
    '''  function prepareTypealongReplay(index) {\n    ensureRenderedExact(index);\n    el.messages.querySelectorAll(".message").forEach(node => {\n      if (Number(node.dataset.index) > index) node.remove();\n    });\n    state.rendered = index + 1;\n    state.replay.mode = "typealong";\n    state.replay.currentIndex = index;\n    state.replay.shown = 0;\n    state.replay.forceComplete = false;\n    state.replay.forceAdvance = false;\n  }\n''',
    '''  function prepareTypealongReplay(index) {\n    ensureRenderedExact(index);\n    el.messages.querySelectorAll(".message").forEach(node => {\n      if (Number(node.dataset.index) > index) node.remove();\n    });\n    state.rendered = index + 1;\n    state.replay.mode = "typealong";\n    state.replay.currentIndex = index;\n    state.replay.shown = 0;\n    state.replay.forceComplete = false;\n    state.replay.forceAdvance = false;\n    state.replay.follow = true;\n  }\n\n  function pinTypingEdge(body) {\n    if (!body || !state.replay.follow) return;\n    const viewport = el.messages.getBoundingClientRect(), edge = body.getBoundingClientRect().bottom;\n    const target = viewport.top + viewport.height * 0.25;\n    const delta = edge - target;\n    if (Math.abs(delta) > 1) el.messages.scrollTop += delta;\n  }\n''',
    'typing edge helper',
)

v = replace_once(
    v,
    '    state.replay.currentIndex = index; state.replay.shown = 0;\n    state.replay.forceComplete = false; state.replay.forceAdvance = false;\n    node.classList.add("typing"); body.textContent = "";',
    '    state.replay.currentIndex = index; state.replay.shown = 0;\n    state.replay.forceComplete = false; state.replay.forceAdvance = false; state.replay.follow = true;\n    node.classList.add("typing"); body.textContent = ""; pinTypingEdge(body);',
    'typealong follow reset',
)

v = replace_once(
    v,
    '      state.replay.shown = shown; body.textContent = text.slice(0, shown); node.scrollIntoView({ block: "nearest" });\n      if (!await wait(50, token)) { node.classList.remove("typing"); return false; }',
    '      state.replay.shown = shown; body.textContent = text.slice(0, shown); pinTypingEdge(body);\n      if (!await wait(50, token)) { node.classList.remove("typing"); return false; }',
    'typing edge tracking',
)

v = replace_once(
    v,
    '    node.scrollIntoView({ behavior: "smooth", block: "center" });\n    const body = node.querySelector(".message-body"), text = state.messages[index].text;',
    '    const body = node.querySelector(".message-body"), text = state.messages[index].text;',
    'remove start scrollIntoView',
)

v = replace_once(
    v,
    '    el.messages.addEventListener("scroll", () => {\n      if (el.messages.scrollTop + el.messages.clientHeight > el.messages.scrollHeight - 900 && state.rendered < state.messages.length) renderNext();\n      if (!state.replay.running) setActive(currentVisibleMessage(), true);\n    }, { passive: true });',
    '    el.messages.addEventListener("wheel", () => { if (state.replay.running && state.replay.mode === "typealong") state.replay.follow = false; }, { passive: true });\n    el.messages.addEventListener("touchstart", () => { if (state.replay.running && state.replay.mode === "typealong") state.replay.follow = false; }, { passive: true });\n    el.messages.addEventListener("scroll", () => {\n      if (el.messages.scrollTop + el.messages.clientHeight > el.messages.scrollHeight - 900 && state.rendered < state.messages.length && state.replay.mode !== "typealong") renderNext();\n      if (!state.replay.running) setActive(currentVisibleMessage(), true);\n    }, { passive: true });',
    'manual scroll override',
)

# Presentation-layer expand/collapse controls.
p = replace_once(
    p,
    '''  function addRawToggle(article, body, rawText) {\n''',
    '''  function addCollapseToggle(article, body, rawText, kind) {\n    if (article.querySelector(".expand-toggle")) return;\n    const toolish = ["tool", "function", "internal", "developer", "system"].includes(kind);\n    const threshold = toolish ? 900 : 6500;\n    if (rawText.length <= threshold) return;\n    article.classList.add("collapsible");\n    if (toolish) article.classList.add("compact-output");\n    const meta = article.querySelector(".message-meta");\n    if (!meta) return;\n    const button = document.createElement("button");\n    button.type = "button"; button.className = "expand-toggle"; button.textContent = toolish ? "Show output" : "Expand";\n    button.addEventListener("click", event => {\n      event.stopPropagation();\n      const expanded = article.classList.toggle("expanded");\n      button.textContent = expanded ? "Collapse" : (toolish ? "Show output" : "Expand");\n    });\n    meta.prepend(button);\n  }\n\n  function addRawToggle(article, body, rawText) {\n''',
    'collapse toggle function',
)

p = replace_once(
    p,
    '    article.classList.remove("kind-user", "kind-user-paste", "kind-assistant", "kind-other-assistant", "kind-tool", "kind-function", "kind-system", "kind-developer", "kind-internal");\n    article.classList.add(`kind-${kindFor(article, rawText)}`);\n    addRawToggle(article, body, rawText);',
    '    article.classList.remove("kind-user", "kind-user-paste", "kind-assistant", "kind-other-assistant", "kind-tool", "kind-function", "kind-system", "kind-developer", "kind-internal");\n    const kind = kindFor(article, rawText); article.classList.add(`kind-${kind}`);\n    addRawToggle(article, body, rawText); addCollapseToggle(article, body, rawText, kind);',
    'wire collapse toggle',
)

# Make interval avoid typing messages entirely.
p = replace_once(
    p,
    '      if (!body || body.dataset.view === "raw" || article.classList.contains("search-hit")) return;',
    '      if (!body || body.dataset.view === "raw" || article.classList.contains("search-hit") || article.classList.contains("typing")) return;',
    'interval typing guard',
)

c += '''\n\n/* Readability controls for very long messages and tool output. */\n.raw-toggle, .expand-toggle { padding: 2px 6px; margin-right: 5px; font-size: .68rem; border-radius: 6px; }\n.message.collapsible:not(.expanded):not(.typing) .message-body { max-height: min(58vh, 38rem); overflow: hidden; position: relative; -webkit-mask-image: linear-gradient(to bottom, #000 0%, #000 88%, transparent 100%); mask-image: linear-gradient(to bottom, #000 0%, #000 88%, transparent 100%); }\n.message.compact-output.collapsible:not(.expanded):not(.typing) .message-body { max-height: 11rem; opacity: .82; }\n.message.typing .message-body { max-height: none !important; overflow: visible !important; -webkit-mask-image: none !important; mask-image: none !important; }\n.message.compact-output:not(.expanded) .message-head { opacity: .88; }\n'''

viewer.write_text(v, encoding='utf-8')
presentation.write_text(p, encoding='utf-8')
css.write_text(c, encoding='utf-8')
print('Patched replay follow, manual scroll override, and collapsible long/tool output.')
