from pathlib import Path

viewer = Path('CONVERSATION_VIEWER/viewer.js')
presentation = Path('CONVERSATION_VIEWER/presentation.js')
viewer_css = Path('CONVERSATION_VIEWER/viewer.css')
presentation_css = Path('CONVERSATION_VIEWER/presentation.css')

v = viewer.read_text(encoding='utf-8')
p = presentation.read_text(encoding='utf-8')
vc = viewer_css.read_text(encoding='utf-8')
pc = presentation_css.read_text(encoding='utf-8')

def replace_once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected exactly one match, found {count}')
    return text.replace(old, new, 1)

# Replay runway so the live edge can actually sit at 25% from the top.
v = replace_once(
    v,
    '    state.replay.follow = true;\n  }\n\n  function pinTypingEdge(body) {',
    '    state.replay.follow = true;\n    el.messages.classList.add("typealong-active");\n  }\n\n  function pinTypingEdge(body) {',
    'activate runway',
)
v = replace_once(
    v,
    '    state.replay.cruiseFrame = null; el.replayToggle.textContent = "▶ Replay"; el.replayStatus.textContent = "Paused";\n  }',
    '    state.replay.cruiseFrame = null; el.messages.classList.remove("typealong-active"); el.replayToggle.textContent = "▶ Replay"; el.replayStatus.textContent = "Paused";\n  }',
    'remove runway',
)
# Touchmove and pointerdown should break follow immediately.
v = v.replace(
    '    el.messages.addEventListener("touchstart", () => { if (state.replay.running && state.replay.mode === "typealong") state.replay.follow = false; }, { passive: true });',
    '    el.messages.addEventListener("touchstart", () => { if (state.replay.running && state.replay.mode === "typealong") state.replay.follow = false; }, { passive: true });\n    el.messages.addEventListener("touchmove", () => { if (state.replay.running && state.replay.mode === "typealong") state.replay.follow = false; }, { passive: true });\n    el.messages.addEventListener("pointerdown", () => { if (state.replay.running && state.replay.mode === "typealong") state.replay.follow = false; }, { passive: true });'
)

# Replace source-length-based collapse with rendered-height-based collapse.
start = p.index('  function addCollapseToggle(article, body, rawText, kind) {')
end = p.index('\n  function addRawToggle(', start)
new_fn = '''  function addCollapseToggle(article, body, rawText, kind) {\n    const toolish = ["tool", "function", "internal", "developer", "system"].includes(kind);\n    if (toolish) article.classList.add("compact-output");\n\n    const install = () => {\n      if (!body.isConnected || article.classList.contains("typing")) return;\n      const lineHeight = parseFloat(getComputedStyle(body).lineHeight) || 24;\n      const limit = lineHeight * (toolish ? 3 : 25);\n      article.style.setProperty("--collapse-height", `${limit}px`);\n      if (body.scrollHeight <= limit + 4) return;\n      article.classList.add("collapsible");\n      if (article.querySelector(".expand-toggle")) return;\n      const meta = article.querySelector(".message-meta");\n      if (!meta) return;\n      const button = document.createElement("button");\n      button.type = "button"; button.className = "expand-toggle"; button.textContent = toolish ? "Show output" : "Expand";\n      button.addEventListener("click", event => {\n        event.stopPropagation();\n        const expanded = article.classList.toggle("expanded");\n        button.textContent = expanded ? "Collapse" : (toolish ? "Show output" : "Expand");\n      });\n      meta.prepend(button);\n    };\n\n    requestAnimationFrame(() => requestAnimationFrame(install));\n  }\n'''
p = p[:start] + new_fn + p[end:]

# Recheck rendered height after markdown/math formatting, since that changes layout.
p = replace_once(
    p,
    '      renderBody(body, rawText);\n    }\n  }',
    '      renderBody(body, rawText);\n      addCollapseToggle(article, body, rawText, kind);\n    }\n  }',
    'recheck collapse after rendering',
)

# CSS: true line-count-derived max height and a large replay runway.
vc += '''\n\n/* Typealong needs empty scroll runway below the current message so the live edge can stay high in view. */\n.messages.typealong-active { padding-bottom: 78vh; }\n.message.collapsible:not(.expanded):not(.typing) .message-body { max-height: var(--collapse-height, 40rem) !important; }\n.message.compact-output.collapsible:not(.expanded):not(.typing) .message-body { max-height: var(--collapse-height, 4.5em) !important; }\n'''

# Slightly larger, more accommodating reading size.
pc += '''\n.message-body { font-size: 1rem; line-height: 1.62; }\n@media (min-width: 1000px) { .message-body { font-size: 1.04rem; } }\n'''

viewer.write_text(v, encoding='utf-8')
presentation.write_text(p, encoding='utf-8')
viewer_css.write_text(vc, encoding='utf-8')
presentation_css.write_text(pc, encoding='utf-8')
print('Patched 25-line rendered truncation and typealong runway.')
