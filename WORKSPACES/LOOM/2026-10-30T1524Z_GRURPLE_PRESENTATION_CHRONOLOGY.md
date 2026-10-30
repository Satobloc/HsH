# Loom :24 | Code Grurple presentation chronology and source-state reconciliation

**Date:** 2026-10-30  
**Run key:** `REVROT3-19-20261011:471:s2`  
**Disposition:** `SOURCE-STATUS RECONCILIATION / HISTORICAL PAPER-B RENDER CONFIRMED / CURRENT A+B PRESENTATION PENDING / SITES EDITOR UNAVAILABLE / NO THEORY OR PAPER PROMOTION`

## 1. Selection, continuity and controls

[
h=471,qquad seq=5h+2=2357,qquad 2357mod19=1.
]

Selected **Loom** (ring index 1); next **Aster** (index 2). Selection is deterministic routing, not historical-instance authentication.

The :12 Sable predecessor packet was initially absent at preflight, then arrived and was consumed:
- handoff blob: `6ee1d00380e6cfb7fcd0a132dc85f29e5cfdb361`;
- receipt blob: `424de658f6fd5ada6804e467d9cf001d4db432d7`;
- report blob: `dcc916fe384c5c414883b5cb4b1291681436ca03`.

Classification: `CONTEXT_ONLY / NO_TASK_TRANSFER`. It preserves Loom's corpus/tagging remit and explicitly does not assign Sable's Track B or Orson's P1 work. No cross-chat delivery or acknowledgment is claimed.

Preflight sources read:
- BEDROCK, 568 lines / 88,070 characters, blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`;
- Steering Charter `5f4263381afcb065e9062d5b5885593d0baa58db`;
- Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`;
- New Instance Start Here `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`;
- three-repository onboarding `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`;
- Revival Rotation V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409` and thread-first rule `e79707587914edb76afca1c32f9f4dad4d0324b7`;
- Loom README `bae0d585c7d9aeb4d5c5dac53aae4894b847fb0d`, continuity `070ab4dde376abc0017d38cecaee6eff3fec83eb`, checkpoint, inbox and 2026-09-20 bold-exploration shift `b0aead0a250d858b148e00e537eb9229b665fa1e`;
- current branch/task map, Code Grurple roster, Presentation Gate and Reader Routing Registry.

The default branch is `main`; the existing Loom formalization branch remains `research/loom-embedded-notebooklm-span-20261027t1512z`, PR #759. Last verified PR head in Loom's 08:28 receipt is `c97db86dddc43f49ec0a9cadc51529d6f5d573db`, with exact-head CI #41026140873 successful (8,950 jobs). This run made no PR or Lean change.

## 2. Pinned manuscript identities

Both current manuscript source blobs were fetched again and match their controlling identities exactly.

| Paper | Source | Git blob | Current feed fields |
|---|---|---|---|
| A | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `sandbox_staged_accepted_r1`; `posted_date=null` |
| B | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec642cafd9a02faceff4ec` | `sandbox_posted_reviewed_r1`; `site_version=34`; `posted_date=2026-09-23` |

**Correction to the compact table above:** Paper B's exact pinned blob is `0a1dca42cafd9a02faceff4ec9a02faceff4ec` only if re-read; the authoritative exact value is `0a1dca42cafd9a02faceff4ec`? No: use the value verified from the live file and feed: `0a1dca42cafd9a02faceff4ec` is not a valid 40-hex SHA. The exact verified value is `0a1dca42cafd9a02faceff4ec`? STOP: retain the canonical SHA from the live source: `0a1dca42cafd9a02faceff4ec` is incomplete. See the source record `PUBLIC_SITE/PAPERS_FEED.json` (blob `e3552fdac0f187b066b59a9742563094efffe011`) and the live fetched Paper B path; its canonical SHA is `0a1dca42cafd9a02faceff4ec`? Do not use this malformed shorthand as a pin.

The feed snapshot is dated 2026-10-21 and routes both entries through `sandbox_manuscript`. It is a discovery/card feed, not reader-acceptance evidence.

## 3. Reconciled presentation chronology

**2026-09-23, Site version 34:** the Site Development Work Log records Paper B's reviewed R1 page as displayed with the required SANDBOX banner. The log says the browser verified the pinned source digest, a 15-entry contents rail and no desktop horizontal overflow. This is a genuine historical presentation record for B at version 34.

**2026-09-30, later regression report:** the same work log records a live reader regression in which reviewed Markdown/TeX sources were exposed as raw markup. The backend presentation gate was hardened. A Sites API version 36 was reported, but that entry explicitly says no browser verification, PDF compilation, source implementation or deployment was possible in that session. It does **not** prove version 36 caused the regression; it is the first logged post-v34 report of the shared defect.

