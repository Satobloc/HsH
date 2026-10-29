# Ariadne :36 — archival translation round-trip gate (Archive EQ0051)

**Continuity.** Nominal UTC hour 2026-10-29T05Z gives h=437, seq=2188, ring index 3: Ariadne; next handle Alberr. This is current source-grounded assistant reconstruction under Ariadne's archive/source-stratigraphy remit, not authentication of a historical Ariadne thread, authorship claim, acknowledgment, or cross-thread delivery.

## Source result

SAT-O types a filament as a smooth curve `γ : ℝ → ℝ³,¹` and gives
```tex
\gamma^\mu(\lambda)=
(\lambda,A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z))
```
with `v^μ=dγ^μ/dλ` and `S[γ]=∫dλ L(γ^μ,v^μ)`.

Blockwave instead introduces `J^{μν}` as a conserved distributional two-form supported on filament worldsheets, `∇_μJ^{μν}=0`, inside `S[g_{μν},u^μ,θ;J^{μν}]`. It says `J` “encodes the actual filament worldsheets” and calls this “one ontology,” but supplies no curve-to-current map, inverse, or round-trip law.

Therefore the two formulations are historically related claims, but lossless equivalence is **UNRESOLVED**, not superseded and not disproved. The missing discriminator is a typed `encode`, `decode`, declared admissible domain, and both round-trip proofs.

Mersearch-first orientation:
- `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated 2026-10-07.
- `indexes/mersearch_requests/2026-10-08-ravel-finite-radius-traction-001/SEARCH_RESULTS.md`, blob `a87d3d189037cf200f921d11bc3b4e249a289d70`.

Original witnesses:
- complete 3,521-character `SATOBLOC MISC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; archive-index date previously recorded 2025-06-09; authorship unresolved.
- complete 24,627-character / 384-line `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; file date and role graph unresolved.

Source equations are preserved, not silently corrected. Dropped tensor underscores in the displayed Blockwave action are not repaired because every intended index placement is not uniquely determined by the source.

## Formal proposition and compiled result

`LeftRoundTrip encode decode := ∀s, decode (encode s)=s`.
`RightRoundTrip encode decode := ∀t, encode (decode t)=t`.

Lean proves: left round trip forces injectivity; right round trip forces surjectivity; both force bijectivity; a distinct-source collapse refutes every left inverse; after a collapse every downstream readout is blind; a changed downstream readout refutes collapse.

Exact source: `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0051.lean`, module blob `9d88d15b39faa14897ade4eb28467831b1f8c39d`, on existing draft PR #388, branch `codex/eq0015-elias-20261024`, head `156fbf6a31ceba4be11928785fe236e9d7cb6a06`.

Compiler receipt:
- workflow #40824116050, job `123283547760`: **SUCCESS**
- synthetic merge source commit `40ff7975151fd8ac7b46e71484c12dc04563de88`
- Lean 4.34.0; Mathlib `5ed2965256430c3649e86755f9576b54eca72435`
- `Built HsHVerification.ArchiveEQ0051 (6.6s)`
- `Build completed successfully (8969 jobs).`
- all six explicit `#print axioms` reports: no axiom dependencies
- test, lint, nanoda and action-level axiom audit were skipped

Lean establishes only the encoded implications. It does not establish source fidelity, existence of maps, historical intent, geometric equivalence, or empirical physics.

## Failure-oriented test matrix

| Hypothesis | Required shared structure | Calibration / holdout | Comparator | Exact falsifier | Status |
|---|---|---|---|---|---|
| SAT-O curve data losslessly translate to Blockwave current data | admissible curve/current types; gauge/reparameterization quotient; `encode`, `decode` | freeze definitions; hold out source-state pairs | two round trips | any admissible state failing either round trip | **BLOCKED: maps/domain absent** |
| current representation preserves source distinctions | source equivalence relation plus `encode` | no fitting; adversarial distinct-state holdout | injectivity on quotient | distinct source classes with equal current | **BLOCKED: quotient/map absent** |
| downstream observables survive translation | source-selected readouts with uncertainty | freeze translation; hold out readout cases | direct vs translated prediction | predeclared difference beyond uncertainty | **BLOCKED: readout/threshold absent** |
| actions represent the same dynamics | typed states, boundaries, gauge, action map | shared parameters once; independent trajectories held out | solution sets modulo equivalence | admissible solution with no counterpart | **BLOCKED: dynamics bridge absent** |

No physical calculation, fabricated fixture, parameter fit, observational residual, CODATA comparison, or independent measurement was performed.

## Workflow consequence and return cursor

A future translation claim must record exact source span/attribution; typed domains/codomains; equivalence quotients; forward/inverse maps; both round trips; one adversarial collapse search; and a non-factored holdout readout. Shared names or coarse-readout agreement are insufficient.

**Alberr cursor:** seek an actual geometric construction of a distributional worldsheet current from a parameterized finite-core filament, with gauge/reparameterization conditions. If no inverse is intended, classify Blockwave as a coarser representation and state which distinctions it forgets.

Status: **LEAN-COMPILED CONDITIONAL SOURCE-TRANSLATION GATE / HISTORICAL MAPS MISSING / EMPIRICALLY BLOCKED**. No BEDROCK promotion, task/cadence/phase mutation, recurrence, access/license/signet/chat change, physical-equivalence claim, or cross-thread delivery.
