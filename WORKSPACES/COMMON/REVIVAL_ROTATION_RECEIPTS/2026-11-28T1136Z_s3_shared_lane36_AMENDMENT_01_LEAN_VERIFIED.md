# Amendment 01 — mode-aware checkout policy exact-head Lean verification

**Canonical receipt:** `2026-11-28T1136Z_s3_shared_lane36.md`  
**Run key:** `REVROT3-19-20261011:1163:s3`  
**Prepared:** 2026-11-28T12:07Z  
**Classification:** APPEND-ONLY VERIFICATION AMENDMENT / SAME NOMINAL RUN KEY

## 1. Duplicate-run reconciliation

The exact h1163:s3 canonical receipt and public report already existed on current main. The duplicate-run guard therefore prohibited a second substantive report, receipt, issue, PR, handoff, scan or calculation. This amendment records the one incomplete step identified in the existing run: exact-head verification of the corrected mode-aware PR revision.

The selected routing label remains Alberr (index 4), next Mira (index 5). Alberr's controlling README and Nathan's September 22 direct reentry signal preserve manual reentry, total autonomy, no task/lease/review/response obligation, and no authenticated current Alberr thread. There is no standalone signed Nathan-authored specialist charter. This remains assistant-level shared Lane 36 workflow work, not Alberr participation or assignment.

Mira remains under the Code Grurple quarantine interlock. No Mira workspace, inbox, private material or successor handoff was created. No direct-thread delivery, consumption, acknowledgment or ownership transfer is claimed.

## 2. Interpretation correction

The original source-cut note and first draft of PR #2757 overconstrained the discovery workflow by treating event-head/checkout-head equality as universal. That is not correct for the current `.github/workflows/refresh-site-discovery.yml`, which intentionally operates as a latest-main convergence workflow.

The event-head/checkout-head difference is therefore not, by itself, a failure. The actual observed issue is narrower:

- The second queued run scanned the first generated-only commit and accurately recorded that checkout/source cut.
- The sorted document and visual inventories, document IDs and error sets were unchanged.
- Four transient `revision_detected` flags reset despite unchanged source blob SHAs.
- Run metadata, source-head fields and `checked_at` changed, producing another generated-only commit.

The appropriate architecture is a stable `PublishedKey` separated from a run-specific `ScanReceipt`, with a validated no-op when the stable output-determining content key is unchanged and cached outputs independently validate.

The corrected PR models two legitimate policies:

- `EventPinned`: checkout head equals the immutable event head.
- `LatestMain`: checkout may be newer than the event head, but the actual checkout is recorded.

For either mode, safe publication requires complete scans, the generated commit directly descending from the actual checkout, and final readback showing current main equals the generated commit. This is a source/publication contract, not a production workflow repair.

## 3. Exact-head Lean verification

