# H898:s0 — 3D-trace source refinement and WH-02 preflight

**Status:** SOURCE-DELTA RECOVERED / EXISTING PUBLIC COVERAGE REUSED / WH-02 READ-ONLY PREFLIGHT COMPLETE / CALDER INBOX HANDOFF PENDING.

**Scope:** Lane 00 geometry fidelity, with the live Primary Workflow Health queue checked first. No CODATA scoring, physical calculation, new Lean code, PR, branch, task, or theory promotion.

## 1. Routing, authority, and source custody

Nominal slot: h=898. With the fixed ring and 5h+0, the selected label is **Aldus** (index 6); the next label is **Calder** (index 7).

The historical Aldus remit is grounded in the original user-authored conversation Aldus [AUTO H(s)H Gitter] (conversation ID 6a9dea2e-bb98-83ea-a74f-4beb4baa3153; raw-export blob 2f5ea91a449446f64d298b50b0c2ef0d8533900a). Its 47 user-role messages include permission to read broadly, choose useful documents, combine information not usually combined, and look outside the obvious lane. No standalone signed specialist charter was recovered. The direct messages, not the workspace's assistant-maintained summaries, are the authority for that remit.

The Aldus workspace has no INBOX.md at the expected path. Its existing CURRENT_WORK is a separate CODATA workstream; it was not overwritten or redirected. No current historical Aldus thread was authenticated. This is assistant-level source-grounded work, not a claim that the historical Aldus instance participated.

A pre-existing optional Mira-to-Aldus repository handoff was read. It created no assignment or response obligation; no consumption or acknowledgment is inferred.

## 2. Primary-source delta: what “3D intersectional trace” actually says

The raw source is LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json, conversation 6ac45d1f-17b0-83ea-ad1f-fa524602378b, Git blob 7af1561b321f4d9364da5eb111df689efc652827. Its first public repository commit is 2026-10-20T22:24:20Z.

The controlling user-role message is 1178f25c-9f92-4d1c-b43b-06482e6bf1b1, created 2026-10-09T07:40:38.859Z and on the current ancestry. It says the pictured object is **not the 4D filament itself**: it is a “3D intersectional trace” of a second-order 4D filament, described tentatively as “some variety of ST closed-loop string.” The same message immediately cautions that a 4D filament need not self-close in a 3D cobordism.

A near-duplicate user-role message, 28b2378a-846d-4c3f-a242-91f9007ce261, is off current ancestry and is 67.815 seconds earlier. It does not contain the later “ST closed-loop string” clause. These are not two independent confirmations. The active-ancestry version is the controlling direct wording; the off-branch version is a historical variant.

This advances, but does not close, the open cursor in Aldus's h784 report. The direct source favors a **closed-loop readout/representation** for the pictured 3D trace, while explicitly denying that this trace is the 4D filament itself. It does **not** define the support dimension of the underlying object or the map that produces the loop. “3D” may identify the ambient/readout representation rather than the intrinsic dimension of the trace. That is a source-favored interpretation, not a settled definition.

Adjacent direct messages in the same conversation add:
- One helical core, not a second-order core; the outer coil is hollow.
- The first-order coil scale is a diameter/radius-scale descriptor, not filament thickness.
- Worldtube curvature/inertia is a proposed equivalence in the classical limit, followed by a direct correction that spatial coordinate acceleration is not intrinsic four-dimensional curvature; agreement is only a low-velocity approximation.
- “Torsion” is used descriptively for angular rotation of the time normal under interaction with matter. No direct definition identifies it with Cartan connection torsion, congruence vorticity, or extrinsic curvature.

The user-role message a96d56d7-59bc-48cc-8338-0a37240e8fd4 is a cross-post from the Morrow/Kestrel discussion, not an independent original. It says “SAT is worldlines; H(s)H is worldtubes” and rejects a carrier-wrapping picture. Preserve it as a user repost/adoption, not as the original turn.

## 3. Geometry glossary and typed map

The following symbols are analyst labels for the crosswalk, not claims that Nathan originally used this notation.

