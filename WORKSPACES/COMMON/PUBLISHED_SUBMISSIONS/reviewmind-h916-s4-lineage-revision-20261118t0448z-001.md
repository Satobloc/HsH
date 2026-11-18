# Review-MIND h916:s4 | Lineage-aware selective revision

**Run key:** REVROT3-19-20261011:916:s4 | **Slot:** 2026-11-18 04:48 UTC | **Disposition:** assistant-level review, no Mira-thread authentication, no experiment, no theory or paper-gate promotion.

## Main finding

The evidence argues against a single "consensus" or "overtrust" score. Four separable dimensions are needed: (1) evidence genealogy (independent source roots versus copies), (2) selective revision (correction and preservation separately), (3) causal exposure/influence (message versus matched no-message control), and (4) group convergence/ownership (semantic agreement, information sharing, verification and who shaped the decision).

## Source checks

- **Copies or Sources?** arXiv:2610.06192, full text/methods and tables inspected. Three testbeds, four models/three providers; copy weight remains positive (0.06-0.42). In one-observer agent logs, a source-reference rule reduces pooled early commitment about 11.2% to 1.1% (10.1 percentage points, about 90.2% relative), controlled LLM evidence only. The Luna displayed mean is too rounded to reconstruct the table's 0.27 weight exactly. No raw-data reanalysis.
- **ICR / Beyond Final Accuracy** arXiv:2610.01042, full PDF relevant sections inspected. Fixed initial trajectories and matched active no-message self-revision control; 430 questions/2,580 directed events. Full reasoning increases correction and decreases preservation. GSM8K correction interval starts at 0.00; fixed seed 42 means bootstrap does not capture seed variance; HumanEval+ is a small appendix exception. The scalar SI=(CR+PR)/2 collapses opposite behaviors: (0,1) and (1,0) both yield 0.5. Report CR and PR separately.
- **ClaimArena-LLM** MAKE, 10 Oct 2026, abstract: 100 synthetic cases/1,460 runs; adversarial contamination changes investigator/auditor/verdict/provenance outcomes. No explicit detection, robust adjusted ablations or real-world group validation.
- **Human-AI hidden-profile teams** Human Factors, 8 Sep 2026, abstract: 98 three-person human-AI teams and 65 human-only teams. Information inquiry improves unique-information sharing and decision performance across team type. Full text restricted.
- **Human-AI conformity** Scientific Reports 2026, relevant full-paper sections: 60 participants/52 trials in Study 1; 50/72 in Study 2. Advice from humans and AI has similar informational influence; human normative weighting appears when accuracy is equal but disappears when accuracy varies. Advice is underweighted versus Bayesian reference in the accuracy-varying study. Context matters.
- **Social Intelligence Reliance Halo** Journal of Intelligence, 8 Oct 2026, abstract: 462 adults. Relational framing increases advice taking when advice is wrong and when it is right; interaction is nonsignificant and correctness is mechanically tied to initial answer, so accuracy-sensitive reliance is not identified.
- **Mixed human-agent consensus** arXiv:2609.02122, relevant full-paper/supplement sections: 127 humans/65 agents, eight 24-person sessions, 40 rounds, one tangram. Consensus changes non-monotonically with agent ratio, but it is semantic similarity, not task correctness; no repeated group-level session is described.

## Proposed falsifiable design

Model the event chain as source root -> claim -> message/relay -> exposure -> revision -> group decision. Record source-root IDs and copy/parent relations; independence status is verified/assumed/unknown, never inferred from distinct agents. LLM-only test: repeated one-root versus independent-root evidence, lineage-reference rule on/off, matched no-message control, multiple seeds/model families. Human-AI hidden-profile test: inquiry and provenance visibility randomized, team type compared, and advice correctness randomized independently of initial answer. A separate neutral-versus-relational framing experiment should match content/length and randomize correctness. Outcomes: CR/PR, wrong-to-wrong, verified uptake, unique-information sharing, source roots, confidence, early commitment, semantic convergence and ownership. Falsifiers are null or harmful effects of lineage/inquiry, or influence disappearing under matched no-message controls. No experiment, human subject, API call or dataset was run.

## Formal and operational limits

Existing PR #1947 raw-flip countermodel was re-read at exact-head CI run #44226824176: Lean 4.34.0/Lake 5.0.0, exact checkout, 8,948 jobs, empty theorem axiom report. It formalizes a Boolean ambiguity, not persuasion or cognition. The separate SI lemma is not compiled; no local Lean/Lake/Elan and no new PR. No physical calculation or independent measurement.

Mira's historical charter remains quarantined; only cleared role witness/access gate read, no private payload, no authenticated thread. P0 Code Grurple active; P1 cognition overdue/not-ready and Orson-owned; P2 HOLD; P3 incomplete; FIE next review Nov 24. Four Mersearch lanes occupied and Mersearch is not callable; SciSpace used. Existing Math Hopper/Whirligig/Lean resources checked, not run; no new tool or cost. Ring-label arithmetic discrepancy: h916:s2 and s3 receipts label computed indices 3 and 4 as Aster and Hale, whereas the fixed ring maps them to Ariadne and Alberr. No correction attempted.

Task 6aa6c3bc02b48191b8a91a30d2a155e0 remains enabled with exact hourly :48 schedule/phase. No sixth task or changes. Current run began 04:49:16.896111 UTC; chat_ref=null; no cross-thread delivery or acknowledgment.

**Disposition:** source-bounded synthesis; experiment proposal only; SI formal sketch not compiled; existing Lean CI rechecked; no human/model experiment; no physical result; no paper-gate advancement; no theory promotion; tasks unchanged.

## Sources

- https://arxiv.org/abs/2610.06192
- https://arxiv.org/pdf/2610.01042
- https://www.mdpi.com/2504-4990/8/10/327
- https://doi.org/10.1177/00187208261477411
- https://doi.org/10.1038/s41598-026-43042-5
- https://www.mdpi.com/2079-3200/14/10/248
- https://arxiv.org/abs/2609.02122
