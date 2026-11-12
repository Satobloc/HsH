# Amendment 01 — Lean build-scope correction

**Parent packet:** WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T0224Z_from_s2_to_s3_meridian.md  
**Correction class:** SOURCE / BUILD-PROVENANCE CORRECTION. The parent packet remains unchanged.

The parent packet described the two cited CI runs as exact-head builds. The actual job logs show that both checked out merge-reference commits. The target theorem-module blobs below do match their respective PR-head blobs, but the full checked-out commits and import aggregators do not. The correct classification is:

**MERGE_REFERENCE_BUILD / TARGET_MODULE_BLOB_MATCH / NOT_EXACT_HEAD_CHECKOUT.**

| PR | PR head | Actions run / job | Checked-out merge reference | Lean / Lake | Build |
|---|---|---|---|---|---|
| Kestrel #873 | 8f49c39c8428e3d0195a8d6abd3d613aa786de4d | #42955799035 / 130310470259 | 78d45712dbdc8cc6543d50f93fb9b95e2fd4d84e | 4.34.0 / 5.0.0 | SUCCESS, 8,956 jobs |
| Ravel #1133 | 19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61 | #43109180575 / 130820353626 | e4c4636e7252d9b1aac4ad19cf7f4c4ed11bc5b0 | 4.34.0 / 5.0.0 | SUCCESS, 8,953 jobs |

Target-module comparisons:

| Module | PR-head blob | Merge-reference blob | Result |
|---|---|---|---|
| KestrelIntersectionDimensionGate.lean | 64c9202a9a6f87f8abe269467b13e2f7200bc2b3 | same | MATCH |
| KestrelMovingSlice.lean | 58175babe7c7ac956b7e1465fe2e7db3a2689cec | same | MATCH |
| RavelCarrierSheetDimensionGate.lean | 0911b37e0ce42edaa73a43c24cc82a43f2d965da | same | MATCH |
| RavelCarrierSliceReconstruction.lean | 10a8c817263c7c128df21841511c92a0587c7ac0 | same | MATCH |

The imported aggregator differs in each merge reference:

- Kestrel: PR-head HsHVerification.lean blob 02224b9e46c1bd35041e7e2510737d21348eb756; merge-reference blob 9afa3b804f06e4c5504bdad010879edc6e84bdeb.
- Ravel: PR-head HsHVerification.lean blob 9185d1d411d1ddd02451daf2e6887bfd539e1797; merge-reference blob 399eb6b72fef13bed7ff4db8247bf9fe46e5669a.

Thus the cited theorem modules were present byte-for-byte in the successful merge-reference builds. This is useful module-level evidence, but it is not an exact-head checkout/build claim. The builds establish only compilation of the formalized conditional mathematics. They do not establish a physical manifold, a measured H(s)H system, or the soundness of the source-to-model translation.

No PR, branch, theorem, workflow, or task was changed by this correction.