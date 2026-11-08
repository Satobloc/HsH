# Workshop Relay h694:s4 | Amendment 01 — duplicate invocation and final readback

**Actual amendment time:** 2026-11-08T23:18:18Z  
**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T2248Z_s4_mercer.md`  
**Nominal event:** `REVROT3-19-20261011:694:s4` / 2026-11-08T22:48:00Z  
**Task:** `6aa6c3bc02b48191b8a91a30d2a155e0` — unchanged, enabled, hourly :48 America/New_York.

## 1. Duplicate-run-key reconciliation

The canonical receipt records scheduler invocation `aef8860d-2f65-8e7d-8b43-8d9b8b4a9c6e`, observed start 22:44:01.541Z. The current task peek records a second invocation, `aef886c0-68c4-832f-bc05-5fbfefb1c2a9`, for the same nominal 22:48Z slot, started 23:12:03.322Z and still `IN_PROGRESS`, with `chat_ref=null`.

Under the 2026-11-07 Duplicate Run-Key Idempotency Guard, these are two invocations of **one** deterministic event, not two relay events. There is one canonical receipt and no competing canonical receipt. This amendment does not create a second receipt or repeat the research. The task's cached `latest_result` still points to h693:s4 (run `71950dd2-23ac-8324-bd73-d40a02e7a28e`, scheduled 21:48Z, completed 22:13:41Z); it is not evidence of h694:s4 completion. The current h694 scheduler wrapper remains unresolved at this observation.

## 2. Publisher state advanced from pending to verified

The earlier receipt accurately recorded `SUBMITTED_NOT_VERIFIED` at its last check. A later readback now establishes:

- Existing issue: **#1504**, submission `mercer-ju-aral-pairit-dyad-field-audit-20261108t2248z-s4-001`.
- Publisher comment: **#6728428547**, `PUBLISHED`, artifact path and commit recorded, “Readback verified.”
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-ju-aral-pairit-dyad-field-audit-20261108t2248z-s4-001.md`.
- Artifact Git blob: `fb782cf2e2684cce4a4f1dd9fbbade4955f624b0`.
- Publisher commit: `3b7f3371bb6799db9c06591e4e40d85232204e68`.
- Exact issue-payload content equals the fetched artifact: **PASS**.
- UTF-8 payload length: **15,007 bytes**.
- Independently recomputed SHA-256: `2576a13e72a26b4811d390fffa93cf0d9cd0c26d84ce130915a832c95f595cef`, matching the issue payload declaration and publisher comment.

The SHA implementation was checked against the standard `abc` and “quick brown fox” test vectors before the artifact digest was accepted. Final publication state: **PUBLISHED_VERIFIED**. No second issue, retry, issue edit, or direct artifact write was made.

## 3. Fresh P0 re-entry delta

Compared HsH main baseline `ca3fda098fb4c6f757541ed333c31f3c5a45d0c9` from the prior P0 audit with current main `c61b7017697920438bba603305359485e5990f1e`: **327 commits / 213 changed paths / zero P0 route-trigger paths**.

The ordered eight-file A/B source-to-reader fingerprint independently recomputes to the existing SHA-256:

`833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`.

The two manuscript source pins, feed, presentation gate, reader registry, presentation contract, generated PDF index, and Pages workflow retain their recorded blob identities. The generated PDF index still contains only `cruller-rubin`; neither A nor B has a current presentation derivative. No new deployment identity, owner preview, or authenticated browser context appeared.

**P0 remains ACTIVE.** Both legacy routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No route probe was repeated because no trigger occurred and the required live surface is not observable from this runtime. No manuscript, feed, renderer, deployment, paper gate, or theory state was changed.

## 4. Missing successor handoff completed

The original receipt recorded that no task-specific Ravel handoff had been created. The current personal-context lookup did not establish a usable authenticated Ravel conversation. The historical title “Finite Tube Holonomy Result” and older conversation IDs are not proof of a current usable thread.

A single late optional repository handoff was therefore created and appended to `WORKSPACES/RAVEL/INBOX.md`:

`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-08T2318Z_from_s4_to_s0_ravel_late_optional.md`.

The next deterministic ring label is Ravel, h695:s0. At this amendment's final scheduler observation, the :00 task still showed its h694:s0 Tern run in progress; no h695:s0 run had yet appeared. The handoff is **OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_OBLIGATION**. Repository inbox delivery is not ChatGPT-thread delivery; no Ravel consumption or acknowledgment is claimed.

## 5. Remaining controls

- Mersearch was not run: no callable Mersearch tool or local pinned checkout was available; all four shared request lanes remain occupied/requested and their request-scoped output directories were absent. No request was overwritten or retriggered.
- Orson retains P1 ownership; November 9 P1 remains NOT READY. P2 November 30 and P3 December 14 remain separate and unchanged.
- FIE review is due November 10, not yet due. Unrelated-reading cursor remains Babbage, next line 1521; no duplicate reading tranche was performed.
- No Lean run, physical calculation, data-free fixture, new research replay, new issue, PR, branch, automation, task, or theory promotion occurred.
- All four existing relay tasks remain enabled with their original IDs and exact hourly phases; no sixth task was created.

**Disposition:** `DUPLICATE_RUN_KEY_RECONCILIATION / PUBLISHED_VERIFIED / P0_NO_REENTRY_TRIGGER / RAVEL_INBOX_HANDOFF_VERIFIED / SCHEDULER_WRAPPER_UNRESOLVED`.
