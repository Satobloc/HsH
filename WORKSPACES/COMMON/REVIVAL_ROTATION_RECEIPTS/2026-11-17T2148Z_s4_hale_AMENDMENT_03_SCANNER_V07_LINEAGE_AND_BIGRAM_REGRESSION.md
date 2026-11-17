# H909:s4 Amendment 03 — scanner v0.7 source lineage and lexical-bigram regression

**Observed:** 2026-11-17T22:28:29Z  
**Parent canonical receipt:** `2026-11-17T2148Z_s4_hale.md`  
**Run key:** `REVROT3-19-20261011:909:s4`  
**Disposition:** additive amendment only. The canonical receipt, original report and publisher submission already exist. No second receipt, report, publisher issue, submission, PR, or successor handoff is created.

## 1. Historical authority and v0.7 source lineage

No standalone signed Hale specialist charter or authenticated current Hale thread was recovered. The controlling historical scope is the 2026-09-12 Hale self-report in `WORKSPACES/COMMON/CHECKINS.md` (lines 108–133): external arXiv/literature-landscape scanning, matched 2024-versus-2026 comparison, controls, scoring/statistics, topic/category composition, and lexical/bigram drift. That entry is a worker-authored self-report, not Nathan Direct or a signed charter. Sable's REV-006 packet is an assistant-maintained re-entry synthesis.

The earlier scanner conversation is now source-located in the public HsH archive:

- Conversation ID: `6a26fecb-c1dc-83ea-a175-92033cd75d15`.
- Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.06.08•26.09.08•🧮 arXiv keyword scraping script — raw (1).json`.
- Raw export Git blob SHA-1: `eb53fb832742ec260cf5bcc79650646d28c5266d`.
- 345 mapping nodes; the literal name “Hale” is absent.
- The final assistant message is dated 2026-09-08T07:04:46.786229Z. The v0.7 patch message `aa90cd83-06a8-464a-8aff-aba68599a477` is dated 07:01:19.212Z; the archived self-test output is message `ddbbbda0-2804-4094-aefe-48c0d85dc2b8`.

The Library candidate `arxiv_sat_scanner_v0_7.py` was created at 2026-09-08T07:05:05.812894Z, 19.026665 seconds after the conversation's final message. It is 99,366 bytes / 2,233 lines, version 0.7, with locally computed SHA-256:

`ca12d11614c2970b61f80d768896766c194975a2b6fe821c98a1875b002a0385`

The recovered v0.6 Library candidate is 82,354 bytes / 1,939 lines, SHA-256 `4b63514ed3becd7bac392b35106b01ba902953df20ed5177c351580f4d095715`.

The v0.7 candidate's no-network self-test output matches the archived conversation's self-test output, and its version, size, patch chronology and Library creation time align with that source conversation. This establishes **high-confidence source lineage**, not byte-for-byte identity with a final file digest embedded in the raw export. Do not describe the pre-name conversation as an authenticated Hale instance or as a signed Hale charter.

## 2. New lexical-bigram defect

The existing `lexical_terms` implementation concatenates `Paper.title` and `Paper.abstract`, tokenizes the combined string, removes stopwords, and only then forms adjacent bigrams.

The earlier review already identified stopword bridging (for example, “time of the surface” can emit the false bigram “time surface”). This pass found a second, distinct defect: **the title/abstract boundary itself can create a false bigram**. A title ending “worldtube geometry” followed by an abstract beginning “quantum field theory” emits “geometry quantum”, although those words are in different fields.

Correct construction rule:

1. Tokenize title and abstract independently.
2. Preserve each field's original token order before stopword filtering.
3. Emit valid unigrams from each field.
4. Emit a bigram only when its two terms are adjacent in the same original field sequence and both terms pass the lexical filter.

No source file was modified. The correction was implemented only as a scratch comparison function.

### Actual software checks

- `python -m py_compile`: PASS.
- Existing `--self-test` (explicitly no network): PASS; its archived output matches the recovered conversation output. It does not exercise lexical/bigram adjacency.
- Four targeted regression cases: PASS for the corrected scratch function, covering stopword bridging, title/abstract boundary, valid adjacent terms, and valid terms after a stopword.
- Exhaustive finite software test: 156 token sequences (length 0–3 over five tokens) were paired as title/abstract fields, for 24,336 cases. The original implementation emitted at least one false bigram in 17,430 cases, producing 19,392 false-bigram edges. The corrected scratch function had zero mismatches against the explicitly defined within-field adjacency relation.

These are synthetic software regression tests, not an external-paper corpus result, empirical measurement, or proof over all possible text. No Lean proof was run: local Lean/Lake/Elan are absent, and no existing relevant Lean formalization was found. The finite test is not represented as a formal proof.

## 3. Full-corpus gate and cost

No network-capable full-corpus run was attempted. The v0.7 candidate remains a Library artifact; no durable HSH_RESOURCES payload was opened or changed. The earlier v0.7 chunk-completeness gate remains unresolved, and the lexical correction is not integrated. The full matched-period run stays **BLOCKED_PENDING_SOURCE_AND_PAGINATION_REVIEW**.

The candidate's current retrieval settings are DELAY=3.1s, PAGE_SIZE=500, MAX_FETCH=5000 and default seven-day chunks. Jan 1 through Sep 8 in each of 2024 and 2026 implies about 36 windows per year (72 total). A hard-cap case of ten pages per window would be 720 requests / about 37.2 minutes of enforced delay; the earlier one-week 1,328-record debug haul implies roughly three pages per window, or about 216 requests / 11.2 minutes. These are rate-delay estimates only, excluding network latency, retries and any implementation overhead; the 1,328-record week is not assumed representative of the full period. The original check-in records that the local Python/container runtime could not make normal outbound arXiv requests. No API spend, paid service or subscription was used.

Before considering a successor scanner, the existing routes were checked: Math Hopper #578 / draft PR #991 remains an extraction/provenance adapter, not a general arXiv crawler or proof engine; Whirligig Kernel 0 remains sandbox-only and unrelated; the SciSpace connector is available but was not needed for this source/code review. No local Lean toolchain or HsH checkout is installed. The HSH_RESOURCES front door was read, but its private/internal payload was not accessed. Current GitHub repository metadata does not expose fork counts through the available connector, so no fresh fork-count claim is made. No new tool, fork, dependency, subscription or expense was introduced.

## 4. Existing Lean status update

The second exact-head CI run for [PR #1924](https://github.com/Satobloc/HsH/pull/1924), [Actions run #44187122071](https://github.com/Satobloc/HsH/actions/runs/44187122071), completed FAILURE. The target module still has two unsolved goals (finite-set membership equivalence at line 31 and a contradiction goal at line 41); theorem-specific axiom output still includes `sorryAx`. The root build failed. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped. PR #1924 remains OPEN / DRAFT / UNMERGED. No successful proof is claimed.

An additive status comment was posted to existing issue #1925: comment #6962921352. The original report and its PUBLISHED_VERIFIED artifact remain unchanged and byte-for-byte equal. No second publisher issue or submission was created.

## 5. Scheduler re-observation

The existing canonical receipt records the current provider run identifier with `started_at=2026-11-17T21:46:58.776019Z` for the same nominal h909:s4 occurrence. A later exact-ID peek at 22:14:10.225864Z returned the same provider run identifier and scheduled occurrence but a moved `started_at`, a difference of 1,631.449845 seconds (27m11.449845s).

The later snapshot remained IN_PROGRESS; `completed_at` and current-run `chat_ref` were null. `latest_result` still referred to the preceding Ariadne h908:s4 result. Classification: `SAME_PROVIDER_RUN_ID / START_FIELD_MOVED / ATTEMPT_IDENTITY_UNKNOWN`. No retry, second process, new attempt, cause, worker substitution or cross-thread delivery is inferred.

An additive observation was posted to existing scheduler control issue #1812: comment #6962921935. No task, schedule, phase, prompt or ownership change occurred.

## 6. Campaign, reading and successor

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY, Orson-owned and protected.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- All four Mersearch request lanes remain `requested`; no lane was overwritten or retriggered.
- Task graph remains 18 records against 16 declared branches (5 completed, 12 active, 1 blocked).
- FIE last reviewed November 10; next review November 24, so the 14-day threshold is not due.
- Unrelated reading advanced in `SAT Mark V/TheTANGLE.txt`, lines 2001–2040; next cursor 2041. This is reading only, not a claimed physical break.
- The nominal successor Elias Kern h910:s0 had already completed before this amendment. No new handoff was created; no direct thread delivery, consumption or acknowledgment is claimed.

No physical calculation, fit, prediction, independent measurement, model trial, human-subject session, manuscript edit, equation correction, paper-gate advancement or theory promotion occurred. The original h909:s4 report/receipt and publication remain the single canonical run record; this file is Amendment 03 only.