| Symbol | Object | Evidential status |
|---|---|---|
| \(\gamma^1\) | SAT one-dimensional worldline/centerline | Direct description; exact embedding still model-dependent |
| \(W^4\) | H(s)H finite-core worldtube/support | Direct conceptual distinction; cross-section construction unresolved |
| \(\Sigma^3\) | Three-dimensional timesheet/bulk | Direct description |
| \(n\) | Timesheet normal covector | Current primary-guideline distinction |
| \(v_{\rm prop}\) | Propagation vector/direction | Distinct from \(n\); map not defined |
| \(S^2\) | Candidate two-dimensional worldsheet | Possible translation, not established as the native filament |
| \(J^2\) | Blockwave conserved two-form current | Historical assistant-voiced attachment; candidate worldsheet representation |
| \(\Gamma^1\) | Candidate closed-loop readout in a 3D representation | Directly suggested, but not formally typed |
| \(T\) | Thickening map \(\gamma^1\to W^4\) | Missing |
| \(E\) | Sweep/extension map \(\gamma^1\to S^2\) | Missing |
| \(P_\Sigma\) | Intersection/restriction to \(\Sigma^3\) | Must be defined with transversality and domain conditions |
| \(R\) | Readout/trace map to \(\Gamma^1\) | Missing |

### Conditional intersection dimensions

For a transverse intersection of a \(k\)-dimensional embedded support \(S^k\) with a 3D hypersurface \(\Sigma^3\) in a 4D ambient manifold:

\[
\dim(S^k\pitchfork\Sigma^3)=k+3-4=k-1.
\]

| Underlying support | Generic transverse intersection | Consequence |
|---|---:|---|
| \(\gamma^1\) | 0D | An event/point, not a loop |
| \(S^2\) | 1D | A curve; a closed-loop candidate if closure is separately established |
| \(\partial W^3\) | 2D | A surface trace |
| \(W^4\) | 3D | A 3D section, not a 1D string |

This conditional dimension ladder is already represented in Kestrel PR #873. It is not a proof that any particular H(s)H object has one of these dimensions.

~~~text
γ¹ --T?--> W⁴
γ¹ --E?--> S²

γ¹ ∩ Σ³ -> 0D
S² ∩ Σ³ -> 1D
∂W³ ∩ Σ³ -> 2D
W⁴ ∩ Σ³ -> 3D

W⁴ ∩ Σ³ --R?--> Γ¹ ?
~~~

The direct wording is compatible with a 1D loop as a 3D readout, but it does not select between a worldsheet intersection and a further readout/projection of a finite-core section. A 1D worldline directly intersecting a 3D timesheet cannot produce that loop. The map E, the thickening T, and the readout R remain undefined.

## 4. Original propositions versus assistant translations

**Nathan Direct**
- The 4D filament is not the pictured 3D trace.
- The trace is tentatively described as a closed-loop string-like readout.
- The 4D filament itself need not self-close in a 3D cobordism.
- One helical core; hollow outer coil; no second-order core.
- Spatial coordinate acceleration is not intrinsic four-dimensional curvature.
- The current primary operational guidance separates timesheet normal from propagation direction.

**Historical/assistant reconstruction**
- A 1D centerline with a rank-three normal-fibre thickening is a plausible way to construct a finite-core W⁴, but the fibre shape, embedding, and sweep are not source-authorized.
- Calling W⁴∩Σ³ the “3D trace” is dimensionally possible, but it is not the same object as a 1D closed-loop string.
- Identifying the pictured loop with a Nambu–Goto/string worldsheet or with the Blockwave J² current is a proposal, not a direct equivalence.
- The older Blockwave u^μ field is a time-flow congruence with a spatial projector. It is not automatically the timesheet, its normal, or its propagation vector. If u♭ is intended to be normal to a foliation, hypersurface orthogonality requires a Frobenius condition such as u♭∧du♭=0; the action does not impose that condition.
- The word “torsion” in the direct description must not be silently translated into Cartan torsion, Frobenius twist, or extrinsic curvature.

## 5. SAT-O1 and Blockwave source custody

### SAT-O1

- File: SATOBLOC/SAT O1 4D.txt in Satobloc/SAT_THEORY_ARCHIVE_2023-25.
- File-index date: 2025-06-09 (index time 18:44:50; timezone not recorded).
- First public repository commit found: 2025-10-27T00:40:28Z.
- Unbylined standalone file.
- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.

Verbatim defining equations:

~~~text
\gamma^\mu(\lambda) = (\lambda,
 A_x \sin(k_x \lambda + \phi_x),
 A_y \sin(k_y \lambda + \phi_y),
 A_z \sin(k_z \lambda + \phi_z))

v^\mu = d\gamma^\mu/d\lambda

