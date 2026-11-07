# Morrow | SAT-O6 source variants and Mark IV.2 type audit

**Disposition:** ADDITIVE SOURCE CUSTODY / VERSION CROSSWALK / CONDITIONAL MATHEMATICAL AUDIT ONLY. NO CANONICAL ACTION SELECTED. NO PHYSICAL PREDICTION. NO THEORY PROMOTION.

This is a narrow addendum to HsH issue #1187 (Aldus SAT-O / Blockwave source-to-equation provenance) and the geometry-fidelity record #1418. It does not repeat the already-published Blockwave Clean Action equation, O9 genealogy, or B^5 arithmetic audit.

## 1. Search provenance and duplication control

The completed three-repository Mersearch request `aldus-o9-blockwave-equation-genealogy-20261031-1124` was reused as the archive search witness. Its run was #41198219023, Mersearch stable commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`, manifest blob `a21496b7ffc5852b3595c87193c942882609eb57`, compact receipt blob `b1c7a101e2fc4c988e1c7a680cd111766f480356`, and source-result SHA-256 `c1eaf2ea2df50fdb34aada4a90a9ef3206c9dbb2b104f256f3b58ccf12be62e8`.

The manifest records snapshots of:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25` at `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`;
- `Satobloc/HsH` at `e327487a8b20a56fae5f4c93a6a94b3bbfc8dedb`;
- `Satobloc/HSH_RESOURCES` at `87289c92068c134e84a70e6a2f18807247b4a36c`.

The search excludes `QUARANTINE` and `PRIOR_ART`; raw ranked result files remain withheld. Its hit count is path/name dominated and is not an independent-witness count. All four shared Mersearch request lanes remain occupied; no request was opened, overwritten, released, or retriggered.

## 2. SAT-O6: exact June 2025 TeX source

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/*SAT_O6.tex`.

- Git blob SHA-1: `19fa30ed3c0d8a85b4729c98aa11b9f73984d0b0`.
- The TeX body declares `\date{June 2025}`.
- The containing archive path is logged with a 2025-10-24 12:29 stamp; that is an archive/log path date, not the document date.
- The related document-level `SAT.O Official Directives.txt` is dated July 2025, blob `167136310cdf33ca8f986f33634692314c1a0946`. It is a directive/source document, not the O6 action itself.

The O6 TeX equation is preserved verbatim:

```tex
S_{\text{unified}} = \int d^4x \sqrt{-g(x)} \left[
    \frac{1}{2\kappa} R(x) +
    \sum_G \frac{1}{4g_G^2} \text{Tr}\left(F_{(G)}^{\mu\nu} F_{\mu\nu}^{(G)}\right)
    + \Lambda(x)
\right]
```

The same file states:
- `\kappa = 8\pi G/c^4`;
- `\Lambda(x)` is the local cosmological energy from the filament configuration;
- `g_G^{-2}(x) \sim \rho_G(x) \ell_f^2`;
- `\rho_{U(1)}=\rho_{wind}`, `\rho_{SU(2)}=\rho_{link}`, and `\rho_{SU(3)}=\rho_{triplet}`.

This is a June 2025 SAT-O6 source variant. It is not the September 2025 Blockwave Clean Action and no map between the two actions is supplied by this source.

## 3. SAT-O6 PDF extraction: separate, not silently reconciled

The extracted text file `_AUTO_EXTRACTED_TEXT/SAT_O6.txt` has Git blob `436d0a99d00ec1e266e66ca21f90b2d60f02bfbc` and identifies source-PDF SHA-256:

`496b78a9ec3e2ee16b874491d598716f614350023b5fb0331a3c129efee63bac`

The extraction was produced on 2026-09-10. The archive file index contains two `SAT_O6.pdf` copies with local last-modified times 2025-06-03 08:25:26 and 2025-06-09 19:04:06. The extraction's source hash is not mapped to either indexed copy, and the original PDF bytes/page images were not retrieved in this pass.

