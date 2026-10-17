# Automatic website discovery

The Glass Sausage Factory consumes `PUBLIC_SITE/generated/discovery.json` and its
copied gallery thumbnails. `tools/site_discovery.py` scans both public repositories
on every source push and hourly at :17 UTC. The historical SAT archive is read-only.
The website reads this data without requiring a Sites redeployment; open pages
refresh every five minutes. Workers need not create intake packets.

- SHA changes record additions and revisions. Deleted paths drop from the next
  complete scan; failed repository scans retain last-good records and report stale.
- A rolling 48-item docket refreshes the home page and public notebook. The larger
  catalog remains searchable by title, path, format and bounded text excerpts.
  This is discovery search, **not** a replacement for Mersearch full-text research.
- Source dates inferred from filenames are labelled date hints. Detection times
  are not authorship dates. Inclusion does not change manuscript authority/status.
- Images throughout SAT_VISUALS qualify for generic DAI artwork when the
  EXIF-oriented dimensions are at least 128px and width/height is 0.90–1.10.
  Eligible images are copied as 480px thumbnails; nonsquare files remain excluded
  from generic rotation. Technical figures are not overwritten.
- PRIVATE resources, PRIOR_ART, QUARANTINE and the removed Science Made Stupid
  conversation are excluded. Source identity and hashes remain visible.
- The collector retries network failures, validates source blob hashes, walks
  truncated GitHub trees, and publishes JSON atomically. Errors appear in the feed.

Run: `python tools/site_discovery.py --out PUBLIC_SITE/generated`
Search: `python tools/site_discovery.py --search 'worldtube transport'`
Dependencies: Python 3.12 and Pillow. GITHUB_TOKEN is optional for API quota;
credentials are never emitted in data. The workflow uses its repository token.

Writer verification: the initial scan and generated JSON are validated locally;
inspect the named GitHub Actions run for unattended writer completion. GitHub may
delay scheduled runs. A browser refresh is not the unattended writer.
