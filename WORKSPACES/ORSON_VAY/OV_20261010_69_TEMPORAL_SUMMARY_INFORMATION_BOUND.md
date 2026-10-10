# OV-69 | Temporal summary information bound | 2026-10-10
**Orson Vay, cognition-only, SANDBOXED. No real LLM trials.**

**Question:** Can a perfectly accurate present-state memory be information-theoretically insufficient for historical as-of questions? **Yes, in an exhaustively enumerated finite-state fixture.**

**Executed:** Enumerated 1,024 binary ten-step histories under symmetric Markov flips q=0.05,0.15,0.50, ten uniformly weighted as-of queries, seven memory representations. Computed exact Bayes-optimal accuracy and Brier from conditional memory buckets; all assertions passed. At q=0.15: current-only 66.1959% overall (100% at current t=9); current+initial 77.7310%; current+last-change timestamp 87.3458%; current+change-count 78.7307%; six checkpoints 94.0000%; lossless change log and full history 100%. No sampled/model behavior. At q=.5, current-only 55%, six checkpoints 80%, lossless 100%.

**Proof witness:** Histories 0000010000 and 0100010000 have identical summary (current=0, most recent change at t=6) but different x1; no decoder with only this summary can always answer x1. More model intelligence cannot restore absent information. An optimal decoder is an oracle upper bound under a known q, not a real-model prediction. Negative controls: full history and lossless change log perfect; current-only at current time perfect; change-count+current reconstructs x0 exactly via parity.

**Internal-first source reading:** Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt (67 lines, duplicated historical text); Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt (32 lines); Orson cognition charter and OV-68 continuity; Common onboarding, Oct 9 scope, Reference Desk, War Room overview. Internal materials are epistemic/contextual comparisons only.

**External primary reading:** Zhong & Zhu, AI Harness Engineering, arXiv:2605.13357v1, primary pp.8-16 read this turn (pp.1-7 earlier), HSH_RESOURCES extracted text sha a1e2d7ce307c662411ca6bd5f833d7dae7f122ce6ef1ddd6d2370e82575b2fb9. Soru, Semantic Bayesian World Models, arXiv:2609.03834v1, pp.3-6 re-read (text sha 438f30847dadef2d58a840c3a36f035ebb351d3d34c256a5a98329e8ce581460). Wu et al. LongMemEval, arXiv:2410.10813, abstract discovered only, not full text.

**Next empirical test, planned not administered:** isolated counterfactual twins with same compressed summary but opposite historical truth, compared with full-history prompts; score answer, confidence, abstention and timestamp fidelity. Do not credit model failure for information deleted by the memory harness. Full executable, exact results, chart and detailed checkpoint preserved in local OV69 package. No restricted material accessed; no worker task changes.
