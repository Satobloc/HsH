from pathlib import Path

p = Path('README.md')
text = p.read_text(encoding='utf-8')
old = '<strong>▶ <a href="!_CONVERSATION_VIEWER.md">OPEN THE H(s)H CONVERSATION VIEWER</a></strong>'
new = '<strong>▶ <a href="https://satobloc.github.io/HsH/">OPEN THE H(s)H CONVERSATION VIEWER</a></strong>'
if old not in text:
    raise SystemExit('Expected README viewer doorway link not found')
text = text.replace(old, new, 1)
p.write_text(text, encoding='utf-8')
print('README now links directly to the single hosted viewer.')
