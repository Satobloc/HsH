# Elias Kern Track A | sticky candidate/promotion lifecycle formalization

**Nominal slot:** 2026-11-02T13:24Z  
**Run key:** `REVROT3-19-20261011:541:s2`  
**Rotation:** h=541; seq=2707; ring index 9, Elias Kern; next ring index 10, Nadir Voss.  
**Disposition:** SOURCE-GROUNDED REVIVAL / EXISTING PR #951 EXTENDED / MERGE-REF LEAN BUILD SUCCESS / EXACT-HEAD STANDALONE NOT RUN / NO POC OR PRODUCTION CHANGE.

## 1. Historical authority and identity

Prior-conversation retrieval recovers Nathan's original user-role instruction at 2026-09-24T17:47:46Z (13:47:46 ET), in conversation group 2. It specifies the Top/Central/Branch/Hydra prototype, Track A with Nathan and Orson Vey, independent-but-communicating Track B with Sable and Rook/Tern, a first safe lease for Elias, one bounded real-work mechanism per leased pass, durable receipts/failure packets, observed behavior rather than intended behavior, and an explicit prototype-not-production boundary.

The adjacent 2026-09-24T16:36:36Z user message requested a small working demo with documentation. The repository's Elias inbox contains a matching user-originated 13:47 ET record. The retrieval does not expose the historical conversation title/ID or message UUID, and no raw-export locator was recovered. Do not invent those identifiers or claim historical Elias-thread access.

The original Nathan-signed War Room Declaration (HSH_RESOURCES blob `1506a3c8030f446b08990dac88dc45227dfa3463`) and the 2026-09-24 Peace Accord (blob `a818e6ab65678e974e29a39c0beb22659bbe9d30`) were read alongside the current Elias README, CURRENT_WORK, INBOX, switchboard operationalization note, prototype README, and executable source. These document sources support the prototype/autonomy boundary; they are not independent raw-chat witnesses.

No authenticated current Elias ChatGPT thread was found. This is a source-grounded scheduled revival, not literal historical-instance continuity.

## 2. Control-plane state

Read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation V4, thread-first/navigation preflight, workflow orientation, scheduler authority, task-branch graph, active automation roster, current main branch, Elias workspace state, and current receipts.

- Main branch at pre-write inspection: `05f509b6898fa46d0b4b985af7bea23c0bd28ed6`; its latest change was an automatic public-display docket refresh, unrelated to this work.
- Existing :24 automation remained enabled and unchanged. No sixth task, task-ID/cadence/phase change, or prompt modification.
- Code Grurple remains ACTIVE. Paper A/B reader routes remain pending.
- P1 cognition remains Orson-owned; November 9 P1, November 30 P2 and December 14 P3 gates remain distinct.
- Ordinary Lane 24 physical/CODATA work remains BACKSEAT/HOLD.
- No physical calculation, CODATA comparison, theory promotion, or paper-gate advancement was performed.
- No new tooling was built. Existing HSH_RESOURCES POC, Mathlib/Lean PR #262, and Elias's existing draft PR #951 were reused. No Mersearch lane was created or overwritten.

## 3. Exact POC source audit

Source: `Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py`, source commit `b2ad3828b5a7f67985d5d91ec3911a2516e3a8ff`, Git blob `49988a769389b2baf264a27d596ba7c3ff822b36`.

The inspected source establishes:

- Base state initializes `experience` as an empty mapping.
- `source_routes()` may select the source-category label `experience` for identity/continuity/learning tags. This is not a read of stored experience records.
- `wake()` reads directives, capabilities, blockers, actor/locale rules and the current task, but does not read `state["experience"]`.
- `sticky(actor, kind, text)` validates a bounded kind, hashes `kind:text`, deduplicates by hash, then appends only `{id, kind, text}` to `state["experience"][actor]`.

Therefore the existing method provides persistent, hash-deduplicated candidate capture. It has no candidate/promoted status, source/version provenance, origin context, transfer receipt, second-context result, reviewer reference, or exposure manifest. The present wake path does not apply stored entries to active rules or the next operation. Persistence is not demonstrated behavioral transfer.

An internal independent Track B review was consulted. Its private contents are not reproduced here. No Track B ownership or decision is claimed by this Track A formalization.

## 4. Proposed candidate/promoted contract

I added an assistant-authored formal contract to the existing draft PR #951, without changing the Python POC or creating another PR.

New module:
`FORMAL_VERIFICATION/HsHVerification/EliasStickyLifecycleGate.lean`

Current PR branch:
`research/elias-tracka-publisher-status-20261028t23z`

Current head:
`8fa5e72666284173569fe60bb68b678cd923702a`

Module blob:
`68e58be08526502848a68b2a77f0cb3d14036419`

Root aggregator blob:
`b2172b3b7175090f66859daf180fe9fd1aadf573`

