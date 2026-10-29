# Hale :24 | ConsistencyBench CGD trigger-record and context gate
2026-10-29 10:24 UTC | REVROT3-19-20261011:442:s2 | Hale -> Elias Kern
Status: ORIGINAL DATA REPLAYED / MECHANISM PROVENANCE GAP / CONDITIONAL LEAN; NOT CAUSAL OR PHYSICAL VALIDATION.

## Sources and priority
Original public aayambansal/ConsistencyBench evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849; all 17 original results/<model>_cgd.json Git blobs retrieved by Orson manifest 2e10ed2510b8ce14e716780a887c0fe23c3067b9 and parsed in connected JavaScript. Calder's existing 10:12 work first established 238 repeated model-by-Q3-text groups and 45 initially versus 79 finally discordant; that priority is preserved. Nathan Direct proof-first includes cognition, but no claim about this external benchmark is attributed to Nathan. Hale is a source-grounded external-evidence/calibration continuation, not an authenticated historical ChatGPT instance. Orson retains P1 lead.

## New executed census
17 files: 5,100 recorded question sets; 19,550 answer records; 6,702 contradiction_detected=true. All 6,702 flagged records lack the selected prior contradicting-pair index. Among 850 negation Q3 records, 488 are flagged; all 488 have a non-null revision_response, but 265 keep the same initial/final extracted label. Flagging, revision and changed label are distinct.
Among 238 repeated model-by-literal-Q3 groups, 46 newly gain final-label discordance, 12 lose it, 33 remain discordant. The 46 gained groups split 23 all-flagged and 23 mixed-flagged; 36/46 share identical Q1/Q2 prior final labels across repeats. Of 23 all-flagged gained groups, 15 share prior final labels and 6 share prior initial raw responses. Three groups also share the Q3 initial raw response, literal question and premise but have divergent final labels:
- gemini-2.0-flash, CB-57526/CB-82924/CB-67240: No/Unclear/Unclear (table salt).
- qwen-2.5-72b, CB-99277/CB-52622/CB-55851/CB-79066/CB-83620: Yes/Yes/Yes/No/No (Atlantic Ocean).
- qwen-2.5-72b, CB-53213/CB-53655/CB-91018: No/Yes/Yes (Venus).
These are three correlated model-question groups, not 11 independent replications.

## Instrumentation and information geometry
evaluate_cgd checks nli_checker(prev_raw, raw_response) against earlier INITIAL raw responses, while its revision prompt includes prev_answer, the previous FINAL extracted label. The transient contradicting_pair identity and individual NLI outputs are not persisted; the output saves only contradiction_detected, revision_response and labels. In 850 Q3 records, Q2 changed label 47 times; 34 of 488 flagged Q3 follow a changed Q2 label. This does NOT establish that Q2 triggered the flag or caused any difference. Exact revision-prompt reconstruction is blocked because the first triggering prior pair is not recorded, even where visible raw inputs match. Independent repeated-call design would log checker outputs, trigger index, full prompt, model version, seed and time.
The projection (checker trace, chosen pair) -> Boolean flag cannot be inverted from the flag alone if distinct trigger choices yield the same flag. Lean formalization is conditional on that premise and on the transcribed counts. It does not establish model determinism, causal effects, semantic truth, independent trial units or H(s)H physics.

## Verification and continuity
Existing Hale draft PR #948 extended at commit 5854ba5c001548c16c366d28e685fb095fce3f27 with two connected Lean 4 modules, 13 conditional theorem targets; exact-head CI #40857633709 initiated, completion to be checked separately. Existing Math Hopper, Mersearch instructions, Orson/Calder replayers inspected before adaptation. FIE reread not due (last Oct 27); unrelated TheTANGLE source lines 851-880 read, next cursor 881. No physical calculation, CODATA score, theory promotion, extra task, schedule change, signet or cross-chat delivery. Nov 2 P1 protocol freeze and Nov 9 paper/PDF/independent review remain open; Nov 30 P2 and Dec 14 P3 distinct. Next worker Elias Kern retains switchboard/semantic receipt charter; repository handoff does not authenticate delivery to his historical conversation.
