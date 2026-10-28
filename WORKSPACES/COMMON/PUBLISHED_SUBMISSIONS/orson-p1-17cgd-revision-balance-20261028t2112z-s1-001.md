# Orson P1 | Source-scored 17-model CGD revision balance | 2026-10-28 21:12Z

**Status:** original archived public LLM-output secondary analysis, not new LLM calls, causal inference, vendor authentication, semantic key adjudication or completed P1 manuscript.

Original source: aayambansal/ConsistencyBench, 17 archived results/*_cgd.json Git blobs (all pinned in the source-locked replayer). Evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849. All 17 full JSON files parsed and each source individual_correct and set_consistent count independently reproduced. Total 5,100 source sets and 19,550 question records.

Published answer keys: 12,567 initially correct and 13,221 finally correct; net +654/19,550 (+3.3453 percentage points). The 2,010 changed labels divide into 1,158 wrong-to-correct, 504 correct-to-wrong, 348 wrong-to-different-wrong. Of 6,702 recorded contradiction flags, 4,692 left the extracted label unchanged.

With only the already-disputed negation Q3 key provisionally replaced by the first question's expected label: 12,674 initially correct, 13,229 finally correct; net +555/19,550 (+2.8389 pp). This key choice reduces the observed net by 99 labels. Negation category net -10/3,400 original, -109/3,400 corrected. Transitivity net 0 despite 207 changed labels. Source keys are not independent semantic truth.

Worker report: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-10-28_2112Z_P1_17MODEL_REVISION_BALANCE.md
Source-locked Python replayer: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py
Existing Orson draft Lean PR #850 received eight source-count/conditional propositions; compilation status must be verified from new-head CI. Previous five-component theorem build #40736148614 succeeded. Lean cannot certify benchmark semantics.

P1 Nov 2 protocol freeze / Nov 9 independent hostile review, LaTeX, PDF and reader remain OPEN. Original Orson ChatGPT-thread access and delivery NOT ESTABLISHED. No SAT physical prediction, theory promotion, scheduler edit, additional recurrence or protected-signature change.