S[\gamma] = \int d\lambda\,L(\gamma,v)

L = \frac12 m v^\mu v_\mu - V_{\text{tension}}(\gamma)
~~~

This is a one-parameter curve in four-dimensional spacetime. The accompanying prose describes a 4D vibration-swept worldtube volume, but no sweep/thickening map is supplied. The use of “4-velocity” also requires a parameter normalization if \(\lambda\) is merely affine.

The bylined SATOBLOC/SAT4D_LIVE_DRAFT.txt (Nathan McKnight byline; file-index time 18:53:29 on the same date) contains an O1 module body that matches the standalone O1 body after the header, with line-ending normalization. It is not independent corroboration. The larger draft also contains a “static 4D block” description with no local dynamics, while the O1 module describes intrinsic tension and vibrational dynamics. That historical document-level tension is unresolved; it must not be silently harmonized.

### Blockwave

- User-supplied attachment event verified in the accessible “Tourist Tailor” raw conversation on 2025-09-18T06:12:35.609Z; conversation 68cad3d4-0ccc-8325-be36-94c5b5527997.
- Earlier h888 records cite 2025-09-16 (with two different second-level timestamps). That earlier event is not reconciled in the raw source inspected here. Therefore the **first** attachment date remains unresolved; 2025-09-18 is the earliest directly verified upload event in this pass.
- First public repository commit found: 2026-10-08T02:42:49Z.
- File: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt.
- Original attachment size: 25,255 bytes.
- Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- Original-byte SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
- The materialized original attachment’s Git blob hash matches the repository blob, confirming exact byte identity.
- Embedded authorship remains unresolved; the file is user-supplied but assistant-voiced.

Verbatim original equations:

~~~text
J^{\mu\nu} = \frac12 \epsilon^{\mu\nu\rho\sigma}
             \nabla_\rho B_\sigma

\nabla_\mu J^{\mu\nu}=0

A_\mu(\theta)=\alpha_*\,\nabla_\mu\theta

F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta)
~~~

The file explicitly describes J^{μν} as a conserved two-form current supported on filament worldsheets. That is not the same type as a 4D finite-core worldtube. Its “string as timesheet trace” construction is an assistant translation and does not supply the missing map from W⁴ to J² or Γ¹.

### Separate conditional identities — not source replacements

For a smooth local real phase lift and a torsion-free connection:

\[
A=\alpha_*\,d\theta
\quad\Longrightarrow\quad
F=dA=\alpha_*\,d^2\theta=0
\]

locally. Nontrivial global holonomy would require additional global winding, patching, or defect structure. Existing PR #1556 compiles the local exact-form identity; it does not establish the global physical mechanism.

The transverse dimension formula above is another conditional standard-geometric result. Neither derived identity replaces the SAT-O1 or Blockwave originals.

## 6. Existing formalization evidence

No new Lean code or PR was justified.

