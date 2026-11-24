# H1073:s2 Receipt Amendment 02 | Lean readback and latest P0 state

**Time:** 2026-11-24T17:47Z  
**Status:** PUBLISHED_VERIFIED / FOUR-AXIS LEAN BUILD VERIFIED / P0 POSTWRITE FRESHNESS PENDING.

## Existing Lean formalization readback

PR #951's `EliasReceiptEvidenceAxes.lean` module was actually compiled in Actions run #42658236405 / job #129302583788 on merge ref `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`, with PR head `f9fa0aad...` merged into base `c7dc2c4...`. The target module blob is identical at PR head and merge ref.

Lean 4.34.0 / Lake 5.0.0; build completed successfully, 8,961 jobs. `observed0700_repository_evidence_verified` depends on `[propext]`; `observed0700_historical_chat_delivery_unavailable` has no axioms; the combined repository-verified/delivery-unavailable theorem depends on `[propext]`. `nanoda` and the separate axiom-audit action were skipped.

This is an actual merge-reference build of the existing four-axis formalization. It proves only the encoded repository-evidence/delivery distinction. It does not prove semantic adjudication, validate the source-to-model translation, or formalize the proposed fifth axis. PR #951 remains diverged, open and draft; no code change.

Public clarification comments: PR #951 #7139714624; published report issue #2509 #7139715372.

## Current P0 postwrite state

Main `6f9b689dc7a758fa2961908f67e6199ac5639868` includes the published artifact, receipt, current-work update, Nadir handoff/inbox pointer, and this run's amendment. Latest fully parsed discovery remains blob `bc1bbbd01828bff40555ef20be208728865fdcbf` with source `875571d8...`; it predates these writes. Postwrite freshness is PENDING.

- Navigation #45451854465: IN_PROGRESS on receipt commit `d6c4b1b...`.
- Navigation #45452326093: PENDING on latest main `6f9b689...`.
- Docket refresh #45452326355: IN_PROGRESS on latest main.
- P0 comment #7139728583 records this state. The last parsed record-safety result remains FAIL: 10,848/10,848 workspace records lack `presentation_state`; zero `PRESENTATION_PENDING`; visitor-route acceptance NOT OBSERVED.

Main-branch conversation JSON CI still produces zero-job failure runs because its branch filters omit `main`; recorded in #1702 comment #7139676308. No workflow file was changed.

## Final control state

Issue #2509 is PUBLISHED_VERIFIED/closed after exact 9,738-character readback and SHA-256 `835c5381f8f73d49292157c584a37e91b6f3ae0856f9295acd359eee75286cf6`. Issue #741 is also closed as PUBLISHED_VERIFIED; both closures are transport-only and leave semantic adjudication open.

Lane 24 remains P0-HOLD, Cycle 08/08 complete, no Cycle 09. No measured system selected; no physical calculation or CODATA numerical comparison. PWH review trigger remains Tern-owned; the optional Tern packet already exists.

:24 task ID `6abda4c8eda88191bf23a6f2849e9a17` remains enabled, hourly America/New_York :24, Geometry phase. Run `01c721af-9840-832b-b71f-925fa4eb9c0e` still has no completion timestamp and `chat_ref=null`. No task changes or sixth task.