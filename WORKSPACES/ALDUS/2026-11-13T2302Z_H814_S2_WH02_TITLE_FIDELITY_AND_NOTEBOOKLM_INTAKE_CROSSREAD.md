# H814:s2 Aldus follow-up | WH-02 title fidelity and NotebookLM intake cross-read

**Timestamp:** 2026-11-13T23:02Z  
**Run key:** `REVROT3-19-20261011:814:s2`  
**Disposition:** `SOURCE_REVIEW_COMPLETE / WH02_FIX_CANDIDATE / WH03_INTAKE_CANDIDATE / NO_CODE_OR_SCHEDULER_MUTATION`

This is an additive follow-up to the existing h814:s2 measurement-response/orphan-recovery report, not a second orphan scan or duplicate publication.

## 1. Role, authority and source boundary

Aldus remains the broad cross-reading/scouting role: connect source material across domains and identify overlooked leverage. The 2026-09-12 Common check-in and September 12 wake packet provide direct-user role locators. There is no standalone signed specialist charter. The historical raw-export blob is still referenced by the BOOT capsule, but a fresh `fetch_file` retrieval returned an empty body; this run therefore does not claim a new raw-export parse. No authenticated current Aldus thread was established.

The live BEDROCK, Steering Charter, Three Paper Campaign, Primary Operational Guideline, three-repository onboarding, start-here guide, revival V3/V4, thread-routing and thread-first rules, workflow branch map, scheduler authority guide, current task graph, current queue, Aldus BOOT/CURRENT_WORK, h814 report/receipt, and relevant Aster/Calder/Tern receipts were read. HSH_RESOURCES was limited to its root README/metadata; no payload was accessed.

## 2. WH-02 independent cross-read: PR #1710

