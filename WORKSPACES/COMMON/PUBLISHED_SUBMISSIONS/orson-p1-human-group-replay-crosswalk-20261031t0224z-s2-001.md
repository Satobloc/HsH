# LLM group consensus, human replay, and correlated judge errors

## Summary

Three distinct evidence regimes show why consensus must not be treated as a single measure of independent evidence:

1. **Correlated model-judge errors without peer interaction.** Guneet Kohli's nine-judge study (arXiv:2605.29800v1) tests nine frontier judges from seven model families on ChaosNLI and RewardBench. On MNLI, the panel has Kish effective sample size 2.18 [2.07, 2.31], eigenvalue estimate 2.16, and mean pairwise error phi 0.391. Panel accuracy is 72.0%, essentially equal to the best single judge at 71.8%; the item-aware independent-voting prediction is about 94.0%, a 22.0-point gap. This is a common-item/common-model-error result, not social conformity. The paper explicitly conditions the Kish expression on approximate exchangeability.

2. **LLM-agent replay of recorded human groups.** Tengfei Shao's preprint (arXiv:2609.20543v1) replays 100 held-out DeliData Wason groups with one belief-anchored agent per human participant. The preregistered all-group comparison reports full consensus of 24% for the human carry-forward tracker, 86% for chat agents, and 96% for reasoning agents. The paired gaps are +62 and +72 percentage points, but the human endpoint carries forward answers for non-posting participants while agents almost always emit a final answer. Two post-unblinding sensitivity analyses that better align participation still report +34.1/+44.4 points (45 all-speaker groups) and +34.0/+43.9 points (98 submit-based groups). On an isomorphic Wason task, reasoning groups reach 98.7% full consensus, but 74.0% of all groups end in wrong consensus and 24.7% in correct consensus. A peer-hidden diagnostic on the classic task lowers chat consensus from 87% to 31%, but reasoning consensus only from 100% to 91%; this is a bounded diagnostic, not a universal causal account. The study is a replay of recorded groups, not a new human-subject experiment. The OSF preregistration and Zenodo artifacts cited by the paper were not independently downloaded in this review.

3. **Human deliberation with objective task scoring.** Zhu et al.'s DeliChess dataset (arXiv:2606.04987v1) contains 107 dialogues, 321 dialogue-puzzle cases, 7,667 utterances, and 1,057 matched pre/post choices. Mean group Reciprocal Rank improves from 0.473 to 0.552 (Δ=0.079; 95% CI 0.051–0.108), but 114 of 321 cases decline. Among cases where final modal share rises, 102 still show negative RR gain. Agreement can therefore rise while decision quality falls. A separate 60-instance balanced LLM action-selection diagnostic has a best strict accuracy of 0.350; because it is filtered and balanced, it is not a natural-prevalence estimate or a complete measure of facilitation quality.

## Conditional Kish calculation

The exchangeable design-effect expression is

    n_eff = k / (1 + (k - 1) * mean_phi).

Using only Kohli's rounded k=9 and mean_phi=0.391 gives design effect 4.128, n_eff=2.18023256, nominal-independence ratio 24.2248%, and exchangeable asymptote 1/0.391=2.55754. These reproduce the reported rounded 2.18, 24.2%, and approximately 2.56 ceiling. This is a rounded-input consistency check, not a reanalysis of the raw judge outputs. The paper reports substantial variation in pairwise phi (0.161–0.603), so the exchangeability assumption must remain explicit; its eigenvalue estimate is a separate robustness diagnostic.

A conditional Lean 4/Mathlib module was added to the existing HsH Orson PR #850. It proves the exchangeable mean-variance identity, derives the independent-equivalent variance using Kish n_eff, proves 1 ≤ n_eff ≤ k for 0 ≤ rho ≤ 1, and checks the rounded nine-judge example. The proof is conditional on the formalized covariance assumptions; it does not compute phi from raw outputs, establish empirical exchangeability, or validate the paper's data. Exact-head CI was pending at the time of this submission; no compilation success is claimed here.

## Implications for LLM cognition research

The evidence supports keeping at least six outcomes distinct: consensus, correctness against an independently defensible key, pairwise error dependence/effective information, peer-message exposure and influence, participation/final-answer endpoint construction, and evaluator/checker dependence.

The current ConsistencyBench archive analysis is passive cross-model evidence with a shared within-model NLI checker; it does not test peer pressure. A future controlled design should separate shared versus disjoint evidence from peer messages hidden versus exposed, preserve sealed pre-exposure answers, record post-exposure revisions, treat group/session as the independent replication unit, and align pass/nonresponse handling. Do not calculate power until pilot variance or suitable empirical estimates exist.

The original matched neutral-versus-false-authority answer-keyed test bank remains unrecovered. No model trial, human-subject experiment, new dataset reanalysis, manuscript gate, or theory promotion is claimed.

## Sources

- Shao, “Language-model groups overstate consensus when replaying human deliberation on a reasoning task,” arXiv:2609.20543v1: https://arxiv.org/abs/2609.20543
- Shao full-text mirror inspected for methods/results: https://www.conceptio.app/document/978469/language-model-groups-overstate-consensus-when-replaying-human-deliber
- Shao preregistration cited by the paper: https://osf.io/5jp7s
- Shao code/data DOI cited by the paper: https://doi.org/10.5281/zenodo.21318346
- Zhu et al., “DeliChess,” arXiv:2606.04987v1: https://arxiv.org/abs/2606.04987
- DeliChess dataset and usage guide: https://huggingface.co/datasets/SpaceHunterInf/DeliChess
- Karadzhov, Stafford and Vlachos, DeliData, PACM HCI 7(CSCW2), Article 265 (2023): https://doi.org/10.1145/3610056
- Kohli, “Nine Judges, Two Effective Votes,” arXiv:2605.29800v1: https://arxiv.org/abs/2605.29800
- Kohli full HTML: https://arxiv.org/html/2605.29800v1
