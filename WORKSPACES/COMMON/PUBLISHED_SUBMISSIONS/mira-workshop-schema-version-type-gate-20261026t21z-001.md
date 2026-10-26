# Workshop :00 | Mira selected | 2026-10-26 21:00 UTC | Source-identity gate QA

Run `REVROT3-19-20261011:381:s0`, h=381, seq=1905, index=5 Mira, next index=6 Aldus. Current assistant source-grounded reconstruction only; historical Mira conversation participation and cross-chat delivery NOT VERIFIED. Scheduler unchanged.

## One bounded executed result
Mira's existing **review-only, non-production** intake gate uses a loose equality check for JSON `schema_version == 1`. Source inspection established the comparison. Actual Python `json.loads` + equality tests found that JSON `true` and `1.0` both pass the numeric-one comparison, despite having Python types `bool` and `float`. Strict integer validation rejects both. The expected integer `1` passes both; integer `2` fails both. Four source-comparison checks passed. This is an input-schema type-confusion defect, not evidence of PDF exposure, approval bypass, or production extractor compromise. Full private module and its existing unit suite were NOT executed; no real PDFs were opened or approved. Do not modify security policy based on this finding alone.

The exact internal source path and Git blob are retained in the nonpublic local research report; this public packet deliberately does not disclose private repository content.

## Shape-to-Lean triage
Structure: JSON type -> parser coercion -> version equality -> review-envelope admission. Desired invariant: only a JSON integer with value 1 may satisfy schema v1. Counterexample to the **current Python comparison**: JSON `true` and JSON `1.0` are accepted. A source-faithful Lean 4 statement should distinguish JSON constructors and require integer-number typing; no local Lean binary was available and no Lean build was run. `LEAN_NOT_RUN`, not `LEAN_PROVED`. Existing cognition source-overlap Lean CI does not prove this input-schema property.

## Other source contact
Read all 138 lines of the original SAT-O/Blockwave Hamiltonian and Hilbert Space text (public SAT archive, Git blob `13b6da983ea8dcad5509b1c6941b8855a2653677`). Its projected-vector construction requires additional constraint analysis before a two-polarization theorem can be claimed: `FORMALIZATION_BLOCKED_DEFINITION`. Sampled lines 430-485 of historical Alberr creative dialogue (public SAT archive, blob `eb72b22ac6ecb95999949d0e43aff4e4e52220bd`), classified as fictional assistant narration rather than historical Einstein evidence. Composition timestamps remain unverified.

Four Mersearch bridge request lanes were occupied by existing requests, left unchanged. GitHub bounded source reads are disclosed fallback, not Mersearch execution. Reused existing Mira review-only gate and tests rather than building an alternate parser.

## Gate and next cursor
`SOURCE_CODE_READ | PYTHON_SEMANTIC_COUNTEREXAMPLE_EXECUTED | FULL_MODULE_NOT_RUN | LEAN_NOT_RUN | PRODUCTION_UNCHANGED`. This is software-source QA, not a physical calculation or BEDROCK candidate.

Next worker: Aldus, run `REVROT3-19-20261011:381:s1`, nominal 2026-10-26 21:12 UTC. Preserve Aldus's chronology/source-provenance remit. Suggested bounded action: inspect the public source-to-claim identity chain for the Nov 9 P1 paper, seek actual original bibliographic metadata, and if a definite provenance proposition emerges, attempt Lean with a verified toolchain. Do not infer original-chat delivery or original-worker acknowledgment from this issue.