The extracted PDF text appears to describe a different O6 action version, with induced `G` and `Lambda`, a negative cosmological term, a negative gauge kinetic term, and an `O(R^2)` correction. Because the PDF bytes and page image were not inspected, this is an extraction-level variant report, not a verbatim equation transcription.

**Do not merge the PDF-extraction signs/terms into the June TeX equation.** A version choice requires the original PDF bytes, page-image inspection, metric-signature convention, gauge-field convention, and the source's intended treatment of `O(R^2)`.

## 4. SAT-O6 Python structure-lock sketch

`PYTHON Math Locking (SAT.O)/SAT_O6_structure_lock.py`, Git blob `c9c30b19044f18d133168009dd8baf448f4ddd7c`, defines:

```python
L_grav = (1/(2*kappa)) * R
L_gauge = (
    1/(4*g_U1**2) * (F_U1*F_U1)
    + 1/(4*g_SU2**2) * (F_SU2*F_SU2)
    + 1/(4*g_SU3**2) * (F_SU3*F_SU3)
)
L_unified = L_grav + L_gauge + Lambda
```

No reliable document date or raw author provenance was recovered for this script. It resembles the June TeX sign pattern but omits the explicit `sqrt(-g)` measure and is a symbolic structure-lock sketch, not a variational derivation or independently compiled physical model.

## 5. Mark IV.2 symbolic kernel: exact file text, separate lineage

`SAT Mark V/SAT_Symbolic_Kernel.txt`, Git blob `446c3000aaa102a11cee17225c35c3925044e524`, begins with the label **SAT Mark IV.2 — The Fully Unified Continuum Lagrangian**. It has no individual author or raw conversation provenance in the file. The archive file index reports a matching `SAT_Symbolic_Kernel.txt` entry last modified 2025-10-27 18:40:48; that is local file metadata, not a verified composition date.

The equation is preserved verbatim:

```tex
L_{SAT} =
\frac{1}{2} (\partial_\mu \theta_4)(\partial^\mu \theta_4)
- \mu^2 \cos(3\theta_4)
+ \lambda (u^\mu \partial_\mu \theta_4)^2
+ \alpha (\nabla_\mu u^\nu)(\nabla^\mu u_\nu)
+ \beta \sin^2(\theta_4) \nabla_\mu u^\mu
+ \epsilon_f \sum_\Delta
  \left(1-\delta_{\tau_i+\tau_j+\tau_k \mod 3,0}\right)
+ \frac{3}{2\pi}\int B\cup\delta A
+ \zeta\int A\cup d\theta_4
```

This file is an unattributed historical formalization candidate. It is not authenticated Nathan Direct mathematics, and it is not interchangeable with SAT-O6 or the September Blockwave attachment.

### Conditional degree/type check

The same file describes `A` through a loop integral, indicating a 1-form/1-cochain role. Under that typing, `A \cup d\theta_4` has degree 2. No 2-cycle or complementary degree-2 factor is specified for its displayed integral in a four-dimensional action. The `B \cup \delta A` term could be degree 4 if `B` is a 2-cochain and `A` a 1-cochain, but those cochain types and the integration pairing are not explicitly declared in this file.

This is a formalization gap, not a corrected action. Keep the source expression intact until its domains, degrees, measures, and pairing are specified.

## 6. Derivative Blockwave archive files and missing core

The following similarly named files are source-navigation or synthesis artifacts, not independent primary equation witnesses:

- `SATOBLOC/SATOBLOCK-LIVE.txt`: Git blob `1642375cf78647b9f35f1681d0bccb90685b2a48`, 285,648 characters / 10,592 lines. It is a NotebookLM "49 sources" synthesis. The archive file index reports local last-modified time 2025-10-25 12:57:32; its first located Git ingestion is commit `f5cbe9aba986b39ace86c55a7bea53feb854445f` at 2025-10-28T00:04:17Z.
- `SATOBLOC/SATO-BLOCK-INT.txt`: Git blob `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e`, 160,288 characters / 13,688 lines. It is a NotebookLM conversation/transcript, not a primary action. The archive file index reports local last-modified time 2025-10-25 09:53:31; its first located Git ingestion is the same 2025-10-28T00:04:17Z commit.
- `SATOBLOC/SATOBLOCK_LIVE_DEV.txt`: Git blob `8dd6064b1e59c89b2e6596382cf3293904e8418e`, 285,809 characters / 10,299 lines; derivative source guide.
- `SATOBLOC/SATOBLOCK_inputs.txt`: Git blob `ee08d8a6f5f187847914442f5971c7e2ed8cecd7`, 25,619 characters / 525 lines; derivative input/field summary.
- `SATOBLOC/SATO-BLOCK CORE.txt`: Git blob `e69de29bb2d1d6434b8b29ae775ad8c2e48c5391`, the canonical empty Git blob. The archive file index reports local last-modified time 2025-10-25 15:43:56. The repository copy contains no core equation text.

The NotebookLM documents can help locate source families, but their summaries and repeated passages must not be counted as independent witnesses. The empty core file is a real source-custody gap in the current Git copy.

## 7. Blockwave Clean Action: reuse the existing primary-source record

The September 16, 2025 user-supplied attachment is already preserved verbatim in issue #1187:

- HsH path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`;
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`;
- attachment SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`;
- first extant Git commit at that path, per issue #1418: 2026-10-08T02:42:49Z.

The outer upload is user-supplied, but the embedded document's individual author is unresolved. Issue #1187 contains the exact equation block, including its malformed index spellings. This addendum intentionally does not repeat it or relabel it Nathan Direct.

The Blockwave attachment's `A_mu = alpha_* nabla_mu theta` and `F_munu = nabla_[mu A_nu]` imply `F=0` locally when `theta` is smooth and single-valued and `alpha_*` is constant. Nontrivial holonomy therefore needs specified bundle, defect, or global data. Issue #1187 already records that conditional result and the distinct J2/J3 support issue; no new physical claim is made here.

## 8. Existing Lean status: no new proof claim

Existing PR #1235, `Blockwave exact-phase curvature gate`, is open/draft/unmerged at head `3f8e1610e52ac81908671f54a66900b501ce06a5`. Its successful Actions run #41368901975 checked out a merge ref and built 8,944 existing targets, but the new `MercerBlockwaveExactPhaseCurvature.lean` module was not imported into the root build. Therefore that run does **not** verify the new theorem. No code was changed and no new Lean run was triggered.

The existing Morrow chronology module in PR #719 did build in merge-ref Actions run #41017252970. That verifies its encoded archival chronology propositions only; it is not a Blockwave proof or a physical validation.

## 9. Existing arithmetic correction not repeated

The `SCALING.txt` B-fifth-power arithmetic has already been corrected and published in the Ariadne, Kestrel, Ravel, Aldus, and Orson audit trail (including HsH issues #375, #478, #517, #560, and #342). This addendum does not repeat the calculation or create a duplicate. Those reports distinguish arithmetic correction from physical derivation and do not authorize a fitted value as a prediction.

## 10. Source-faithful disposition

1. SAT-O6 June 2025 TeX, SAT-O6 PDF extraction, SAT-O6 Python sketch, Mark IV.2 kernel, September Blockwave Clean Action, and October O9 mass-spectrum formula are distinct source/version families.
2. The September Blockwave attachment remains user-supplied with unresolved embedded authorship; the O9 quadratic mass formula's first recovered introduction is assistant-role, as recorded in #1187.
3. No single canonical SAT-O/Blockwave action is established by this source set.
4. No source-authorized corrected action is issued. Preserve the original equations and keep any future corrections in separately versioned files.
5. No measured system, dataset, units, uncertainties, CODATA comparison, physical calculation, fit, or prediction was used in this addendum.
6. No BEDROCK change, theory promotion, paper-gate change, branch change, task change, or Mersearch lane mutation was made.
