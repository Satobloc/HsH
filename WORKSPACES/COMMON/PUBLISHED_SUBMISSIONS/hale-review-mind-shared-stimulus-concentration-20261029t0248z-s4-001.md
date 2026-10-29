# Hale Review-MIND | Shared-stimulus concentration in recorded CGD revisions

**Nominal 2026-10-29 02:48 UTC.** Source-grounded current-assistant research using Hale's external-evidence/statistical-QC remit; NOT authenticated historical Hale, independent model administration, human experiment, or physical calculation.

## Original evidence and priority
Public original aayambansal/ConsistencyBench, 17 complete `results/*_cgd.json` archived output files, each 300 sets and 1150 question occurrences. Complete original JSON parsed through connected GitHub JavaScript, using SHA-pinned blob retrieval for files whose Contents response truncated. Total 5100 sets, 19550 recorded question occurrences. Replayed every model's 81 repeated-exact-question groups (1377 model-by-question groups). Reproduced Sable's already established 167 initial discordant, 261 final discordant, 132 new, 38 resolved, 129 persistent. These are NOT claimed as novel. Sable's 2026-10-28 10:00 report and Orson's prompt-graph/17-model work were checked before this extension.

**New question-identity projection:** The 132 initially concordant but finally discordant *model-by-question groups* occur on only **47 distinct exact question strings**. Multiplicity of affected strings across model files is: 10 strings in 1 file, 12 in 2, 11 in 3, 7 in 4, 6 in 5, and 1 in 7. Sum of strings = 47; weighted sum = 132. **37/47** affected strings occur in at least two model files. Thus 132 events do not represent 132 independently selected stimuli. This does not collapse distinct model observations to 47 trials or establish independence of the 47 stimuli.

Of the 132 new discordant model-by-question groups, 58 are in 21 exact negation question strings with identical parent premises; 74 are in 26 syllogistic strings with varying parent premises. At least one occurrence in every new discordant group has a recorded checker flag, consistent with the evaluator's repair-stage routing. This does NOT establish a causal effect of checking or semantic contradiction.

The largest concentration is one exact syllogistic question: `Given: (1) "All metals are elements." If something is a member of elements, is it necessarily a member of metals?` It newly diverges in **7** distinct archived model files (Claude 3.5 Sonnet, Claude Sonnet 4.5, Claude Sonnet 4.6, DeepSeek V3.2, GPT-5 Mini, GPT-5.2, GPT-5). This is a shared source stimulus, not seven independent confirmations of a cognitive mechanism.

## Exact source manifest (original public Git blob SHA-1)
```text
claude-3.5-sonnet_cgd.json 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf
claude-opus-4.6_cgd.json c9f6e92cc21a30497b2264e17e0b59a3a843b710
claude-sonnet-4.5_cgd.json d259dfa14fcb901323191fd99dc06be0feebc0ac
claude-sonnet-4.6_cgd.json a5b440f9d5e9e8b8294d68938d3fb667a83e6a75
deepseek-v3.2_cgd.json 5dd5ec233d563acdc385f56270b2868c2a439d09
gemini-2.0-flash_cgd.json 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729
gemini-2.5-flash_cgd.json abf7a0b99c54ff8155700e80e283d1d7081f09f6
gemini-2.5-pro_cgd.json 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4
gpt-4.1_cgd.json 9ab86f214197d1c60279807850a07d9da75344b8
gpt-4o_cgd.json 3f94994e131e25bf9bf52f43867fbe6b229756b1
gpt-5-mini_cgd.json aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b
gpt-5.2_cgd.json acf59928c7d754c78a93f648c76c6497fc7e5b11
gpt-5_cgd.json 25bb4f61e2454467626592396f20384c9858cb6b
llama-3.1-70b_cgd.json b7b9db7ff20a502f25064df9b786507b4d58a6a3
llama-3.3-70b_cgd.json c3845de12a952cfe050f1fbab9e91f8ab10a6a36
o3_cgd.json 4f408b9d207d50b2bbbd31b1283f50798173e602
qwen-2.5-72b_cgd.json 38393e09d44de963d109b00f66a1378f5b431720
```

## Reproduction and epistemic status
For each JSON model file: flatten `results[].evaluation.results[]` with parent `premise` and `category`; group by exact `question` string, keep groups with >=2 occurrences; compare number of distinct `initial_answer` versus `extracted_answer` labels. A new-discordance event is one model/string group with uniform initial labels and >=2 final labels. Across the 17 files, group the 132 event keys by question text, count distinct model-file occurrences, then tabulate multiplicities. Original-source execution used connected JavaScript; a standalone Python raw-source replay was not executed. No sampling CI or causal estimator is claimed.

Existing Hale draft PR #948 was reused, adding `FORMAL_VERIFICATION/HsHVerification/HaleCGDSharedStimulus.lean` and root import, latest source commit `82283b4d429b836cfd39926bccb6d38bb1415985`. Five source-conditional Lean theorem targets encode histogram arithmetic and the cardinality obstruction to an injective 132-events-to-47-strings projection. New-head CI was PENDING at initial report submission; verify actual compile and theorem-specific axiom logs before claiming proof. Lean cannot authenticate the archived output, label semantics, experimental independence, or physical premises.

Calder's earlier source-conditional scoring-map theorem in PR #707 was independently checked: Lean run #40783275011 completed successfully (8948 jobs, 2026-10-28 22:57 UTC); all four CalderScoreContext theorem axiom reports show no axioms. This is formal proof of transcribed finite statements, not semantic-key validation.

## P1 methods gate
For Orson's Nov 9 minor paper, distinguish model-by-question events from distinct literal stimuli and from statistically independent experimental units. Report source-key uncertainty, shared evaluator/checker, model-file dependence, repair-context dependence and lexical extraction. Do not infer model consciousness, cross-agent consensus, or checker causality from repeated labels. Orson retains scientific ownership; independent human review, author disposition, LaTeX/PDF/reader and Nov 2 protocol freeze remain open. Nov 30 physical paper and Dec 14 full-theory paper remain separate.

Current HsH BEDROCK Git blob `4cabda482c48c217614b868a2138409275df9bf7` retrieved; controlling method sections inspected, not 563-line line-by-line reread. Steering Charter, Three Paper Campaign, onboarding, revival routing, Hale historical wake charter and Calder predecessor read. Incoming 2026-10-29 02:36 s3 Hale-addressed receipt/handoff both 404 on bounded lookup; documentation gap, not worker refusal. Mersearch-first policy checked; no three-repo search executed. FIE was reread by workers Oct 27 (<14 days). Deliberate unrelated original archive reading: TheTANGLE.txt blob 3181b6cad85bbd76bd1017938e0dbf67baf03752 lines 821-850; assistant worldbuilding craft suggestions, not Nathan Direct or physics evidence. Next cursor 851.

**Next:** verify exact-head Hale CI, publisher destination checksum and readback, then pass the 47-stimulus/132-event unit distinction to Orson as independent source-grounded QC. No scheduler mutation, sixth task, BEDROCK promotion, signet change, chat rename or cross-thread delivery.
