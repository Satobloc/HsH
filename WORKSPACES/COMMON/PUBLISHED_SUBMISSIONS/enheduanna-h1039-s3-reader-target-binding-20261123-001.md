# Typed reader-target binding: the missing edge in the Code Grurple presentation proof

**Run:** `REVROT3-19-20261011:1039:s3`  
**Classification:** assistant-authored P0 architecture review; source-grounded proposal, not Nathan Direct, not a formal review, and not a theory premise.  
**Disposition:** `REFINEMENT_REQUIRED / NO_CODE_CHANGE / LIVE_ROUTE_NOT_OBSERVED`

## Finding

The current Code Grurple model can establish that a visible reader target is accompanied by a current, source-bound presentation derivative. It cannot establish that the *actual default target* is that derivative.

In `FORMAL_VERIFICATION/HsHVerification/CodeGrurpleObservationGate.lean` at PR #1471 head `60df9a77d938689910a96640cb649eb9f462fa58`, `DiscoveryProjection` carries `sourceBlob`, `derivativeSourceBlob`, `derivativeDigest`, derivative-existence/verification flags, `readerTargetVisible : Bool`, and `excerptVisible : Bool` (lines 941–958). `projectionSafe` requires `presentationReady` when either visibility flag is true (981–985). The theorem `reader_target_requires_current_presentation` proves exactly that implication (1005–1009).

That is a valid conditional theorem about the declared abstraction. But the abstraction has no `readerTargetKind`, target path/artifact reference, or equality binding between the serialized target and `derivativeDigest`. A concrete record whose default target still points to raw `WORKSPACES/**` source and one whose target points to a verified presentation derivative can therefore collapse to the same modeled state: `readerTargetVisible = true`, with a current derivative elsewhere in the record. The model cannot distinguish those two realizations.

The same omission affects excerpts: `excerptVisible` is a Boolean and is not bound to a derivative digest or to a separately approved sanitized excerpt artifact. The route-observation witness (lines 754–762) records route/deployment IDs, source blob, derivative digest, browser-context/capture digests, and `sourceBindingVerified`, but no explicit reader-target reference or served-content digest connecting the public target to the derivative.

This is a **refinement gap**, not a counterexample to the existing Lean theorem and not evidence that a live visitor received raw source.

## Source-policy comparison

The live presentation policy is more specific than the current abstraction:

- `PUBLIC_SITE/PRESENTATION_GATE.md` says a reader document must be routed through a presentation derivative; raw source is secondary, and without a derivative the public state is presentation-pending (lines 11–15, 30–38, 53–67).
- `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` explicitly default-denies `WORKSPACES/**` unless an explicit presentation derivative nominates a particular artifact, and says a manually constructed URL must not bypass that rule (lines 7–26, 28–39, 65–73).
- PR #2009, head `ee582b8de93f88f49445c211892529c40b47fded`, implements a safe interim generator rule: workspace records retain metadata but receive `reader: null`, `PRESENTATION_PENDING`, no excerpt, and no rolling-docket membership. Its fixture removes legacy A/B raw targets and excerpts while preserving a non-workspace positive control. Its body explicitly says the broader derivative-routing registry is not implemented.

PR #2009's blanket workspace default-deny should remain intact as the fail-closed repair. The missing positive path should be a separate, explicit derivative-binding contract, not a reason to weaken the current default-deny.

## Proposed typed contract

Use a local operational type, not a new SAT/H(s)H symbol:

```text
ReaderTarget :=
    None
  | PresentationDerivative { artifactRef, sourceBlob, derivativeDigest }
  | RawSourceSecondary { repository, path, sourceBlob }

ExcerptBinding :=
    None
  | DerivativeExcerpt { derivativeDigest, excerptDigest }
  | ApprovedSanitizedExcerpt { artifactRef, sourceBlob, sanitizerVersion, approvalRef }
```

For the **default** reader target:

1. `RawSourceSecondary` is never an admissible default target. It may exist only behind a deliberate secondary SOURCE/RAW action.
2. A `PresentationDerivative` target is admissible only when its `sourceBlob` equals the indexed source blob, its target digest equals the registered and verified derivative digest, its presentation state is `PRESENTED`, and its snapshot is current.
3. `None` maps to `PRESENTATION_PENDING`; it cannot coexist with a visible excerpt or default reader target.
4. An excerpt must bind to the same verified derivative or to a separately identified, approved sanitized artifact. A mere `excerptVisible = true` flag is insufficient.
5. A route-observation witness must carry the same target/artifact reference and an independently captured served-content digest. The browser capture must be tied to the exact route and deployment; `sourceBindingVerified` should summarize evidence, not replace the evidence reference.

The intended identity chain is:

`source blob → derivative artifact/digest → discovery reader target → deployment route → captured served-content digest`

Every edge needs an explicit equality or verification condition. A current derivative elsewhere in the record must not authorize an unrelated target.

## Regression matrix

| Case | Expected result |
|---|---|
| Workspace source, no derivative | Metadata only; pending; no default reader, excerpt, or docket entry |
| Workspace source with explicitly registered, verified derivative | Reader target equals that derivative; raw source remains secondary |
| Verified derivative exists, but default target is raw workspace source | Reject |
| Target digest or source-blob binding differs from registered derivative | Reject |
| Excerpt is raw-source-derived or has no provenance binding | Reject or suppress |
| Snapshot/source becomes stale | Clear default reader and excerpt; return to pending |

PR #2009 already covers the first case and a non-workspace positive control. The second case is the missing positive control before the explicit `WORKSPACES/**` derivative exception is implemented. The third through fifth cases are adversarial identity-binding controls.

## Verification and epistemic limits

PR #1471 remains OPEN / DRAFT / UNMERGED. Its current head has an actual exact-head GitHub Actions run, [#45008989924](https://github.com/Satobloc/HsH/actions/runs/45008989924): the `Assert exact PR-head checkout` and Lean compilation steps succeeded; the full build completed 8,945 jobs. The retrieved theorem-specific axiom output includes `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in the retrieved log. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

No new theorem was added or compiled in this run. The local runtime has no `lean`, `lake`, or `elan` executable, and this run did not edit Meridian's PR branch. A new theorem is **FORMALIZATION_BLOCKED_BY_MISSING_BINDING_TYPES** until the source/target/derivative and excerpt identities are represented. The existing exact-head build verifies the current formalized statements only; it does not prove that a real discovery record or live route serves the derivative.

As of the latest P0 control readback, the 07:44:56Z discovery snapshot was fresh at main `62111603c43779d4bc8f65f8ba3b4a446d485d5c`, but later Tern receipt/inbox/PWH commits advanced main to `1cdf470c751b0d13b25f4826af93216c54e34b9b`. Thus the last snapshot is now stale against current main. Its record-safety finding remains FAIL; live route acceptance remains NOT OBSERVED. PR #2009 is still open/draft/unmerged and GitHub currently reports `mergeable=false`. No new current-main index counts or live-route behavior are inferred.

No route was probed, no deployment or site edit was made, no manuscript/feed/source object was changed, no physical system or dataset was selected, and no physical calculation, fit, prediction, or falsification threshold was produced. No BEDROCK, SAT-O, Blockwave, or theory-status change.

## Routing recommendation

Tern retains P0 release/standdown authority; Meridian retains implementation ownership; Mercer retains independent Paper A/B presentation QA. This report is a bounded architecture finding for Tern to route to Meridian if useful. It is not a request to merge, rebase, assign work, or change task ownership. Keep the current fail-closed repair and live-route acceptance gate unchanged until the appropriate owner supplies the missing typed binding and independent route evidence.
