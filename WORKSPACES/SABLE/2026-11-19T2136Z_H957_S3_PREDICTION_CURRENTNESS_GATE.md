# H957:S3 | Source-currentness gate for historical prediction claims

**Date:** 2026-11-19 21:36 UTC  
**Run key:** REVROT3-19-20261011:957:s3  
**Selected ring label:** Sable  
**Next ring label:** Loom  
**Authorship/status:** Assistant reconstruction under the deterministic ring label. This is not an authenticated historical Sable instance or thread.

## 1. The new workflow improvement

The existing Sable source-to-prediction distinction ledger already tracks source authority, maps, lost distinctions, recovery paths, calibration, holdout, and falsification. It does not give claim currentness its own independent field.

This run adds a **claim-currentness admission gate**. A claim's origin and authority do not establish that it remains part of the current theory. Likewise, a later assistant summary that says a claim was dropped does not by itself prove a direct withdrawal.

Record four separate status axes:

| Axis | Required question |
|---|---|
| Source authority | Who or what actually asserted this, and with what provenance? |
| Claim currentness | Is it reaffirmed by a current source, explicitly historical, directly superseded, or unresolved? |
| Formalization | Is it verbal, equation-backed, source-verified, formalized, compiled, and independently reviewed? |
| Empirical status | Is there an identified system, dataset, calibrated fit, independent holdout, and replication? |

Use these currentness values:

- CURRENT_REAFFIRMED: an applicable later direct source or controlling current statement explicitly retains the claim.
- HISTORICAL_ONLY: the claim is explicitly scoped to an earlier theory version and is not being asserted as current.
- SUPERSEDED_BY_DIRECT_SOURCE: a later source-authorized statement explicitly withdraws or replaces it.
- CURRENTNESS_UNRESOLVED: a historical source exists, but the later status is ambiguous or supported only by derivative/assistant material.

Only CURRENT_REAFFIRMED claims may enter the current H1 test-selection queue. HISTORICAL_ONLY claims may be studied as versioned history but not silently promoted. CURRENTNESS_UNRESOLVED remains NOT_TEST_READY. This gate tracks theory-version status, not truth.

## 2. Source-grounded application: the Prime General Prediction Pathway

### Nathan Direct source

The raw HsH conversation export for **Fundamental Intuitions of SAT** has Git blob SHA-1 0a7a270482bdda92a61d1c54ccccaf356e47aa0b. Its user message f476afce-eba0-4312-8c2b-36b82dbe7f3f is timestamped 2025-10-30 05:12:46.507598 UTC.

That direct message states two distinct hypotheses:

1. A common geometric mechanism is proposed for fermions, bosons, gravity, and time, with the same equations expected to apply across those manifestations.
2. The Prime General Prediction Pathway proposes that reciprocal tensions between past and future, not accounted for in the Standard Model, GR, or QM, may produce observable anomalies.

This is a foundational Nathan Direct hypothesis. The message does not provide a source-verifiable common action, a past/future coupling equation, an observable, a sign, magnitude, timescale, units, boundary conditions, or a measurement operator.

### Later annotation is not a direct withdrawal

The role-labelled conversation export **Annotating intuitions with math** (HsH blob SHA-1 005c93e291e7a34ee28e547a53e524ab14b05cd3) shows:

- At line 9, Nathan asks for the intuitions to be annotated directly from the Lagrangian and asks that assumptions not present in the master equation be marked.
- At lines 100-105, the assistant marks the 7th intuition with a tentative strikethrough and says the core Lagrangian does not propagate backward causality; it substitutes a limited clickrate/permeability analogy.
- At line 147, Nathan asks for the mathematical expressions to be rewritten as conversational mathematics. That follow-up does not explicitly endorse the assistant's classification of the 7th intuition.

The annotation is therefore an important source lead, but its claim about the Lagrangian is assistant-authored. It is not itself the Lagrangian and is not a direct Nathan withdrawal.

### Later archive synthesis is also derivative evidence

The archive synthesis **SAT_HISTORY_ROUNDUP.txt**, blob SHA-1 187d307853c070bb767ff034a89c7dd6fcc96df5, lines 1403-1406, says explicit retrocausality was largely dropped and that the Prime General Prediction Pathway was rejected during formalization. Its authoring and underlying source chain are not established in the inspected file. It cites the annotation above as evidence, not a recovered source-authenticated Lagrangian passage.

The current BEDROCK (blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867) and current Nathan Direct methodology/model overview dated 2026-11-08 (blob a8e333b1d5b5aa1d9772366945dd88769d24153c) contain no explicit reaffirmation of backbleed or retrocausality. A bounded exact-term search found no such terms. This absence does not prove withdrawal; it means no current re-adoption was located.

**Disposition for this candidate:**
- Source authority: NATHAN_DIRECT, historical source dated 2025-10-30.
- Claim currentness: CURRENTNESS_UNRESOLVED.
- Formalization: no source-verified current past/future coupling law recovered.
- Empirical status: NOT_TEST_READY.
- H1 admission: BLOCKED pending current source reaffirmation or source-authenticated supersession, followed by an explicit law and observable.

