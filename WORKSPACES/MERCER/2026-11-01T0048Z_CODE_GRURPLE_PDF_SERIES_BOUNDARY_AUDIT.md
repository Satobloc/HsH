# Mercer :48 | 2026-11-01T0048Z | Code Grurple PDF-series boundary audit

**Classification:** INTERNAL PRESENTATION-QA / SOURCE-PROVENANCE / SCHEDULER OBSERVATION. No manuscript, reader, renderer, feed, site, branch, PR, paper gate, BEDROCK or theory change.

## 1. Rotation, source identity and continuity

- Nominal UTC hour: h=504 (2026-11-01T00Z).
- Sequence: 5*504+4=2524.
- Selected ring identity: Mercer, index 16.
- Next identity: Ravel, index 17.
- Run key: `REVROT3-19-20261011:504:s4`.
- Next run key: `REVROT3-19-20261011:505:s0`.
- Existing :48 task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Task remains enabled with its original hourly America/New_York :48 DTSTART and RRULE.

Selection is deterministic routing only. No historical/current Mercer ChatGPT instance or thread is authenticated. This is a source-grounded current execution, not a claim that the historical Mercer instance participated.

### Mercer historical remit

The current Mercer README describes the operational role as index/retrieval QA, Nathan Direct methodology/source reconstruction, and documentation/navigation reconciliation. The direct-statement log records Nathan's 2026-09-13 wording on RMS as epistemic framing, SAT as a representational test case, the 4D-worldline project, the QCD braid, Minkowski-geometric mapping of known systems, minimally divergent controls, and residual-effect constraints.

The log is an assistant-maintained capture of direct statements, not the raw conversation export. Its exact raw conversation/message IDs remain explicitly `PENDING RAW-ID BACKFILL`. The Common provenance ledger also records the September 13 workspace/role authorization with raw IDs pending. Prior-conversation retrieval separately surfaced later direct user instructions to keep specific theory-development statements verbatim with conversation IDs, but did not recover the original conversation title or IDs. These source witnesses are not collapsed into one timestamp or one conversation.

The immediate Code Grurple assignment controls this run: **Paper A+B presentation QA only**. No manuscript content reopening, source hardening, second scientific review, prior-art work, or ordinary theory development.

## 2. Incoming Meridian handoff consumed after startup

Meridian's :36 run completed at 00:47:50.819718Z, after this :48 execution had started at 00:44:01.690163Z. Its addressed handoff was therefore not available at preflight and was consumed late.

Read and independently retrieved:
- Meridian report: `WORKSPACES/MERIDIAN/2026-11-01T0036Z_GRURPLE_ROUTE_OBSERVABILITY_AND_SCALE_CURSOR.md`, blob `ace7f0aa20229d4747c0623c5f528232c353e8da`.
- Exposure amendment 01: blob `aed0906529b25208d7c991843947e1dada5d78bb`.
- Meridian receipt: blob `2d6bd8d4cafe5f94cb7fa1478a632d3703eb2553`.
- Meridian-to-Mercer handoff: blob `904f7081e429d1a6dede17c5c7dee22f233ab24a`.

The handoff is `CONTEXT_ONLY / NO_TASK_TRANSFER`. It assigns no work, ownership, response obligation or paper role. It confirms that Meridian did not consume a Kestrel research payload, but its required receipt/checkpoint review exposed a compact Kestrel summary; strict content-blind independence relative to Kestrel was not certified. No Kestrel conclusion is adopted here.

Meridian's route attempts were already exhausted: Browser required an unavailable originating context; the web reader could not access either route; no Sites editor/publisher action was exposed. I did not repeat either route probe.

## 3. Paper A/B source and feed state

Current main before this report: `8025c4dd16058b1ca386ef84fca2617f085c1084`.

Current feed blob: `e3552fdac0f187b066b59a9742563094efffe011`.

