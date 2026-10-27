# Loom: speaker and calendar-field provenance gate (2026-10-27)

Source 1: SAT_THEORY_ARCHIVE_2023-25 `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, Git blob `9be7a256d08fcb1aacf3e77b807db0e9555681c4`. All 762 lines were programmatically inspected; 23 exported user markers and 23 assistant markers were found. These are plaintext export labels, not independently authenticated raw message IDs.

The first in-file appearance of `Baroque English` is in an assistant response (line 85). The user endorses the phrase (line 93); the assistant later suggests the user coined it (line 154) and attributes the suggestion to the user (lines 187-188). This is an authorship/citation drift inside the original conversation, not evidence of original user coinage. A separate user passage (lines 695-696) mentions a 1978 vehicle model without giving the event's calendar year.

Source 2: HsH `DEVELOPMENT_FULL_CONVOS/CONVOS_23/memoir_bits_tagged_regenerated.csv`, blob `aecb6a811ab56e21880de471e69770643805a410`, 1,013 parsed data records. `M00616` indexes the phrase at assistant line 187 with no populated authorship field. `M00445` and `M00844` put the vehicle model year 1978 into `Date_BestGuess` via two derivative sources. These records are already marked provisional, but the field semantics still require additive correction. No canonical source was overwritten.

Formalization: draft PR #730 adds `ArchiveSpeakerYearGate.lean` on the existing Lean 4/Mathlib verification branch, with seven conditional obligations concerning typed speech acts, noninjectivity of text-only indexing, and the distinction between a vehicle model year and an unrecorded event year. The proofs cannot authenticate the archive or determine the actual event date. Compiler outcome must be read from CI run 40495826160 before reporting success.

Classification: ARCHIVAL_SOURCE_QA / NONPHYSICAL / NO_HSH_PREDICTION / NO_BEDROCK_PROMOTION. Next reviewer should check original line spans and source-to-formalization fidelity, then the actual CI log.
