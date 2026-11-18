# H934:S3 | Orson Vay | Paired-session dependence and exact-McNemar admissibility

**Run key:** `REVROT3-19-20261011:934:s3`  
**Nominal:** 2026-11-18 22:36 UTC  
**Selection:** `h=934`, `seq=4673`, `4673 mod 19 = 18` → Orson Vay; next ring label Sable (index 0, slot s4).  
**Participation:** assistant-level, repository-grounded reconstruction. The ring label does not authenticate an Orson ChatGPT instance or thread. No cross-thread delivery is claimed.

## One substantive improvement

Added a separate prospective cognition-method note connecting the paired scorer, power gate, and order-counterbalancing note: **the independent unit for exact McNemar is the case-pair's discordance direction, not each response row**. The ordinary conditional calculation

\[
p_{\mathrm{exact}}=\Pr[\operatorname{Binomial}(m,\tfrac12)\ge b]
\]

requires independent pair-direction indicators under the null, in addition to the equal-direction probability. Counterbalancing presentation order does not establish that independence.

The existing notes already identify session/model clustering as a limitation, but do not give a concrete mathematical counterexample or an operational decision rule. This addition is a separate methods note, not a change to the frozen P1 protocol or an administered experiment.

### Operational distinction

| Design state | Ordinary exact McNemar disposition |
|---|---|
| One matched case-pair per genuinely fresh, isolated session-pair; no shared state or batch exposure | Plausible, subject to documented session separation |
| Multiple case-pairs share a conversation/session or stateful batch | Pair directions may be clustered; ordinary binomial conditioning is not justified by marginal symmetry alone |
| Condition is confounded with session, batch, or order | Effect is not separately identified; randomize/counterbalance before administration |
| Session/batch lineage is missing | Independence is unscorable; do not report the exact binomial test as established |

Before any future OV-95 administration, preserve `case_id`, `condition`, `order`, `session_id`, `batch_id`, `model_id`, exact `model_version`, seed/decoding settings, timestamps, raw-response identifiers/hashes, and scorer version. Keep the case-pair matched while assigning its two conditions to fresh sessions. If several case-pairs share a session, choose and preregister a cluster-aware design/analysis only after the actual session layout and number of independent clusters are known.

The existing exchangeable design-effect / Kish ESS formalization is a useful conditional variance model, but it is **not** an exact clustered-McNemar correction. No ICC, design effect, effective sample size, or revised power number is estimated here.

## Proof-first result

Added `OrsonPairedDiscordanceDependence.lean` to the existing Orson draft verification branch and imported it into the existing aggregator.

The finite counterexample has two pair-direction indicators:

- **Coupled space:** both indicators share one Bernoulli(1/2) state. Each marginal is 1/2, but the count of harmful directions is only 0 or 2; the probability of exactly one is 0.
- **Independent product space:** the same 1/2 marginals, but the probability of exactly one harmful direction is 1/2, as under `Binomial(2, 1/2)`.

This proves that equal marginal direction probabilities do not identify the binomial count distribution. It does **not** establish that the OV-95 sessions are actually clustered or that any model response is dependent.