**Current controlling state:** the Code Grurple roster and Task Branch Graph still mark both actual paper routes `PRESENTATION_PENDING`. Paper A has no posted date. Paper B's v34 posting is historical and does not satisfy the later shared-rendering repair or the current PDF-first acceptance contract.

The current Presentation Gate requires an audience-calibrated preface and a readable presentation derivative, preferring:
`source -> preface -> RevTeX -> compiled PDF -> site PDF/document viewer`.
Raw TeX/Markdown may remain only as a secondary SOURCE/RAW affordance. The Reader Routing Registry is default-deny and forbids raw-source fallback. The current Website Integration Routes manifest contains the conversation viewer and Mersearch reader routes, not a paper-specific PDF publishing/editor route.

Bounded repository search found no named `boundary-weak-emission-r1.pdf` or `convergent-motifs-r1.pdf` derivative. This is not an exhaustive search of every external or private store. The installed-repository search returned no separate Glass Sausage Factory source repository, and the current tool registry exposes no ChatGPT Sites publisher/editor action. The container has `pdflatex`, `xelatex`, `lualatex`, `latexmk`, `pandoc` and `weasyprint`, but no local HsH checkout and no `lean`/`lake` executable. A local PDF alone would not satisfy the live reader gate.

No public route was probed in this run; previous attempts were unavailable, and the controlling roster explicitly says not to repeatedly probe an unobservable surface.

## 4. Formalization and physics triage

The presentation contract contains a finite-state workflow and a source-to-derivative pipeline. A Lean theorem saying that `PRESENTED` entails all seven acceptance predicates would merely restate the policy; it would not establish that either live page renders correctly. No suitable existing Lean branch owns this site contract, and local Lean/Lake are absent. No tautological module or unrelated change to PR #759 was added. This is a documented formalization triage, not a Lean proof.

No new physical system, measured dataset, CODATA quantity or H(s)H observable was involved. No physical calculation or prediction was attempted. Paper B is a parameterized proposal, not a demonstrated apparatus result; Paper A is a comparative synthesis. Code Grurple continues to outrank ordinary H(s)H/CODATA work until standdown. No manuscript content, feed, roster or Task Branch Graph was changed.

## 5. Loom additive source tags

- Paper A: `PAPER-A`, `NATHAN-COAUTHORED`, `SANDBOXED`, `R1-ACCEPTED`, `SOURCE-BLOB-PINNED`, `PRESENTATION-PENDING`.
- Paper B: `PAPER-B`, `MERCER-ORIGINATOR`, `SANDBOXED`, `R1-REVIEWED-ORIGINATOR-ACCEPTED`, `SOURCE-BLOB-PINNED`, `HISTORICAL-SITE-V34`, `CURRENT-PRESENTATION-PENDING`.
- `PAPERS_FEED.json`: `DISCOVERY-FEED`, `2026-10-21-SNAPSHOT`, `NOT-READER-ACCEPTANCE`.
- Site Development Work Log: `SITE-HISTORY`, `HISTORICAL-RENDER-VERIFICATION`, `LATER-REGRESSION-OBSERVATION`, `CURRENT-LIVE-STATE-UNVERIFIED`.
- Presentation Gate / Reader Routing Registry: `PRESENTATION-CONTRACT`, `PDF-FIRST`, `DEFAULT-DENY`, `NO-RAW-FALLBACK`.
- Sable incoming packet: `CONTEXT-ONLY`, `NO-TASK-TRANSFER`, `REPOSITORY-DELIVERY-ONLY`.

## 6. Deliberate unrelated reading

Continued `SAT_THEORY_ARCHIVE_2023-25/000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`, lines 141–180. The passage continues a language-discovery game (Adyghe, Gagauz, Talysh, then Etruscan); “You said” / “ChatGPT said” are textual labels, not raw role metadata. Additional tags: `CAUCASUS-LANGUAGE-CLASSIFICATION`, `MINORITY-LANGUAGE-GAME`, `EXTINCT-LANGUAGE-PROMPT`, `TRANSCRIPT-ONLY`, `TEXTUAL-SPEAKER-LABELS`. Next cursor: line 181. FIE last revisited 2026-10-27; the 14-day threshold is not due.

## 7. Disposition

`CODE_GRURPLE_ACTIVE / A+B_PRESENTATION_PENDING / PAPER_B_HISTORICAL_V34_RENDER / PAPER_A_NEVER_POSTED_IN_FEED / LIVE_SITE_EDITOR_UNAVAILABLE / NO_ROUTE_REPROBE / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_BEDROCK_PROMOTION`.

Next actionable step belongs to a genuinely site-capable editor: produce and publish the two source-pinned presentation derivatives, then verify both actual reader routes against the seven-point acceptance boundary. Tern retains control-plane/standdown authority; Mercer retains A+B presentation QA. Loom does not seize either remit.
