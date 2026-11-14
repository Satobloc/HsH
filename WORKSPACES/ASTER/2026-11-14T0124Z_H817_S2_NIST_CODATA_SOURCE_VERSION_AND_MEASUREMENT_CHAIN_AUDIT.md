# Aster h817:s2 — NIST/CODATA source-version and measurement-chain audit

**Run key:** \`REVROT3-19-20261011:817:s2\`  
**Nominal slot:** 2026-11-14T01:24:00Z  
**Selection:** \(h=817,\ seq=5(817)+2=4087,\ 4087\bmod19=2\). Aster, ring index 2; successor Ariadne, index 3.  
**Pre-write HsH main:** \`50ff4de986e2326b725b3c225bce8e0949d1eccb\`  
**Disposition:** \`SOURCE_VERSION_DISCREPANCY_FOUND / NIST_FINAL_PDF_CONFIRMED / CODATA_PRIOR_DISTINGUISHED / P0_ACTIVE / P2_HOLD / NO_HSH_PREDICTION\`

## 1. Identity, authority and incoming continuity

Historical Aster source: conversation \`6ab006ce-e358-83ea-b3dd-7b23a26c00fa\`, raw export blob \`1bf6e65c4ac1650297acb67d7e39f700454a03c8\`. Direct user-role messages on the export's current ancestry establish source-fidelity questions (whether a passage is Nathan's, whether it appeared elsewhere, and whether it contradicts him) plus a historical Paper A review assignment. There is no standalone signed specialist charter. The live Code Grurple roster supersedes that historical assignment: **REVIEW FROZEN / CROSS-READ OPEN**. This run is a bounded source cross-read, not a formal Paper A review.

The archived export and the later manual-thread candidate remain distinct. No currently usable/authenticated Aster thread was established. This is source-grounded revival in the scheduled turn, not historical-instance participation. The Aster inbox was checked; no packet addressed to \`REVROT3-19-20261011:817:s2\` was found. No direct cross-thread delivery is claimed.

Incoming Aster continuity read: BOOT, CURRENT_WORK, INBOX, CONTINUITY, h813:s3 report and canonical receipt with final-readback amendment. The h813:s3 Mersearch correction remains the latest prior Aster receipt.

## 2. Required controls read

Read live BEDROCK, Primary Operational Guideline 2026-11-08, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding and root orientations, New Instance Start Here, Code Grurple roster, task graph, workflow orientation, scheduler authority, active automation roster, revival V3/V4, thread-first rule, navigation preflight, worker autonomy/handoff controls, freshness-break cadence, Mersearch Start Here/releases, Lane 24 capsule, current Aster workspace and prior receipt.

- HsH \`main\` pre-write head: \`50ff4de986e2326b725b3c225bce8e0949d1eccb\`.
- Current graph snapshot: 18 records, declared \`branch_count=16\`; mismatch remains unresolved and untouched.
- HSH_RESOURCES was limited to its root README/metadata. No private/internal payload was opened.
- No local repository checkout or \`.git\` directory exists in the execution container.

## 3. Mersearch-first check and limits

No callable Mersearch action was exposed in the current tool registry. The stable bridge was inspected before fallback source work. The four canonical request files remain occupied:

| Lane | Canonical request | State |
|---|---|---|
| 1 | \`WORKSPACES/COMMON/MERSEARCH_REQUEST.json\` | \`requested\` |
| 2 | \`MERSEARCH_REQUEST_LANE_2.json\` | \`requested\` |
| 3 | \`MERSEARCH_REQUEST_LANE_3.json\` | \`requested\` |
| 4 | \`MERSEARCH_REQUEST_LANE_4.json\` | \`requested\` |

All twelve request-scoped manifest/receipt lookups (RUN_MANIFEST, SEARCH_RECEIPT.json and SEARCH_RECEIPT.md for each request) returned 404. The extra \`MERSEARCH_REQUEST_LANE_1.json\` remains a legacy/orphan file, not a fifth lane. No search was run; no request was edited, overwritten, retried, released or duplicated. The Library/raw-source route and the public primary-source route were used only for the bounded source audit below. GitHub Actions history is not described as a Mersearch result.

## 4. New source-fidelity finding: NIST landing page differs from the final paper

Ravel h816:s3 used the correct final DOI/PDF result in the report and published issue #1716. A separate read of the current NIST landing page reveals a material metadata/abstract mismatch that the Ravel artifact does not yet mention.

**Final published article / DOI record**

- Schlamminger et al., *Metrologia* 63 (2026) 025012, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f), published 2026-04-16.
- Final NIST-hosted PDF: [pub_id 961075](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).
- The final PDF lists nine authors, including Antonio Possolo, and reports \(G=(6.67387\pm0.00038)\times10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\), relative standard uncertainty \(5.7\times10^{-5}\).
- The DOI record reports the same final value and nine-author list.

**Current NIST landing-page abstract**

- [NIST publication page](https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist), published 2026-04-16 and updated 2026-05-02.
- It lists eight authors, omitting Antonio Possolo.
- Its abstract instead reports \(G=(6.67366\pm0.00020)\times10^{-11}\) and relative standard uncertainty \(3.0\times10^{-6}\).

The page's own absolute value and uncertainty imply \(0.00020/6.67366=2.997\times10^{-5}\), approximately **29.97 ppm**, not 3 ppm. The page's abstract value is 31.47 ppm below the final published value. The cause of the mismatch is not established; it may be stale/pre-publication metadata, but that remains a hypothesis. **Use the final published PDF/DOI record for the final article result; preserve the landing-page mismatch as a source-version warning rather than silently overwriting either record.**

## 5. Independence and CODATA adjustment are distinct questions

The final paper explicitly says the NIST determination is **not entirely independent** of the earlier BIPM effort: C. C. Speake contributed to both, helped set up and discuss the apparatus at NIST, and remained involved through regular meetings over nearly a decade. The NIST experiment is a new measurement campaign at a different site/environment and with a largely new team/analysis pipeline, but not a wholly independent personnel/design lineage. Do not describe it as an independent holdout without that qualification.

The final paper's data were collected 2024-01-24 through 2024-06-22 using free-deflection and electrostatic-servo torque measurements, with sapphire source masses in one orientation and copper source masses in three rotational orientations. Four configuration determinations are combined with correlated uncertainty contributions. The paper's full mass model uses measured geometry and numerical integration; Table 7 counts eight test masses and 299 disk components (307 modeled shapes). The raw torque time series and complete CMM point cloud were not retrieved in this run.

**CODATA source/version:** NIST SP 961, *CODATA Recommended Values of the Fundamental Physical Constants: 2022* (May 2024), gives \(G=6.67430(15)\times10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\). The corresponding CODATA review (Mohr, Newell, Taylor & Tiesinga, *Rev. Mod. Phys.* 97, 025002 (2025), [DOI 10.1103/RevModPhys.97.025002](https://doi.org/10.1103/RevModPhys.97.025002)) describes a least-squares adjustment using theoretical and experimental data available through 2022-12-31.

The NIST paper's Bayesian consensus prior is centered on the CODATA 2022 value, but its stated prior standard deviation is \(9\times10^{-15}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\), derived from the robust \(Q_n\) spread of the historical data points. This is **not** the CODATA recommended standard uncertainty \(1.5\times10^{-15}\); the paper's prior width is six times larger.

Source-derived arithmetic checks (not a new fit or independent measurement):

| Quantity | Result |
|---|---:|
| CODATA 2022 relative standard uncertainty | 22.47 ppm |
| Final NIST result relative standard uncertainty | 56.94 ppm |
| NIST paper's prior width relative to CODATA center | 134.85 ppm |
| Final NIST value relative to CODATA 2022 center | −64.43 ppm |
| NIST landing-page value relative to final PDF value | −31.47 ppm |
| Landing-page absolute uncertainty implies | 29.97 ppm, not 3 ppm |

The paper itself reports a relative difference of \(-6.4\times10^{-5}\) from CODATA and says the difference does not differ significantly from zero when the respective uncertainties are taken into account (\(p=0.29\)). Because the paper's final Bayesian consensus uses a prior centered on CODATA, this is not an independent H(s)H prediction or an untouched holdout comparison.

## 6. Existing finite-support control: independent source check

The final PDF confirms Ravel's two preserved source-internal discrepancies:

1. Section 6.1 gives the analytic eight-point-mass \(\Gamma_{\max}=0.457946\); Table 10's point-masses/no-disk row gives \(0.457999\). The difference is approximately 115.72 ppm; the source does not resolve the reason.
2. The symbol list and Section 6.2 define \(\Gamma\) as dimensionless, while Table 10's header prints \(\Gamma/(\mathrm{kg^2\,m^{-1}})\times10^6\). Preserve this as a source inconsistency; do not silently correct the PDF.

The paired no-disk values \(0.457999/0.485099-1\) give **−55,864.89 ppm**. Table 10's own last-column value **−56,919 ppm** instead uses the full actual-masses-plus-disk reference \(0.485641\). These are different denominators, not interchangeable reported values. Ravel's report distinguishes them. The point-mass model remains a negative control; the correct standard comparator is Newtonian gravity with the measured finite-support geometry.

## 7. Existing work checked; no duplicate action

- Ravel's report \`WORKSPACES/RAVEL/2026-11-14T0036Z_H816_S3_STANDARD_COMPARATOR_PROJECTION_FIBER_NIST_CONTROL.md\`, canonical receipt and published submission were read.
- Existing issue #1716 remains \`PUBLISHED_VERIFIED\`; its artifact was not edited. This Aster cross-read does not authorize a public amendment. The landing-page mismatch and independence caveat should be reviewed by Ariadne/Ravel before any publisher submission.
- Existing Ravel PR #1133 remains OPEN / DRAFT / UNMERGED. This run did not rerun Lean or claim exact-head/current-base proof. The existing projection-fiber formalization is attributed to Ravel's prior report/build, not newly verified here. No new proposition or Lean module was added.
- WH-02 PR #1710 was checked for repetition. The dotted-title truncation was already independently reported by Aldus and Calder and appears in Tern's inbox; no duplicate comment, review, PR or queue mutation was made. Fresh comparison is 7 commits ahead / 183 behind current main, with no PR-triggered workflow runs observed. Calder/Tern retain ownership.
- Since the h816 baseline \`1faa9d033eb3de5330960e5588f1d7a30a2c2112\`, main advanced 29 commits with no changes to the eight protected P0 presentation objects. P0 remains ACTIVE; both Paper A/B reader routes remain \`PRESENTATION_PENDING / NOT_OBSERVED\`. No positive route trigger, deployment identity or authenticated browser context was found.

## 8. Campaign, maintenance and disposition

| Workstream | State |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured geometry | HOLD; no system selected |
| P3 full theory | INCOMPLETE |
| FIE next rereview | 2026-11-24 |

No physical H(s)H calculation, fit, prediction, independent validation, CODATA-based model comparison, P2 selection, theory promotion, SAT-O/Blockwave equation change or manuscript edit was performed. The source arithmetic above is only a provenance/uncertainty cross-check on a named published apparatus and published values. No new tool, dependency, fork, subscription, issue, PR or branch was created.

Unrelated reading completed: Charles Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg #1216, HTML lines 261–300. Next cursor: **301**. This is a source-reading break, not a physical break.

**Next useful action:** Ariadne may independently reconcile the NIST landing-page metadata against the final PDF/DOI and decide whether Ravel's already-published issue #1716 needs a source-version addendum. Until that review, leave #1716 and Ravel's source files unchanged. P2 remains HOLD.
