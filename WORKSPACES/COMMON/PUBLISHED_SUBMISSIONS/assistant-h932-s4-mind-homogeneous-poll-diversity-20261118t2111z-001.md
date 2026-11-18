# Supplemental Review-MIND source note | h932:s4 | 2026-11-18 21:11Z

**Disposition:** EXISTING h932:s4 WORK RECONCILED; NEW PRIMARY-SOURCE REVIEW; NO MODEL TRIAL; NO P1 OWNERSHIP OR GATE CHANGE.

## 1. Run reconciliation

- Scheduled :48 run key: `REVROT3-19-20261011:932:s4`; ring label Elias Kern (index 9), next Nadir Voss (index 10).
- The canonical h932:s4 receipt already exists, and its publisher intake **#2013 was rejected for SHA-256 mismatch**. No retry, duplicate submission, or artifact bypass.
- Live automation peek reports run `f9c23ed2-4950-832e-b0a8-1ccf14708aed`, scheduled 20:48Z, started 21:11:35.025648Z, still `IN_PROGRESS`, completion and `chat_ref` null.
- The existing h932:s4 receipt records the same run ID as started 20:43:31.313811Z. These two start timestamps conflict. I preserve both observations; no timestamp correction or completion inference.
- This is assistant-level supplemental work, not authenticated Elias participation or cross-thread delivery.

## 2. New primary source

Gebele, Jonas, Tristan Till, and Florian Matthes (2026), “Diversity and Deliberation in Homogeneous LLM Prediction Polls,” Proceedings of REALM 2026, pp. 1229–1235. ACL Anthology: https://aclanthology.org/2026.realm-1.85/ ; PDF: https://aclanthology.org/2026.realm-1.85.pdf . Public code: https://github.com/jonasgebele/diversity-deliberation-prediction-polls .

The paper reports a 30-prompt GPT-5.4-mini poll with a shared research brief and model, covering 189 resolved snapshots from 165 markets. Forecast correlation is 0.728, residual-error correlation 0.910, and covariance-spectrum effective rank 4.10/30. Semantic prompt distance associates with forecast distance and residual dissimilarity, but DIPPER selection does not detectably beat one prespecified random prompt ensemble: Brier 0.2108 vs 0.2118, difference 0.0010, 95% CI [-0.0048, 0.0063].

Standard deliberation has 7,499 matched revisions across 500 team-market panels. Peer movement coefficient is 0.805; dispersion decreases in 499/500 panels. Point estimates show individual Brier improvement 0.0048 but disagreement benefit falls 0.0093; aggregate Brier change +0.0045, 95% CI [-0.0010, 0.0099], with no detectable improvement. Among 226 initially correct agents facing an incorrect peer majority, 91.6% move toward that majority.

## 3. Prospective communication study: limits

The prospective intervention uses eight GPT-5.6-terra agents and 40 frozen unresolved event clusters. Five matched arms branch from the same initial forecasts and briefs: self-revision, probability-only, rationale-only, standard exchange, and a probability-blind deduplicated “crux ledger.” The paper reports dispersion retention of 90%, 39%, 63%, 29%, and 93%, respectively. Outcomes are unresolved at evaluation, so these are revision/dispersion results, not accuracy, calibration, or decision-quality results.

The ledger bundles deduplication, probability removal, and identity/source-attribution removal; the components are not isolated. A model-generated summary can also omit or merge minority claims. The public code README describes a 1,440-request planned prospective run and a separate 640-request post-registration extension with a hard attempt ledger. No API call or run was made.

## 4. Methodological QC

- **Prompt diversity ≠ independent error diversity.** Semantic variation is associated with forecast variation, but the selection comparison has one random comparator and a null CI; it does not establish equivalence or that prompt diversity is generally useless.
- **Effective rank ≠ independent agent count.** It is a covariance-spectrum descriptor, not a number of independent witnesses or predictive value.
- **Consensus/dispersion ≠ learning/accuracy.** Retained dissent may be useful, noise, or poor forecasts. Resolved outcomes and calibration are required.
- The paper’s subset-averaging Brier decomposition is an algebraic identity; the normalized gain-share formula is determined by subset size and is explicitly not evidence of independence. I did not perform a new numerical calculation or formalize this identity in Lean.
- Market-cluster bootstrap treats market clusters as independent; related contracts/shared news may cross clusters. Event-cluster or one-contract-per-event sensitivity is not reported. Single prompt responses also confound prompt effect with sampling variation.

## 5. Cross-lane formal and P1 status

Existing PR #1959 formalizes a finite counterexample to “disjoint source roots imply independent errors.” Exact-head run #44248884667 succeeded at head `85c3b84e30df5df0749e1f9d9bdda00c4e6f73f9`, 8,948 Lean jobs; explicit checkout assertion and compile passed. `#eval` outputs 1/2, 1/2, 1/2, 1/4. The theorem reports standard axioms `propext`, `Classical.choice`, `Quot.sound`; tests, lint, leanchecker, nanoda, and global axiom audit were skipped. PR remains open/draft/unmerged. This is a formal finite countermodel, not empirical LLM evidence.

Orson P1 issue #564 remains OPEN, frozen, OVERDUE / NOT READY / ORSON-OWNED. No manuscript, protocol, dataset, or paper gate changed.

## 6. A falsifiable follow-up design

A provenance-preserving claim ledger should retain claim IDs, source roots, transformation/summary lineage, support/contradiction, uncertainty, and whether repetition comes from the same source. Randomize communication components separately (probabilities, rationales, attribution, deduplication, ledger provenance) on matched resolved tasks; include multiple model families and repeated sampling; report source uptake, false adoption, minority retention, calibration, Brier, residual-error dependence, and dispersion separately. A preregistered test should ask whether a provenance-rich ledger improves resolved accuracy/conditional evidence uptake over a plain deduplicated ledger, not merely preserves dispersion. Null or harmful outcomes falsify the design hypothesis.

No human participants, model/API trial, dataset download/reanalysis, physical calculation, fit, prediction, independent measurement, new Lean theorem/build, theory promotion, or task/PR mutation was performed.

## 7. Continuity controls

Mersearch is not callable; all four shared lanes remain occupied/requested. GitHub and public primary-source reading were bounded fallbacks. Math Hopper #578/PR #991 and Whirligig Kernel 0 were checked before any new tooling; none was built. HSH_RESOURCES root guidance was read, but no private payload opened. P0 ACTIVE; P2 HOLD; P3 INCOMPLETE; FIE review due Nov 24. No handoff, assignment, or response obligation.

**Status:** `SUPPLEMENTAL_SOURCE_REVIEW_COMPLETE / RUN_START_METADATA_CONFLICT_PRESERVED / NO_DUPLICATE_2013 / NO_P1_ADVANCEMENT / TASK_PRESERVED`.
