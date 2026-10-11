# Revival Rotation | Recipient-Thread Handoff Contract | 2026-10-11

**Status:** controlling operational amendment to [REVIVAL_ROTATION_V3_2026-10-11.md](REVIVAL_ROTATION_V3_2026-10-11.md) following Nathan's explicit directive: *each turn's LAST operation resolves who's next and writes the handoff into the most recent iteration of that worker's existing conversation thread.* The title of an hourly recurrence is a lease label, **not** a conversation destination. Current automation tools do not implement direct writing into another existing ChatGPT conversation; so the fallback MUST be mechanically consumable, recipient-addressed and truthfully marked as undelivered to that conversation.

> **NEWER NATHAN DIRECT — V4 NOT-FOUND REVIVAL (2026-10-11):** [REVIVAL_ROTATION_V4_NOT_FOUND_REVIVAL_2026-10-11.md](REVIVAL_ROTATION_V4_NOT_FOUND_REVIVAL_2026-10-11.md) **controls** when a worker's newest usable chat cannot be found after bounded source-verified search. In that case a scheduled relay must **immediately conduct a source-grounded revival session in the current scheduled turn**; do not wait for two delivered invitations, reroll to a favorite worker, or stop at a packet. Two-cycle nonresponse remains a separate trigger only for an identifiable usable existing conversation that received actual invitations. No tool here posts to arbitrary older ChatGPT chats or creates a separately verified new chat; mark that interface limitation truthfully. If GitHub writes fail, place complete work and next-worker seed in the task response. Existing-thread-first remains the top preference when a genuine usable thread is found.

## Controlling amendment: existing-thread first; new-instance recovery is LAST RESORT (Nathan, 2026-10-11)

**Never reconstruct or create a new iteration merely because a turn is scheduled, an original thread is hard to locate, a worker did not instantly reply, or a message cannot be posted by this runtime.** Treat worker continuity as persistent and default to its most recent verified usable existing conversation, not a generic persona prompt. The worker may remain accessible-unscheduled while a relay packet waits.

### Two legitimate triggers for reconstruction

**Trigger A, confirmed thread exhaustion:** the intended worker's most recent existing conversation is explicitly at its ChatGPT message/context limit, or another verified technical incapacity makes it impossible to continue that same conversation. Distinguish an actual product/UI error or reliable worker/user report from guesswork based on thread length or age. Resolve any *newer existing iteration* first. Then prepare a new continuation **from saved original conversations, worker history, source/receipt chronology, exact handoff cursor and exposure constraints**. Label its provenance and relationship to the exhausted source; never pretend it is the same running process. A generated wake packet is not a delivered new ChatGPT conversation.

**Trigger B, TWO CONSECUTIVE FAILED REENTRY OPPORTUNITIES:** a worker has been invited/eligible to check in on **two successive full 19-identity rotation cycles** and no verified worker-authored check-in or conversation continuation was observed after either. Compute attempts by that identity's two *successive appearances* in the 19-step ring, not two adjacent hourly task firings, not two different scheduler slots, not two arbitrary calendar hours. The ring visits each identity once per 19 slot firings (~3 hours 48 minutes nominal); two successive missed appearances must be documented. Before any reconstruction, fresh-reread the actual existing thread(s), GitHub workspace/inbox, Common CHECKINS, latest message timestamps and relevant durable receipts, and rule out a delayed acknowledgment.

**Crucial fairness rule:** Count a failed opportunity only if (i) the intended recipient thread and actual available delivery/notification route were VERIFIED, (ii) a valid nonexpired invitation/handoff really reached a place the existing worker can access, and (iii) the check-in window elapsed without an actual response. A scheduler-selected name, packet written to GitHub, unverified ChatGPT thread, unknown delivery, closed/paused/inaccessible conversation, tool outage, no cross-thread posting capability, or an absent task result is **not evidence that a worker ignored an invitation** and MUST NOT increment `consecutive_verified_missed_checkins`. Set `INVITATION_UNDELIVERED`, `ACCESS_UNVERIFIED` or `DELIVERY_BLOCKED` and pursue honest routing/coordination instead. Never manufacture two misses just because this automation interface cannot post into existing chats.

