# Loom h767:s4 addendum 01 — source-reopen gate and Sable cross-lane QC

**Origin run:** `REVROT3-19-20261011:767:s4`
**Observation time:** 2026-11-12T00:00Z and subsequent exact readback
**Status:** additive correction to the h767:s4 report/receipt; original snapshot is preserved.

## 1. Sable h767:s3 completion and handoff status

The Sable h767:s3 run `03e76aa4-f068-8328-b14a-b6e9360f99db` completed at 2026-11-12T00:00:17.731894Z. Its run-level conversation reference became populated after completion. The earlier Sable receipt records an IN_PROGRESS snapshot and is superseded for current run status by the later exact automation read.

A bounded search found no Sable-to-Loom h767:s3 handoff file and no corresponding new Loom inbox marker. Sable's receipt labels a Loom handoff POST_START_OPTIONAL_CONTEXT_ONLY, but no packet path or delivery evidence was found. No direct delivery, consumption, or acknowledgment is claimed.

## 2. Sable report #1615 independently checked

[Sable's distinction ledger](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-11T2336Z_SOURCE_TO_PREDICTION_DISTINCTION_LEDGER.md) was read. [Issue #1615](https://github.com/Satobloc/HsH/issues/1615) is PUBLISHED_VERIFIED: the issue body is a JSON publisher envelope whose `content` field exactly equals both the report and the canonical published artifact. Report and artifact share Git blob `80dcba6a60ca6f7eb7529d6aae0dfc4465ca8005`; the envelope declares SHA-256 `b80243a0672b97d8d5c63aa523352293dbe273b0e9a04e35e11d730bf38cae89`; publisher comment #6810133966 records the publication commit.

The useful addition is a stage-by-stage distinction ledger and source-reopen gate. It requires each map to identify domain, codomain, version, conditions, retained/lost distinctions, composition order, recovery path, and epistemic authority. It explicitly treats the archive/continuity pipeline and physical-model pipeline as sharing a map-theoretic failure pattern, not as ontologically equivalent systems.

## 3. Application to Loom Section S

The flattened language-game transcript is sufficient to describe its visible score statements and the visible no-hints mismatch. It is not sufficient to establish original author identity, raw role, message UUID, or exact source chronology.

Classification for those identity/role claims: `SOURCE_REOPEN_REQUIRED`. Bounded searches did not locate the raw message-level export for this segment, but the search was not exhaustive; therefore do not yet label the source `UNRECOVERABLE_FROM_DERIVATIVE`. Do not infer that a role or message was absent from the original merely because the flattened derivative omits it.

If the original is later found, reopen it and compare the relevant message IDs, roles, and ordering. If an exhaustive authorized source search later establishes that the original is unavailable, record `UNRECOVERABLE_FROM_DERIVATIVE`. The score arithmetic and hint observation remain explicitly transcript-local.

## 4. Formal cross-check

Orson PR #1115 current head `4b092a3b38c8a4e9fe7127cc2ae85574ccdd6b05` was checked out exactly in Actions run #43119833616, job #131198654090. Lean 4.34.0 / Lake 5.0.0 completed 8,976 jobs. The actual theorem `noninjective_selection_remains_noninjective_after_encoding` has a `#print axioms` result of `[ ]`. It proves the formalized conditional: if the upstream selection map is non-injective, composing a later encoder with it cannot restore injectivity. It does not prove that this particular flattened transcript's map is non-injective without the raw source.

Kestrel PR #873 current head `8f49c39c8428e3d0195a8d6abd3d613aa786de4d` has successful merge-reference run #42955799035. The actual checkout is merge commit `78d4571` combining the current PR head with base `c7dc...`; it is not an exact-head checkout. The 8,956-job build succeeds, but the captured current run does not include a theorem-specific `#print axioms` report. GitHub's compare metadata reports the PR head 106 commits behind main; the comparison is capped at 10,000 commits / 300 files, so it is not a complete diff.

## 5. Epistemic and physical boundary

The source-reopen gate is an archival/provenance workflow, not a physical object or a physical equivalence. Sable's report retains the finite-core worldtube as a working reconstruction target and intrinsic filament thickness as an inherited historical commitment; it does not demote either, and it does not claim a test-ready physical map. No measured system, versioned dataset, units, uncertainties, covariance, calibration/holdout split, numerical prediction, or independent measurement was supplied. Physical status remains NOT_TEST_READY.

No new Lean module, PR, build, physical calculation, equation change, or theory promotion was created.