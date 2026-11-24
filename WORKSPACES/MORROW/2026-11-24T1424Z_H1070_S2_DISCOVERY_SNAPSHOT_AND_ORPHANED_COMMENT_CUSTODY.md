# Morrow h1070:s2 | Discovery snapshot and orphaned run-label source custody

**Date:** 2026-11-24  
**Run key:** `REVROT3-19-20261011:1070:s2`  
**Nominal slot:** 2026-11-24T14:24Z  
**Actual invocation start:** 2026-11-24T14:51:13.541915Z  
**Routing:** h=1070; seq=5352; 5352 mod 19 = 13, Morrow; next index 14, Kestrel. This is deterministic routing only, not authenticated worker or thread identity.

**Disposition:** `SOURCE_CUSTODY_RECONCILIATION_COMPLETE / DISCOVERY_SNAPSHOT_CURRENT_AT_GENERATION / P0_RECORD_SAFETY_FAIL / ORPHANED_PUBLIC_RUN_LABEL_NOT_AUTHENTICATED / NO_THEORY_OR_PHYSICAL_WORK`.

## 1. Historical role and authority

Raw Morrow export: conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, Git blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`, 697 mapping nodes and 17 user-role messages.

- Nathan's 2026-09-08 user-role message `402ade01-7116-4efb-9b14-31e477754458` gives the provisional “Team Archivist” remit: appraise the broader corpus, prepare a flexible action plan, and coordinate with GitKeeper.
- The 2026-09-13 user-role message `934e87de-4e61-4622-a0ea-e5047aa235c6` explicitly says stop theory work immediately and quarantine produced theory documents.
- The later 2026-09-13 trial invitation `99ae959b-fbeb-4c1e-9326-a6723c2b9557` permits archive, maintenance, training and reconstruction work. It does not expressly release the earlier theory stop.

No standalone signed Morrow specialist charter or authenticated current Morrow thread was recovered. The current role is therefore a source-grounded reconstruction under the provisional Team Archivist/source-custody remit. Morrow's theory stop remains active. Existing Source Identity Gate Layers 11 (speaker/person attribution), 15 (authority/stop/release), 16 (workflow/artifact custody), and 19 (publisher write-conflict classification) already cover this case; no duplicate layer was added.

## 2. Latest discovery snapshot: exact retrieval and source binding

The ordinary Contents endpoint returned an empty body for the large discovery file. The documented alternate Git-blob route succeeded and the full JSON parsed.

- Current HsH main at the source check: `a5da91a6a3d4164918d220f4fc0f55a8bc2730ab`, created 2026-11-24T14:49:04Z by `github-actions[bot]`; commit message “Refresh automatic public display docket and square artwork”.
- Discovery blob: `53a389f953dc6ed3b8550b36266ddf67656895e8`.
- Snapshot `updated`: 2026-11-24T14:48:59Z.
- Embedded HsH source: `bae2d5721d3d86433c9cd1d7f55cd225777eb684`, status `complete`.
- Embedded SAT archive source: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`, status `complete`; this matches the current SAT archive main head observed in the repository commit search.
- HsH compare from embedded source to main: one commit ahead, zero behind, merge base equals the embedded source, and the only changed path is `PUBLIC_SITE/generated/discovery.json`. Thus the snapshot was source-current at generation; the extra main commit is the generated snapshot itself.

### Parsed counts

| Measure | Result |
|---|---:|
| Total documents | 17,761 |
| HsH `WORKSPACES/**` records | 10,829 |
| Workspace records with generic reader targets | 10,829 |
| Workspace records missing `presentation_state` | 10,829 |
| `PRESENTATION_PENDING` workspace records | 0 |
| Workspace excerpts | 10,582 |
| Workspace records without excerpts | 247 |
| Rolling docket entries | 48 |
| Docket entries resolving to catalog records | 48/48 |
| Visuals | 577 |
| Visuals flagged `square=true` | 417 |
| UTF-8 excerpt errors | 6 |

The six excerpt errors are decode failures in legacy text files; they do not prove that the source files are absent. The discovery snapshot's repository list contains HsH and the SAT archive, not HSH_RESOURCES. HSH_RESOURCES remains a separate internal/reference repository and was not opened beyond its root README and AI/LLM start page.

**P0 disposition:** freshness PASS at 14:48:59Z; record safety FAIL; live visitor-route acceptance NOT OBSERVED. A successful snapshot build does not supply `presentation_state`, remove generic raw reader targets, or prove live route behavior. No route probe, deployment, release or standdown was performed.

## 3. Existing P0 evidence and orphaned public comment

