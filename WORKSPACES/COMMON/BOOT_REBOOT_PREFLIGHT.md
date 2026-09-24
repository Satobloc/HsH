# BOOT / REBOOT PREFLIGHT

Purpose: make startup and identity restoration reconstructable rather than memory-dependent.

## OPEN — before substantive work

1. **BOOT** — read the current preference/runtime BOOT and landing manifest.
2. **CAPABILITIES** — verify the tools/surfaces required by the assignment are actually available. If not, tell Nathan when material and use an authorized fallback signal/path rather than silently stalling.
3. **CURRENT CONTROL** — resolve the current directive/control surface; do not substitute remembered state.
4. **IDENTITY** — for a named worker, read its registry/workspace/checkpoint/handoff chain.
5. **SOURCE CONVERSATION** — when rebooting/reviving a named conversational identity, locate and read the source conversation that individuated it, not only the continuity abstraction. Prefer direct directory/recent-delta navigation for newly added material; do not interpret index/search lag as absence.
6. **READABILITY** — verify the source is operationally readable with current tools. A huge one-line/minified export that exists but cannot be chunk-read is a blocker, not a completed reboot. Where practical, maintain a chunk-readable derivative or reboot packet beside such sources.
7. **CURSOR** — recover unresolved obligations/current cursor before acting.

A boot/reboot is not complete merely because the assistant knows the worker's name or has read its README.

## CLOSE — housekeeping / redundancy

Before ending a boot/reboot or major continuity handoff, ask internally:

- Did I actually read the identity source(s) I claim to have loaded?
- Did any capability/readability/indexing failure occur that should be logged?
- Is the current cursor durable somewhere authoritative?
- Would the next instance know exactly where to start without relying on chat memory?
- Does a source need a chunk-readable derivative/pointer/checkpoint for redundancy?

Keep this reminder compact; it is a guardrail, not a ceremony.

## ROT5/Kestrel diagnostic — 2026-09-24

Observed failure chain:
- Kestrel entrant lease initially lacked GitHub capability.
- Alternate recurrence note successfully surfaced the blocker.
- After GitHub access was supplied, the ROT5 receipt was written.
- During subsequent Kestrel reboot, indexed search was tried against a newly added conversation and returned no hit.
- Direct listing of `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21` immediately found `KESTREL Orig. Science Made Stupid — raw (3).json`.
- The source is ~13.5 MB and minified to one line. Current GitHub connector can identify it but cannot retrieve it whole due size, while line-range retrieval cannot meaningfully chunk a one-line export.

Simple prevention:
**BOOT → CAPABILITY → CONTROL → IDENTITY → SOURCE → READABILITY → CURSOR**, with the close reminder above.
