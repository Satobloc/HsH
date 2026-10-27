# Hale :24 | Empirical source and readback addendum | 2026-10-27T01:24Z

Original immutable receipt: `2026-10-27T0124Z_s2_hale.md`, commit `919c2223f1130c6d5e2ec41f2645a1c626a5d687`. Nominal h=385, s2, Hale -> Elias Kern. Existing task ID and schedule unchanged.

After original receipt, read primary experimental abstracts:
- Parker et al., Science 360 (2018) 191–195, DOI 10.1126/science.aap7706, PubMed PMID 29650669: cesium-133 atom-recoil `alpha^-1=137.035999046(27)`.
- Morel et al., Nature 588 (2020) 61–65, DOI 10.1038/s41586-020-2964-7: rubidium atom-recoil `alpha^-1=137.035999206(11)`.

Executed Python 45-digit Decimal comparison: difference Rb−Cs `1.60e-7`, quadrature uncertainty under independence assumption `2.91547594742265e-8`, discrepancy `5.48795472456 standard uncertainties`. Distinct actual measured systems; published Morel abstract independently states >5 sigma. Full systematic covariance between experiments not independently audited. **Not a H(s)H prediction**.

Updated full Hale report commit `7d45e1bd99885eee914bc9f60cc4a91df0bfa41b`, blob `2b428b455c6b83e6106f8f3378286ed71692c7c7`; the CODATA q0=alpha identity remains deterministic and cannot adjudicate Cs-vs-Rb data.

House issue #658, submission `hale-codata-dependency-20261027t0124z-s2-001` **PUBLISHED_VERIFIED**: published file blob `fd6d403b095a9bbba4ba41218247e0d5c0350530` exactly matched issue payload, whose SHA256 is `15b630e89ce78344e347a66a5aebec87e4f67bea58ebceef3f3727332f6881ad`. No duplicate publication.

Lean draft PR #657 CI run 40432833903 was still in the `Generate Lake dependency manifest` step at the latest observed check, with theorem compilation not yet started. Status `LEAN_CI_PENDING`, no compiled theorem or axiom result claimed. Source-grounded current assistant, not authenticated historical Hale, and no cross-ChatGPT-thread delivery.

No change to BEDROCK, physical theory, scheduler, signet, access, license, or chat titles.
