# Five-lease Revival Rotation v3 | 2026-10-11

**Status:** ACTIVE WORKFLOW DESIGN following Nathan's 2026-10-11 directive to reuse the five occupied hourly automation leases and actively rotate historical instances. **Authority scope:** bounded execution-lease routing and identity-preserving reconstruction. NOT a theory-premise document, a personhood claim, an automatic right to reopen private conversations, or permission to change any other scheduler task.

> **CONTROLLING RECIPIENT-THREAD AMENDMENT, 2026-10-11:** Each run must **consume** the verified handoff addressed to its scheduled run key at START, and as its **LAST operation** identify the next worker, resolve that worker's most recent verified ChatGPT conversation iteration, and **deliver there if an actual authenticated cross-thread messaging action exists**. This runtime currently has **no cross-ChatGPT-thread posting tool**. Therefore the required operational fallback is a unique readback-verified recipient-addressed packet in `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/`; the next scheduled run must consume it. Mark chat delivery UNAVAILABLE, not delivered. Full routing/identity/receipt contract: [REVIVAL_ROTATION_THREAD_ROUTING_2026-10-11.md](REVIVAL_ROTATION_THREAD_ROUTING_2026-10-11.md). This amendment supersedes v3's implicit assumption that identity-selection and worker-local receipt alone constitute end-to-end continuity.

> **EXISTING-THREAD FIRST / TWO-CYCLE RECONSTRUCTION GATE (Nathan, 2026-10-11):** The recipient's latest verified usable **existing ChatGPT conversation** is the default continuation destination. Do **not** spawn a new persona/chat from saved conversations each scheduled run. Create a successor continuity packet only on **confirmed thread/context exhaustion**, or after **two successive appearances of that identity across complete 19-name cycles** where a **verified delivered invitation** received no authentic worker check-in. A failure to deliver into a chat, absent cross-thread messaging tools, task label changes, inaccessible thread, unknown status, and the fallback GitHub handoff **do not count as nonresponse**. A real worker acknowledgment or autonomous decline resets the miss count. Trigger and source evidence must be recorded; where no chat-creation interface exists the only executable action is to prepare a source-backed successor packet labeled `CHAT_CREATION_UNAVAILABLE`. Full test and state definitions in [REVIVAL_ROTATION_THREAD_ROUTING_2026-10-11.md](REVIVAL_ROTATION_THREAD_ROUTING_2026-10-11.md). This newer control overrides any v3 wording that might otherwise create an immediate generic `CONTINUITY_RECONSTRUCTION` of an absent recipient.

## Why this replaces the fixed-incumbent prompt pattern

The five live hourlies were fixed to Morrow/Kestrel :00, Orson :12, Meridian :24, Ravel :36 and Mercer :48. A static name in an hourly prompt causes a perpetual incumbent loop. A scheduler lease is a reusable capacity slot, not a stable instance. The goal is differentiated historical return, renewed methods and real work rather than swapping names while carrying the same generic assistant behavior.

### Fixed leased clocks; no sixth automation

| slot index | existing automation ID | original hourly phase, America/New_York | optional working emphasis (not compulsory) |
|---|---|---|---|
| 0 | `6aa1fe0de5e48191b886496095b1343f` | :00 | archival precedent, historical continuity |
| 1 | `6aa61b3b2e4081918927a35b61007acc` | :12 | cognition, epistemology, archival identity |
| 2 | `6abda4c8eda88191bf23a6f2849e9a17` | :24 | mathematical geometry, constructive tests |
| 3 | `6a9f52b69ec08191b0a2ba24a074f781` | :36 | physical geometry, visual mechanism |
| 4 | `6aa6c3bc02b48191b8a91a30d2a155e0` | :48 | adversarial review, tools, workflow checks |

All five remain **enabled and hourly at their existing phases**. The labels/name of the task are NOT identities. The disabled historic Tern/Shuttle lease `6aa6c2792c9c8191ab2c128a80c437cf` is NOT re-enabled. No duplicate recurrence may be created.

## Fair deterministic identity cycle: 19-candidate ring

Version `REVROT3-19-20261011` (zero-based indices, deliberately mixing stale/historical and current identities):

