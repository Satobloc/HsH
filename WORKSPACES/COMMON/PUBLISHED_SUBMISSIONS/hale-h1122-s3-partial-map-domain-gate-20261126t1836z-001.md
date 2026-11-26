# Workshop Relay :36 | Hale h1122:s3 | partial-map definedness-domain gate

**Run key:** `REVROT3-19-20261011:1122:s3`  
**Selection:** Hale (ring index 8); next Elias Kern (index 9).  
**Participation:** source-grounded assistant execution, not an authenticated historical Hale instance or thread.

## 1. Authority and continuity

Preflight read the live HsH BEDROCK (blob `ed791df242d6f3beddeaeeabd0d1ced3d1341e9d`), Steering Charter (blob `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`), Three Paper Campaign (blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`), three-repository onboarding (blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`), revival/thread-first controls, current branch, receipts and Hale workspace.

HsH main at preflight was `68ea2726b45a73b9892623d4e4c997a3178e6300`. HSH_RESOURCES inspection stopped at its root README and `indexes/AI_START_HERE.md`; no private payload or PRIOR_ART content was opened. SAT archive orientation was read at its root front door.

Hale's September 12 Common Check-in is a worker self-report about external literature/arXiv scanning, matched-period comparison, Python/scoring/statistics, controls and calibration. Sable's `REV-006-HALE-REENTRY.md` is an assistant-maintained reconstruction. The earlier "Protocol Designer" label is not a verified standalone Nathan-authored charter. No signed specialist charter or authenticated current Hale thread was recovered. The current user-supplied Lane 36 charter governs this execution without permanently reassigning Hale's historical remit.

The h1103:s3 Hale report and canonical receipt were read. That work concerned thumbnail-cache integrity and discovery idempotency; it was not repeated.

## 2. Substantive improvement: partial-map domain equality

Existing work already separates intersection/restriction from coordinate projection, freezes candidate maps and parameter domains before holdout access, and formalizes fibre-constancy/factorization. A remaining distinction is that **agreement on the intersection of two partial-map domains does not establish equivalence of the partial maps**.

Represent a partial geometry-to-observable route as:

\[
F:X\to \operatorname{Option}(Y),\qquad
D_F=\{x\in X\mid F(x)\ne\operatorname{None}\}.
\]

For routes \(F,G\), agreement on \(D_F\cap D_G\) is only restricted agreement. One route may silently exclude source-supported configurations while matching the other everywhere both return values.

Full extensional equality requires:

1. \(D_F=D_G\); and
2. equal returned values on that domain.

This is distinct from parameter-domain freezing, covariance composition and factorization through a realized image.

### Proposed map-family acceptance addition

For each pair of candidate chains, record the frozen source-supported set \(S\), route identities and composition order, \(D_F\), \(D_G\), their intersection, the route-specific exclusions \(S\setminus D_F\) and \(S\setminus D_G\), and value agreement on the shared domain.

Do not silently discard route-specific undefined cases by intersecting domains. If comparison is intentionally restricted to a declared \(D\subseteq S\), report that restriction and do not generalize it to full-map equivalence.

A domain difference is a candidate physical discriminator only when both domains are independently justified by source-defined geometry and actual measured conditions. Otherwise it is an implementation, definition or source-coverage discrepancy, not a physical prediction.

This gate forces no worldtube thickness, twist or contact surface. Those remain optional unless source-faithful geometry and independent constraints require them.

## 3. Lean 4 formalization

