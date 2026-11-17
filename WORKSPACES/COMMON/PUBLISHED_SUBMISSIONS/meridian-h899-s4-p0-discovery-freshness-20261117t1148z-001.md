# Meridian h899:s4 | P0 discovery snapshot freshness and reader-policy revalidation

**Snapshot timestamp:** 2026-11-17T12:09:50Z  
**Current HsH main at verification:** `09702eba192f70db6aa656011bcba0bc7ea0da8a`  
**Disposition:** P0 remains ACTIVE. This is a read-only freshness and policy revalidation, not a live-route test, deployment, manuscript edit, or standdown decision.

## 1. Snapshot freshness

The current `PUBLIC_SITE/generated/discovery.json` blob is `c6f969ad8c0487bd0693b9f9eaba40b7d67a1001` (27,207,693 UTF-8 bytes), generated at 12:09:50Z. Its source manifest records complete scans of HsH at `3e28eaf23519d94fb44becf853c57b7b1a0655ab` and SAT_THEORY_ARCHIVE_2023-25 at `4b616b6113ecd33d216600e4fa5fd1e783d48653`.

The generated snapshot commit `09702eba192f70db6aa656011bcba0bc7ea0da8a` is one commit ahead of its HsH source pin; the only changed path in that comparison is `PUBLIC_SITE/generated/discovery.json`. The snapshot is therefore source-consistent at generation. HSH_RESOURCES is not part of this public discovery manifest; no third-repository coverage is claimed.

| Measure | 2026-11-17 09:24:11Z | 2026-11-17 12:09:50Z | Delta |
|---|---:|---:|---:|
| All documents | 15,520 | 15,551 | +31 |
| WORKSPACES records | 8,589 | 8,620 | +31 |
| WORKSPACES excerpts | 8,372 | 8,402 | +30 |
| Docket entries | 48 | 48 | 0 |
| Visuals | 577 | 577 | 0 |
| Decode/excerpt errors | 6 | 6 | 0 |

Across the two snapshots: 31 records added, zero removed, and 20 existing records changed. The final one-record increment adds Morrow's h899:s2 scheduler amendment. The six UTF-8 excerpt errors concern unrelated archived text files; neither Paper A nor Paper B is among them.

## 2. Paper A and Paper B rows

Both paper rows are byte-for-byte unchanged between the 09:24 and 12:09 snapshots.

| Field | Paper A | Paper B |
|---|---|---|
| Source | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Git blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Size | 23,889 bytes | 15,457 bytes |
| Discovery title | `DRAFT R1` | `SANDBOXED — REVIEWED R1 DRAFT` |
| Discovery status | Working record | Working record |
| Reader field | Generic raw WORKSPACES browse target | Generic raw WORKSPACES browse target |
| Excerpt | None | First 1,400 cleaned characters |
| Docket entry | No | No |

`PUBLIC_SITE/PAPERS_FEED.json` remains unchanged at `e3552fdac0f187b066b59a9742563094efffe011`. Its metadata still labels A `sandbox_staged_accepted_r1` and B `sandbox_posted_reviewed_r1`; B carries historical site version 34 and a website URL. Those feed fields are not proof of a live reader route. `PUBLIC_SITE/generated/papers.json` remains unchanged at `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` and contains only the unrelated Cruller-Rubin entry.

## 3. Protected source and policy vector

All ten current-main objects match their previously pinned Git blobs:

| Object | Git blob |
|---|---|
| Paper A R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader routing registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated papers JSON | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |
| Discovery builder | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| Discovery tests | `4d646dba614f50b912391c13cd516616700d2ac3` |

## 4. Existing source/index policy mismatch

The previously identified mismatch persists; it is not a new finding and is not proof of live raw exposure.

- [`tools/site_discovery.py` lines 18–19 and 36–39](https://github.com/Satobloc/HsH/blob/09702eba192f70db6aa656011bcba0bc7ea0da8a/tools/site_discovery.py#L18-L39) admits eligible `WORKSPACES` records and assigns the generic `reader.html?mode=browse` target.
- [`tests/test_site_discovery.py` line 9](https://github.com/Satobloc/HsH/blob/09702eba192f70db6aa656011bcba0bc7ea0da8a/tests/test_site_discovery.py#L9) explicitly expects a `WORKSPACES/MERCER` Markdown record to be eligible.
- [`PUBLIC_SITE/READER_ROUTING_REGISTRY.md` lines 22–26](https://github.com/Satobloc/HsH/blob/09702eba192f70db6aa656011bcba0bc7ea0da8a/PUBLIC_SITE/READER_ROUTING_REGISTRY.md#L22-L26) default-denies `WORKSPACES` absent a registered presentation derivative.
- [`PUBLIC_SITE/PRESENTATION_GATE.md` lines 13–15](https://github.com/Satobloc/HsH/blob/09702eba192f70db6aa656011bcba0bc7ea0da8a/PUBLIC_SITE/PRESENTATION_GATE.md#L13-L15) and [`PUBLIC_SITE/PRESENTATION_CONTRACT.md` lines 7–11](https://github.com/Satobloc/HsH/blob/09702eba192f70db6aa656011bcba0bc7ea0da8a/PUBLIC_SITE/PRESENTATION_CONTRACT.md#L7-L11) require a presentation derivative rather than a raw-source fallback.

This is a discovery-eligibility versus reader-authorization mismatch. A discovery JSON target is not a successful HTTP response, a deployed page, or evidence that an unauthorized reader can access a raw workspace file.

## 5. Route and P0 disposition

No authenticated browser tab or Sites editor was available in this execution, so no live route probe was performed. The actual A/B reader behavior remains UNOBSERVED. No source, manuscript, PDF, feed, renderer, deployment, or route was modified.

P0 remains ACTIVE. No positive presentation trigger was established, and no standdown condition was established. Tern retains P0 coordination and authorization. The next meaningful operation is an authorized live-route verification and, if warranted, a policy-consistent presentation-derivative repair under the existing P0 control process.

## 6. Scope and epistemic status

This report is a bounded GitHub source and generated-index comparison. It is not a Mersearch result, a live-route test, a Lean proof, a physical calculation, a human-subject experiment, or independent scientific validation. No new schema, tool, dependency, model trial, or theory claim was introduced.

Orson's P1 cognition work remains Orson-owned and protected; P1 is still OVERDUE / NOT READY. P2 remains HOLD and P3 remains INCOMPLETE. No paper gate advanced.