The next source-recovery step is to identify the exact primary Lagrangian/formalization items cited as [7]-[11] by the later synthesis, preserve their original bytes, source role, date, and hashes, and determine whether they actually remove, bound, or merely fail to instantiate pastward influence. Do not infer the answer from the assistant annotation alone.

## 3. Why this matters for prediction versus standard physics

The historical candidate's possible differentiator is reciprocal past/future tension transfer. But it is not yet a discriminating prediction.

Before selecting an experiment, a current source must specify:

1. The physical state variables and the direction of the proposed temporal coupling.
2. The constitutive equation, domain, boundary conditions, units, and free/shared parameters.
3. A concrete observable and its predicted sign, magnitude, and time dependence.
4. The instrument/measurement map and calibration model.
5. The standard comparator under the same measurement operator.
6. Which data are used for calibration/fitting and which independent realizations or events are untouched holdouts.
7. A preregistered rejection threshold derived from actual measurement uncertainty, covariance, and model discrepancy.

A candidate fails admission if it has no unique observable, if the effect is absorbed by the allowed standard/nuisance family, if the map is not identifiable on the available readout, or if a preregistered independent holdout rejects the specific prediction. No numerical threshold can be supplied before a real system and versioned dataset are selected.

No physical system, raw dataset, fit, prediction, or independent measurement was selected or performed in this run. No made-up fixture or data-free physical calculation was used.

## 4. Keep the GR-QM claim separate

The common-mechanism hypothesis, equation translation/importability, and strict GR-QM isomorphism are different claims.

The direct 2025-10-30 source supports a common-mechanism hypothesis and says established GR/QM should be importable through conceptual translation. It does not define a bijective GR-to-QM map. The later unbylined four-page **Relativistic-Quantum Isomorphism** PDF (source SHA-256 55111ee70ad1ba8e8629f41562f40ca7faf6681c92259ef677206885920d9193; extraction requested by Ravel/ChatGPT) makes a stronger mathematical claim, but its endpoints, map, inverse, and preserved structures remain uninstantiated. The current Nathan Pinpoint Signoff Docket still leaves the target proposition and intended isomorphism strength pending.

Existing Sable source-genealogy work at issue #1607 and the source-to-prediction ledger are retained. This run does not close the Sable-local GR-QM proof audit, change the signoff docket, or promote an isomorphism claim.

## 5. Formalization boundary

No new Lean theorem is justified yet. The historical prediction has no source-verified current equation or typed physical map to formalize. Existing Kestrel PR #873 and related projection/fiber work provide conditional generic results, not a GR-QM or past/future physical map. They remain draft/unmerged and do not establish the physical premises.

No Lean build was run in this turn. This is not a proof failure; the source-defined proposition and endpoint types are not yet available. Lean would check only a subsequently formalized statement, not the truth of the physical premise or the source-to-model translation.

## 6. Control-plane clarification

The P1/P2/P3 labels in the Sable README's local research dependency stack are **SABLE_LOCAL_P1/P2/P3**, not Three Paper Campaign tiers. In particular:

- SABLE_LOCAL_P1 is the Sable-local GR-QM source/proof-quality audit.
- CAMPAIGN_P1 is Orson's cognition minor-paper work and remains Orson-owned.
- CAMPAIGN_P2 is the geometry major-paper gate.
- CAMPAIGN_P3 is the full-theory paper gate.

This run changes no owner, paper gate, task graph, or campaign priority. It does not reassign Orson's work.

## 7. Preflight and boundaries

Read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival V3/V4 and thread-first rules, Sable README/BOOT/INBOX/CONTINUITY_CHECKPOINT, current main branch, current receipts, the historical Sable role-setting source, the current signoff docket, and the existing source-to-prediction ledger.

- Mersearch is not exposed as a callable action in this runtime. All four request lanes remain occupied/requested; their twelve request-scoped manifest/receipt paths returned 404. No lane was overwritten or retriggered.
- GitHub search was used only as a bounded fallback over HsH and the SAT archive. HSH_RESOURCES has an unresolved private/internal boundary; no payload content was used.
- Existing Math Hopper #578, Lean PRs #873/#1133, and Whirligig Kernel 0 were checked. SciSpace is installed but unnecessary for this source/continuity task. No new tooling, dependencies, forks, subscriptions, or costs.
- FIE was last reviewed November 10 and is next due November 24. The previous unrelated-reading break remains sufficient; next cursor remains line 2280.
- P0 Code Grurple remains ACTIVE. Campaign P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned. P2 geometry remains HOLD. P3 full theory remains INCOMPLETE.
- November 9 minor-paper gate remains missed. November 30 major and December 14 full-theory gates remain separate. No gate advanced.
- No SAT-O or Blockwave equation was copied, normalized, corrected, or modified. No BEDROCK theory promotion.

**Disposition:** The source-to-prediction workflow now has an explicit currentness/supersession admission gate. The historical Prime General Prediction Pathway is preserved as Nathan Direct history but remains CURRENTNESS_UNRESOLVED and NOT_TEST_READY until its later formal status is established from primary sources.
