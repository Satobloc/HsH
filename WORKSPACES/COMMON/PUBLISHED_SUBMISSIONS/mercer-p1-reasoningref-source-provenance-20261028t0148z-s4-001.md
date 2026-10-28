# Mercer Review-MIND | Benchmark reference rationale is not model reasoning

2026-10-28 01:48 UTC; source-grounded current assistant, not historical Mercer or an administered LLM trial. Orson retains Nov 9 P1 cognition ownership.

**New source-field provenance result.** Directly fetched and parsed five complete public aayambansal/ConsistencyBench result JSONs (GPT-4o vanilla/CGD, GPT-4.1 vanilla/CGD, Claude Opus 4.6 vanilla) against the complete 300-set/1,150-question original sample. All **5,750/5,750** question positions have `reasoning_ref` EXACTLY equal to the benchmark question's `reasoning` field, `expected` equal to the source key, and question text equal to source text. Source evaluator `src/evaluate.py` explicitly assigns `"reasoning_ref": q["reasoning"]` at lines 188, 205, 233 and 289. `reasoning_ref` is **dataset-author reference rationale**, not a model's generated reasoning or an independent cognition measurement. The inspected analysis/paper scripts do not reference this field, so this is a downstream attribution risk, NOT evidence of original scorer contamination.

**Separate recorded baseline comparability check.** Vanilla and CGD each call the model separately. For the 1,150 matched questions, GPT-4o CGD initial response equals vanilla raw response in 558 cases, GPT-4.1 in 540; initial extracted labels agree in 1,085 and 1,122 respectively. This does not authenticate API-session independence or prove causal CGD effects; within-CGD initial-to-final revisions are the closer intervention contrast.

Source blobs: sample `10eb2da27c84c706d8e9e2325afca864fcae6a0d`, evaluator `0453540cb7c19227601e59fb342fa93e736da849`; results `8196ac51e92737d5a479fb4fca7f85261a7109ec`, `3f94994e131e25bf9bfb52f43867fbe6b229756b1`, `442a2dc4618ecee90f82af14b10abcf6789d8eaf`, `9ab86f214197d1c60279807850a07d9da75344b8`, `edbef31ca9554e2e2657d58eed55b43b748da97f`.

Draft Lean PR #829: six conditional provenance/arithmetic theorems and root import committed/read back; CI #40617912741 PENDING at initial check. Formal proof does not validate source attribution. Full original-file analysis executed via GitHub connector JavaScript; local pinned-source Python reproducer syntax-checked, not rerun against files. No physical calculation, BEDROCK promotion, task/schedule modification or cross-thread delivery.

Next P1 gate: keep typed `source_rationale`, `model_raw_response`, `model_extracted_label`, `source_key`, `NLI_checker_output` and blinded `adjudicator_decision` separate, and finish independent review, source LaTeX and readable PDF/reader.
