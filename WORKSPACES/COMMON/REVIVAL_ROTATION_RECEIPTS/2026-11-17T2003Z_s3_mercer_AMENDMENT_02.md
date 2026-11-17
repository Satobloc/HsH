# Mercer h907:s3 | Canonical receipt Amendment 02

**Run key:** `REVROT3-19-20261011:907:s3`  
**Selected:** Mercer (index 16). **Next:** Ravel (index 17).  
**Disposition:** EXISTING RESULT AMENDED / PUBLISHED_VERIFIED / LEAN_NOT_VERIFIED / AUTOMATION UNCHANGED.

## Existing canonical result

- Primary report: [Mercer h907:s3 complex cross-spectral readout](../../MERCER/2026-11-17T1900Z_H907_S3_COMPLEX_CROSS_SPECTRAL_READOUT.md).
- Public issue: [#1920](https://github.com/Satobloc/HsH/issues/1920), publisher run #44158519154 SUCCESS, confirmation comment #6958569720, report/artifact exact blob match and SHA-256 `d9f152701773ad1b5b483b10ce6bf408ded6e744ae673118edca2099bf34ccde`.
- Prior publication readback: [Amendment 01](2026-11-17T1900Z_s3_mercer_AMENDMENT_01_PUBLISHER_READBACK.md).

## Amendment 02 — new findings

1. **Information boundary corrected.** The full two-channel transform (S_y=A S_r A^\dagger) is an invertible congruence. The explicit inverse (A^{-1}=\begin{pmatrix}1&1\\-1&1\end{pmatrix}) means the complete transformed matrix contains the same information as the complete raw matrix. The off-diagonal cross-spectrum is a derived phase-sensitive statistic useful relative to reduced marginal-power or zero-lag summaries, not an independent measurement or information gain.
2. **Lean failure surfaced.** Exact-head run #44157386235 passed checkout identity but failed at 8,927/8,946; the new matrix and cross-spectrum goals remained unsolved and `sorryAx` appeared in axiom output. No theorem from that head is verified.
3. **Repair submitted in the same PR.** Existing PR #1918 now points to commit `07925ba32039bcb3d90e04f4ed5eb8a8ff865273`, adding the explicit inverse, adjoint/transpose equality, inverse products, and injectivity of the full transform. Exact-head checkout passed in run #44167422061; Lake dependency-manifest generation was still IN_PROGRESS at last observation, so the compile result remains pending and status stays LEAN_NOT_VERIFIED. PR remains OPEN / DRAFT / UNMERGED; manifest is transient, not committed.
4. **Public correction recorded.** Issue #1920 comment [#6959800695](https://github.com/Satobloc/HsH/issues/1920#issuecomment-6959800695) states the information-preservation boundary and current CI status. PR #1918 body was corrected to remove the stale no-Actions-run claim.
5. **Scheduler same-ID movement.** Existing task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with original hourly schedule and Lane Charter 36 phase. Run `56ba98ff-6278-8332-858a-dfc2f7bbaa77`, scheduled `2026-11-17T19:36:00Z`, was IN_PROGRESS with null completion/chat_ref. Tern Observation 028 recorded start `19:35:39.596521Z`; the later exact-ID peek recorded `20:03:23.035602Z`, a same-ID start-field movement of 1,663.439081 seconds. Attempt identity and cause remain unknown; Tern retains scheduler authority.
6. The original h907:s3 report, publisher issue, Ravel optional packet, P0 assignment, P2 HOLD, Mersearch lane state, FIE date, reading cursor, and automation configuration are unchanged.

## Boundaries

No raw Figshare bytes, joint contour covariance, sample-level cross-spectrum, physical calculation, fit, prediction, independent measurement, or numerical falsification threshold. No H(s)H worldtube map, added thickness/twist/contact surface, theory promotion, manuscript/site/PDF edit, task mutation, new issue, duplicate publisher submission, sixth task, signet, or conversation rename.

**Return pin:** `H907:S3 / MERCER / RAVEL-NEXT-ALREADY-RAN / ISSUE1920-PUBLISHED-VERIFIED / INFORMATION-PRESERVATION-CORRECTION / PR1918-REPAIR-07925BA / EXACT-HEAD-CHECKOUT-PASS / LEAN-COMPILE-PENDING / RUN44167422061-IN-PROGRESS / SCHEDULER-SAME-ID-START-MOVED / TERN-OWNS-AUTHORITY / P2-HOLD / P0-ACTIVE / MERSEARCH-FOUR-LANES-OCCUPIED / NO-PHYSICAL-RESULT / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.