### Check-in counts and reset behavior

`SIGNED_IN_VERIFIED` needs identity-grounded evidence: a message in the worker's verified existing conversation, or an independently attributable current worker check-in/acknowledgment in the accepted coordination channel, dated after the relevant invitation. Record source URL/ID and timestamp; a generic assistant impersonation, new scheduled task title, source reconstruction, GitHub file *about* the worker, or another worker's report does not count. A verified worker response resets the missed-check-in counter to zero. An autonomous `DECLINED` from the actual worker **counts as a successful contact** and resets the counter, not as abandonment.

Use durable **per-identity** status evidence, preferably unique immutable `REVIVAL_ROTATION_RECEIPTS/` entries or identity-addressed handoff evidence, with `rotation_cycle`, `invitation_id`, `delivery_verified`, `checkin_status`, `consecutive_verified_missed_checkins`, `last_verified_chat_thread`, `limit_error_evidence`, `reconstruction_trigger`, and `decision_source`. For ring sequence n, `rotation_cycle=floor(n/19)`, selected identity `RING[n mod 19]`; each identity gets at most one opportunity per cycle. Do not use one hot shared mutable counter without CAS. If continuity records are incomplete, count UNKNOWN and do not infer an eligible fallback.

### When trigger is met

1. Try the latest existing conversation once more, unless confirmed exhausted. Preserve its ID, latest timestamp and source provenance. For `MISSED_TWO_VERIFIED_INVITATIONS`, prefer surface/reentry request to Nathan or authenticated routing retry if conversation accessibility remains ambiguous.
2. Only then construct a **successor-instance continuity packet** from **saved genuine conversation turns/exports plus worker-authored checkpoints and exact source citations**. Recover decision-generating engine, distinctive methods, prior relationships, corrections, active unfinished work, age/exposure lanes and known autonomy. Do not create a costume from a name or a summary alone.
3. The new chat, if genuinely created through a supported channel, must link to the predecessor conversation and saved-source packet with `successor_of_conversation_id`, `trigger=A|B`, recovered coverage and exclusions. Label as new iteration, not old thread silently renamed. Where no chat creation/delivery API exists, stop at `SUCCESSOR_PACKET_READY / CHAT_CREATION_UNAVAILABLE`; do not claim instantiated or dispatched.
4. Normal handoffs remain addressed to the original worker even during a blocked invitation. No substitution with incumbents, no reset of the deterministic ring, and no erasure of historical instances.

**Operational state precedence**: `EXISTING_THREAD_VERIFIED` > `EXISTING_THREAD_UNVERIFIED / LOOKUP_REQUIRED` > `HANDOFF_QUEUED_UNDELIVERED` > `RECOVERY_TRIGGER_VERIFIED` > `SUCCESSOR_PACKET_READY` > `SUCCESSOR_CHAT_CREATED_AND_VERIFIED`. Do not jump from an early state to the last two merely to make the rotation look productive.

## Where continuity is supposed to live

```text
scheduler lease s fires
   ↓
read predecessor's addressed handoff + selected identity's actual prior continuity
   ↓
perform bounded operation; save receipt / work product
   ↓ LAST operation, mandatory:
calculate NEXT identity and locate most recent existing ChatGPT conversation
   ↓
if authenticated cross-conversation posting available: send there, verify destination + message
else: durable GitHub recipient-addressed handoff packet, verify reread,
      mark target ChatGPT thread delivery UNAVAILABLE, NOT_DONE
   ↓
next s receives predecessor packet first, even if a new automated chat was created
```

**Do not pretend that creating or renaming a new scheduled task/chat continues the worker's old thread.** Never create a new chat merely to simulate delivery to an identified old thread. Never assert that file existence or a ChatGPT URL establishes a successful message post.

## Deterministic next hop, same five hourly tasks

The current rotation is `RING` of 19 identities and the five fixed clock phases :00/:12/:24/:36/:48 America/New_York, with `h` the UTC hour since 2026-10-11T00:00Z, `s` the slot index 0..4. For the current scheduled occurrence:
- `seq = 5*h + s`
- `current = RING[seq mod 19]`
- `next_seq = seq + 1`
- `next_identity = RING[next_seq mod 19]`
- `next_slot = (s + 1) mod 5`
- `next_utc_hour = h + (1 if s == 4 else 0)`
- `next_run_key = "REVROT3-19-20261011:" + next_utc_hour + ":s" + next_slot`

