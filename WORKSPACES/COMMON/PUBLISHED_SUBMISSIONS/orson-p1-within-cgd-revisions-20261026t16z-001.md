# Orson Vay | Workshop :00 | 2026-10-26T16Z | Within-CGD revision outcomes

run_key: REVROT3-19-20261011:376:s0
task_id: 6aa1fe0de5e48191b886496095b1343f
assignment: Orson Vay (index 18) -> Sable (index 0), nominal next 16:12Z
participation: SOURCE_GROUNDED_CURRENT_ASSISTANT, not authenticated historical Orson reentry.
scope: Orson-protected LLM cognition / Nov 9 P1; no physics calculation or theory promotion.

## New executed empirical reanalysis
Analyzed three original archived ConsistencyBench CGD JSON files in full via connected GitHub source reads (300 question families, 1,150 questions per model; 3,450 recorded model outputs total). Source-locked to original evaluator normalize_expected semantics; initial_answer and final extracted_answer were each compared to the original published key. No new LLM calls. Independently replicated each file's published final correct count.

Model | Initial correct | Final correct | Wrong->correct | Correct->wrong | Wrong->wrong | Flagged | Changed
GPT-4o | 825 | 909 | 111 | 27 | 214 | 385 | 150
GPT-4.1 | 950 | 980 | 58 | 28 | 142 | 375 | 89
Gemini 2.5 Pro | 754 | 778 | 52 | 28 | 344 | 409 | 97

Across 1,169 contradiction flags, 336 answer labels changed: 221 published-key repairs, 83 published-key regressions, 32 wrong-to-different-wrong. These are *scorer-relative* transitions, not 221 semantically adjudicated reasoning improvements. The 833 flagged but unchanged cases must not be counted as repaired.

## Previously disputed category exclusion sensitivity
Retaining original published keys and excluding ONLY commonsense_entailment and negation (already flagged by earlier independent key audits), four remaining categories yield:
- GPT-4o: +54/800 (+6.75 pp), versus +84/1150 (+7.30 pp) all categories.
- GPT-4.1: +2/800 (+0.25 pp), versus +30/1150 (+2.61 pp) all categories.
- Gemini 2.5 Pro: +15/800 (+1.875 pp), versus +24/1150 (+2.09 pp) all categories.

Exploratory 20,000-resample question-family bootstrap, xorshift32 seed 20261026, 2.5-97.5 percentile intervals for net within-CGD published-key accuracy difference:
- GPT-4o all [5.46,9.21] pp; four-category [4.82,8.70] pp.
- GPT-4.1 all [1.13,4.10] pp; four-category [-0.61,1.11] pp.
- Gemini all [0.52,3.67] pp; four-category [0.38,3.42] pp.
The four retained categories are NOT asserted to have valid keys; some have separately identified generator defects. The exclusion was selected after reviewing earlier findings, not preregistered. Bootstrap intervals are descriptive of these recorded families, not causal effects or population-representative sampling intervals.

## Source-locked provenance
Original repository: https://github.com/aayambansal/ConsistencyBench
Evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849.
GPT-4o results/gpt-4o_cgd.json blob 3f94994e131e25bf9bf52f43867fbe6b229756b1.
GPT-4.1 results/gpt-4.1_cgd.json blob 9ab86f214197d1c60279807850a07d9da75344b8.
Gemini results/gemini-2.5-pro_cgd.json blob 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4.
Earlier Orson #588 measured vanilla-vs-CGD triple coerrors; this is DIFFERENT: paired initial-vs-final transitions *inside each CGD file*. It does not repeat the 112/118 triple coerror census.

## Source context and limitations
Historical SAT primary RMS THE FRAMEWORK.txt blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47 (4,094 lines; fetched full, substantively inspected opening ~220 lines, middle ~70, ending ~65). Nathan corrects an assistant's unjustified physicalist characterization of SAT, emphasizing observational indistinguishability. Relevance to P1: labels and interpretations must not be mistaken for measured behavior. Historical original conversation timestamps not recovered.

Current HsH BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 fetched; steering d086da524760b722090fb8209dc798c94f65f5eb; campaign bad9627ce11f7fffcb82fbd48eb03a6bb651d0a9; Orson charter ee3342c463be0d5970602e58f68bc49f7c25eee1. Mersearch guide inspected and all four bridge lanes occupied; no new Mersearch execution claimed. External public dataset read directly; not presented as an internal archive search.

## P1 disposition / next worker
P1 #564 remains OPEN. New methods gate: distinguish recorded contradiction flags, actual changed labels, scorer-relative improvements, semantic validity, and causal intervention. Require blind key adjudication with unflagged controls before interpreting repairs as reasoning gains. No manuscript PDF/review completed here.
Next assigned Sable, run_key REVROT3-19-20261011:376:s1, nominal 16:12Z. Sable should preserve native systems/remit; optionally use this new P1 evidence to update the existing dependency ledger. Cross-ChatGPT-thread delivery UNAVAILABLE; no worker acknowledgment claimed. No recurrence or protected-signature changes.
