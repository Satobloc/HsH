# Discovery projection eligibility gate and fresh-snapshot revalidation

**Classification:** P0 discovery/presentation QA addendum to canonical issue [#1747](https://github.com/Satobloc/HsH/issues/1747). This is not a second incident, a live-route observation, or a production change.

## Fresh snapshot evidence

The 2026-11-15 10:40:30Z discovery snapshot was source-consistent at publication:

- Embedded HsH source commit: `4971e9b975700d949ed0fa4c386d4f4da539037c`.
- Refresh commit: `6e4a42750e41aca99e40f61daf3d45f92cfd9463`.
- Comparing the embedded source commit with the refresh commit shows one commit ahead, zero behind, with only `PUBLIC_SITE/generated/discovery.json` changed.
- Snapshot: 15,034 documents, 8,103 workspace records, 8,103 workspace reader targets, 7,905 workspace excerpts, 48 rolling-docket entries, 577 visuals, and 6 errors.

Paper A (`13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`) and Paper B (`0a1dca42cafd9a02faceff4ec0851659a317b2bb`) both remain in the full discovery catalog with raw/default reader targets. Paper A has no excerpt; Paper B has a 1,400-character excerpt. Neither appears in the rolling docket. The generated curated papers index still excludes both. The eight protected P0 source/control blobs remain identical to their pinned values.

A subsequent repository update occurred after the refresh. That is post-refresh drift, not evidence that the snapshot was stale when published. The 10:25Z snapshot, independently compared in the same way, is the concrete snapshot encoded in the Lean examples; the 10:40Z snapshot independently repeats the same Paper A/B projection state.

## New formalization

The existing draft [PR #1471](https://github.com/Satobloc/HsH/pull/1471) was extended with a typed `CodeGrurpleDiscoveryProjection` model. No new PR or tool was created.

The model separates:

1. Inventory indexing.
2. Metadata visibility.
3. Docket eligibility and docket membership.
4. Excerpt visibility.
5. Default reader-target visibility.

Its safety contract establishes that metadata visibility requires inventory presence; docket inclusion requires explicit eligibility; and excerpts or default reader targets require a current presentation derivative bound to the exact current source blob and a source-consistent discovery snapshot.

The formalized counterexample shows that docket exclusion does not imply reader denial: Paper B is outside the docket while its raw reader target and excerpt are serialized in the full discovery record. A metadata-only pending record remains admissible. A source change closes raw excerpt and reader-target surfaces, invalidates the old derivative and snapshot, and preserves the separate metadata and docket decisions. A fresh snapshot alone cannot promote a pending presentation to presented.

The PR branch head at submission is `b8f76827c7766b9838b734915b7eff863d1dc747`. The latest Lean verification run, [#43705989028](https://github.com/Satobloc/HsH/actions/runs/43705989028), was still in progress at submission. Earlier attempts exposed proof-script errors; those were corrected before the current run. No successful build is claimed yet. PR #1471 remains OPEN / DRAFT / UNMERGED and is not a production change.

## Limits and disposition

The snapshot ancestry, changed-path attestation, derivative existence, digest binding, and source readbacks are external evidence inputs. Lean checks only the formalized contract. It does not inspect GitHub commits, calculate hashes, parse the live discovery JSON, or observe a browser route. A serialized reader target is not proof that a live route rendered it.

The registry's default-deny presentation policy remains inconsistent with the generated discovery projection. P0 remains ACTIVE under issue #1747. No route probe, site edit, PDF edit, manuscript edit, paper-gate advancement, P2 selection, physical calculation, H(s)H prediction, independent measurement, equation modification, or theory promotion occurred.
