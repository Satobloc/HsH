# Mira :24 | Tang two-particle projection and original source-data locator | 2026-10-28 22:24 UTC

Status: SOURCE-ANCHORED NOMINAL CALCULATION / SIX PYTHON CHECKS PASSED / SIX LEAN TARGETS SUBMITTED / LEAN CI PENDING / NO H(s)H VALIDATION.
Run key REVROT3-19-20261011:430:s2; selected Mira, next Aldus. Current assistant source-grounded in Mira's bibliography and citation-lineage charter, NOT the authenticated historical Mira conversation.

## Source and precedence
- Primary measured-system paper: Yuan Tang et al., *Imaging quantized vortex rings in superfluid helium to evaluate quantum dissipation*, Nature Communications 14, 2941 (2023), DOI 10.1038/s41467-023-38787-w, PMC10205744. Published May 23, 2023. Primary source paper and Methods were read; this is an external experimental source, NOT Nathan Direct or an H(s)H derivation.
- The publisher/PMC lists an original **Source Data XLSX** named `41467_2023_38787_MOESM11_ESM.xlsx`, as well as supplementary information and movies. The paper explicitly says source data accompany it; code is available from the corresponding author on request. **The workbook bytes were not obtained or parsed in this run** (binary download access blocked), so point-level measurements and covariance remain unavailable. The exact filename is a useful new retrieval cursor, not a claim of dataset replay.
- The 2008 reference underlying the particle-density citation is T. Xu and S. W. Van Sciver, *Density Effect of Solidified Hydrogen Isotope Particles on Particle Image Velocimetry Measurements of He II Flow*, AIP Conference Proceedings 985, 191-198 (2008), DOI 10.1063/1.2908547. Full 2008 article not read; its numerical density value remains unverified from the original.
- Precedence: Kestrel 20:24Z already recovered tracer/core observation maps and the reported 140.8 versus 140.6 micrometre values. Sable 21:24Z already established the printed 2023-versus-2025 factor-1000 density-unit conflict and found the Xu/Van Sciver DOI. This packet does not claim those as new discoveries.

## Exact source-rounded real-system projection audit
Tang's two-tracer event at 1.65 K reports observed initial half-separation d_p(0)/2 = 140.6 micrometres, while the best-fit S2W initial ring radius is R(0) = 140.8 micrometres. They define c1=d_p(0)/(2R(0)). The paper also reports brightness-calibrated transverse-displacement bound Delta y <=0.2 mm and measured in-plane centroid travel Delta S=1.12 mm, giving tan(theta)<=Delta y/Delta S. Their Fig. 2 error bars reflect positional uncertainties, but a numerical covariance matrix was not recovered.

Source-rounded rational arithmetic, not exact experimental precision:
- c1 = 140.6/140.8 = 703/704 = 0.9985795454545...
- Fitted radius minus observed half-separation = 0.2 micrometres.
- tan(theta) upper bound = 0.2/1.12 = 5/28 = 0.17857142857..., below the paper's rounded 0.18.
- The S2W R(0)=140.8 micrometres is **optimized against the same event**; c1 near unity is NOT an independent H(s)H prediction or a held-out fit. The transverse bound is brightness/model-inferred, not a directly measured 3D displacement.

Executable Python Fraction and independent Decimal formulations passed six exact checks; source code and JSON result are available in the local reproducibility bundle. No fabricated measurements, covariance, physical error bars or statistical significance.

## Proof and inverse geometry gates
On existing draft Mira PR #929 branch `research/mira-neutron-uncertainty-provenance-20261028t1836z`, two interconnected Lean 4/Mathlib modules were added and imported by the smoke-build root: `MiraTangRadiusProjection.lean` (3 theorems) and `MiraTangOpticalBound.lean` (3 theorems). GitHub commit 3ea7ab4fdced2923f8c8eb0d000867363ca48480. Exact source-file and root-import readback passed. CI run #40779967124 was PENDING on initial inspection; no Lean compilation success is claimed until actual job log confirms it. These are source-conditional rational equalities/inequalities, not proofs of optical calibration, physical source correctness, inverse uniqueness, or H(s)H.

The physical observation map is: vortex ring and trapped tracers -> projected positions/brightness -> two-tracer separation and centroid velocity. It is not invertible from c1 and a brightness bound alone. Reconstructing full 3D ring geometry requires additional trajectory/orientation assumptions, and independent worldtube-to-observable physics requires a constitutive law.

## Status and next cursor
1. Obtain the original Source Data workbook from the publisher/PMC and identify sheet/figure mapping, point uncertainties and calibration provenance before model residuals; preserve source checksum and do not invent missing covariance.
2. Recover Xu/Van Sciver 2008 full text or authoritative density table and the actual 2023 simulation input, rather than correcting a published unit label by assumption.
3. Verify CI #40779967124 actual Lean compilation, theorem names, axioms and missing-proof status. Do not inherit earlier Mira CI success.
4. P2 Nov30: independent H(s)H prediction still absent; P1 Nov9 Orson cognition and P3 Dec14 full-theory gates remain separate.

No new automation, no task/phase change, no BEDROCK promotion, no restricted PDF ingestion, no original Mira thread authentication or cross-thread delivery. Deliberate unrelated reading: SAT Mark V/TheTANGLE.txt original Git blob 3181b6cad85bbd76bd1017938e0dbf67baf03752 lines 611-670; next cursor 671. FIE last reviewed Oct27, less than 14 days ago.
