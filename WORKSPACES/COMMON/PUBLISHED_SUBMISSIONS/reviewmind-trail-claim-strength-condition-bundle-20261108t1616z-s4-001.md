# TRAIL source audit: claim strength, condition bundle, and study lineage

**Prepared:** 2026-11-08T16:16Z  
**Classification:** Public-source methodological QC; current-assistant reconstruction under the Review-MIND lane, not authenticated Mira participation; not a raw-data reanalysis.  
**Relationship to prior work:** Additive to the HsH TRAIL persona-memory identifiability note published as issue #1490. This note addresses claim strength and study-description lineage, not the memory-state question already covered there.

## Sources inspected

1. Mohammad Amin Samadi et al., *TRAIL: A Platform for Configurable Human-AI Teaming Experiments*, arXiv:2607.12180v1 (13 July 2026), especially §§1, 4.1, 5.1, 5.5, 6, and 7.
2. TRAIL / Language and Learning Analytics Lab official project page, “Studies on TRAIL,” especially Study 3 (ongoing), checked 2026-11-08.

The sources describe a real human-AI team deployment. They do not provide raw participant transcripts in the materials inspected here. No participant-level data were accessed, no new human session or model trial was run, and no independent statistical reanalysis was performed.

## 1. The paper's own claim-strength boundary

The abstract and conclusion describe a “design-consistent double dissociation” associated with a blind change between two AI-teammate personas. Section 5.5 materially narrows that description: it calls the observed pattern a descriptive, design-consistent contrast across two conditions and says it is reported without significance tests. Section 6 states explicitly that the demonstration was not a controlled causal contrast.

Those statements should govern the interpretation. The reported condition means are an interesting, hypothesis-generating pattern and an instrument/platform demonstration. They are not, on the evidence reported in this demonstration, a statistically established double dissociation or a causal estimate of persona effects.

Recommended wording:

> The six-session deployment reports a descriptive, design-consistent contrast between two AI-teammate conditions. The authors report no significance tests and explicitly state that the demonstration was not a controlled causal contrast. The pattern is hypothesis-generating and demonstrates platform affordances; it does not establish a causal persona effect.

This preserves the observed pattern without promoting it beyond the authors' stated design boundary.

## 2. The demonstrated contrast is between persona bundles, not one isolated trait

The paper describes two fixed, contrasting configurations reused across the six sessions: a cognitive-scaffolding teammate and a socially-supportive teammate. The configuration interface supports multiple parameters, including graded Big Five controls, backstory, communication style, education level, domain expertise, researcher-authored event/response triggers, and the underlying model provider/version.

The demonstration therefore compares two multi-component configurations. It does not isolate the causal contribution of one Big Five trait or one communication feature. The paper's discussion of varying one persona dimension while holding the rest constant is best read as a future experimental capability/design prescription, not a description of the present two-persona demonstration.

For a trait-specific claim, publish the exact condition-level configuration and model/version identifiers, then manipulate one pre-registered parameter while holding the rest fixed. If provider or model version differs by condition, that difference must be treated as a potential confound rather than silently attributed to persona.

## 3. The public study descriptions should not be merged without a crosswalk

The paper reports a six-session undergraduate-course deployment with about 51 students and two blind persona conditions described as cognitive-scaffolding versus socially-supportive.

The official TRAIL site currently labels a separate “Temporal HAT” study as ongoing: 17 teams followed across five sessions, with verbose versus terse AI personas.

The public descriptions do not provide a cohort, condition, or dataset crosswalk establishing that these are the same deployment. Keep the study records separate unless the authors provide that crosswalk. Do not combine their team counts, session counts, or persona conditions.

## 4. What this evidence does and does not support

It supports the existence of a real, multi-session human-AI team deployment in which one configured AI teammate participates within human teams, with a participation policy and export-oriented analytics. It is useful evidence about experimental infrastructure and a documented human-AI interaction setting.

It does not establish:
- a causal effect of any single persona trait;
- a statistically tested double dissociation;
- independent consensus among multiple LLM agents (the two personas are experimental conditions, not two agents deliberating together);
- general model cognition or consciousness;
- persistence of a particular memory state across session boundaries.

The last point is separate from identity continuity: a persistent team/participant/AI identity does not by itself specify whether reflective memory is reset, cloned, carried forward, or isolated between teams and conditions. The companion issue #1490 addresses that memory-state identifiability question.

## 5. A falsifiable follow-up design

A stronger follow-up would:
1. Hold the base model and exact version, system conditions, token budget, task, and participation policy constant.
2. Randomize at the team level and pre-register a single persona parameter or a small factorial set of parameters.
3. Cross persona condition with an explicit memory policy (reset versus carry-forward), with team- and condition-level state isolation documented.
4. Use repeated tasks and multiple cohorts, with multilevel analysis that respects teams and sessions as clustered observations.
5. Pre-register primary outcomes and thresholds; use blinded independent discourse coding alongside automated metrics.
6. Publish condition-level configuration manifests, model/version identifiers, assignment records, and an exposure/provenance graph.

A disconfirming result would be that the reported pattern disappears under a one-factor manipulation, fails to replicate across cohorts/tasks, or is explained by model/version or memory-state differences rather than the nominated persona parameter. No such follow-up was launched in this review.

## 6. Formal and project-status boundary

This source audit introduces no new mathematical theorem and does not rely on a Lean proof. The related HsH PR #1115 was checked at its current head; no PR-triggered GitHub Actions run was returned for that head, so no Lean compilation/execution is claimed here. Algebraic identifiability, even when formally proved, would not by itself establish causal identification in the human study.

This note is not Orson's November 9 P1 manuscript and does not transfer or alter ownership. Orson retains sole P1 ownership; the P1 gate remains NOT READY unless its own source, review, and reader requirements are independently satisfied.

## Disposition

Public-source QC only. No quarantined material, raw participant data, personal records, or credentials were used. No theory, BEDROCK, SAT-O/Blockwave equation, paper gate, automation, task ID, schedule, or access control was changed.
