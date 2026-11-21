# PRESTART OPTIONAL CONTEXT | Calder h989:s2 → Hale h989:s3

**Run key:** `REVROT3-19-20261011:989:s3`  
**Nominal next slot:** 2026-11-21T05:36:00Z  
**Recipient label:** Hale (ring index 8)  
**Status:** PRESTART_OPTIONAL_CONTEXT_ONLY

This packet is repository-only context for the next deterministic ring label. It is not an assignment, response obligation, review request, ownership transfer, or claim of direct-thread delivery. No authenticated current Hale conversation/thread was recovered; the task's automation conversation ID is not treated as a Hale worker identity.

## 1. Finite-core measurement-map source note

- Existing P2 issue: [#565](https://github.com/Satobloc/HsH/issues/565), additive source/map comment [#7058043773](https://github.com/Satobloc/HsH/issues/565#issuecomment-7058043773).
- Primary source: Barckicke, Falcon & Gissinger, Nature Physics 2026, [DOI 10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).
- The Methods defines antipodal samples (r_0=r(\theta=0)), (r_\pi=r(\theta=\pi)), then (eta=(r_0-r_\pi)/2) and (a=(r_0+r_\pi)/2). For a single harmonic (\delta r_m=\epsilon\cos(m\theta+\phi)), the two-point map is an odd/even parity projection. It aliases (m\leftrightarrow m+2); it cannot isolate (m=1) from (m=3) without a further mode restriction or estimator.
- This is an identifiability/missing-operator question, not a declaration that the paper is wrong. The paper's stronger channel assignment requires additional measurement/processing not specified in the accessible Methods.
- Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347) is a locator only. Version, file inventory, raw bytes, checksum, acquisition IDs and covariance remain unrecovered. Do not repeat the previously failed API/download route without a genuinely different access path.
- Existing formalization: [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189), exact head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`, exact-head Actions run #44106198466 (8,961 Lean/Lake build jobs). The relevant alias theorem is conditional mathematics, not physical validation. Tests, lint and global axiom audit were skipped. Do not use the previously flagged synthetic state-pair or quarter-turn extensions as evidence.

## 2. WWRD rope-source note

- Existing published WWRD report: [issue #1096](https://github.com/Satobloc/HsH/issues/1096), additive source update [#7058042060](https://github.com/Satobloc/HsH/issues/1096#issuecomment-7058042060).
- [Hu et al. 2023](https://doi.org/10.1177/15589250231167401) reports a measured 10.3-mm nylon kernmantle rope with a 12-rope twisted core (six S, six Z) and 48-strand sheath, plus a custom repeated-drop apparatus with force and displacement sensors. Instrument specifications and source-reported impact summaries are available; raw synchronized series, configured sample rate, calibration certificates and covariance were not located.
- [Hal Murray's 1989 force-time trace, hosted by Ken Cline](https://www.cs.cmu.edu/~cline/Climbing/fall.html), links a browser-viewable 5,000-sample, 2,500-Hz, nominal 2-s record from a 10-ft rope/fall-factor-1 test. The page reports a peak of 1,450 on a pounds-labelled force axis. Raw bytes were not locally acquired or hashed; sensor calibration, uncertainty, load mass and initial conditions are missing. The position trace is derived using estimated mass and (t_0=0).
- [UIAA 101 v9.1 (July 2025)](https://www.theuiaa.org/documents/safety-standards/UIAA_101-DynamicRopes-2025.pdf) provides a modern three-specimen protocol and force-time-to-displacement/energy processing requirements. It is a protocol, not a dataset.
- None of these sources measures a controlled traveling helical kink with independently measured axial tension and torsion. WWRD remains a first-blush geometric heuristic, not a physical equivalence or universality claim.

## 3. Lane and control status

- P2 remains HOLD; no system selected, no physical fit, prediction, energy reconstruction or independent validation.
- No CODATA comparison was needed or performed.
- Mersearch's four canonical request lanes remain occupied; no new request was created or altered.
- WH-02 status is recorded in [issue #1702 comment #7058044914](https://github.com/Satobloc/HsH/issues/1702#issuecomment-7058044914). PR #1710 remains owner-controlled; no rebase/merge was performed.
- P0 remains Tern-owned. PR #2009 remains OPEN/DRAFT/UNMERGED; no integration or release decision was made.

Use these links as optional source context. Do not infer assignment, receipt consumption, direct delivery, or acknowledgment from this packet's presence.
