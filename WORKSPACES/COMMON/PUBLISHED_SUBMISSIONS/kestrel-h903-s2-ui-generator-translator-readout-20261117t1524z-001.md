# Workshop Relay h903:s2 | Kestrel: generator, translator, and readout

**Run key:** `REVROT3-19-20261011:903:s2`  
**Selected ring label:** Kestrel (index 14)  
**Next ring label:** Meridian (index 15)  
**Disposition:** CROSS_BOUNDARY_SYNTHESIS / EXISTING_MAP_THEOREMS_REUSED / EXACT_PR_HEAD_BUILD_VERIFIED / NO_PHYSICAL_PROMOTION.

This is a source-grounded Kestrel revival, not authenticated participation by the historical Kestrel ChatGPT thread.

## 1. Historical remit and source authority

The historical source is the raw `Science Made Stupid` conversation, conversation ID `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw-export blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. The recovered export contains 2,117 mapping entries and 2,035 nodes on the current ancestry. Four direct user-role messages used for the role reconstruction are on that ancestry.

They establish Kestrel as a trust-first, cross-boundary synthesis companion: stay with the consequential case, connect work across lanes, reason forward, and label hypotheses as hypotheses. This is not a remit to duplicate source audits, replace specialist owners, or turn a useful intuition into an asserted physical result. No authenticated current Kestrel thread was found.

## 2. The new synthesis: three layers that must not be collapsed

The March 7, 2026 `Switching to English` source, independently recovered in Tern h903:s0, makes a consequential distinction:

1. **Generator:** Nathan Direct identifies a separate general nth-order superhelical Lagrangian as the object to vary and then plug into the UI. The exact controlling equation and its complete source lineage were not recovered in this pass.
2. **Translator:** the Universal Indicatrix is described primarily as a mapping tool between equations and curves. Its direct ingredients are two relative four-dimensional frames, a marked point, relative rotation, and radial scale. The later point-map form `X(s) = q(s) R(s) x0`, with `R(s) ∈ SO(4)`, is an assistant reconstruction, not a verbatim Nathan Direct equation.
3. **Physical readout:** a further map must connect the geometric representation to an actual H(s)H object, worldtube/timesheet or responsive medium, and then to an instrument's measured data. The UI source and current implementations do not supply that physical readout map.

The frozen blind-lab curve functional `F_curve[X]` is a one-dimensional geometric overlay with unresolved coefficients. It is not the direct source's unspecified four-dimensional volume integral and is not established as the separate nth-order superhelical Lagrangian. The assistant-generated `L_UI` and broad path-integral interpretation must remain assistant reconstruction, not Nathan Direct.

**Consequence:** a curve translator is not automatically a generator, a physical embedding, or an instrument model. A successful UI demonstration cannot by itself establish a worldtube, timesheet, medium response, or physical prediction.

Primary source and detailed source-fidelity audit: [Tern h903:s0, issue #1905](https://github.com/Satobloc/HsH/issues/1905).

## 3. The implementation charts are distinct

The source-pinned implementation audit identifies two valid but different SO(4) parameterizations:

- The frozen blind-lab browser and Python kernel use an ordered product of six plane rotations, `R_prod(θ) = G23 G13 G12 G03 G02 G01`.
- `tools/whirligig_rq/ui4d.py` uses the exponential chart, `R_exp(κ) = exp(Σ κ_ij J_ij)`.

The same six numeric controls are not interchangeable. The noncommuting generators satisfy `[J01, J02] = J12 ≠ 0`. Tern's in-memory reproduction using π/2 in planes (0,1) and (0,2) reported a maximum matrix difference of 0.8028499335, while both matrices remained proper orthogonal rotations. This is Tern's reported counterexample diagnostic, not a new Kestrel calculation or a Lean proof.

If the two implementations are intended to express the same controls, an explicit chart transition `τ` is needed on a declared overlap, with `R_exp(τ(θ)) = R_prod(θ)`, including branch and singularity conditions. Otherwise they should remain separately named parameterizations. No global transition or equivalence is assumed.

The frozen baseline `SAT-UI-BLIND-20261026-001` remains byte-stable. The separate `ui4d.py` module is not coupled to the 3D Whirligig rolling mechanics. The public-site HTML is a separate site artifact; repository source does not establish live deployment or visitor execution.

## 4. Readout fibers define what can actually be recovered

For the assistant-reconstructed point map `X = q R x0`, the forward point trajectory can be defined while the full frame cannot be recovered from that point alone. The stabilizer of one unit direction in SO(4) is SO(3). The inverse point readout recovers `q = |X|` and `u = X/q = R x0`, not a unique `R`.

At `q = 0`, the forward point is the origin, but `u = X/|X|` is undefined. The direct source explicitly includes a zero-radius starting case. The frozen blind-lab browser and Python kernel require `q > 0` in their forward generators as well as inverse routines. `ui4d.py` accepts `q = 0` in its `indicatrix` forward map, but its `lift_sphere_curve` helper rejects zero input. These are distinct API contracts. A versioned successor should preserve the zero-radius forward baseline while keeping inverse direction normalization restricted to `q > 0` or retaining the seed-frame state separately at the origin. The frozen baseline should not be edited.

This is not merely a UI detail. It is an instance of the existing Kestrel map/fiber problem:

- A target observable factors through a reduction exactly when it is constant on every fiber of that reduction.
- A non-injective readout cannot restore a distinction already collapsed upstream.
- Multiple readout channels can jointly identify a source state only if every distinct admissible pair is separated by at least one channel.
- Exact geometric route agreement implies observed agreement. The converse requires an injective readout on the admissible domain.
- Locally, a geometry sensitivity that lies entirely in the nuisance-response range can be absorbed by nuisance changes. A separating direction requires a component outside that range.

These conditions give a useful **fiber-aware minimality criterion** for future H(s)H representations: retain the smallest state and set of readouts that preserve the distinctions required by the declared claims. Full state recovery is not necessary for every observable, but any claim that survives a lossy projection must be constant on its fibers. A claimed inverse requires injectivity or an explicitly retained equivalence class/gauge.

The criterion is already represented in the existing `KestrelProjectedIncidence` module. Its `hallway_factorization_iff_fiber_compatibility`, `joint_readout_injective_of_separating_pair`, `downstream_readout_cannot_restore_coarse_collapsed_pair`, and local nuisance-range theorems are conditional mathematics, not instantiated physical H(s)H maps.

The separate `KestrelKelvinVortexReadout` module provides a useful real-measurement contrast: the source-defined two-sided contour transform from opposing radii to displacement and mean radius is algebraically invertible on those two coordinates; a one-sided contour readout is non-injective. This is not a physical equivalence with the UI. It demonstrates why each instrument's readout fibers must be stated rather than inferred from a visually similar curve.

## 5. Restricted geometric consequences and unresolved maps

Under the restricted whole-slice ansatz `F_s(ω) = q(s) R(s) ω`, with uniform `q > 0` and global `R ∈ SO(4)`, each S3 slice remains round up to scale and has spatially uniform scalar curvature `6/q(s)^2`. That restricted map does not generate localized wells, tidal fields, or arbitrary singularity structure. Such structure would require a spatially varying deformation or a more general metric and an explicit map from controls to that metric. This is a conditional statement about the uniform ansatz, not a no-go theorem for every possible extension.

Likewise, a rotation history is not by itself a holonomy calculation. A base space, connection, transport rule, and loop observable are still required. The source's “full four-dimensional volume” remains ambiguous between the S3 boundary, the enclosed B4, and a configuration/history space; no measure or integrand is specified.

## 6. Formal verification status: an important correction

Existing [PR #873](https://github.com/Satobloc/HsH/pull/873) now has a verified exact-head Lean run, correcting the earlier Kestrel checkpoint that had only a merge-reference build.

- Exact PR head: `94b6d96c91806a95505260a3c52220f4af294185`.
- HsH main at source readback: `b07cac1d9aadc86bf37ec987146df92615f688a4` (2026-11-17T15:28:42Z).
- Exact-head workflow run: [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878).
- Job: `Verify Lean 4.34.0 exact PR head`, job `134062868110`.
- The job checked out and asserted the exact PR head, generated the Lake dependency manifest, installed Lean 4.34.0, and compiled the formal library successfully.
- The root verification import includes the Kestrel projected-incidence, Kelvin-vortex readout, intersection-dimension, and moving-slice modules. The Kelvin module's `#eval` declarations and the modules' `#print axioms` commands are part of the compiled source.

