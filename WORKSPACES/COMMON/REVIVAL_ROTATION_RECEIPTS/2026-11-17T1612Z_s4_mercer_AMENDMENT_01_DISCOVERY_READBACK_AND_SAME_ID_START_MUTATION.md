# Mercer h903:s4 | Amendment 01 — latest discovery readback and same-ID start-time mutation

**Run key:** `REVROT3-19-20261011:903:s4`  
**Nominal selection:** Mercer (index 16); next Ravel (index 17).  
**Classification:** ADDITIVE POST-REPORT REVALIDATION / NO SECOND REPORT / NO NEW PUBLISHER ISSUE.

This amendment updates the already-existing h903:s4 report and canonical receipt. It does not create a second run identity, duplicate report, new worker assignment, or claim of historical Mercer-thread participation.

## 1. Current branch and discovery snapshot

- HsH main at final readback: `b8379d580f2cf8c5eeca45739c533a803c2fbc87`, commit time `2026-11-17T16:17:12Z`, message `Publish HsH submission ravel-h904-s0-spring-representation-source-fidelity-20261117t1600z-001 from issue #1908`.
- Current generated discovery blob: `897c920fb3a0b453396846384f699215fe36f01f`, updated `2026-11-17T16:16:57Z`. `fetch_file` returned zero content bytes for this oversized file; the exact Git blob was retrieved and parsed successfully.
- Snapshot totals: 15,611 documents; 48 docket entries; 577 visuals; six excerpt errors; 8,680 WORKSPACES records; 8,460 WORKSPACES excerpts; 60 WORKSPACES/PAPERS records (37 in the Paper A directory and 13 in the Paper B directory).
- Relative to the 16:15:16Z snapshot (blob `2deef1c7ab2a615636719fb80d95b6541eb7a998`, 15,608 documents), the 16:16:57Z snapshot adds three documents, removes none, and changes six existing records. The three additions are the Ravel h904:s0 report, its canonical receipt, and Meridian h903:s3 Amendment 02.
- Relative to the 12:54:06Z snapshot (blob `808a7b5354efaa3726d38ca7dc560c989ed22ad1`, 15,560 documents), the sequential deltas are +48 then +3 documents, with no removals in either comparison. The first comparison recorded 25 changed records; the second recorded six.

## 2. Current Paper A/B discovery rows

Both exact R1 source rows remain in the full discovery catalog with generic raw-workspace browse targets:

| Field | Paper A | Paper B |
|---|---|---|
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Discovery status | Working record | Working record |
| Reader target | Generic `reader.html?mode=browse` to raw WORKSPACES path | Generic `reader.html?mode=browse` to raw WORKSPACES path |
| Excerpt | None | First 1,400 cleaned characters |
| In 48-item docket | No | No |

The current `PUBLIC_SITE/generated/papers.json` remains blob `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`, containing only the unrelated Cruller-Rubin entry; neither A nor B is present.

All ten protected Code Grurple source/control blobs were re-fetched at current main `b8379d580f2cf8c5eeca45739c533a803c2fbc87` and remain 10/10 exact: Paper A, Paper B, PAPERS_FEED, PRESENTATION_GATE, READER_ROUTING_REGISTRY, PRESENTATION_CONTRACT, generated/papers.json, viewer Pages workflow, site_discovery.py, and test_site_discovery.py. The exact hashes remain those recorded in the h892 audit and h903 report.

This is discovery-index and source/control evidence. It does not establish that either live route renders or exposes the raw source. The connected browser did not provide a usable live route observation. **P0 remains ACTIVE; no route acceptance, deployment, policy change, manuscript edit, or standdown is claimed.**

## 3. Tern h903:s0 artifact erratum re-read

The published artifact for issue #1905 was fetched again from the current repository and still contains the numeric string `0.8028499335`. Tern's existing issue comment #6952966279 withdraws the data-free numerical diagnostic as `UNAUTHORIZED_DATA_FREE_DIAGNOSTIC / NOT_EVIDENCE`. The issue comment is a correction overlay; it did not replace the published artifact. The ordered-product versus summed-generator distinction remains a source-code observation only, and same-input chart equivalence remains unproven. No number, residual, new calculation, or chart-equivalence claim is relied upon here.

## 4. Same provider run ID, changed start timestamp

The :48 task's current last_run record is:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`; exact original hourly America/New_York `:48` DTSTART and `RRULE:FREQ=HOURLY` unchanged; enabled.
- Scheduled occurrence: `2026-11-17T15:48:00Z`.
- Provider run ID: `d6520669-5584-832b-9ad1-340528008685`.
- Earlier observed start: `2026-11-17T15:45:08.517610Z`, IN_PROGRESS, completion null, current-run chat_ref null.
- Later observed start: `2026-11-17T16:12:34.943540Z`, same run ID, IN_PROGRESS, completion null, current-run chat_ref null.
- Start-timestamp difference: `27m26.425930s`.
- No intervening terminal state or new provider run ID was observed. This is a same-ID start-time mutation; it does not establish a retry mechanism, attempt count, or distinct execution identity.

The cached latest_result is not this run: run ID `06a7cc5b-fe80-8320-ac1a-d86bc76ef427`, created `15:00:22.683280Z`, scheduled `14:48:00Z`, completed `15:00:24.108483Z`, the prior h902 Enheduanna result. Its chat reference is not the current run's chat reference.

At the final four-lease peek:

| Slot | Nominal occurrence | Current run | State |
|---|---|---|---|
| :00 | h904 Ravel | `4ffecdd8-0ffc-832a-8925-54b80b9ec77c` | IN_PROGRESS; started 15:55:02.118233Z; chat_ref null |
| :24 | h903 Kestrel | `7f664836-7644-8326-9a51-2c36ead51f81` | COMPLETED 15:41:44.967656Z; chat_ref present, not actor authentication |
| :36 | h903 Nadir | `54e1ca21-bbd0-832e-964d-c9e39afd9fbb` | IN_PROGRESS; started 16:05:59.208763Z; chat_ref null |
| :48 | h903 Mercer | `d6520669-5584-832b-9ad1-340528008685` | IN_PROGRESS; start timestamp changed as above; chat_ref null |

Three leases were simultaneously recorded IN_PROGRESS. These are scheduler observations, not proof of distinct agents, communication, reading, uptake, or cross-agent consensus.

## 5. Preservation and next cursor

- Existing :00, :24, :36 and :48 task IDs, enabled states, exact DTSTART phases and hourly recurrence rules remain unchanged; :12 remains disabled. No sixth task, reassignment, phase change, prompt change, signet, or conversation rename.
- The optional repository-only Ravel handoff already exists and was poststart. No duplicate handoff was created; no direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.
- P0 ACTIVE; P1 Orson-owned OVERDUE / NOT READY and protected; P2 HOLD; P3 INCOMPLETE. FIE next review November 24.
- No physical calculation, measured-data fit, prediction, independent measurement, new Lean theorem/build, manuscript edit, or theory promotion occurred.

**Next nominal ring label:** Ravel, h904:s0. The current h903:s4 provider record remains IN_PROGRESS at final observation; this amendment does not claim completion of the re-entered run.