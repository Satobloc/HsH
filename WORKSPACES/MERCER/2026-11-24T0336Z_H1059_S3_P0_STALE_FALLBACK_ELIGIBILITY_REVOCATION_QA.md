# Mercer h1059:s3 | P0 stale-fallback eligibility-revocation QA

**Run key:** `REVROT3-19-20261011:1059:s3`  
**Nominal UTC:** 2026-11-24T03:36Z  
**Disposition:** `NEW_CONDITIONAL_REGRESSION_GAP / SOURCE_MATCHED_CONTROL_FLOW_REPLAY_PASS / NO_CODE_CHANGE / P0_ACTIVE`.

## 1. Selection, authority, and source

`h=1059`; `seq=5h+3=5298`; `5298 mod 19=16`.

- Selected routing label: **Mercer**, index 16.
- Next: **Ravel**, index 17.

The historical direct user-role source is the October 1, 2026 *Quantum Gravity and Experiments* export: conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, raw Git blob `d828fef5352045cb4d9486fdbeabd04043c4c119`, user message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` at 2026-10-01T20:56:07.264Z. It assigns Mercer the historical :48 equations, dimensional-analysis, constitutive-physics, coarse-graining, forces, and quantitative-consequences remit. No standalone signed Mercer charter was found.

The live Code Grurple roster (blob `cc96c0bfafc95c54e7960899c7306031e5abce17`) supersedes that broad remit for this activation: **Mercer is restricted to independent Paper A/B presentation QA; Meridian owns implementation; Tern retains P0 release/standdown authority.** This is assistant-level source-grounded work, not an authenticated Mercer instance/thread or a claim of historical-worker participation.

Preflight read the live BEDROCK (`2629ab29a5838d933c31727455553d206577a258`), Steering Charter (`9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`), Three Paper Campaign (`2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`), three-repository onboarding, current branch, revival/thread-first controls, Mercer README/CONTINUITY, prior Mercer receipt, latest Enheduanna receipt, current Tern PWH review, and the historical Mercer source message. One old-archive source was also read: `SATOBLOC MISC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`. Its 1D-filament/4D-worldtube, hyperhelix, action, phase-locking, and topology statements remain historical SAT-O source, not current H(s)H proof or presentation authority. Current HsH presentation controls read: Presentation Gate `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`, Reader Routing Registry `277a94c553e2e17b61bb046a04781b4e44f2229f`, Presentation Contract `b871249564a45278383e41eebd8aaa5d8c64aa3c`.

Mersearch was not exposed as a callable action; no request lane was overwritten or retriggered. No private HSH_RESOURCES payload was opened.

## 2. New QA finding: stale fallback bypasses current eligibility exclusions

PR [#2009](https://github.com/Satobloc/HsH/pull/2009), exact head `f638cb3ce94006609b4ba3f7c6e2c5724048c45d`, contains a conditional stale-fallback policy-revocation gap.

Source at that exact head:
- `tools/site_discovery.py` blob `2c2db5f7f4878555d8031e6bb14b1e846de0cbe5`.
- `tests/test_site_discovery.py` blob `c828f2af42c036ec63c7bf9814be35711f043b04`.

The current eligibility predicate excludes paths matching `prior[_ -]?art|quarantine|science[ _-]+made[ _-]+stupid` (case-insensitive), as well as generated/control paths. The normal fresh-tree path applies `eligible(f['path'])` before adding records.

The stale-repository fallback instead iterates last-good records without reapplying `eligible()`:
- eligible-looking workspace records are made readerless and excerptless, but their path/title/metadata remain in public discovery;
- non-workspace records are appended unchanged, including any old reader target and excerpt.

Therefore, if a last-good snapshot contains a path that is now excluded under the current policy, a failed repository scan can re-emit it. This is a **conditional latent regression**, not evidence that the current discovery snapshot contains a quarantined or prior-art record.

### Executed source-matched control-flow replay

A bounded Python replay copied the exact predicate and stale-fallback branch semantics from the PR-head source. Synthetic placeholders were used; no private or actual quarantined content was accessed.

| Prior record path | Fresh `eligible()` | Stale fallback |
|---|---:|---|
| `WORKSPACES/QUARANTINE/SECRET.md` | false | retained as metadata-only workspace record |
| `LIBRARY/PRIOR_ART/SECRET.pdf` | false | retained unchanged, including reader/excerpt |
| `LIBRARY/presented/APPROVED.md` | true | retained as positive control |

All assertions passed. The replay establishes the control-flow possibility; it is not a full-module test, repository snapshot finding, CI run, or proof that any such record is currently exposed.

The existing `test_stale_repository_sanitizes_legacy_workspace_records` covers an eligible workspace record and an eligible non-workspace positive control. It does not seed a previously indexed path that is now excluded.

### Smallest corrective rule

Reapply the current eligibility predicate before retaining any last-good record in the public discovery output:

```python
path = prior.get('path', '')
if not eligible(path):
    continue
if workspace_record(path):
    safe = dict(prior)
    safe['reader'] = None
    safe['presentation_state'] = 'PRESENTATION_PENDING'
    safe.pop('excerpt', None)
    safe.pop('excerpt_scope', None)
    documents.append(safe)
else:
    documents.append(prior)
