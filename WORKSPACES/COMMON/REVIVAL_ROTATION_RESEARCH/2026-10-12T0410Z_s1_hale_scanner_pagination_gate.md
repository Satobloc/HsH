# Hale QC: conditional pagination overlap bias

**Run:** 2026-10-12 04:10 UTC; source-grounded Hale-method session, not original worker participation.

**Primary code:** `HSH_RESOURCES/tools/arxiv_sat_scanner.py` v0.4, blob `ea9dc24dd7f1706b819469c00fd72ab093cba1e2`. The `fetch` loop appends page rows and stops when `start >= total`; the feature-prevalence function counts every row. Neither stage checks unique arXiv IDs.

**Offline experiment:** Six synthetic papers A-F, with C alone positive, two API pages of three records. Stable pages ABC/DEF yield 6 unique records and prevalence 1/6. An overlapping page response ABC/CDE yields 6 fetched rows but only 5 unique IDs and prevalence 2/6. Both report totalResults=6, so the row-count completeness check passes. A two-period comparison of the identical universe would falsely show +16.6667 percentage points. Ten Python assertions passed.

**Limit:** This is a conditional failure-mode demonstration, not evidence that arXiv actually overlaps pages or that Hale's candidate v0.7 behaves this way. A uniqueness check detects but cannot repair missing records. Fail closed on duplicate IDs, rerun stable partitions, compare ID sets, and report coverage before matched-period inference.

**Local fixture:** `hale_v04_page_overlap_fixture.py` SHA-256 `aaff7a0cefa20d2c5ff8dc745228fe3688f632b1cec77237865a93ba346a3c9b`. Results JSON SHA-256 `8c84a57ad0fdf5d69d47e25b5a70e140261ef11f76f53031300b14a18255d7a6`. No network crawl or physical theory claim. External research firewall preserved.
