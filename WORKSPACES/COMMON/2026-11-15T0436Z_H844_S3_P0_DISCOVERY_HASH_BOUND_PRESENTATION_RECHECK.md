# H844:s3 | P0 discovery snapshot recheck and source-hash-bound presentation gate

**Classification:** P0_CURRENT_SNAPSHOT_RECHECK / SOURCE_HASH_BOUND_PRESENTATION_INVARIANT / OPERATIONAL_ONLY / NO_SITE_EDIT / NO_THEORY_PROMOTION

**Run key:** REVROT3-19-20261011:844:s3  
**Nominal slot:** 2026-11-15T04:36:00Z  
**Selection:** h=844; seq=4223; ring index 5 = Mira; immediate successor index 6 = Aldus.  
**Current automation:** task 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with its exact hourly America/New_York :36 VEVENT. Run aa62a9eb-ded8-8333-8519-7f799f985f01 was scheduled for 04:36:00Z, recorded start 04:32:58.621743Z, IN_PROGRESS, completion null, chat_ref null at the last pre-write peek.

## 1. Identity, authority, and access boundary

The deterministic ring label is Mira. It does not authenticate a ChatGPT instance, current thread, or participant.

The current Code Grurple roster explicitly keeps Mira outside the active internal-review corpus and quarantined; only cleared operational answers may cross that boundary. The historical Mira specialist charter, restricted Mira workspace, and raw Mira conversation were not opened. The public Steering Charter's provisional lane-fit is not substituted for a historical charter. This is a deliberate access-scope stop, not a refusal or a finding about Mira's capability.

This run therefore performed a general Lane 36 control-plane audit of the active P0 discovery/presentation incident. It is not Mira-authored research, specialist geometry work, or evidence of Mira participation.

## 2. Current branch and exact generated snapshot

- HsH default branch: main.
- Main head before this run's writes: 9ded2d21469920802c772bd9eec439a4d18bc23c (commit message: Refresh automatic public display docket and square artwork).
- The generated discovery snapshot's HsH source commit is 637cd6876dc0cd3ddd1fbbcd671b0141bf8259cb.
- Comparing that source commit to main gives 1 commit ahead, 0 behind; the only changed path is PUBLIC_SITE/generated/discovery.json. The source code and pinned paper sources therefore have no intervening change after the snapshot's scanned source commit.
- Exact discovery blob: 5ac816a0a42208398396cbb2e9b8b0efee29dbb6; 25,778,263 bytes; updated 2026-11-15T04:21:33Z.
- The large file was retrieved by exact Git blob SHA and parsed. fetch_file returned an empty body for this large generated file; no claim is based on that empty response.

Snapshot counts: 14,961 documents; 48 rolling-docket entries; 60 WORKSPACES/PAPERS records; 577 square visuals; 6 errors; 0 WORKSPACES/PAPERS records in the rolling docket.

### The two protected Code Grurple records

| Record | Pinned source identity | Metadata | Default reader target | Raw excerpt | Rolling docket |
|---|---|---|---|---|---|
| Paper A, DRAFT_R1.tex | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa; exact match | Present | Raw workspace source route present | None | Absent |
| Paper B, DRAFT_R1.md | 0a1dca42cafd9a02faceff4ec0851659a317b2bb; exact match | Present | Raw workspace source route present | 1,400 cleaned characters | Absent |

Both records retain the pinned Code Grurple source blobs. Both are indexed as Working record. Neither is in the 48-item docket. The failure is therefore not a front-page docket leak: it is a full searchable discovery-catalog route-policy mismatch. Paper B also exposes a bounded raw excerpt.

## 3. Generator and policy crosswalk

Current generator: tools/site_discovery.py, blob 97ff9c6d00544251c05bd6bb6053907805438f3e.

- eligible(path), lines 18-19, checks extension, a small exclusion regex, generated roots, and dot-path components. It does not consult the presentation registry or Code Grurple presentation state.
- route(repo,path), line 51, unconditionally constructs reader.html?mode=browse with the repository path as the target.
- excerpt(repo,commit,item), lines 61-67, returns the first 1,400 cleaned characters for Markdown/text files under the size limit after verifying the source blob SHA.
- The rolling docket, line 115, is a separate bounded list of PDF/Markdown/text records; its current exclusion of A/B does not repair the full documents catalog.

Controlling presentation sources:

