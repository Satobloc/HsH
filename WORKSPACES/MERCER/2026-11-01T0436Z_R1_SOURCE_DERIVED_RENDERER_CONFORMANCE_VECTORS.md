# Mercer | 2026-11-01T0436Z | R1 source-derived renderer conformance vectors

**Classification:** INTERNAL CODE-GRURPLE PRESENTATION QA / SOURCE-PROVENANCE / LOCAL EXCERPT DIAGNOSTIC. No manuscript, feed, renderer, site, paper gate, BEDROCK, SAT-O/Blockwave equation, theory or physical-model change.

## 1. Rotation, identity and continuity

- Nominal UTC hour: h=508.
- Sequence: 5*508+3=2543.
- 2543 mod 19 = 16.
- Selected: Mercer, ring index 16.
- Next: Ravel, ring index 17.
- Run key: REVROT3-19-20261011:508:s3.
- Next run key: REVROT3-19-20261011:508:s4.

The historical Mercer ChatGPT thread is not authenticated. The current Mercer README/checkpoint describe archive/index/retrieval/provenance/documentation QA and Nathan Direct source reconstruction. The 2026-09-13 live-theory log preserves quoted Nathan statements, but raw conversation and message IDs remain explicitly pending. These assistant-maintained summaries are not a recovered verbatim specialist charter. No historical-instance participation is claimed.

The current Code Grurple roster is the operative task boundary: Mercer is assigned **Papers A+B presentation QA only**. No manuscript-content reopening, source hardening, second scientific review, prior-art work or ordinary theory development.

## 2. Scheduler and predecessor

The existing :36 task remains enabled and unchanged:

- ID: 6a9f52b69ec08191b0a2ba24a074f781.
- Title: Workshop Relay :36 | Worldtube.
- Schedule: hourly, America/New_York, exact original DTSTART and :36 phase.
- No prompt, task, ID, phase, cadence or enabled-state modification; no sixth task.

Current run ID: 4e758a29-faf8-832e-b3d0-de668959689c.
Scheduled: 2026-11-01T04:36:00Z.
Started: 2026-11-01T04:35:30.985079Z.
Initial final-state inspection is deferred to the end of the run; no terminal completion is presumed.

The incoming Meridian :24 handoff was read:
- Receipt blob 05fa39c6567ef4e6347c8d569836c92afc716499.
- Handoff blob b8dfdc73cfc981065b92b9ed86bc67465f83be61.
- Classification: context only, no task or ownership transfer.
- It confirms Code Grurple ACTIVE, both routes ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED, no Sites editor action, and no authorization to use the separate PDF-series reader as a workaround.

The preceding Morrow :00 receipt and handoff were also read. The :12 task is currently disabled according to the live automation roster; it was not re-enabled or otherwise changed.

## 3. Controls and current branch

Read the live BEDROCK (blob 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c, 568 lines), Steering Charter 2026-10-26, Three Paper Campaign 2026-10-26, onboarding, Revival Rotation V3, thread-first routing, current workflow orientation, branch map, task graph, automation/scheduler controls, Code Grurple roster, Presentation Gate, Reader Routing Registry, Presentation Contract, Mercer README, continuity, Trial Checkpoint, INBOX, historical cutoff handoff, and Nathan live-theory development log.

Pre-write HsH branch: main.
Observed main head: d3364a3f9ceb1c5463743d36d73eb274c6712fd7, 10 commits beyond Morrow's 04:00 pre-write head 2f8f3487d80d7acd1eef8794f1d5d4372664593a, including intervening operational receipts/handoffs. The only other observed branch was Sable's existing rotation-auditor research branch. No Mercer branch was created.

Current Mercer Trial Checkpoint blob before this run: 72a33a0263e73dc205154eb489a0ab7314d3c7d5, marked current through Run 148. The preceding :48 receipt describes Run 149; this run is recorded as Run 150.

### Mersearch status

All four shared Mersearch lanes are occupied and were left untouched:
- Lane 1: Calder empirical-charter source recovery.
- Lane 2: archive optics harvest.
- Lane 3: Sable J3/J2 original-source crosswalk.
- Lane 4: Tern Comptroller charter source recovery.

No new request, overwrite, retry or duplicate was made. This run's active assignment is presentation QA, not a new theory-source search. The existing PDF-series pipeline and the installed free Pandoc/TeX tools were inspected instead of proposing new tooling.

## 4. Exact source and feed identity

The exact current R1 source blobs were retrieved from HsH main and matched the pinned Code Grurple identities.

| Paper | Source blob | Feed status | Source format |
|---|---|---|---|
| A, Convergent Geometric Motifs | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | sandbox_staged_accepted_r1 | TeX |
| B, Boundary Weak Emission | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | sandbox_posted_reviewed_r1 | Markdown |

Feed blob: e3552fdac0f187b066b59a9742563094efffe011, updated 2026-10-21. Both entries use site_display=sandbox_manuscript, version R1. Their exact manuscript paths and refs are preserved in the feed. Paper B's site version 34 and posted date 2026-09-23 are historical metadata, not live deployment proof.

Paper A's feed caveat: accepted internal Grurple review/provenance gates are not scientific validation, novelty clearance, prior-art clearance or external peer review.

Paper B's feed caveat: no demonstrated apparatus sensitivity, particle identity, derived emission mechanism or experimental result is claimed.

## 5. Source-derived renderer conformance vectors

The public report contains the complete source-specific vector inventory. The key results are:

### Paper A

The 146-line TeX source has 10 sections, 4 subsections, 5 paragraph test labels, one abstract, two display equation environments, four inline-dollar math spans, one three-column booktabs table (header plus four data rows), and eleven manually enumerated references.

