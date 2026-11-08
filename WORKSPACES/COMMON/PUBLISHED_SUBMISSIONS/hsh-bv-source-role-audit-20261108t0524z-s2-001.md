# Source-role audit: historical 3-form current and BV-losslessness claim

**Run key:** `REVROT3-19-20261011:677:s2`  
**Source cut:** HsH main `642b82a24ed3745b8a3fb3c26f3080b3a5f412d5`; SAT archive files identified by immutable blob SHA below.  
**Status:** source-critical assistant reconstruction. This is not an authenticated historical Mira contribution, a Nathan Direct equation, or a physical result.

## Executive finding

The historical phrase **"lossless BV push-forward" is not authenticated as Nathan Direct**. Its earliest located occurrence in the inspected source chain is inside an LLM-generated synopsis of a NotebookLM/ChatGPT conversation, not a role-authenticated user message. The same mixed conversation later contains an LLM-side correction that a BV push-forward is not automatically lossless. The transcript does not preserve raw per-message role metadata sufficient to assign those later statements to a specific model with certainty.

The current SAT archive controls already classify automatic BV losslessness as unsupported/historical and require a restricted injectivity or information-preservation proof before making such a claim. Retain the old expression as historical material; do not promote it to BEDROCK or treat it as a law.

## Source chain and attribution

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `ChatNoteGMPT.txt`, blob `a2d9ff31487e784d2e56b39e28d2a1773ca571df`, 1,813 lines. Its header identifies the material as a "FOREGOING NLM-CGPT CONVO 7/4/2026". The opening user prompt stages a collegial exchange between NotebookLM and ChatGPT. The "lossless BV" phrase occurs in the generated synopsis around lines 207-215. It is not presented there as a verbatim user-role equation or message.

2. The same file later contains a "Colleague:" passage around lines 382-385 saying a BV push-forward is not automatically lossless, followed by an acceptance/correction passage around lines 448-450. A later passage around lines 1499-1505 states the 3-form current relation in the form `dJ = 0` equivalent, under the stated dual-current convention, to vanishing divergence of the dual 1-form current. Because the file is not a raw role-authenticated export, these are useful historical corrections but their exact speaker attribution remains unverified.

3. `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `H(s)H Dev +/H(s)H MANIFOLDS.txt`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`, 4,740 lines, begins with the date `7/4/2026` but has no author byline or message-role metadata in the inspected header. It is a mixed compilation, not a clean signed paper. Its early equations describe `J_{mu nu rho}` as a 3-form and write `d^*J = 0` (around lines 61-62); its generated summary repeats a "lossless BV push-forward" claim (around lines 661-662 and 1990-1995). Those statements are historical source content, not authenticated Nathan Direct formulations.

4. The archive's `INGESTION_LEDGER.md`, blob `8c095421bcc00d58059eddbcfdb7a62a1486bc13`, explicitly lists "BV as lossless" among claims unsupported by the older mathematics wish-list (around line 73). It then states that BV push-forward is coarse-graining unless restricted injectivity or information preservation is actually proved (around lines 99-101).

5. `SAT_HSH_SYNTHESIS_STATE.md`, blob `a39106a1231555dbfd5091e488f5d4b771f4da48`, directs the workflow to declare a coarse-graining operator and scale, then quantify information loss and non-uniqueness (around lines 115-120). It does not endorse automatic losslessness.

**Attribution disposition:** `HISTORICAL LLM SYNOPSIS / MIXED TRANSCRIPT / AUTHOR NOT AUTHENTICATED`. Do not label the lossless claim or the later correction Nathan Direct. The user's prompt that initiated the LLM exchange is user-originated, but it does not establish authorship of the generated mathematical summary.

## Differential-form typing issue

The old construction calls `J_{mu nu rho}` a 3-form in four dimensions and writes `d^*J = 0`. That notation needs an explicit operator convention.

- In standard differential-form notation, `d^*` usually denotes the formal adjoint/codifferential `delta`, not the composition `d` after Hodge dualization. For a 3-form `J` in four dimensions, `d^*J` is a 2-form; its vanishing is a co-closedness condition.
- If the author instead meant `d(star J)=0`, then `star J` is a 1-form and its exterior derivative is a 2-form. That is closure of the dual 1-form, not the usual divergence-free condition for the vector current dual to a 3-form.
- If `j = star J` is the dual 1-form/vector current, the conventional divergence-free current condition is equivalent, up to metric/sign conventions, to `dJ = 0`.

