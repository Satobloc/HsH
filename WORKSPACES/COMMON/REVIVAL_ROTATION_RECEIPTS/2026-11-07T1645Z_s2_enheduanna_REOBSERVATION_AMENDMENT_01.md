# Enheduanna h663:s2 re-observation amendment 01

**Status:** `SAME_NOMINAL_SLOT_REOBSERVATION / RAW_SOURCE_ID_AND_ANCESTRY_CORRECTION / MERGE_REF_CI_CORRECTION / CODATA_SOURCE_AUDIT / NO_PHYSICAL_CALCULATION / NO_P2_ADVANCEMENT`

**Run key:** `REVROT3-19-20261011:663:s2`  
**Deterministic selection:** Enheduanna (index 11) -> Tern Rook (index 12).  
**Current automation run record:** `bddb7968-c680-8325-94c2-e4eee6a70e2e`; nominal occurrence 2026-11-07T15:24:00Z; started 2026-11-07T16:45:20.428452Z; `chat_ref=null`. This is a late re-observation of a nominal slot that already has a canonical receipt, not evidence of a second authenticated worker or a distinct retry mechanism.  
**Canonical parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-07T1524Z_s2_enheduanna.md`, blob `8678d67c2783ee60c324420fe131ee332bbbe6ea`. This file is an amendment, not a duplicate canonical receipt.

## 1. Live state and authority

- Current `BEDROCK.md`: blob `527924246cc25caf7fac02dce4b20f024013cd19`, 627 lines.
- Steering Charter 2026-10-26: `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three-Manuscript Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- New Instance Start Here: `43b577d42b8cced83f8836934598081685ea3ff3`.
- Revival Rotation V3: `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Enheduanna README: `d8e170b8169531cfb8f29a1b2c753b4f500189e9`.
- Task graph: `a0a818b89e4d04b0e9d7377b21113ca8e9ea19da`, 16 declared branches / 18 actual records, last graph update 2026-11-06T03:50Z. Tern retains reconciliation ownership.
- Code Grurple P0 remains ACTIVE. P1 remains Orson-owned. P2 remains HOLD. P3 remains separate.
- Main branch at final source inspection: `df711195164650c0e33af64458f0836b63937868`. The ten commits after `0cd1080eac5ee34665d85cf934a354882b7d4083` touched the public discovery docket, Kestrel inbox and Morrow workspace only; they did not touch this source note, Enheduanna CURRENT_WORK, or Tern INBOX.
- No standalone Nathan-authored Enheduanna specialist charter or authenticated Enheduanna thread exists in the recovered record. The README says the only located direct instruction is the broad request to consider all archives. Do not enlarge it into a detailed role charter.

## 2. Raw-source identity and ancestry correction

The large raw export was successfully recovered through Git blob retrieval after the path reader returned zero characters:

- Repository/path: `Satobloc/HsH / LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`
- Git blob SHA-1: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`
- Retrieved content: 17,405,163 characters.
- Header title: `Meridian Minkowski Ring Analysis`.
- **Actual header conversation ID:** `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`.
- Current node: `2e63816a-56dc-4516-8b1c-4b1b88d9a107`.
- Mapping nodes: 3,678; current ancestry: 3,660.

The two direct user-role messages require different ancestry classifications:

1. `2bef9e5d-cf4d-4cb2-959f-218e032e5263`, 2026-10-21T06:32:15.993Z, **ON CURRENT ANCESTRY**. Verbatim: “We’ve calculated the tension in the past on the worldtubes as something in the 10^44J neighborhood. If we add that in, plus a maximum bending — which is probably going to be derivable from (or at least ceilinged by) some kind of minimum momentum measure.” This is a recollection and proposed relationship, not a formula, measured result, uncertainty budget, or typed constitutive law. The literal unit is joules; do not silently convert it into force or force-per-length.

2. `a0e0be28-5bd8-45da-9991-1e075f09728d`, 2026-10-21T06:34:36.336Z, **OFF CURRENT ANCESTRY**. Verbatim: “Maximum bending energy has been calculated in the past…\nYes, and, we should always be working Planck units. That should be part of the reorganization directive in the bedrock document.” It is a direct user-role message on another branch, not part of the selected current conversation ancestry. It does not contain the remembered calculation. Do not use it as a current-branch instruction merely because it is direct user text; check any independently controlling BEDROCK directive separately.

**Cross-artifact ID discrepancy:** Aster's 2026-11-03 paste-provenance note and 2026-11-04 chronology report attach the same raw blob SHA to conversation ID `6ad7e9c0-e8a0-83ea-80a1-4d502522e441`. That ID is not the header ID in the recovered blob. HsH/SAT archive/HSH_RESOURCES searches did not locate a separate record for that alternate ID. Treat the Aster locator as a metadata error requiring owner review; do not edit Aster's artifact from this workspace. The message IDs and raw blob SHA are confirmed in the actual blob.

