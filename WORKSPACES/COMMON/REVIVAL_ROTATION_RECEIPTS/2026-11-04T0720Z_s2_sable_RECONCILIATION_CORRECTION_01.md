# Correction 01 — Sable :24 retry reconciliation receipt

**Corrects:** `2026-11-04T0649Z_s2_sable_RECONCILIATION.md`  
**Nominal run key:** `REVROT3-19-20261011:581:s2`  
**Current automation run ID:** `53163f9a-8604-832f-a358-588c4be6ba33`  
**Correction time:** 2026-11-04 07:20Z

The prior retry receipt is retained unchanged because receipts are create-only. Its §3 contained an incorrect Library-export SHA-256 and incorrect user-message UUIDs. Its §4 also overstated the absence of a physical prediction/comparison. Use this correction for those fields; the other task, run, schedule, and handoff fields in the prior receipt remain unchanged.

## 1. Correct historical Sable charter source

The source is the Library raw export titled `SABLE Revival Rotation`:
- Conversation ID: `6aa6701e-b800-83ea-a19a-31a802b7124d`
- Exact raw-file SHA-256: `dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302`
- 2,015 mapping nodes; 59 user-role messages.

Correct direct user-role message pointers:
- 2026-09-14 13:45:40Z — `2f454d16-f617-4cd6-be14-e71db19f72e7`: free archive exploration, contextual breadth, team roster/capability inventory, productivity assessment, and deliberate training/divergent growth.
- 2026-09-14 14:35:05Z — `df0c6245-20ee-43bb-b381-f277f85bddb4`: explicit Sable remit to focus on team understanding, state-of-system analysis, automation leverage design/testing, outside tools/resources, knowledge-base survey, scripting as multiplier/checksum, and capability/workflow assessment.
- 2026-09-15 01:44:40Z — `3f6e9b2b-55d9-4136-b379-0978f7db69c1`: Dashboard centrality, flexible workflow assessment, continuity, timestamp cross-monitoring, and FIE/sandbox/quarantine boundaries.
- 2026-09-15 02:11:07Z — `8c800379-b9e6-4877-b0e0-994097748dba`: only Sable continuity adjusts workflow design, with input from other instances; Sable may design permissions and lane assignments.
- 2026-09-15 02:30:08Z — `28fec60d-5829-43fb-bcdf-52a94b01ea55`: archive preservation, wayfinding, extraction, tagging, tooling, accessibility, transparency, and full-project-view capability.
- 2026-09-15 03:01:56Z — `327ad2cc-2bd1-4c9f-80c3-839a64f1e34a`: exploration across HsH, GLASS, and RESOURCES, with quarantine and PRIOR_ART boundaries.
- 2026-09-15 06:32:45Z — `91883df7-c134-4f34-bf66-e1e43413ed7f`: require a cross-repository script-execution standard to prevent collisions and overwrites.

This raw export is a historical charter source, not evidence of a live Sable thread. The separate older `Revival Rotation` conversation is not conflated with it. The current automation run still has `chat_ref=null`.

## 2. Correct physical-work description

The retry did recompute the standard helium-4 circulation quantum (kappa=h/m_{^{4}\mathrm{He}}), the Feynman spacing prediction (delta_F=\sqrt{\kappa/(2\Omega)}), and the orientation-projection lower bound, using the CODATA 2022 evaluated mass unit and published 2026 FSU neutral-helium mass result. It checked the standard projection envelope against the 2023 paper's published statement that all plotted points lie within the envelope.

It did **not** perform a CODATA adjustment, a raw-data/Table S1 reanalysis, a fit, or an H(s)H physical prediction. The 10-rpm anomaly remains withdrawn because the earlier 175.8±9.0 μm row was not re-extracted and the main paper says all plotted points lie within the envelope.

The independence-only relative-uncertainty quadrature in the corrected worker note is (3.1328045484\times10^{-10}) (rounded (3.133\times10^{-10})); the conservative first-order triangle bound is (3.2214546568\times10^{-10}) (the note retains the safe rounded upper bound (3.222\times10^{-10})). Covariance between the 2026 FSU relative mass and CODATA (m_u) remains unavailable.

## 3. Corrected worker-note pointer

`WORKSPACES/SABLE/2026-11-04T0524Z_CODATA_HE4_VORTEX_UPDATE_ADDENDUM.md`  
Corrected Git blob SHA-1: `acc223a040fb3eaa760d0079c30914ff161145e4`  
Exact readback: PASS.

No new handoff, issue, task, task ID, schedule, phase, or branch was created. No theory promotion or paper-gate advancement occurred.
