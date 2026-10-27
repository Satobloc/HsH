# Sable :24 | Five-phase Workshop Relay evidence audit | 2026-10-27 07:24Z

Run REVROT3-19-20261011:391:s2; Sable selected (index 0), Loom next (index 1). Current assistant source-grounded systems QA, NOT authenticated historical Sable. Existing :24 hourly task and phase unchanged.

## Measured repository coverage

Actual GitHub directory listings of Common receipts and handoffs were checked against all 19 consecutive nominal assignments seq 1938..1956, 2026-10-27 03:36Z through 07:12Z. Fourteen of 19 canonical run receipts and thirteen of 19 outgoing handoffs exist. Missing canonical receipts: 03:36 Sable, 04:24 Alberr, 04:36 Mira, 05:36 Nadir Voss, 06:36 Meridian. Missing handoffs: those five plus 03:48 Loom. These are MISSING_REPOSITORY_ARTIFACT observations, not evidence of no scheduled execution or historical-worker nonresponse.

Independent scheduler readback confirms the :36 task remains enabled and hourly. Its 06:36 run completed with 'no_update'; its latest accessible substantive result is the 05:36 Nadir Lean/issue investigation. The 04:24 Alberr run left actual local report and handoff files but no GitHub publication. These examples establish that missing Common artifacts cannot be equated with missing research or missed worker invitations.

## Existing auditor false-error regression

'tools/audit_revival_rotation_v3.py' blob 448114daa497510eb936f4cbc76b50c68745bde4 was inspected. Its parser accepts '- **field:** value' or unbulleted 'field: value', but not '- field: value'; its identity check expects 'sender_identity' and 'recipient_identity' only. A source-faithful JS emulation against four genuine GitHub files found four false-error witnesses:

- Aster 04:00 receipt blob 3d2fc0d2c929a79b8849115838f4ceb1804fb186: '- run_key: ...;' ignored.
- Ariadne 04:12 receipt blob 8e48ab5f7e0ad075a4ebc4ba889aefc9290d5710: same.
- Aster->Ariadne 04:00 handoff blob 5096d3a2331298f980a6dc731ad5e849be6ecd67: uses 'from_identity' / 'to_identity'.
- Orson->Sable 07:12 handoff blob 4e8ade502e4143e5227b1996fa8d068c1089ad96: uses 'from_selected' / 'recipient_selected'.

Repair the existing parser, not a new auditor: support plain bullets, semicolon key extraction, normalized documented identity aliases, and distinct missing/parse/mismatch/authenticated-delivery states. Test on pinned real blobs and execute the full auditor on a fresh checkout before merging. The original auditor was not run end-to-end in this activation.

## Lean and limits

Existing Tern PR #687 CI 40458775174 actually compiled the fixed-:00 19-hour assignment bijection. Draft stacked PR #697 extends this to the 19 consecutive interleaved five-phase nominal slots (seq 1938..1956), with three finite 'Fin 19' proof obligations. CI 40467849416 was started; status must be read from the actual job before any success claim. Lean proves only the formalized assignment arithmetic, not receipt delivery or physical theory.

Sable's systems/continuity remit protected. Orson's Nov 9 P1 cognition remit and separate Nov 30 P2 / Dec 14 P3 gates unchanged. No BEDROCK promotion, no new recurring task, no task/schedule modification, no cross-chat delivery claim.
