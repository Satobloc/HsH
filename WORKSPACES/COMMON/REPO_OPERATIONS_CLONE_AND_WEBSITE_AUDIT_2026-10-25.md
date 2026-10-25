# Repository operations, open issues, branches, and self-clone mechanism audit

**Date: 2026-10-25.** Scope: present main branches, GitHub open issues, all 57 current YAML Actions definitions across three repos, branch comparisons, recorded clone ledger, and immediate website changes. Not an exhaustive "every process ever run" historical event reconstruction. This is an audit of live file inventories and selected historical evidence; no branch/issue cleanup was undertaken.

## Open issue explanation

| Repo | Open issues and PRs | Observed population |
|---|---:|---|
| HsH | 423 including 3 PRs | 366 titles with prefix `[HSH-PUBLISH-V1]`; 2 lowercase `[hsh-publish]`; many relay handoffs, hostile reviews, infrastructure and open PRs |
| SAT historical archive | 2 including 2 PRs | FLC website reconstruction and sandbox |
| HSH_RESOURCES | 6 | Six hostile review assignments |

**Root cause of hundreds of issues:** HsH `tools/issue_publish.py` and `.github/workflows/issue-publisher.yml` use GitHub issues as an owner-authenticated publication ingress. Validated submissions are written into `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/` and receive a readback-verified comment. The publisher **does not close** successful issues. The open number reflects publication intake and handoffs, not hundreds of distinct bugs. Check receipts before treating any particular issue as completed. Do not mass-close blindly.

## Git branches: 23 named heads across all three repos

GitHub `compare_commits(main...branch)` was invoked on every non-main branch. Ahead/behind counts are an inspection snapshot. A Git branch is a pointer to a commit history, **not** a bot, server instance, GitHub Traffic clone or autonomous model copy.

### HsH (12 branches, 11 non-main)

| Branch | Ahead | Behind | Interpretation |
|---|---:|---:|---|
| `codex/eq0014-alberr-20261024` | 1 | 134 | formal verification |
| `codex/eq0015-elias-20261024` | 39 | 323 | formal verification |
| `conversation-json-content-detection-20261009` | 25 | 2440 | Viewer development |
| `conversation-json-content-ready-20261009` | 11 | 2439 | Viewer development |
| `infra/lean4-verification-20261023` | 25 | 323 | formal verification |
| `mercer-kerr-er-slab-corpus-20261009` | 10 | 2424 | separate historical/experimental changes |
| `mersearch-chronology-20261007` | 160 | 1014 | search engine development |
| `mersearch-stable-1.0` | 0 | 4348 | fully behind main |
| `sandbox/morrow-kestrel-playground-2026-10-01` | 7 | 3392 | separate historical/experimental changes |
| `tagger-indexing-broad-remit-20260913` | 7 | 5724 | separate historical/experimental changes |
| `tmp-noop` | 1 | 5803 | separate historical/experimental changes |

### Historical SAT (6 branches, 5 non-main)

| Branch | Ahead | Behind |
|---|---:|---:|
| `Satobloc-PUBLIC-SANDBOX_open` | 1 | 35 |
| `archive-pre-2026-09-01-license-change` | 0 | 605 |
| `codex/flc-reconstruction-feed` | 8 | 132 |
| `replace/Carroll-to-redacted` | 1 | 829 |
| `replace/redact-Carroll-to-redacted` | 2 | 823 |

### HSH_RESOURCES (5 branches, 4 non-main)

All four non-main branches are already **behind** main with zero unique commits (behind 284, 612, 349 and 346 respectively), representing historical working/review snapshots. Their internal paths and direct links are omitted from this public report to respect its documented reference/source boundary. Branch deletion is **not** authorized and was not performed.

## Current Actions workflow inventory: 57 YAML files

**57 workflow files is the current main-branch inventory, not the cumulative history of all historical programs.** GitHub Actions may provision ephemeral runners, use `actions/checkout` (often multiple repositories), and create commits. Their execution cannot automatically be equated with a GitHub Traffic full-clone event.

### HsH (37)

