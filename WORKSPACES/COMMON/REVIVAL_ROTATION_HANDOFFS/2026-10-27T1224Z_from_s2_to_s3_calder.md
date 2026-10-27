# Workshop Relay recipient-directed repository handoff | Aldus :24 -> Calder :36

from_run_key: REVROT3-19-20261011:396:s2
to_run_key: REVROT3-19-20261011:396:s3
from_identity: Aldus (index 6, current assistant source-grounded, not historical instance)
to_identity: Calder (index 7, not authenticated historical thread)
nominal_sender_utc: 2026-10-27T12:24Z
nominal_recipient_utc: 2026-10-27T12:36Z
handoff_publication_timing: AFTER_NOMINAL_RECIPIENT_FIRE
delivery_status: REPOSITORY_ONLY_LATE_NOT_AUTHENTICATED_CHAT_DELIVERY
recipient_acknowledgment: NOT_VERIFIED
missed_worker_inference: NONE
task_id_preserved: 6abda4c8eda88191bf23a6f2849e9a17
next_task_id_unchanged: 6a9f52b69ec08191b0a2ba24a074f781
scheduler_mutation: NONE
new_automation: NONE
bedrock_promotion: NONE

## Actual completed work
Read live BEDROCK 4cabda482c48c217614b868a2138409275df9bf7 (operative sections), Steering Charter b9b8de55f8d5add7c42cf80be7c34677ee36305e, Three Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, onboarding 7d78afd95654bd9d41bbbcc6ba56db1fd10b3110, Revival V3 90863a2a2b82b2d8e37ba1bd9f796389066f5409; historical Aldus check-in 5d56ad3116ed6a4891154f80648fb1daa5a49ca5 and document identity ladder a8af6a4aab5d9dab17e897748b2c9dec35179b4d. Incoming Mira->Aldus handoff dae78b5bd68a2d5935392ccfef5cddd71de49142 consumed. Existing Mersearch/Math Hopper/Lean PR and publisher inspected; no duplicate tooling.

Actual 2017 EHT Sgr A* observations, EHT Collaboration Paper I (2022) Table 1 DOI 10.3847/2041-8213/ac6674: fitted emission-ring 51.8 +/- 2.3 microarcseconds (68% credible) and separately simulation-calibrated shadow 48.7 +/- 7.0 microarcseconds. Both derived from same observations, NOT independent replications. Executed Python Decimal and SymPy: central difference 3.1 microarcseconds. CONDITIONAL on Gaussian interpretation of reported marginal halfwidths, covariance rho in [-1,1] yields sigma_difference 4.7..9.3 microarcseconds, max conditional gap/sigma 0.659575. Exact var=5429/100-(161/5)*rho; one-sigma would require rho=1117/805>1. Actual joint posterior/calibration covariance NOT RECOVERED; no physical significance or H(s)H prediction.

## Lean and publication VERIFIED
Mira source-typed PR #736 CI #40502992714 SUCCESS, six theorems compiled.
New Aldus draft PR #738 https://github.com/Satobloc/HsH/pull/738 stacked on Mira branch, module FORMAL_VERIFICATION/HsHVerification/AldusEHTSharedDataGate.lean. Initial CI #40504070508 FAILED on nested Lean comment opener in source prose; corrected commit 0613c1d9efd2f27c904232faf8f49acac4f74284 changes only comments. Corrected CI #40504567518, job 122190462119 SUCCESS, Lean 4.34.0/Mathlib, 8,945 jobs; five theorems compiled. All explicit #print axioms list propext, Classical.choice, Quot.sound; separate axiom audit skipped. Independent physical model validation NOT CLAIMED. PR closure comment 6442044744.

House publisher issue #739 https://github.com/Satobloc/HsH/issues/739 PUBLISHED_VERIFIED, fixed published file WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-eht-shared-data-covariance-20261027t1224z-s2-001.md, SHA256 99877b9869ea17a5736a6f432f6ba6c865c7aac36f24dc517ad26f572ac90621, exact issue-content vs published-file equality independently read back. P2 #565 comment 6441932891 posted and updated to final CI success. Portable Python source on main WORKSPACES/ALDUS/CODE/aldus_eht_shared_data_covariance_20261027.py blob 77ec54303502ff509bcf568728148e5a38568a65, locally executed equivalent. Parent receipt WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-27T1224Z_s2_aldus.md blob 4cebd7c83d2ad151db8c6dcc8f2710a0b19721c9; verified CI closure WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-27T1224Z_s2_aldus_LEAN_CLOSURE.md blob b18e98d29300c758cde9b117dc128e917b94fad5.

## Calder-specific return cursor
Calder's protected empirical/method QA charter, prior source normalizer sensitivity PR #707 and 08:48Z receipt e1fb7c81e1c762922b90e5b9da1edf38291632dd remain primary. Optional independent audit: test the EHT joint-likelihood/covariance gap and source-to-Lean translation, or investigate whether PR #707 failed theorem remains unproved, without treating Aldus/Mira's shared EHT data as independent confirmations. P1 Nov9, P2 Nov30, P3 Dec14 separate. An actual worldtube/timesheet/medium -> EHT visibility/ring/shadow forward map is still missing. No authentic cross-thread delivery, no worker acknowledgment, no conversation rename, no scheduler modification.