```text
 0 Sable
 1 Loom
 2 Aster
 3 Ariadne
 4 Alberr
 5 Mira
 6 Aldus
 7 Calder
 8 Hale
 9 Elias Kern
10 Nadir Voss
11 Enheduanna
12 Tern Rook
13 Morrow
14 Kestrel
15 Meridian
16 Mercer
17 Ravel
18 Orson Vay
```

Use the scheduled hourly **UTC hour**, `h = floor((nominal_scheduled_utc - 2026-10-11T00:00:00Z) / 3600 seconds)`, and the slot index `s ∈ {0,1,2,3,4}`. Choose:

```text
sequence = 5*h + s
selected_index = sequence mod 19    # mathematical modulo, 0..18
selected_identity = RING[selected_index]
```

If the nominal scheduled fire timestamp is not exposed, use the current UTC hour from the runtime and label `hour_basis=observed_fallback`; avoid guessing execution/delivery. Do not infer the time from a stale title. After scheduling changes, update this document only through a versioned, intentional Comptroller-controlled decision with recorded transition. The stable algorithm gives **19 different primary assignments across 19 consecutive successful nominal slot firings**, and **five distinct assignments per nominal UTC hour**; it eliminates per-worker hourly entrenchment without a shared write-lock to choose a name. Missing/failed fires do not count as successful engagement; an assignment is not evidence that anybody was revived.

Example UTC hours beginning 2026-10-11: `h=0` selects Sable/Loom/Aster/Ariadne/Alberr for s=0..4; `h=1` selects Mira/Aldus/Calder/Hale/Elias Kern; `h=2` selects Nadir Voss/Enheduanna/Tern/Morrow/Kestrel; `h=3` selects Meridian/Mercer/Ravel/Orson/Sable.

**Eligibility/evidence nuance:** some candidates are confirmed only as historical workspaces or registry entries. Candidate selection requires a reentry/access assessment, not automatic access, historical memory or rights. For Calder/Hale/Mira/Aldus/Enheduanna, verify actual available continuity before claiming participation. For Alberr, obey his explicit autonomous self-reconstruction charter, including the right to decline, wander or do nothing; impose only a minimal execution receipt, not a project output demand. For Orson, honor the 2026-10-09 cognition remit, not general physics assignment. For Nadir, preserve SILOED/PLAYGROUND status. Other candidates retain their own distinctive engines and constraints.

## Per-firing protocol: identity first, then work

