# Conversation Viewer — text-to-speech playback

**Date:** 2026-09-21  
**Instance:** Meridian  
**Status:** IMPLEMENTABLE / runtime helper added  
**Type:** viewer accessibility + long-form listening

## Request

Add text-to-audio playback to Conversation Viewer:

- per-turn `▶ Read aloud` button;
- conversation-level `▶ Play conversation`;
- pause / resume / stop;
- playback-rate control;
- optionally start from the currently selected turn;
- optionally filter playback to user only / assistant only / both.

## Recommended implementation

Use browser-native Web Speech API (`window.speechSynthesis`) for the first implementation.

Advantages:

- no backend TTS service required;
- no API key in the public site;
- no stored/generated audio assets;
- works naturally with dynamically loaded conversation text;
- supports per-turn and queued full-conversation playback.

Runtime helper already added:

`PUBLIC_SITE/runtime/conversation-tts.js`

The module is adapter-based: the viewer supplies `getTurns()` returning objects like:

```js
[
  { id: 'turn-1', role: 'Nathan', text: '...' },
  { id: 'turn-2', role: 'Assistant', text: '...' }
]
```

Then:

```js
const tts = new ConversationTTS({ getTurns });

tts.playTurn(turnId);
tts.playConversation();
tts.pause();
tts.resume();
tts.stop();
tts.setRate(1.25);
```

`attachConversationTTSControls()` can add per-turn buttons when turn elements expose stable `data-turn-id` attributes.

## Full-conversation playback

Do **not** synthesize the whole conversation as one giant utterance. Queue sentence-sized chunks grouped by turn.

Benefits:

- avoids browser TTS length/time limits;
- permits reliable pause/resume/stop;
- keeps current-turn highlighting possible;
- enables start-from-this-turn;
- allows speaker labels and role filtering;
- can survive extremely large archived conversations.

Recommended global toolbar:

```text
▶ Play conversation   ❚❚ Pause   ■ Stop   1.0× ▾
From: beginning / selected turn
Voices: both / Nathan / assistant
```

Each turn:

```text
[role/date controls ...]   ▶
```

When full playback advances, add a transient `data-speaking="true"` / CSS highlight to the active turn and optionally auto-scroll it into view.

## Math handling

Browser TTS does not understand mathematical notation reliably. The current helper therefore includes a deliberately conservative normalization hook.

MVP:
- speak ordinary prose;
- omit fenced code blocks;
- replace complex displayed math with a short `displayed equation` cue;
- avoid reading raw TeX control sequences aloud.

Upgrade path:
- feed rendered MathML through its accessibility text when available;
- use MathJax/KaTeX semantic annotations if the viewer already produces them;
- add a project-specific math speech normalizer for common notation (`mu`, `lambda`, subscripts, fractions, SO(4), etc.);
- offer `Math: concise / detailed / skip` setting.

For this project, math-aware speech is worth doing after the basic queue works because the viewer is unusually math-heavy.

## Voice choice

Browser voices vary by OS/browser. Expose the available `speechSynthesis.getVoices()` list only as an optional preference. Do not depend on a specific named voice.

Potentially useful later:
- remember separate preferred voices for Nathan/user turns and assistant turns;
- fall back to one voice when only one suitable voice exists.

## Failure / accessibility behavior

If Web Speech is unavailable:
- hide/disable the playback controls with a clear tooltip;
- do not break the viewer.

Buttons need accessible labels; playback state should be exposed with `aria-pressed` / live status where appropriate.

## Boundary

The runtime helper is repository-side infrastructure only. It is not wired into the live Conversation Viewer until a Sites/viewer edit session connects the viewer's actual turn data/DOM to the adapter.
