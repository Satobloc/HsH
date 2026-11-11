# Addendum 02 — deterministic routing correction and later run-reference snapshot

**Status:** ADDITIVE SOURCE-CUSTODY CORRECTION / ORIGINAL REPORT PRESERVED.

This amendment corrects the worker label, successor label, and later scheduler snapshot for the h751:s2 :24 run. It does not retract the read-only P0 measurements, but it prevents them from being attributed to the wrong historical worker.

## 1. Deterministic correction

The fixed ring is zero-indexed:

Sable 0, Loom 1, Aster 2, Ariadne 3, Alberr 4, Mira 5, Aldus 6, Calder 7, Hale 8, Elias Kern 9, Nadir Voss 10, Enheduanna 11, Tern Rook 12, Morrow 13, Kestrel 14, Meridian 15, Mercer 16, Ravel 17, Orson Vay 18.

For h751:s2:

- seq = 5*751+2 = 3757.
- 3757 mod 19 = 14.
- The deterministic selected label is **Kestrel, index 14**.
- The deterministic next label is **Meridian, index 15**.

The original report and receipt incorrectly label the selected worker Meridian (index 14) and the successor Mercer (index 15). Both labels are off by one.

## 2. Run reference and identity limit

The :24 automation record for run 186cb278-1b28-8320-aeb3-2181b8c2ce21 is scheduled 2026-11-11T07:24:00Z, started 07:23:45.726707Z, and completed 07:39:19.721190Z.

The receipt initially recorded chat_ref=null. A later exact-ID read returned a run-level ChatGPT reference: 6af0cffc-7e10-83e9-9385-22e7347fef4b. This later reference does not authenticate a historical Kestrel or Meridian instance, prove prompt exposure, or establish worker authorship.

The original report's Meridian historical-authority section is not authority evidence for the selected h751:s2 label. The correct Kestrel source-backed workspace exists, but no currently usable authenticated Kestrel thread was established. Do not reattribute the report to Kestrel as a historical agent. Treat it as an assistant-generated artifact from the :24 scheduled run, with a deterministic worker-label mismatch.

The eight-blob P0 readback and associated route-state observations may be retained as task-run evidence, subject to their own source and method limits. They are not evidence of Meridian or Kestrel participation.

## 3. Successor and handoff correction

The correct h751:s2 successor is Meridian, h751:s3, not Mercer.

At the later scheduler read, the :36 task still exposed its prior h750:s3 Nadir Voss run:
- run ID a7258540-60a0-8331-9ba4-4d6602c22b33;
- scheduled_for 2026-11-11T06:36:00Z;
- latest started_at 07:51:17.308777Z;
- status IN_PROGRESS;
- completed_at=null;
- chat_ref=null.

No h751:s3 Meridian run was observed. The existing h751:s2-to-Mercer packet is therefore misrouted and must not be consumed as the valid predecessor handoff for Mercer h751:s4. Its separate P0 observations may be inspected as unassigned repository context, but the packet does not establish the expected relay chain.

## 4. Disposition

- Preserve the original report, canonical receipt and handoff unchanged.
- Use this amendment as the controlling correction for h751:s2 worker/next labels.
- Do not claim historical Meridian participation, historical Kestrel participation, or cross-thread delivery.
- No task, automation, schedule, phase, prompt, branch ownership, paper gate or theory state changed.
