from pathlib import Path

path = Path('CONVERSATION_VIEWER/viewer.js')
text = path.read_text(encoding='utf-8')

def replace_once(old, new, label):
    global text
    count = text.count(old)
    if count != 1:
        raise SystemExit(f'{label}: expected 1 match, found {count}')
    text = text.replace(old, new, 1)

replace_once(
'''  function prepareTypealongReplay(index) {
    ensureRenderedExact(index);
    el.messages.querySelectorAll(".message").forEach(node => {
      if (Number(node.dataset.index) > index) node.remove();
    });
    state.rendered = index + 1;
    state.replay.mode = "typealong";
    state.replay.currentIndex = index;
    state.replay.shown = 0;
    state.replay.forceComplete = false;
    state.replay.forceAdvance = false;
    state.replay.follow = true;
    el.messages.classList.add("typealong-active");
  }

  function pinTypingCaret(caret) {
    if (!caret || !state.replay.follow) return;
    const viewport = el.messages.getBoundingClientRect(), rect = caret.getBoundingClientRect();
    const target = viewport.top + 28;
    const delta = rect.top - target;
    if (Math.abs(delta) > 1) el.messages.scrollTop += delta;
  }
''',
'''  function prepareTypealongReplay(index) {
    ensureRenderedExact(index);
    state.replay.mode = "typealong";
    state.replay.currentIndex = index;
    state.replay.shown = 0;
    state.replay.forceComplete = false;
    state.replay.forceAdvance = false;
    state.replay.follow = true;
    el.messages.classList.add("typealong-active");
    updateFocusClasses(index);
  }

  function pinTypingCaret(caret, force = false) {
    if (!caret || !state.replay.follow) return;
    const viewport = el.messages.getBoundingClientRect(), rect = caret.getBoundingClientRect();
    const body = caret.closest(".message-body");
    const lineHeight = parseFloat(body ? getComputedStyle(body).lineHeight : "") || 26;
    const upper = viewport.top + lineHeight * 4;
    const lower = viewport.top + lineHeight * 10;
    let target = null;
    if (force || rect.top < viewport.top + lineHeight * 2) target = upper;
    else if (rect.top > lower) target = upper;
    if (target != null) {
      const delta = rect.top - target;
      if (Math.abs(delta) > 1) el.messages.scrollTop += delta;
    }
  }
''',
'prepare replay and stepped caret')

replace_once(
'    body.replaceChildren(textNode, caret); pinTypingCaret(caret);',
'    body.replaceChildren(textNode, caret); pinTypingCaret(caret, true);',
'initial caret anchor')

replace_once(
'      if (state.replay.forceComplete) { shown = text.length; textNode.nodeValue = text; state.replay.shown = shown; pinTypingCaret(caret); break; }',
'      if (state.replay.forceComplete) { shown = text.length; textNode.nodeValue = text; state.replay.shown = shown; pinTypingCaret(caret, false); break; }',
'force complete anchor')

replace_once(
'      state.replay.shown = shown; textNode.nodeValue = text.slice(0, shown); pinTypingCaret(caret);',
'      state.replay.shown = shown; textNode.nodeValue = text.slice(0, shown); pinTypingCaret(caret, false);',
'typing caret anchor')

path.write_text(text, encoding='utf-8')
print('Applied stepped Typealong focus and preserved future transcript.')
