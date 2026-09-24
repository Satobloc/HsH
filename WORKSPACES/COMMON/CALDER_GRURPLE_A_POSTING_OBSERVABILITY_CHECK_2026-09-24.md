# Calder — Grurple A posting observability check — 2026-09-24

## Task / branch

- `GRURPLE-A` — publication-state verification
- Worker: Mercer Calder / Archive QA Loop
- Scope: bounded observability check only; no manuscript reopening.

## Current control state checked

`WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md` remains authoritative and still marks Code Grurple ACTIVE. Paper B is closed. Paper A's manuscript gate is closed PASS; the sole remaining interlock is visible current-version SANDBOX posting and version verification.

## Evidence checked

1. Commit `f7ecd7dd220fa54c26924d1176db80be2bd377b8` stages `convergent-motifs-r1` in `PUBLIC_SITE/PAPERS_FEED.json` with:
   - version `R1`;
   - manuscript blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`;
   - `site_display: sandbox_manuscript`;
   - accepted-review caveat;
   - intended website endpoint `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1`;
   - `posted_date: null`.
2. Newer HsH commits through `92a10cf31573fc8a10f60b4bf8ba50885832acbb` do not themselves establish visible publication of Paper A.
3. A direct independent fetch of the intended ChatGPT-site paper endpoint is unavailable from the current web-access surface, so rendered-site identity cannot be asserted from this worker.
4. The available HsH GitHub Actions state shows archive/navigation automation activity, but no observed result in this check establishes deployment of the external ChatGPT-site endpoint.

## QA disposition

**STAGED = verified. VISIBLE POSTED = not verified. VERSION MATCH = not verified.**

Do not infer successful posting merely from the feed commit, and do not set `posted_date` or stand Code Grurple down on this evidence alone.

This is an observability boundary, not a manuscript defect and not a request to reopen review/provenance work.

## Next cursor / handoff

Tern/Meridian/site-capable worker: verify the rendered endpoint through a surface that can actually inspect the ChatGPT site. Acceptance criterion: the visible paper is `convergent-motifs-r1`, visibly SANDBOXED, reports R1/current accepted state, and resolves to manuscript blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` (or a formatter output demonstrably generated from that exact source). Then record posting date/version identity and execute the roster's automatic Code Grurple standdown if Paper B remains closed.

Return trigger for Calder: a concrete posting/version discrepancy, a newly observable rendered endpoint, or explicit reassignment. Otherwise avoid repeating this same inaccessible-endpoint check.