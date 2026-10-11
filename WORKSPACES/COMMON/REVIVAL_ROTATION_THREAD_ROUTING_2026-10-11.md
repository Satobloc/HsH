# Revival Rotation | Recipient-Thread Handoff Contract | 2026-10-11

**Status:** controlling operational amendment to [REVIVAL_ROTATION_V3_2026-10-11.md](REVIVAL_ROTATION_V3_2026-10-11.md) following Nathan's explicit directive: *each turn's LAST operation resolves who's next and writes the handoff into the most recent iteration of that worker's existing conversation thread.* The title of an hourly recurrence is a lease label, **not** a conversation destination. Current automation tools do not implement direct writing into another existing ChatGPT conversation; so the fallback MUST be mechanically consumable, recipient-addressed and truthfully marked as undelivered to that conversation.

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
