# Ravel :24 | 2026-10-29 08:24 UTC | Helion/proton charge-radius inverse-readout gate

**Disposition:** REAL DATA AUDITED / SIX PYTHON ASSERTIONS PASS / EIGHT CONDITIONAL LEAN TARGETS IN PR #993 / CHARGE-READOUT MAP NOT RECOVERED / NO HSH PHYSICAL VALIDATION.

## Nathan-original-first
Verified original-user excerpt compendium: `WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md`, Git blob `1076d5841ea8ec67ddae39e8949dbc5b2649b35c`, sections around lines 940-1025, 1800-1920, 2330-2440, read in this run. It cites raw-user message IDs: July 11 `357fae86-dd21-41fc-bf92-646bb4c336ac` (Q=3 and He-3 holotype), `95993cdf-7794-4270-84cb-af391d7cbaf1` (braid nesting distinct from superhelix nesting); Sept 6 `381b1288-1fb8-4a18-ae4b-7126cecc2749` (measure nucleus to constrain braid), `09e78d2a-2913-4302-a442-532cb79f442e` (questions radius/envelope distinction), `72f6502b-3361-44e2-a6a8-d87ad53badd4` (nucleus constrains model, not reverse), `00d87203-f1bd-4c86-bf7d-6f6f426c895f` (standard physics first); Sept 7 `3d0ad680-51db-4c79-ad4a-9bbacada24ef` (spatial Kerr section, not 4D spacetime as a 4D cross-section) and `496a15ea-0263-459d-b815-908f52155b90` (three distinct 4D/3D representations). Raw original JSON not reparsed in this run; attribution relies on prior role-verified compendium. All four Mersearch request lanes occupied; no scan claimed.

Historical assistant-composite `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HELIUM STANDARD ATOM 2.txt`, blob `5e0f43950244bd5173799ec74b985944cf169ac2`, contains Q=9 constituent description and `Δr_ch≈0.0196 fm` but gives no source-verified independent charge-radius baseline, 4D charge operator or derivation. Do not present this as Nathan-authored prediction.

## Real measured systems and extraction
- CREMA Collaboration, *Science* 388 (2025) 854-858, DOI 10.1126/science.adj2610, muonic-3He 2S-2P laser spectroscopy plus bound-state/nuclear-theory extraction: **helion rms charge radius 1.97007(94) fm**. https://pubmed.ncbi.nlm.nih.gov/40403064/
- NIST **CODATA 2022**, database v9.0 (2024), **adjusted** proton rms charge radius **0.84075(64) fm**, not an independent raw observation. https://physics.nist.gov/cgi-bin/cuu/Value?rp%7Csearch_for=rms
- 2013 muonic-hydrogen experiment, proton 0.84087(39) fm, a sensitivity comparison, not an independent HsH validation. https://www.psi.ch/en/lmu/shl-2013

## Actual Decimal execution (40-digit; six assertions passed)
`r_h/r_p=2.3432292595896521` (dimensionless); `r_h²-r_p²=3.1743152424 fm²`.
Deterministic ±1σ input endpoint bounds: ratio **[2.3403296925, 2.3461332445]**, squared gap **[3.1695358248, 3.1790956080] fm²**. These are not joint 68% confidence intervals. First-order independence-assuming sensitivities 0.00210516 and 0.00385691 fm² are conditional; covariance/theory dependence unresolved. 2013 muonic-H proton comparison ratio 2.3428948589. Historical 0.0196 fm claim is ~20.85× the 2025 experimental standard uncertainty, **NOT a 20.85σ discrepancy**, because the model baseline and uncertainties are unspecified.

Executable `ravel_helion_radius_audit_20261029.py` local SHA256 `0190c8f8265f1944a06b9674c389438b3ad70a15da6ddd28814fa25fd5ce4d0a`; stdout SHA256 `3ad231768c7aeff709d2dc6c0f44b8e08b17dcd3df6eb84bdb6ef8ee0751dc5f`. Script/stdout retained in this run's downloadable reproducibility bundle; not represented as committed GitHub files.

## Geometry ↔ equations ↔ observation
The measured radius is a charge-density **second moment**, e.g. `r_ch²=(1/Ze)∫|r|² ρ_ch(r)d³r` with appropriate frame/charge normalization, NOT automatically a braid-envelope radius. Charge density can have neutron contributions, nucleon finite-size structure, two-body currents and relativistic/theoretical corrections. The mapping `4D worldtube + timesheet + medium -> 3D electromagnetic charge/current operator -> ρ_ch -> form factor -> muonic energy levels` remains **missing**. Conversely one measured second moment does not uniquely recover an envelope, braid nesting or 4D embedding. This does not prove an envelope equality impossible; it makes the missing forward map explicit. No fitted radius or HsH forward prediction was calculated.

Formal packet: draft PR #993, branch `research/ravel-helion-charge-radius-inverse-gate-20261029t0824z`, eight theorem targets in two connected Lean 4/Mathlib modules, CI must be checked separately. The formalization proves only rational arithmetic and endpoint inequalities, not a physical charge-density map. Nov30 P2 remains OPEN; Nov9 P1 Orson cognition and Dec14 P3 separate. No BEDROCK promotion, scheduler changes, or authenticated historical ChatGPT conversation delivery.

**Next source cursor:** recover any original Nathan-authored 4D filament current/charge operator (not merely assistant `J_{μνρ}` prose), identify physical projection/current normalization, and only then attempt a held-out 3He/4He charge form-factor prediction.

## Post-submission verification closure (2026-10-29 08:30 UTC)
- Lean PR #993 exact head `e286fb13223f7159534918b394fa6dbe49a251a3`, Actions run #40842231364, job #123341105861: **COMPLETED SUCCESS**, Lean 4.34.0, `Build completed successfully (8945 jobs)`. Both new modules compiled, eight theorem-specific `#print axioms` lines checked; each depends only on standard Mathlib `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx` observed in the new theorem reports. No independent physical validation.
- House issue #994 **PUBLISHED_VERIFIED**. Existing issue submitted once, publisher comment #6491813333, published path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-helion-radius-inverse-20261029t0824z-s2-001.md`, blob `9947780df50e0289bd2b2d09303d8224926caf87`, SHA256 `8e0eb72df9d7b2855307cc991e3856e4ee0fb721ae1e8019c62b4bae1872940e`. Exact issue-submitted content and published file compared equal (2618 characters). No duplicate.
- The unrelated `conversation-json-content-ci.yml` workflow on the PR failed without evidence that it affects Lean verification. It is not a proof failure. No merge requested.