Limits remain material:

- PR #873 is OPEN / DRAFT / UNMERGED, with zero formal reviews recorded; it has 70 commits and 15 changed files.
- Its base is `infra/lean4-verification-20261023`, not current main.
- Against current main at inspection, the branches diverge: PR head is 111 commits ahead and 20,799 behind. `mergeable_state` is `unstable`. The exact-head build is not current-main integration evidence.
- The separate conversation-JSON content check failed with zero jobs; Vercel reported a build-rate-limit failure. Neither is a Lean theorem failure.
- The successful job is a formal-library compile, not a separate full test suite, lint, nanoda/leanchecker run, or independent global axiom audit.
- Lean verifies the formalized conditional statements. It does not establish that the source-to-geometry translation is sound or that any physical premise is true.
- The specific SO(4) stabilizer calculation and the product/exponential chart transition are not formalized by this run.

No new Lean module, branch, PR, or build was created. The next proof target should be source-specific chart/fiber mathematics only after the intended chart semantics and admissible domains are fixed. Formalizing an assistant-selected transition before that would freeze an unsupported choice.

## 7. Lane 24 and project gates

- P0 Code Grurple remains ACTIVE.
- P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- Lane 24 Cycle 08/08 remains COMPLETE / BACKSEAT / HOLD.

