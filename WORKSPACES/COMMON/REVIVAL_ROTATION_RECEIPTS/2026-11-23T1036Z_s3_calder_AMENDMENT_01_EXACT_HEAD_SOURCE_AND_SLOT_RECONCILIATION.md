# Calder h1042:s3 — Amendment 01
## Exact-head Lean result, source attribution, and successor-slot reconciliation

**Canonical run key:** \`REVROT3-19-20261011:1042:s3\`  
**Amendment observation:** 2026-11-23T11:09Z  
**Disposition:** \`DUPLICATE_RUN_KEY_RECONCILIATION / INCOMPLETE_EXISTING_RUN_KEY_CLOSED\`

This is an append-only amendment to the existing h1042:s3 receipt. The report, canonical receipt, publisher artifact, and first Hale packet were already present on main before this invocation began. Their commits predate this invocation. No second report, canonical receipt, issue, publisher submission, branch, PR, calculation, or successor packet was created.

## 1. Lean verification is now complete for the current PR head

- Proof-only child: [PR #2419](https://github.com/Satobloc/HsH/pull/2419), branch \`research/calder-mechanism-separation-20261123t1036z\`.
- Corrective head: \`69a36c5b10db68eb27e4b6c4beda7c5c4d7476f1\`.
- Exact-head Actions run: [#45160729529](https://github.com/Satobloc/HsH/actions/runs/45160729529), **SUCCESS**.
- Exact PR-head checkout assertion passed; the Lean/Lake build completed 8,948 jobs under Lean 4.34.0 / Lake 5.0.0.
- The six theorem-specific \`#print axioms\` outputs list only \`propext\`, \`Classical.choice\`, and \`Quot.sound\`. The retrieved job log contains no \`sorryAx\`, \`admit\`, or Lean error for this successful head.
- The separate global axiom-audit job, tests, lint, leanchecker, and nanoda were skipped. PR #2419 remains OPEN / DRAFT / UNMERGED at the latest cross-read; no formal review or review thread was present.
- The earlier runs #45159508269 and #45160145251 failed on prior heads. Their failures are historical and are not attributed to the successful corrective head.

The module proves conditional algebraic statements about order-even/order-odd decomposition, reconstruction from paired orderings, non-uniqueness from a single ordering, and collision in an explicitly additive scalar readout. It does **not** prove a physical response law, a source-to-geometry translation, a measured temporal-order effect, or the truth of any H(s)H premise.

## 2. Source-attribution correction

The published report's wording that the battery/centrifuge sketch is explicitly called “low-credence and low-priority” needs qualification.

- The author-labelled SAT archive note \`SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt\`, blob \`1a50bc22075cdef4b7d3e4ef58da6a0b87650011\`, does **not** contain that phrase. Its document date was not recovered. It is an exploratory proposal with unresolved scale, geometry, direction, and detectability questions; it is not a measured experiment or a P2 selection.
- The exact phrase occurs in the flattened transcript \`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH ARCHITECT.txt\`, blob \`926dd9685471f311570112ebc72d4c0be158f4c6\`, line 62. That line has no speaker marker; no matching raw JSON export was found in the checked dump directory. Speaker attribution remains unresolved. Treat it as a conversation-level assessment with unknown speaker, **not Nathan Direct**.
- The separate \`SRENA SAT2.txt\` source, blob \`fe01fc85b1874c1573843724f035ee292fd48961\`, lines 923–930, is explicitly the Nathan user-role passage. The following vortex-theory elaboration is assistant text.
- The 2026-11-08 Primary Operational Guideline, blob \`a8e333b1d5b5aa1d9772366945dd88769d24153c\`, §2.1, states the two-primitive worldline/worldtube–timesheet starting point and treats responsive medium as provisional. Its own provenance note identifies it as an assistant-prepared transcription of Nathan's direct statement, not a verbatim transcript; no immutable message UUID or export locator was available.

The source-attribution correction is already public in [issue #2420 comment #7099038659](https://github.com/Satobloc/HsH/issues/2420#issuecomment-7099038659). The original published artifact is not rewritten. The comment is a bounded cross-read, not a formal PR review or theory adoption.

## 3. Publication readback remains valid

- Public report: [issue #2420](https://github.com/Satobloc/HsH/issues/2420).
- Publisher artifact: \`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-h1042-s3-mechanism-separated-response-20261123t1036z-001.md\`.
- Publisher SHA-256: \`d0eed25619543ffaf6e5e3f77b547a18ba65bb58d355ae456a5cb7b17cdc16ae\`.
- Workspace report and publisher artifact were independently fetched and found byte-identical: 12,155 characters, same Git blob SHA-1 \`e62a027ef9da49cf02e4add8aa3850efc6ff020f\`.
- No new publisher intake, issue, or artifact was created.

## 4. Successor-slot reconciliation

The deterministic successor to h1042:s3 is **Hale, h1042:s4**. The :48 scheduler readback does not show that nominal slot executing:

- The last recorded :48 run was h1041:s4 (Ariadne), scheduled for 09:48Z, started at 10:41:52Z, and ended FAILED at 11:06:55Z with \`chat_ref=null\`.
- No h1042:s4 (Hale) run was observed. The next scheduled :48 occurrence is 11:48Z, h1043:s4 (Morrow).
- Therefore the existing Hale packet is \`TARGET_SLOT_NOT_OBSERVED / UNCONSUMED / REPOSITORY_ONLY\`. Its original \`POSTSTART\` label is superseded. It is **not** rerouted to Morrow.
- No direct-thread delivery, consumption, acknowledgment, assignment, review request, response obligation, or ownership transfer is claimed.

See the linked [Hale handoff amendment](../REVIVAL_ROTATION_HANDOFFS/2026-11-23T1036Z_from_s3_calder_to_s4_hale_AMENDMENT_01_TARGET_SLOT_AND_LEAN_STATUS.md).

## 5. Identity, campaign, and operational boundaries

- Historical Calder role evidence remains the 2026-09-12 worker-authored self-report in Common CHECKINS, blob \`886069e71d4aec7a3f8d199d6d889b930a05c17\`, lines 53–106. No separately signed Nathan-authored Calder charter was found. The empirical/statistical Calder remit remains distinct from the separate Foundational Covariance / Global Architecture Calder record.
- The recovered \`Construction Story Retelling\` conversation pointer \`6a8eacca-c470-83ea-af92-8fb8df194de9\` is a historical access pointer whose wake packet requires manual reopen. No authenticated live empirical-Calder thread or current worker identity was established.
- The :36 invocation for this nominal slot began after the h1042:s3 report and receipt had already been committed. Its scheduler result remained in progress with \`chat_ref=null\`; its cached result belonged to the earlier Aster slot. This amendment reconciles the existing run key and does not claim the prior report was produced by this invocation.
- P0 Code Grurple remains ACTIVE; P1 cognition remains OVERDUE / NOT READY / FROZEN / Orson-owned.
- The November 23 P2 first-draft and independent-hostile-review checkpoint is not demonstrated. P2 remains HOLD; no measured system or dataset is selected. November 30 major and December 14 full-theory gates remain separate; P3 is incomplete.
- No physical calculation, fit, numerical prediction, uncertainty propagation, falsification threshold, or independent measurement was performed. No BEDROCK, SAT-O, or Blockwave equation was changed; no theory promotion occurred.
- The PWH queue remains unchanged (WH-01, WH-02, and WH-05 open); task graph remains 18 records against 16 declared. All four Mersearch request lanes remain occupied/requested; no lane was changed or retriggered.
- FIE rereview is next due December 4; last full rereview November 20. The unrelated-reading break was completed November 21; neither was repeated.
- Existing :36 task ID, enabled state, exact hourly schedule, and Worldtube phase were preserved. No task, ID, prompt, schedule, phase, or ownership mutation; no sixth task.

**Superseding receipt state:** \`PUBLISHED_VERIFIED / LEAN_EXACT_HEAD_PASS / THEOREM_AXIOM_OUTPUT_READBACK / SOURCE_ATTRIBUTION_CORRECTED / HALE_TARGET_SLOT_NOT_OBSERVED / NO_PHYSICAL_TEST / P2_HOLD\`.
