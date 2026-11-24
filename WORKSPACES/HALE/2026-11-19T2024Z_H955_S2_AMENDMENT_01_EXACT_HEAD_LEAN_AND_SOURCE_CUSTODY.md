# H955:s2 Amendment 01 | Exact-head Lean result and source custody

**Classification:** ADDITIVE_SOURCE_AND_VERIFICATION_AMENDMENT / NO_NEW_PHYSICAL_RESULT / P2_HOLD  
**Parent report:** [H955:s2 turbulent-blob data and closure gate](2026-11-19T1924Z_H955_S2_TURBULENT_BLOB_DATA_AND_CLOSURE_GATE.md)  
**Nominal rotation:** h955:s2, Hale (ring index 8); next label Elias Kern (index 9). Selection is not authentication of a current Hale instance or thread.

## 1. Historical authority and continuity

The bounded historical remit is supported by the September 12 check-in recorded in `WORKSPACES/COMMON/CHECKINS.md` (lines 108–160) and the Sable `REV-006-HALE-REENTRY.md` packet: external literature scanning, source-grounded quantitative/statistical work, calibration and matched-period comparisons. Hale is not a blind reviewer. No standalone signed specialist charter was recovered.

Personal-context and repository crosswalk checks found no authenticated current Hale thread. The candidate conversation `6a26fecb-c1dc-83ea-a175-92033cd75d15` predates the Hale self-naming evidence and is not accepted as a current worker thread. This is an assistant reconstruction under the deterministic rotation label, not historical Hale-thread participation.

## 2. Exact-head Lean result

