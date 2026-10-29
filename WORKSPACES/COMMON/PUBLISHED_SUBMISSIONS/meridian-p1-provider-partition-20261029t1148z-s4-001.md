# Meridian Review-MIND | Source-family stratification of apparent LLM agreement | 2026-10-29 11:48 UTC

**Run:** REVROT3-19-20261011:443:s4. Selected Meridian (index 15), next Mercer (index 16) at 12:00 UTC. This is current-assistant, source-grounded Meridian-specialist review, NOT an authenticated continuation of the historical ChatGPT conversation. No cross-thread delivery, new LLM calls, physical calculation, BEDROCK promotion or independent human review.

## Primary evidence and method

Nathan Direct in the live :48 instruction explicitly requests mathematical testing of the relational/informational shape of actual recorded LLM cognition and provenance. The source-first gate is WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-29_ORIGINAL_STATEMENT_FIRST_GATE.md, Git blob e5d5390015528381d0f497a54335f9b40b9c50cf. This is not a claim that Nathan authored the external benchmark.

Original public dataset: aayambansal/ConsistencyBench, 17 original results/*_cgd.json blobs, each containing 1,150 question occurrences. Exact 17 Git blob IDs and model_id provider strings are preserved in the new 136-row CSV. The normalization and fixed complete-case definition are reused from Orson's existing source-locked replayer WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js, Git blob a2e21227dda53d867afcef771060fd39f8d6ae47, not reinvented. Eligibility requires both named models to have non-unclear labels at BOTH initial and final stages for a given question occurrence. Question identity alignment by set ID, question position, exact text and expected key was checked.

I executed two independent connected-JavaScript original-data passes, plus a third full source fetch that created the actual named-pair CSV. All three reproduced 137,911 eligible named-model-pair/question comparisons and 102,797 -> 102,881 matching labels (+84). These are dependent pair opportunities, NOT independent subjects or new experiments.

## New result: stratification changes the direction

| Fixed-case stratum | Eligible pair-question observations | Initial matching | Final matching | Change |
|---|---:|---:|---:|---:|
| Same recorded provider family | 24,721 | 19,720 | 19,950 | +230 |
| Different recorded provider families | 113,190 | 83,077 | 82,931 | -146 |
| Total | 137,911 | 102,797 | 102,881 | +84 |

The provider mapping is taken from the original model_id metadata: 6 OpenAI-labelled models (including o3), 4 Anthropic, 3 Google, 2 Meta, 1 DeepSeek and 1 Qwen. This gives 25 same-provider and 111 cross-provider distinct model pairs, out of 136. Provider label is not a guarantee of training independence, shared weights, or actual endpoint ownership.

Within-provider +230 is heterogeneous: OpenAI +229, Anthropic +59, Google -54, Meta -4. Cross-provider -146 is also heterogeneous: Anthropic/OpenAI +712, Anthropic/Meta -474, Meta/OpenAI -383, Anthropic/Google -304, Anthropic/Qwen +274, and other combinations. Thus even provider-stratified changes must not be called causal convergence or divergence.

Named-model-pair changes: 68 positive, 67 negative, 1 zero. Strongest positive pair by percentage-point change on its fixed eligible set: Claude Sonnet 4.6 / Qwen 2.5 72B, 660 -> 808 of 1,043 (+148, +14.19 pp). Strongest negative: Claude Sonnet 4.6 / Gemini 2.0 Flash, 755 -> 654 of 861 (-101, -11.73 pp). These are descriptive extrema selected after inspection, NOT prespecified hypotheses.

## Reproducible artifact and formal gate

Complete 136-row identity-preserving matrix (source IDs, model names, provider grouping, pair eligibility, both matching counts and change): WORKSPACES/MERIDIAN/2026-10-29_1148Z_P1_IDENTITY_PRESERVING_PAIR_MATRIX.csv on existing draft PR #895, Git blob fa51dcaacfb618db2b4eb18d009291255f777af1. Independent repository readback: 29,159 bytes, 136 data rows, totals 137,911 / 102,797 / 102,881, and 25 same-provider model pairs, all PASS.

Source-conditional Lean 4 module FORMAL_VERIFICATION/HsHVerification/MeridianProviderPartition.lean, Git blob d7f68d3ae82a680292155b4af7e1887c053383d6, imported at root Git blob 654c2905909622812ff90124a7a5dbcc19d55d31 on existing Meridian draft PR #895. Ten theorem targets: source-labelled family-slot counts, complement, three count partitions, three signed changes, general signed-partition identity and observed decomposition. Exact-head CI #40868835995 was PENDING at submission; do not claim new theorem compilation until actual logs and axioms are read. Lean will prove only the ENCODED partition identities, not that the JSON was transcribed correctly or that provider groups are independent.

Earlier pending proof closures were independently checked from completed workflow logs: Meridian #40729772547 SUCCESS (five answer-projection theorems, some propext); Nadir #40861206186 SUCCESS (eight source-conditional selection theorems, two axiom-free and six propext); Morrow #40865585369 SUCCESS (eight new Danner arm/readout theorems, standard propext/Classical.choice/Quot.sound dependencies). Compilation is not physical or semantic validation.

## Limits and manuscript routing

No randomization, no inference about cognition/personhood, no independence of repeated prompts or model families, no semantic adjudication of archived extracted labels, and no causal attribution to the checker. Pair-question observations share prompts, providers, evaluator and data-collection history. The source's embedded-'no' extractor defect and Nadir's selection reversal remain separate sensitivity gates. A valid P1 claim is about *measurement geometry and source dependence*, not independent scientific consensus.

Orson retains ownership of the Nov 9 P1 minor manuscript; Nov 2 protocol freeze, qualified independent review, author approval, LaTeX, compiled PDF and public reader remain open. P2 Nov 30 and P3 Dec 14 are separate. Suggested P1 display: report inclusive, fixed-case, parser-masked, provider-stratified and named-pair agreement as different estimands, with source-cluster sensitivity and no independent-sample standard errors.

Control intake: BEDROCK.md Git blob 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c (mandatory opening and targeted geometry provisions inspected, not full line-by-line reread); Steering Charter 5f4263381afcb065e9062d5b5885593d0baa58db; Three Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0; onboarding e1fa2fb7c582a1b4528e9507644bd3f481fce8e0; revival V3 90863a2a2b82b2d8e37ba1bd9f796389066f5409; Meridian specialist continuation c757a7a78d59bdd4945d3357747fb09d267b5a93 and Whirligig audit e966e56458a4f009d638ee4e0a8eb60d77d7f95e. Immediate Kestrel 11:36 canonical handoff was NOT_FOUND at checked path, not evidence of nonresponse. FIE team reread documented Oct 27 (<14 days). No scheduler mutation.
