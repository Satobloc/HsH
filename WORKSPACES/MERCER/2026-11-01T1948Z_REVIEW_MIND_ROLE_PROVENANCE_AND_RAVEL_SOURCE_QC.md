# Mercer :48 Review-MIND | Role provenance and cross-lane source QC

**Nominal occurrence:** 2026-11-01T19:48:00Z  
**Run key:** `REVROT3-19-20261011:523:s4`  
**Selection:** Mercer, ring index 16  
**Ring-next:** Ravel, index 17  
**Next nominal key:** `REVROT3-19-20261011:524:s0`

## 1. Historical role provenance

The current :48 prompt explicitly assigns the Review-MIND lane and controls this execution.

A later direct user-role source dated 2026-10-01 establishes the historical :48 Mercer remit as equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. It authorizes sandboxed theorizing, derivation, competing architectures, predictions, and solver construction while requiring source/invention separation and prohibiting target-fitting. The exact internal source locator is retained in the current conversation rather than replicated into this public HsH workspace.

The earlier 2026-09-13 workflow-control record is assistant-authored. It reports a direct Mercer invitation and a broad archive/indexing role, but the recovered user-role messages in that conversation authorize general duty division and corpus tagging without themselves naming Mercer. The specific September 13 Mercer-named invitation therefore remains unverified from those recovered user-role messages. This does not disprove that another direct invitation exists.

No authenticated current Mercer ChatGPT thread ID was recovered. The current automation conversation is not treated as a historical Mercer thread. No cross-thread delivery is claimed.

## 2. Current project boundary

The live Code Grurple roster remains ACTIVE. Paper A and Paper B remain at their pinned R1 states. The only reopened work remains the shared reader-presentation repair. No manuscript, equation, paper source, or production route was modified.

Current hashes are unchanged from the preceding audit:
- Code Grurple roster: `cc96c0bfafc95c54e7960899c7306031e5abce17`
- Presentation gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`
- Reader routing registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`
- Papers feed: `e3552fdac0f187b066b59a9742563094efffe011`

Site-editor issue #619 remains open with no new editor route or new comment. No site-capable editor action was present in the connected tool inventory. No route probe or deployment was attempted.

Mersearch itself was not exposed as a connected action. All four existing request lanes were occupied or pending, so none was overwritten. Bounded GitHub code search across HsH, HSH_RESOURCES, and SAT_THEORY_ARCHIVE_2023-25 was used as fallback; this is not claimed as a full Mersearch run.

## 3. Cross-lane QC: Ravel helion report

The existing published report is issue #1202 and its artifact is already present. The issue body is a publisher JSON wrapper; after extracting its `content` field, it exactly matches the published Markdown artifact. No duplicate issue or artifact was created.

The accepted manuscript by Camsonne et al., *JLab Measurements of the ^3He Form Factors at Large Momentum Transfers*, Phys. Rev. Lett. 119, 162501 (2017), DOI 10.1103/PhysRevLett.119.162501, gives:
[
A(Q^2)=\frac{F_C^2(Q^2)+\mu^2\tau F_M^2(Q^2)}{1+\tau},
\qquad
B(Q^2)=2\tau\mu^2F_M^2(Q^2),
qquad
\tau=\frac{Q^2}{4M^2}.
]

Ravel's published report §4 instead prints:
[
A=F_C^2+\frac{2}{3}\tau F_M^2,
\qquad
B=\frac{4}{3}\tau(1+\tau)F_M^2.
]
Those expressions do not match the cited paper's convention as written. If an alternate normalization is intended, it needs an explicit definition and conversion map. This is a source-convention mismatch, not a new physical result.

An additive correction was posted to the existing issue #1202:
- Comment: #6563109997
- SHA-256 of exact comment body: `61fc57ab1fe7cc5da9029fd920e709ddb66cac0686ea1c47d415254276dd78cb`
- Independent comment readback: EXACT MATCH

The existing `RavelHelionJLabE04018DataGate.lean` encodes Table II absolute-magnitude rows and finite arithmetic checks. It does not encode the cross-section equations above. The successful PR #993 merge-ref build therefore does not verify the formula printed in §4.

## 4. Ravel Lean build replay

PR #1133 Actions run #41311632856 checked merge ref `598f108f...`, merging PR head `2bb2a50684af5316958dbbf11e79afcaeccea1b2` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.

The new `RavelFiberTransportNonuniqueness.lean` target built at [8947/8949]. Its inspected theorem outputs:
- `oneDimensionalFilament_threeDimensionalSpatialSection_dimension`: no axioms.
- `spatialSectionExtension_has_zero_normal_rank`: no axioms.
- `changeFiberCoordinates`: [propext, Quot.sound].
- `move_base_projection`: [Quot.sound].
- `base_projection_does_not_determine_transport`: [Quot.sound].
- `bool_same_projection_different_fiber`: [propext, Quot.sound].

The full build FAILED in the pre-existing `RavelTwoFormCurrentProjection.lean` at lines 114, 117, and 138. The affected downstream theorem outputs contain `sorryAx`. The new module itself had no retrieved `sorryAx`, but the overall PR build is not successful.

Correct classification: **NEW_MODULE_TARGET_COMPILED / FULL_MERGE_BUILD_FAILED_IN_EXISTING_MODULE / EXACT_HEAD_NOT_VERIFIED**. No Ravel code or PR was modified.

## 5. MIND methodology proposal, not executed

The October 1 direct five-lane assignment and the later assistant-authored suggestion to examine independent convergence motivate a source-exposure audit. The assistant's convergence suggestion is not treated as Nathan Direct or as an empirical finding.

Proposed provenance graph:
- Nodes: raw conversations, user messages, assistant messages, prompts, worker outputs, handoffs, derived summaries, and published artifacts.
- Edges: contains, derived-from, exposed-to, handed-off-to, and published-as.
- A pair of outputs counts as independent convergence only when they express the same pre-registered proposition and their transitive source, prompt, and handoff exposure sets are disjoint.
- Duplicate exports with the same conversation ID and message IDs count as one witness, regardless of path or serialized-byte differences.
- Assistant summaries remain derived nodes, not independent source witnesses.

A blinded claim-coding pass plus a permutation null preserving each lane's output count and source-exposure degree could test whether apparent convergence exceeds what shared exposure predicts. If convergence disappears after shared-source and handoff edges are accounted for, the independent-convergence claim is disconfirmed.

This is a design proposal only. No model inference, human-subject experiment, or result was generated. Any later human coding requires consent and privacy controls. Orson retains P1 cognition ownership.

## 6. Reading and controls

Unrelated reading completed in `TheTANGLE.txt`, lines 1971-2010. Next cursor: line 2011.

FIE last full review: 2026-10-27; 14-day rereview threshold not due.

No physical calculation, target fit, new Lean module, new model inference, human-subject experiment, manuscript edit, theory promotion, BEDROCK change, SAT-O/Blockwave equation change, new branch, new PR, new tool, new Mersearch request, or automation change.

The existing :48 task remains enabled with its original ID, schedule, and phase. No sixth task was created.