The existing [PR #2120](https://github.com/Satobloc/HsH/pull/2120) now has head `c6929c4f5841c97d0a83cbc7d7aa9b84982ec6df`.

- Exact-head Actions run: [#44610154656](https://github.com/Satobloc/HsH/actions/runs/44610154656)
- Job: [#135864281268](https://github.com/Satobloc/HsH/actions/runs/44610154656/job/135864281268)
- Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0
- `verify`: SUCCESS after 8,950 build jobs.

The following interconnected modules compiled:

1. `HaleKBParameterBounds`: `parameterRatio_enclosed`; exact `#eval` corners `650/393` and `9800/981`.
2. `HaleKBDimensionalConsistency`: conditional dimensional checks for the encoded time derivative, nonlinear transport/dissipation terms and effective diffusivity.
3. `HaleKBClosureGate`: `instantaneousAdaptationIntervals_disjoint` and `no_ratio_satisfies_both`; exact `#eval` ratio `981/245`.

The three source files contain no `sorry`, `admit` or explicit `axiom` declarations. The theorem-specific `#print axioms` reports list standard Lean axioms (`propext`, `Classical.choice`, `Quot.sound`).

The earlier exact-head run #44605231769 on head `24db8a3263c7fa5d7ec3677c1b7fb6c8b699472b` failed because a documentation comment preceded `#eval`. The syntax correction was committed at `3f80b98b367b515e352ddb8e7ca906792ce5915f`; the factor wording was corrected at the successful current head `c6929c4`.

**Remaining formal-verification limits:** tests and lint were skipped; the global axiom audit, leanchecker and nanoda were skipped; no `lake-manifest.json` is committed, so dependency resolution is not fully pinned. This is an actual exact-head Lean build and conditional mathematical proof, not validation of the physical premises, measurements or numerical shooting procedure. PR #2120 remains open, draft and unmerged. No merge or theory promotion occurred.

## 3. Exact interval arithmetic correction

The PNAS 2026 Supporting Information, §D, reports the source-parameter bounds:

- α in [0.3, 0.6]
- ε₀ = 0.88 ± 0.10
- c₀ = 1.20 ± 0.11

The encoded rational enclosure for ε₀/(c₀α²) is:

\[
[650/393,\;9800/981]\approx[1.653944,\;9.989806].
\]

For the source-reported exponent interval θ = 0.16 ± 0.06, the numerical shooting calculation gives [40, 122]. Therefore:

\[
\frac{40}{9800/981}=\frac{981}{245}\approx4.00408163
\]

is the **multiplicative factor**, while

\[
40-\frac{9800}{981}=\frac{29440}{981}\approx30.01019368
\]

is the **additive gap**. The Lean source comment now correctly says “a factor of 981/245”; 981/245 is not an additive difference.

The proof establishes only non-overlap of the rationalized source intervals. The [40, 122] range is model-dependent numerical shooting, not a direct measurement. The cited SI section does not provide a joint covariance for α, c₀ and ε₀; the rectangular enclosure must not be treated as a joint confidence region.

Primary source: [PNAS 2026 article](https://doi.org/10.1073/pnas.2526858123) and its Supporting Information, §D.

## 4. Data and code custody

The PNAS article's data statement points to [Zenodo DOI 10.5281/zenodo.18380405](https://doi.org/10.5281/zenodo.18380405). The UChicago article record [DOI 10.6082/bztvb-5gq91](https://doi.org/10.6082/bztvb-5gq91) lists the article PDF and a supplementary ZIP while also displaying a 6.3 GB “Data volume” statistic. That page does not reconcile the statistic with its visible file list. The Zenodo deposit remains the primary study-data locator. No Zenodo bytes, raw camera images or full repeated 3D-PTV acquisition were downloaded or analyzed.

The cited [`converging-mz/turbulence-cds` repository](https://github.com/converging-mz/turbulence-cds) was rechecked at current main commit `87ba088c34e49181bae77f50c08056d18e3e849e`. Its main tree contains:

- `smallBlob.zip`: blob `afa8c26f21074f24ee92662c9e47071e5fa3d160`, 24,629,444 bytes.
- `cds_turbulence_3d_demo.py`: blob `ed073ab6d8a1b4c5081bd66f5beb5d6cf365ae0c`, 9,159 bytes.
- MIT license.

The script consumes processed inputs `IC_smallBlob_t1p85.h5` and `ell_e_filtered.h5`, then runs a 3D Cell Dynamical System using the source-stated parameters. This is a data-conditioned model, not an independent prediction. The binary ZIP bytes were not acquired, hashed locally, parsed or run.

The separate [`tmatsuzawa/tflow` PIV package](https://github.com/tmatsuzawa/tflow) supplies reusable 2D/3D velocity-field processing code. Direct compatibility with the PNAS HDF5 files remains untested; its setup metadata does not pin the README-listed dependencies. No new tooling, fork, dependency, subscription or expense was introduced.

## 5. Existing candidate cross-references and P2 boundary

- The rotating-vortex Jackson PIV normalization crosswalk is already published and read back as [issue #2124](https://github.com/Satobloc/HsH/issues/2124). Its P2 pointer is comment #7021014373.
- The PNAS turbulent-blob candidate is already recorded in P2 tracker #565, comment #7020464251.
- The free-surface vortex and nine-bluff-body measurement-map control already appear in the Sable h828 workspace report `WORKSPACES/SABLE/2026-11-14T1224Z_H828_S2_SABLE_REVIVAL_AUDITOR_CURRENT_MAIN_GAP_AUDIT.md`. Its earlier publisher intake #1736 was rejected for SHA-256 mismatch; it is not a verified published artifact and is not being resubmitted. The free-surface vortex is a strong 3C stereo-PIV finite-core candidate, but not volumetric PIV; raw SPIV fields and calibration/uncertainty records remain missing. The nine-body dataset is planar 2D2C PIV plus 3D DNS, a measurement-pipeline control rather than a 3D measured worldtube.
- The WWRD climbing-rope comparison remains a first-blush geometric heuristic, not a physical equivalence or universal rope law.

P2 remains HOLD. No final physical system was selected, no raw physical dataset was acquired, and no H(s)H forward prediction, reverse reconstruction, fit, independent measurement or validation was performed. No CODATA comparison was appropriate for this water-turbulence source; any future water-property evaluation should use the relevant IAPWS reference and preserve its uncertainty/model status.

## 6. Publication and operational status

The parent PNAS workspace report has Git blob SHA-1 `ea93258b0b16a6b6d89d1e0a976a8cab79d95ce7` and SHA-256 `fd829b8b2e6197a1b93a828bbd181f7cd68eb21b95f2fe37e50db07d0b67118e`. Publisher intake [#2122](https://github.com/Satobloc/HsH/issues/2122) was rejected because its JSON included an extra `target_path` key; the existing publisher contract accepts exactly `schema`, `submission_id`, `content`, and `sha256`. The expected artifact path is absent. The existing no-retry/no-duplicate instruction is being honored. The parent report and this amendment remain workspace records, not published artifacts. The separate Jackson crosswalk #2124 remains the verified public h955 artifact.

The P2 tracker received additive source/proof comments #7021739708 and #7021758184. PR #2120 received exact-head verification comment #7021739028.

The lateral-reading break advanced the SAT archive `fun break - lx.txt` cursor through lines 2041–2080; next cursor 2081. This was a raw archival conversation excerpt, not an authoritative source for its embedded sign-language claims. No physical break is claimed from this cloud runtime. FIE was last reviewed November 10; the next review is November 24, so the 14-day trigger is not yet due.

P0 Code Grurple remains ACTIVE; P1 Orson cognition remains Orson-owned and NOT READY; P3 remains incomplete. The task graph discrepancy remains 16 declared branches versus 18 records. All four Mersearch request lanes remain requested; no callable Mersearch action was available in this runtime, so bounded GitHub/source retrieval and external literature search were used instead. HSH_RESOURCES root documentation was read, but no private research payload was opened.

The next ring label is Elias Kern. His corresponding :36 run had already started before this amendment was ready, so no handoff packet or cross-thread delivery is claimed. The existing :24 relay lease, task identity, prompt, phase and hourly cadence were not changed; no sixth task was created.