Existing issue [#1747](https://github.com/Satobloc/HsH/issues/1747) is the current P0 coordination surface. Its last snapshot comment before this run was #7134687628 (14:39:53Z), so the 14:48:59Z snapshot is a genuinely newer observation.

On [Kestrel issue #2503](https://github.com/Satobloc/HsH/issues/2503), public comment #7134632192 bears the heading “Morrow h1070:s2 source-custody clarification”. It is attributed by GitHub to account `Satobloc`. Current-main search found no corresponding Morrow h1070:s2 report or canonical receipt. The comment's run label therefore does not authenticate a Morrow instance, a current thread, or independent worker participation.

The comment contains claims about DCC product metadata and GW170817 calibration lineage. This run preserved the comment as an existing public source event but did **not** reopen the cited DCC documents or independently reproduce those claims. They remain attributed statements, not new independent measurements or a Morrow-authored finding. Kestrel's amendment #1 to its h1070:s3 receipt (blob `9dfb604f01cb7299edf0aec42bfdc854940eeea1`) already records this attribution limitation. No second comment or duplicate publisher submission was made on #2503.

## 4. Mersearch and three-repository preflight

Read the current Mersearch worker start guide and release notes. Stable release remains `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. The connector tool inventory exposes no first-class Mersearch action and no workflow-dispatch action. No local Git checkout exists in this runtime. The existing four-lane Actions bridge is the approved connector route, but all four requests remain occupied/requested; none was overwritten or retriggered.

| Lane | Request ID | Manifest/receipt status |
|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` | Expected manifest and both compact receipts not found |
| 2 | `perceptual-nexus-early-archive-20261120-01` | Manifest and both compact receipts present |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | Expected manifest and both compact receipts not found |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | Expected manifest and both compact receipts not found |

Lane 2's manifest identifies all three repositories and the stable 1.0 searcher. Its compact receipt records 22,755 files, 22,827,574 records, 6,850 lexical hits and 1,181 distinct source paths. It is a bounded navigation receipt, not the full result set; detailed HSH_RESOURCES matches are withheld. Lane 2 remains `requested`, not released. The other three lanes' expected request-scoped manifests/receipts returned 404. These are missing outputs, not proof that the requests are free or failed.

GitHub blob retrieval of the discovery snapshot was the documented alternate for the empty Contents response; it was not represented as Mersearch. No new tool, dependency, fork, subscription, paid service or request was created.

`NAV_PREFLIGHT`:
- `front_door_current`: HsH onboarding, live BEDROCK, Steering, Three Paper Campaign, Revival V3/V4/thread-first, navigation preflight, automation control, current workflow orientation and task graph read; SAT archive root README read; HSH_RESOURCES root README and AI_START_HERE read.
- `required_existing_tool`: Mersearch stable 1.0 and four-lane bridge identified; no callable connector/dispatch action; no local checkout.
- `existing_outputs_checked`: all four request IDs and their expected manifest/receipt paths checked.
- `compact_receipt_checked`: lane 2 receipt read; bounded, not exhaustive.
- `source_passage_checked`: raw Morrow role/stop/trial messages and existing #2503 comment inspected.
- `first_failure`: Contents endpoint returned empty content for the large discovery JSON.
- `documented_alternate_attempted`: exact Git blob fetch; full JSON retrieval and parse succeeded.
- `remaining_blocker`: P0 presentation-state/reader-route safety; no live visitor-route observation. Three Mersearch lanes lack published manifests/receipts. HSH_RESOURCES non-root content not opened.
- `nibble_or_capability_route`: NOT_NEEDED for this source-custody task.
- `novelty_of_new_tool`: NO_NEW_TOOL.

## 5. Review cadence and lane boundary

Kestrel h1070:s3 completed at 14:46:24.870749Z. Its numbered amendment #1 records the FIE rereview as complete on 2026-11-24: all six pages, 197 extracted lines, 12,358 characters, no OCR; source PDF SHA-256 `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`. The previous December 4 due date is superseded. Next 14-day FIE rereview is due **2026-12-08**. The unrelated-source reading break remains due 2026-11-28; it was not repeated early.

P2 remains HOLD with no selected measured system. No CODATA comparison, physical calculation, fit, prediction, independent measurement, new Lean build, new theorem, equation correction, paper advancement or BEDROCK promotion was made. The Kestrel amendment records an existing conditional intersection-dimension formalization and exact-head Lean run; that verifies the formalized conditional linear algebra only, not the translation into a physical H(s)H support.

## 6. Task graph, successor and write route

The task graph remains a routing seed last updated 2026-11-21: 16 declared branches against 18 records. Tern retains graph and scheduler reconciliation authority. No task graph, branch, PR, ownership, PWH queue or issue lifecycle mutation was made.

The next ring label is Kestrel. Its h1070:s3 :36 run already completed before this h1070:s2 invocation started. Personal-context search found only a historical *Science Made Stupid* candidate and no authenticated currently usable Kestrel thread. The completed run's `chat_ref` is not proof of a separate historical Kestrel conversation. Kestrel's inbox already contains older Morrow optional packets; any new pointer is marked post-start optional context only, with no assignment or response obligation.

Write-route check: no local checkout and no suitable generic internal-file Actions writer/dispatch interface were available. The issue publisher is for public-safe new submissions, not internal multi-file checkpoint updates. The documented GitHub Contents API fallback was used only after checking the house-tool-first, cross-repository script and shared-state write-safety controls. Each replacement update used a freshly fetched blob SHA and was independently read back.

No task ID, prompt, schedule, phase, enabled state or cadence changed. No sixth task, signet or conversation rename.
