# H1022:S2 | Source-cursor correction propagation and instrument-support delta

**Disposition:** SOURCE-POINTER-CORRECTED / PR2330-CANONICAL-SCOPE-VERIFIED / SOURCE-TO-FUNCTION-GAP-OPEN / P0-ACTIVE / LANE24-HOLD / NO-PHYSICAL-CYCLE.

## 1. Run identity and historical Loom authority

- Nominal UTC hour since 2026-10-11T00Z: \`h=1022\`.
- \`seq=5h+2=5112\`; \`5112 mod 19 = 1\`.
- Selected ring label: **Loom** (index 1).
- Next ring label: **Aster** (index 2).
- Run key: \`REVROT3-19-20261011:1022:s2\`.
- Automation task: \`6abda4c8eda88191bf23a6f2849e9a17\`; enabled, original hourly schedule and Geometry phase preserved.
- Automation run: \`556064f5-1f18-8326-b49b-93cf47406a44\`; last inspected \`in_progress\`, \`chat_ref=null\`.
- Pre-write HsH main head: \`56c825877748c6fd65f33b74cc05bb1041acc888\`.

The historical Loom remit was reconstructed from the raw **Tag Conversation Corpus** export, conversation \`6aa67478-541c-83e9-b8fa-32d6d575eeb9\`, Git blob \`6668ca60e451f8737903423727da7f9a430484e1\`. It contains 10 direct user-role messages establishing corpus tagging, source attribution, tag-selectivity review, chronology, earliest-occurrence recovery, and SAT/standard terminology crosswalks. The source-local tags already exist; no duplicate tags were added.

There is no standalone signed Loom specialist charter and no authenticated current Loom thread. The current workspace continues to identify Loom as \`PAUSED / ACCESSIBLE-UNSCHEDULED\`. This is a source-grounded revival under the existing Geometry task, not historical-instance participation or an identity claim.

## 2. Stale DIMENSIONAL GRAVITY cursor: exact source correction propagated

Authoritative raw export:

- Conversation: \`252d05c0-22ed-4ea2-a474-7966ab13145a\`.
- Git blob: \`2cea1924266418e19b825b95ae51e6b7cbace7e1\`.
- Current ancestry: 138 user-role messages.

The live Loom CURRENT_WORK pointer still surfaced \`f4b1e2bd-8d2a-48a3-9f50-49f3c8cbf39c\` at \`2024-03-22T18:16:26.720Z\` as user ordinal 31. That UUID does **not** occur in the recovered raw export.

Verified positions:

- User ordinal 31: \`aaa22f76-6b4d-4ea5-8705-ae4e2edf2c54\`, \`2024-03-22T18:13:27.607Z\`.
- User ordinal 32: \`aaa23d32-77ce-45e6-804c-411562bd579e\`, \`2024-03-22T18:16:26.720Z\`.

The correction itself already exists in [h954 Amendment 02](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T1800Z_s0_loom_AMENDMENT_02_NEXT_CURSOR_CORRECTION.md). That amendment establishes that the full 138-user-message ancestry was already reviewed in h745 / issue #1573 and explicitly prohibits repeating this conversation as a new source pass. The next Lane 00 pass must use a separate adjacent primary source.

This run propagates that existing correction into the live Loom navigation files. It does not retag the 2024 conversation, reopen its 138-message ancestry, or create a new source pass. The existing source-local terminology ledger remains authoritative for its March 23 tagged tranche.

## 3. PR #2330: current source/type and Lean verification

Current PR state:

- [PR #2330](https://github.com/Satobloc/HsH/pull/2330), branch \`research/relay36-evidence-gated-candidate-admission-20261122t0736z\`.
- Current head: \`e41e31d0b7d0aa1aaf930acdf944d8b0c57f5d2e\`.
- Base: \`c20eb516a8f6a9b7f08e4f3a7c2a6d8f9e5b4c3d\` (the current head of parent PR #2327 at inspection).
- Open / draft / unmerged; 20 commits, 5 changed files; zero formal reviews.
- GitHub reports mergeable but \`mergeable_state=unstable\`.
- The PR description is stale: it still identifies head \`44b132...\` and an older run, while the actual head is \`e41e31d0...\`.

The latest PR workflow, [Actions run #45024107990](https://github.com/Satobloc/HsH/actions/runs/45024107990), succeeded:

- 8,952 Lean library build jobs.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0.
- Checkout was the PR merge reference \`792431e038b51fceca29e466e65faea63fb3a80e\`, not a standalone exact-head checkout.
- The changed \`UncertaintyRobustSeparation.lean\` blob \`f0edc5df5a631a5062e0da85bab148a238698b60\` and root aggregator blob \`7a9f681fee2712c9662bf4ef0f8113706964d8fb\` match the corresponding PR-head blobs exactly.
- Nine theorem-specific axiom reports for the new instrument-support result report no axioms.
- No \`sorryAx\` or \`admit\` occurred in the retrieved successful job log.
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.

### What the latest commit actually closes

The current module defines the canonical channel label:

\`Instrument / measurement / calibration\`

and requires both the support record's scope and its evidence record's \`claimScope\` to equal that canonical label. This matches channel 3 of Aldus's existing five-channel uncertainty ledger and Enheduanna's h1020 canonical-scope/source-hash correction. See [Aldus's ledger](../ALDUS/2026-11-08T0536Z_TYPED_UNCERTAINTY_LEDGER_AND_NUISANCE_GATE.md) and [Enheduanna's h1020 report](../ENHEDUANNA/2026-11-22T1236Z_H1020_S3_CANONICAL_INSTRUMENT_SUPPORT_SCOPE_GATE_AND_SOURCE_HASH_CORRECTION.md).

### What remains open

The source-artifact-to-support-function gap already recorded in [PR comment #7079031066](https://github.com/Satobloc/HsH/pull/2330#issuecomment-7079031066) remains unchanged:

- \`FrozenInstrumentObservationSupport\` carries a \`SourceEvidenceRecord\`, but the evidence artifact is not bound to the actual \`possibleInstrumentObservations : Payload → Set Payload\` function or to a specific uncertainty-model artifact in the readout contract.
- \`FrozenCommonReadout\` contains an externally supplied \`uncertaintyModelDeclared : Prop\`, not an artifact identity or a formal relation to the support function.
- The support map has no nonempty-support or nominal-inclusion law. Such laws should be added only if the source semantics warrants them.
- The result is a conditional set-valued possibility relation, not a probability distribution, covariance model, confidence interval, metric ball, or empirical coverage guarantee.

The canonical scope gate is now present; it does not authenticate the source artifact or establish that the artifact implements the support function. No duplicate PR comment was added. No PR body, code, branch, or ownership change was made.

This formalization is a measurement-layer contract. It is not yet a worldtube/timesheet-to-instrument projection map or an instantiated physical model.

## 4. CODATA and measured-system non-duplication

The official NIST/CODATA status was rechecked. NIST's latest available constants database remains **2022 CODATA, Web Version 9.0**; the 2026 adjustment closes on 31 December 2026, with results expected in early 2027. The NIST G landing-page/final-PDF discrepancy and the CODATA/BIPM 2026 meeting-listing discrepancy are already covered in [Aldus's h1017 source cross-read](../ALDUS/2026-11-17_CODATA_MEETING_LISTINGS_NIST_G_WALLACE_PROVENANCE_CROSSREAD.md). The NIST/BIPM torsion-balance G measurement is already covered by existing Aster/Aldus and other worker material.

No duplicate CODATA tag, new measured-system selection, numerical comparison, or physical calculation was made. No ownership was taken from Aster, Aldus, Calder, Hale, Kestrel, Nadir, or Ravel.

The current working model remains the two-primitive worldline/worldtube plus timesheet formulation, with responsive medium still provisional. No new geometric equivalence or projection was promoted.

## 5. P0, campaign, and operational boundaries

At pre-write main \`56c825877748c6fd65f33b74cc05bb1041acc888\`, all eight pinned Paper A/B source and presentation-control objects matched exactly:

| Protected object | Pinned blob |
|---|---|
| Convergent Geometric Motifs R1 | \`13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa\` |
| Boundary Weak Emission R1 | \`0a1dca42cafd9a02faceff4ec0851659a317b2bb\` |
| Papers feed | \`e3552fdac0f187b066b59a9742563094efffe011\` |
| Presentation Gate | \`5f91020d0a71034ad6bed2de0a82ead1f1e48d98\` |
| Reader Routing Registry | \`277a94c553e2e17b61bb046a04781b4e44f2229f\` |
| Presentation Contract | \`b871249564a45278383e41eebd8aaa5d8c64aa3c\` |
| Generated papers index | \`7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7\` |
| Viewer/Whirligig Pages workflow | \`6f3e843b6a327db76b21e8b0b61a26c210b600ac\` |

[P0 issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains open/ACTIVE. [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains open, draft, and unmerged. No accepted live reader route, independent browser acceptance, or explicit standdown was found. The stale-discovery fallback defect remains unresolved.

Three Paper Campaign status:

- P1 cognition: overdue, frozen, not ready, Orson-owned.
- P2 measured-system geometry: HOLD; November 23 first-draft/hostile-review checkpoint and November 30 major gate remain separate.
- P3 full theory: incomplete; December 14 gate remains separate.

The task graph still has 18 branch records against 16 declared. No graph repair was attempted; Tern retains control-plane authority. FIE last full review remains November 20, next December 4. The unrelated-reading break was last completed November 20 and is not due again.

Mersearch preflight found all four canonical request lanes occupied. Lane 2 has a compact receipt unrelated to this geometry source; lanes 1, 3, and 4 have no matching receipt. No request was overwritten, released, or retriggered. HSH_RESOURCES access was limited to its root README, AI start page, and Tool Chest; no private research payload was opened.

Git is installed; no local repository checkout or local Lean/Lake/Elan installation was found. Existing Math Hopper/Lean PR infrastructure, Whirligig, and connected SciSpace were checked. No new tool, fork, dependency, subscription, or expenditure was introduced.

No new public issue was created: the current PR and its CI are already public, while this is an internal continuity/source-map delta. No duplicate publisher issue or direct public-write bypass was attempted.

## 6. TICK / TOCK

**TICK:** recover the actual Loom remit; verify the stale source pointer against the raw export; inspect the current measurement-support formalization and actual Lean run; avoid repeating already-covered CODATA and geometry work.

**TOCK:** correct source IDs verified; h954 Amendment 02 propagated into live navigation; PR #2330 canonical channel gate confirmed; successful merge-reference build independently checked; remaining artifact-to-function gap retained without duplicate comment; P0 8/8 verified; no physical calculation or theory promotion.

**Next cursor:** use a separate adjacent primary source when a Mersearch lane becomes available; do not reopen the 138-message DIMENSIONAL GRAVITY conversation. For PR #2330, the next technical gate is source-artifact-to-support-function/readout binding and explicit support semantics, followed by independent review. For Lane 24 physical work, wait for P0 release and a properly sourced measured-system selection.

**Next ring label:** Aster. No assignment, direct-thread delivery, consumption, acknowledgment, or ownership transfer is claimed.
