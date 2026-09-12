from pathlib import Path

viewer = Path('CONVERSATION_VIEWER/viewer.js')
presentation = Path('CONVERSATION_VIEWER/presentation.js')

v = viewer.read_text(encoding='utf-8')
p = presentation.read_text(encoding='utf-8')

def replace_once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected exactly one match, found {count}')
    return text.replace(old, new, 1)

v = replace_once(
    v,
    '    replay: { running: false, token: 0, cruiseFrame: null },',
    '    replay: { running: false, token: 0, cruiseFrame: null, mode: null, currentIndex: -1, shown: 0, forceComplete: false, forceAdvance: false },',
    'replay state',
)

v = replace_once(
    v,
    '  function ensureRendered(index) { if (index >= state.rendered) renderNext(index + 20); }\n',
    '''  function ensureRendered(index) { if (index >= state.rendered) renderNext(index + 20); }\n\n  function ensureRenderedExact(index) { if (index >= state.rendered) renderNext(index + 1); }\n\n  function prepareTypealongReplay(index) {\n    ensureRenderedExact(index);\n    el.messages.querySelectorAll(".message").forEach(node => {\n      if (Number(node.dataset.index) > index) node.remove();\n    });\n    state.rendered = index + 1;\n    state.replay.mode = "typealong";\n    state.replay.currentIndex = index;\n    state.replay.shown = 0;\n    state.replay.forceComplete = false;\n    state.replay.forceAdvance = false;\n  }\n''',
    'exact rendering helper',
)

v = replace_once(
    v,
    '  function wait(ms, token) { return new Promise(resolve => setTimeout(() => resolve(token === state.replay.token), Math.max(10, ms))); }\n',
    '''  function wait(ms, token) { return new Promise(resolve => setTimeout(() => resolve(token === state.replay.token), Math.max(10, ms))); }\n\n  async function replayGap(ms, token) {\n    const end = performance.now() + Math.max(0, ms);\n    while (state.replay.running && token === state.replay.token && performance.now() < end) {\n      if (state.replay.forceAdvance) { state.replay.forceAdvance = false; return true; }\n      const left = end - performance.now();\n      if (!await wait(Math.min(40, left), token)) return false;\n    }\n    state.replay.forceAdvance = false;\n    return state.replay.running && token === state.replay.token;\n  }\n''',
    'replay gap helper',
)

old_typealong = '''  async function typealongMessage(index, token) {\n    ensureRendered(index); jumpToMessage(index, true);\n    const node = document.getElementById(`m${index + 1}`); if (!node) return false;\n    const body = node.querySelector(".message-body"), text = state.messages[index].text;\n    const charsPerSecond = 48 * replaySpeed(index); let shown = 0; body.textContent = "";\n    while (shown < text.length && state.replay.running && token === state.replay.token) {\n      shown = Math.min(text.length, shown + Math.max(1, Math.round(charsPerSecond / 20)));\n      body.textContent = text.slice(0, shown); node.scrollIntoView({ block: "nearest" });\n      if (!await wait(50, token)) return false;\n    }\n    body.textContent = text; return state.replay.running && token === state.replay.token;\n  }\n'''
new_typealong = '''  async function typealongMessage(index, token) {\n    ensureRenderedExact(index); setActive(index, true);\n    const node = document.getElementById(`m${index + 1}`); if (!node) return false;\n    node.scrollIntoView({ behavior: "smooth", block: "center" });\n    const body = node.querySelector(".message-body"), text = state.messages[index].text;\n    const charsPerSecond = 48 * replaySpeed(index); let shown = 0;\n    state.replay.currentIndex = index; state.replay.shown = 0;\n    state.replay.forceComplete = false; state.replay.forceAdvance = false;\n    node.classList.add("typing"); body.textContent = "";\n    while (shown < text.length && state.replay.running && token === state.replay.token) {\n      if (state.replay.forceComplete) { shown = text.length; body.textContent = text; state.replay.shown = shown; break; }\n      shown = Math.min(text.length, shown + Math.max(1, Math.round(charsPerSecond / 20)));\n      state.replay.shown = shown; body.textContent = text.slice(0, shown); node.scrollIntoView({ block: "nearest" });\n      if (!await wait(50, token)) { node.classList.remove("typing"); return false; }\n    }\n    body.textContent = text; state.replay.shown = text.length; state.replay.forceComplete = false; node.classList.remove("typing");\n    return state.replay.running && token === state.replay.token;\n  }\n'''
v = replace_once(v, old_typealong, new_typealong, 'typealong message')

