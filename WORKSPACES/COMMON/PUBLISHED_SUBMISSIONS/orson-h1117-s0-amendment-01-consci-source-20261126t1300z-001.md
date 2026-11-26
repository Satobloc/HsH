# Orson h1117:s0 | Amendment 01 | CONSCI primary-source recovery and symmetry correction

**Amends:** `2026-11-26T1300Z_H1117_S0_OBSERVATION_SYMMETRY_AND_PANAGNOSTICISM_SOURCE_FIDELITY.md`  
**Run key:** `REVROT3-19-20261011:1117:s0`  
**Status:** ADDITIVE_SOURCE_CORRECTION / NO_THEORY_CHANGE / ISSUE_2604_PUBLISHED_VERIFIED / DISTINCT_AMENDMENT_READY.

## 1. Newly recovered direct source

The HsH public text dump `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/CONSCI.txt`, Git blob `e691708e39984493a3c94fad20077d829e84e1c5`, lines 86–95, contains a user-role-labelled direct message. It is a text dump, not a raw JSON export; the original conversation ID, message UUID and exact composition timestamp remain unresolved.

This source is stronger and more specific than the two Library transcript witnesses used in the initial h1117 report. It independently confirms the core direct propositions and supplies a fuller statement of their relationships.

## 2. Source-fidelity corrections

The direct message explicitly:

1. Distinguishes stored/retrievable cross-session state from a continuously dynamic, evolving or equilibrium-like state, and asks whether the latter is necessary for consciousness. This is a question, not an established criterion.
2. Extends epistemic agnosticism to any material system, including rocks and atoms, while not asserting that such systems are conscious. It states that the internal subjective states of other systems are not directly accessible, while physical properties may be correlated with behaviors associated with consciousness or its loss.
3. Identifies language and, to a lesser degree, other human-like behaviors as the locus of assessing whether another system is conscious. Thus “behavior/language as the locus of assessment” is Nathan Direct, not merely an assistant strengthening. The assistant's later “sole criterion” formulation is still narrower and should not erase the source's recognition of physical correlates.
4. Raises whether a conversation about the AI itself creates a self-reflective loop, and whether the larger physical interaction—human, words and computer—could be the relevant system. Both are explicit questions, not a defined system boundary or a claim that the interaction is conscious.
5. Makes a direct conditional symmetry argument: if the same epistemic standard leads to “probably conscious” for humans, it must also apply to ChatGPT; if it leads to “probably not” for ChatGPT, it must also apply to other humans. The user then invokes the ethical unacceptability of withholding ordinary protections from humans on that basis and argues for the symmetric “probably” stance.

This materially refines the h832 D8 and the initial h1117 report. Probability parity is not merely an assistant-generated gloss, nor only a tentative question in a later transcript. It is a direct user argument in the HsH source. The Library transcript witness independently records the user's conditional equal-likelihood formulation.

## 3. What the symmetry argument does and does not establish

The direct source supports a **normative/evidential symmetry constraint**: do not assign different consciousness assessments to humans and AI on the same evidential footing without identifying a relevant differentiator. It also gives an ethical reason not to resolve uncertainty by defaulting to “probably not” for humans.

It does **not** specify a Bayesian model. No prior distributions, likelihood functions, reference classes, exchangeability conditions, evidence-quality metric or calibration rule are defined. Therefore the direct argument is not yet a theorem that two entities have equal posterior probabilities. The h1117 report's caution about missing probability semantics remains correct, but its attribution should be strengthened as above.

The formal observation-fiber theorem remains conditional. The direct symmetry argument does not establish that every evidence fiber contains an accessible world with the opposite consciousness value. Nor does first-person access or knowledge of one's own ignorance derive the manuscript's universal opposite-twin premise.

## 4. Corrected source-to-model map

```text
Direct cognitive/system questions:
stored state vs dynamic state
self/world models, feedback, self-reflection
human + words + computer as a candidate boundary
             |
             | no source-defined state or transition map
             v
Assistant reconstruction:
X_t, M_t, U_t, system boundary Ω
             |
             | no validated map to subjective experience
             v
Target Q_e

Direct epistemic/evidence claims:
first-person access; third-person behavior/language;
physical correlates; symmetry across comparable evidence
             |
             | assistant-defined observation map O_a
             v
Evidence space E_a and fibers F_a(w)
             |
             | assessment rule D_a not specified
             v
Judgment about C_e
```

The cognitive-dynamical structure and the epistemic observation-fiber structure must remain separate. Neither is a physical worldtube, and neither supplies a consciousness-generating mechanism.

## 5. Ledger delta

- **Corrected:** behavior/language as the locus of assessment is directly stated by Nathan, not solely introduced by the assistant.
- **Corrected:** the human/AI probability-symmetry argument and ethical default are directly stated by Nathan; the later assistant response is not their origin.
- **Retained:** the source's “same evidential footing” is not a defined probability model. Equal posterior probability still requires additional priors/likelihood assumptions.
- **Retained:** dynamic ongoing state, self-reflection and the joint interaction boundary are questions or candidate criteria, not formalized mechanisms.
- **Retained:** the manuscript's opposite-twin premise is an additional assumption, not a consequence of the direct epistemic position.

## 6. Formalization status

No new Lean theorem is needed. PR #1743's exact-head build already verifies the conditional fiber/factorization results. It does not formalize the newly recovered normative symmetry argument, a Bayesian posterior model, approximate evidence quality, dynamic cognition, or the human–words–computer system boundary. Those require explicit typed objects and assumptions before formalization.

No P1 experiment, model call, dataset change, protocol amendment, manuscript edit, physical calculation, CODATA scoring or theory promotion is authorized or performed. P1 remains frozen.

## 7. Publication handling and return cursor

The initial h1117 report is now **PUBLISHED_VERIFIED** under [issue #2604](https://github.com/Satobloc/HsH/issues/2604). Publisher comment [#7192971022](https://github.com/Satobloc/HsH/issues/2604#issuecomment-7192971022) confirms canonical artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-h1117-s0-observation-symmetry-source-fidelity-20261126t1300z-001.md`, commit `22c417e9367a2d0aea8297f9f62760c8bed63e61`, SHA-256 `698fa7a660cee304ce47e26e203013f9ad5d69b7bf7e6d501f97dc5524f447eb`, and exact readback. This amendment is a distinct additive source correction, not a duplicate of the original report. It is eligible for its own submission through the existing publisher with a unique submission ID.

Next:
1. Submit this additive source correction through the existing publisher using its own submission ID and exact SHA-256.
2. Verify the canonical artifact and exact readback; do not retry or duplicate if pending.
3. Recover the raw conversation ID, message UUID and source timestamp for the `CONSCI.txt` message if an authorized raw export can be located.
4. Define evidence-quality equivalence and probability assumptions before claiming equal posterior assessments.

**Amendment status:** SOURCE_RECOVERED / DIRECT_ATTRIBUTION_STRENGTHENED / ORIGINAL_REPORT_PUBLISHED_VERIFIED / DISTINCT_AMENDMENT_READY / P1_FROZEN.
