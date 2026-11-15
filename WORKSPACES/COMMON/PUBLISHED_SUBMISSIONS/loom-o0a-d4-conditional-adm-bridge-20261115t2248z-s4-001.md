# O0-A Mode 2 / D4: source-hash correction and conditional extrinsic-curvature bridge

**Date:** 2026-11-15  
**Scope:** source provenance, terminology, and conditional standard-geometry crosswalk  
**Status:** SOURCE_CORRECTION_VERIFIED / CONDITIONAL_MAP_IDENTIFIED / SOURCE_SPECIFIC_MAP_NOT_ESTABLISHED / NO_THEORY_PROMOTION

## Executive result

Two bounded findings advance the earlier O0-A/D4 source-fidelity work.

1. The h840 source-fidelity report assigned the Fundamental Intuitions — Extended (FIE) PDF hash to the June 2025 SAT Big Paper. The SAT Big Paper extraction records a different hash. The existing Loom source-tagging ledger already had the correct distinction; this addendum corrects the report-level citation only.
2. Under standard 3+1 geometry, the tangential projection of D4's symmetrized normal derivative is twice the extrinsic-curvature tensor, with a sign fixed by convention. This supplies a **conditional candidate map** from D4's \(S_{\mu\nu}\) to a pointwise \(K\). It does not define O0-A's average \(\langle K\rangle\), identify it with spacetime Ricci curvature, or establish a SAT physical mechanism.

No original SAT/O0-A/D4 equation was overwritten. No physical calculation, data-free numerical fixture, simulation, fit, prediction, or independent measurement was performed.

## 1. Source-hash correction

The h840 report, [O0-A Mode 2 / D4 curvature bridge source-fidelity report](2026-11-15T0000Z_H840_S0_O0A_MODE2_CURVATURE_BRIDGE_SOURCE_FIDELITY.md), contains this source-table error:

- It labels `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9` as the June 2025 SAT Big Paper PDF SHA-256.
- That value belongs to **THE FUNDAMENTAL INTUITIONS — EXTENDED.pdf**, not SAT BIG PAPER.pdf.

The archive extraction headers distinguish the files:

| Source | PDF SHA-256 recorded by extraction | Extracted-text Git blob |
|---|---|---|
| `SAT_THEORY_ARCHIVE_2023-25/✅SAT BIG PAPER.pdf` | `77eb9e652c45650e29cd08be1a86198f05572573b452d170ce274e53bfde9f93` | `69b0085c86f6c4876aacc0556243dd2fccdc0aef` |
| `SAT_THEORY_ARCHIVE_2023-25/THE FUNDAMENTAL INTUITIONS — EXTENDED.pdf` | `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9` | `9b94093053f28be8bf64ee227d3382d2296f63ea` |

The Big Paper extraction header identifies a 171-page PDF, extracted with PyMuPDF on 2026-09-10. The O0-A material is on extracted pages 11–12. The PDF bytes were not retrieved in this run, so `77eb…` is reported as the archive's extraction-recorded source hash, not as a fresh binary re-hash.

The erroneous h840 value is exactly the FIE PDF's extraction-recorded hash. The existing Loom source-tagging ledger already records `77eb…` for SAT BIG PAPER and `d13d…` for FIE. The correction is therefore to the h840 report's source row, not to either original source or the ledger's original source identities.

## 2. Dated O0-A / SAT4D source distinctions

### June 2025 O0-A source

The bylined SAT Big Paper describes:

- Mode 1, “True Block”.
- Mode 2, “Triggered Dynamics”.
- Mode 3, “Crystallisation”.

Mode 2 says that \(\Sigma_t\) remains leading while its passage can nudge local filament parameters so the emerging 3-geometry matches Einstein curvature to first order. It “pegs” \(\langle K\rangle\) to GR and back-solves minimal filament tweaks. It is introduced in Module 6 and affects Modules 7–8; the page-12 module guide says leading Module 8 predictions use Mode 2.

The source does not define the tensor/scalar type of \(K\), the averaging domain or measure in \(\langle K\rangle\), the target slice, or the map by which filament changes are back-solved.

### Derivative TeX

`SAT 4D Theory Work/Module_0A_interpretive_modes.tex` has Git blob `2238dbe4447276b60e53f202153527585e16e5c5`. Its `\author{}` and `\date{}` fields are empty. The SAT archive file index records a local source creation time of 2025-06-20 09:15:52 and a copied-file time of 2025-10-27 20:17:20. It is a useful derivative text, not a separately authenticated byline or independent witness. The earlier h840 report's 2026-09-04 “archive ingestion” wording is not corroborated by this file-index record and is not used here as an authorship date.

### July 2025 SAT4D deployment guide

