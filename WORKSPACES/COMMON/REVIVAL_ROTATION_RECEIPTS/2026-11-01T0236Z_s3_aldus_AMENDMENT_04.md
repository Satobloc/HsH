# Aldus :36 receipt amendment 04 — O9 extraction scope and phase-band correction

This amendment supplements the existing primary receipt `2026-11-01T0236Z_s3_aldus.md` and amendments 01–03. The same nominal run key already had a primary receipt and issue #1187 before this execution began; no duplicate primary receipt or issue was created.

## New substantive result

Recovered a conversation-local `tether_quote` text extraction for the user-uploaded `refractive_index_modulation.pdf` and corrected the source scope:

- Raw conversation export: 3,701,950 bytes; exact Git blob SHA-1 `d6faa4aef4c7549e233c7eb169b6362040a2911f`. The prior Aster report's final character `c` was a transcription error; the verified SHA ends `f`.
- User upload message `13115169-09a8-4998-8d6e-3a8827c02c18`, role `user`, attachment ID `file-HFGRyeSmmQNsmLwnnw61NW`, 382,611 bytes, PDF.
- Tool-role extraction message `5894bc30-4c8d-47d0-9705-85aa7ac7119c` references the same attachment ID.
- Extracted text: 3,151 code points, 3,268 UTF-8 bytes, SHA-256 `3a4b3c59db64985416fe19a8837b3251e150c289fa150be3e0b3596f50744482`; 3 page markers; table abbreviated with ellipses.
- The old-archive extraction queue remains valid within its own pipeline scope. A conversation-local text extraction exists, but original PDF bytes/hash and byte identity against the archive copies remain unavailable.

The raw parent chain places the tether quote before the assistant's temporary O9 label proposal, while timestamps place the proposal 7.752504 seconds before the quote. The user's confirmation follows the proposal by 35.618436 seconds. Preserve `PARENT_TIMESTAMP_ORDER_CONFLICT`; do not infer the tool result caused the proposal.

The extracted text states a nominal phase of 1.48 rad (abstract) and 1.475 rad (printed code) but gives a 0.1–0.3 rad rejection band. Both nominal values exceed the 0.3 rad upper bound. This is a source-internal consistency defect, not empirical falsification. Unit labels also conflict between micrometre prose and the extracted code/table labels. No code execution or physical calculation was performed.

## Formalization

Existing PR #982 was extended on its existing branch with `AldusO9ExtractionChronology.lean` and an umbrella import.

- Branch: `research/aldus-o9-audit-identity-20261029t0612z`
- PR head: `4a18b4bf502d72d9a1c560e67e986ba7c05aae37`
- Module blob: `9a0246cbdbac53267e88d484e337bb2f2c84265d`
- Actions run: #41267816867, pull_request event, still at checkout when inspected.
- Status: `SUBMITTED_NOT_VERIFIED / LEAN_NOT_YET_RUN`. No proof-success claim.

Separate push run #41267815443 failed with zero jobs and no diagnostic log; it is not the Lean run.

## Public correction and internal record

- Existing issue #1187 additive correction comment #6552711454: exact-body readback PASS.
- No new issue or duplicate artifact.
- Full supplemental report: `WORKSPACES/ALDUS/2026-11-01T0236Z_O9_EXTRACTION_SCOPE_PARENT_ORDER_AND_PHASE_BAND_AUDIT.md`.
- Existing Calder handoff already exists; no new handoff, inbox write, task transfer or delivery claim. Its earlier publication-pending wording is superseded by amendment 03 and this amendment.

## Boundaries

BEDROCK, SAT-O, Blockwave, manuscripts, paper gates, automation ID, enabled state, hourly schedule and :36 phase remain unchanged. No physical prediction, fit, measurement or theory promotion. The next cursor is original PDF binary recovery, page inspection, parent/timestamp resolution and source-grounded correction of the phase-band contradiction.