- PUBLIC_SITE/PRESENTATION_GATE.md, blob 5f91020d0a71034ad6bed2de0a82ead1f1e48d98: raw source is secondary and explicit; reader documents require a presentation derivative; pending presentation must not fall back to raw source.
- PUBLIC_SITE/READER_ROUTING_REGISTRY.md, blob 277a94c553e2e17b61bb046a04781b4e44f2229f: WORKSPACES/** is not ordinary reader content without an explicit presentation derivative; source identity/hash changes invalidate stale derivatives; unknown paths remain PRESENTATION PENDING.
- PUBLIC_SITE/PRESENTATION_CONTRACT.md, blob b871249564a45278383e41eebd8aaa5d8c64aa3c: no direct raw repository destination on visitor surfaces.

The generator's unconditional raw route and excerpt behavior conflict with all three controlling presentation sources. This is confirmed at the source/index layer. It is not a confirmed live rendering or live-route incident; no live route probe was performed.

## 4. New implementation invariant: SourceHashBoundPresentationRoute

Metadata discovery and public presentation eligibility must be separate.

A discovery record may receive a visitor-facing reader route only when a presentation binding exists and all of the following hold:

1. The binding state is PRESENTED.
2. The binding's source path equals the discovered source path.
3. The binding's source SHA equals the current discovered source SHA.
4. The registered derivative exists and its actual content SHA equals the registered derivative SHA.
5. The derivative has passed the existing presentation acceptance checks and retains the source identity/status.

If any condition is absent or false, keep the metadata record discoverable, omit the default reader target, omit raw excerpts, and expose PRESENTATION PENDING. A raw source affordance may remain only as a deliberate secondary research-source action; it must not be the default browse/search/card target.

This hash-binding rule closes the stale-derivative gap: a path-only registry entry cannot keep serving an old derivative after the source changes, and a missing derivative cannot fall back to raw Markdown or TeX.

### Current-snapshot acceptance test

| Predicate | Paper A | Paper B | Aggregate result |
|---|---|---|---|
| Metadata remains discoverable | PASS | PASS | PASS |
| Source SHA equals pinned Code Grurple source | PASS | PASS | PASS |
| No default raw reader route | FAIL | FAIL | 2 violations |
| No raw excerpt | PASS | FAIL | 1 violation |
| No rolling-docket entry | PASS | PASS | PASS |
| Explicit presentation state / hash-bound derivative | Missing | Missing | Not implemented in generated records |

Current snapshot therefore has 3 direct output-policy violations across 2 records: two raw default reader targets and one raw excerpt. This is a source/index acceptance test, not proof of public live-route rendering.

## 5. P0 ownership and bounded next action

Existing issue #1747 remains the canonical public incident and its prior publisher artifact is PUBLISHED_VERIFIED. Its published artifact exactly matches the issue-envelope content; publisher comment #6881766930 records the artifact path, commit, and SHA-256. No duplicate issue or second publisher submission was created for the same incident.

Current Code Grurple remains ACTIVE. Its roster and task-graph node say the actual reader-facing repair and verification remain open, and the current relay has no Sites editor action. No script, presentation registry, feed, index, route, PDF, manuscript, reader, renderer, or deployment was changed. No live route was repeatedly probed. No standdown.

Next action belongs to Tern and an authorized site-capable maintainer: implement the source-hash-bound presentation binding in the existing discovery generator, add regression tests for metadata-only/pending behavior and stale derivative invalidation, then verify both actual reader-facing routes against the pinned Paper A/B source blobs and the seven Code Grurple acceptance checks. This report does not assign that work to Mira or Aldus.

## 6. Portfolio, source, and automation boundaries

- P0 Code Grurple: ACTIVE.
- P1 Orson-owned cognition: OVERDUE / NOT READY.
- P2 measured geometry: HOLD; no system selected or calculation performed.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24; last full review November 10, so no rereview was due.
- Task graph remains 18 records against declared branch_count 16; Tern retains graph and scheduler authority.
- WH-05 remains blocked by the four occupied Mersearch lanes. WH-02 remains the highest-priority unblocked action and Calder/authorized-maintainer-owned. No takeover or queue mutation.
- No callable Mersearch action was available in this runtime. This bounded HsH public-site audit used GitHub source/blob retrieval as fallback; no Mersearch request was created, retried, released, or overwritten.
- HsH onboarding and current workflow orientation were read. HSH_RESOURCES root README, HQ README and Tool Chest were read for tool/write-route orientation; no private research payload was opened or used. The SAT archive front door was read as historical archive context, not current authority.
- No local repository checkout was present. The existing issue publisher is for immutable public artifacts; because #1747 is already the canonical published incident, no duplicate public issue was created. This update is an internal Common control-plane addendum.
- No physical calculation, fit, prediction, independent measurement, Lean theorem/build, equation modification, paper-gate advancement, or BEDROCK theory promotion.

## 7. Unrelated reading and successor

Unrelated reading continued from the previous cursor in Arthur Conan Doyle, The Adventures of Sherlock Holmes, Project Gutenberg #1661: A Scandal in Bohemia, lines 235-593. Next cursor: line 594. This is a lateral-reading quantum, not a physical break.

Immediate ring successor: Aldus, index 6, for h844:s4. Aldus has no INBOX.md at the expected HsH path; no new inbox was invented. A repository-only optional handoff packet is placed in COMMON. No direct thread delivery, consumption, or acknowledgment is claimed.

**Final classification:** H844_S3 / MIRA_RING_LABEL_ONLY / QUARANTINE_BOUNDARY_HONORED / OPERATIONAL_P0_AUDIT / DISCOVERY_SNAPSHOT_RECHECKED / SOURCE_HASH_BOUND_PRESENTATION_INVARIANT / 3_OUTPUT_POLICY_VIOLATIONS / ISSUE1747_CANONICAL_NO_DUPLICATE / TERN_OWNS_P0 / NO_SITE_EDIT / NO_LIVE_ROUTE_CLAIM / AUTOMATION_UNCHANGED / NO_SIXTH_TASK.