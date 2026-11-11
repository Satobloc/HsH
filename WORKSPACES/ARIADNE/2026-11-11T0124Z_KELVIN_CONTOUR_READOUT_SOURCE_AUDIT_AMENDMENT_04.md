# Amendment 04 — source-modal separation gate and scheduler re-entry

**Parent run key:** `REVROT3-19-20261011:745:s2`  
**Worker label:** Ariadne; successor Alberr. Source-grounded reconstruction only; no authenticated current Ariadne thread.

## 1. Primary-source clarification: the paper's mode-selection claim

The author-hosted version-of-record PDF for Barckicke, Falcon & Gissinger, *Nature Physics* 22 (2026), DOI `10.1038/s41567-026-03175-w`, was reread at Methods lines 236–237 and the associated Fig. 3/Fig. 4 discussion.

The Methods explicitly state that the left-hand and right-hand profiles each contain every mode (m), and that combining them into vortex-core position η and radius (a) selects respectively (m=1) and the other reported modes (m=0,2,3,…). The article separately identifies the (m=1) bending branch in the position spectrum and the (m=2) flattening branch in the radius spectrum, with two orthogonal cameras providing additional evidence for the (m=1) interpretation.

This source-specific modal-selection statement is **not contradicted** by the existing Lean theorem that two-angle sampling is non-injective on arbitrary angular profiles. The latter quantifies over unrestricted functions; the article's mode-selection statement concerns its restricted physical/modal readout. The two-sample coordinate change ((r_0,r_π)leftrightarrow(a,η)) is invertible, while arbitrary-profile reconstruction from only two samples remains non-unique.

## 2. Additive conditional Lean formalization

The existing Ariadne PR #790 branch was extended in place; no new branch or PR was created.

- Branch: `research/ariadne-primary-role-transclusion-20261027t1924z`
- New head: `55ecec5ce488d0413d21eb17b15e1e3db073f933`
- Module: `FORMAL_VERIFICATION/HsHVerification/AriadneAntipodalContourReadout.lean`
- New module blob: `a30958b05c928df3e0fd80e15adc56e976c8e2b9`
- Actions run: #42942891919, job #130268685736.

The additive declarations make a sufficient modal-separation condition explicit:

1. The distinguished target mode has normalized opposite samples, (b_1(θ_0)-b_1(θ_π)=2).
2. Every other included mode has equal samples at the two readout positions.
3. Under those assumptions, the finite half-difference readout returns exactly the target coefficient.
4. The target's antisymmetric contribution vanishes in the mean/radius channel.

**These are explicit assumptions, not a derivation of the physical mode shapes.** The paper's source statement does not, by itself, establish that these basis identities follow from the Euler/Rankine model or from the raw acquisition. That remains a separate source/geometric obligation.

At the latest Actions readback, the exact-PR-head checkout assertion had passed, but Lake dependency-manifest generation was still IN_PROGRESS and the Lean compile step had not started. Status: **SUBMITTED_NOT_VERIFIED**. The previous exact-head success on head `6214aa0...` does not transfer to this new head. Do not claim the new theorems compiled until the new run completes and its full log/axiom reports are inspected.

## 3. Scheduler observation

The existing :24 task remains task ID `6abda4c8eda88191bf23a6f2849e9a17`, enabled, with its original hourly America/New_York :24 VEVENT and unchanged prompt.

The same run ID `6572f045-40f0-832e-abfd-6c0841fabf26` is now reported with a different start-time field:

| Source | Start |
|---|---|
| h745 canonical report/receipt snapshot | `2026-11-11T01:27:46.449752Z` |
| Latest exact-ID task peek | `2026-11-11T01:55:03.490974Z` |

Difference: **27m17.041222s**. The run remains IN_PROGRESS, with no completion timestamp and `chat_ref=null`. Its cached latest result remains the preceding h744 Ravel run `cb1b32e9-e2d4-8323-99a9-b2fdf0a573c6`, completed at 01:02:24.788627Z. Task-level `last_run_time` and `updated_at` remain stale at approximately 01:02:26Z / 01:02:50Z.

The :36 task's h744:s3 run `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0`, previously observed FAILED then IN_PROGRESS after a same-ID start mutation, is now recorded COMPLETED at 01:55:18.520268Z. The latest :36 run record still identifies h744:s3; h745:s3 was not visible at that read. Do not infer that h745:s3 was skipped or that the h744 status reversal has a known backend cause.

The October 26/November 5 steering controls say :12 remains disabled. Therefore no h745:s1 Aster predecessor handoff is expected; no missed-check-in increment is appropriate.

No retry, restart, duplicate, worker identity, liveness, or causal backend claim is made. No task, ID, prompt, schedule, phase, cadence, enabled state, or automation count was changed.

## 4. P0, campaign, and physical evidence

The eight protected Code Grurple files were fetched again: **8/8 exact blob matches**. Reconstructed route-vector SHA-256 remains:

`833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`

Main-branch comparison from h745 report snapshot `41439cc0ad17d60954eb9ffca580d5f494e4f4a0` to `bf901bfe129a60033e2bead00bfc533e01a62f6d` is 32 commits ahead, zero behind; no protected P0 route/source file changed. Both reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`; no live route probe or standdown.

Campaign remains P0 ACTIVE; P1 November 9 OVERDUE / NOT READY / Orson-owned; P2 November 30 HOLD; P3 December 14 INCOMPLETE.

The air–water vortex remains a candidate, not a selected P2 system. Figshare DOI `10.6084/m9.figshare.30903347` is identified by the article, but file inventory/version/checksums, raw acquisition files, joint covariance and independent holdout remain unrecovered. No physical calculation, fit, independent prediction, CODATA comparison, P2 selection, equation change, BEDROCK promotion or theory promotion occurred.

**Disposition:** additive source/proof and scheduler observation only. The PR remains OPEN / DRAFT / UNMERGED; independent review remains outstanding.