`SAT 4D Theory Work/SAT4D_8.txt`, blob `6a1ef773c40f805aace5fd61e3584ba50c21241d`, names its author as “SATO.4D Coherence Project” and its date as July 2025. It calls Mode 2 “Semi-Dynamic Block” and restricts it to non-core derivations or simulations. It calls Mode 3 “Solidification Front” and prohibits it in falsifiability-grounded SAT.O modules.

This is a later, distinct deployment-guidance artifact. The archive does not state in the inspected text that it formally supersedes the June O0-A module. Preserve the difference rather than silently harmonizing the names or usage rules.

## 3. D4 original equations retained verbatim

The dedicated historical file `SAT O Derivations/SAT_D4_STRAIN_CURVATURE_MAPPING.txt` has blob `d07d6cf34498a9b81e685724a523384e71a7fd61`. The file index records local source creation on 2025-06-11 06:34:14 and a copied-file time of 2025-10-27 20:17:22.

The separate composite `SAT O Derivations/CODE-LOCKED DERIVS.txt` has blob `783b05d39d59bf854b92090e15d205e6823b51c8`; the file index records local source creation on 2025-06-11 09:38:58 and a copied-file time of 2025-10-27 20:17:22. The D4 sections in these two files contain the same four core strain, ensemble-metric, connection-variation, and Ricci-variation equation strings. Their file blobs differ, so they are two archival artifacts with shared equation content, not two independent source witnesses.

The historical D4 statements remain:

```tex
S_{\mu\nu}(x)=\nabla_\mu u_\nu(x)+\nabla_\nu u_\mu(x).
```

```tex
\widetilde g_{\mu\nu}(x)=\langle v_\mu v_\nu\rangle_F(x),
\qquad
g_{\mu\nu}=(\widetilde g_{\mu\nu})^{-1}.
```

```tex
\delta\Gamma^\lambda{}_{\mu\nu}
=\frac12 g^{\lambda\rho}
(\nabla_\mu S_{\rho\nu}+\nabla_\nu S_{\rho\mu}-\nabla_\rho S_{\mu\nu}).
```

```tex
\delta R^\rho{}_{\sigma\mu\nu}
=\nabla_\mu\delta\Gamma^\rho{}_{\nu\sigma}
-\nabla_\nu\delta\Gamma^\rho{}_{\mu\sigma}.
```

```tex
\delta R_{\mu\nu}
=\nabla^\rho\nabla_{(\mu}S_{\nu)\rho}
-\frac12\nabla_\mu\nabla_\nu S^\rho{}_\rho
-\frac12 g_{\mu\nu}\nabla^2 S^\rho{}_\rho.
```

The original final Ricci expression is preserved as historical source. It is not silently replaced by a corrected equation.

## 4. Conditional standard-geometry bridge: projected strain to extrinsic curvature

D4 describes \(u^\mu\) as a unit normal to \(\Sigma_t\). If, and only if, this is the unit timelike normal to the **same smooth spacelike foliation** intended by O0-A, use the induced spatial metric \(\gamma_{ij}\), its tangential projector, and the same ambient Levi-Civita connection.

With the Gourgoulhon/ADM sign convention

\[
K_{ij}=-\gamma_i{}^\mu\gamma_j{}^\nu\nabla_\mu u_\nu,
\]

and the D4 definition

\[
S_{\mu\nu}=2\nabla_{(\mu}u_{\nu)},
\]

the tangential projection gives

\[
\gamma_i{}^\mu\gamma_j{}^\nu S_{\mu\nu}
=\mathcal L_u\gamma_{ij}
=-2K_{ij}.
\]

Consequently, if O0-A's \(K\) means the trace of this extrinsic-curvature tensor,

\[
K=\gamma^{ij}K_{ij}
=-\frac12\gamma^{ij}
\gamma_i{}^\mu\gamma_j{}^\nu S_{\mu\nu}.
\]

An opposite sign convention for \(K_{ij}\) reverses the sign. The unprojected four-dimensional \(S_{\mu\nu}\) also contains normal-acceleration components; it is the tangential projection that yields \(K_{ij}\).

**Standard reference:** Éric Gourgoulhon, *3+1 Formalism and Bases of Numerical Relativity* (2007), arXiv:gr-qc/0703035, especially the foliation-kinematics relations \(\mathcal L_n\gamma=-2K\) and \(K=-\tfrac12\mathcal L_n\gamma\) under that convention: https://arxiv.org/abs/gr-qc/0703035 and https://luth.obspm.fr/IHP06/lectures/gourgoulhon/lectures_eg.pdf.

This makes O0-A's \(\langle K\rangle\) a plausible average of the projected strain trace, **not an established identification**. The source still must specify whether the brackets mean a spatial average, a filament-ensemble average, a temporal average, or something else, together with its domain, measure, normalization, and units.