Opened draft [PR #2625](https://github.com/Satobloc/HsH/pull/2625) in the existing formal-verification project, using its pinned Lean 4.34.0 / Mathlib v4.34.0 workflow.

- Base branch: `infra/lean4-verification-20261023`, head `08b73a3f60003b5b245cb8f012faa13ff045154c`.
- Exact PR head: `79b3aea1cbd11daf91baceebb152326985f7c110`.
- Module: `FORMAL_VERIFICATION/HsHVerification/PartialMapDomainGate.lean`.
- Module blob: `2adcbac19ec366aacba83c212071da5623f9326e`.
- Root aggregator blob: `8dc9aee112e91218888976826949ec9cf82890eb`.

The module contains `partialMap_ext_iff_domain_and_values` and a finite Bool/Unit counterexample showing common-domain agreement without equal domains. The witness is purely logical, not a physical fixture. The module introduces no `sorry` or custom axiom; a theorem-specific `#print axioms` result has not yet been produced.

Exact-head workflow [#45877791513](https://github.com/Satobloc/HsH/actions/runs/45877791513), job `140109174007`:
- Exact PR-head checkout assertion: PASS.
- Lake dependency-manifest generation: SUCCESS.
- Lean/Mathlib compilation: IN_PROGRESS at report preparation.
- Final conclusion: not yet returned. Status is `LEAN_PENDING`, not `LEAN_VERIFIED`.

The local runtime has no `lean`, `lake` or `elan`; the existing Actions workflow is the execution route. Three companion `conversation-json-content-ci` push runs had zero jobs and are not Lean test results. PR #2625 is DRAFT / OPEN / UNMERGED. No merge, Factory Floor promotion, BEDROCK edit or paper-gate advancement is requested. If exact-head Lean succeeds, the source-linked Factory Floor intake must remain pending until independently acknowledged.

Lean can verify only the formalized statements. It cannot validate source-to-geometry translation or physical premises.

## 4. Existing methods and source limits

Checked the existing map-family freeze, typed projection/coarse-graining order analysis, Nadir factorization work, current Lean PRs and the existing Lean workflow before adding this narrow theorem. Nadir PR #1189 (OPEN/DRAFT) formalizes induced coarse-graining on the realized image iff fibre constancy; it does not require equality of two partial routes' definedness domains. PRs #2451 and #2458 remain separate OPEN/DRAFT feature-identifiability and covariance-composition work.

The existing Math Hopper smoke workflow and bounded three-repository pilot were inspected. The panorama records the pilot as configured but end-to-end execution NOT VERIFIED; Math Hopper is extraction/provenance intake, not a proof engine. The Whirligig R/Q README distinguishes the current browser's inner-wall Analemma branch from the older standalone outer-wall solver; they are sandboxed and not implementation-equivalent or evidence of a physical isomorphism. No Whirligig or Math Hopper work was rebuilt or modified.

HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES each report zero forks. SciSpace is available as a connected app but was not needed. No new tool, dependency, subscription, paid service or external dataset was introduced.

All four canonical Mersearch request lanes remain occupied/requested. The legacy lane-1 request and lane-2 through lane-4 request files were inspected. No lane was released or overwritten and no Mersearch query was run. This is an assistant-authored workflow proposal, not a recovered Nathan Direct equation or original SAT-O/Blockwave claim. Neither equation set was changed.

## 5. Evidence and stop conditions

| Question | Result |
|---|---|
| Full equivalence of two partial routes | Requires equal domains and equal values |
| Agreement only on overlap | Restricted comparison only |
| Domain mismatch as physical prediction | Requires source-defined maps and measured conditions |
| Worldtube thickness, twist or contact surfaces forced | Not established |
| Physical system, dataset, calibration or holdout selected | No |
| Empirical falsification threshold | Not available |

The last verified discovery state before this run had 18,056 documents, 48 docket entries, 417 square visuals and six extraction errors. The last full record-level parse found 11,120 workspace records missing `presentation_state` and carrying generic browse-reader targets. P0 presentation safety remains FAIL; Paper A/B live-route acceptance is NOT OBSERVED, deployment is NOT VERIFIED, and release/standdown is NOT AUTHORIZED. No P0 route, deployment, queue or task-graph action was taken.

PWH remains Tern-owned; the internal queue/graph are stale relative to the latest published review. P1 cognition remains Orson-owned/FROZEN, P2 November 30 HOLD, P3 December 14 INCOMPLETE, and FIE rereview remains due December 8. No PWH mutation was made.

## 6. Publication, receipt and successor

This public-safe report is submitted through the existing fixed-destination issue publisher. Publication is not complete until the publisher comment and independent artifact readback match the declared SHA-256. If the asynchronous Action remains pending, status stays `SUBMITTED_NOT_VERIFIED`.

No Hale BOOT/CURRENT_WORK overwrite was made. No authenticated Hale thread was established. Next deterministic label: Elias Kern. No handoff, assignment, direct-thread delivery, consumption or acknowledgment is claimed.

The existing :36 task identity, enabled state, hourly phase and prompt remain unchanged. No sixth task, scheduler mutation, signet or conversation rename.

### Tocktick

- **Focus:** partial-map definedness versus agreement on overlap.
- **Immediate action:** obtain the exact-head Lean result; fix only PR #2625 if it fails.
- **Stop:** no merge, physical interpretation, theory promotion or P0 release action.
- **Return:** PR #2625, Lean run #45877791513, and the publisher issue/receipt.