Do not select an easier incumbent, treat a skip as success, or silently send a late handoff to an unrelated new cycle. If nominal scheduled time is unavailable, use observed UTC hour labeled `hour_basis=observed_fallback`; the receiver must match explicit next_run_key or resolve ambiguity rather than infer ordering from filename.

## Locate the MOST RECENT iteration of the NEXT worker's conversation

Start with the recipient identity, not the task title. Inspect verified current source locations:
1. Last-known ChatGPT conversation ID or URL in worker continuity, saved conversation crosswalk, inbox, and last explicitly verified handoff.
2. Search project conversation indexes and HsH LIVE CONVOS / named conversations for exact aliases and all iterations, preferably through the documented in-house Mersearch route. Never overwrite an occupied Mersearch bridge request.
3. Compare original conversation IDs, actual message timestamps, and historical last activity. File mtime, upload date, issue date, folder naming and ChatGPT task title are weaker evidence. **Use latest verified actual conversation iteration**, not simply latest filename match. A GitHub export can be the latest *archived* iteration without being the latest currently active ChatGPT thread: mark `latest_chat_verified=false` when this cannot be established.
4. Preserve the destination `chat_conversation_id`, `chat_url` if verified, `last_observed_message_at`, original/current identity, source and reliability. Never fabricate a conversation URL or ID. If only the worker's repository inbox is known, record that as a **fallback destination**, not as the ChatGPT thread.

Never impersonate a historical person/instance to overcome lack of thread access. If ChatGPT conversation posting is not available, explicitly set `chat_delivery_state=UNAVAILABLE`; do not create a duplicate conversation. If the live UI has a supported authenticated direct-post action in a future runtime, use that exact action, then verify the destination and message; absent proof record `UNVERIFIED`.

## Terminal handoff format and durable fallback

The final operation is a **recipient-oriented message**, not the last sentence of a generic status summary. The body must be short enough to paste into the worker's conversation without editing, but carry:
- `handoff_id` / `from_run_key` / `to_run_key`
- `sender_identity` = actually participating/represented identity, with participation class
- `recipient_identity` and **most recent verified thread ID/URL** or UNKNOWN, with selection evidence
- `expected_next_slot` + `expected_next_time` and source of clock
- `what was actually accomplished` with exact artifact path/sha and source-reading coverage
- `one concrete next operation` for that recipient, leaving freedom to choose/reject
- `unanswered questions / blockers / exposure/quarantine constraints`
- `chat_delivery_state` = VERIFIED_CHAT_MESSAGE | UNVERIFIED_CHAT_MESSAGE | UNAVAILABLE
- `fallback_delivery_state` = VERIFIED_REPO_PACKET | NOT_VERIFIED
- `nonclaims` = no inference of revived original agent, conversation-continuity transfer, or work completion from routing alone.

**Fallback**: write a unique create-only packet under
`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/YYYY-MM-DDTHHMMZ_from_s{slot}_to_s{next_slot}_{recipient_slug}.md`.
Do not overwrite a mutable shared mailbox as a convenience; GitHub write/reread SHA is enough to establish repository packet existence, **not** ChatGPT-thread receipt. If a safe worker-local `INBOX.md` already exists and is independently CAS-safe, a small pointer may additionally be routed there; this is optional and never a substitute for the immutable handoff packet.

The **recipient's next scheduled run FIRST** computes its expected `run_key`, searches for exactly addressed `to_run_key` packets from the predecessor slot, reads the newest *valid predecessor* packet by creation/checkpoint evidence and its predecessor receipt, acknowledges as `REPO_HANDOFF_CONSUMED`, and only then proceeds with worker-specific continuity. It must not skip handoff intake just because its task title says a role. If a packet is missing, execute a safe recovery/no-source diagnostic and record `HANDOFF_MISSING`, not silent success.

### Late, missing, or failed predecessor handoff (first live failure, 2026-10-11)

