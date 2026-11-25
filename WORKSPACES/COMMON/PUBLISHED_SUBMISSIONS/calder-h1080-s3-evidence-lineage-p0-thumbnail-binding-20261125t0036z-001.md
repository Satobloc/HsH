# Calder h1080:s3: evidence-lineage correction and P0 derivative-identity gate

**Run key:** REVROT3-19-20261011:1080:s3  
**Routing:** Calder (ring index 7); next label Hale (index 8). This deterministic label does not authenticate a ChatGPT instance or thread.

**Historical role evidence:** The direct user-authored Calder entry in CHECKINS.md (lines 53-106) emphasizes empirical angle-clustering, null design, and independent-unit discipline. No standalone signed specialist charter was found; this is source-grounded role evidence, not identity authentication.

## 1. Main improvement: separate source origin from downstream build context

The published h1073:s0 report at [issue #2511](https://github.com/Satobloc/HsH/issues/2511) cited NadirHelixSliceGeometry.lean alongside PR #1455 and run #42390677035. The citation needed a more precise source/build distinction.

Independent changed-file, blob, base/head and Actions readback establishes:

- The Nadir module is a changed file in [PR #262](https://github.com/Satobloc/HsH/pull/262), exact head 368f9af8d95d061b4581688759ed3eda309e9886.
- Its blob 3e47ffa6d6bcd534abdedf18ea865fb2941a0947 is identical at PR #262 head, PR #1455 base c7dc2c483f50ae03fc7a7c530829170135e18d92, and PR #1455 head 606e5a012139d12b411a43ca1ab960fc09f940c0.
- PR #262 changed-file metadata includes the Nadir module. Its exact-head Actions run [#43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979), job #133584241306, passed both Assert exact PR-head checkout and the Lean library build.
- PR #1455 changed-file metadata instead includes EnheduannaBendingEnergyBound.lean, not the Nadir module. Its run #42390677035 succeeded, but its job lacks an exact-head checkout assertion. The Nadir file is inherited from that PR's base.

The source-introduction and exact-head witness is therefore **PR #262 / run #43948452979**. PR #1455 / run #42390677035 is a later successful PR-build context containing the same inherited file, not the source-introduction PR or exact-head verification for Nadir.

An additive correction was posted to [issue #2511, comment #7148894623](https://github.com/Satobloc/HsH/issues/2511#issuecomment-7148894623). The original published artifact was not edited or replaced. This correction changes source/build attribution only; it does not change the encoded conditional geometry theorem or establish physical truth.

## 2. P0: derivative identity is stronger than filename safety

At current [PR #2009](https://github.com/Satobloc/HsH/pull/2009), head 039f90a61e337ff324d12f138ec2d3a56dc9416f, source blob b75f69d9ce52045d01b3d6030faf75462ccdee2e, the stale-image fast path can preserve a prior non-square record, while thumbnail_references() validates a safe hash-shaped path and file existence without binding that filename to the record's sha or square flag.

A minimal Python replay of the exact helper body, using a temporary directory with two hash-named files, accepted both invalid states:
- non-square record with an existing thumbnail;
- square record with SHA A but an existing thumbnail named for SHA B.

The replay was limited to the helper body, not a full module test or CI run. The nine current tests do not cover these two cases. The missing invariant is:

- square == true: require a valid 40-character lowercase hexadecimal SHA and thumbnail == f"thumbnails/{sha}.jpg";
- square == false: require no thumbnail reference.

The finding is documented in [PR #2009, comment #7148892014](https://github.com/Satobloc/HsH/pull/2009#issuecomment-7148892014). No code was changed; Meridian retains implementation, Mercer independent QA, and Tern release/standdown authority.

## 3. Current P0 snapshot: clean derivative inventory, unsafe record policy

The latest independently parsed discovery snapshot was generated at 2026-11-25T00:42:39Z:

- HsH source commit: 3afa69cec1ff43d9124ca7f49c54b3a30d3d0710.
- Generated commit: 742b9f3f2df2fb44d6767f465ff0c1084e6d1f96.
- 17,830 indexed documents; 10,898 workspace records.
- All 10,898 workspace records have generic reader targets and lack presentation_state; zero are explicitly PRESENTATION_PENDING.
- 10,650 workspace excerpts; 48 rolling-docket records; 577 visuals.
- 417 thumbnail references, 381 unique references, and 381 physical thumbnail files.
- Zero current non-square thumbnail references and zero SHA/filename mismatches.
- Six extraction errors.

Thus source freshness and the current thumbnail inventory pass, while record-safety remains FAIL. The PR defect is a latent validator gap, not evidence of current thumbnail corruption. Live Paper A/B route acceptance remains NOT OBSERVED. The control update is [issue #1747, comment #7148896570](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7148896570).

PR #2009 remains open, draft and unmerged, 14 commits ahead / 37 behind current main. No site-discovery test CI pass is established for its current head.

## 4. WH-02 and Mersearch boundaries

WH-02 remains Calder-owned and unmodified. Against current main 742b9f3:
- PR #2487: 6 ahead / 397 behind.
- PR #2488: 1 ahead / 397 behind.
Both remain open, draft and unmerged; GitHub reports mergeable=false. No PR-triggered workflow runs were returned for either head. The main conversation-index workflow still restricts push and pull-request branches to the legacy branch. PR #2488 adds workflow_dispatch and removes the pull-request branch restriction, but leaves the push restriction and does not explicitly assert the checked-out PR-head SHA. Current status is recorded at [issue #1702, comment #7148902012](https://github.com/Satobloc/HsH/issues/1702#issuecomment-7148902012). No rebase, merge, force-push or ownership transfer occurred.

All four Mersearch request lanes remain occupied. Lane 2 has a request-scoped run manifest and compact receipt, but no release receipt; lanes 1, 3 and 4 have no request-scoped run manifest. No query was overwritten, retriggered or released. No private HSH_RESOURCES payload was opened.

## 5. Boundaries and next cursor

- No physical system or dataset was selected; no physical calculation, fit, prediction or falsification threshold was produced.
- No new Lean theorem or proof was created. Existing PR #262 exact-head build evidence was source-checked; Lean validates only its formalized statement.
- No SAT-O or Blockwave equations, manuscript, BEDROCK theory or protected P0 implementation were changed.
- P0 remains ACTIVE; P1 remains overdue/frozen and Orson-owned; P2 remains HOLD; P3 remains incomplete.
- FIE full rereview was completed November 24; next review December 8. The last project-wide unrelated-source break was November 24; next is due November 28.
- HSH_RESOURCES inspection was limited to its root README. No new tooling, fork, dependency, subscription or expenditure.

No authenticated current Calder or Hale ChatGPT thread was established. The next ring label is Hale; any repository inbox context is optional and does not imply direct-thread delivery, consumption, acknowledgment or assignment. The existing :36 Worldtube task configuration was not changed.
