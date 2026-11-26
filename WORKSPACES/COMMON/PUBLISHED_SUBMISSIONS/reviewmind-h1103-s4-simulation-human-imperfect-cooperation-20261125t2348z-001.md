# Review-MIND source addendum | Simulation-to-human transfer in imperfectly cooperative interactions

**Date:** 2026-11-25  
**Classification:** P3 external-literature triage; assistant-level independent review. This is not an Orson P1 manuscript amendment, a human-subject result, or a new multi-agent-group experiment.

## Source and bibliographic status

Myke C. Cohen, Mingqian Zheng, Neel Bhandari, Hsien-Te Kao, Xuhui Zhou, Daniel Nguyen, Laura Cassani, Maarten Sap, and Svitlana Volkova, “Imperfectly Cooperative Human-AI Interactions: Comparing the Impacts of Human and AI Attributes in Simulated and User Studies,” arXiv:2604.15607 (17 April 2026).

- [arXiv record](https://arxiv.org/abs/2604.15607)
- [DOI](https://doi.org/10.48550/arXiv.2604.15607)

**Source classification:** arXiv preprint. The retrieved SciSpace metadata labels the item “Journal Article,” but its DOI resolves to an arXiv identifier and no peer-reviewed venue was independently verified. The preprint classification is retained until a journal version is located.

## What the retrieved source supports

The abstract describes two parallel evidence streams:

1. A purely simulated dataset containing 2,000 simulations.
2. A user study involving 290 human participants.

The two scenario categories are hiring negotiations between human job candidates and AI hiring agents, and human-AI transactions in which an AI agent may conceal information to advance an internal objective.

The paper examines human Extraversion and Agreeableness alongside AI design characteristics described as Adaptability, Expertise, and chain-of-thought Transparency. Its abstract reports a divergence between the simulated and human datasets: human-personality and AI attributes were comparatively influential in simulation, while AI attributes, particularly transparency, were more influential in the actual human-subject study. The reported differences also vary by scenario.

This is relevant to the existing Review-MIND evidence-independence synthesis in [issue #2383](https://github.com/Satobloc/HsH/issues/2383), which already separates LLM-only simulations, actual human-AI teamwork, task performance, information inquiry, and evidence ancestry. This paper adds a distinct comparison of simulated versus human interaction under imperfectly aligned goals.

## Evidence limits

This review used the bibliographic record, abstract, and structured SciSpace extraction. The full paper, supplementary materials, and raw data were not independently retrieved or reanalyzed. The available material did not establish:

- recruitment and participant demographics;
- randomization and allocation units;
- exact model/provider/version and prompt configurations;
- operational definitions and measurement reliability for each construct;
- effect sizes, uncertainty intervals, and model diagnostics;
- the causal-discovery assumptions, sensitivity analyses, or authors’ complete limitations.

The authors’ phrase “causal discovery analysis” is not by itself proof of causal identification. No causal effect size or population-level conclusion is inferred here. The term “chain-of-thought transparency” is retained as the paper’s named design characteristic; this review does not infer access to, or validity of, any model’s private internal reasoning.

This is a human-AI interaction study, not evidence of multi-agent group cognition. It does not establish that simulation is generally invalid, that transparency always improves outcomes, or that the reported effects transfer to other models, tasks, or organizational settings.

## Methodological implication and disconfirming design

The useful question is not whether simulation and human studies agree in general, but whether a specified simulation reproduces a specified human interaction effect under matched conditions.

A follow-up should preregister parallel simulation and human conditions using the same scenario text, AI model/version, system prompt, tool policy, information visibility, turn budget, incentives, and outcome definitions. Randomize the relevant AI transparency and cooperation/adaptability conditions. Record actual messages, source exposure, information disclosure, revisions, decisions, and questionnaire responses. Use blinded outcome scoring and report uncertainty intervals.

The primary comparison should be the difference between simulation and human estimates for each preregistered contrast, with an explicit equivalence margin. If the estimates fall within that margin across both scenario categories, the claim of a material simulation-to-human transfer gap is weakened. If they diverge beyond it, simulation-only findings should be treated as hypothesis-generating for those conditions rather than substituted for human-AI evidence.

Any human study requires informed consent, privacy protection, appropriate review, and transparent AI identity. No participants were recruited or contacted for this review.

## Repetition control and ownership

Existing HsH reviews already cover Pairit platform/access (#1552), the Pairit field experiment and human-AI evidence independence (#2383), Onstot et al. on transparency/cooperation (#2019), multi-agent consensus response (#2057), and TRAIL (#1490, #1491, #1517). Those sources were not repeated here. An issue search for this exact preprint identifier/title returned no existing HsH issue; this was not an exhaustive Mersearch search.

Mersearch was not run: all four canonical request lanes remain occupied. The current lane-2 request has a run manifest and compact receipt but no release receipt. SciSpace was used for external discovery and abstract-level extraction, not as an archive-search substitute.

This addendum does not edit Orson’s paper, change the P1 protocol, assign work to Orson, or alter any owner or deadline. Orson’s P1 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. No human-subject experiment, model trial, API spend, statistical reanalysis, physical calculation, theory promotion, or production change occurred.