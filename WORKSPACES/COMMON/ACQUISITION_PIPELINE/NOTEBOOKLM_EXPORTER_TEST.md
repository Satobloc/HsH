# NotebookLM full exporter — test protocol

**Status:** prototype test fixture, 2026-09-13

The first exporter is `notebooklm_full_exporter.js`.

## Why this exists

A plain Blink/Chrome MHTML save preserves only the chat turns currently instantiated in NotebookLM's virtualized DOM. In the H(s)H STEAMROLLER test, the MHTML began at a later turn even though a fuller copy showed substantial older chat. Therefore the exporter must capture each DOM window while programmatically walking upward through the chat.

## Primary acceptance test

Use the **H(s)H STEAMROLLER** notebook that produced the two comparison fixtures:

- MHTML-derived snapshot whose earliest captured user message was `Tell me, using all of your training data, whether anyone has alrady done this before.`
- fuller rendered transcript whose actual first visible user entry is `Ok, I'd like you to give me an outline for an introductory H(s)H paper` and whose final user entry is `What an extraordinary story.`

A successful run should recover, at minimum:

1. the introductory-paper request as the first captured user turn;
2. the later `Tell me ... alrady done this before` message at its proper later position rather than as turn 1;
3. the final `What an extraordinary story.` user turn and its assistant response;
4. all intervening visible conversation turns without duplicates;
5. user/assistant role separation;
6. inline citation labels where NotebookLM exposes them in the rendered DOM;
7. notebook ID/title/URL;
8. a source manifest and Studio artifact manifest from the state visible at export time.

## Test procedure

1. Open H(s)H STEAMROLLER in Chrome/Edge.
2. Leave the Chat panel expanded.
3. Open DevTools → Sources → Snippets.
4. Paste/run `notebooklm_full_exporter.js`.
5. In the floating panel, click **HARVEST FULL CHAT**.
6. Do not manually scroll until the tool reports `Reached top` or an error.
7. Export both JSON and Markdown.
8. Compare the Markdown against the fuller transcript fixture.
9. If the exporter stalls early, use **DEBUG HTML** before refreshing the page; retain that DOM snapshot for selector repair.

## Known prototype limitations

- NotebookLM DOM/class names may change.
- The scroll container is identified heuristically.
- Date separators are harvested as metadata but are not yet attached to individual turns.
- Identical repeated messages can collide under the current role+text hash. This is rare but must be fixed if encountered; a future version should incorporate adjacent-message context or DOM IDs where available.
- Source and Studio manifests currently capture what is instantiated/visible; they do not yet actively walk virtualized source/artifact lists.
- Generated artifact payloads themselves are not downloaded yet.
- Original NotebookLM source documents are not downloaded by this script.

## Next milestones after full-chat validation

1. attach date separators/times to message ranges;
2. actively scroll/harvest the complete source list and Studio list;
3. preserve source UUID ↔ title mapping;
4. preserve citation → source UUID/title edges;
5. add optional generated-artifact downloading where a normal browser download action is available;
6. emit an archival packet manifest suitable for `batch_file_stage.py` and HsH ingestion;
7. add incremental mode so a later run on the same notebook appends only previously unseen turns/artifacts.