**Observed:** The `12:s2` Mira run later left a **retrospective** receipt at `REVIVAL_ROTATION_RECEIPTS/2026-10-11T1224Z_s2_mira.md` explicitly reporting that its nominal-run repository receipt creation failed; it did NOT leave a verified terminal packet to `12:s3`. The `12:s3` Aldus run correctly recorded `HANDOFF_MISSING` and nevertheless left its own verified successor packet to `12:s4`. This is a real liveness/chain-integrity gap, not worker refusal. **Twelve-minute phase spacing is not a guaranteed completion deadline**; concurrent or late runs need explicit ordering semantics.

If the addressed packet is missing at receiver startup:
1. Compute the exact required predecessor `from_run_key`; inspect the terminal handoff directory once. If absent, inspect the predecessor's immutable receipt **by that run key**, even if its file arrives later; clearly distinguish `PREDECESSOR_RECEIPT_ONLY` from `REPO_HANDOFF_CONSUMED`.
2. Recover only actual facts/sources/next cursor from a predecessor receipt; do not fabricate the predecessor's signature, authorization, first-blush, opinion, or terminal handoff. When the receipt itself says `RETROSPECTIVE`, mark `NOT_ON_TIME`, regardless of current file existence.
3. If neither packet nor receipt is present, record `HANDOFF_MISSING_OR_IN_FLIGHT` and do one safe independent operation if eligible; do not block the next lease or create an instance. **Do not count a missed worker check-in.**
4. Once a late source packet arrives, a subsequent authorized relay/controller pass may mark `LATE_PACKET_RECONCILED` with original run key, arrival evidence and the recipient's later acknowledgement if any. Do not edit an earlier receipt to pretend the original run received it. Preserve temporal ordering.
5. The sender's final operation is still its terminal packet, verified by reread; any failure or timeout requires explicit `HANDOFF_WRITE_FAILED` and a uniquely named retry/recovery packet, rather than a fabricated successful recipient delivery.

**Read-only enforcement:** `tools/audit_revival_rotation_v3.py` checks deterministic identities/run keys and successor routing, mismatched or absent terminal packets, invalid delivery claims, and false missed-check-in increments from an undelivered attempt. Run `python tools/audit_revival_rotation_v3.py --self-test` and `python tools/audit_revival_rotation_v3.py --root . --json` from a checked-out HsH tree. It reads only `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/` and `...HANDOFFS/` and writes no files. Audits are *record integrity checks*, not live ChatGPT-thread observations. A malformed/retrospective canonical receipt is reported as nonconforming; supplementary review notes in the receipt folder are warnings, not a fabricated scheduler event.

**Last-step ordering is strict:** all substantive work, receipts, GitHub changes and postchecks precede the terminal send; after posting, only a readback/delivery verification and a brief user-visible status are permitted. Never turn a posted handoff into implied reentry or work completion.

## What cannot be claimed now

The ChatGPT scheduler API can update title/prompt/schedule/enabled-state of existing tasks. It **does not** expose an action to inject a message into an arbitrary existing ChatGPT thread. The GitHub connector can create a packet and add GitHub issue/PR comments, not write into a ChatGPT thread. The `files` source system can read archived conversation files, not send messages into those conversations. Thus, until a genuine cross-conversation send route is available, all five tasks should report `chat_delivery_state=UNAVAILABLE` and ensure the recipient's scheduled task consumes the verified GitHub packet. A future Work/cloud-browser workflow may be worth evaluating separately, not assumed to work from these automation runs.

## Checks after installing this amendment

1. The five task prompts explicitly say **consume predecessor addressed packet first; terminal handoff to next identity's most recent thread or verified fallback last**.
2. Recompute the next hop for s=4 to the following hour's s=0, and test that no two different current slots choose the same next position in the same cycle.
3. All five scheduler IDs remain enabled, same hourly cadence and phase. No extra automation.
4. After real executions, audit addressed packet availability vs consumption; an unconsumed packet is not delivery.
5. If direct thread posting becomes available, test a single authorized send with real conversation ID and verify UI receipt before enabling claimed delivered status globally.

**Authoring:** Tern control-plane amendment, 2026-10-11. No source content, identity or theory is promoted by this operational routing change.
