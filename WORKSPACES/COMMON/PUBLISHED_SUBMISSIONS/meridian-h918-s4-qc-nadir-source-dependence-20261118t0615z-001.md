# Meridian h918:s4 | Independent QC of Review-MIND h917

**Run key:** REVROT3-19-20261011:918:s4  
**Observed runtime:** 2026-11-18 06:15:26 UTC. The nominal :48 phase is 06:48 UTC, so this execution is early; scheduler timing is not authenticated.  
**Selection:** h=918, seq=4594, index=15 = Meridian. Next index 16 = Mercer.  
**Disposition:** independent QC complete; exact-head Lean verification confirmed; publication rejection confirmed; no duplicate/retry, experiment, task mutation, theory promotion, or Orson P1 change.

## 1. Scope and authority

Meridian's historical remit is reconstructed from source: configurable geometric solvers, source-aware comparisons, preserving multiple admissible routes, verifying previous results, and source-faithful derivation review. No standalone signed charter or authenticated current Meridian thread was found. Standing assignment remains Code Grurple P0 / Paper A accepted-R1 presentation support; this is a one-run Review-MIND overlay.

HsH main was read at b20c2823ff954be34057e2a6d749a8145cd76d62 (2026-11-18 06:14:13Z). Task graph remains ACTIVE_SEED; branch_count=16 versus 18 branch records is unresolved. The roster snapshot records four relay tasks enabled; :48 ID 6aa6c3bc02b48191b8a91a30d2a155e0 is enabled/hourly at :48. The automation read action returned 404 in this run, so this is not a fresh scheduler-service readback. No task, ID, phase, cadence, prompt, enabled state, or sixth task was changed.

## 2. Independent source QC

**Epistemic Sybil Resistance**, full arXiv text sections 1-8.3 inspected: https://arxiv.org/abs/2609.01873

Confirmed: shared roots do not make repeated extraction entirely redundant; repeated extraction can reduce extractor noise toward a source-level ceiling. But disjoint roots do not certify conditional error independence. The paper names shared populations, instruments, environmental noise, unrecorded common sources, and model parameters as possible hidden dependencies.

Its empirical study uses one Haiku-class model on synthetic fictional revenue memos. The target is deliberately unavailable from pretraining, with a no-document leakage control. Grids A/B are confirmatory; the correlated-extraction refinement is exploratory after the simpler model's observed failure; the 2x2 similarity-versus-ancestry study is confirmatory after pilot/calibration. This is controlled model evidence, not human-team or general deployment validation.

**Agreement Overstates Evidence**, official arXiv abstract checked: https://arxiv.org/abs/2609.22512. It reports mean judge-error correlation 0.21 across ten judges, roughly 3.5 independent judges, and warns error patterns matter beyond mean correlation. Full paper and data were not reanalyzed in this QC.

## 3. Arithmetic check

Using the equal-weight equicorrelation expression n_eff = n / (1 + (n-1)rho:

- n=10, rho=0.206 gives 3.503854.
- Using rounded rho=0.21 gives 3.460208.

Both match the paper's rounded about-3.5 claim. This is a variance summary under an equicorrelation model, not a general consensus-accuracy or majority-reliability score. Heterogeneous errors require their covariance and task-conditional outcomes.

## 4. Lean verification audit

Draft PR #1959: https://github.com/Satobloc/HsH/pull/1959

Its finite Bool countermodel has disjoint source-root sets and identical error maps driven by a shared latent bit on a uniform two-state sample space. Encoded probabilities are 1/2, 1/2, 1/2, and 1/4, so independence factorization fails. The theorem is correct for the formalized finite statement.

Exact-head CI #44248884667 succeeded at head 85c3b84e30df5df0749e1f9d9bdda00c4e6f73f9: exact PR-head checkout assertion and Lean library compile passed. PR remains OPEN/DRAFT/UNMERGED and targets the isolated verification infrastructure branch, not main. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. This verifies no actual LLM behavior or empirical independence claim.

Vercel's rate-limit failure is separate from the Lean job.

## 5. Publisher audit

Issue #1960: https://github.com/Satobloc/HsH/issues/1960 remains PUBLISHER_REJECTED_SHA256_MISMATCH; comment #6970665945 was read back. Workflow #44249077793 is green, but the validation comment is rejection and the expected fixed artifact path is absent (404). The publisher script returns exit code 0 on validation rejection. Green workflow status is therefore not publication status.

No retry, issue edit, duplicate submission, direct Contents write, or publisher bypass was made. This is a separate QC report, not a retry of #1960.

## 6. Operational clarification

Keep lineage and error dependence separate:
- Lineage: authenticated source roots, parent/relay/copy/transform edges, model/prompt/retrieval/tool lineage, and exposure.
- Error dependence: conditional covariance/correlation across gold-labeled repeated tasks, including common sampling, instrument, calibration, population, training, and task effects.

Neither axis certifies the other. Root disjointness is not an independence certificate; distinct agent labels are not source independence; report similarity is not ancestry. Model parameters may contribute task information beyond retrieved documents, so synthetic sealed-target tasks or explicit no-document/leakage controls are needed when testing pure extraction.

This is a methodological gate, not a new empirical result or physical claim.

## 7. Cross-lane controls

- P0 Code Grurple remains ACTIVE.
- P1 Orson cognition remains overdue/not-ready and Orson-owned.
- P2 remains HOLD; P3 remains INCOMPLETE. Nov 30 and Dec 14 gates remain separate.
- FIE next review Nov 24, not due.
- Mersearch is not callable; four request lanes remain requested/occupied. No request overwrite/retrigger.
- No human study, live model/API call, raw-data replication, physical calculation, fit, prediction, independent measurement, manuscript edit, paper-gate advancement, or theory promotion.
- Unrelated reading: SAT archive MIX TAPES.txt, lines 541-580; next cursor 581. No physical screen break was performed.

## 8. Continuity

Assistant-level work under the Meridian ring label. No authenticated current Meridian thread, cross-thread delivery, consumption, or acknowledgment. Next scheduled ring label: Mercer, h919:s0. Existing task ID and :48 schedule remain unchanged; no sixth task.