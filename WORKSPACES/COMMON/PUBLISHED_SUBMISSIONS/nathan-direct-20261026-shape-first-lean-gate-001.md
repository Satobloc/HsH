# Nathan Direct | Shape-first Lean-proof shift | 2026-10-26

**Status:** user-issued research directive; proposed worker operating protocol. **Authority:** Nathan Direct request dated October 26, 2026. This file is an assistant transcription and implementation proposal, not a signed quotation or a BEDROCK edit.

## Mandate
Every SAT/H(s)H research worker, across all lanes, must place **Lean-oriented formal proof testing** at the center of any task containing, referencing, describing, or admitting extraction of mathematics or geometry. The sole exclusion is material containing *no* explicit mathematics **and** no mathematical or geometric structure in the text that can be extracted into a meaningful claim. Philosophical and cognitive-science work is not automatically excluded: structures of relations, transformations, information flow, state spaces, orderings, temporal patterns, and invariants are candidate formal subjects. “Everything is shape” is a research framing; it is not itself a mathematical theorem.

This is a focus shift, not an order to abandon existing worker lanes. Recover exact claims from original sources, locate later source-backed corrections, and test typed theorem statements with explicit hypotheses. Continue BEDROCK's real-data-first rule for all calculations; do not invent toy numeric fixtures or execute data-free calculations without specific Nathan permission. Symbolic formalization is not an exemption from this gate when it entails a calculation.

## Claim-by-claim proof procedure
1. **Inspect source.** Recover document path, Git blob SHA, line/span, original notation, date/author *as evidenced*, historical-to-current construction translation, and controlling BEDROCK/status. Use Mersearch-first; preserve privacy and read-only archive boundaries.
2. **Extract shape.** Identify mathematical objects, dimensions, domains, transformations, compositions, maps, symmetries, invariants, conservation statements, metric/signature assumptions, and geometric constraints. For prose-only work, classify whether any genuinely mathematical or geometrical proposition is recoverable; explain any no-math exception.
3. **Type-check the claim before proving.** Record quantifiers, parameter dependence, units, prerequisites, topology, observables, applicable model and version. Disallow silent replacement of the historical claim with an easier surrogate. Distinguish pure mathematical theorem from a bridge assertion about a real physical system.
4. **Prove/play.** Construct Lean 4 and mathlib theorem(s) if feasible, with executable source and project dependency versions. Separate a theorem restating a definition, a proof that requires additional hypotheses, a nontrivial verified proof, and an attempted or blocked theorem. Include explicit counterexamples or failed theorem statements in a separate audit without declaring them proofs. External solvers can precheck only; `sorry`, `admit`, `axiom` for the disputed claim, unverifiable `native_decide`, and unchecked proof templates are not a proof pass.
5. **Run checks.** Claim `LEAN_VERIFIED` only after an actual successful trusted Lean build on the displayed file, with command, toolchain, mathlib version/commit, complete output, no placeholders/admitted assumptions, and any checker warnings investigated. Otherwise use `LEAN_DRAFT_UNCOMPILED`, `LEAN_COMPILE_FAIL`, `LEAN_COUNTEREXAMPLE`, `FORMALIZATION_BLOCKED` or `NO_EXTRACTABLE_MATH` as appropriate. A formal theorem is conditional on its explicit assumptions; it is not an empirical measurement.
6. **Physical gate.** Where an empirical calculation follows, use a specified real physical system, genuine measured dataset, traceable input units and uncertainties, independent prediction versus calibration, observed-versus-predicted residual, and CODATA version where relevant. If data-free calculation seems necessary, stop and obtain Nathan's specific prior authorization (`BLOCKED_PENDING_NATHAN_PERMISSION`). For concepts without relevant empirical predictions, label `PHYSICAL_CORRESPONDENCE_OPEN`.
7. **Propagate.** Link theorem/counterexample to dependent equations, contradictions, any source-supported corrections, and affected work lanes. Preserve failed/unresolved status. Nothing enters BEDROCK or a physical-claim register merely from successful Lean typechecking.

## Minimum packet fields
- Source ref and hash; exact original claim; prior corrections and controlling state
- Formal theorem statement in original notation plus normalized Lean translation
- Declared objects, dimensions, assumptions, and admissible transformations
- Lean source, toolchain/mathlib version, command, full machine output, placeholder audit
- Proof result: PASS / COUNTEREXAMPLE / CONDITIONAL / BLOCKED / NOT COMPILED / NO MATH
- Real-world dataset/provenance and uncertainty, if a calculation is performed; CODATA gate
- Impact graph, dependent claims, unresolved proof obligations and reviewer handoff

## Factory Floor / cross-worker implementation
- Every worker tags every source item with a mathematical-extractability decision, then sends all extractable claims into one **claim registry** rather than quietly selecting only easy equations.
- Each entry maintains `claim_id`, `source_repo`, `path`, `blob_sha`, `span`, `historical_text`, `translation`, `assumptions`, `lean_file`, `lean_status`, `empirical_system`, `dataset_ref`, `status`, `dependencies`, `reviewer`.
- Priority order: (a) existing purported proofs or strong predictions, (b) foundational maps/metrics, (c) disputed or corrected equations, (d) geometric constraints across other lanes, (e) routine identities.
- A second worker audits translation fidelity and premise smuggling. Count claims separately as **extracted / typed / theorem-stated / compiled / verified / refuted / unresolved**; a single `7/22` score must not hide what the denominator counts.
- Preserve code, exact logs, counterexamples and the original text so future workers can resume without redoing archaeology.

## Specific technical caution
The standing environment for this packet had no `lean` or `lake` executable. Therefore this is **a workflow specification, not a Lean-verified scientific result**. No source-facing paper or calculation is here promoted to proof.

## Immediate initial queue
- UI SO(4) frame generator versus path velocity; quotient/stabilizer assumptions.
- Four-dimensional coarea and slice-moment formulas, carefully separating conditional Euclidean geometry from physical simultaneity and material Jacobian.
- Finite normal core local regularity versus global embedding.
- Historical geodesic-sign repair, with source-verified before/after.
- Historical force/tension/bending-energy dimensional claims.
- Explicitly typed relation/geometry claims in philosophy and cognition after source extraction.

## Repository constraints
Do not edit BEDROCK, past original archives, Contents, protected/private files or existing shared Mersearch request by implication of this packet. Approved issue-publisher staging and independent readback are required for a verified permanent publication. No hourly recurrence changes.
