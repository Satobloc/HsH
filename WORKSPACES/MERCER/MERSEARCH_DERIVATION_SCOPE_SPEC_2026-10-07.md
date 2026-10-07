# Mersearch derivation search experimental specification (2026-10-07)

Status: sandbox; do not change pinned mersearch-stable-1.0 semantics.

## Retrieval unit and scope
Allow --scope 600 --scope-unit characters|tokens|lines; overlapping windows default 50%. Keep source byte/character offsets and map to line/message locators. Distinguish intra-message windows from across-message adjacency; cross-message search must retain both message authors and chronology.

## Candidate scoring (not mathematical proof)
Detect >=2 equations, adjacent symbol overlap, changed symbol sets, logical connectors (therefore, hence, implies), transformation verbs (substitute, integrate, rearrange), boundary/initial assumptions, checks (units, residual, limit), and correction/reversal language. Do not rank equation density alone as a derivation. Label results DERIVATION-CANDIDATE, not DERIVED. Return contributing cues, scores, exact context and offsets.

## Related equations
First retrieve exact/notation/structural/algebraic candidates with typed relations and assumptions. Then expand source-local neighbors by adjustable window. Construct candidate directed edges for substitution, isolation, differentiation, integration, limit, numerical evaluation, correction, and reuse; CAS verification must be separate from heuristic cue detection. Keep OCR-mangled variants as UNPARSED.

## Safety and evaluation
SymPy parse must use an AST allowlist, bounded expression complexity and timeouts in isolated workers for untrusted corpus input. Default exclude PRIOR_ART and QUARANTINE. Stable release requires regression tests, negative controls, performance tests and real-corpus smoke runs.

## Required acceptance cases
- B=3/(4*pi) => M=3/(2*B^5) => M=2*pi/B^4, with explicit assumption.
- sqrt(3)/(2*B^5) is NOT equivalent to 3/(2*B^5).
- Two unrelated equations sharing B are NOT automatically a derivation.
- Correction after derivation remains separately visible.
- Mixed LaTeX, Unicode, plain text, OCR-damaged expressions preserve raw source and parser status.