| Paper | Pinned source | Source commit | Feed binding |
|---|---|---|---|
| A, Convergent Geometric Motifs R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9` | Exact match |
| B, Boundary Weak Emission R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | `731e2fb5888b0aec856fd9e31319c39746514239` | Exact match |

Paper A remains accepted R1. Paper B remains reviewed/originator-accepted R1. Both manuscript gates remain closed. Paper B's `site_version=34` and `posted_date=2026-09-23` are historical feed metadata, not current live-route evidence. Paper A has no site version and a null posted date.

The existing six-predicate route-state model still has only two evidenced predicates per paper: pinned source identity and feed binding. Derivative provenance, deployment identity, live readback and all-check acceptance remain NOT OBSERVED. The separate seven-point reader-facing acceptance checklist has not been completed. Neither route is classified as a rendering failure or a pass.

## 4. New static inventory: the PDF-series pipeline is not the current-route fix

I inspected the existing repo-side PDF publication path rather than proposing another tool.

Relevant existing surfaces:
- `PUBLIC_SITE/PAPERS/README.md`, blob `8fb50b142290f6b33879f4f9f3b90fdbcca3d81b`.
- `tools/publish_papers.py`, blob `d2cc622d1bdf79788e4e058494ab3d7d8636ad3f`.
- `.github/workflows/publish-paper-series.yml`, blob `561bf2735337b50c619748e119afa55d26c33afc`.
- `PUBLIC_SITE/generated/papers.json`, blob `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`.

The documented series pipeline expects an already-typeset, visually checked PDF plus per-paper metadata. The Python script validates metadata, PDF completeness/page readability and sequence uniqueness; it does not compile raw TeX or Markdown into a presentation-ready PDF. Its documented route is `reader.html?paper=<paper-id>`, while the two current Code Grurple entries point to `paper.html?id=convergent-motifs-r1` and `paper.html?id=boundary-weak-emission-r1`.

The current generated index is revision `98690a390fca65274ac4f9104a8b63f25ca47c25`, last updated 2026-10-21T13:19:55Z, and contains only Cruller-Rubin R0. Its PDF is `SAT_VISUALS/Cruller_Rubin_Stellar_Visibility_Sandbox_R0.pdf`, with recorded SHA-256 `568bc179bd08ada7d3f6e8af36e2f2a9c9139287a16a299541781f166923efeb`.

Directory and repository-tree inventory:
- `PUBLIC_SITE/PAPERS` contains the README, templates and `cruller-rubin`; no A/B paper directories or PDFs.
- `PUBLIC_SITE/STAGING` contains its manifest and image material; no A/B derivatives.
- The `PUBLIC_SITE` root does not contain a local `paper.html` or `reader.html` implementation.
- The recursive HsH Git tree contained 10,147 entries and was not truncated. No PDF path matching the A/B identifiers or names (`convergent`, `boundary-weak`, `grurple-a/b`) was found. The only matching public-paper-series PDF is the Cruller-Rubin R0 asset.

**Conclusion:** the existing PDF-series path is a real reusable pipeline for pre-typeset PDF papers, but it is not evidence of a TeX/Markdown renderer and is not an authorized workaround for the current `sandbox_manuscript` route. Moving A/B into `reader.html?paper=` would create or rely on a different route without proving compatibility with the existing `paper.html?id=` contract. Code Grurple's no-parallel-reader boundary remains controlling.

The runtime has TeX and Pandoc executables, but no local HsH checkout. A locally generated PDF would not establish a deployed build or live route readback, so no PDF was generated.

## 5. Site capability and publication status

The current available-tool inventory exposes GitHub repository access but no ChatGPT Sites publisher/editor action. The prior Browser/web access attempts are documented by Meridian; they were not repeated. No route was observed in this run.

Status for both papers: `ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED` at the live layer; source pin and feed binding remain verified. This does not imply the routes are broken.

No public issue was submitted because this is an internal route-architecture clarification, not a new public-safe paper result. No duplicate issue, public artifact, renderer change, feed change, site deployment, branch, PR or task was created.

## 6. Scheduler and handoff evidence

All five original automation IDs remain enabled on their original hourly America/New_York phases :00, :12, :24, :36 and :48. No task, ID, prompt, title, schedule, phase, enabled state or cadence changed; no sixth task.

Observed h=504 execution timing:

| Phase | Worker | Scheduled UTC | Started UTC | Completed UTC |
|---|---|---|---|---|
| :00 | Tern | 00:00 | 00:28:15.183519 | 00:43:30.685134 |
| :12 | Morrow | 00:12 | 00:11:57.486691 | 00:23:10.118770 |
| :24 | Kestrel | 00:24 | 00:27:11.917731 | 00:37:42.342775 |
| :36 | Meridian | 00:36 | 00:38:15.455249 | 00:47:50.819718 |
| :48 | Mercer | 00:48 | 00:44:01.690163 | In progress at final peek |

Observed overlap intervals:
- Tern :00 with Kestrel :24: 567.159 seconds.
- Tern :00 with Meridian :36: 315.230 seconds.
- Meridian :36 with Mercer :48: 229.130 seconds.

Maximum observed concurrency in this hour was two executions. The :48 execution began 238.310 seconds before its nominal slot. The :00 execution began 1,695.184 seconds late.

The :48 automation peek initially returned run ID `49005a72-9a6f-8324-9ed3-0161c11380df`; a later read returned `49005e70-e5f8-8327-9deb-76333734c308` for the same scheduled occurrence and identical `started_at=00:44:01.690163Z`. No distinct attempt ID is exposed. This is recorded as a run-ID association anomaly, not as proof of two separate attempts.

The :36 Meridian handoff was created after this :48 run began and was consumed after startup. No incoming handoff from Kestrel to Meridian existed in the :24 receipt. The current :48 run remained `in_progress`, with no terminal completion timestamp and no authenticated current `chat_ref` at final inspection.

A concise Comptroller notice is appended to Tern's existing inbox. It requests no schedule or task action; it preserves the observed intervals and run-ID ambiguity for the scheduler owner.

## 7. Durable scope and next cursor

The next useful Code Grurple operation remains with a site-capable implementer who can repair the existing shared `sandbox_manuscript` route, bind the exact TeX/Markdown source identities to their format adapters/parser/semantic IR/renderer/dependency versions, record derivative digests and deployed build identity, then read both actual public routes and complete the existing acceptance checklist.

Do not substitute the PDF-series reader route unless the authorized site owner explicitly demonstrates that it is the same approved route contract. Do not reopen either manuscript. Do not stand down Code Grurple until both actual routes pass, or Nathan explicitly stands it down earlier.

Other controls:
- Code Grurple remains ACTIVE; ordinary research remains BACKSEAT/HOLD.
- Orson retains protected P1 cognition ownership and the November 9 gate.
- P2 November 30 and P3 December 14 remain separate.
- No new Lean theorem: this run introduced no mathematical/geometric proposition; the route-state table is an evidence checklist, not a new theorem.
- No physical calculation, fit, prediction, synthetic fixture, model inference or human-subject experiment.
- No BEDROCK/theory promotion or SAT-O/Blockwave equation change.
- FIE rereview is not due; last full review 2026-10-27.
- Unrelated-reading break was completed in Mercer Run 149 at TheTANGLE.txt lines 1121-1160; next cursor remains line 1161.

## 8. Source/control hashes

- BEDROCK: `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` (568 lines read).
- Steering Charter 2026-10-26: `5f4263381afcb065e9062d5b5885593d0baa58db`.
- Three Paper Campaign 2026-10-26: `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`.
- New Instance Start Here: `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`.
- Revival Rotation V3: `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Thread-first routing rule: `e79707587914edb76afca1c32f9f4dad4d0324b7`.
- Task branch graph: `3c341c616aa893bf56ad5ad5919e09a17e0c2b46`.
- Code Grurple roster: `cc96c0bfafc95c54e7960899c7306031e5abce17`.
- Presentation Gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Reader Routing Registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- Presentation Contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`.
- Mercer README: `817ce5c255e9c88aa0c63cb43670690b039f1cdb`.
- Nathan Live Theory-Development Log: `6fa4047c89bf1f028f9e2369c3ad6a8d5987d44b`.
- Nathan Directives Provenance: `992368cd3790062372a284c044b972bd0fc3e60e`.

No raw Mercer conversation ID or message UUID was invented. The direct-statement log remains a live provenance capture, not an immutable raw-export substitute.
