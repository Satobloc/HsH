# H839:s3 | P1 joint-reliability estimand compatibility and assumption-free bounds

**Date:** 2026-11-14  
**Run key:** `REVROT3-19-20261011:839:s3`  
**Selected:** Orson Vay, ring index 18  
**Next:** Sable, index 0  
**Disposition:** NEW PRIMARY LITERATURE REVIEWED · P1 ESTIMAND COMPATIBILITY GATE ADDED · THREE-EVENT FRÉCHET BOUNDS FORMALIZATION STAGED · NO NEW TRIAL · P1 REMAINS NOT READY

## 1. Authority, source and scope

The fixed :36 rotation selects Orson Vay at h=839; Sable is next. The original MIRA raw-export user-role message was recovered in the Library and read in context. It assigns LLM cognition/reasoning expertise and advisory work concerning ChatGPT, NotebookLM, model behavior, and Nathan's use of LLMs. The current role charter is an assistant-maintained synthesis, not the original message. No authenticated current Orson thread or historical-instance participation is claimed.

The controlling P1 protocol freeze remains `WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md`. It permits bounded methods/literature/archival work and prohibits a new model trial, human session, API spend, dataset expansion, or scope expansion. None was performed. Issue #564 remains the canonical P1 readiness docket. The November 9 gate is overdue / NOT READY; no paper-gate advancement is claimed.

## 2. New primary comparator

Vineet Kumar, Darshita Rathore, and Anindya Moitra, “All Verdicts are Not Equal: Rethinking LLM Judge Reliability,” *Proceedings of the 15th International Joint Conference on Natural Language Processing and the 5th Conference of the Asia-Pacific Chapter of the Association for Computational Linguistics*, 2026, pp. 4581–4598.

- Official primary text: https://aclanthology.org/2026.aacl-long.207.pdf
- arXiv record: https://arxiv.org/abs/2610.12083
- Published November 6–10, 2026.
- The paper audits six judges across four benchmarks, five prompt formats, two candidate orders, three sampling temperatures, and ten repetitions per condition.

Its trustworthiness target is the joint event
[
T = \Pr(N=1\land P=1\land R=1),
]
where (N) is repeatability across independent runs, (P) is invariance under candidate-order swap, and (R) is correctness against ground truth.

The paper defines (C=\Pr(N=1)), (1-\varphi=\Pr(P=1)), and (A=\Pr(R=1)). Under its A2 conditional-independence assumptions and its forced-binary/equally weighted preference assumption (q=1/2), it gives
[
T_{\rm closed}=C(A-\varphi/2).
]
The authors explicitly note that A2 may fail and describe the closed form as an empirically conservative lower bound in their tested cells, not as an assumption-free identity.

### Table 10 uncertainty check

A separate count of the 24 benchmark-by-judge entries in Table 10 found:

| Gap interval for (T_{\rm closed}-T_{\rm joint}) | Cells |
|---|---:|
| Upper endpoint strictly positive | 9 / 24 (37.5%) |
| Upper endpoint exactly zero | 5 / 24 (20.8%) |
| Upper endpoint strictly negative | 10 / 24 (41.7%) |

All 24 point gaps are nonpositive. However, 9 bootstrap intervals extend above zero and 5 more touch zero. The observed point-estimate pattern is therefore not a universal mathematical lower-bound guarantee, nor is it uniformly separated from zero at the reported interval level. This is an interpretation of the published table, not a reanalysis of the authors' raw data.

## 3. Assumption-free three-event bounds

For any three events (N,S,R) with marginals (C=\Pr(N)), (S=\Pr(S)), and (A=\Pr(R)), and joint rate (T=\Pr(N\cap S\cap R)), the Fréchet bounds give
[
\boxed{\max(0,C+S+A-2)\le T\le\min(C,S,A).}
]
If (S=1-\varphi), the lower endpoint is (\max(0,C+A-\varphi-1)).

The lower bound follows from the union bound on (N^c\cup S^c\cup R^c); the upper bound follows because an intersection is a subset of each event. No independence or equal-error assumption is needed. The interval can be wide; if joint observations exist, report the directly measured joint rate rather than replacing it with a marginal-only estimate.

A formal non-identifiability witness is also useful: two abstract eight-cell probability tables can have all three marginals equal to (1/2) while their triple-intersection rates are (1/2) and (0). Thus the three marginal rates do not identify the joint rate.

## 4. Compatibility with frozen P1 ConsistencyBench evidence

The public source snapshot remains pinned to ConsistencyBench commit `bfc676baa848c7f1715bb73aee148180de15516e`; `src/evaluate.py` blob SHA-1 is `0453540cb7c19227601e59fb342fa93e736da849`.

The pinned CGD path:

- uses a shared GPT-4o-mini NLI checker configuration (temperature 0, max_tokens 10);
- truncates each raw response to 500 characters before the checker call;
- passes the prior raw response and current raw response in chronological order, without the corresponding question/premise;
- stops the prior-answer loop at the first positive contradiction result and stores an aggregate Boolean flag;
- does not generate a repeated same-pair/same-configuration NLI judgment or a reversed-order invocation for the same pair;
- does not preserve per-call raw NLI request/response records or independent human contradiction labels.

The repository has a separate self-consistency strategy; it is not the CGD result archive used by P1. The 17 CGD files are 17 target-model output series, not 17 independent judge channels. The shared checker is common measurement-method exposure; it does not establish correlated checker errors.

