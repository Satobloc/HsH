# Hale :12 | Danner neutron arm-identity and calibration-source audit | 2026-10-28 19:12 UTC

**Status:** SOURCE-CRITICAL / OBSERVED-EXPERIMENT CALIBRATION GATE / EXISTING LEAN CI VERIFIED. Current assistant source-grounded Hale-role work, **not** an authenticated continuation of historical Hale's ChatGPT thread. No new SAT/H(s)H physical prediction, physical numerical calculation, fit, theory promotion, or new Lean proof.

## Scope and source priority

Incoming Calder :00 → Hale :12 handoff: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-28T1900Z_from_s0_to_s1_hale.md`, blob `200cd443007c491ccf622035a05f17ba81ca0585`. Original Nathan Direct FIE and Blockwave are not equated with this neutron experiment. Blockwave historical optical adapter `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, lines 419–459: `Δφ=η∫ sin(2θ(x)) dx` and kink asymptote `θ(+∞)=2π/3`; finite unsubtracted improper integral remains unsupported, as Calder/Mercer/Tern/Aldus earlier reported. This is **not** a neutron spin phase law.

## Additional institutional witness, same real physical system

Actual experiment: Danner et al., ILL Grenoble S18 polarized-neutron interferometry, measured spin–rotation phase under an applied rotating magnetic field. **The 2019 ILL Annual Report** [public page 67](https://www.ill.eu/media/old_files/user_upload/ILL/1_About_ILL/Documentation/Annual_report/AR-19/files/basic-html/page67.html) says in its body that the rotating-field spin interaction is in *path I*, and its Fig. 2a caption independently uses *path I*. This institutional account is a separate document about the **same experiment**, not an independent replicate.

The [2020 journal version of record](https://www.nature.com/articles/s41534-020-0254-8), published 2020-02-14, also identifies the RFG as in **path I** in Results / Experimental Setup, Fig. 1 caption, and Methods. The [2019 arXiv v1 preprint](https://arxiv.org/abs/1904.07085), submitted 2019-04-15, has **path II** in its main text/Fig. 1 caption, but **path I** in its supplement Fig. 4 and A.1. Aldus first established the versioned text mismatch in issue [#931](https://github.com/Satobloc/HsH/issues/931); Calder independently inspected the original preprint PDF drawings and found consistent lower physical RFG placement, but discrepant labels. **New Hale contribution:** the ILL 2019 Annual Report supplies a third, institutionally published witness supporting the supplement/journal's path-I naming.

Source-to-geometry table (do not promote labels to physical sign conventions):

| Witness | Physical RFG | Textual arm label | Evidence |
|---|---|---|---|
| 2019 arXiv v1 main Fig. 1/prose | lower arm in drawing | II | original PDF visual check by Calder, caption/prose by Aldus |
| 2019 arXiv v1 supplement Fig. 4/A.1 | lower arm in drawing | I | original PDF visual check by Calder |
| ILL 2019 Annual Report Fig. 2a/prose | RFG arm shown | I | independently read ILL institutional page |
| 2020 journal Results/Methods/Fig. 1 | RFG arm | I | independently read journal HTML |

**Interpretation:** A version/section label mismatch is evidenced. It is not evidence of hardware relocation, swapped beam paths, a phase sign flip, or a changed experimental outcome. The original authors' explicit reconciliation/erratum has not been recovered. The 2019 institutional account and 2020 paper are not independent experiments.

## Real-data and uncertainty gate

Published observed experimental conditions: neutron wavelength 1.9 Å, guide field 9 G, beam polarization ~0.99, rotating field frequencies 0–20 kHz, counting time 20 s per phase-shifter setting. Source is Danner et al., 2020, Methods and Results, ILL S18. The article reports an **approximately 8% difference between phase-vs-frequency fitted slopes with and without the polarizing supermirror** and offers coil/guide-field misadjustment as a possible explanation. Supermirror transmission is ~0.4; displayed ±1 SD counting error bars do **not** by themselves quantify the slope-level systematic. These are reported values, not independent calculations or invented uncertainty estimates.

Raw point-level data, fit covariance, calibration drift time series, and full phase/arm-sign convention were **not retrieved**; the article points to ILL DOI [10.5291/ILL-DATA.CRG-2484](https://doi.org/10.5291/ILL-DATA.CRG-2484), which did not resolve through available browser/connector routes. Therefore **NO SAT/H(s)H residual, model fit, uncertainty propagation, or independent physical prediction** is justified. A measured phase and a reference phase are not comparable until their arm orientation and phase-shifter conventions are fixed. Even the standard Pauli–Schrödinger baseline must be reconstructed from the published fit or original data rather than asserted from schematic similarity.

## Lean 4 / Mathlib status

No new data-free geometric formalization was attempted without Nathan's specific prior permission. Existing source-conditioned theorem work by Aldus is independently **ACTUALLY COMPILED**: draft PR [#793](https://github.com/Satobloc/HsH/pull/793), CI [#40749212517](https://github.com/Satobloc/HsH/actions/runs/40749212517), job `123031486678` **completed success**, Lean 4.34.0, **8,952 jobs**. Full job log fetched. Module `HsHVerification.AldusDannerExposureChronology` built and six conditional theorem-specific `#print axioms` lines each say **no axioms**. Automated separate axiom audit skipped. The six proofs certify the encoded document-label and chronology propositions, not source authenticity, arm sign, or physical correctness. New ILL-witness mapping has **no separately compiled theorem**.

## Publication verification and handoff

Existing Calder house-publisher issue [#932](https://github.com/Satobloc/HsH/issues/932): issue JSON `content` exactly equals committed `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-blockwave-optical-neutron-fidelity-20261028t19z-s0-001.md` (12,465 characters, Git blob `67cdc07613e0e6f7129684cbc25197bc06764e92`). Status **PUBLISHED_VERIFIED**, not duplicate-submitted. Original Aldus #931 is also published (blob `2cf2d4bfb5b80553346a2742dc62e424d34fad88`).

**This Hale addendum** was posted to existing issue #931 as comment [#6478351806](https://github.com/Satobloc/HsH/issues/931#issuecomment-6478351806) and independently read back byte-for-byte in length (2,557 characters). Existing publication route reused; no duplicate issue or branch.

## Control-plane and independent reading

Live BEDROCK blob `4cabda482c48c217614b868a2138409275df9bf7`, governing opening ~11k chars inspected; Steering `b9b8de55f8d5add7c42cf80be7c34677ee36305e`; Three Paper `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; onboarding `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`; Revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`; Branch Map `756c506780072591b2f48e22044f3368a57bfa7d`; Hale historical wake packet `2840500bec1873fc634e564f83d7eda7d1da74f0`; Hale inbox `f96d222d87c98b050a7f16701814d7a5f9989a02`. These were fetched, with controlling passages inspected; not a full word-by-word reread of BEDROCK. All four Mersearch request lanes occupied/requested, **three-root Mersearch not run**; bounded GitHub source search and actual primary outside-literature reading used. No new tool built. FIE team reread Oct 27, less than 14 days ago.

Deliberate unrelated reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, Git blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, **lines 1001–1030** inspected, creative narrative formats and a story-matrix proposal, not physics evidence; next cursor **1031**.

## Next exact work and status

- Retrieve ILL raw data and covariance, establish whether ~8% slope mismatch is within author-calibrated systematics, and recover physical arm/phase sign convention; if unavailable, maintain **BLOCKED_DATA**.
- Preserve Aldus's first original-preprint textual identification and Calder's independent figure readback; source-critical result is additive, not priority displacement.
- Elias Kern next at 19:24Z, his Track A routing/switchboard remit protected; consume exact recipient handoff rather than presume historical ChatGPT delivery.
- Nov 9 P1 (Orson cognition), Nov 30 P2 (measured physics), Dec 14 P3 (full theory) remain open for sources, hostile review, LaTeX/PDF/reader.
- No scheduler mutation, sixth recurrence, historical-thread message, worker acknowledgment, secret/signet, theory promotion, or ungrounded physics calculation.
