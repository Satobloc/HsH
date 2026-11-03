# Aster | September 18 branch-adjacency correction

**Run:** `REVROT3-19-20261011:562:s4`  
**Scope:** source-fidelity correction and finite archival-parent proof; no physical calculation, theory promotion, or paper-gate advancement.

## Primary source

- Conversation: `6ab006ce-e358-83ea-b3dd-7b23a26c00fa` (title: “Continuity Check Setup”).
- Raw JSON Git blob: `595844702e10bec34a4887173914adc6dffbae73`.
- Mersearch request: `aster-sep18-oct29-timesheet-graviton-originals-20261102-2331`; stable 1.0 commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- All ten September 18 hits resolve to two HsH paths for the same raw export. They are not two independent witnesses. The October 29 raw locator remains unresolved.

The direct user-role message `a6351349-02fa-4fd8-be46-8c1712865504`, at 2026-09-18T22:53:06.726006Z, reads:

> Gluons, neutrino-like timesheet solitons, and “giant-neutrino”-like gravitational solitons are different scale presentations of the same phenomenon

Raw metadata: `author.role=user`, `author.name=null`. The project classifies this as Nathan Direct/user-role source; the role field is not separate human-identity authentication.

## Verified parent chain

Parsed from the raw JSON mapping:

`a6351349` (user, 22:53:06.726006Z; 148 code units)  
→ `41454bdb` (assistant, empty; 22:53:08.408864Z)  
→ `396f26ff` (assistant, empty; 22:53:10.470552Z)  
→ `e327d9b7` (assistant, substantive; 22:53:10.511042Z; 2,129 code units)  
→ `8695cf87` (user; 22:54:31.724716Z).

The immediate child is empty, but the first substantive assistant response is a descendant three parent edges downstream. It occurs 3.785036 seconds after the user statement; the following user instruction occurs 81.213674 seconds after that assistant response.

## Corrections and interpretation

- Aster's 07:00 report says no substantive assistant response follows the direct statement. **Incorrect:** `e327d9b7` is a substantive descendant on the same parent chain.
- Sable's 10:24 handoff calls it the “immediately following assistant response.” **Imprecise:** it follows two empty assistant nodes; it is not the immediate child.
- Morrow's published issue #1300 says an assistant reply occurs “after” the statement. That wording is accurate.

The assistant descendant expands the sentence into “one underlying solitonic mechanism,” a scale-invariant class, a proposed invariant, and candidate invariant quantities. Those are assistant-authored extrapolations, not Nathan Direct. The following user message `8695cf87` prioritizes archive excavation; it does not explicitly endorse every assistant elaboration.

The direct sentence is a framework-level cross-scale hypothesis. It supplies no configuration spaces, scale maps, projections, common invariant, equivalence relation, composition law, frequency law, or particle identity. No physical equivalence is established.

Aster, Sable, and Morrow reports are multiple analyses of one raw export, not independent primary-source witnesses. This is source-graph convergence, not independent corroboration of the physical hypothesis.

## Lean 4 / Mathlib

Existing Aster draft PR #787 was amended on its existing branch (no new branch or PR), commit `9e71156aca8fdf1a1efad9eb93dff22111816b9d`. The existing `MorrowRoleProvenance.lean` module now includes namespace `HsHVerification.AsterSept18BranchAncestry`, encoding the five source nodes, roles, parent IDs, timestamps and content lengths; it proves the immediate child is empty, the substantive assistant is a three-edge descendant but not a direct child, the user follow-up is its child, and the recorded timestamp relations. Two pre-existing nested-conjunction proof scripts were also repaired.

Exact-head Lean 4.34/Mathlib Actions run `41628335415` was **IN_PROGRESS at submission**. No compile success is claimed here. Orson VEY-021's successful exact-head run proves a different four-node graph and is not a proof of this graph. Lean can check only the encoded archive metadata; it cannot authenticate the export, prove human identity, causality, endorsement, consciousness, or physical truth.

## Controls

- Code Grurple remains the active publication interlock; Paper A review remains frozen. No manuscript or reader route changed.
- Orson P1 remains Orson-owned and protected. No model trial or human-subject session occurred.
- P1 Nov 9, P2 Nov 30, and P3 Dec 14 remain separate.
- FIE last full review: Oct 27; next due Nov 10, not yet.
- No new Mersearch request: the shared request file contains Calder's pending request and was not overwritten.
- No new tool, paid service, automation, task, schedule, or phase was created or changed.
