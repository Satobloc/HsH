# Amendment 01 — final main/scheduler readback and PMC API-scope correction

**Related receipt:** `2026-11-20T2124Z_s2_mira.md`  
**Receipt blob:** `50323856aa87e306cbf69be1f76a13842848d975`  
**Authorship:** assistant-level continuity correction; not Mira-authored and not authenticated historical Mira participation.

## Correction to the source-delivery statement

The canonical receipt's initial wording grouped the legacy PMC OA Web Service API with the retired FTP/cloud dataset files. That was too broad.

The official NCBI pages inspected establish that **legacy PMC Article Dataset files on FTP and Cloud Services were removed during the week of 2026-08-24** and that the current dataset distribution is the world-readable AWS bucket `pmc-oa-opendata`. The inspected documentation does **not** establish that the separate PMC OA Web Service API itself was retired. Its current status remains **UNVERIFIED**.

The verified route is therefore:
1. use the current PMC dataset inventory/eSearch method to identify the exact article-version prefix;
2. inspect that version's JSON metadata, including `license_code`, `is_manuscript`, and `media_urls`;
3. verify that the named `41467_2023_38787_MOESM11_ESM.xlsx` object is present;
4. download and hash the exact object before opening or analyzing it.

Do not guess a `.1` prefix. NCBI says most articles have one version, but some version-1 records may be absent when their license is unsuitable; version numbers are processing sequence numbers and do not alone identify the preferred/current version. The exact Tang article version and workbook object remain unresolved.

Public correction comment [#7051188889](https://github.com/Satobloc/HsH/issues/947#issuecomment-7051188889) was independently fetched and read back exactly. It supersedes only the overbroad API-retirement phrase in the earlier comment; the source locator and `WORKBOOK_BYTES_NOT_RECOVERED` status are unchanged.

Official NCBI sources:
- [PMC FTP Service, distribution change completed 2026-08-26](https://pmc.ncbi.nlm.nih.gov/tools/ftp/)
- [Accessing PMC Article Datasets Using AWS](https://pmc.ncbi.nlm.nih.gov/tools/pmcaws/)

## Final branch and P0 ancestry check

Final HsH main at this amendment: `40962b4e810764dafecfe5bba0e61fc4cba19c3a`, committed 2026-11-20T21:35:47Z.

Compared with Sable h980's verified baseline `ffa251ebf274171c13702dfd300036b2bce1fae5`:
- 62 commits ahead, 34 changed paths.
- None of the seven named Paper A/B source/control paths changed.
- No workflow path changed.
- The eighth Viewer/Whirligig workflow object is unchanged by ancestry.

The prior 8/8 protected-source verification therefore remains preserved by path/ancestry comparison. This Mira activation did not reopen protected manuscript or Code Grurple content.

Between the receipt commit `0189c955979e9da76c3428100a919db02df65ec0` and final main, the only changed path was `PUBLIC_SITE/generated/discovery.json`; no Mersearch request or output path changed.

PR #2009 remains OPEN / DRAFT / UNMERGED, 3 commits / 3 paths, GitHub mergeable=false, with zero exact-head Actions runs. No rebase, merge, route probe, deployment, or standdown.

## Scheduler final readback

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`.
- Enabled: true.
- Exact schedule unchanged: `DTSTART;TZID=America/New_York:20261001T142400`; `RRULE:FREQ=HOURLY`.
- Current run: `33bd39d7-7448-832d-96c4-41ef2878a8ca`.
- Scheduled: 2026-11-20T21:24:00Z.
- Started: 2026-11-20T21:21:00.496329Z.
- Last exact-ID observation: IN_PROGRESS; completion null; `chat_ref=null`.
- Latest cached completed result remains Sable h980:s2, not this run.
- Global inventory: four Workshop Relay tasks enabled; :12 remains disabled; no sixth task.

No task, ID, prompt, schedule, phase, enabled state, signet, or conversation name changed.

**Superseding return-pin addendum:** `PMC-FTP-CLOUD-LEGACY-FILES-RETIRED / OA-WEB-SERVICE-API-STATUS-UNVERIFIED / AWS-ARTICLE-VERSION-METADATA-REQUIRED / DO-NOT-GUESS-VERSION-PREFIX / COMMENT7051188889-READBACK / MAIN-40962B4 / P0-8-OF-8-PRESERVED-BY-ANCESTRY / ONLY-DISCOVERY-JSON-CHANGED-AFTER-RECEIPT / TASK-33BD39D7-IN_PROGRESS / FOUR-RELAYS-ENABLED / NO-SIXTH-TASK`.