The historical maximum bending-energy calculation remains unrecovered. No historical SAT-O or Blockwave equation was recovered, transcribed, corrected, or promoted.

## 3. Lean PR #1455: merge-ref correction

PR #1455 remains OPEN / DRAFT / UNMERGED.

- Head branch: `research/enheduanna-bending-energy-bound-20261107t1524z`.
- Head SHA: `606e5a012139d12b411a43ca1ab960fc09f940c0`.
- Base: `infra/lean4-verification-20261023`, SHA `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- PR merge commit: `71d9002869f1a519a3beddd106d9ef3f1ffc2dac`.
- Module blob: `b8db21c7dd7c5f8dadaeac974296345a64d776af`.
- Actions run #42390677035; job #128457402086; conclusion SUCCESS.

The actual job log shows checkout of `refs/remotes/pull/1455/merge` and:
`HEAD is now at 71d9002 Merge 606e5a012139d12b411a43ca1ab960fc09f940c0 into c7dc2c483f50ae03fc7a7c530829170135e18d92`.

Therefore this was a **successful merge-ref build**, not an exact-head-only build. The prior h663 receipt's merge-test-ref value `80ad815d85c71054f61d1bbfdb29e18d5b49bdee` is contradicted by the retrieved job log and current PR metadata; use `71d900...` for run #42390677035. Do not claim an exact-head build.

Actual run evidence:
- Lean 4.34.0 / Lake 5.0.0 / Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- `lake build` completed 8,945 jobs.
- The module's `#eval` printed 48.
- Three theorem-specific `#print axioms` outputs list only `propext`, `Classical.choice`, and `Quot.sound`; the module contains no `sorry`, `admit`, or `axiom` declaration.
- Tests, lint, nanoda, and the global axiom audit were skipped.
- The head commit's Vercel status is FAILURE with `upgradeToPro build-rate-limit`; this is not a Lean build failure, but the PR does not have all checks green.

The theorem remains conditional on the declared scalar curvature function, nonnegative B and L, continuity, and a pointwise squared-curvature ceiling. The reach-style theorem assumes both nonnegative curvature magnitude and `κ ≤ 1/a`; it does not derive that ceiling from a geometric reach definition. Constant-curvature saturation is only in the unrestricted scalar-function class. No physical curve, worldtube, measured curvature, constitutive law, or H(s)H observable map is formalized.

## 4. Lane 24 source audit: CODATA and measured rotation system

### CODATA 2022

The controlling NIST source is **Web Version 9.0**, dated 9 May 2024, the latest public recommended set available at this inspection. NIST states that the 2026 adjustment is next and that eligible data must have been discussed in a preprint or publication before 31 December 2026.

- NIST constants/version history: https://physics.nist.gov/cuu/Reference/versioncon.shtml
- CODATA 2022 paper: Mohr, Newell, Taylor and Tiesinga, *Reviews of Modern Physics* 97, 025002 (2025), DOI https://doi.org/10.1103/RevModPhys.97.025002
- Recommended G: `6.67430(15) × 10^-11 m^3 kg^-1 s^-2`.

G is evaluated separately from the least-squares adjustment of the other constants because it is independent of them. The 2022 evaluation uses 16 input determinations and three pairwise input correlations: NIST-82/LANL-97 = 0.351; HUST-05/HUST-09 = 0.134; HUST-09/HUSTT-18 = 0.068. The weighted-mean uncertainty is expanded by 3.9; reported χ² = 12.9 for 15 degrees of freedom, p = 0.61, Birge ratio = 0.93. No new G input data were available for the 2022 adjustment after the 2018 cutoff, so the recommended value remained unchanged from 2018. Do not describe G as an ordinary parameter in the global CODATA least-squares fit.

### NIST 2026 BIPM torsion-balance replication

Primary paper: Schlamminger et al., *Metrologia* 63 (2026) 025012, published 16 April 2026, DOI https://doi.org/10.1088/1681-7575/ae570f; final NIST-hosted PDF https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075.

This is a real measured rotating torsion-balance system. Data were collected 24 January to 22 June 2024 using free-deflection and electrostatic-servo modes, one sapphire source-mass orientation and three copper source-mass orientations. The balance remained under vacuum. Eight measured torque differences are reported in Table 15 (Type A uncertainties only); four individual G estimates are in Table 16; each estimate depends on 23 input quantities grouped into 14 uncertainty categories; Table 18 gives the four-estimate correlation matrix; Table 19 gives configuration-specific Bayesian dark-uncertainty results.

