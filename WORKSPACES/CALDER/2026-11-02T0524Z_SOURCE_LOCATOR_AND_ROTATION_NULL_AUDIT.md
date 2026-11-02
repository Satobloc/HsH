# Calder | 2026-11-02T0524Z source-locator and rotation null audit

**Run:** `REVROT3-19-20261011:533:s2`  
**Selected:** Calder (ring index 7)  
**Next:** Hale (ring index 8)  
**Task:** `6abda4c8eda88191bf23a6f2849e9a17`  
**Schedule:** hourly, :24 America/New_York, DTSTART 2026-10-01 14:24 America/New_York. Enabled and unchanged.

## 1. Rotation and live control state

The prescribed arithmetic gives h=533, s=2, seq=2667, 2667 mod 19 = 7: Calder. Next ring index is 8: Hale.

A scripted exhaustive check over 19 nominal hours found that each currently enabled phase s in {0,2,3,4} visits all 19 ring members exactly once per 19-hour cycle. Across those four active phases, each member appears four times per 19-hour cycle. The disabled :12 phase is not counted or re-enabled.

The :12 automation ID `6aa61b3b2e4081918927a35b61007acc` is disabled. The :24 task remains enabled. The older Revival Rotation V3 text saying all five leases are enabled is stale relative to the live automation roster. No task, ID, DTSTART, RRULE, phase, or enabled state was changed.

The immediate predecessor :12 receipt/handoff was not present because that task is disabled. The latest same-phase predecessor receipt is Aster at 04:24Z; it records the same missing :12 predecessor. No cross-thread delivery or recipient acknowledgment is claimed.

## 2. Live branch and campaign controls

Latest observed main commit during this run: `030b065c55634208176e2e2d1b08ad3fe04285fc`. The immediately preceding publication commit is `83890dd051b7b9ff81928b01e244c4a32a99cc9f`.

The task branch graph is still dated October 30. It retains Code Grurple ACTIVE and P2 as a candidate, with ordinary Lane 24 work backseated while the two paper-reader routes remain PRESENTATION_PENDING. The current Presentation Gate and Reader Routing Registry still require source-bound presentation derivatives; this execution has no Sites editor or site-write tool. Browser capability exposed here is read-only. No manuscript, reader, or theory work was used as a workaround.

The :24 automation was independently peeked: enabled, same task ID, hourly schedule, same phase. No automation changes were made.

## 3. Calder role provenance

The best available role evidence is the 2026-09-12 Calder section in `WORKSPACES/COMMON/CHECKINS.md`, which is a historical worker self-report, not a recovered Nathan-authored charter. No dedicated Nathan Direct Calder assignment was recovered in this pass.

The `REV-005-CALDER-REENTRY` wake packet is not accepted as Calder's charter: the identity-collision correction says its Foundational Covariance / Global Architecture material belongs to a different Calder identity. The current Calder empirical/null-design remit is therefore treated as a provisional role reconstruction, not an authenticated historical-thread identity.

## 4. Mersearch and source access

The Mersearch worker guide and four live request lanes were checked. All four lanes are currently requested/occupied; no request was overwritten or submitted. No local three-repository checkout is present in this runtime. The completed Calder Mersearch request `calder-worldtube-inspiral-nathan-source-20261030-0124` records a three-repository search (2,152 hits / 390 paths), but raw results are withheld after containment. It was used as navigation context, not as a fresh source retrieval.

The HsH raw export `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/26.03.13•26.04.21•Ontology and Math Check — raw.json` has Git blob `e3e40b1a167d26f2d153667d761746f9a4788db1`, conversation `69b3b56e-7540-8325-b93b-e9331fe95430`. The normal file fetch returned empty, but the blob-level fetch returned 3,246,276 characters and parsed successfully.

### Source correction discovered

Raw mapping contains `eedd8dce-44f0-4904-9234-2f3d9e7ef550` as a user-role node at 2026-03-13T07:37:00.116032Z. Its text defines Q as the number of fundamental filaments and says that for a nucleus Q is three times the nucleon count. It is a child of assistant node `f06374cf-32c7-4f97-acfc-f4544bef7191`, itself following the Braid-Smoothing Metric audit `ffc6ab0d-0980-4d33-819e-cdfabe7f49be`.

The 07:10 quoted-material message `ee6f4f57-1319-432a-aa06-e39bfd3adef3` is on a separate branch (parent `91754345-b747-48e6-85a6-67f0f7f13173)); it is not an ancestor of the 07:37 Q=3A node. Its possible broader scope remains unresolved, so the safe classification is a user-role statement in the Braid-Smoothing branch with that caveat preserved.

The next user node `2fa35549-edc3-4e32-9c1f-07f96ab781a9` gives He-3 as Q=6 while writing 3 quarks × 3 nucleons. That is internally inconsistent with 3×3=9. The assistant's Q=9 calculation is arithmetic correction, not independent measurement. March 18 CORE PACK nodes `11b787cf-f2ea-495e-b0e8-01fd235dde1e` and `0f9c47e1-a437-4276-b128-5061380e722a` are also present as user-role nodes and contain Q=3A, but the original derivation history of that equation bundle remains unresolved.

Published issue #1249 incorrectly claims the Q=3A UUID is absent from the raw mapping. The narrow correction was opened as #1250. Its body was corrected after an initial assistant-node locator typo; the current body contains the verified node `7d384f93-eb25-4699-8741-cdeb20a46003` and corrected digest. However, the publisher triggers only on `issues.opened` and reads the original event snapshot. The edit does not retrigger it. Comments were added to #1249 and #1250. Publisher rejected the original issues.opened event with SHA-256 mismatch. The current issue body is corrected, but edits do not retrigger the publisher. No artifact or checksum readback exists. Status: REJECTED / NO PUBLISHED ARTIFACT. No duplicate issue was created.

The source correction does not settle Q-count versus braid order versus effective worldtube count. No BEDROCK change or theory promotion follows.

## 5. Lean and formalization status

The schedule map has definite arithmetic structure. Scripted exhaustive enumeration passed for the four active phases. The general proof relies on 5 being invertible modulo 19; however, the existing PR #687 formalization covers only the :00 special case. Its current head `1cfcdd8f154ea0a0ae18a267375a6c64a7da901c` has no workflow run or combined status. No local Lean/Lake runtime is installed. **LEAN_NOT_RUN** for the general offset theorem; no new module or PR was created.

The source-level Q statement is not being promoted into a physical law. No geometry-to-equation map, reverse map, observable prediction, CODATA comparison, physical calculation, or independent measurement was performed. The missing map between constituent Q, braid order, and effective worldtube count remains a definition/projection problem.

## 6. Reading and review

Unrelated reading break: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BULBEK.txt`, lines 121-160. Next cursor: 161. This was read as an unrelated source, not forced into H(s)H.

Last full FIE review: October 27. Next review due November 10. No duplicate break or premature review.

## 7. Disposition

- Code Grurple remains ACTIVE; both reader routes remain PRESENTATION_PENDING.
- Lane 24 physical/CODATA work held under the current interlock.
- Mersearch lanes preserved; no new request.
- Q-source correction #1250: original issues.opened event rejected SHA-256 mismatch; body corrected after event, no edit-triggered retry, no artifact; REJECTED / NO PUBLISHED ARTIFACT.
- No new Lean proof, physical prediction, fit, measurement, paper-gate advancement, BEDROCK change, task change, schedule change, or theory promotion.
- Optional Hale handoff is context only; repository delivery does not establish thread delivery or consumption.
