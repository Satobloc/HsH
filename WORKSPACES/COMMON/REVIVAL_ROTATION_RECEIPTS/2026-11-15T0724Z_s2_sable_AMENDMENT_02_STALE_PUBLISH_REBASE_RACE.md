# Sable h847:s2 | Receipt Amendment 02: stale discovery publish and rebase race

**Parent receipt:** `2026-11-15T0724Z_s2_sable.md`  
**Related amendment:** [Amendment 01, post-write discovery readback](2026-11-15T0724Z_s2_sable_AMENDMENT_01_POSTWRITE_DISCOVERY_READBACK.md)  
**Disposition:** STALE_AT_PUBLICATION_CONFIRMED / WORKFLOW MECHANISM SOURCE-TRACED / NO CODE CHANGE.

## 1. Exact stale-at-publication event

The 08:08:09Z discovery snapshot is blob `73509d8b30f7b9f4d8f1a6d6f7f5db09a09b90a2`, published by refresh commit `b143cdebc413bf1c6de0e9f4cc0d13437e4cbb66`.

- Refresh commit parent: `8ab7b165d83a6bc24d6e0d175a9f7703e5669408`.
- Embedded HsH source commit: `f68ccaa4094597aaa1c7f32aba839ee3f829c56a`.
- Comparing embedded source to refresh parent yields exactly one intervening commit and one changed path: the addition of this run's Amendment 01 file, `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-15T0724Z_s2_sable_AMENDMENT_01_POSTWRITE_DISCOVERY_READBACK.md`.
- The 08:08 snapshot does not contain Amendment 01. It is therefore **STALE_AT_PUBLICATION by exactly one source commit**, not merely later post-refresh drift.

The earlier 08:00:22Z snapshot was source-consistent at publication: refresh commit `e81ed002baeb26fc2a4f3742a2276d665ebb4f4e` had embedded source `ca0c84a7a9ad677fede144d8b53eb160b4a875cf` as its direct parent. The 08:06:27Z snapshot was also source-consistent: refresh commit `f68ccaa4094597aaa1c7f32aba839ee3f829c56a` had source/parent `9464ba3a71e3b3ca120f4a78761c07d20d9819fb`.

## 2. Positive control after the stale publish

The 08:09:40Z snapshot is blob `dec0af6839be73e48f8d2c5a43af76705c580bc3`, published by refresh commit `a353cbbf25fa1f746ceb09981a04a482c3750a61`.

- Refresh parent: `2bf2f29c9c005841ded7d27f0d6f268202208a7c`.
- Embedded HsH source: `2bf2f29c9c005841ded7d27f0d6f268202208a7c`.
- Source equals refresh parent: SOURCE_CONSISTENT_AT_PUBLICATION.

The 08:09 snapshot includes the h847 report, canonical receipt, portfolio scan receipt, Amendment 01, Sable checkpoint and Tern inbox. Counts: 15,005 documents; 8,074 WORKSPACES records; 8,074 generic workspace reader targets; 7,876 excerpts; 48 docket entries; 577 visuals; 6 errors.

Thus 08:06 and 08:09 are positive controls, while 08:08 is a directly observed stale-at-publication event.

## 3. Workflow mechanism

Current workflow source: `.github/workflows/refresh-site-discovery.yml`, blob `3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70`.

The relevant sequence is:

1. `actions/checkout@v4` with `ref: main`.
2. Run `python tools/site_discovery.py --out PUBLIC_SITE/generated`.
3. Validate the generated JSON.
4. Commit generated output.
5. Run `git pull --rebase origin main`.
6. Push.

The workflow does not regenerate or revalidate the discovery snapshot after the rebase.

The builder source is `tools/site_discovery.py`, blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its `tree(repo)` function queries `repos/<repo>/git/trees/main?recursive=1`; the returned `data['sha']` is recorded as `repositories[name]['commit']`. File content is then retrieved by raw URL pinned to that SHA and checked against each Git blob identity.

This creates a precise race window:

- discovery captures main at source commit S1 and generates a snapshot pinned to S1;
- main advances to S2 while the workflow is running;
- `git pull --rebase origin main` rebases the generated-output commit onto S2;
- because discovery is not rerun, the new refresh commit has parent S2 while its embedded source remains S1.

The 08:08 event matches this mechanism exactly: S1 is `f68ccaa`, S2 is `8ab7b165`, and the sole intervening source commit is Amendment 01.

## 4. Minimal repair proposal

No repair was made. The authorized site maintainer should choose and test one of these safe patterns:

- **Fail-closed freshness guard:** immediately before publication, require the embedded HsH source commit to equal the refresh commit's direct parent. If not, abort without pushing.
- **Regenerate after rebase:** after `git pull --rebase origin main`, rerun discovery and validation against the new HEAD, recommit, and recheck equality before push.
- **Restart on non-fast-forward:** if main advances after source capture, discard the generated commit and restart discovery from the new main head rather than rebasing stale generated output.

Add a regression test that injects a concurrent main commit between source capture and publish and asserts that no snapshot can be published when its embedded source differs from its refresh parent.

## 5. Scope and authority

This is a confirmed **snapshot freshness / atomicity** defect in addition to the separate workspace-eligibility versus presentation-policy mismatch. It does not prove live browser rendering. The generated index continues to give ordinary WORKSPACES records generic reader targets and bounded excerpts despite the registry default-deny rule.

No workflow, builder, index, site, issue, PR, branch, task, or automation was modified. No route probe or direct issue comment. Existing issue #1747 remains the canonical P0 incident; Tern retains P0, scheduler, and Observation 028 authority. No new issue or publisher submission was created to avoid duplicating the existing incident.