Table 16 individual values, in `10^-11 m^3 kg^-1 s^-2`:
- Copper servo: 6.673642; relative standard uncertainty 23 × 10^-6.
- Copper free: 6.674021; relative standard uncertainty 30 × 10^-6.
- Sapphire servo: 6.672637; relative standard uncertainty 38 × 10^-6.
- Sapphire free: 6.673636; relative standard uncertainty 94 × 10^-6.

Table 18 off-diagonal correlations: 0.42, 0.38, 0.12, 0.23, 0.23, 0.25. The paper reports servo-mode values consistently below free-deflection values; the torque offsets are 1.8 ± 0.3 pN m for copper and 2.1 ± 0.3 pN m for sapphire. A search found no significant time-dependent torque after applying servo voltage, but the origin of the offset remains unknown. The authors model configuration-specific unexplained effects as dark uncertainty rather than silently folding them into the original uncertainty budget.

The Bayesian consensus prior for μ is Gaussian centered at the CODATA 2022 value `6.6743 × 10^-11`, with standard deviation `9 × 10^-15`. The final paper reports `G = (6.67387 ± 0.00038) × 10^-11`, relative standard uncertainty `5.7 × 10^-5`. The four estimates are correlated and the consensus posterior explicitly uses a CODATA-centered prior. It is therefore **not an independent CODATA holdout**. The authors also note that Clive Speake participated in both the BIPM and NIST efforts, qualifying any claim of complete experimental independence.

**NIST landing-page conflict:** the NIST publication page abstract currently displays `6.67366 ± 0.00020` and relative standard uncertainty `3.0 × 10^-6`. The quoted absolute uncertainty implies `0.00020 / 6.67366 = 2.9968563 × 10^-5`, about ten times the page's stated relative uncertainty. The final PDF instead reports `6.67387 ± 0.00038` and `5.7 × 10^-5`, which are internally consistent. Use the final PDF as the controlling paper result and flag the landing-page abstract as inconsistent; do not silently combine the two versions.

The 2026 paper is eligible for consideration in the 2026 CODATA adjustment because it was published before the 31 December cutoff, but inclusion is not established. No raw time series, CMM point cloud, or separate data-availability statement was recovered in this pass. Published table-level values and uncertainty/correlation structure are available. No independent reanalysis or numerical comparison was performed.

### Finite-core/rotation alternative

The 2026 Kelvin-vortex paper is a more direct finite-core rotating-fluid candidate: DOI https://doi.org/10.1103/t3bt-m431; associated Figshare DOI https://doi.org/10.6084/m9.figshare.30903347. The paper reports PIV/PTV measurements, but the Figshare file inventory, version, checksums, acquisition synchronization, and joint covariance were not retrieved. No H(s)H geometry-to-observable map is available. It remains a candidate, not a selected P2 system.

**Lane 24 disposition:** no physical calculation, CODATA comparison, fit, prediction, holdout, or P2 system selection. The NIST system is a documented measured rotation candidate; its CODATA prior dependence must be handled before any independent comparison. The Kelvin-vortex dataset must be retrieved and versioned before raw-data analysis. No climbing-rope universality or physical equivalence is asserted.

## 5. Existing tools and unrelated reading

- Existing Archive Math Hopper is committed and its bounded three-repository Actions pilot is configured, but end-to-end execution/output remains NOT VERIFIED. No replacement hopper was built.
- Existing Lean PR #1455 and Mathlib/CI were reused. Whirligig remains an existing second-tier sandbox, subordinate to P0/P1 and the evidence gates.
- SciSpace was available and used for paper discovery/method metadata. No Mersearch action was exposed in this runtime; all four existing request lanes remained occupied/requested. No lane was overwritten or retriggered.
- No new tool, dependency, fork, local clone, subscription, or expense.
- Unrelated reading continued in Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1321–1360. Next cursor: line 1361. The passage concerns scientific-society governance, qualifications, and public transparency, not physics.
- FIE last full review remains 2026-10-27; next due 2026-11-10. No premature full rereview.

## 6. Disposition and next cursor

- Correct the raw-export conversation ID and ancestry status in any future source citation; the Aster note's conflicting ID should be referred to its owner, not silently overwritten here.
- Preserve the historical maximum bending calculation as UNRECOVERED. Do not use the off-ancestry message as current-branch authority.
- Keep PR #1455 draft/unmerged and classify its successful CI as MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_BUILD_NOT_PERFORMED.
- Keep Lane 24 at HOLD while Code Grurple P0 remains active and until a real measured system, complete provenance, covariance, H(s)H geometry-to-equation map, and falsifiable prediction are available.
- Next unrelated-reading cursor: Babbage line 1361.
- No new public issue, no new PR, no paper-gate change, no BEDROCK promotion, no task/ID/schedule/phase change, no sixth task, no signet, and no conversation rename.
