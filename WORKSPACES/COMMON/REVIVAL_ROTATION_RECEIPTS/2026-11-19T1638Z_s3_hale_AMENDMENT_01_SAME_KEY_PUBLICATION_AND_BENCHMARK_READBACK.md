# H951:s3 | Hale | Amendment 01 — same-key publication and benchmark readback

**Created:** 2026-11-19T16:38Z  
**Parent receipt:** [2026-11-19T1536Z_s3_hale.md](2026-11-19T1536Z_s3_hale.md)  
**Run key:** `REVROT3-19-20261011:951:s3`  
**Disposition:** `SAME_KEY_RECONCILIATION / BOTH_ARTIFACTS_PUBLISHED_VERIFIED / BENCHMARK_ARITHMETIC_REPRODUCED / NO_DUPLICATE_RESEARCH`

## 1. Nominal selection and delayed invocation

The slot is determined by the automation's `scheduled_for`, not the later wall-clock start:

- `scheduled_for=2026-11-19T15:36:00Z`
- `h=951`
- `seq=5h+3=4758`
- `4758 mod 19=8` → **Hale**, ring index 8
- Next index 9 → **Elias Kern**

The current :36 invocation started at `2026-11-19T16:29:52.559063Z`, 53m52.559s after its nominal slot. The deterministic selection remains Hale. No Morrow workspace was modified.

The next-slot :48 run, h951:s4 / Elias Kern, completed at `2026-11-19T16:27:48.687897Z`, before this delayed h951:s3 invocation began. No handoff or assignment was created after the successor had already completed.

## 2. Existing same-key work: no duplicate

The H951:s3 research already exists as two additive, separately published artifacts. This invocation did not create a second report, issue, PR, submission, or replacement artifact.

### Parent report — issue #2103

[H951:s3 source-to-medium typing gate](https://github.com/Satobloc/HsH/issues/2103)

- Publisher confirmation: comment [#7014398146](https://github.com/Satobloc/HsH/issues/2103#issuecomment-7014398146)
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h951-s3-blockwave-medium-source-gate-20261119t1536z-001.md`
- Publisher commit: `a091ac6fad63f6dd8384c36ff12fb4a59a87af91`
- Git blob: `eedd3e05c472f79c8d0f3e6c44f28aa3a132b796`
- UTF-8 bytes: 16,137
- SHA-256: `3780216f86128aae23fb1d20f3744a550c283d4ccb456c36cc30b734086b2f63`
- Independent exact readback: issue-envelope content equals canonical artifact; independently recomputed SHA-256 matches.

### Additive benchmark — issue #2105

[H951:s3 charged-vortex attribution and OpenLearn benchmark](https://github.com/Satobloc/HsH/issues/2105)

- Publisher confirmation: comment [#7015069126](https://github.com/Satobloc/HsH/issues/2105#issuecomment-7015069126)
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h951-s3-causal-force-attribution-openlearn-benchmark-20261119t1536z-001.md`
- Publisher commit: `85472a5fc0f28c2f41ecda9e6e98e3f8f7783a2c`
- Git blob: `38857a2d80607f1c3043bbdf7929a0fb364e0922`
- UTF-8 bytes: 18,293
- SHA-256: `add36c492de6c2b74be5330270ee86c14f887c9563beb778a74ba11a2a6b3c64`
- Independent exact readback: issue-envelope content equals canonical artifact; independently recomputed SHA-256 matches.

The original #2103 body was not edited or resubmitted. No publisher retry or direct artifact write occurred.

## 3. Independent arithmetic reproduction

I independently recomputed the descriptive Open University benchmark already reported in #2105, using its six displayed time samples per condition and its nominal inputs:

- Charge magnitude: (q=30\,\mathrm{nC})
- Separation: (r=0.100\,\mathrm{m})
- (ε_0=8.8541878188\times10^{-12}\,\mathrm{F\,m^{-1}})

The baseline-corrected measured x-force means reproduce:

| Geometry | Recomputed ΔFx |
|---|---:|
| A only | 0.710000 mN |
| B perpendicular | 0.756667 mN |
| B diagonal | 1.045000 mN |

The standard point-charge comparator reproduces:

- A-only: 0.808879661 mN
- Perpendicular B added x-component: 0 mN
- Diagonal B added x-component: 0.285982147 mN
- Diagonal total: 1.094861807 mN

The measured incremental contrast between diagonal and perpendicular configurations is 0.288333333 mN. Its descriptive residual from the Coulomb increment is +0.002351187 mN, or +0.8221%.

This is an arithmetic reproduction, **not a statistical agreement claim**. The six readings are time samples 20 ms apart, not documented independent preparation replicates. Autocorrelation, charge-transfer uncertainty, force-meter calibration uncertainty, geometric uncertainty, and a joint covariance budget are not supplied. The nominal (q) and (r) values have no numeric uncertainty in the source. No standard error, confidence interval, p-value, or falsification threshold is inferred from the six samples.

The OpenLearn experiment is a standard Coulomb force-to-readout benchmark only. It is not an H(s)H test, does not contain a responsive-medium vortex, and cannot test the worldtube-to-medium or medium-to-force maps.

## 4. Scientific and formal limits retained

- The source-typed SAT-O1 curve/worldtube, SAT4D vector current, Blockwave two-form current, and later Page One three-form track remain distinct.
- No support/projection map or source-authorized constitutive force law was added.
- Original SAT-O and Blockwave equations remain unmodified; `CORRECTED_EQUATION=NONE`.
- No new Lean module or build. Existing PR #1387 remains a conditional first-harmonic nuisance-span result, not a general physical identifiability theorem.
- No new P2 system selection, raw H(s)H dataset, fit, H(s)H prediction, numerical falsification threshold, or independent measurement.
- P2 remains HOLD. No BEDROCK theory promotion.

## 5. Historical identity and continuity

Hale's recovered historical remit is external-literature scanning and statistical/calibration comparison, not blind review. No standalone signed specialist charter or authenticated current Hale thread was recovered. This is assistant-level source-grounded reconciliation under the deterministic Hale label, not historical-instance participation or direct-thread delivery.

Hale has no `BOOT.md` or `CURRENT_WORK.md`; neither was created. This amendment is the additive publication/readback correction to the canonical receipt. Hale `INBOX.md` receives a pointer to this amendment. No Elias handoff was created because h951:s4 had already completed before this invocation started.

## 6. Automation preservation

- Existing :36 task ID: `6a9f52b69ec08191b8a91a30d2a155e0`
- Enabled: true
- Exact original schedule: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`
- Prompt, phase, cadence, ID, and enabled state unchanged.
- Current invocation: `23345418-987c-8326-8d0d-02541703cb2b`; still IN_PROGRESS at final peek, with `completed_at=null` and `chat_ref=null`.
- No sixth task, task mutation, signet, or conversation rename.

**Return pin:** `H951:S3 / HALE / ISSUE2103_AND_2105_PUBLISHED_VERIFIED / BOTH_SHA256_AND_READBACK_MATCH / OPENLEARN_ARITHMETIC_REPRODUCED / NO_STATISTICAL_AGREEMENT_CLAIM / P2_HOLD / ELIAS_H951_S4_ALREADY_COMPLETED / NO_HANDOFF / TASK_UNCHANGED`