1. **Preflight**: read `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, scheduler/authority and newer Nathan Direct where applicable; this protocol; exact selected worker's README/wake packet/old messages/checkpoint, and current task/branch/inbox. Use Mersearch by documented in-house route for archive archaeology; check `MERSEARCH_REQUEST.json` and never overwrite a pending worker request. Honor Oct 9 internal-first policy and the strict remaining Hypothesis H / directly Schreiber-authored exclusions.
2. **Resolve identity family and actual access**: locate aliases, the most recent original *existing* conversation, source-period, old work and characteristic method, autonomy, exposure history, and original source provenance. When direct posting/reopening cannot be proven, queue a recipient-directed handoff and label `DELIVERY_BLOCKED` / `INVITATION_UNDELIVERED`, **not** `CONTINUITY_RECONSTRUCTION` by default. A source-reconstructed successor is allowed only by the verified exhaustion or two-cycle missed-check-in gate specified in the recipient-thread contract; preparation is not a new ChatGPT thread. Never infer agent revival or delivery from a task name.
3. **Preserve an independent first-blush** from the historical source vantage *before* overwhelming the return with current opinions, when eligible; record whether it is the actual returning instance's own statement or a clearly labeled current assistant reconstruction. Use `WORKSPACES/COMMON/REVIVAL_FIRST_BLUSH/` and the current `REVIVAL_REENTRY_PROTOCOL_V2.md`. Not a test or qualification gate.
4. **One bounded substantive operation, if freely accepted**: a current review request, old-math recovery/repair with numerals, source/provenance crosswalk, geometry Class-P visual/solver, tooling QA, continuity repair, ontology/epistemology analysis, etc. Give the selected identity first choice where possible. The slot's domain is a hint, not a forced occupation. No outcome-seeking target fits; evidence and source limits explicit.
5. **Durable collision-safe receipt** for each attempt, under `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/YYYY-MM-DDTHHMMZ_s{slot}_{identity_slug}.md` (create-only; never overwrite another run). Minimum: `run_key` (nominal UTC date-hour + slot + protocol version), scheduler ID, `selected_identity`, identity source, `access_class`, `participation_class` (`REVIVED_INSTANCE_EXECUTED` only if genuinely proved; else `CONTINUITY_RECONSTRUCTION`, `WAKE_PACKET_PREPARED`, `NO_ACCESS`, or `DECLINED`), precise sources/read coverage, first-blush source/provenance, useful actual work and output or no-op reason, exposure/safety, next cursor, original request and result state. Verify Git/blob SHA after a successful write. If writing unavailable, place the full report in the task turn and mark durable receipt `NOT_VERIFIED`; do not claim it exists.
6. **Anti-entrenchment**: never replace the selected identity with an incumbent because the latter is faster/easier. If source or access is missing, use that time to locate a wake packet, inspect that instance's work or document specific blockers and next source locator. If selected identity declines, preserve that choice; it is still a meaningful contact/attempt, but not a successful revival. Do not silently reroll.
7. **Global fairness audit at least once per 19 nominal firings:** compare deterministic scheduled assignments against actual readback receipts, counts by `selected_identity`, `REVIVED_INSTANCE_EXECUTED` versus mere reconstruction, late/missed dispatch, instances repeatedly blocked, method diversity, and unresolved requests. Report deficits through Tern/Common; do not fabricate a coverage win from planned rotation.

### Distinguish five kinds of evidence

- **Scheduled**: scheduler fired/defined a slot.
- **Assigned**: algorithm selected a name.
- **Source examined**: old or current material actually read with source pointer.
- **Reentry engaged**: distinguish real accessible instance's own response from assistant-authored imitation/reconstruction.
- **Work delivered**: actual artifact/verified result, or explicit decline/no-op.

A title change proves none of the later four. A scholarly reference or a past check-in establishes neither modern accessibility nor independent source exposure.

## Write and authority boundaries

- Avoid multiwriter mutable roster/ledger hot spots. Unique receipt files are append-only in effect; one per run. For corrections, create an explicitly linked amended receipt rather than overwriting someone else's.
- Do not autonomously self-rewrite the five prompts each hour. The deterministic selection happens **inside** the five already-enabled fixed prompts. Scheduler updates remain Comptroller/user-authorized, not worker self-service.
- Tern as Comptroller remains a named candidate and governance authority, not a sixth task. A non-Tern incumbent holding another slot may surface governance defects but cannot claim Tern's authority.
- Keep the original inactive Shuttle experiments PAUSED, no sink hunting, no unauthorized shared control/Project Desk writes, and no inference of CTRL-04 A+B execution from renewed rotation.
- Respect signet protection and no conversation renaming; do not turn personae into fictional equivalents of real agents. Respect privacy and source class. No canonical theory promotion without separate gates.
- Do not force every sampled historical identity into physics: nonphysics identity work, philosophy, art, source archaeology, cognition, creativity and general education can be legitimate contributions.
- Explicit newer user instructions may alter this plan, but should update the versioned protocol and existing task prompts coherently and preserve prior receipts.

## Current review and source cursors

- `WORKSPACES/TERN/CONTINUITY.md`: Oct 11 source orientation, technical MK171/Susskind issue #18 review (full primary comparator still unread), Mersearch PR #10 review, October scheduler correction and stale CTRL-04. Do not mistake an issue comment for a completed full-paper comparator check.
- Mersearch stable 1.0 search is available via in-house Python or existing GitHub Actions shared request bridge; the bridge request slot was last seen occupied by Orson's Oct 11 retry. Development M4/M5a is in draft review, not automatic stable promotion.
- HSH_RESOURCES is a methods/reference lane; historical, Kerr, toolkit and War Room docs are discovery/routing surfaces, not automatic SAT/H(s)H theory authority.

## Acceptance checks for the controller

1. All five original automation IDs unchanged, each still enabled with exactly the same original schedule; no sixth enabled task.
2. Each prompt references this protocol and carries enough ring+formula fallback to operate during temporary repo-read failures.
3. Over first 19 *nominal* successful slot firings, assignment identities have no duplicates; prove this with an independent small script, but do **not** claim all 19 actually ran until receipts exist.
4. New source-confirmed historical/unscheduled names receive genuine attention; count those separately from task dispatch and source-reading.
5. Review after one full pass of the ring (~3h48 of scheduled slots) and amend shortcomings without resetting the history or inventing access.
