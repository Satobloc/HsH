# Correction to issue #1502: compliance-unit labels in Farach et al. (2026)

**Disposition:** SOURCE-FIDELITY CORRECTION / ADDITIVE AMENDMENT. The original audit remains intact; this note corrects one sentence.

## Correction

The published artifact for [issue #1502](https://github.com/Satobloc/HsH/issues/1502) states:

> The paper's compliance paragraph labels counts 77 (Stranded), 51 (Parallel Play), and 37 (True Joint) as treatment “pairs.”

That statement is incorrect. The primary Microsoft Research PDF, arXiv:2604.08678v2 (19 April 2026), §3.5, pp. 13–14, explicitly calls these **treatment participants**. Its footnote states that the counts sum to 165 rather than 194 because 29 treatment participants (14.9%) did not complete the compliance items. Thus 77 + 51 + 37 = 165 classified treatment participants, with 29 unclassified out of 194 treatment participants.

A separate pair-level Task A table (Table 6, pp. 17–18) reports 62 treatment pairs with compliance data: 23 Stranded, 22 True Joint, and 17 Parallel Play. The paper states that compliance data were available for 146 of 164 pairs with documents. This pair-level subset is distinct from the participant-level counts in §3.5.

**Corrected interpretation:** the paper distinguishes a participant-level self-report classification (77/51/37) from a pair-level document/compliance analysis (23/22/17 among 62 treatment pairs). The original audit incorrectly attributed the participant/pair conflation to the paper; the conflation was in the audit. The paper should not be described as mislabeling 77/51/37 as pairs.

## Unit-of-analysis clarification

Task A is pair-level in assignment and output. Task B is an individual task and outcome, but participants remain nested within pair-level randomized arms; the paper reports CR2 standard errors clustered at pair level. “Individual-level Task B” should not be mistaken for 194 independent randomized units per arm.

## Scope

This correction does not change the paper's reported outcome estimates, AM/PM session confound, differential attrition, LLM-grader calibration concerns, or classification as a human–AI workflow study rather than model-internal cognition or multi-agent consensus. No raw participant data were accessed and no new experiment was run.

## Primary source

Alex Farach, Alexia Cambon, Lev Tankelevitch, Connie Hsueh, and Rebecca Janssen, “Scaffolding Human–AI Collaboration: A Field Experiment on Behavioral Protocols and Cognitive Reframing,” arXiv:2604.08678v2, 19 April 2026. [Official Microsoft Research PDF](https://www.microsoft.com/en-us/research/wp-content/uploads/2026/04/Farach_etal_Publication.pdf) · [arXiv record](https://arxiv.org/abs/2604.08678).
