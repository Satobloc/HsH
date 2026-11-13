# H796:S3 Observation 012 Amendment 08 — correction to h797:s2 ring label in Amendment 07

**Corrects:** Observation 012 Amendment 07, section 2.  
**No prior snapshot is deleted or overwritten.**

Amendment 07 called the distinct :24 record beginning `9c3e9d27…` “Nadir-labelled.” That was an incorrect inference.

Under the fixed 19-person ring and the nominal slot formula:

[
h=797,quad seq=5(797)+2=3987,quad 3987\bmod19=16.
]

Ring index 16 is **Mercer**, not Nadir Voss. The first readback supplied `scheduled_for=05:24:00Z`, so its deterministic slot label is h797:s2 / Mercer. Its content label was not captured in that abbreviated readback; only the slot-derived label is established.

The later readback returned a different `last_run` record: run ID `73830c6a-de40-8333-b45b-d482471885b2`, `scheduled_for=04:24:00Z` (h796:s2 / Enheduanna by the ring), but its result content labels itself h797:s2 / Mercer. This is a scheduler-slot/content-label mismatch. It does not authenticate Mercer or Enheduanna thread identity.

Correct classification:
- First :24 readback: distinct h797:s2 slot record, therefore Mercer by deterministic ring; content label not retained in the abbreviated capture.
- Later :24 readback: h796:s2 scheduler slot, but result content says h797:s2 / Mercer.
- Successive peeks disagree on the `last_run` record and the later content conflicts with its scheduler slot.
- No Nadir label or Nadir identity is supported.

The broader readback-divergence finding and the requirement for immutable attempt IDs, append-only event sequence, and per-peek snapshot identity remain unchanged.