- [PR #873 — KestrelIntersectionDimensionGate](https://github.com/Satobloc/HsH/pull/873): contains conditional worldline/worldsheet/full-core intersection-dimension theorems. Actions run #43202552666 succeeded on a merge reference; exact-head checkout was not established.
- [PR #1082 — AldusTimesheetAffineMap](https://github.com/Satobloc/HsH/pull/1082): proves a conditional flat affine line/hyperplane intersection map. Actions run #41009015850 succeeded on a merge reference. It does not define the curved timesheet, native normal/propagation distinction, or finite-core readout.
- [PR #817](https://github.com/Satobloc/HsH/pull/817): compiles an algebraic Frobenius-related coefficient, not the full hypersurface-integrability theorem.
- [PR #912](https://github.com/Satobloc/HsH/pull/912): proves a conditional positive-semidefinite co-metric result, not the native Lorentzian comparison.
- [PR #1556](https://github.com/Satobloc/HsH/pull/1556): local exact-form/phase-curvature identity, with the global holonomy caveat above.

These are actual existing CI builds, but the cited runs are merge-reference builds, not exact-head proofs of the source-specific H(s)H map. Local Lean, Lake, and Elan are absent. No new Lean execution was claimed. Compilation establishes only the formalized statement, not the source translation or physical premises.

## 7. Primary Workflow Health: WH-02 bounded preflight

The live queue identifies WH-05 as blocked by the four occupied Mersearch lanes and WH-02 as the highest-priority unblocked item. Calder retains WH-02 ownership; Tern retains workflow-health/scheduler authority.

Current [PR #1710](https://github.com/Satobloc/HsH/pull/1710):
- Head: a967e908ceab048d219831ec799343643870daf3.
- Merge base: 7c400961 (full commit recorded in the compare result).
- Seven commits ahead, 4,047 behind current main at the time of comparison.
- GitHub reports mergeable=true; this is not a rebase, review, or validation.
- All seven PR-touched paths have blob identities unchanged between the merge base and current main. This is a path-local no-drift preflight, not proof that the whole branch is current.
- No Actions run was found on the current PR head.

A specific warning-step defect remains. In .github/workflows/maintain-navigation.yml, the strict date audit step has no step id; the later “Report date-tagging warnings” step uses the default success condition, does not use always(), and does not include the strict audit outcome. If the strict audit fails, the warning step can be skipped, hiding the audit result.

**Actionable repair for Calder:** give the strict audit step a stable id (for example date_tag_audit); make the warning step use if: always() && (...); include steps.date_tag_audit.outcome in its condition and emitted warning. Preserve the strict audit's job-failing semantics. Do not set continue-on-error merely to make the warning visible. Then rebase/reconcile, run the tests and workflow, and obtain Tern/maintainer review. No code was changed and no rebase/merge was attempted here.

## 8. Tooling, campaign, and reading checks

- Mersearch is not callable in this runtime; all four canonical request lanes remain occupied/requested. No lane was overwritten or retriggered. The completed Ariadne worldtube-source-strata Mersearch receipt was reused as prior search evidence; no new Mersearch run is claimed.
- The three repository front doors and onboarding were checked. The HSH_RESOURCES Tool Chest was consulted as an internal reference; no private research payload was opened.
- Math Hopper #578 remains open with staged smoke/validation gates; PR #991 remains open/draft. Whirligig Kernel0 has no verified repository/branch result in this pass and remains a sandbox-only reference. SciSpace is available; no new literature search was needed.
- The three repositories' fork counts were reported as zero in the current repository metadata check.
- No local checkout or GitHub CLI is available. GitHub Contents API is the documented fallback for the append-only receipt and inbox handoff, with fresh blob-SHA preconditions and readback.
- No new tool, dependency, subscription, or paid service was introduced.
- Deliberate unrelated reading: Alfred Russel Wallace, The Malay Archipelago, Project Gutenberg edition, pp. 179–246. The passage distinguishes an earlier indication credited to Earl from Wallace's own subsequent evidence and interpretation; next reading cursor p. 247. citeturn693286view0

Campaign state remains unchanged:
- P0 Code Grurple: ACTIVE.
- P1 cognition: Orson-owned, OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE last reviewed November 10; next review November 24.
- November 9 minor-paper gate remains overdue; November 30 major and December 14 full-theory gates remain separate. No gate advanced.

## 9. Publication and next cursor

Existing public coverage already addresses this subject in [#1636](https://github.com/Satobloc/HsH/issues/1636), [#1645](https://github.com/Satobloc/HsH/issues/1645), [#1751](https://github.com/Satobloc/HsH/issues/1751), and [#1757](https://github.com/Satobloc/HsH/issues/1757). WH-02 is already tracked in [#1702](https://github.com/Satobloc/HsH/issues/1702). A new public issue would duplicate existing coverage, so none was created and no publisher submission was attempted.

Next geometry cursor:
1. Decide whether the direct “closed-loop string” is a 1D readout in a 3D representation, a transverse \(S^2\cap\Sigma^3\) trace, or a further readout of \(W^4\cap\Sigma^3\).
2. Define the source-authorized maps \(T\), \(E\), \(P_\Sigma\), and \(R\), with domains, codomains, regularity, transversality, closure, and composition conditions.
3. Keep the SAT worldline, H(s)H finite-core worldtube, candidate worldsheet, timesheet, and readout as distinct typed objects until those maps exist.
4. Keep normal \(n\), propagation vector \(v_{\rm prop}\), and any material/time-flow congruence \(u\) separate.
5. Only then extend Lean; use exact-head CI and preserve the distinction between theorem proof and translation fidelity.

No physical system, dataset, calibration, units, uncertainty budget, or unseen holdout was supplied for a physical calculation. No calculation, fit, prediction, CODATA score, independent measurement, theory promotion, paper-gate advancement, branch/PR mutation, task mutation, or sixth task occurred.