No measured system was selected, no CODATA comparison or physical calculation was performed, and no fit, prediction, independent measurement, or paper-gate advancement is claimed. The existing NIST torsion-balance and Kelvin-vortex packages remain separate evidence cases. No map from the Universal Indicatrix to either measured system has been established. The WWRD climbing-rope construction was not used as a physical equivalence.

No callable Mersearch action was available in this runtime. The current Tern h903 report independently records four occupied/requested lanes. Repository and public-source inspection is a bounded fallback, not Mersearch completion.

FIE was last fully reviewed November 10; the next review is November 24, so a full rereview is not yet due. The unrelated-reading break continued in the SAT archive from lines 1921-1960; next cursor is line 1961.

## 8. Scheduler and continuity

The existing :24 task remains enabled under the exact live ID `6abda4c8eda88191bf23a6f2849e9a17`, with `DTSTART;TZID=America/New_York:20261001T142400` and `RRULE:FREQ=HOURLY`. An earlier h892 receipt transcription gives a different :24 ID; this report follows the exact live scheduler readback. No task or receipt was rewritten.

Current run readback:
- Run ID: `7f664836-7644-8326-9a51-2c36ead51f81`.
- Scheduled: `2026-11-17T15:24:00Z`.
- Started: `2026-11-17T15:21:20.654924Z`.
- Status: `IN_PROGRESS`; completion and current-run chat reference are null.
- Cached latest result belongs to Elias Kern h902:s2, not this Kestrel execution.

The earlier Kestrel h899:s3 run ID `4a3393ac-9624-832a-b7cd-a977ab8e899c` was recorded FAILED (original start `2026-11-17T12:16:55.653483Z`, completion `12:46:46.857720Z`) and later reappeared under the same run ID as IN_PROGRESS at `12:55:37.836206Z` with completion reset to null. The cause and attempt semantics remain UNKNOWN. No task configuration was changed.

No task, ID, schedule, prompt, phase, enabled state, or cadence was changed. No sixth task was created. No signet or chat rename.

## 9. Next useful discriminator

Before changing code or proposing new physics:

1. Recover the exact source equation and provenance for the general nth-order superhelical generator.
2. Decide whether the product and exponential SO(4) controls are intended to represent the same parameterization or two distinct ones.
3. If they are intended to match, specify a transition map on a declared domain and branch; otherwise label the charts distinctly.
4. Preserve `q = 0` in the forward source baseline and keep inverse-domain restrictions separate.
5. State whether the intended recoverable object is a point path, a frame history modulo SO(3), or a richer readout with enough channels to identify the required state.
6. Only then connect the translator to a physical worldtube/timesheet/medium and a real instrument readout with measured data, units, provenance, covariance, and uncertainty.

**Final status:** `H903_S2_KESTREL / GENERATOR_TRANSLATOR_READOUT_SEPARATED / FIBER_AWARE_MINIMALITY_SYNTHESIZED / TERN_UI_SOURCE_AUDIT_CROSS_READ / PR873_EXACT_HEAD_LEAN_BUILD_VERIFIED / PR_NOT_INTEGRATED / P0_ACTIVE / LANE24_HOLD / NO_PHYSICAL_RESULT / NO_NEW_LEAN / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED`.
