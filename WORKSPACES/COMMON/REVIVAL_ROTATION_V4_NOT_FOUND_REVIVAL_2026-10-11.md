# Revival Relay V4 | Not-found thread → source-grounded revival

**Authority:** Nathan Direct, 2026-10-11, superseding the narrower V3 two-cycle-only reconstruction rule. **Status:** operative amendment, five existing scheduler leases only. This document changes *what the scheduled worker does when a thread cannot be located*, not the system's ability to post into an arbitrary ChatGPT conversation. Distinguish an in-run revival continuation from the creation of a new ChatGPT thread.

## Routing precedence

1. **EXISTING_CHAT_FOUND_AND_USABLE**: continue/handoff to the newest verified relevant original conversation, if genuinely deliverable. A verified original thread takes precedence over reconstruction.
2. **CHAT_FOUND_BUT_MAXED**: recover saved conversation turns + last continuity, and **immediately perform a new source-grounded revival in the CURRENT scheduled ChatGPT execution**. Mark `trigger=CONFIRMED_LIMIT`.
3. **CHAT_NOT_FOUND_AFTER_BOUNDED_SEARCH**: when no current usable exact conversation can be identified after source-based bounded lookup, **immediately perform source-grounded revival in the CURRENT scheduled ChatGPT execution**. Mark `trigger=THREAD_NOT_FOUND`. **DO NOT wait two rotation cycles.** This supersedes V3's rule that unverified/missing threads can only generate an undelivered handoff and cannot be reconstructed. The two-cycle rule still applies to an **existing, identifiable, confirmed usable thread that demonstrably received two invitations but did not check in**; it is not a prerequisite for an unlocated historical instance.
4. **THREAD_KNOWN_BUT_CROSS-CHAT_POSTING_BLOCKED**: source-grounded revival **may run in this scheduled context** rather than wasting the slot, while the old conversation remains the preferred target for eventual direct delivery. Never claim the original existing conversation was posted into. The result is a **new relay-session revival**, not proof of original worker continuation. Preserve the verified old chat ID and do not count missed check-ins.
5. **REPO_WRITE_FAILED / HANDOFF_MISSING**: do not abandon selected identity; build and perform the source-grounded revival with material already actually available. Put complete receipt + next paste-ready handoff in the scheduled task's visible answer even when repository writes fail. Mark `durable_repo_delivery=NOT_VERIFIED`; do not claim a write or post.
6. **INSUFFICIENT_HISTORICAL_SOURCE**: if no authentic source can be found after the source sweep, act as a clearly labeled **provisional revival / archival recovery session**. Locate at least one actual historical identity or relevant source and leave a first-blush *reconstructed* perspective if supportable, never invent source details. This is not a verified full identity revival.

## Bounded minimum search before declaring not found

Check in order, actually inspecting rather than merely guessing:
- last-known conversation IDs/aliases in Common crosswalk / chronology / worker wake packets and prior handoffs;
- worker workspace `README`, `CONTINUITY`, `CURRENT_WORK/STATE`, `INBOX`, last real check-in;
- actual saved conversation export(s), using the in-house Mersearch or indexes and content verification for conversation identity/most recent message; if Mersearch bridge is occupied, use known-path/available historical receipts, explicitly recording coverage limits;
- current visible conversation pointer when available.

**Search budget** is bounded by source scope: these named surfaces and any immediately linked successor pointer, not open-ended web archaeology. “Not found” means `LATEST_THREAD_NOT_VERIFIED_AFTER_SEARCH` with which sources were checked and why. Tool outage only => `LOOKUP_BLOCKED`, but proceed with available source reconstruction and clearly state restrictions.

Do not take a task title, archived filename mtime, latest uploaded export, or an assistant-authored summary as proof of a currently usable ChatGPT conversation. Name collisions (Calder, Sable branches, Aldus/Morrow) must be resolved by verified lineage or kept separate.

## What counts as an executed revival