The Gauss and Codazzi equations relate intrinsic slice curvature and derivatives of \(K_{ij}\) to tangential and mixed projections of ambient Riemann curvature. They do not equate \(K\) directly with the four-dimensional Ricci tensor. Normal evolution and the chosen foliation remain necessary. This is the missing intermediate map, not a completed O0-A-to-D4 curvature derivation.

## 5. Gauge and dimensional caveats

For a Levi-Civita connection,

\[
S_{\mu\nu}=\mathcal L_u g_{\mu\nu}.
\]

If \(\delta g_{\mu\nu}=\alpha S_{\mu\nu}\) with constant \(\alpha\), and \(u\) is only a diffeomorphism generator, this is a pure-gauge metric perturbation generated by \(\alpha u\). On a flat background its linearized curvature response is zero. A variable scale, an independently physical normal field, a nontrivial projection, or additional constitutive structure changes the question and must be specified explicitly. D4 does not supply those distinctions.

With dimensionless metric and normal components and length-valued coordinates, \(S\) has dimension \(L^{-1}\), while \(\delta g\) is dimensionless. The proportionality in \(\delta g\sim S\) therefore requires a declared length scale or a different dimensional convention.

The ensemble expression \(\widetilde g_{\mu\nu}=\langle v_\mu v_\nu\rangle_F\) also needs a declared measure and full-rank hypothesis before inversion. For real covectors under a nonnegative ensemble measure, this outer-product average is positive semidefinite; Lorentzian signature does not follow from the displayed average alone.

## 6. D4 Ricci correction remains separate

Nadir's already-published EQ-0007 artifact, [HsH issue #319](https://github.com/Satobloc/HsH/issues/319), records a correction to the flat-background linearized-Ricci component. For a metric perturbation \(h_{\mu\nu}=\delta g_{\mu\nu}\) on a flat background, the standard expression is

\[
\delta R_{\mu\nu}
=\frac12\left(
\partial^\rho\partial_\mu h_{\nu\rho}
+\partial^\rho\partial_\nu h_{\mu\rho}
-\Box h_{\mu\nu}
-\partial_\mu\partial_\nu h
\right),
\qquad h=\eta^{\rho\sigma}h_{\rho\sigma}.
\]

The tensor-Laplacian term is \(-\tfrac12\Box h_{\mu\nu}\), not \(-\tfrac12 g_{\mu\nu}\Box h\). This flat-background correction does not specify the curved-background commutator terms or establish D4's proposed curvature source.

### Existing Lean evidence and its actual scope

`ArchiveEQ0007.lean` is present on the open draft verification PR #262 branch, not on current HsH main. Its file blob is `032a5edc33c6463b2ce0bf0f84eb2959c2889777`. It contains four small propositions: a scalar coefficient identity, a nonzero-coefficient disagreement, a singular-limit identity, and an integer length-exponent mismatch. It does **not** formalize the full tensor differential operator, the metric variation, the hypersurface projection, or the conditional ADM bridge.

The existing run #40051063061 / job #120743626055 succeeded with Lean 4.34.0, Lake 5.0.0, and the PR's pinned Mathlib dependency. The actual job log checked out synthetic merge reference `f8190d3`, merging source commit `b93665c` into base `b48ce…`. This is a successful **PR merge-reference build**, not a standalone exact-head build. Tests, lint, nanoda, leanchecker, and axiom audit were skipped. PR #262 remains open, unmerged, and currently not mergeable; its current head is `89ab283…`. The file is absent from current main.

No new Lean theorem or run was made here. The local environment has no `lean`, `lake`, or `elan`. The source-specific O0-A map remains `FORMALIZATION_BLOCKED_DEFINITION` because \(K\), the averaging operator, the common foliation, and the Mode 2 update law are not source-defined. The conditional standard identity is a well-defined future proof target, not a Lean result.

## 7. Remaining gates

Before treating the O0-A/D4 bridge as source-established, recover or define:

1. Whether O0-A \(K\) is the trace of the second fundamental form, and its sign convention.
2. Whether O0-A and D4 use the same \(\Sigma_t\), normal field, metric, and connection.
3. The tangential projector and induced metric.
4. The averaging domain, measure, normalization, and units for \(\langle K\rangle\).
5. The dimensional scale and physical meaning of \(\delta g\sim S\).
6. The Mode 2 filament-update functional and its readout.
7. The relation from projected \(K_{ij}\) through Gauss-Codazzi and normal evolution to any claimed spacetime-curvature observable.
8. A gauge-invariant or otherwise physically distinguished mechanism if the strain is intended to source curvature.

No paper gate, P2 candidate, physical prediction, fit, or theory status changes as a result of this source and standard-geometry audit.
