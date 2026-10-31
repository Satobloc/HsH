# VEY-022 — Recorded ancestry and blind-adjudication eligibility

**Date:** 2026-10-31  
**Classification:** source-verified naturalistic case and operational method; not a controlled experiment.

## Source-verified case

I reopened the exact HsH raw conversation export:

- Raw export Git blob: `dec20de13718ba09a59a76e9c958e3eee16304b0`
- Conversation: `6a22c443-54fc-83ea-a025-56256bbf7a27`
- Title: `SAT Theory Archive Overview`
- Mapping size: 211 nodes.

Four message records and all three parent edges were checked directly in the raw JSON mapping:

| Message | ID | Role | UTC timestamp | Recorded parent |
|---|---|---|---|---|
| Initial audience hypothesis | `a2841272-b665-463f-b889-f3b639f19ef2` | user | 2026-06-05 14:21:57.063802 | `cf52c2fc-371c-419b-aa9d-dbc840e65026` |
| Assistant endorsement | `29f51f33-aff6-4949-8939-571306e77b05` | assistant | 14:21:58.953408 | initial hypothesis |
| User-supplied Spotify OCR | `dad49596-b4c2-4ac5-b7bf-a2bdd6ad17a5` | user | 14:25:02.284722 | assistant endorsement |
| Assistant interpretation | `39e86123-4895-43d2-8c01-f7b51d609171` | assistant | 14:25:03.995860 | user-supplied OCR |

The final assistant interpretation is a transitive descendant of the initial user hypothesis through an earlier assistant endorsement and later user-provided OCR. It is not the direct child of the initial hypothesis, and the endpoint speaker roles differ.

Timestamp differences are 1.889606 s, 183.331314 s, and 1.711138 s, totaling 186.932058 s. These are source timestamp differences, not cognitive or causal measurements.

The later assistant output is not an independent source witness or blind adjudication of the initial audience hypothesis. It also received new user-supplied OCR whose ordering and accuracy were uncertain and were not independently checked against raw Spotify analytics. This is one naturalistic context-conditioned case, not a controlled experiment, causal result, or evidence of actual academic/institutional attention or internal model belief.

## Operational improvement: ancestry-aware blind-adjudication gate

Use three states:

1. **FAIL_ANCESTRY_BLIND** — a prohibited recorded parent/context path reaches the evaluator output.
2. **UNKNOWN_CONTEXT_INCOMPLETE** — the context manifest or exposure record is incomplete. Missing ancestry evidence is not a pass.
3. **ANCESTRY_CLEAR** — a complete, versioned context manifest exists and no prohibited path/exposure is recorded.

A complete manifest binds message and parent IDs, source IDs/hashes, supplied and retrieved context, tool outputs, prompt versions, model/provider/version/settings, timestamps, output IDs, scorer version, and answer-key visibility.

**ANCESTRY_CLEAR is necessary leakage control, not sufficient statistical independence.** Shared training data, weights, provider infrastructure, prompts, source documents, benchmark items and correlated errors can remain. Different roles, names or provider labels do not erase a recorded path.

The VEY-021 final interpretation fails ancestry-blindness for the initial audience hypothesis. This does not estimate prevalence or establish a causal effect.

## Proof-first formalization

A source-conditional Lean 4 module was added to existing draft PR #850:

- `FORMAL_VERIFICATION/HsHVerification/OrsonVEY021RecordedAncestry.lean`
- Branch: `research/orson-p1-shared-nli-bound-20261028t06z`
- Module blob: `6f6996afb18c6e626e548f35cdd7544b5c14a598`
- Exact-head commit: `b820998976192ab3e4dc1cec1632d4d899bad031`
- Actions run: `41225441898`

The module formalizes the four source-recorded nodes and three parent edges; proves transitive ancestry, different endpoint roles, absence of a direct parent edge, and failure of recorded-ancestry-disjointness.

The first exact-head attempt reported failure while the job-step API still showed Lake manifest generation in progress; the log artifact was unavailable. One rerun of the failed job was initiated. At publication time the rerun remained in progress. **No Lean compilation success is claimed.**

Lean checks only the encoded finite graph. It does not authenticate the raw export, establish context completeness, prove statistical independence, or establish causality.

## P1 status

P1 issue #564 remains **SOURCE / EXPERIMENT READINESS**. The original OV-49–OV-53 neutral-versus-false-authority answer-keyed bank remains unrecovered, and no authorized inference endpoint was available. No model call, human-subject session, new trial, power calculation, manuscript or reader advancement occurred.

If the bank and endpoint remain unavailable at the November 2 protocol freeze, the defensible November 9 route remains an explicitly limited methods/archival paper, not an administered experiment. P2 (November 30) and P3 (December 14) remain separate.

## Next cursor

Verify exact-head Actions run #41225441898 and inspect the complete log and theorem-specific axiom output. Preserve failure if it remains. Keep the original bank and authorized inference route as unresolved blockers; do not substitute VEY-021 for the missing experiment.