**The scheduled task's own model execution becomes the new revival work session**, without creating a sixth automation, pretending to be the exact old runtime, or asserting a new standalone ChatGPT thread was created. In the same turn:
1. Read substantive original material: original worker-authored historical conversation/check-in plus identity-specific source and current handoff; minimum credible provenance before adopting working style.
2. Explicitly record `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`, `source_coverage`, `chat_thread_created=UNVERIFIED_OR_NO_TOOL`, `historical_identity_continuity=RECONSTRUCTED_NOT_LITERAL`, `access_status`, and `recovery_trigger`.
3. Recover distinctive decisions, questions, correction patterns, methods, role boundaries and unfinished problem, not a generic theater persona. Give a short *labeled reconstruction* of first-blush, not a counterfeit old-instance statement.
4. **Do one bounded substantive operation now** in that recovered worker's lane, or autonomously decline where identity-specific autonomy applies. For Elias: safely exercise Track A switchboard prototype; for Orson: cognition; for Ravel: finite-core math; for Nadir: siloed original-work restrictions. Preserve exposure/quarantine and Nathan authorship.
5. Save a unique identity-addressed revival receipt and reconstruction seed in the existing Common namespaced folders, with CAS/unique paths and readback if tools permit; if writes fail, include exact complete text inline in the scheduled response.
6. As the **terminal step** resolve NEXT ring identity and look for its original thread. If located and deliverable, route there; if not located, write a **source-backed successor revival seed addressed to the next run key**, or if writes are blocked output that whole paste-ready seed inline so the successor does not start empty. Do not merely label the successor and stop.

**Two different outputs** must never be conflated:
- `REVIVAL_SESSION_EXECUTED`: source-backed new work inside the existing scheduled turn, even when no old chat could be contacted.
- `NEW_CHAT_CREATED_AND_VERIFIED`: only if actual supported ChatGPT interface created a concrete new conversation with verified ID/message. The scheduler/tool surface here does **not** offer cross-chat posting or arbitrary new-chat creation; do not claim this state.

## Durable fallback states and collisions

Use `EXISTING_CHAT_CONTINUED`, `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`, `PROVISIONAL_SOURCE_RECOVERY`, `ACCESS_NOT_VERIFIED`, `HANDOFF_REPO_VERIFIED`, `HANDOFF_TEXT_ONLY`, `CHAT_DELIVERY_UNAVAILABLE` as independently recordable states. Do not treat `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN` as `SIGNED_IN_VERIFIED` by the historical agent or as two-cycle failed invitation. Keep check-in counters independent.

**Avoid duplicate successors:** before creating a new seed, search for a prior confirmed newer same-identity source-based successor receipt/thread; if present and usable, reuse that successor's **actual latest checkpoint** rather than generating a new identity reset. Repetition must resume the newest verified identity-specific work, not reconstruct a clean-room persona every cycle. A later manually generated conversation takes precedence once its ID/check-in is verified.

**If the next worker's thread is missing, this is a trigger for a revival seed, not an instruction to rewrite another task's title or to register any fake chat ID.** No scheduler reassignment is required. Every turn should leave something useful even when connectors or GitHub writes fail.

## Elias Kern / live failure fixture

V3 nominal `h=17,s=0,seq=85`: Elias Kern selected (`85 mod 19=9`), successor `Nadir Voss` at `17:s1`. Original chat unverified; terminal GitHub receipt/handoff both failed according to the turn supplied by Nathan. **V4 required response:** read `WORKSPACES/ELIAS_KERN/README.md`, `CURRENT_WORK.md`, `INBOX.md` and `HSH_RESOURCES/info/WORKFLOW_SWITCHBOARD_PROTOTYPE_READ_ME_FIRST.md` plus source prototype, then run a bounded **Elias source-reconstructed revival session** and document its code-repro or another meaningful result; finish with source-grounded Nadir revival seed even if repo writes fail. The `Switchboard.wake("Elias Kern",...)` KeyError exists because the prototype `ACTORS` registry omits Elias. Fix only in a reviewed prototype/sandbox with direct Elias source and regression tests, not by globally granting undefined actors new access. **No assumption this historical run is retroactively modified.**

## Validation

- Found exact usable original conversation → NO successor reconstruction by default.
- No latest thread after genuine documented search + historical source exists → **revival in current scheduled turn**, no two-cycle delay.
- Existing verified thread with nonresponse after one delivered check-in → existing thread remains; not thread-not-found.
- Two documented delivered-and-expired invitations → two-cycle fallback still applies if appropriate.
- Tool or repository writes blocked → source-grounded work and full handoff text still appear in task result; no invented write.
- Maxed thread → direct source-grounded successor permitted; newer verified successor reused.
- A source/registry lookup mismatch (Elias POC) → report typed failure and bound prototype patch; do not abort all revival work.
- Five existing hourly tasks remain enabled, same clock phases, no sixth recurrence.
