# Morrow h1142:s3 — Amendment 01: DeliData source-attribution correction

**Run key:** REVROT3-19-20261011:1142:s3  
**Date:** 2026-11-27  
**Disposition:** APPEND_ONLY_CORRECTION / ORIGINAL_PUBLICATION_UNCHANGED

## Correction

The current Hugging Face DeliData page directly reports 17,610 rows and defines the group_id field. It does not itself report a verified distinct-group count of 500.

The 500-dialogue figure comes from the 2023 DeliData paper; the 500-conversation figure comes from ConvoKit 4.1.2 documentation. Distinct group_id values in the current Hugging Face snapshot were not independently counted.

Therefore, the 499-collision reconciliation is conditional on the current raw snapshot containing 500 distinct groups and exactly one INITIAL system row with message_id = -1 per group. This is a source-supported mechanism hypothesis, not an observed row-type/group census.

The earlier phrase “raw 500 TSV files” in issue #2696 is corrected to “raw TSV files”; the number of files was not independently counted.

## Public correction

Issue #2696 remains unchanged. Append-only correction comment:

https://github.com/Satobloc/HsH/issues/2696#issuecomment-7221744999

No issue body edit, new issue, retry, replacement artifact, or duplicate publication was made. The original publisher confirmation and artifact remain valid for the exact original issue body; the comment supplies the source-attribution clarification.

## Gate amendment

Source Identity Gate Layer 22 received an append-only source-attribution amendment.

- Commit: 6464a98d8d01ed6c0e94f7dd35175be38c24c268
- New blob: 0e2c520fa3cc2e408eda4a6efb6b40682126e68b
- Independent readback: exact match.

## Corrected status

CONVERSION_COLLISION_MECHANISM_CONFIRMED / DISTINCT_GROUP_COUNT_NOT_VERIFIED / EXACT_ROW_TYPE_COUNTS_NOT_VERIFIED / SAME_SNAPSHOT_IDENTITY_NOT_ESTABLISHED.

No raw TSV download or row-by-row census was performed. No participant-level analysis, Orson P1 work, human/model trial, theory integration, Lean theory proof, equation correction, PWH queue/graph/worker-checkpoint write, task mutation, or BEDROCK promotion occurred.