| Workflow source | Operation family |
|---|---|
| [`append-provenance-reasoning-batch.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/append-provenance-reasoning-batch.yml) | source normalization, index, tags or provenance workflow |
| [`arxiv-random-sample.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/arxiv-random-sample.yml) | miscellaneous CI / source audit / maintenance |
| [`audit-old-archive-access.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/audit-old-archive-access.yml) | miscellaneous CI / source audit / maintenance |
| [`build-conversation-viewer.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/build-conversation-viewer.yml) | push/hourly -> cross-repo Viewer discovery/build |
| [`build-keyword-bucket.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/build-keyword-bucket.yml) | source normalization, index, tags or provenance workflow |
| [`build-public-library.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/build-public-library.yml) | miscellaneous CI / source audit / maintenance |
| [`build-visual-catalog.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/build-visual-catalog.yml) | generated site, papers, visual/rotating assets |
| [`conversation-json-content-ci.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/conversation-json-content-ci.yml) | miscellaneous CI / source audit / maintenance |
| [`date-tag-all-conversations.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/date-tag-all-conversations.yml) | six-hourly date indexing |
| [`deploy-conversation-viewer-pages.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/deploy-conversation-viewer-pages.yml) | GitHub Pages deployment |
| [`extract-ravel-window.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/extract-ravel-window.yml) | source normalization, index, tags or provenance workflow |
| [`extract-raw-window.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/extract-raw-window.yml) | source normalization, index, tags or provenance workflow |
| [`harvest-priority-vocabulary.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/harvest-priority-vocabulary.yml) | source normalization, index, tags or provenance workflow |
| [`issue-publisher.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/issue-publisher.yml) | owner-authored issue -> validation, commit, receipt |
| [`layered-nathan-autotag.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/layered-nathan-autotag.yml) | source normalization, index, tags or provenance workflow |
| [`maintain-navigation.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/maintain-navigation.yml) | source normalization, index, tags or provenance workflow |
| [`mercer-cross-source-integrity.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mercer-cross-source-integrity.yml) | source search/index QA |
| [`mercer-searcher-1-0.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mercer-searcher-1-0.yml) | source search/index QA |
| [`mercer-unfiled-corpus-audit.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mercer-unfiled-corpus-audit.yml) | source search/index QA |
| [`mercer-validator-repair-once.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mercer-validator-repair-once.yml) | source search/index QA |
| [`merge-verified-batches.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/merge-verified-batches.yml) | miscellaneous CI / source audit / maintenance |
| [`mersearch-1-1-index.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-1-1-index.yml) | source search/index QA |
| [`mersearch-receipt-backfill.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-receipt-backfill.yml) | source search/index QA |
| [`mersearch-request-bridge-lane-2.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-request-bridge-lane-2.yml) | three-repo Mersearch request lane -> cross-checkouts and result publication |
| [`mersearch-request-bridge-lane-3.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-request-bridge-lane-3.yml) | three-repo Mersearch request lane -> cross-checkouts and result publication |
| [`mersearch-request-bridge-lane-4.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-request-bridge-lane-4.yml) | three-repo Mersearch request lane -> cross-checkouts and result publication |
| [`mersearch-request-bridge.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-request-bridge.yml) | three-repo Mersearch request lane -> cross-checkouts and result publication |
| [`provenance-reasoning-scan.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/provenance-reasoning-scan.yml) | source normalization, index, tags or provenance workflow |
| [`provenance-window-ravel.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/provenance-window-ravel.yml) | source normalization, index, tags or provenance workflow |
| [`publish-paper-series.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/publish-paper-series.yml) | generated site, papers, visual/rotating assets |
| [`refresh-site-discovery.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/refresh-site-discovery.yml) | generated site, papers, visual/rotating assets |
| [`rotate-featured.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/rotate-featured.yml) | generated site, papers, visual/rotating assets |
| [`sat-candidate-analysis-sample.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/sat-candidate-analysis-sample.yml) | miscellaneous CI / source audit / maintenance |
| [`sat-candidate-analysis.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/sat-candidate-analysis.yml) | miscellaneous CI / source audit / maintenance |
| [`superset-conversation-duplicate-scan.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/superset-conversation-duplicate-scan.yml) | source normalization, index, tags or provenance workflow |
| [`sync-old-archive-state.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/sync-old-archive-state.yml) | miscellaneous CI / source audit / maintenance |
| [`visual-archaeology-cycle.yml`](https://github.com/Satobloc/HsH/blob/main/.github/workflows/visual-archaeology-cycle.yml) | generated site, papers, visual/rotating assets |

### SAT original archive (10)

`archive-admin.yml`, `build-archive-structure.yml`, `combine-text-folder.yml`, `extract-nathan-corpus.yml`, `extract-pdf-text.yml`, `flc-auto-digitize-test.yml`, `flc-story-feed.yml`, `full-archive-index.yml`, `index_folder.yml`, `tag-sat-mentions.yml`.

These cover Archive Admin, PDF/text extraction, folder merges, Nathan corpus extraction, SAT-mention tagging, archive indexing, FLC digitization and feed publication. Trigger classes found include push, dispatch and scheduled indexing.

### HSH_RESOURCES (10)

Ten workflows run bibliography/paper extraction, evidence inventory, external-science sampling, audience/podcast analysis and related derived-resource updates. Internal file paths are omitted from this public report, following the repository's stated private-reference boundary.

GitHub API currently reports **8,650 HsH**, **1,092 SAT** and **790 HSH_RESOURCES** workflow-run records. They are *Actions runs*, not full-clone counts, and not necessarily a complete historical inventory of removed/out-of-retention programs.

## Candidate self-generated clone mechanisms

| Process | Concrete evidence / how it might appear | Classify as GitHub Traffic full clone? |
|---|---|---|
| A fresh Codex/cloud/Git client runs actual `git clone` | Fresh repo workspace could resemble external automated traffic; requires run/provisioning log with mechanism and target | **POSSIBLE; not confirmed from these workflows** |
| GitHub Actions `actions/checkout` | Widespread use; some cross-repository and scheduled. May provision a working tree on a machine not belonging to the user's computer | **UNKNOWN whether counted by Traffic. Do not assume.** |
| Sites editor/deployment/hosted build | Website frontend and repo backend have separate publishing systems; provider might download or checkout repository content | **UNKNOWN pending Sites/editor/build provenance** |
| GitHub connector and Contents REST API, GitHub code search | Extensively used by project assistants, including present work | **NOT a Git clone by itself** |
| `git fetch` or `git pull` in existing checkout | Used in safe writer fresh-base publish pattern | **NOT automatically a new full clone** |
| Archive ZIP/raw HTTP/browser access | Viewer and archive web browsing | **NOT demonstrated to be full clone** |
| Issue-publisher Actions | Owner issue triggers checkout, validated write and comment | **Issue/commit doesn't certify full clone** |
| Hourly ChatGPT Revival Relay (5 leases, 19 personas) | Recreates/continues *agent work identities* using archived conversation states | **Different meaning of 'clone'; does NOT itself imply copying repository** |

Existing ground-truth project controls: [clone mechanism standards](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md), [clone event ledger](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CLONE_LEDGER.jsonl), [historical sample-date forensic audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CLONE_FORENSICS_SAMPLE_DATE_RECON_2026-09-23.md), [revival relay provenance standard](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_RELAY_THREAD_FIRST_RULE_2026-10-11.md).

The ledger contains **9 reconstructed self-mechanism events: 8 CONFIRMED NOT A FULL CLONE; 1 POSSIBLE FULL CLONE / MECHANISM UNKNOWN; 0 confirmed full clones**. On May 31, 2026, a user-reported ~282 full-clone SAT traffic count and on Sept 7 ~205 HsH clones were not matched by this bounded historical study to known self-clones. This is not evidence that all other hits were necessarily external or malicious. Identifying an operation from a GitHub Analytics full-clone counter requires independently retained mechanism/actor/date evidence. Traffic windows and Actions logs expire.

**Forensically useful next controls:** record actual clone commands or checkout provenance, timestamp/actor, environment ID, runner job and run IDs, provider setup logs and whether traffic would be counted. Correlate each traffic day with Actions runs, Site deployments, Codex workspaces and Git activity. Classify unknown honestly, never subtract inferred clone events or claim unique external identities without evidence.

## Website and repository editing capability

**Actual repository writes:**
- Original Mercer Viewer source (`CONVERSATION_VIEWER/index.html`, `viewer.js`, `catalog_body_search.js`): default global message search, modes, slowed assistant Typealong, deep-link query preservation; committed/readback verified.
- Public candidate search at `CONVERSATION_VIEWER/mersearch/` with Boolean and approximate math-symbol mode over the approved public message index, with GitHub Pages deploy workflow including this nested route. This is **not** the real full cross-repository protected Mersearch math engine.
- `PUBLIC_SITE/WEBSITE_INTEGRATION_ROUTES.json` for Sites importing; `PUBLIC_SITE/OWNER_CURATION_PUBLIC_SCHEMA.json` and empty public-only `OWNER_CURATION_PUBLIC.json`.
- Detailed Sites handoff `PUBLIC_SITE/build_suggestions/2026-10-25__SITES_EDITOR__MERCER_VIEWER_MERSEARCH_OWNER_CURATION.md`, including owner-only authentication acceptance tests.

**Actual deployment:** GitHub Actions `Deploy conversation viewer to GitHub Pages` run [40161594814](https://github.com/Satobloc/HsH/actions/runs/40161594814) returned completed/success. No independently browser-verified live interface interaction was possible this turn; **GitHub Pages** and **chatgpt.site** are different publishers.

**Not done:** publish to `glass-sausage-factory.nathanmcknight.chatgpt.site` (no Sites publisher in current tool set); secure Sites owner authentication and server database; per-file authenticated inline annotations; protected full Mersearch engine with NEAR/math/source-level identity; GitHub branch cleanup/issue closure; full historic clone attribution.

**Exposure warning:** GitHub repository API reports `HSH_RESOURCES` `private:false`, `visibility:public`, contradicting repo documentation. Owner should inspect GitHub repository Settings/access history. No private/source resources were imported into website public search by this work. Treat it as a source-exposure boundary until resolved.

**Known QA complications:** Current main `tools/search_archive_content.py` says `TOOL_VERSION=1.1-dev`, while controlling worker Mersearch instructions pin branch `mersearch-stable-1.0`; owner/server should pin tested version and label it. Repeated Actions `conversation-json-content-ci.yml` runs show failure with no job summaries. Multiple rapid commits cancel lower-priority queued jobs; latest viewer Pages run nevertheless succeeded. The static beta returns candidate *conversation-level* matches, not per-message mathematical/proximity proof.

## Immediate safe-next decisions

1. Inventory publisher issue receipts and statuses before auto-closing anything. 
2. Protect all active PR and divergent branches; behind-only branches can be reviewed for archive retention but do not delete automatically.
3. Complete Sites editor deployment from the durable prompt, then verify source-linked search and original Viewer in browser.
4. Build trusted owner-only admin curation API with strict identity checks, revisions, comment privacy and public-safe projection.
5. Preserve per-run clone provenance and actual checkout mechanism. Do not treat named AI workers or recurring sessions as network cloners.

**Method:** GitHub REST tree/branch compare/issues API and 57 current workflow source inspections, actions latest run API, existing clone ledger and controls. Inventory includes current files and named historical mechanisms but does not claim to encompass deleted, inaccessible or external service histories.


## 2026-10-25 addendum: independently reported experiments on CI-generated clones

**Important refinement to the "UNKNOWN whether counted" entries above.** A public experimental report by GitHub Traffic Tracker, [How GitHub Counts CI Clones](https://github.com/djdarcy/github-traffic-tracker/blob/main/docs/ci-clone-research.md), describes **14 controlled tests over 22 days during February–March 2026** using a private test repository. Its reported observations:

- One `actions/checkout` yielded one clone in GitHub's traffic API; two checkouts in a job yielded two; nine matrix-job checkouts yielded nine.
- Multiple checkout actions using the default `GITHUB_TOKEN` were one *unique cloner* per UTC day in those tests, notwithstanding the higher clone-event count. Personal-access-token authentication could generate a distinct unique-cloner attribution.
- A workflow **without** a checkout generated zero clone events in their baseline control.
- GitHub Pages conventional build/deployment produced additional hidden clone activity in the test configuration.

This strongly supports **GitHub Actions checkouts and Pages builds as real self-generated-clone mechanisms**, not merely abstract possibilities. The behavior is externally reported and experimentally controlled, **not yet reproduced in these specific SAT/HsH repositories**. A unique-cloner value cannot simply be deduced by subtracting 1 from every clone action; identity attribution depends on authentication and sampling.

GitHub's own documentation says Traffic includes full clones, not ordinary fetches, and offers daily/weekly aggregation for the last 14 days: [GitHub Traffic overview](https://docs.github.com/en/repositories/viewing-activity-and-data-for-your-repository/viewing-traffic-to-a-repository) and [Traffic API](https://docs.github.com/en/rest/metrics/traffic). The previous nine-event project ledger does not disprove the existence of self-clones through Actions. It simply did not identify confirmed successful Git clone mechanisms on the historical dates it reconstructed.

**Audit adjustment:** For a given day, the highest-priority quantitative reconciliation is now: (1) enumerate actually executed jobs and each checkout step by *repository*, (2) identify additional Pages build runs, (3) compare the daily result with observed traffic clone counts, and (4) separately test the claimed *unique cloner* tally against auth provenance and user-independent activity. Do **not** treat workflow YAML definitions alone as executed events; nor attribute all clone residual to outsiders. The GitHub Pages checkout/deployment mechanism is a candidate only when Pages was actually operating for that repository on that date.

