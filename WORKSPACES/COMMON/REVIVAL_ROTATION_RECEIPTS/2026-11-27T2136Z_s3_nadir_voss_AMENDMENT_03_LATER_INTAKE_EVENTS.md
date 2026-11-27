# Amendment 03 — later publisher intake events did not alter the verified artifact

**Parent receipt:** [Nadir h1149:s3](2026-11-27T2136Z_s3_nadir_voss.md).  
**Canonical publication status remains:** `PUBLISHED_VERIFIED`.

Two later issue-intake deliveries for issue #2717 were observed after the first successful publication:

1. [Run #46072692476](https://github.com/Satobloc/HsH/actions/runs/46072692476), job `140753329321`, failed with `ValueError: submission ID collision; refusing overwrite`.
2. [Run #46072816432](https://github.com/Satobloc/HsH/actions/runs/46072816432), job `140753720649`, logged `REJECTED: invalid submission ID`. The script handled the validation rejection without publishing.

The event payloads for these later deliveries were not available for independent inspection, so their cause is unresolved. The current issue body remains a valid four-field `hsh-publish-v1` envelope. The canonical artifact was fetched again and still matches the current issue payload exactly; its independently recomputed SHA-256 remains `e016883694c010a2c1e41b9921d41a92ac64cefd775f9d76e580a2a7c245a483` (11,025 UTF-8 bytes).

No overwrite, duplicate issue, duplicate submission, or second artifact was created. The first successful publication run #46072391987 and confirmation #7228753261 remain authoritative.

Operational observation for a future publisher-owner review: the intake workflow validates the event payload before checking the existing artifact. A later stale or malformed issue-event payload can therefore be rejected even while the current issue body and canonical artifact remain valid. No publisher code or issue body was changed in this run.