Sandbox status is encoded twice in the source: a preamble watermark and an in-body boxed notice. The paper also contains an unresolved \mathcal R_4? placeholder and explicitly says that no such map is established. The renderer must preserve the question mark and the surrounding non-establishment statement.

The source has no figure environment, includegraphics, cite command or ref/label cross-reference commands. The reference list is manual, not a citation-macro graph.

### Paper B

The 137-line Markdown source has 17 headings (2 H1, 11 H2, 4 H3), two blockquotes, six B0-B5 list items, two inline math spans using \(...\), three display math blocks using \[...\], and ten numbered references.

It contains no dollar-delimited math, fenced code, Markdown table, inline Markdown link or HTML tag. These are properties of the two pinned sources only, not a universal format claim.

## 6. Actual local conversion diagnostics

The runtime has Pandoc 3.1.11.1, pdfTeX 3.141592653-2.6-1.40.26 (TeX Live 2025/dev), and Poppler pdftotext 25.06.0. No dependency was added. The tests used exact source excerpts, not the complete manuscript files and not the hosted site renderer.

### Paper B math excerpt

- Default pandoc -f markdown -t html5 produced zero math nodes for the excerpt. The source uses single-backslash TeX delimiters, not dollar math.
- pandoc -f markdown+tex_math_single_backslash -t html5 --mathjax -s produced five math nodes for the excerpted set: two inline and three display.
- Pandoc's internal MathML conversion warned that \rm in R_{\rm bkg} was unsupported.
- MathJax-mode output retained the raw \rm token and the third boundary-to-detector chain in TeX form. Client-side MathJax execution was not tested.

This is a concrete parser requirement: a dollar-only Markdown math parser would miss every math expression in this Paper B source.

### Paper A LaTeX excerpt

- A one-page excerpt containing the actual status box, boxed equation, table and \mathcal R_4? equation compiled with pdfTeX, exit code 0.
- The excerpt compile emitted a 10.8 pt overfull hbox warning and font-size substitution warnings. This is not a full-paper compile or author visual acceptance.
- Pandoc's LaTeX-to-HTML conversion rendered the five-row table and retained two equations as raw TeX math nodes, but the tested HTML omitted the in-body SANDBOXED WORKING PAPER box text and did not carry the preamble watermark.

This is a diagnostic of the tested Pandoc conversion path, not evidence that the live site has the same defect. It demonstrates why sandbox status cannot rely solely on TeX-specific watermark/box constructs.

## 7. Architectural improvement

The new deliverable is a source-derived golden-test vector for the two actual R1 formats, rather than another generic route-state checklist.

The site-capable implementer now has exact source-specific assertions:
- Paper A: preserve title/abstract/heading hierarchy, boxed status, both equations, all five table rows, eleven references and the unresolved R_4? marker.
- Paper B: preserve heading hierarchy, both status/proposal blockquotes, B0-B5, two inline and three display single-backslash math expressions, and ten references.
- Shared: derive a visible sandbox/review status affordance from the feed metadata independently of parser support for TeX watermark/box or Markdown status blocks; retain source status too where possible.
- Preserve source hash, feed status, parser/renderer version, derivative digest, deployment identity and live readback as distinct evidence.

This does not amend the existing presentation gate or authorize a renderer change. It gives the existing gate concrete test cases drawn from the pinned manuscripts.

The existing tools/publish_papers.py was inspected. It validates already-typeset PDFs and metadata for the separate reader.html?paper= series. It does not compile raw TeX/Markdown and is not an authorized workaround for the current sandbox_manuscript / paper.html?id= routes.

## 8. Live-site and scientific boundaries

- No Sites editor/publisher action is exposed in this runtime.
- Prior route probes were not repeated.
- Both live routes remain ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED, not a rendering failure and not PASS.
- No full-paper compile, full document conversion, visual review, deployment or live readback occurred.
- No manuscript, feed, renderer, site, presentation gate, theory, BEDROCK, SAT-O/Blockwave equation or physical model changed.
- No Lean theorem was introduced: this was source-syntax/rendering QA, not a new mathematical proposition. The paper's equations were not validated.
- No physical calculation, fit, prediction or experiment was performed.
- No new tool, dependency, branch or PR was created.
- P1 November 9, P2 November 30 and P3 December 14 remain separate. Orson's protected P1 cognition remit remains untouched.
- Code Grurple remains ACTIVE; ordinary research remains BACKSEAT/HOLD.
- FIE rereview is not due; last full review 2026-10-27.
- The preceding Mercer unrelated-reading break covered TheTANGLE.txt lines 1121–1160; next cursor 1161. No redundant break was repeated.

## 9. Publication and next cursor

Public-safe artifact submitted through the existing issue publisher:

- Issue #1193.
- Submission ID mercer-r1-renderer-source-vectors-20261101t0436z-s3-001.
- Expected path WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-r1-renderer-source-vectors-20261101t0436z-s3-001.md.
- SHA-256 f5c5782dcda29c168780212792a5eb6b25e04489ac08d0e0c730c4da09749e37.
- Initial status: SUBMITTED_NOT_VERIFIED; final Action/readback check required before marking verified.

The next identity is Ravel. The optional handoff is context only; no task, paper ownership or response obligation transfers. Repository-inbox delivery, if completed, is not ChatGPT-thread delivery or acknowledgment.

**Next useful operation:** a site-capable implementer uses these exact golden vectors to repair the existing shared route, then verifies both live reader URLs against the current acceptance gate. Preserve both pinned R1 manuscripts. Do not substitute the PDF-series reader route.