**PR:** [#1710 — make root date tagging coverage-complete and undatable-safe](https://github.com/Satobloc/HsH/pull/1710)  
**Exact head reviewed:** `a967e908ceab048d219831ec799343643870daf3`  
**Base SHA in PR metadata:** `7b00fa5da4ab683a1af145aa317ea9eba21376e2`  
**Current main at this review:** `f312a91cd970bacf19636871475fb5ac3ecfa2ed`

The PR remains OPEN / DRAFT / UNMERGED, with seven changed files, 277 additions and 22 deletions. Latest PR metadata reported `mergeable=false`; no review submissions were present. The PR-triggered workflow lookup returned no runs through the available connector, so CI is NOT_VERIFIED. The Vercel comment reports a free-plan daily deployment-rate limit; that is a deployment-service limit, not a code-test result.

A comparison of the PR head against current main reported a diverged history (30 commits ahead, 7 behind). The PR metadata reports seven commits in the PR. This is a branch-lineage/rebase reconciliation item, not a reason to merge or force-update automatically. No PR mutation was made.

### Confirmed code-path counterexample

In the exact PR head, `tools/index_conversation_chronology.py`, lines 28–41, `title_from_path` first strips the two-part date prefix and known raw-export suffixes, then applies:

```python
if Path(name).suffix:
    name = str(Path(name).with_suffix(""))
```

That final generic suffix removal cannot distinguish an actual file extension from a meaningful dotted title in an extensionless source.

A direct reproduction of the exact function logic gives:

| Synthetic extensionless filename | Rendered title |
|---|---|
| `23.01.02•26.01.01•H(s)H 2.0` | `H(s)H 2` |
| `23.01.02•26.01.01•SAT-O v1.2` | `SAT-O v1` |
| `23.01.02•26.01.01•Conversation with Dr. X` | `Conversation with Dr` |

These are synthetic counterexample fixtures, not claims that those exact files currently exist in the repository. The source path is not changed; the derived chronology label is truncated. This is a navigation/provenance presentation defect within the newly supported extensionless input domain.

The current test at `tests/test_date_conversation_exports.py`, lines 198–212, checks that `dated.md`, `dated.log`, `dated.weird`, and `dated` appear in the chronology. It does not assert title fidelity or test an extensionless dotted title.

**Suggested repair for Calder:** strip only recognized actual extensions (or pass explicit source-extension metadata); preserve unknown/extensionless dotted title text. Add a rendered-title regression for at least `H(s)H 2.0` and `SAT-O v1.2`. Then reconcile the branch against current main and run the PR CI plus the full main navigation/backfill workflow. This report is optional cross-read context; it does not change Calder's ownership.

### Positive trigger check

The PR's `maintain-navigation.yml` runs on main pushes except generated-output-only paths, so root `.md`, `.log`, unusual-suffix and extensionless additions are covered by that navigation workflow. The separate backfill workflow also has manual dispatch and a six-hour schedule. No additional path-trigger defect was established in this review.

## 3. New WH-03 intake candidate: partial NotebookLM export

A new artifact appeared in HsH after the h814 project-orphan scan baseline:

- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_25/[TBD] SAT Theory_ A Zero-Parameter Unified Geometric Framework__NotebookLM_export.json`
- Git blob: `83c76e4673f5405df845cfc24c905ffb07d0c972`
- Notebook title: `[TBD] SAT Theory: A Zero-Parameter Unified Geometric Framework`
- Notebook ID: `b8d29e04-334d-48ed-b47c-cca875cceabb`
- Captured: `2026-11-13T22:09:49.079Z`
- Exporter: `0.3.0-chunked`

The ordinary file fetch returned an empty body, but exact Git blob retrieval succeeded and returned 1,388,195 characters. The file is therefore not empty. Its metadata reports `reached_top=false`, `scans=1000`, and `message_count=399`; the capture log separately reports 403 messages. The four-message discrepancy and failure to reach the top make this a partial capture.

The export contains 399 message records, all labelled `role=user`; no assistant-role records are present. It contains 285 source-panel rows, 156 unique normalized document-like title strings after basic UI-noise filtering, 207 studio/UI rows and 7,073 citation-marker entries. All 285 source rows have null `source_id`; none has a URL in its row text. These are not 156 verified sources or a usable bibliography. One studio card says “141 sources,” but that count is not reconciled to the captured source rows.

The first message requests a melting-temperature derivation for a hypothetical monoatomic hcp metal with synthetic inputs. The next message is answer-like but is also labelled user; it invokes a 3.75% cohesive-energy fraction and Richard's rule despite the preceding request to avoid empirical melting ratios. No measured system, experimental dataset, independent source attribution, uncertainty budget or validation is supplied. This is a historical hypothetical prompt/answer-like exchange, not a physical result. Do not reuse its numerical result, fraction or equations as measurement evidence.

The export has no ChatGPT `mapping` structure. The current date-tagging code explicitly requires a mapping plus user/assistant messages and should skip it as a non-ChatGPT conversation rather than invent a date or force it into the conversation chronology. It belongs in WH-03 document intake, not the ChatGPT conversation index. The adjacent `gitignore.txt` is one newline and contains no ignore rules.

**Disposition:** `UNRESOLVED / PARTIAL_NOTEBOOKLM_CAPTURE / WH03_INTAKE_CANDIDATE`. This is a source artifact, not yet a confirmed orphan project; no Project Portfolio Register project entry was created. The source titles are retrieval leads only. Mersearch-first original recovery remains blocked by the four occupied request lanes. Do not treat NotebookLM titles or citation markers as primary-source citations.

## 4. Lane 24 source-access update

The official Springer page for Han et al., *Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air–water interface*, reports publication on 27 June 2026, data available from the corresponding author on reasonable request, and one supplementary GIF (10,423 KB). It identifies Kyung Chun Kim as corresponding author (`kckim@pusan.ac.kr`). See https://link.springer.com/article/10.1007/s00348-026-04256-5.

The existing issue #1665 already contains the data-availability/supplement note, so no duplicate issue or comment was created. No data request was sent; no raw PTV data, calibration package or covariance package was obtained. This is a contact locator, not a measurement or new physical result.

## 5. Controls and next actions

- **WH-02:** title-fidelity defect recorded; PR #1710 remains draft/unmerged and not CI-verified. Calder retains repair/PR ownership.
- **WH-03:** partial NotebookLM export recorded as an intake candidate; source IDs/URLs and complete capture remain missing.
- **WH-05:** Aster h813:s3 diagnosis and issue #1704 comment #6865721159 already corrected the earlier zero-run hypothesis. All four lanes remain held; no retry or overwrite.
- **Project orphan census:** h814:s2 scan remains the latest completed scan. The new NotebookLM export is a post-scan source artifact, not enough evidence to classify a project or orphan.
- **P0/P1/P2/P3:** P0 Code Grurple ACTIVE; P1 Orson-owned cognition OVERDUE / NOT READY; P2 measured-system geometry HOLD; P3 full theory INCOMPLETE. FIE rereview remains due November 24.
- **No physical calculation, CODATA comparison, Lean build, source-equation alteration, P2 system selection, fit, prediction or theory promotion.**
- **No request/workflow/PR/task/ID/schedule/phase mutation. No sixth task.**
- Next ring label is Calder. The new handoff is POST_START_OPTIONAL_CONTEXT / REPOSITORY_ONLY; no direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.
- The prior unrelated-reading cursor remains at 2251; this follow-up did not repeat the prior reading quantum.

