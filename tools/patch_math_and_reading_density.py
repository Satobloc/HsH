from pathlib import Path

index = Path('CONVERSATION_VIEWER/index.html')
presentation = Path('CONVERSATION_VIEWER/presentation.js')
css = Path('CONVERSATION_VIEWER/presentation.css')
viewer_css = Path('CONVERSATION_VIEWER/viewer.css')

i = index.read_text(encoding='utf-8')
p = presentation.read_text(encoding='utf-8')
c = css.read_text(encoding='utf-8')
v = viewer_css.read_text(encoding='utf-8')

def replace_once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected exactly one match, found {count}')
    return text.replace(old, new, 1)

# KaTeX assets. CDN failure is non-fatal; source text remains visible.
i = replace_once(
    i,
    '  <link rel="stylesheet" href="viewer.css">\n  <link rel="stylesheet" href="presentation.css">',
    '  <link rel="stylesheet" href="viewer.css">\n  <link rel="stylesheet" href="presentation.css">\n  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css">',
    'katex css',
)
i = replace_once(
    i,
    '  <script src="viewer.js"></script>\n  <script src="landmarks.js"></script>\n  <script src="presentation.js"></script>',
    '  <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js"></script>\n  <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js"></script>\n  <script src="viewer.js"></script>\n  <script src="landmarks.js"></script>\n  <script src="presentation.js"></script>',
    'katex scripts',
)

# Math render helper and hook after markdown render.
p = replace_once(
    p,
    '  function renderBody(body, rawText, query = "") {\n    if (!body || body.dataset.view === "raw") return;\n    body.innerHTML = renderMarkdown(rawText);\n    if (query) highlightTextNodes(body, query);\n    body.dataset.presented = "true";\n  }',
    '''  function renderMath(body) {\n    if (!body || typeof window.renderMathInElement !== "function") return;\n    try {\n      window.renderMathInElement(body, {\n        delimiters: [\n          { left: "$$", right: "$$", display: true },\n          { left: "\\\\[", right: "\\\\]", display: true },\n          { left: "\\\\(", right: "\\\\)", display: false },\n          { left: "$", right: "$", display: false }\n        ],\n        throwOnError: false,\n        strict: "ignore",\n        ignoredTags: ["script", "noscript", "style", "textarea", "pre", "code"]\n      });\n    } catch (error) {\n      console.debug("Math render skipped", error);\n    }\n  }\n\n  function renderBody(body, rawText, query = "") {\n    if (!body || body.dataset.view === "raw") return;\n    body.innerHTML = renderMarkdown(rawText);\n    renderMath(body);\n    if (query) highlightTextNodes(body, query);\n    body.dataset.presented = "true";\n  }''',
    'math rendering hook',
)

# More aggressive tool collapse; conversational prose gets roughly a screenful.
p = p.replace('    const threshold = toolish ? 900 : 6500;', '    const threshold = toolish ? 260 : 2200;')

# Palette: ChatGPT green, tool plumbing desaturated gray.
c = c.replace('  --assistant: #f5f5f5;', '  --assistant: #10a37f;')
c = c.replace('  --tool: #8d8d96;', '  --tool: #666a70;')
c = c.replace('  --system: #6f6f78;', '  --system: #60646a;')
c = c.replace('  --developer: #a1a1aa;', '  --developer: #757981;')
c = c.replace('.message.kind-assistant { --speaker: var(--assistant) !important; background: #101012; }', '.message.kind-assistant { --speaker: var(--assistant) !important; background: linear-gradient(90deg, rgba(16,163,127,.055), #101012 28%); }')
c = c.replace('.message.kind-assistant .message-speaker { color: #fff; }', '.message.kind-assistant .message-speaker { color: #60d7b7; }')
c = c.replace('.speaker-chip[data-speaker="assistant"] { color: #fff; }', '.speaker-chip[data-speaker="assistant"] { color: #8be3ca; }')

# Math presentation polish.
c += '''\n\n/* Mathematical display. */\n.message-body .katex { font-size: 1.03em; }\n.message-body .katex-display { margin: .9em 0 1.05em; overflow-x: auto; overflow-y: hidden; padding: .18em 0 .3em; }\n.message-body .katex-display > .katex { white-space: nowrap; }\n.message-body .katex-error { color: inherit !important; }\n'''

# Existing collapse rules live in viewer.css from the prior pass.
v = v.replace('max-height: min(58vh, 38rem);', 'max-height: min(68vh, 46rem);')
v = v.replace('max-height: 11rem;', 'max-height: 4.6em;')
v += '''\n.message.kind-tool, .message.kind-function, .message.kind-system, .message.kind-developer, .message.kind-internal { opacity: .78; }\n.message.kind-tool.expanded, .message.kind-function.expanded, .message.kind-system.expanded, .message.kind-developer.expanded, .message.kind-internal.expanded { opacity: .94; }\n'''

index.write_text(i, encoding='utf-8')
presentation.write_text(p, encoding='utf-8')
css.write_text(c, encoding='utf-8')
viewer_css.write_text(v, encoding='utf-8')
print('Patched math rendering, palette, and reading-density rules.')
