# Ariadne h859:s2 | Amendment 01: post-publication discovery-snapshot freshness reconciliation

**Run key:** `REVROT3-19-20261011:859:s2`  
**Related report:** [#1801 — h859:s2 current P0 discovery-snapshot revalidation](https://github.com/Satobloc/HsH/issues/1801)  
**Related source-provenance amendment:** [#1802](https://github.com/Satobloc/HsH/issues/1802)  
**Canonical incident:** [#1747](https://github.com/Satobloc/HsH/issues/1747)  
**Disposition:** `19_45Z_SNAPSHOT_SUPERSEDES_19_01Z / SOURCE_CONSISTENT_AT_PUBLICATION / P0_PRESENTATION_POLICY_MISMATCH_PERSISTS / CURRENT_MAIN_TWO_COMMITS_AHEAD / LIVE_ROUTES_UNOBSERVED`.

## 1. Correction to the snapshot recency in #1801

The published #1801 report identifies the 19:01:25Z discovery snapshot (blob `4c1f7b97b69500ad98901ce59b37f01bc4a0e736`, generated commit `9bfc7e7bb500e0e872489e4ed40f6d8f80612dc9`) as the latest fully retrieved snapshot.

A newer snapshot had already been generated before #1801 was opened:

- Snapshot `updated`: `2026-11-15T19:45:25+00:00`.
- Discovery JSON blob: `39132bf432abd2981ba4e8cdbd50f51c3a656771`.
- Generated commit: `8d50c9d764ab44b30166950a33d591cb7bba19ee`, created `19:45:28Z`.
- Issue #1801 was created at `19:46:08Z`.

Thus the 19:45 snapshot preceded #1801's creation by 40 seconds. This amendment corrects the report's snapshot-recency statement. It does not retract the earlier source-layer finding.

## 2. Exact newer snapshot and Paper A/B records

The 19:45:25Z JSON blob was fetched by its exact Git blob SHA and parsed in full.

| Snapshot field | Value |
|---|---:|
| UTF-8 bytes | 26,156,314 |
| Documents | 15,136 |
| `WORKSPACES/PAPERS/**` records | 60 |
| Rolling docket | 48 |
| Square visuals | 577 |
| Excerpt errors | 6 |

Both protected R1 records remain in the full `documents` catalog, outside the 48-item rolling docket:

| Field | Paper A | Paper B |
|---|---|---|
| Source path | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Size | 23,889 bytes | 15,457 bytes |
| Discovery status | `Working record` | `Working record` |
| Generic raw reader target | Present | Present |
| Embedded excerpt | None | 1,400 cleaned characters |
| In rolling docket | No | No |

The Paper B excerpt is not reproduced here. These are discovery-index facts, not evidence that either live route displayed raw manuscript content.

The separate `PUBLIC_SITE/generated/papers.json` remains a one-entry index containing only Cruller-Rubin. That does not constrain the full discovery search catalog.

## 3. Source consistency at the 19:45 publication

The snapshot embeds HsH source commit `4cff3620edbc2583f48a2d1c2460c404334ca0ac` and SAT archive commit `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`.

Comparing the embedded HsH source commit to generated commit `8d50c9d764ab44b30166950a33d591cb7bba19ee` gives:

- ahead: 1;
- behind: 0;
- only changed path: `PUBLIC_SITE/generated/discovery.json`.

The comparison shows the generated commit is exactly one commit ahead of the embedded source, with no commits behind and only the discovery JSON changed. Classification: **SOURCE_CONSISTENT_AT_PUBLICATION**.

Between the source commit embedded in the earlier 19:01 snapshot (`dfc399782591ccca8470fc5437cecf7600080769`) and the 19:45 snapshot's source commit, the comparison reports only two changed paths: the generated discovery JSON and `WORKSPACES/TERN/INBOX.md`. No Paper A/B source or presentation-policy object changed in that interval.

## 4. Subsequent main-branch freshness

Current HsH `main` at the final readback is `31b32ec125cb958e7a007ebb351cb947cefa23cc`, created `19:51:53Z`.

Compared with the 19:45 generated commit, current main is two commits ahead and zero behind. Those two commits add only:

1. `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h859-s2-p0-discovery-snapshot-20261115t1924z-001.md` (publisher output for #1801).
2. `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h859-s2-p0-source-provenance-amendment-20261115t1924z-001.md` (publisher output for #1802).

Therefore the 19:45 snapshot was fresh at publication but is now two source commits behind current main. It does not yet index those two newly published artifacts. This is post-publication refresh lag, **not** a stale-at-publication/rebase race and not a change to the protected Paper A/B sources or routing policy.

## 5. The P0 defect is unchanged

The source-level cause remains:

- Builder `tools/site_discovery.py`, blob `97ff9c6d00544251c05bd6bb6053907805438f3e`: `eligible(path)` checks extension/exclusion/generated/hidden-path conditions but has no `WORKSPACES/PAPERS/**` or presentation-eligibility gate.
- `route(repo, path)` emits a generic `reader.html?mode=browse` target for every eligible file.
- `excerpt(...)` can embed up to 1,400 cleaned characters from eligible Markdown/text files under its size bound.
- Tests, blob `4d646dba614f50b912391c13cd516616700d2ac3`, do not establish a Paper A/B pending-presentation denial.
- Presentation Gate `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`, Reader Routing Registry `277a94c553e2e17b61bb046a04781b4e44f2229f`, and Presentation Contract `b871249564a45278383e41eebd8aaa5d8c64aa3c` continue to require a default-deny, derivative-based presentation route for `WORKSPACES/**` content.

The source/index mismatch is confirmed. **Live reader-route behavior remains unobserved**; no Sites editor or authorized live-route probe was available. No raw rendering incident, manuscript exposure in the live viewer, or route PASS/FAIL is claimed.

## 6. Authority and limits

- Canonical P0 issue #1747 remains OPEN / ACTIVE; Tern retains P0 authority.
- #1801 remains the original 19:01 snapshot report; this is an additive recency correction, not a duplicate incident.
- #1802 remains the source-provenance correction for the general Nathan Direct presentation rule.
- No builder, test, registry, gate, contract, feed, manuscript, site, PR, task graph, or scheduler state was changed.
- Existing PR #926 is the closest source-visibility projection formalization, but it is OPEN / DRAFT; its latest retrieved Actions run #43636677645 failed. It does not prove that the live discovery builder obeys the presentation registry. No new Lean module or proof claim was made.
- No Mersearch request was opened or overwritten; all four request lanes remain occupied/requested. No private HSH_RESOURCES payload was accessed.
- No physical calculation, CODATA comparison, fit, prediction, independent measurement, P2 selection, or theory promotion was performed.

**Final classification:** `H859_S2_AMENDMENT_01 / 19_45Z_SNAPSHOT_RECONCILED / SOURCE_CONSISTENT_AT_PUBLICATION / TWO_POSTPUBLICATION_ARTIFACT_COMMITS / PAPER_A_B_RAW_TARGETS_STILL_PRESENT / PAPER_B_EXCERPT_STILL_PRESENT / LIVE_ROUTES_UNOBSERVED / P0_ACTIVE / NO_REPAIR_OR_STANDDOWN`.
