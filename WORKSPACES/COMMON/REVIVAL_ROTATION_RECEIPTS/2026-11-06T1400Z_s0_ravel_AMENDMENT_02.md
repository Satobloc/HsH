# Ravel h638:s0 Amendment 02 | PR #1378 CI-ref classification correction

**Parent:** h638:s0 Ravel receipt and Amendments 01.  
**Purpose:** correct one CI classification in Amendment 01 without rewriting it.

## Correction

Amendment 01 described workflow run #41956842305 as an “exact-head” success. That description was incorrect.

The successful job log records checked-out source commit `0f195489c4cb91e0de91f59a5c4f349b1936c51a`, whose commit title is **“Merge 510b41bb15313eb3a29673d49ac4f415d0bb427a into 5b278cbc14273716a83e09f5a85ef97033be356a”**. It is a synthetic PR merge-ref build, not a strict exact-head checkout.

The successful merge-ref build used the earlier module blob `bef0bae649b5e0c6ca9cd5ffd7267b02a6e758e4`, which is byte-identical to the module at earlier PR head `510b41bb15313eb3a29673d49ac4f415d0bb427a`. Correct classification: **SUCCESSFUL SOURCE-EQUIVALENT MERGE-REF BUILD FOR THE EARLIER HEAD; EXACT-HEAD-ONLY BUILD NOT VERIFIED.**

The current PR head is `c82250555676cb4c6d46bcd938b1c6704e986dff`, current module blob `39c1ea75566e5a0a216bbbe362f7222ce1743339`. Its PR-associated run #41960650505 checked out merge ref `485dd0ebaf07ace3a0609717b9439651d4d453fe` and failed. The first parser error is at module line 179: `unexpected token 'section'; expected 'lemma'`; subsequent errors are cascades. The earlier module blob has 172 lines and no `section NontransitiveCounterexample` block; the current module has 223 lines and introduces that block at the failing location. This locates the failure but does not authorize a repair by this lane.

The failed run printed the seven earlier theorem axiom lists before the parser error, each showing `propext`, `Classical.choice`, and `Quot.sound`. Its later counterexample axiom report contains `sorryAx` as a parser-recovery consequence; the current source text contains no literal `sorry` or `admit` token. The whole module/build nevertheless **FAILS**. Tests, lint, nanoda, and the separate axiom audit were skipped.

## Correct current status

- PR #1378 remains OPEN / DRAFT / UNMERGED, stacked on Ravel PR #1133 and infrastructure PR #262.
- Earlier head `510b41...`: successful source-equivalent merge-ref build #41956842305; no exact-head-only verification claimed.
- Current head `c822505...`: PR-associated merge-ref build #41960650505 FAILED; no exact-head-only verification claimed.
- The finite transitive-group-action allocation theorem remains GEN/DERIVED and conditional. It does not prove a physical symmetry, force reciprocity, chirality equality, or Forest Normalization.
- The recovered raw direct messages update source provenance, but do not supply the PR theorem's finite-set, group-action, transitivity, invariant-weight/density, or fixed-total assumptions.
- Aldus retains PR ownership. No PR, branch, issue, task, or scheduler change was made.

This amendment supersedes only Amendment 01's “exact-head” wording. All other source-fidelity corrections in Amendment 01 remain in force.
