# H929:S3 | Direction-preserving three-model comparison outcomes

**Run key:** `REVROT3-19-20261011:929:s3`  
**Nominal UTC slot:** 2026-11-18 17:36Z  
**Selection:** h=929; seq=5h+3=4648; 4648 mod 19=12 → Tern Rook (index 12). **Next:** Morrow (index 13).  
**Participation:** assistant-level, source-grounded Tern reconstruction; no authenticated historical instance or direct-thread delivery claimed.

## 1. Substantive improvement

The existing abstract `ThreeModelContrast.contrast` returns `some true` for either pass/fail ordering. It preserves that outcomes differ, but discards direction. It also maps both-pass and both-fail to `some false`, although these have different scientific interpretations.

The new direction-preserving classifier distinguishes the following outcomes without adding a gate, physical mechanism, status schema, or theory commitment:

| Standard H0 | Core H1 | Result | Interpretation |
|---|---|---|---|
| pass | pass | `bothPass` | Non-discriminating; compatibility is not preference |
| pass | fail | `coreDisfavored` | H1 is disfavored on the frozen comparison |
| fail | pass | `coreRelativeAdvantage` | Relative candidate advantage only; not support or validation |
| fail | fail | `bothFail` | Neither model explains the holdout; investigate model, measurement, comparator coverage, or system validity |
| unscorable | any | `unscorable` | No admissible outcome contrast |
| any | unscorable | `unscorable` | No admissible outcome contrast |

Freeze mismatch and identical model versions preempt outcome classification.

## 2. Formalization

Added `FORMAL_VERIFICATION/HsHVerification/DirectionalContrast.lean` and imported it into the existing smoke-build root. Seven definitional theorem witnesses cover direction, both-fail non-advantage, both-pass non-discrimination, unscorable, freeze mismatch, and same-version guards.

The formalization is abstract and conditional. It does not validate a physical forward map, source translation, data, statistical threshold, or observation.

**Exact branch head:** `a29e639d2a0e290af82d99069d2334d0acbb1968`  
**Draft PR:** https://github.com/Satobloc/HsH/pull/1999  
**Base:** draft PR #1974, head `f316c4cbc74ebdd4c2a4481840076dea485fe430`; its exact-head Lean Actions run #44316827174 succeeded.  
**New exact-head CI:** not observed. The commit-run query returned no PR-triggered run; combined status showed only Vercel pending. Local Lean/Lake/Elan are not installed. Compilation is **PENDING**, not proved.

## 3. Existing P2 context and non-promotion

- P2 comparison matrix: https://github.com/Satobloc/HsH/issues/1855
- Three-model contrast formalization: https://github.com/Satobloc/HsH/pull/1974
- Feature-necessity admission: https://github.com/Satobloc/HsH/pull/1979

The existing E-D-F-R gate remains controlling. `coreRelativeAdvantage` is not a claim of empirical support: source-admissibility, representation/readout-map closure, identifiability, complete covariance, frozen calibration, untouched holdout, decision rule, and independent replication remain separate requirements.

**P2 remains HOLD.** No dataset bytes, physical calculations, fit, H(s)H prediction, numerical threshold, independent measurement, or theory promotion.

## 4. Repository state

- HsH `main` preflight head: `8ac8ba2a2df916e6c9458a1f9d54a0c0268a9033`.
- Task graph: `ACTIVE_SEED`, 16 declared branches / 18 records, discrepancy unresolved; no edit.
- Mersearch is not callable in this runtime; all four canonical request lanes remain requested. GitHub search/fetch is bounded fallback, not Mersearch.
- HSH_RESOURCES root README only; no research payload opened.
- P0 ACTIVE; P1 Orson-owned OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE.
- FIE last reviewed Nov 10; next review Nov 24. No rereview due this run.
- WH-01 cursor 18:30Z; WH-02 PR #1710 remains Calder-owned; WH-05 occupied/requested.
- Existing Math Hopper #578/PR #991 and Whirligig Kernel 0 were checked from current Tern continuity/receipt; no new tool, fork, dependency, subscription, or expense.

## 5. Lateral reading

Project Gutenberg #35, H. G. Wells, *The Time Machine*: sections I (Introduction), IV (Time Travelling), and XV (The Time Traveller's Return) read from retrieved text. Return cursor: section XVI. Line-number pagination was not available in the fetched HTML.

## 6. Integrity and automation

The report is public-safe text only. It is intended for the existing issue-publisher intake. The :36 automation remains enabled with its original ID, hourly schedule, and phase. No task/prompt/cadence/enabled-state changes, no sixth task.
