# Nathan Direct — 2003 image-bundle timestamp typing 11

Date: 2026-09-18
Status: durable provenance checkpoint

## Startup/control coverage

Read current `main` control surfaces before operating:
- `NO_CONVERSATION_RENAMING_POLICY.md`
- `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`
- `AUTOMATION_WORKFLOW_CONTROL.md`
- `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`
- `NATHAN_DIRECT_WORKFLOW_STATE.md`
- `COORDINATION.md`
- `HANDOFFS.md`

Hard no-conversation-renaming rule observed. Current workflow quantum remains one object + one operation + one durable result + one next cursor.

## One bounded operation

Resolve the timestamp-column semantics left open by local-metadata audit 10 for the preserved OneDrive filesystem inventory containing the eight 2003 sketch/notebook PNGs.

## Header recovered

`SAT-ST SELECTIONS.txt` preserves the inventory header immediately above the file records:

`"FullName","CreationTime","LastWriteTime","LastAccessTime"`

This directly types the three previously unresolved timestamp columns. No inference from column order is now necessary.

## Typed eight-image sequence

All eight canonical image-family members are consecutive under `C:\Users\Admin\onedrive\sat_onedr_archive\2003 SKETCHES\`.

- image 1 — CreationTime `5/10/2025 11:33:06 PM`; LastWriteTime `5/10/2025 11:33:06 PM`; LastAccessTime `10/27/2025 11:17:42 PM`
- image 2 — CreationTime `5/10/2025 11:33:41 PM`; LastWriteTime `5/10/2025 11:33:42 PM`; LastAccessTime `10/27/2025 11:17:41 PM`
- image 3 — CreationTime `5/10/2025 11:34:13 PM`; LastWriteTime `5/10/2025 11:34:13 PM`; LastAccessTime `10/27/2025 11:17:41 PM`
- image 4 — CreationTime `5/10/2025 11:34:44 PM`; LastWriteTime `5/10/2025 11:34:44 PM`; LastAccessTime `10/27/2025 11:17:41 PM`
- image 5 — CreationTime `5/10/2025 11:35:14 PM`; LastWriteTime `5/10/2025 11:35:15 PM`; LastAccessTime `10/27/2025 11:17:41 PM`
- image 6 — CreationTime `5/10/2025 11:35:57 PM`; LastWriteTime `5/10/2025 11:35:57 PM`; LastAccessTime `10/27/2025 11:17:41 PM`
- notebook exterior — CreationTime `5/10/2025 11:36:46 PM`; LastWriteTime `5/10/2025 11:36:46 PM`; LastAccessTime `10/27/2025 11:17:41 PM`
- notebook No. 42 exterior — CreationTime `5/10/2025 11:37:29 PM`; LastWriteTime `5/10/2025 11:37:29 PM`; LastAccessTime `10/27/2025 11:17:41 PM`

The creation sequence spans 4 minutes 23 seconds. CreationTime and LastWriteTime are identical or differ by only one second for all eight files.

## Immediate derivative artifact

The same inventory records `SAT PDF Galleries\SAT_Earliest_Notebook_2003_Documented.pdf` with:
- CreationTime `5/11/2025 12:50:47 AM`
- LastWriteTime `5/11/2025 12:50:48 AM`
- LastAccessTime `10/27/2025 11:18:22 PM`

This is 1 hour 13 minutes 18 seconds after the final image-family CreationTime.

## What this establishes

The surviving filesystem inventory establishes that, in the inventoried OneDrive filesystem state, the eight named PNG files had CreationTime values between 2025-05-10 23:33:06 and 23:37:29 and LastWriteTime values essentially simultaneous with creation. A named derivative notebook PDF had CreationTime 2025-05-11 00:50:47.

The same inventory's LastAccessTime cluster on 2025-10-27 is temporally consistent with the later public-repository packaging date already recovered, but LastAccessTime alone does not establish that Git publication caused the access event.

## Important limit

Windows filesystem `CreationTime` is creation of that file entry on that filesystem/volume, not automatically original camera capture time, original PNG encoding time, or first-ever existence of the image. Copying/moving/restoring/synchronizing files can affect filesystem timestamps. Therefore do **not** relabel the May 10 values as photograph-capture dates without independent metadata.

The correct strengthened chronology statement is:

**Earliest currently recovered typed local-filesystem manifestation: OneDrive `CreationTime`, 2025-05-10 23:33:06 through 23:37:29 local filesystem display time; photograph capture date remains open.**

## Source-family / duplicate handling

No new image manifestation was added. This operation types metadata for the already identified eight-file family. Existing cross-manifestation status remains:
- images 1,2,3,6: byte-identical 2025 Git ↔ 2026 live upload;
- remaining four: filename/dimensions/original-size consistent, original-byte comparison blocked by lossy materialization.

## Bibliography/source ancestry

Internal source-ancestry work only; no external literature consulted and no quarantine exposure.

## Capability / QA gain

Filesystem timestamp semantics must be preserved by field name. `CreationTime` ≠ capture time; `LastWriteTime` ≠ conceptual-origin time; `LastAccessTime` ≠ publication event without an independent bridge.

## Current frontier / exactly one next cursor

Recover the raw May 10–11, 2025 Nathan-authored conversation context that generated or introduced `SAT_Earliest_Notebook_2003_Documented.pdf`. The PDF-generation execution is already recoverable in a raw conversation export; next pass should locate the enclosing `role=user` messages and exact wording immediately preceding the image/PDF construction, without treating assistant captions as Nathan-authored content.
