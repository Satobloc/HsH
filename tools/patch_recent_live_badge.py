from pathlib import Path

p = Path('CONVERSATION_VIEWER/viewer.js')
text = p.read_text(encoding='utf-8')
anchor = '''  function renderCatalog() {\n'''
insert = '''  function isRecentlyLive(c) {\n    if (c.corpus !== "live" || !c.end_local) return false;\n    const end = new Date(c.end_local);\n    if (Number.isNaN(end.getTime())) return false;\n    const age = Date.now() - end.getTime();\n    return age >= 0 && age <= 14 * 24 * 60 * 60 * 1000;\n  }\n\n'''
if 'function isRecentlyLive(c)' not in text:
    if anchor not in text:
        raise SystemExit('renderCatalog anchor not found')
    text = text.replace(anchor, insert + anchor, 1)
old = '''        <div class="meta"><span class="badge ${c.corpus === "live" ? "live" : ""}">${esc(c.corpus)}</span>\n        <span>${Number(c.message_count).toLocaleString()} msgs</span>${group.members.length > 1 ? `<span>${group.members.length} versions</span>` : ""}</div>'''
new = '''        <div class="meta">${isRecentlyLive(c) ? `<span class="badge live">live</span>` : ""}\n        <span>${Number(c.message_count).toLocaleString()} msgs</span>${group.members.length > 1 ? `<span>${group.members.length} versions</span>` : ""}</div>'''
if old not in text:
    raise SystemExit('badge block not found')
text = text.replace(old, new, 1)
p.write_text(text, encoding='utf-8')
print('Viewer Live badge now requires an end timestamp within the last 14 days.')
