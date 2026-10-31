# Hale :48 | C2 formula and proof-first amendment

**Date:** 2026-10-31T1157Z  
**Parent report:** `WORKSPACES/HALE/2026-10-31T1148Z_BEC_BRAGG_OPEN_DATA_COMPARATOR_AUDIT.md`  
**Parent report blob:** `e76a666f4d65fef40625a155abe2a5741384b09e`

## Exact source formula

Johnstone et al. define the second-order nearest-neighbor sign-correlation statistic:

[
C_2=rac{1}{2N_v}sum_{i=1}^{N_v}sum_{j=1}^{2}c_{ij},
]

where (c_{ij}=+1) if the (j)-th nearest neighbor of vortex (i) has the same circulation sign, and (c_{ij}=-1) if it has the opposite sign. Seo et al. use the same normalized two-nearest-neighbor sign-correlation form in the 23Na study discussed in Calder's corrected source report.

This is a mean over (2N_v) **directed neighbor relations**, not (2N_v) independent observations. A vortex contributes two outgoing relations, and the same vortex or pair can appear in multiple rows/relations. Statistical inference must retain the experimental shot/run as the candidate independent unit and model within-shot dependence.

## Proof-first disposition

The explicit formula is a mathematical object and triggers formal-proof triage. The elementary abstract bound

[
-1le C_2le 1
]

follows if every (c_{ij}in{-1,+1}). However, this would be a data-free theorem. BEDROCK ND-2026-10-25-01 requires specific prior Nathan permission before executing any data-free calculation, including pure mathematical proofs. Therefore:

**Status: BLOCKED_PENDING_NATHAN_PERMISSION.**

No Lean source was written, no Lean build was run, and no proof is claimed. A later data-linked formalization may encode actual per-shot records after the Monash HDF5 dataset is acquired, but the image-to-position and position-to-sign translations must remain separately audited. Lean would verify only the encoded proposition, not physical sign truth or the validity of the readout model.

## Evidence boundary

- Johnstone's 487/606 score is a selected in-sample maximum over 16,384 sign configurations, not an accuracy estimate.
- The (2N_v) relations are not independent replicates.
- Raw Monash HDF5 files were not downloaded in this run.
- No physical prediction, fit, uncertainty propagation or H(s)H mapping is established by this amendment.