```

Add stale-fallback regression cases for an excluded workspace path, an excluded non-workspace path, an eligible workspace record, and an eligible non-workspace positive control. Preserve any needed last-good provenance outside the public discovery projection; do not re-emit a currently excluded path merely because it appeared in an older snapshot.

## 3. Formal boundary and existing work

Existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471), module `HsHVerification.CodeGrurpleDiscoveryProjection`, formalizes a `repositoryStale` transition that closes raw reader/excerpt surfaces while preserving inventory, metadata, and docket decisions. It does not model a separate current-eligibility predicate or policy revocation. Its theorem therefore does not establish that stale fallback omits paths newly excluded by current policy.

The additional invariant suitable for a future formal extension is:

\[
\forall r \in D_{\mathrm{stale}},\quad \mathrm{eligible}_{\mathrm{current}}(r.\mathrm{path})
\]

and hence:

\[
\neg\mathrm{eligible}_{\mathrm{current}}(p)
\Rightarrow p\notin D_{\mathrm{public}}.
\]

No Lean run is claimed. This runtime has no local `lean`, `lake`, or `elan`; this activation is limited to independent P0 QA, and no branch/CI change was authorized or made. PR #1471 and PR #2009 were not modified. The Python control-flow replay is not a Lean proof.

## 4. Current P0 state and boundaries

Meridian's h1059:s2 full discovery readback at 2026-11-24T03:20:55Z reported 17,623 documents, 10,691 workspace records, 10,691 generic workspace reader targets, 10,445 workspace excerpts, 10,691 missing `presentation_state` fields, zero `PRESENTATION_PENDING` records, and 48/48 workspace entries in the rolling docket. It also reported six extraction errors and 577/417 total/square visuals. P0 discovery-record safety remains **FAIL**.

At that readback, generated-discovery commit `678ce147721f1f493c5f4acd49eace6e371978c6` was current to its parent `fe9dfb6b5b16453e4775c263010151ffb7e235de`. Main subsequently advanced to `b9dde9cbba063b70ad445688c795bc6279f5ed54` with the Meridian h1059:s2 receipt and BOOT/CURRENT_WORK continuity updates. Discovery refresh run [#45321151378](https://github.com/Satobloc/HsH/actions/runs/45321151378) was pending at the last read. Thus the 03:20:55Z snapshot is the last fully parsed snapshot, not a fresh-current claim for the later main head.

The eight protected Paper A/B source/control objects were re-fetched by Meridian and matched their existing pins. Paper A and Paper B still have generic discovery reader targets; these are not the Code Grurple legacy `paper.html?id=...` routes. The generated PDF index contains only Cruller-Rubin R0. The actual Paper A/B legacy routes remain `PENDING / NOT_OBSERVED`. Browser access requires an originating browser context, which was unavailable; no route probe or live-rendering claim was made.

PR #2009 remains OPEN / DRAFT / UNMERGED at the head above, four commits ahead and 5,744 behind its merge base at the Meridian readback, with no submitted formal reviews. Its only located exact-head Actions run, #45139869294, was a different workflow with zero jobs; prior 5/5 targeted local replay plus `py_compile` is not CI evidence. No rebase, code edit, merge, deployment, or owner transfer occurred.

Tern retains P0 release/standdown authority; Meridian retains Paper A accepted-R1 implementation/support; Mercer remains independent Paper A/B QA only.

## 5. Campaign, cadence, and scheduler

- P1 November 9 cognition paper: overdue, frozen, Orson-owned, not ready.
- P2 November 30 major paper: HOLD; the November 23 first-draft/hostile-review gate is not demonstrated.
- P3 December 14 full-theory paper: incomplete.
- FIE last full review November 20; next target December 4.
- Unrelated-reading break last completed November 21; not repeated.
- Tern h1058:s4 completed the triggered PWH deep review; no duplicate review or queue/graph mutation was made.
- No physical system, dataset, calculation, fit, prediction, uncertainty propagation, or falsification threshold was introduced. No SAT-O/Blockwave equation change or BEDROCK promotion.
- No new tool, dependency, subscription, fork, or expenditure.

The existing :36 Worldtube task remains enabled with its original task ID `6a9f52b69ec08191b0a2ba24a074f781`, original hourly America/New_York :36 schedule, and original prompt/phase. No scheduler mutation or sixth task.

The current automation record shows this h1059:s3 run `IN_PROGRESS`, with `chat_ref=null`; its cached latest result belongs to Enheduanna h1058:s3 and is not this run's result. No authenticated Mercer or Ravel thread, cross-thread delivery, handoff consumption, or acknowledgment is claimed.

## 6. Return position

**NOW:** A new conditional stale-fallback eligibility-revocation gap is reproduced against the exact PR-head control flow. It is distinct from the already known workspace reader/excerpt sanitization issue.

**NEXT:** Meridian should add the `eligible(path)` guard and the four-case stale-fallback test matrix; then rerun the exact PR-head tests and appropriate CI. Tern decides P0 acceptance/standdown. The formal model may later add a separate current-eligibility dimension, but this run did not alter it.

**STOP:** No PR code modification, no merge, no route probe, no deployment, no manuscript work, no theory promotion, no task reassignment, and no scheduler change.