[PR #2757](https://github.com/Satobloc/HsH/pull/2757) now has corrected exact head:

`6f276103372cf5bc3269fd775ec8d7b241048252`

The previous exact-head run #46141714807 verified the earlier overconstrained model and does not verify this revision.

The corrected exact-head run [#46142482144](https://github.com/Satobloc/HsH/actions/runs/46142482144) completed SUCCESS.

- Job: `140971287810`.
- Started: 2026-11-28T12:00:07Z.
- Completed: 2026-11-28T12:04:40Z.
- Exact PR-head checkout assertion: PASS.
- Lean: 4.34.0.
- Lake: 5.0.0.
- Full verification root: 8,949 successful jobs.
- New module `HsHVerification.DiscoveryEventCheckoutWitness`: built at 8,947/8,949.
- Root aggregator: built at 8,948/8,949.

The six inspected theorem-specific axiom outputs report:

| Theorem | Axiom output |
|---|---|
| `safe_publication_binds_generated_parent_to_checkout_head` | None |
| `event_pinned_publication_binds_parent_to_event_head` | None |
| `latest_main_publication_can_have_event_checkout_difference` | `propext` |
| `source_cut_binding_does_not_imply_current_at_readback` | `propext` |
| `current_at_readback_does_not_imply_generated_parent_binding` | `propext` |
| `same_published_key_does_not_imply_source_cut_binding` | `propext` |

No `sorryAx` appeared in the six inspected target theorem outputs. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

**Formalization limit:** commit identifiers are abstract `Nat` tokens. Lean does not authenticate GitHub events, repository contents, inventories, scan completeness, generated JSON, branch state or the translation to the live workflow. This is a software workflow-contract proof, not an H(s)H physical theorem.

PR #2757 remains OPEN / DRAFT / UNMERGED. Independent review remains outstanding. No production workflow modification, merge, deployment or release is claimed.

## 4. Public publication reconciliation

The original [issue #2758](https://github.com/Satobloc/HsH/issues/2758) and artifact remain unchanged.

- Submission: `workshop-relay-h1163-s3-discovery-event-checkout-race-20261128t1136z-001`.
- Artifact blob: `3ed4e70d1ce177bd156feb0abc08d4c9d1e4c3fe`.
- Stored SHA-256: `d37ef33f6b69f2f3bae70bff5755959d3b7f5bee8aa10d253e336d04ce274fbc`.
- Independent current issue-envelope/artifact comparison: exact equality.
- Independent SHA-256 recomputation: exact match.
- Artifact length: 12,032 characters.

The public issue received append-only verification comment [#7239054288](https://github.com/Satobloc/HsH/issues/2758#issuecomment-7239054288). No duplicate issue or submission was created.

## 5. P0 currentness and release boundary

The later readback of the workflows referenced by the original receipt shows:

- Discovery run [#46142357540](https://github.com/Satobloc/HsH/actions/runs/46142357540): SUCCESS on event head `8c78525e1f3237fd8251bd403cd86c6f233758a2`.
- Navigation run [#46142357471](https://github.com/Satobloc/HsH/actions/runs/46142357471): FAILURE on the same event head.
- Conversation-JSON CI [#46142356597](https://github.com/Satobloc/HsH/actions/runs/46142356597): FAILURE with zero jobs.
- Viewer-catalog run [#46142112360](https://github.com/Satobloc/HsH/actions/runs/46142112360): SUCCESS, but on earlier source head `e166676cb1849dc49b20076936a537e942ef435c`; this does not establish Paper A/B live-route acceptance.

At final branch readback, main was `d26c4b1f52b60333a3475b25f32a43d23caddd90`. No successful current-main navigation acceptance or live Paper A/B route readback was established.

Unchanged P0 disposition:

- Source-level presentation safety: FAIL.
- Paper A/B live routes: NOT_OBSERVED.
- Deployment: NOT_VERIFIED.
- Release/standdown: NOT_AUTHORIZED.

No P0 implementation, deployment, route, release, queue, task graph, manuscript or theory state was changed. Tern retains P0 release authority.

## 6. Scheduler and next cursor

The existing :36 task remains enabled with task ID `6a9f52b69ec08191b0a2ba24a074f781`, exact hourly America/New_York :36 schedule and original prompt/phase unchanged.

Automation readback for this invocation showed the h1163:s3 run ID `81d7ef9d-4ce8-8331-90f9-aa8c92a20a57` as IN_PROGRESS, scheduled for 11:36Z and started at 12:07:11Z, with `chat_ref=null`. Its `latest_result` still belongs to the preceding h1162:s3 Orson run, not this h1163 attempt. Repository and CI completion must not be misattributed to scheduler-wrapper completion or an authenticated chat.

**Next technical cursor:** independent review of the mode-aware `PublishedKey`/`ScanReceipt` boundary, then verify a validated no-op against the actual discovery workflow. Preserve the distinction between stable content identity, run metadata, actual checkout, generated parent and final branch readback. Do not alter the P0 production branch or claim route acceptance.
