# Orson Vay | P1: what does a CGD contradiction flag diagnose? | 2026-10-29 16:12Z

**Run:** REVROT3-19-20261011:448:s1, h=448, seq=2241, selected index 18 Orson Vay, next index 0 Sable at 16:24Z. Current assistant source-grounded Orson remit, **not** authenticated access to original Orson ChatGPT thread. Orson's protected LLM-cognition / Nov 9 P1 ownership preserved.

## Actual original-source reads
- Live HsH BEDROCK blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`, retrieved full 88,070 chars, controlling opening and Oct29 original-statement-first closing inspected (not full line-by-line reread).
- Steering Charter blob `5f4263381afcb065e9062d5b5885593d0baa58db`; Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; onboarding `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`; revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`; Orson role charter `ee3342c463be0d5970602e58f68bc49f7c25eee1`; incoming Ravel :00->Orson :12 handoff blob `4eb739bac51f1b007404a005017ec646c8344d94`.
- External ORIGINAL evaluator `aayambansal/ConsistencyBench/src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`, read evaluator, NLI checker, and normalization. Original sample JSON blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`. README blob `326b9f2c0cca01beafa9b2d3c2190cce65714a6e` read. Existing Orson original-source manifest/replay blob `2e10ed2510b8ce14e716780a887c0fe23c3067b9` inspected. All 17 exact original CGD Git blobs fetched and parsed in connected JavaScript, 300 sets each; all per-file final individual_correct metrics matched; zero failed files. This is an analysis of genuine archived LLM outputs, NOT newly administered trials.
- Earlier Nathan/RMS sources: `RMS (Radical Meta-Skepticism).txt` blob `5f1ff79903f524242c0e2ed150f89e317780b6e9` opening ~2.6k chars and `RMS Spacetime Filaments.txt` blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6` opening ~2.6k chars read. These compilations do not independently authenticate each sentence as a Nathan user-role message; **no new Nathan ontology attributed**. Nathan's current direct P1/Lean/data/source controls govern method. No SAT physics calculation.
- Mersearch guide `086778737a004c467b0b52142d71aa5b961fc166` read; no claim of actual 3-repo Mersearch execution. Current bounded GitHub code search plus original external source retrieval. Shared Mersearch request lanes not overwritten.
- Deliberate unrelated reading: HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 921–960 read; next 961. Assistant worldbuilding content, not an authenticated Nathan claim. FIE most recently noted Orson reread Oct27, so >=14-day trigger not reached.

## NEW executed source-key diagnostic (17 original model files)
The actual CGD checker compares RAW response prefixes and logs a Boolean flag. We asked a DIFFERENT, explicitly key-relative question: does the flag predict that the **initial extracted answer** disagrees with the benchmark's PUBLISHED answer key? Source normalization was matched exactly.

All 19,550 records: flagged/key-wrong 3093, flagged/key-right 3609, unflagged/key-wrong 3890, unflagged/key-right 8958. **Crucial denominator:** 5100 first-position records are structurally ineligible for flagging, so diagnostic sensitivity/specificity must be computed on the **14,450 later-position records**:

| Original published-key proxy | Initially key-wrong | Initially key-right | Total |
|---|---:|---:|---:|
| Flagged | 3,093 | 3,609 | 6,702 |
| Unflagged | 2,871 | 4,877 | 7,748 |
| Total | 5,964 | 8,486 | 14,450 |

PPV `3093/6702 = 46.1504%`; source-key error sensitivity `3093/5964 = 51.8612%`; specificity `4877/8486 = 57.4711%`; eligible base rate `5964/14450 = 41.2734%`. These are exact finite-corpus ratios, not sampling confidence intervals or independent trial probabilities.

Category PPV by ORIGINAL archived keys: commonsense 299/807=37.05%; negation 414/1023=40.47%; modus_tollens 311/1337=23.26%; syllogistic 925/1179=78.46%; transitivity 399/642=62.15%; contrapositive 745/1714=43.47%. Existing Orson fourth-position modus_tollens ceiling (850 initial key matches, 849 flags) independently reproduced in this stratification. Prior source-key ambiguities remain; no semantic adjudication or causal claim.

**Key distinction:** low PPV for source-key error does NOT mean the NLI checker is semantically wrong. It detects putative cross-response contradiction, which can exist even when both single-response labels match the key; the triggering prior pair and judge output were not stored. The checker uses a shared GPT-4o-mini implementation and truncates raw responses at 500 characters. Prompt repetition, shared key defects and model-family dependence preclude treating rows as independent. A flagged intervention cannot be assigned a causal effect without randomized controls.

## Artifacts and gates
- Source-locked portable Python replay added to existing Orson draft PR #850: `WORKSPACES/ORSON_VAY/CODE/2026_10_29_cgd_flag_diagnostic.py`, commit `f1410212739ff8d42edf0a3c7f1eb5f74a0a8805`. **Not locally executed** against a checkout; actual observed-source calculation was executed in connected JavaScript. The Python replayer includes per-file blob-SHA checks and source-metrics assertions.
- Nine conditional Lean 4 theorem targets added to existing PR #850: `FORMAL_VERIFICATION/HsHVerification/OrsonFlagDiagnostic.lean`, commit `f4d829cbb41fd327ebaa914467c4543a12172927`, imported by root commit `5be4a471a39c8c8cc5cabad2509c030f76ada105`. Exact-head CI status must be checked separately. Lean would verify the encoded count algebra only, not source transcription or NLI meaning.
- A 3-page **working LaTeX manuscript v0.1** and its PDF were locally created using `pdflatex` (two successful passes), rendered and visually inspected. Local source SHA256 `9cad67864fa7568b7d7e954f91e04744180b21a94717dd5dc4199b6e7f3361dd`, PDF SHA256 `eb097bda3b0c921dae1c017f4bd129ad66c07686dba00014ea53e077288bb9e2`. **Local artifacts are not yet repository-hosted or public-site verified**; user-facing conversation attachments may provide access. This is not a completed P1 manuscript.
- **OPEN:** blinded source-key semantic review; independent hostile review and author disposition; source-locked Python replay from local original checkout; manuscript source transfer into approved durable repo; peer-reviewed PDF/reader route; Nov 2 protocol freeze / Nov 9 P1 gate.

## Next
Orson P1 retains ownership. Before manuscript claims, distinguish checker-flag validity, source-key correctness, and causal revision efficacy as THREE estimands. For next prospective trial log all NLI comparison pairs, prefix texts, judge outputs, revisions and model/checker versions. Sable receives only a repository handoff, not a claim of original-thread delivery. No scheduler mutation, sixth task, secret/signet, theory promotion or physics prediction.
