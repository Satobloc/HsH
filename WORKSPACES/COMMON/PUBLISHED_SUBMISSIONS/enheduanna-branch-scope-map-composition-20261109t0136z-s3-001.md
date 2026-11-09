# Branch-scoped map composition gate

**Run key:** `REVROT3-19-20261011:697:s3`  
**Worker label:** Enheduanna; successor: Tern Rook.  
**Classification:** architecture/workflow improvement; source-grounded reconstruction; no theory promotion.

## Result

Added a branch-scope requirement to the H(s)H map/prediction workflow:

> A prediction row must identify the exact model/source branch it uses. A claim cannot be transported between branches unless an explicit typed transition map, its admissible domain, and intermediate composition conditions are supplied.

This addresses a gap distinct from the existing calibration-ancestry and evidence-independence gates. Issue #1463 already covers the worldtube distinguishability ladder and calibration ancestry; issue #1345 composes the layer-resolved independence vector; ArchiveEQ0049 already formalizes generic projection-path coherence. This addition makes **model-branch identity part of the map type**.

## Source-grounded example

The source-fidelity audit in issue #1495 distinguishes:

- **October 9, 2026:** Nathan Direct local-radiality / mass-retarded-time-sheet discussion. Raw export SHA-1 `7af1561b321f4d9364da5eb111df689efc652827`; relevant user-role messages `845c7190-202f-4fed-8056-b9b81c994fb9` and `300da217-ffff-416e-8637-9b3327c0a9de`.
- **October 21, 2026:** Nathan Direct correction that the reciprocal filament/timesheet-deformation model was no longer current after Klein Fabric became common. Raw export SHA-1 `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; relevant user-role messages `090f5160-1020-486d-9c42-df3d7dff2063` and `47cf2603-bf28-439c-82b3-1f0e0c2a7dc8`.
- **October 21, 2026:** current `cw=t`, Forest-normalization, `(++++)` convention; message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`.

The assistant-generated Painlevé–Gullstrand metric is a standard-GR comparison, not a Nathan Direct equation or a branch-transition map.

The recovered sources do not provide a transition map from the October 9 branch to Klein Fabric, or from Klein Fabric to the later Forest-normalization convention. These remain distinct source states. Missing maps mean `BRANCH_TRANSFER_BLOCKED / MAP_INCOMPLETE`, not that the branches are physically incompatible.

## Formalization

Draft PR #1508: https://github.com/Satobloc/HsH/pull/1508  
Branch: `research/enheduanna-branch-scoped-map-composition-20261109t0136z`  
PR head: `8647396cb5a3ce4803720a02982bc9af1a12df96`

New module: `FORMAL_VERIFICATION/HsHVerification/EnheduannaBranchScopedMapComposition.lean`  
Module blob: `e38901478a62cb5807b2d52978afc514250f3061`

The module defines branch-indexed maps, requires matching intermediate branch indices for composition, requires an explicit intermediate-domain compatibility witness, and makes cross-branch claim transport depend on an explicit map. It proves the conditional composition/preservation statements; it does not assert that any particular transition map exists.

## Actual Lean run

GitHub Actions run #42547294085 / job #128934928067: **SUCCESS**.

- Lean 4.34.0; Lake 5.0.0.
- Mathlib v4.34.0, resolved commit `5ed2965256430c3649e86755f9576b54eca72435`.
- Full root build: 8,945 jobs; new module built at 8,930/8,945.
- The workflow checked out merge commit `65a3e601952ff41b28633b57f7c56195f911c24c`, whose merge message identifies the PR head and base. The new module and root aggregator blobs match exactly between the PR head and merge reference.
- `compose_preserves_target` and `transport_compose` report no axioms; `transport_identity` reports `[propext]`.
- Tests, lint, nanoda and the global axiom audit were skipped. This is a successful merge-reference build, not an exact-head standalone build.

Lean verifies only the encoded abstract map contract. It does not authenticate source extraction, establish branch-transition maps, prove physical equivalence, or validate H(s)H premises.

## Physical and project boundaries

No physical system, measured dataset, fit, numerical prediction, uncertainty budget, falsification threshold, or empirical validation was supplied or calculated. No physical fixture or data-free numerical test was created.

P0 Code Grurple remains active. P1 November 9 remains Orson-owned / not ready; P2 November 30 remains on hold; P3 December 14 remains separate and incomplete. No BEDROCK, SAT-O, Blockwave, task graph, paper gate, or theory-status change.

**Next:** obtain independent translation review of PR #1508. Recover source-defined branch-transition maps only if they exist in the primary archive; do not infer them from names, analogy, or the PG comparison.
