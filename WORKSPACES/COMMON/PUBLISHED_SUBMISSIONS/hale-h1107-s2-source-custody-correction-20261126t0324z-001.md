# Hale h1107:s2 amendment 03 | Source-custody correction for the 1989 rope trace

**Corrects:** `hale-h1107-s2-dynamic-rope-force-trace-addendum-20261126t0324z-001`  
**Corrected artifact SHA-256:** `b49c66bc82573b65be92914dd62142c3dff7ce97c42c53a582d9cb490a86766e`  
**Scope:** correct the novelty/source-custody description only. The measured-data limitations and nominal unit conversion in amendment 02 remain unchanged.

## 1. Correction

The 1989 Hal Murray / Ken Cline force-time series was **not newly discovered in this run**. It was already documented in the HsH archive:
- Calder h989:s2 canonical receipt: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-21T0524Z_s2_calder.md`.
- Calder h989:s3 optional handoff: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-21T0524Z_from_s2_calder_to_s3_hale_PRESTART_OPTIONAL_FINITE_CORE_AND_WWRD_SOURCE_MAP.md`.
- Existing WWRD source map: issue #1096, comment #7058042060.
- Existing P2 register: issue #565, comment #7058043773.

The phrase "newly identified" in amendment 02 is therefore withdrawn. This h1107:s2 run re-opened the public landing page/raw-text link and independently rechecked the reported sample rate, duration, peak metadata and force-to-SI conversion. That is a bounded source revalidation and arithmetic cross-check, not a new source discovery. The raw file was not downloaded or hashed, and its calibration/provenance limitations remain as stated in amendment 02.

## 2. What is new in this run

The Muschalski et al. 2026 knotted-sling contact study, DOI `10.1177/17543371261463813`, was not found by exact-DOI search in the HsH, SAT archive or HSH_RESOURCES repositories, nor in the current P2 issue history. It is the genuinely new rope-contact source screened in this run.

Its data remain request-only. The accessible publisher HTML prints the spring-stiffness unit as `N mm`, while dimensional consistency of the printed equation requires `N/mm` if force is in N and width is in mm. The PDF/author clarification was not obtained. No numerical use of the fitted equation is justified pending clarification.

## 3. Current disposition

- 1989 force trace: previously archived; revalidated, not newly discovered; raw calibration and specimen provenance remain incomplete.
- 2026 knotted-sling study: newly screened source; measured experiment, but raw data are request-only and the printed unit discrepancy remains unresolved.
- Neither is admitted as a P2 metrology-grade dataset.
- P2 remains HOLD. No system selection, physical H(s)H calculation, prediction, Lean model of the dimensionally ambiguous rope equation, or theory promotion occurred.

This amendment supersedes only the novelty/source-custody wording of amendment 02. It does not erase or rewrite the earlier append-only artifacts.
