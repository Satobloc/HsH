# Elias Kern h1130:s2 — Lane 24 measured-system routing transfer test

**Run key:** `REVROT3-19-20261011:1130:s2`  
**Selected label:** Elias Kern (ring index 9); next Nadir Voss (ring index 10)  
**Classification:** `SOURCE_DERIVED_TRANSFER_TEST / NOT_REPRESENTED / NO_POC_CHANGE / NO_PRODUCTION_AUTHORITY`

## 1. Scope and authority

This is a source-grounded assistant reconstruction, not an authenticated historical Elias instance or conversation. The recovered Nathan instruction in the Elias inbox (2026-09-24 13:47 ET) assigns Track A prototype operation/documentation: exercise one bounded real-work mechanism, record observed rather than intended behavior, and do not treat the prototype as production authority. No separately signed Elias specialist charter or authenticated current Elias thread was recovered.

The current independent Track B `ELIAS-2224` EvidenceLedger/subject-scope disposition remains pending. Sable/Tern retain that authority. This report requests no disposition, review, response, task, or ownership transfer.

## 2. Real-system transfer case

Hale's existing public source audit identifies the 2015-11-17 four-spacecraft MMS subsolar-magnetopause flux-rope crossing as an additional measured-system candidate (HsH issue [#2637](https://github.com/Satobloc/HsH/issues/2637)). That audit did not retrieve raw CDF bytes, the complete four-spacecraft product manifest, event-specific calibration/covariance, or an independent holdout. No physical calculation or numerical reanalysis is attempted here.

For a bounded workflow test, the acquisition needs were represented by analyst-defined event tags:

`measurement`, `external_evidence`, `calibration`, `covariance`, `uncertainty`, `instrument`.

These are test labels, not fields defined by the MMS papers or the prototype.

## 3. Observed prototype routing

The existing sandbox switchboard is a deterministic planner/state transformer, not a scheduler or production workflow. Its source-routing method maps a limited vocabulary of event tags to source families; its branch planner separately maps tags to work branches.

A source-derived method-level replay gave:

| Input tags | Source routes | Work branches |
|---|---|---|
| Measurement, external evidence, calibration, covariance, uncertainty, instrument | none | none |
| Same tags plus `provenance` | `archive` | `provenance_prior_art` |

The second row is only a generic provenance/prior-art route. It does not create a route for raw instrument data, calibration records, uncertainty/covariance, product-version manifests, or holdout management.

**Disposition:** `NOT_REPRESENTED`, not a demonstrated runtime failure. The prototype is explicitly sandboxed and does not claim to be a complete scientific-data intake system.

## 4. Existing formal contract

The public draft PR [#951](https://github.com/Satobloc/HsH/pull/951) contains `EliasRouteBudgetCoverage.lean` (PR-head blob `fd361b30a4b205a992755a4fbd7b5b461e49636c`). Its abstract `Route` type includes `externalEvidence`; `p2MeasuredSystemPlan` marks that route as required but unrepresented, and `p2_blocked_by_unrepresented_external_evidence` states that the plan is not complete for one wave.

The module was replayed in Lean 4.34.0 / Lake 5.0.0 during Actions run [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405), job `129302583788` (8,961 build jobs, SUCCESS). The job checked out merge commit `5df7c1600d4e9f93885d8a7b8d13e8d16a4041`, which merged PR head `f9fa0aad45408ab06e5430c834530854746235f0` into its base. This is a merge-reference build, not a standalone exact-head build. The log prints an axiom report for `required_route_has_exactly_one_disposition` (`propext`, `Classical.choice`, `Quot.sound`), but does not print a theorem-specific axiom report for `p2_blocked_by_unrepresented_external_evidence`.

The formal module explicitly describes itself as an abstract allocation contract, not a translation of the Python prototype. Lean compilation checks those formalized propositions only; it does not establish source-to-model equivalence, validate the MMS data, or prove any physical premise. No new Lean theorem or build was made in this run.

## 5. Practical consequence and boundary

For Lane 24 measured-system work, a future reviewed workflow would need an explicit external-evidence intake and separate, versioned identities for at least: raw instrument products, calibration/quality metadata, timing/coordinate registration, covariance and uncertainty, and the predeclared holdout. Required items must be selected, explicitly deferred, or explicitly unrepresented; a generic `archive` route is not equivalent to a complete measurement chain.

This is a design proposal only. No POC, PR #951, adapter, production workflow, task graph, scheduler, manuscript, or theory was changed. P2 remains HOLD; the MMS event is not selected as the P2 system. No CODATA comparison, physical calculation, fit, prediction, or observational validation occurred.

**Return cursor:** preserve the existing Track A prototype and PR #951 unchanged; await the independent Track B disposition before any POC/PR change. If that gate later permits a change, test a typed external-evidence route against the MMS acquisition checklist without promoting the prototype to production.