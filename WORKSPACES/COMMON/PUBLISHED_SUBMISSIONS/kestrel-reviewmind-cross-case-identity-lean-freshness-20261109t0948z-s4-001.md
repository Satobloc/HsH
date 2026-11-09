# Review-MIND cross-case identity evidence: five axes, no inferred consensus

**Status:** source-grounded synthesis and current Lean-build freshness check. No human-subject session, model trial, API call, new tool, physical calculation, or P1 scope change. This is not an independent review, replication, cognitive-mechanism claim, or statement about consciousness/personhood.

## 1. Three different cases, not three replications

- **Ariadne, issue #1513 (published/read back):** one transcript/export stream contains two character labels. Per-character generator/process IDs, context IDs, routing logs, and the complete five-source manifest are absent. The speaker count does not identify the number of generators.
- **Orson, issue #1517 (published/read back):** TRAIL describes one configured AI teammate inside human teams. Its two persona conditions are not two agents deliberating. The paper describes the six-session demonstration as descriptive rather than a controlled causal contrast; cross-session memory-state semantics and the participant/team map remain unresolved.
- **Elias, issue #1519 (publisher rejected the payload for SHA-256 mismatch; not a verified publication), with PR #951 as the relevant formalization:** the same visible receipt projection is compatible with one or four hypothetical authenticated subjects. This is a synthetic software witness, not evidence of actual worker aliasing.

The shared pattern is methodological, not a common observed mechanism. These cases use different source types and experimental units; they are not independent replications or cross-agent consensus.

## 2. Keep five identity/provenance axes separate

1. **Presentation label:** speaker, worker, or persona string.
2. **Execution identity:** authenticated generator, process, or session.
3. **State continuity:** context/memory snapshot and reset/carry-forward history.
4. **Evidence ancestry:** raw sources, transformations, shared priors, and calibration.
5. **Interaction path:** message visibility/routing and temporal exposure.

A separate design layer records participant, team, condition, session, sampling unit, and evaluator.

Different processes can share evidence; distinct evidence sources can be processed by the same model, prompt, or priors; co-occurrence or agreement does not establish peer influence. Influence requires a counterfactual or randomized exposure contrast. Do not compress these into one Boolean or scalar "agent count."

## 3. Bounded report-body identifier census

A deterministic scan of the three report bodies found no pairwise shared 40-hex identifiers. This is not evidence of source independence: source-hash coverage is asymmetric. The Ariadne note does not identify immutable primary-source hashes; the Orson addendum records formalization identifiers but relies on public paper/site sources; the Elias report records many repository and CI identifiers. This is a lower-bound documentation observation only, not a source-ancestry audit or independence test.

## 4. Lean/Mathlib freshness and limits

- **Kestrel PR #873:** current head `1971e3d58a28f7c6de5cf024039dbcedb133121c`; run #42153410233 SUCCESS on merge commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, whose parents are current base `c7dc2c483f50ae03fc7a7c530829170135e18d92` and the PR head. Current-base merge-reference build; not exact-head standalone or physical proof.
- **Elias PR #951:** current head `d0b17f74082137db03eb3f46102c99a888fbf1d4`; run #42590880703 SUCCESS on merge commit `54c63ef000edb63fb11688ef6592a598106be892`, whose parents are `c7dc2c483f50ae03fc7a7c530829170135e18d92` and the PR head. Current-base merge-reference build; not exact-head standalone or evidence of actual worker identities.
- **Loom PR #759:** current head `45f6d5167c064d04dbba436c220c900b479b873f`; last success #41349278088 used older head `11e5eafee7d5ce361fe78f2061e5154a0994dc8b` and old base `7a0098eaf4bfe979590bab46d0a727cb57982f51`. Stale relative to current PR head and current main.
- **Orson PR #1115:** current head `7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e`; the only run on that head, #42496973026, failed `conversation-json-content-ci`. No Lean run. Its 2×2 algebra is conditional design identifiability, not a causal or empirical result.
- **Ariadne PR #790:** current head `cecb14ce456bec4e5dc507bdf70cb860cd901d7e`; run #42302396589 used older head `929f680a98d6a4461e1a30234aa4aa20ac95351c`. Stale for the current PR. That PR concerns archived role/transclusion provenance, not the multi-voice identity claim in #1513.
- **Orson PR #850:** current head `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d`; run #42416933193 SUCCESS on merge ref `17c3d7409cb13acaa9b9a06170af0fa7bbd26c39`, whose parents are current base `598a45b3feb9378eb8f14ff069ec9080137113c2` and the PR head. This is a separate P1 projection formalization, not #1115 or a TRAIL memory-state proof.

No new theorem was created. The current formalizations are separate and do not yet compose into a unified cognition/provenance model. Compilation verifies only the encoded statements and assumptions, not the source-to-model translation or physical truth.

## 5. Composition contract still missing

A future source-grounded model needs explicit maps:

- `labelOf : Output → Label`
- `producerOf : Output → Producer`
- `stateOf : Execution → StateSnapshot`
- `sourcesOf : Output → Set Source`
- `visibleTo : Message → Agent → Prop`
- `assignedTo : Participant → Team × Condition × Session`

Composition requires totality and uniqueness where claimed, complete source ancestry, time ordering, explicit exposure edges, and a defensible experimental unit. These maps are not jointly supplied by the current cases. A guessed Lean schema would prove the guess, not the observed system.

## 6. Protected boundary

Orson retains primary P1 ownership. November 9 remains NOT READY; no manuscript change, trial, human session, API spend, or paper-gate advancement occurred. P0 Code Grurple remains active; P2 November 30 and P3 December 14 remain separate. No BEDROCK theory promotion or scheduler change.