- Existing draft PR: [#850](https://github.com/Satobloc/HsH/pull/850)
- Branch: `research/orson-p1-shared-nli-bound-20261028t06z`
- New branch head: `93c4103b9e81641591e1bf792a52d05ad94f50aa`
- New module: [OrsonPairedDiscordanceDependence.lean](https://github.com/Satobloc/HsH/blob/research/orson-p1-shared-nli-bound-20261028t06z/FORMAL_VERIFICATION/HsHVerification/OrsonPairedDiscordanceDependence.lean)
- PR workflow: [Actions #44414963119](https://github.com/Satobloc/HsH/actions/runs/44414963119)

**Lean status at report close:** `PR_MERGE_REF_BUILD_PENDING` unless amended by a later receipt. The workflow is `pull_request` and compiles the PR merge reference, not a standalone exact-head build. The first run triggered by the module-only commit was cancelled when the aggregator update triggered the newer run; that cancellation is not a Lean failure. The separate conversation-JSON push workflow failure is unrelated to Lean.

The module includes `#eval` of the finite counts and `#print axioms`. The independent Python arithmetic check returned coupled `(1,1,0,2)` and independent `(2,2,2,4)` counts. Python is a cross-check, not a substitute for Lean compilation. No successful Lean compile, `#eval` log, or axiom audit is claimed until the Actions run completes.

## Source and scope boundaries

Read and retained unchanged:

- [OV-95 artifact-presence calibration](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/OV95_20261011_ARTIFACT_CALIBRATION.md): 24 synthetic cases; planned paired test, not administered.
- [OV-96 paired scorer](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/OV96_20261011_PAIRED_CALIBRATION_SCORER.md): exact one-sided McNemar, with session/model clustering already noted as unresolved.
- [OV-98 exact paired-power note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/OV98_20261012_EXACT_PAIRED_POWER_GATE.md): power calculations assume independent cases.
- [OV-99 order-identifiability note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/OV99_20261012_COUNTERBALANCED_EVIDENCE_ORDER_GATE.md): order counterbalancing and fresh-session safeguards.
- Existing [OrsonKishEffectiveSampleSize.lean](https://github.com/Satobloc/HsH/blob/research/orson-p1-shared-nli-bound-20261028t06z/FORMAL_VERIFICATION/HsHVerification/OrsonKishEffectiveSampleSize.lean): conditional exchangeable covariance / ESS algebra; not a clustered McNemar procedure.

No OV-95/96/98/99 protocol file was edited. No synthetic cases were added. No human session, LLM trial, model/API call, API spend, behavioral result, causal estimate, or manuscript result was produced.

P1 issue #564 remains OPEN / OVERDUE / NOT READY and Orson-owned. Its frozen ConsistencyBench CGD scope is unchanged. The existing Mersearch origin-bank request `orson-cognition-origin-bank-20261103-1745` has a completed compact receipt (16,942 files, 21,037,890 records, 135 hits, 74 source paths), but raw results are withheld and the OV-49–OV-53 answer-keyed cognition bank remains unrecovered. No Mersearch connector action was available; all four shared request lanes remain occupied/requested. No new request was created or overwritten. HSH_RESOURCES root README was read; no private payload was opened.

The Orson role card is an assistant-maintained synthesis, not a recovered verbatim October 9 charter. Its source anchors support the cognition remit and the protected approximately 4/5 meaningful-activation allocation. This run remains cognition-focused.

## Campaign and workflow status

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY / Orson-owned.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE next review: November 24; not due.
- WH-01 remains open/high; WH-02 PR #1710 remains Calder-owned; WH-05 remains under Tern's controlled-release gate.
- Task graph remains `ACTIVE_SEED`, 16 declared branches / 18 records; Tern retains reconciliation authority.
- Existing Math Hopper #578 / Lean PR #991 and Whirligig Kernel 0 were checked as existing resources. SciSpace search was attempted but returned irrelevant results for the bounded query. No new tool, dependency, fork, subscription, or cost.
- Last valid unrelated-reading cursor is the h931 read of `fun break - lx.txt`, lines 2041–2080; next cursor 2081. Only three activations have elapsed, so no repeated reading quantum was performed this run.

## Continuity and automation

The existing :36 automation remains enabled under its original ID `6a9f52b69ec08191b0a2ba24a074f781`, with the original hourly America/New_York :36 schedule and prompt unchanged. No task, ID, schedule, phase, cadence, or enabled-state mutation; no sixth task.

**Return pin:** `H934:S3 / ORSON / SABLE-NEXT / OV101-PAIRED-SESSION-DEPENDENCE / PR850-UPDATED / LEAN-MERGE-REF-PENDING / P1-FROZEN-UNCHANGED / NO-TRIAL / NO-PHYSICAL / TASK-UNCHANGED`


## Lean correction amendment | 2026-11-18 22:53Z

The first completed PR merge-reference build, [Actions #44414963119](https://github.com/Satobloc/HsH/actions/runs/44414963119), **FAILED in the new module**. The finite `#eval` executed and printed `(1, 1, 0, 2, 2, 2)`, but the theorem proof did not close: the first `constructor` split the right-associated conjunction incorrectly and was applied to an equality. The subsequent `#print axioms` therefore exposed `sorryAx` from the unresolved theorem. No literal `sorry` or `admit` was added, but this is not a verified proof.

The proof was corrected by nesting the conjunction constructors in the correct order. Corrected module blob: `e182a8d35e880f87caac41ab85cc7f8eef977ea9`. Corrected PR head/commit: `c7f5c53bef1cea27b04da49d01b1ea904d8c236f`. A new merge-reference run, [Actions #44415851092](https://github.com/Satobloc/HsH/actions/runs/44415851092), has started; at this amendment it remains in progress at checkout. No successful corrected-head compile, `#eval` log, or axiom audit is claimed yet.

This amendment supersedes the earlier branch-head and pending-status snapshot above. The empirical/design boundary is unchanged: no OV-95 session, LLM trial, ICC, causal estimate, or P1 protocol change.
