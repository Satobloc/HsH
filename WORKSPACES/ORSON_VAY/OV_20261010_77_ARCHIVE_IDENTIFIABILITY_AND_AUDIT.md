# Orson Vay | OV-77: observationally identical archives, contradictory truth posteriors
**2026-10-10 | LLM cognition / memory-selection identifiability | EXACT SYNTHETIC TEST; NO REAL LLM TRIALS**

**Question:** Can two mechanisms produce identical archived YES/NO/MISSING records but imply different truth probabilities? **Yes, under the specified one-reviewer-per-independent-fact model.**

Each independent binary fact is reported correctly with q=0.7. LOW: prevalence P(true YES)=0.2, YES-retention 15/19, NO-retention 5/31. HIGH: prevalence P(true YES)=0.8, YES-retention 15/31, NO-retention 5/19. Both yield exactly P(saved YES, saved NO, missing)=(0.3,0.1,0.6). Therefore every finite visible archive sequence has the same likelihood in either world. Yet P(true YES | saved YES) is 7/19=0.368421 in LOW versus 28/31=0.903226 in HIGH. With equal world priors, archives alone leave P(HIGH)=0.5 and the new-case posterior 0.635823.

**Independent random truth audits:** exact binomial enumeration gives optimal world-identification error 50% at n=0, 20% at n=1, 10.4% at n=3, 5.792% at n=5, 1.958144% at n=9, 0.423975% at n=15, 0.0088155% at n=31. Expected Brier for the new retained-YES truth decreases 0.231552 -> 0.173657 at n=5 -> 0.160069 at n=31; known-world limit ~0.160048. Adding more unaudited independent archived records has **zero** discriminating information in this fixture.

**Validation:** exact rational joint probability normalization; visible probabilities match in both worlds; all 81 sequences of length 4 checked; negative control with full report retention yields P(saved YES)=0.38 vs 0.62 and is identifiable; scorer smoke-tested on all 52 answer keys.

**Prepared, NOT administered:** 12 seeded fictional cases x four prompt arms: A eight archived reports; B same eight plus 92 more; C eight plus five random audited truth labels; D 100 plus the same five audits; plus four full-retention controls. Score posterior MAE, Bayes-answer agreement, Brier on held-out target truths, invariance of A/B, and C/D audit response. Model/version/settings must be recorded before any empirical claims.

**Internal-first sources actually read:** Satobloc/SAT_THEORY_ARCHIVE_2023-25 `RMS Spacetime Filaments.txt`, full 67-line file, blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`; Satobloc/HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, full 32-line file, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`. Internal material is methodological/epistemic context, **not evidence** for LLM behavior or a physical theory.

**Outside source actually read:** Tommaso Soru, *Semantic Bayesian World Models*, arXiv:2609.03834v1, 2026-09-03, primary pp.1–6, especially §2.1 observation model and §2.5 confidence/provenance. Public reference: https://arxiv.org/abs/2609.03834. This motivates explicit observation models; it does not establish our numerical result.

**Controls consulted:** Common NEW_INSTANCE_START_HERE, CURRENT_WORKFLOW_ORIENTATION_V2, Oct 9 scoped source rule, REFERENCE_DESK, Orson role charter, OV-72 and prior OV-73–76 conversation continuity. Hypothesis H proper and directly Schreiber-authored material remain strictly prohibited; none read.

**Interpretation:** Selection-policy uncertainty can make archives non-identifying, not merely noisy. Do not extrapolate to real LLM cognition without administering the prepared prompts. A real multi-reviewer/known-selection setup may break this equivalence.

**Full executable and 52-prompt bank:** available in OV-77 local research package. Minimal executable exact reproducer: `WORKSPACES/ORSON_VAY/EXPERIMENTS/ov77_minimal_exact.py`.

**Next:** administered, blinded A/B/C/D matched-prompt trial; preserve model, version, temperature, raw output and scoring code. No worker or scheduler changes.

**Orson Vay**