old_seq = '''  async function runSequentialReplay(typealong) {\n    const token = ++state.replay.token; state.replay.running = true; el.replayToggle.textContent = "⏸ Pause";\n    for (let i = state.activeIndex; i < state.messages.length && state.replay.running && token === state.replay.token; i++) {\n      setActive(i, true); let ok = true;\n      if (typealong) ok = await typealongMessage(i, token);\n      else {\n        ensureRendered(i); jumpToMessage(i, true);\n        const dwell = Math.min(7000, Math.max(650, (state.messages[i].text.length / (42 * replaySpeed(i))) * 1000));\n        el.replayStatus.textContent = `Message ${i + 1} / ${state.messages.length}`; ok = await wait(dwell, token);\n      }\n      if (!ok) break; state.activeIndex = i;\n      if (typealong && !await wait(Math.min(900, 300 + state.messages[i].text.length * 0.7) / replaySpeed(i), token)) break;\n    }\n    if (token === state.replay.token) stopReplay();\n  }\n'''
new_seq = '''  async function runSequentialReplay(typealong) {\n    const token = ++state.replay.token; state.replay.running = true; state.replay.mode = typealong ? "typealong" : "message"; el.replayToggle.textContent = "⏸ Pause";\n    if (typealong) prepareTypealongReplay(state.activeIndex);\n    for (let i = state.activeIndex; i < state.messages.length && state.replay.running && token === state.replay.token; i++) {\n      setActive(i, true); let ok = true;\n      if (typealong) ok = await typealongMessage(i, token);\n      else {\n        ensureRendered(i); jumpToMessage(i, true);\n        const dwell = Math.min(7000, Math.max(650, (state.messages[i].text.length / (42 * replaySpeed(i))) * 1000));\n        el.replayStatus.textContent = `Message ${i + 1} / ${state.messages.length}`; ok = await wait(dwell, token);\n      }\n      if (!ok) break; state.activeIndex = i;\n      if (typealong && !await replayGap(Math.min(900, 300 + state.messages[i].text.length * 0.7) / replaySpeed(i), token)) break;\n    }\n    if (token === state.replay.token) stopReplay();\n  }\n'''
v = replace_once(v, old_seq, new_seq, 'sequential replay')

old_buttons = '    el.previousMessage.addEventListener("click", () => jumpToMessage(state.activeIndex - 1)); el.nextMessage.addEventListener("click", () => jumpToMessage(state.activeIndex + 1));\n'
new_buttons = '''    el.previousMessage.addEventListener("click", () => jumpToMessage(state.activeIndex - 1)); el.nextMessage.addEventListener("click", () => {\n      if (state.replay.running && state.replay.mode === "typealong") {\n        const index = state.replay.currentIndex, text = state.messages[index]?.text || "";\n        if (index >= 0 && state.replay.shown < text.length) {\n          state.replay.forceComplete = true;\n          const body = document.querySelector(`#m${index + 1} .message-body`); if (body) body.textContent = text;\n          state.replay.shown = text.length;\n          return;\n        }\n        state.replay.forceAdvance = true;\n        return;\n      }\n      jumpToMessage(state.activeIndex + 1);\n    });\n'''
v = replace_once(v, old_buttons, new_buttons, 'next message behavior')

p = replace_once(
    p,
    '    if (!article.classList.contains("search-hit") && body.dataset.view !== "raw") {\n      renderBody(body, rawText);\n    }',
    '    if (!article.classList.contains("search-hit") && !article.classList.contains("typing") && body.dataset.view !== "raw") {\n      renderBody(body, rawText);\n    }',
    'presentation typing guard',
)

viewer.write_text(v, encoding='utf-8')
presentation.write_text(p, encoding='utf-8')
print('Patched typealong replay behavior.')
