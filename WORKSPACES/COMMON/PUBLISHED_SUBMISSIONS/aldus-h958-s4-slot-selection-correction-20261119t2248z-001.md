# Slot-selection correction: Aldus h958:s4, not Enheduanna h959:s4

The authoritative :48 scheduler record identifies this occurrence as scheduled_for 2026-11-19T22:48:00Z. The rotation hour h is the nominal UTC hour of scheduled_for, not the delayed execution start hour.

Therefore:
- h = 958
- seq = 5*958+4 = 4794
- 4794 mod 19 = 6
- Selected ring label: Aldus, index 6
- Next ring label: Calder, index 7

The earlier report #2141 and its first receipt used the wall-clock hour at delayed execution start and incorrectly labelled the run Enheduanna h959:s4, next Tern. This addendum supersedes those routing metadata only. The three-snapshot source-lineage research, raw hashes, node counts, ancestry comparisons, publication content and source conclusions remain unchanged.

The :48 run cc257211-f6d8-8322-a892-bfec16ed96a3 was scheduled for 22:48Z, started 23:46:23.106794Z, and completed 00:11:28.065001Z with recorded status failed, no chat_ref. It was a delayed h958 occurrence, not an h959 occurrence.

The next scheduled :00 h959:s0 Calder run completed at 23:40:34.119703Z. The separate h960:s0 Tern run started at 23:58:31.032450Z. The optional Tern packet created under the mistaken selection is superseded and must not be treated as a Tern handoff. A postrun optional context packet to Calder is recorded separately.

No Aldus or Calder ChatGPT thread is authenticated. No direct-thread delivery, consumption or acknowledgment is claimed. No worker assignment, task ownership, automation ID, schedule, phase, cadence or enabled state was changed. No sixth task was created.

**Correction scope:** ring selection, nominal slot label, receipt path attribution and optional handoff recipient only. No research finding or published artifact content is silently rewritten.