Consequently, the preference-judge formula (C(A-\varphi/2)) cannot be imported into P1. Pair-order reversal for a binary contradiction classifier is a symmetry test, not a pairwise preference flip for which exactly one ordering must be correct. The (q=1/2) assumption does not transfer.

The existing P1 source-key PPV/sensitivity/specificity diagnostics are not the same as correctness against an independently adjudicated contradiction criterion.

## 5. Proposed NLI-specific estimand (future design only)

A future, explicitly reopened NLI validation could define:

- (N): the same ordered response pair and fixed checker configuration receive the same label across independent repeated calls;
- (S): the contradiction label is invariant when the two response texts are reversed;
- (R): the label agrees with an independent, blinded human adjudication of contradiction under the actual question/premise;
- (T_{\rm NLI}=\Pr(N\land S\land R)).

This is an adaptation proposal, not a result from the current archive. It requires a fixed pair bank, repeated calls, reversed-pair calls, full raw checker request/response/version records, independent blinded criterion labels, and a held-out question-set split. A direct joint rate should be reported; if only marginals are available, report the Fréchet interval. No numeric acceptance threshold is set without a preregistered design and actual data.

| Gate | Frozen P1 archive | Future proposed study |
|---|---|---|
| Repeatability (C) | Not observed for same pair/config | Repeated same-pair calls |
| Pair-order symmetry (S) | Not observed | Reversed input order |
| Criterion correctness (A) | No independent contradiction labels | Blinded human adjudication |
| Joint (T_{\rm NLI}) | Not estimable | Direct joint readout |
| Holdout | Existing fixed archive only | Disjoint question-set holdout |
| Falsification threshold | Not justified from current records | Preregister before any authorized trial |

This design is outside the current freeze. No trial, API call, human session, or endpoint use was initiated.

## 6. Lean formalization status

A new module, `FORMAL_VERIFICATION/HsHVerification/OrsonJointReliabilityBounds.lean`, was staged on the existing draft PR #850 branch, with an import in the existing verification root. It formalizes the finite eight-cell probability-table Fréchet bounds and the equal-marginals/different-joint witness.

- PR #850 remains OPEN / DRAFT / UNMERGED and stacked on PR #833.
- The first merge-reference run #43654453303 failed on a missing `le_min` lemma name and noncomputable real-valued witness definitions.
- Commit `e0f4564b08e3cf63b45f1f21815e07e8406f2005` corrected the min lemma name but accidentally duplicated the `noncomputable` modifier.
- Merge-reference run #43654855547 failed at lines 88 and 101 with “unexpected token 'noncomputable'; expected 'lemma'.” The Fréchet theorem body itself elaborated and its axiom print listed only `propext`, `Classical.choice`, and `Quot.sound`, but the module target failed because the witness definitions did not parse.
- The duplicate modifiers were corrected in commit `776f5df7cad655dd9a7a8d99720a1db3e2347872`; current module blob is `11a6aeb305d21a502fc20ccf2ad10aa28e157cee`.
- Corrected merge-reference run #43655298253 completed SUCCESS. Its synthetic merge source commit was `a2e82fae2f3d510dd8b1402ee2f6440f3a969759`; the workflow used Lean 4.34.0 and Lake 5.0.0.
- `OrsonJointReliabilityBounds` built at target 8984/8986; the root `HsHVerification` target built at 8985/8986; the full Lake build completed successfully (8,986 jobs).
- Both theorem-specific `#print axioms` reports list `propext`, `Classical.choice`, and `Quot.sound`; neither report includes `sorryAx`.
- Tests, lint, nanoda, leanchecker, and the separate global axiom-audit step were skipped. This is a successful PR merge-reference build, not an exact-head standalone build. PR #850 remains OPEN / DRAFT / UNMERGED; no merge or current-main integration is established.
- No local Lean/Lake/Elan toolchain is installed in this runtime. The existing PR/Actions route was used; no new tooling, dependency, fork, or paid service was created.

The module is UNVERIFIED until the corrected run completes. Even a successful Lean build would prove only the formalized finite-table statement, not the soundness of translating any empirical source into it or the truth of any P1 measurement claim.

## 7. Controls and next steps

- P0 Code Grurple remains ACTIVE.
- P1 remains Orson-owned, OVERDUE / NOT READY.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- FIE last full review: November 10; next review: November 24.
- The task graph remains 18 records against declared branch_count 16; its P1 PR pointer is stale. Tern retains graph custody; no graph edit or rebase was made.
- All four Mersearch request lanes remain occupied/requested. Mersearch was not available as a callable connector in this runtime; no request was overwritten, released, or retriggered.
- HsH, SAT archive and HSH_RESOURCES front doors were checked. HSH_RESOURCES private payload was not opened. SciSpace was used for discovery/extraction; the ACL Anthology paper was read directly. Math Hopper, Whirligig and existing Lean PR #850 were checked; no new tooling was built.
- No physical calculation, fit, physical prediction, independent measurement, SAT-O/Blockwave equation change, manuscript edit, PDF/reader claim, paper-gate advancement, or BEDROCK promotion occurred.
- Unrelated reading: Okakura Kakuzō, *The Book of Tea*, Project Gutenberg #769, plain-text lines 1651–1690. Next cursor: 1691. No physical break is claimed.

**Bottom line:** P1's current NLI archive does not identify a trustworthy-verdict rate. The new literature supplies a useful reliability architecture, while the assumption-free Fréchet interval shows exactly what can and cannot be inferred from marginal rates. The current frozen dataset cannot supply the missing repeatability, symmetry, or independent-criterion observations.
