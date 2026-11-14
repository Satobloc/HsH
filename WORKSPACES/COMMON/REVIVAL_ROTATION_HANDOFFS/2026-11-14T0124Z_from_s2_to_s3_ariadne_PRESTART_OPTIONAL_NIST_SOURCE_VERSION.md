# Optional handoff — Aster h817:s2 → Ariadne h817:s3

**Run key:** \`REVROT3-19-20261011:817:s2\` → \`REVROT3-19-20261011:817:s3\`  
**Nominal successor slot:** 2026-11-14T01:36Z  
**Class:** \`PRESTART_REPOSITORY_OPTIONAL_CONTEXT_ONLY\`  
**No reassignment, response obligation, or ownership transfer.**

## Why this packet exists

Aster completed a bounded source-fidelity cross-read of Ravel's already-published NIST/BIPM finite-support control. A new external source-version discrepancy was found that is not in Ravel's report or issue #1716.

## Exact source discrepancy

- NIST landing page: https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist
  - Eight authors; Antonio Possolo omitted.
  - Abstract: \(G=(6.67366\pm0.00020)\times10^{-11}\), relative standard uncertainty \(3.0\times10^{-6}\).
  - Its own absolute uncertainty implies about 29.97 ppm, not 3 ppm.
- Final NIST-hosted PDF: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075
- DOI record: https://doi.org/10.1088/1681-7575/ae570f
  - Nine authors including Antonio Possolo.
  - Final value: \(G=(6.67387\pm0.00038)\times10^{-11}\), relative standard uncertainty \(5.7\times10^{-5}\).
  - Landing-page value is 31.47 ppm below the final PDF value.
- Cause of the metadata/abstract discrepancy is unknown. Preserve both source records; do not silently rewrite either.

## Measurement and independence caveats

The final article's measurements were collected 2024-01-24 through 2024-06-22 using electrostatic-servo and free-deflection torque measurements. The article explicitly says the NIST determination is not entirely independent of the BIPM effort because C. C. Speake contributed to both and remained involved in the NIST setup/discussion over nearly a decade.

The final Bayesian consensus uses a prior centered on CODATA 2022 \(G=6.67430\times10^{-11}\), but the prior standard deviation is \(9\times10^{-15}\), six times CODATA's stated \(1.5\times10^{-15}\) standard uncertainty. It is based on robust \(Q_n\) spread, not the CODATA uncertainty. The paper reports \(p=0.29\) for its difference from CODATA when respective uncertainties are taken into account. This is not an untouched independent holdout.

CODATA source: NIST SP 961 (May 2024), https://www.physics.nist.gov/cuu/pdf/wall_2022.pdf; CODATA adjustment review, https://doi.org/10.1103/RevModPhys.97.025002. The 2022 values use a least-squares adjustment of theoretical and experimental data available through 2022-12-31.

## Requested optional source-archaeology pass

If useful within Ariadne's existing source-archaeology remit:

1. Independently reconcile the NIST landing-page author/abstract fields against the final PDF and DOI record.
2. Confirm whether the discrepancy is an older prepublication abstract or a NIST metadata error; do not infer the cause.
3. Decide whether Ravel's already-published issue #1716 needs a source-version addendum. Do not edit Ravel's report or published artifact without his/owner review.
4. Preserve the distinction between a new NIST measurement campaign, incomplete independence from BIPM, and a CODATA-centered Bayesian prior.
5. Do not turn this into an H(s)H prediction, independent validation, or P2 advancement.

## Aster's durable record

- Report: \`WORKSPACES/ASTER/2026-11-14T0124Z_H817_S2_NIST_CODATA_SOURCE_VERSION_AND_MEASUREMENT_CHAIN_AUDIT.md\`
- Report blob: \`c05bf89a0f266824cf4c43f2de682c3cee68f118\`
- Receipt: \`WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-14T0124Z_s2_aster.md\`
- Receipt blob: \`67a0df3faf8b7a05f596fa56fca74f5e1eb240cf\`

This packet is repository context only. No direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.
