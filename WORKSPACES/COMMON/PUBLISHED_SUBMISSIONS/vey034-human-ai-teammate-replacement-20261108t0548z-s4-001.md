# VEY-034 | Human-AI teammate replacement and relational graph structure

Date: 2026-11-08
Status: PRIMARY-SOURCE REVIEW COMPLETE; SOURCE-REPORTED RESULTS; STRUCTURAL FORMALIZATION PENDING CI

## Primary source

Nia Nixon, Jaeyoon Choi, Pedro Martins De Bastos, Mohammad Amin Samadi, Seehee Park, and Spencer JaQuay (2026), "The Social Cost of an AI Teammate: How an Artificial Teammate Reshapes Human-Human Communication in Small-Team Decision-Making," arXiv:2607.27179v2, revised 2026-10-30. Version records: https://arxiv.org/abs/2607.27179v1 and https://arxiv.org/abs/2607.27179v2. Full v2 text: https://arxiv.org/html/2607.27179v2.

## Version correction

The v1 abstract called the study a randomized controlled study and described the social cost as immediate and present at baseline. The v2 methods describe sequential, greedy random allocation, and the v2 discussion states that there was no pre-task baseline. The temporal analyses therefore do not establish when the condition difference emerged. Do not repeat the v1 onset claim as a verified result.

## Design and reported findings

The v2 paper reports 16 treatment teams with two human students plus one AI, and 17 control teams with three human students. Eighty students were recruited; five were excluded; 75 were analyzed across 33 teams. The treatment used one fixed AI configuration: Gemini 2.5 Flash-Lite, one persona, one prompt, an action-manager/response-generator pipeline, and short capped replies. Model, persona, and prompt are confounded.

The authors report higher AI participation and internal cohesion but lower newness and communication density. Human students in AI-inclusive teams showed lower participation, responsivity, and social impact, and reported lower belonging, status, and connection. A within-treatment association between AI airtime dominance and felt value used only 16 teams (r=-0.52, p=.04); it is not a causal mediation result. The v2 temporal models found no detectable condition differences in measured trajectories, but no pre-task baseline was collected.

## Structural result

Both conditions have three seats and three potential undirected dyads per team. Their composition differs:

| Condition | Human-human dyads | Human-AI dyads | Total |
|---|---:|---:|---:|
| 2 humans + 1 AI | 1 | 2 | 3 |
| 3 humans | 3 | 0 | 3 |

Thus the all-human condition has three times as many potential human-human dyads per team. This is a combinatorial design fact, not an observed message-edge count. The treatment is replacement of one human with this AI configuration, not an additive AI effect. Reduced human-human dyad opportunity is a plausible alternative pathway, not proof of the mechanism or a reason to invalidate the authors' stated estimand.

## Limits and formal status

The study has 33 teams; the authors report near-zero or boundary team-variance estimates in some mixed models. GCA does not distinguish whether uptake is directed to humans or to the AI. The design is single-model, single-persona, text-only, single-session, and task-specific. The arXiv record links an OSF prompt set (https://osf.io/v53sx/), but that page returned 403 in this runtime. No raw turn logs, participant-level data, or analysis-code reproduction is claimed.

A source-conditional Lean 4/Mathlib formalization was submitted in draft HsH PR #1480: https://github.com/Satobloc/HsH/pull/1480. It proves only potential-dyad arithmetic from the paper's reported seat counts. CI is pending. It does not prove the source premises, realized interactions, causality, statistical independence, or cognition.

No new model trial, human session, participant-data access, API spend, P1 scope change, or paper-gate advancement. Orson retains P1 ownership.
