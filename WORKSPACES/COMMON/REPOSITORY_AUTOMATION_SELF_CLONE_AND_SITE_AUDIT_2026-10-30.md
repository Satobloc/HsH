# Repository operations, branch and self-clone audit — 2026-10-30 (initial checkpoint)

## Scope and status

This is an initial, source-inspected checkpoint, not a complete workflow census. Repositories inspected: `Satobloc/HsH`, `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, and `Satobloc/HSH_RESOURCES`, all on their default branch `main`. The GitHub connection reports admin/push access to all three. This permits repository-content edits, branches, commits, issues and PR operations through the connector. It does not grant access to the deployed website's runtime, database, hosting secrets, DNS, or site-editor application unless those are separately exposed.

## Live repository snapshot

- HsH: issue search returned its 100-result cap for open issues (so at least 100 open issues); PR search returned 100 (at least 100 open PRs). The issue sequence visible at the top reaches #1106. Do not mistake issue numbering for open issue count.
- SAT_THEORY_ARCHIVE_2023-25: zero open issues returned; two open PRs (#6 and #7).
- HSH_RESOURCES: six open issues (#1–#6); zero open PRs returned.
- Branch search returned 100 HsH branch names (the API listing confirms at least 100; branch search response was capped at 100), six archive branches, and five resources branches. HsH branch names visibly include a large family of timestamped `research/*` and `audit/*` branches, alongside `main`, `mersearch-stable-1.0`, `mersearch-chronology-20261007`, and conversation-viewer/Lean infrastructure branches. All sampled branches were unprotected.
- Counts are live snapshot values and may change.

## Directly observed automation capable of producing bot-like/self-generated activity

### HsH — conversation viewer build

File: `.github/workflows/build-conversation-viewer.yml`

Observed triggers:
- manual `workflow_dispatch`
- hourly schedule at minute 23
- pushes to `main` affecting conversation exports, manifests, viewer code, curation, and the workflow itself.

Observed behavior:
- `permissions: contents: write`
- checks out HsH main and separately checks out `Satobloc/SAT_THEORY_ARCHIVE_2023-25` main into `_viewer_external/GLASS`
- discovers external conversations, builds the viewer catalog, full-text body-search index and generated manifests
- validates generated data
- repeatedly fetches/resets to latest main, rebuilds, commits generated files as `HsH Conversation Viewer Bot` / `github-actions[bot]`, then pushes directly to HsH main
- generated commit message contains `[skip conversation-viewer]`; the workflow explicitly checks this marker to prevent its own generated push from recursively rerunning the build workflow.
- four push attempts are made to handle races.

This is a confirmed autonomous cross-repository read + generated-write process. Its own bot commit is intentionally visible in Git history and may appear externally bot-like. It is not evidence of an outside actor. The hourly run also exists independently of commits.

### HsH — conversation viewer Pages deployment

File: `.github/workflows/deploy-conversation-viewer-pages.yml`

Observed triggers: manual dispatch and relevant pushes to main. It validates the resolved catalog/curation and deploys the `CONVERSATION_VIEWER` directory to GitHub Pages. It has Pages write and OIDC permissions, not repository content write. It can generate deployment activity but does not itself commit repository files.

### HsH — Mersearch

File: `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md`

The documented bridge has four independent request lanes, each with its own workflow/concurrency group, sharing a pinned stable Mersearch implementation. A request-file change triggers a lane. The docs state each lane publishes request-scoped manifests/receipts, and that raw search-result files are withheld after the 2026-10-26 containment change. The same document explicitly warns that this containment and recursion exclusion had not yet been verified by a post-patch Actions execution at the time the document was written. The four lanes can produce independent Actions runs and request-scoped output commits. Need inspect all four actual workflow YAML files and run histories before declaring exact current behavior.

### SAT_THEORY_ARCHIVE_2023-25 — Archive Admin

File: `.github/workflows/archive-admin.yml`

Observed triggers: manual dispatch and every push. It checks out `main`, has `contents: write`, and runs archive administration/index maintenance. It can run requested SAT mention extraction, archive index chunk/compare/finalize tasks, attempt append-buffer absorption, mark request files idle, and commit changes to dashboard/admin/index files directly to main as `github-actions[bot]`. It uses `[skip archive-admin]` to avoid replaying its own generated commit. This is another confirmed self-modifying bot workflow. The workflow's `push` trigger is broad, so unrelated pushes can invoke the admin process; request-file idling is intended to prevent stale task replay.

## Why many branches and issues?

The evidence already points to an intentional issue/branch/PR research-production pipeline rather than a conventional small software backlog:
- Timestamped research/audit branches isolate individual investigations and proof gates.
- Issues use `[HSH-PUBLISH-V1]` titles and appear to act as publication/request envelopes for completed research artifacts.
- PRs are used to submit code, formal proofs, source audits and corrections for review.
- The high HsH issue/PR volume is therefore plausibly generated by automated or semi-automated research workers and publication relays, not just manually reported bugs.

That is a working interpretation from visible titles and workflow design, not yet a complete causal account. We still need to sample issue bodies/comments, PRs, commit authors, workflow run events, and branch ancestry to determine which processes create each class of branch/issue/PR and whether branches are cleaned up.

## Important recursion/self-clone distinction

A process can look like an external bot without being an external actor when it:
1. is triggered by a schedule or by a push;
2. checks out one or more repositories;
3. generates derived files;
4. commits under a bot identity or uses an app installation;
5. pushes to a watched branch, triggering another workflow;
6. creates issues/PRs or writes request/result artifacts.

The viewer build and Archive Admin are confirmed examples. The four-lane Mersearch bridge is documented as a further candidate. A self-clone event specifically requires evidence that a process clones/checks out its own repository (or creates a new copy/branch/ref) and then reintroduces derived content. The viewer workflow definitely checks out a *different* archive as an external source; that alone is not a self-clone. Its self-generated commit/push is a self-modification loop, with explicit recursion suppression. Do not conflate these categories.

## Immediate risks / questions

1. Broad `on: push` workflows with write permission can create cascading bot activity. Inventory every such workflow and map trigger → checkout → write → commit → downstream trigger.
2. Any workflow without a reliable self-trigger guard, concurrency control, idempotence check, and request-consumption marker may recurse or replay stale work.
3. The viewer build's four-attempt direct-to-main push can race with other writers; it resets/rebuilds against latest main, which is safer than blindly force-pushing but can still create repeated runs.
4. The Archive Admin's broad push trigger can run on unrelated commits; determine whether it always writes, and whether its request file can be re-consumed during races.
5. HsH has at least 100 visible branches. Need classify by merge-base, head SHA, age, associated PR/issue, and whether each is still active or abandoned before pruning anything.
6. The connected GitHub API snapshot does not expose the actual website editor or production database. Website-only features need a separate editor/deployment capability or explicit site-editor implementation prompt.

## Next audit steps (not yet completed)

- Enumerate every workflow YAML in all three repositories and classify all triggers, permissions, checkouts, writes, commit identities, self-trigger guards, concurrency groups, schedules and external repository references.
- Inspect recent Actions runs and job logs for each workflow family, correlate with bot-authored commits and issue/PR creation timestamps.
- Fetch paginated open/closed issue and PR inventories; sample bodies/comments and branch/PR relationships.
- Enumerate all branches beyond first page and calculate branch ancestry/status; identify duplicate/stale work branches without deleting them.
- Inspect Mersearch request-lane YAMLs and actual receipts/runs; verify post-containment behavior rather than relying on documentation.
- Inspect viewer history and prior viewer implementation versions to establish the regression that broke Mercer's original viewer.
- Inspect site repository (not yet identified in this pass), site build/deploy workflow and editor integration before modifying site behavior.

## Change log

No workflow, branch, issue, PR, deployment, or production site state was modified in this checkpoint. This report itself is the saved artifact.