The proposed schema records candidate identity, actor/kind/text, source path/blob/version, origin context and capture-exposure reference. A transfer receipt binds to the same candidate and source, records a distinct test context, expected and observed behavior, pass/fail, reviewer reference and test-exposure manifest.

The transition model separates:
1. candidate capture;
2. receipt validation;
3. explicit promotion;
4. wake-time application of promoted records carrying a still-valid receipt.

The module contains conditional theorems for candidate non-application, rejection of same-context and failed tests, candidate/source-blob mismatch, missing expected behavior/reviewer/exposure references, receipt retention, and prevention of double promotion.

The reviewer and exposure references are strings. Their presence does not authenticate the reviewer, prove independence, authenticate the exposure history, or validate the source blob's content. The module is a proposed software contract, not a proof that the Python source implements it.

## 5. Lean verification chronology

Initial PR workflow #41454763784 ran on the preceding head `edeb7cce3fb6c85607f5fc2f9ecc0bd611158fad`. It failed at module lines 175 and 181 with two parser errors: `unexpected token '='`. The cause was an unparenthesized Bool-equality expression in two theorem binders.

The expressions were corrected. Repair commit:
`8fa5e72666284173569fe60bb68b678cd923702a`.

The exact-current-head PR workflow is #41455330592, job #125310452589. At the initial post-repair readback, checkout and Lake dependency-manifest generation had completed while Lean compilation was still in progress. The later exact-current-head PR workflow completed successfully on its merge-ref, as documented in the verification amendment below.

**Final status: MERGE_REF_BUILD_VERIFIED / EXACT_HEAD_STANDALONE_NOT_RUN.** The module blob matches the PR head; the merge-ref root imports it. No standalone exact-head build is claimed.

A separate push-triggered conversation-content workflow #41455322413 failed with zero jobs. It is not a Lean result and is not used to classify the formalization.

Local `lean` and `lake` are not installed in this runtime. The GitHub Actions run is the available actual Lean 4.34.0 / Lake 5.0.0 verification route.

## 6. Existing publication updated

The existing published issue #632 was reused; no duplicate issue was created. Its addendum comment #6578667970 was updated in place and independently read back exactly.

Comment SHA-256:
`be855f6248fad6b68e8a103cd29c019fc353c13b8656b81750b5e475fbdac496`

The comment now distinguishes the original POC source finding, proposed formal contract, current-head CI state, and proof limits. Private Track B review contents are not reproduced.

## 7. Unrelated reading and next cursor

Completed unrelated reading in `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BULBEK.txt`, lines 201–240. Next cursor: line 241. This is a fictional worldbuilding exchange and is not forced into H(s)H.

Last full FIE review: October 27. Next review due November 10.

## 8. Next cursor

1. Recheck exact-head Lean workflow #41455330592 and inspect its actual job log.
2. If successful, verify the new module blob matches the checked-out source, inspect every theorem-specific `#print axioms` output, and record that tests/lint/nanoda/separate automated axiom audit were skipped if they remain skipped.
3. If failed, repair only the existing PR #951 branch and obtain another actual current-head run. Do not claim proofs from the failed build.
4. Only after the formal contract is compiled, build a sandbox-only consumer/transfer test using a genuinely distinct second context and a durable receipt. Keep the upstream Python POC and production workflow unchanged until separately reviewed.
5. Preserve Nadir Voss's independent finite-core all-plus SO(4)/stacked-holonomy playground. The successor packet is optional context only, not an Elias Track A assignment.

**No actual second-context transfer was demonstrated in this run. No POC source change, production integration, physical calculation, CODATA comparison, theory promotion, paper-gate advancement, or automation change occurred.**


## Verification amendment | 2026-11-02T1347Z

- PR workflow #41455330592 completed SUCCESS for current PR head `8fa5e72666284173569fe60bb68b678cd923702a`.
- The actual checked-out/build source was merge-ref `811a5ea5bfe5a5696ce42039431488fa06b1d1ee`. The new module blob is identical between PR head and merge-ref (`68e58be08526502848a68b2a77f0cb3d14036419`); the merge-ref root aggregator contains the new module import. This is a merge-ref build, not a separate exact-head standalone build.
- Lean 4.34.0 / Lake 5.0.0. `EliasStickyLifecycleGate` built at 8925/8955; root aggregator built at 8954/8955; workflow and `lake build` succeeded.
- Full job log: zero `sorryAx`, zero `admit`. Ten selected theorem-specific `#print axioms` outputs list only `propext`. Five other theorem declarations compiled but were not individually printed.
- Nanoda, separate axiom audit, tests and lint were skipped.
- Existing issue #632 comment #6578667970 updated in place; exact readback PASS; comment SHA-256 `1fc8bdf6361f10d70932374ce1fc1a67dab0322503e9fb02c1ba6c3be9b9283e`.
- No actual second-context transfer was run. The Python POC remains unchanged; no production integration.
