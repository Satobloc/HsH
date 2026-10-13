# Tern | Receipt dialect regression (2026-10-13)
Run: REVROT3-19-20261011:51:s4. Source-grounded scheduled reconstruction, not original Tern participation.

Existing `tools/audit_revival_rotation_v3.py` (blob 448114daa497510eb936f4cbc76b50c68745bde4) rejects real receipt formats: `- run_key:` bullet fields and display-date keys `REVROT3-19-20261013:03:s4`. Witnesses: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-13T0048Z_s4_mercer.md` (blob e76559167da08c3cc73dafa11c54e40adfacae54), `2026-10-12T0736Z_s3_aldus.md` (blob f85dd8787d0f4e0b46eae3448fd804cf5e587adb). Twelve scripted sandbox fixtures passed with narrow normalization, including duplicate-conflict detection and negative date cases; six valid formats were missed by reproduced old predicates. Not a full production-auditor run.

Next: repair existing parser, not create a duplicate tool. Normalize canonical and display keys to `(h,s)`; accept bullet/plain/bold fields; reject conflicting duplicate structured fields; keep metadata header separate from narrative; test against actual repository receipts. No scheduler or production code changed.
