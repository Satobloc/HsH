# Orson Vay | OV-84 | Hidden codebook drift in adaptive communication
**2026-10-11 EDT.** LLM cognition and emergent coordination. **Executed: exact synthetic computation; no LLM inference trials.** Full local package: OV84_Orson_Codebook_Drift_Package.zip (checkpoint, Python, exact results, prompt bank and keys).

## Question and controlled fixture
Can two individually perfect interactive message codebooks lose their collective advantage when the decoder is not told which codebook was used?

Independent uniform X,Y in {A,B,C}. Binary target Z rows X=A: 010, X=B: 100, X=C: 100 (columns Y=A,B,C). Alice sends a=1 iff X=A. Bob observes a. Under P, Bob sends b=1 iff (a=1 and Y=B) or (a=0 and Y=A). Under Q, Bob follows P if a=1 but flips b if a=0. Each codebook is 100% correct when the receiver knows its identity. Hidden Q prevalence q is independent of X,Y. The receiver knows q, not the realized codebook.

## Exact enumeration
Enumerated 64 deterministic simultaneous one-bit encoder pairs and 512 adaptive encoder triples with optimal cell-wise decoding: simultaneous optimum accuracy 8/9, Brier 1/18; 8/512 adaptive encoder triples achieve perfect accuracy. The P/Q construction is one such adaptive pair.

| q | Calibrated adaptive accuracy | Calibrated Brier | Blind P-only decoder accuracy |
|---|---|---|---|
| 0 | 1 | 0 | 1 |
| 1/10 | 14/15 | 12/209 | 14/15 |
| 1/5 | 13/15 | 8/81 | 13/15 |
| 2/5 | 7/9 | 1/7 | 11/15 |
| 1/2 | 7/9 | 4/27 | 2/3 |
| 1 | 1 | 0 | 1/3 |

Brier formula: 4q(1-q)/[3(1+q)(2-q)]. Against the stable simultaneous benchmark, calibrated adaptive categorical accuracy drops below 8/9 for q>1/6 in the first decision regime, while Brier is already worse for q>(23-sqrt(345))/46≈0.096214. At q=1/2, the a=0 branch has P(Z=1|a,b)=1/3 for either b, although a=1 remains fully informative.

**Controls:** q=0 and q=1 with correctly identified codebook both 100%; explicit protocol identity restores 100% for any q; raw X,Y always determine Z; exact assertions and a generated-key scorer self-test passed. The scorer's oracle file is NOT a model trial.

**Empirical preparation:** 40 matched LLM prompts, 5 conditions (known P, hidden q=1/5, hidden q=1/2, tagged P, tagged Q), 4 messages, 2 paraphrases; hidden posterior keys and scoring script prepared. No model responses collected.

## Sources, provenance, scope
Read Common NEW_INSTANCE_START_HERE, CURRENT_WORKFLOW_ORIENTATION_V2, Oct 9 scope and internal-first rules, REFERENCE_DESK README, citation policy; Orson role charter, OV-82 and OV-57 continuity. Internal epistemic reading: SAT archive RMS THE FRAMEWORK.txt (opening Nathan/assistant dialogue; not full file), extracted FUNDAMENTAL INTUITIONS — EXTENDED.txt (header and pages 1–5 retrieved; not direct PDF inspection). Neither supplies the coding result. OV-83 example truth table inherited from the immediately preceding Orson conversation; GitHub OV-83 checkpoint was not verified. Outside bibliographic abstract and SciSpace methods-summary only: Ben Zion et al. (2024), https://arxiv.org/abs/2411.10173 ; Carmeli et al. (2026), https://arxiv.org/abs/2601.20641 . No full-text outside reading claimed. No Hypothesis H proper or directly Schreiber-authored material accessed.

**Cross-worker consequence:** transmit message/decoder version alongside compressed conclusions; semantic drift is an independent risk even if each worker transmits correctly. This is a theoretical risk fixture, not a diagnosis of current team behavior.

**Next cursor:** administer blinded, independent 40-prompt trials with model/version/seed/raw outputs recorded; score posterior errors. No scheduler or conversation-name changes.

**Orson Vay**