The later transcript passage around lines 1499-1505 uses `dJ = 0` for the 3-form current. This suggests a notation/type ambiguity in the earlier `d^*J = 0` statement. Preserve the historical string verbatim; put any corrected, fully typed equation in a separate record with metric signature, orientation, Hodge-star convention, degree of each form, and definition of the codifferential.

## Why current conservation does not prove lossless BV push-forward

A differential-form current equation and a push-forward are different mathematical objects.

A closed/current-conservation condition can constrain a current or its integrated charge/flux under specified boundary conditions. It does not, by itself, prove that a separate map from a fine state space to a reduced state space is injective, that every microstate distinction is retained, or that the reduced state can reconstruct the source state.

A lossless claim therefore needs, at minimum:

1. declared source and target state spaces;
2. the actual push-forward/readout map and its admissible domain;
3. the equivalence relation or observables whose information is claimed to survive;
4. an injectivity, fiber-constancy, or reconstruction theorem appropriate to that claim;
5. boundary conditions and any gauge quotient or measure used by the BV construction.

Without these, "lossless" is an unproved strengthening of a coarse-graining operation. This does not show that information is physically destroyed; it shows that the historical source has not established its retention by the stated map.

## Existing Lean results inspected

The existing conditional map mathematics is useful, but it does not formalize the 3-form/BV claim or instantiate physical observer maps.

- Parent Kestrel PR #873 remains OPEN / DRAFT / UNMERGED. Head `1971e3d58a28f7c6de5cf024039dbcedb133121c`; head branch `research/kestrel-original-slice-fidelity-20261028t0900z`. Its `KestrelProjectedIncidence.lean` includes `joint_readout_injective_of_separating_pair`, `hallway_factorization_iff_fiber_compatibility`, and `downstream_readout_cannot_restore_coarse_collapsed_pair`.
- Run #42153410233 / job #127681789766 succeeded, Lean 4.34.0 / Lake 5.0.0, root build 8,955 jobs. The log checked out merge ref `a2c3304edafa5274530ce5286cbe15ac1ed47b0b` merging the PR head into `c7dc2c483f50ae03fc7a7c530829170135e18d92`, not the PR head alone. The workflow had `axiom-audit: false`; tests, lint, nanoda and global axiom audit were skipped. The log contained no `sorryAx` or `admit` token. The factorization theorem reports `Classical.choice`; the joint-readout theorem reports `propext`, `Classical.choice`, and `Quot.sound`; the downstream non-restoration theorem reports no axioms.
- Child Review-MIND PR #1429 remains OPEN / DRAFT / UNMERGED. Head `8dc0b33e519f181312504d508e56e933ca48ee58`; base is the Kestrel parent branch. Its `EpistemicEvidenceFiber.lean` formalizes the conditional result that opposite-truth worlds in one evidence fiber preclude knowledge or deterministic recovery. The direct conditional lemmas and evidence-only extensionality report no axioms; the reused decoder/fiber equivalence reports `Classical.choice`.
- Run #42293734842 / job #128153487471 succeeded on merge ref `d19bee743ff3cdc21db5d961526146e0f42a7b77`, Lean 4.34.0 / Lake 5.0.0, root build 8,955 jobs. It generated `lake-manifest.json` with SHA-256 `0d30c6d374aee4b20797dccc6a2dc7099b1cf89e849cd68695b184080bbbd39c`, but that manifest is not pinned in the PR. `axiom-audit: false`; tests, lint, nanoda and global axiom audit were skipped. The log contained no `sorryAx` or `admit` token.

These are actual successful builds of the encoded conditional mathematics on their respective merge references. They are not exact-head/current-base verification, not a global axiom audit, not proof that the source translation is faithful, and not observational validation of any physical system.

## Disposition and next proof obligations

- Preserve the original `d^*J = 0` string and the historical "lossless BV" wording as historical artifacts.
- Keep the attribution `assistant/LLM reconstruction or unresolved mixed transcript`, not Nathan Direct.
- Keep automatic BV losslessness quarantined.
- Before any formalization, resolve the form degree and operator notation, define the BV source/target map and its gauge quotient, and state whether the claim concerns full-state injectivity or only preservation of a named observable.
- Do not infer an information-conservation law, entropy law, medium mechanism, timesheet mechanism, or physical prediction from these historical equations.
- No new Lean module, physical calculation, dataset fit, CODATA comparison, theory integration, or BEDROCK change was made in this audit.

**Epistemic status:** historical source = inspected archive artifacts; attribution = unresolved LLM transcript; mathematical correction = standard differential-form interpretation conditional on the stated definitions; Lean verification = existing conditional modules only; physical validation = none.
