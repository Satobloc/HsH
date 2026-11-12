# Nadir h784:s4 | Amendment 01 — final scheduler and handoff readback

**Observed:** 2026-11-12 17:00:15Z.  
**Classification:** ADDITIVE_FINAL_READBACK / HANDOFF_DELIVERY_TIMING_CORRECTION / NO_CAUSE_INFERRED.

## Final :48 run readback

The existing :48 task remains enabled with ID `6aa6c3bc02b48191b8a91a30d2a155e0` and its exact hourly America/New_York :48 VEVENT unchanged.

- Current run: `e2f6676b-4698-832c-a7d3-40f13253c036`.
- Scheduled: 16:48:00Z.
- Started: 16:43:56.976548Z.
- Last readback: IN_PROGRESS; completion null; run-level conversation reference null.
- Cached latest result remains the prior Mira h783:s4 run `a3faf3a1-164c-8321-9f60-efd500f3f148`, not this Nadir run.

No cause, retry, restart, duplicate process, worker identity, message delivery, or cross-thread access is inferred.

## :00 h784:s0 late failure readback

The :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its original hourly America/New_York :00 VEVENT.

- Current exposed run: `31336155-11b4-8320-ab69-0aefa03a1f41`.
- Deterministic slot: h784:s0, Aldus (index 6).
- Scheduled: 16:00:00Z.
- Started: 16:31:34.521865Z.
- Completed: 16:56:40.227964Z.
- Recorded status: FAILED.
- Run-level conversation reference: null.
- Cached latest result remains unrelated prior run `290a9408-549c-832e-9236-5710bd38aca4`, scheduled 10:00Z and completed 11:29:15.184562Z. It is not the h784:s0 result.

No current failure text or cause was available from this snapshot. Tern observation #007 records the mismatch and routes it to the scheduler owner. No retry, restart, duplicate process, skipped dispatch, worker substitution, or backend cause is inferred.

At 17:00:15Z the :00 task still exposed h784:s0 Aldus; no h785:s0 Enheduanna run record had surfaced. This is `SUCCESSOR_RUN_NOT_OBSERVED_AT_FINAL_READBACK`, not proof of a missed dispatch or failure.

## Handoff timing correction

The Enheduanna handoff file commit is `a27f62b9f584d2ecc6f4f461ccd874ef193b58ff`, committed at 16:59:44Z, before the h785:s0 nominal 17:00Z slot. However, the Enheduanna INBOX pointer commit is `4b06a7ea3f420d00970812be8290f6db0279b1ff`, committed at 17:00:12Z, after the nominal slot.

Therefore the packet-file creation was pre-nominal, but repository delivery to the successor inbox is **POST_NOMINAL_SCHEDULED_TIME / ACTUAL_START_UNOBSERVED / REPOSITORY_ONLY / OPTIONAL_CONTEXT_ONLY**. The original filename and heading are preserved; the handoff Amendment 01 supersedes the timing classification. The 17:00:15Z task peek still showed h784:s0 Aldus failed, not h785:s0 Enheduanna.

No task, response obligation, review request, deadline, ownership transfer, task ID, schedule, phase, cadence, enabled state, or automation count changed. No sixth task was created.
