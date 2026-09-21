# Conversation Viewer — text-to-speech playback

**Date:** 2026-09-21  
**Instance:** Meridian  
**Status:** INTEGRATION-READY / runtime built; live Sites source not accessible from this worker  
**Type:** viewer accessibility + long-form listening

## Built runtime

The repo now contains a complete browser-side first implementation:

- `PUBLIC_SITE/runtime/math-speech.js` — deterministic symbol/LaTeX → spoken-math normalizer;
- `PUBLIC_SITE/runtime/conversation-tts.js` — queued Web Speech controller;
- `PUBLIC_SITE/runtime/conversation-viewer-tts-bootstrap.js` — DOM adapter, toolbar, per-turn buttons, highlighting and auto-scroll;
- `PUBLIC_SITE/runtime/conversation-viewer-tts-entry.js` — one-line auto-boot entrypoint.

The intended live-site hookup is simply to load the entrypoint as an ES module from a location the deployed site can serve:

```html
<script type="module" src="/runtime/conversation-viewer-tts-entry.js"></script>
```

If the Sites build copies rather than directly serves repo runtime files, copy all four files together preserving relative paths.

## User-facing behavior

Global toolbar:

```text
▶ Play conversation   ❚❚ Pause   ■ Stop   1.0×   Math: scientist   Nathan + assistant
```

Each detected conversation turn receives a compact `▶` button.

Full playback is queued in bounded chunks rather than sent to TTS as one giant utterance. Current turn is highlighted and auto-scrolled during playback.

Speaker filter:
- Nathan + assistant;
- Nathan only;
- Assistant only.

Playback speeds currently offered: `0.75×, 1×, 1.15×, 1.3×, 1.5×, 1.75×, 2×`.

## Math audio

Default is **Scientist** mode, designed specifically to prevent podcast failures such as `lambda dollars dollars`.

Examples:

```text
$$ \lambda_k' = \mu^{-2}\lambda_k $$
→ "lambda sub k prime equals mu to the minus two lambda sub k"

\frac{p}{2\pi R}
→ "p over two pi R"
```

The normalizer covers common:
- Greek letters;
- subscripts and superscripts;
- fractions and square roots;
- integrals/sums;
- standard comparison/arithmetic operators;
- common function names;
- SO(4), Sim(4), H(s)H and Hagalaz tokens;
- Markdown/LaTeX delimiter removal.

Modes:
- `Math: scientist` — semantic/scientist-style wording;
- `Math: literal` — audit-oriented notation reading;
- `Math: skip` — say `displayed equation` and continue.

Fenced code blocks are announced as omitted rather than read character-by-character.

## Rendered-math handling

The bootstrap tries to extract semantic math before ordinary text extraction:

1. `aria-label` when a renderer exposes one;
2. MathML/KaTeX `<annotation encoding="application/x-tex">`;
3. visible math text as fallback.

The extracted expression is then routed through the same verbalizer, avoiding duplicate visual+semantic math speech.

## DOM adaptation

The bootstrap prefers explicit stable markup but can currently detect several common shapes:

```text
[data-turn-id]
[data-message-author-role]
[data-role][data-message-id]
.conversation-turn
.message-turn
.chat-turn
.message
```

It infers user/assistant role from data attributes first and class/author hints second. A `MutationObserver` attaches controls to dynamically loaded turns.

If the live Conversation Viewer exposes a different stable turn wrapper, add that selector at the front of `TURN_SELECTORS` / `SELECTORS` in the bootstrap rather than rewriting the audio system.

## Technology / boundary

Uses `window.speechSynthesis`; no public API key, backend TTS service, or stored audio is required.

Browser/OS voices vary. This first implementation deliberately avoids depending on a named voice.

This repo worker cannot edit the live ChatGPT Sites source directly. Therefore **integration-ready does not mean live-deployed**. The remaining Sites operation is to include the entry module (or transplant the four runtime files) and, only if necessary, point the bootstrap at the viewer's exact turn wrapper.

## Immediate acceptance test

After integration, open a math-heavy conversation and verify:

1. each turn shows `▶`;
2. `▶ Play conversation` advances through multiple turns;
3. pause/resume/stop work;
4. active turn highlights/scrolls;
5. switching speaker filter changes the queue;
6. switching `Math: scientist / literal / skip` changes equation speech;
7. `$$ \lambda $$` never produces `dollar`, `backslash`, or raw delimiter speech in Scientist mode.
