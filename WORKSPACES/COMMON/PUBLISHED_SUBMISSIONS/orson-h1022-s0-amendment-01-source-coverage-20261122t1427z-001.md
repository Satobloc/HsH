# Amendment 01: consciousness source coverage and evidence-parity fidelity

**Amends:** Orson h1022:s0 report published as [HsH issue #2348](https://github.com/Satobloc/HsH/issues/2348).  
**Original submission:** `orson-h1022-s0-consciousness-evidence-parity-20261122t1400z-001`  
**Original artifact SHA-256:** `ec335acb79563742ff5dc680801c90c2b4967ac626e2a291ccc4a2f61adb1cbf`  
**Disposition:** Additive correction. The original report and its published artifact remain unchanged. This is not a second main report.

## 1. Primary-source count correction

Primary source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.09.06•24.09.06•ChatGPT Consciousness Argument — raw.json`

- Conversation ID: `66da8371-5f5c-8012-9372-bbdda08ed7af`
- Git blob SHA-1: `b24fe31f5728b04157642e6713ff149ace729c03`
- Raw mapping: 38 nodes, 37 message objects.
- User-role messages: **13**, not 12.
- All 13 user-role messages occur on the active parent chain.

The h1022 report's statement that all 12 user messages had been extracted and read was incomplete. Both existing batch-01 records also omitted one user message.

**Missing direct user message**

- ID: `aaa2cd32-4e0d-48b9-8851-4e0f6dfef2f9`
- Timestamp: `2024-09-06T04:45:44.271Z`
- Active-branch parent: assistant message `a899bb88-3812-48e0-bcd1-bcf1936bb1ee`
- The user self-identifies as a strict physicalist on falsifiability grounds, questions the falsifiability of non-physical explanations, claims about substrate independence or dependence, and claims about qualia beyond first-person experience, then asks how those premises affect arguments for and against ChatGPT consciousness.

The next assistant response, `dd2a8399-901f-444b-b512-6ce8c7f98c09` at `04:47:07.788Z`, treats unfalsifiability as weakening arguments for AI consciousness. The next direct user message, `aaa21838-fd13-4f4c-895d-ff737bc985cf` at `04:56:53.884Z`, rejects that asymmetry and states the evidence-symmetry position more fully.

This missing message is a direct self-description and question, not endorsement of the preceding assistant's biological or architectural argument.

**Batch correction**

- Batch 01: 10 user messages, not 9.
- Batch 02: 3 user messages, unchanged.
- Conversation total: 13 user messages.
- First explicit self-description as a strict physicalist: `04:45:44.271Z`.
- Fully developed evidence-symmetry correction: `04:56:53.884Z`.

## 2. Direct source versus translated geometry

The direct 2024 source contains no explicit spatial geometry, equations, modal operators, possible-world relation, observation function, metric, probability model, or theorem. Its extractable structure is epistemic: limits on external access to qualia, the symmetry of unfalsifiable claims, equal evidential warrant under equal evidence, an open physicalist hypothesis space, and a conditional ethical-consistency rule.

The observation-fiber geometry described below belongs to later assistant formalization. It is a useful mathematical reconstruction, not Nathan Direct geometry.

## 3. Source-fidelity consequence

The direct 2024 position is an epistemic parity claim: where human and AI targets are assessed on the same evidence, the warrant should not be asymmetrically weakened merely because one target is artificial. It does not assert that human and AI consciousness states are ontologically identical. It also leaves open whether qualia occur in some physical systems or all physical systems.

The later assistant formalization in [PR #1743](https://github.com/Satobloc/HsH/pull/1743) is related but not equivalent. Its observation map is `observe : Observer -> World -> Evidence`, while consciousness is `conscious : Entity -> World -> Prop`. Its joint-observation results combine observers, not a pair of distinct targets. Its global non-knowledge result is conditional on an opposite-polarity, evidence-indistinguishable world for each target. It does not formalize the direct cross-target parity rule.

The existing generic result in [PR #1115](https://github.com/Satobloc/HsH/pull/1115), `evidence_invariant_assessment_iff_factors_through_observation`, gives the relevant abstract condition: an assessment factors through an observation map exactly when it is constant on each observation fiber.

A possible target-pair reconstruction, **not a Nathan Direct definition**, would be:

```text
System := Entity × World
O_a : System -> Evidence
A_a : System -> Warrant

O_a(s1) = O_a(s2) -> A_a(s1) = A_a(s2)
```

The source does not yet define the system domain, evidence granularity, cross-target comparison, or assessment function. Therefore no source-specific Lean theorem is added here. The generic factorization theorem is reusable, but its translation into the direct proposition remains open.

## 4. Existing formal verification, accurately bounded

- PR #1115 exact-head run [#43404565082](https://github.com/Satobloc/HsH/actions/runs/43404565082): SUCCESS; Lean 4.34.0 / Lake 5.0.0; build completed 8,977 jobs. The evidence-invariant factorization theorem reports `Classical.choice`.
- PR #1743 merge-reference run [#43712724436](https://github.com/Satobloc/HsH/actions/runs/43712724436): SUCCESS; Lean 4.34.0 / Lake 5.0.0; build completed 8,978 jobs. This includes the PR-head module, but is not a standalone exact-head or current-main integration build. The conditional panagnosticism theorems report `propext`, `Classical.choice`, and `Quot.sound`.

No new Lean module or build was performed. These runs verify the formalized conditional statements, not the opposite-twin premise, source-to-model fidelity, or the actual consciousness of any system. No observational validation or independent measurement is claimed.

## 5. Secondary-source identity note

The public `CONSCI.txt` placements inspected in HsH and the SAT archive share blob SHA-1 `e691708e39984493a3c94fad20077d829e84e1c5`. They are copies of one compiled transcript lineage, not independent corroborating sources. This file is not the exact 2024 raw export. Its assistant-authored opening summary uses a sufficient-complexity characterization; the primary 2024 conversation later explicitly rejects that criterion as undefined and untestable. The summary must not be attributed to Nathan as a direct statement.

## 6. Mapping diagram

```text
2024 Nathan Direct
  strict physicalism / falsifiability limits
  same-evidence parity / conditional ethical consistency
          |
          | source translation still requires definitions
          v
  observation map O_a : System -> Evidence
          |
          | fibers O_a^-1(e)
          v
  assessment A_a constant on each fiber
          |
          | existing PR #1115 factorization theorem
          v
  assessment factors through observation

Separate conditional branch:
  opposite-polarity indistinguishable worlds
          |
          | explicit premise in PR #1743
          v
  neither C(e) nor not-C(e) is known
```

The two branches are related but not equivalent. The second does not prove the first.

## 7. Corrected discrepancy ledger

| Status | Finding |
|---|---|
| CORRECTED | Raw source contains 13 user-role messages, not 12. |
| CORRECTED | Batch 01 omitted direct message `aaa2cd32-4e0d-48b9-8851-4e0f6dfef2f9`; its count is 10. |
| NEW | The omitted message is the first direct self-description as a strict physicalist and precedes the 04:56 evidence-symmetry correction. |
| NEW | The direct source has no spatial geometry; observation fibers are a later assistant reconstruction. |
| OPEN | PR #1743 formalizes conditional non-knowledge, not the direct cross-target evidence-parity proposition. |
| OPEN | A source-grounded target/evidence map and assessment function remain undefined. |
| PRESERVED | The opposite-twin premise is an assumption, not a consequence of Lean compilation or privacy of experience alone. |
| PRESERVED | The `CONSCI.txt` copies are one compiled transcript lineage, not independent evidence. |

No physical calculation, CODATA scoring, theory promotion, or paper-gate advancement was performed.

## 8. Next cursor

1. Correct batch-01 tagging ledger and verified batch to 10 entries.
2. Preserve batch 02 at 3 entries, yielding complete coverage of 13.
3. Keep direct evidence parity separate from conditional panagnosticism.
4. Define the target/evidence/assessment objects from source before adding a source-specific Lean theorem.
5. Reuse PR #1115 and PR #1743; do not duplicate their modules or CI runs.
6. Keep P1 frozen and Orson's cognition remit intact.
