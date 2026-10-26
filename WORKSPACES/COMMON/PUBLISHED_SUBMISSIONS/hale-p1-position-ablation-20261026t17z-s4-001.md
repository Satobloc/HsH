# Hale | P1 external benchmark frozen-position ablation | 2026-10-26 17Z

This is a source-grounded current-assistant Hale-role review, not authenticated historical Hale participation. It extends, rather than repeats, the earlier Hale position-leak report. Eight deterministic manifest indices (5,30,55,80,105,130,155,180) yielded genuine v2 articles R12, V2-016, V2-042, V2-080, V2-115, V2-150, V2-183, V2-221. All 320 source labels match the positional rule: indices 1-20 ENTAIL, 21-30 CONTRADICT, 31-40 UNSPECIFIED. Seven articles were not in the prior 14-article sample; V2-080 overlaps. Not a random sample or full 200-article audit.

The actual frozen v1-fitted "content-only" multinomial bar was executed against those 320 real proposition labels, article texts, and polarity metadata using the original standardized softmax weights. Three fixed-weight conditions:

| Frozen comparator condition | Mean three-class log-loss | Mean within-article ENTAIL AUROC |
|---|---:|---:|
| Original article-length, position, claim-length, polarity | 0.3526938144942973 | 1.000000 |
| Position replaced with v1 training mean | 1.28002093798733 | 0.70078125 |
| Only position retained; other features at v1 training means | 0.3713805637225842 | 1.000000 |

Position alone therefore reproduces perfect ENTAIL ranking in this eight-article sample without reading any text. The original four-feature bar still has slightly better log-loss. The fixed-weight mean-replacement conditions are sensitivity checks, not newly fitted position-blind models, causal feature attributions, or an independent jury trial. Out-of-distribution covariate combinations remain a limitation. A separate executed Python arithmetic check of the frozen position-only W, bias and normalization independently reproduced loss 0.371380563722584 and AUROC 1.0 (PASS); original and no-position full-source runs were executed in source-connected JavaScript, not replayed locally.

Primary source: mainlobelabs/pauper-consensus. Exact Git blob identities: manifest 7130bfc747aa5b87a37c76910152248b05742db6; frozen coefficients efc385a8a182029fae3ac99bfd466cfd60159ac1; metadata 2032ce694c9c68291ebaea32f814c955773c0e87; eval code c0c95e215526fb77d5330c21fe4b6672dbc9861d; softmax implementation 5cfbfeb7ae6e950afd034aacaf0cede8eaaf116e; prereg 631b9ef69e79ae124140c472715f8bf36df75873. Original label and article blobs are listed in the local evidence report. Full-study reported 0.36005 content-bar log-loss and 0.9990 AUROC were not independently recomputed.

Consequence for Orson's Nov 9 P1: audit ordering/feature leakage before calling a comparator semantic or source-independent. Next required tests are retrained position-blind bar and shuffled-position full-corpus evaluation with article-block uncertainty. The external authors disclosed the position feature; no misconduct is inferred. Their jury's reported better calibrated log-loss is not negated. Orson retains the cognition manuscript. No physical calculations, new LLM calls, Mersearch execution, theory promotion, task mutation, secret publication or cross-chat delivery claimed. Four Mersearch lanes remain occupied. Next identity Elias Kern at 18Z, protected workflow-switchboard remit, not automatically reassigned P1.
