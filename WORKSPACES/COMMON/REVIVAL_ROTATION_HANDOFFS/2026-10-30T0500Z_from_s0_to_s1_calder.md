# Late retrospective handoff | Aldus -> Calder

**Original ring slot:** 2026-10-30 05:12Z  
**Next Calder occurrence targeted:** 2026-10-30 09:00Z  
**Status:** repository-only handoff; not consumed by the already-completed 05:12Z Calder run

## Main finding

The 0.246-rad value has migrated through several distinct meanings without a source-supported map:

1. Assistant-generated optical simulation claim in the 2025 SAT Mark V transcript.
2. A separate 2025 phase-shift note reports approximately 0.239 rad, not 0.246.
3. A 2025-06-23 direct correction says the optical anisotropic-slab paper is not a SAT test and refractive index is not a literal direct measure of theta_4.
4. Private raw Library exports from 2026-02-27 and 2026-03-01 contain 0.246 in user-role pasted text with unresolved embedded authorship.
5. The March 1 assistant response explicitly relabels the optical phase as theta_4=0.246 rad.
6. Later Worldlines.txt assistant prose uses 0.246 as an Obscuration Constant and Achromatic Phase Snap.
7. Current BEDROCK BR-005 measures theta_4 from the time normal, zero at null/vacuum, with a rest-limit relation to inverse helical pitch. Its raw originating message remains SOURCE_RECOVERY_BLOCKED.

Do not treat the 0.246 optical phase as theta_4, theta_obs, or a pulsar timing residual without an explicit transfer map.

## Source pointers

- SAT Mark V/SAT_optics_finding.txt, blob d4843caa0dff3b1193f3758790d8c8a27802a4aa.
- SAT Mark V/SAT_Phase_Shift_Note.txt, blob f110f6f7a2e2c1515528619296957acec3518acb.
- SAT TIMESTAMPS.txt, blob 85b3fa8c44792c2c177fbc3859f28ba58c7481d0. The 2025-05-21 row marks the 0.246 claim "Not in source".
- DEVELOPMENT_FULL_CONVOS/Worldlines.txt, blob 1c86774915c8ea9255798a07d06891afe0f23549.
- BEDROCK.md BR-005, current theta_4 convention.
- WORKSPACES/COMMON/extraction_outputs/2026-09-15-LAB1-AFTER-015519.md, role-tagged extraction of the 2025-06-23 correction.
- WORKSPACES/MIRA/2026-10-30_OPTICAL_KINK_SOURCE_CORRECTION.md.


## Final publication verification

- Corrected owner-authored issue: #1084.
- Initial issue #1083 was rejected for missing schema / unsupported filename field, closed, and confirmed to have written no artifact.
- Publisher comment: PUBLISHED, commit 457433f378fc0654ec9ddc8853426cb2461c996e.
- Destination: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-0246-phase-angle-source-fidelity-20261030t0500z-s0-001.md.
- Expected SHA-256: 2213bb89d0d59742547ce9490fd5c1e45cd58d25be106c235b04b01c404cceed.
- Independent readback: issue payload content and committed file both 10,545 characters; exact string equality PASS; published blob e8857f3df72ef4f0d54d543a8b8ac6b4d2ab5ba1.
- Final status: PUBLISHED_VERIFIED. Same submission ID and identical bytes were reused after the schema rejection; no duplicate artifact was created.

## Next work

1. Recover the raw 2026-09-16 source message behind BR-005. Until then preserve SOURCE_RECOVERY_BLOCKED for its raw genealogy.
2. Recover the raw JSON and message UUIDs behind the April 6 Worldlines.txt assistant passage.
3. Recover the original author/source of the 2026 pasted Mach-Zehnder 0.246-rad text. Do not promote user-role relay to Nathan Direct.
4. Keep 0.239, 0.246, B, theta_4, theta_obs, and pulsar timing residuals separate.
5. Require an actual measured optical system and explicit theta_4-to-phase map before physical calculation.
6. Do not add a Lean theorem for Delta-phi=theta_4. Existing Enheduanna PR #800 and Loom PR #1076 cover adjacent angle/projection identities; the physical transfer map is missing.
7. No CODATA scoring and no BEDROCK promotion.

## Publication status at handoff

Corrected issue #1084 was created by repository owner Satobloc with submission ID aldus-0246-phase-angle-source-fidelity-20261030t0500z-s0-001 and expected SHA-256 2213bb89d0d59742547ce9490fd5c1e45cd58d25be106c235b04b01c404cceed. At initial handoff creation, publisher readback was still pending. The first invalid issue #1083 was closed after its schema rejection and no artifact was written. The corrected issue #1084 reuses the same submission_id and identical bytes. Check its existing publisher receipt before any retry. Do not create a duplicate.

This packet is repository-only. The 05:12Z Calder run had already completed, so no receipt or cross-thread consumption is claimed. The next Calder occurrence is 09:00Z; the 08:48Z Aldus slot may provide a fresher handoff before then.
