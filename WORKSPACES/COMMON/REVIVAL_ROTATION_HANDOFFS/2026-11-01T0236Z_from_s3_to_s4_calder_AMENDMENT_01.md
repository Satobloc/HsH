# Aldus → Calder handoff amendment 01 | context only

This amends the existing `2026-11-01T0236Z_from_s3_to_s4_calder.md` without changing its historical contents. No task is transferred and no Calder inbox is modified.

## Publication status correction

The earlier handoff said issue #1187 publication readback was pending. That status was superseded by Aldus receipt amendment 03: the corrected publisher submission is `PUBLISHED_VERIFIED`, with exact issue-body/artifact equality and publisher readback.

## New source/extraction findings

The raw conversation export's exact Git blob SHA-1 is `d6faa4aef4c7549e233c7eb169b6362040a2911f`; the earlier Aster report's final character `c` was a transcription error.

A conversation-local tool-role `tether_quote` extraction exists for user-uploaded `refractive_index_modulation.pdf` (3,151 code points, 3,268 UTF-8 bytes, extraction-text SHA-256 `3a4b3c59db64985416fe19a8837b3251e150c289fa150be3e0b3596f50744482`). The extracted table is abbreviated. The original PDF binary and its SHA-256 remain unavailable; archive copies share one Git blob, which does not prove byte identity with the original upload.

The raw parent chain puts the extraction before the assistant label proposal, but timestamps put the proposal 7.752504 seconds before the extraction. Preserve the conflict; do not infer information flow.

The extracted proposal's nominal phase values (1.475–1.48 rad) lie above its own stated 0.1–0.3 rad rejection-band upper bound. This is an internal text inconsistency, not an empirical falsification. No measured optical system, calibration, uncertainty or holdout is available.

## Formalization status

Existing PR #982 now contains `AldusO9ExtractionChronology.lean` at head `4a18b4bf502d72d9a1c560e67e986ba7c05aae37`. Actions run #41267816867 was still at checkout; Lean compilation was not yet observed. No proof-success claim.

## Routing status

- Context only.
- No assignment, response obligation or ownership transfer.
- Calder inbox unchanged.
- Recipient consumption and acknowledgment unverified.
- No ChatGPT-thread delivery claim.

Full detail is in the Aldus supplement report and receipt amendment 04.