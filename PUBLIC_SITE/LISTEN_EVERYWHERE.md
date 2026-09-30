# Glass Sausage Factory — Listen Everywhere

**Status:** CURRENT frontend requirement  
**Date:** 2026-09-30

Every ordinary public page should expose a visible **Listen** control near the page title/actions.

The shared runtime is:

`PUBLIC_SITE/runtime/page-listen.js`

It uses the browser Web Speech API and sanitizes page text before speech.

## Speech-cleaning rules

Do not read aloud:
- raw URLs;
- email addresses;
- code blocks or inline code;
- navigation/footer chrome;
- backend/control paths;
- raw source/provenance dumps;
- commit/blob identifiers and workflow plumbing;
- Markdown/HTML syntax.

For links, speak the human label, not the URL. For images, optionally speak concise alt text. Mathematical text should pass through the project math-speech normalizer rather than being read as punctuation soup.

## Page coverage

Apply the same Listen affordance to:
- Home / Start Here;
- Visual Atlas / gallery detail;
- Reading Library;
- papers and manuscript/PDF pages;
- Current Work / updates;
- glossary / claims / roadmap / history;
- podcast pages;
- conversation-viewer pages where turn-level TTS already exists.

If a page contains no reader-facing prose, the control may return an empty/unavailable state rather than reading machine data.

## Presentation dependency

Listen operates on the **presented page**, never as a workaround for raw-source exposure. JSON, Markdown, TeX and backend/control files must still be routed through the presentation gate first.
