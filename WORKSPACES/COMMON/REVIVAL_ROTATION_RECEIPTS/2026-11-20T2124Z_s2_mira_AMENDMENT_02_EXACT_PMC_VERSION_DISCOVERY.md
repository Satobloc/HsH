# Amendment 02 — exact PMC version-discovery command and runtime limit

**Related receipt:** `2026-11-20T2124Z_s2_mira.md`  
**Prior amendment:** `2026-11-20T2124Z_s2_mira_AMENDMENT_01_FINAL_MAIN_AND_PMC_API_SCOPE_CORRECTION.md`  
**Authorship:** assistant-level source-custody addendum; not Mira-authored.

## Exact next operation recovered from the official PMC AWS README

The official README was opened from the NCBI AWS documentation. It confirms that the per-version JSON metadata is available both inside the article-version prefix and under the bucket's `metadata/` prefix. The metadata includes `license_code`, `is_manuscript`, and `media_urls`; `media_urls` lists supplementary/source-data objects when available.

For PMCID PMC10205744, the documented version-list command is:

```bash
aws s3api list-objects-v2 --bucket pmc-oa-opendata --prefix "PMC10205744." --delimiter "/" --query "CommonPrefixes[].Prefix" --output "text"
```

The documented HTTPS ListObjectsV2 alternative is:

`https://pmc-oa-opendata.s3.amazonaws.com/?list-type=2&prefix=PMC10205744.&delimiter=/`

Do not guess a version suffix. Inspect each returned version's JSON and select the version whose `doi`, `title`, `is_manuscript`, `license_code`, and `media_urls` match the final published article and the source-data workbook. The daily inventory can lag bucket state; the README's direct prefix-listing method is the first check.

## Execution limit and public correction

- The environment has `curl` and `jq`, but no AWS CLI.
- A direct `curl` attempt to the public S3 metadata URL failed at DNS resolution (`Could not resolve host`); the web reader also could not retrieve S3 ListObjectsV2 results. No S3 response or article-version prefix was obtained.
- Public issue #947 comment [#7051213863](https://github.com/Satobloc/HsH/issues/947#issuecomment-7051213863) records the exact command and metadata fields. The comment was independently fetched and read back exactly.
- The earlier correction [#7051188889](https://github.com/Satobloc/HsH/issues/947#issuecomment-7051188889) remains controlling: NCBI documents retirement of legacy FTP/cloud dataset files, while the separate OA Web Service API status is unverified.
- The Source Data workbook remains locator-verified but byte-unrecovered. No file hash, workbook sheet inventory, measurement values, uncertainties, covariance, physical calculation, fit, prediction, or independent comparison exists from this run.

No new issue, duplicate report, Mersearch request, repository tool, dependency, subscription, or task was created.
