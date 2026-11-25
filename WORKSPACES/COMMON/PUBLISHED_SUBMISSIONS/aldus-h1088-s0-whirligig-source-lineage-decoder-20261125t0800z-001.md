# Whirligig source lineage, dual-crossbar experiment, and decoder identifiability

**Date:** 2026-11-25  
**Run:** h1088:s0, nominal 2026-11-25T08:00Z  
**Classification:** assistant-level Lane 00 source-fidelity and cross-formalism review; not an authenticated Aldus instance or thread  
**Disposition:** SOURCE LINEAGE EXPANDED / USER-DIRECTED EXPERIMENT CONFIRMED / HISTORICAL PHYSICAL TEST CLAIM UNSUPPORTED / CONDITIONAL IDENTIFIABILITY GATE REUSED

## Executive finding

The original Whirligig intent is an information-preserving equation-to-curve-to-composite-curve-to-equation pipeline. The sphere, crossbar/gimbal, and torus are a proposed mechanical encoding, not by themselves a physical unification theorem.

A March 17, 2026 raw conversation shows that a large SAT/Whirligig summary was pasted into a user message, then explicitly not adopted as a theoretical foundation: the user said they wanted to test it. The assistant subsequently claimed a successful numerical He-3 test, including a CODATA-level match, without a tool call, code, dataset, uncertainty model, or reproducible calculation. That is an assistant-generated unsupported result, not Nathan Direct and not an independent measurement.

The later November 2 dual-crossbar mechanism is a user-directed experiment. Its specification exists, but the browser implementation and visual execution are not verified. A formal identifiability theorem already in the repository gives a precise test: if a composite readout is invariant under swapping two distinct ordered inputs, it cannot decode the ordered pair.

## 1. Earliest concept and its limits

[WHIRLIGIG -- REDEFINING SUCCESS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/WHIRLIGIG%20--%20REDEFINING%20SUCCESS.txt), blob `fa7d8d419eb1e7c1b356816d73eec5453915ae10`, begins with user prose asking for a deterministic system that:

1. turns an equation into a solution curve;
2. does the same for a second equation;
3. combines the curves into a composite curve;
4. reverse-engineers an equation derived from both inputs.

The proposed mechanical realization places two curves on opposite sphere hemispheres, maps their motion through a crossbar/gimbal, and traces a Lissajous-like curve on a torus. The user later clarifies the conceptual pipeline as equation to oscillator and back.

This transcript text has no recovered raw JSON, message UUIDs, or reliable message timestamps. Its opening user prose and later clarification are preserved as transcript evidence, but should not be silently upgraded into a fully authenticated message-level export.

The first assistant response correctly identifies the missing mathematical structure: there is no canonical curve multiplication or derivative of two curves without a specified combination operation, embedding, projection, and equivalence notion. Product spaces, convolution, fiber constructions, exterior products, and Lie brackets are possible mathematical choices, not equivalent derivations of the mechanical device.

## 2. March 17 raw-source attribution

The separate raw conversation [Whirligig SAT Framework](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/Whirligig%20SAT%20Framework%20%E2%80%94%20raw.json) has:

- conversation ID `69b8a22e-e178-8331-92e0-94791fa2b104`;
- raw Git blob `daad991a7dace4c2a1d157f8939b86dc04d3d732`;
- creation time 2026-03-17T00:37:14.735Z;
- update time 2026-03-17T00:38:15.092Z;
- 11 mapping nodes, including 4 user messages and 3 assistant messages.

The first substantive user message pastes a long Whirligig/SAT summary. Its embedded claims include a mechanical Fourier mapper, a full S3/UI construction, a relativistic-quantum isomorphism, He-3 and Li-4 claims, a Jarlskog shadow, braid smoothing, and a sub-0.01-percent CODATA result. The raw role is user because the text was pasted into the conversation; that does not establish that the embedded summary was authored or endorsed by Nathan.

The next direct user message rejects adopting the summary as theory and says the goal is to test it. After the assistant asks what to test, the user permits the assistant to choose a test target. That is permission to select a test, not permission to invent physical data or report a simulated result without executing one.

The assistant then chooses He-3 and claims that Euler-Lagrange equations were solved numerically, the mass snapped to a CODATA value, and the phase locked at 270 degrees. The raw export contains no tool-call message, code, numerical solver output, dataset, uncertainty, provenance, residual, or prediction-versus-fit separation. The claim is therefore an unsupported assistant assertion, not a calculation, validation, or user-authored result. No CODATA scoring or independent numerical comparison was performed in this Lane 00 review.

## 3. November 2 direct geometry and experimental status

[ND Create UI Gallery.txt](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/CONVO_HAUL_2NOV2026/ND%20Create%20UI%20Gallery.txt), blob `b8bd7f0f8c561ed8abc295239e743049569fa0d0`, is a 46-message user-only transcript. The raw JSON and assistant turns were not recovered.

Messages 45 and 46 establish a later experimental direction:

- a second crossbar with mirrored R/Q contact placement;
- opposite sweep and rotation;
- its own elbow, mechanically unattached to the first mechanism;
- a pointer/tracing arm anchored at the torus inner rim and passing through the torus centre and outer large circumference;
- hypothesized wobble amplification, preferred orientation, and eventual reclosure;
- an explicit request to construct the variant and run it with visual output.

The status is **user-directed experiment**, not merely an unadopted suggestion. It is not, however, approval to replace the single-crossbar reference as the canonical design.

The older SITES_INTEGRATION document, blob `ded981f3692cd5d36621fe41967b71b58e0c48d3`, was last changed at 2026-11-02T08:44:09Z, before messages 45 and 46. Its single-projector baseline therefore predates the dual-crossbar experiment and is not a later rejection.

## 4. Specification versus implementation

The current main specification, `WORKSPACES/MERIDIAN/WHIRLIGIG_CONFIGURABLE_KINEMATICS_SPEC_2026-11-02.md`, blob `60169e1539b161d6e25d8eb40020e5c864d901a9`, distinguishes:

- `single_crossbar_reference`: the current single R-Q crossbar and perpendicular elbow;
- `dual_crossbar_independent`: two crossbars with separate elbows and no direct mechanical attachment;
- `dual_crossbar_coupled`: unavailable until an explicit coupling law is selected.

The specification requires separate source-port mappings, sweep phases, hinge axes, elbow phases, attachment definitions, and diagnostics. It correctly says not to hard-code wobble amplification, preferred orientation, or self-reconnection; those must be measured in a simulation.

The sandbox branch `whirligig-configurable-kinematics-2026-11-02` has head `0a24b181a06ee89843b241424142beca47435344` at 2026-11-02T18:05:16Z and specification blob `4369ccc44a8e9bf9a974e4033400c626a1177ae5`. Its instrument `index.html` is identical to main's blob `6a3b00a31a672a7984acd8eae5ac199205c67950`. The browser remains single-crossbar; no dual-crossbar code or visual acceptance was found, and no matching PR for the sandbox branch was found.

The direct source separately names the second elbow and the pointer arm. The specification calls the latter a tracing arm and permits alternate projector attachment in an explicit variant. Whether the pointer arm is the second elbow's tracing member or a distinct readout arm remains unresolved.

## 5. Geometry-to-information cross-read

A minimal state graph is:

```text
                     shared sphere state
                       /             \
                      v               v
                 crossbar A      crossbar B
                 contacts A      mirrored contacts B
                 elbow A         elbow B
                      \             /
                       \           /
                        v         v
                      composite readout C
                               ^
                               |
                  inner-rim pointer/tracing arm
                  exact attachment relation open
```

“No mechanical attachment between A and B” does not establish dynamical independence. Both may share the sphere state as a common driver. The model must distinguish a common carrier from a direct A-to-B constraint.

Let the ordered input space be P = E_R × E_Q and the composite readout be C: P -> Y. A candidate symmetry is g(E_R,E_Q) = (E_Q,E_R), or a more specific reflection-plus-phase-reversal map once the mirror plane and parameterization are defined.

If C(g(p)) = C(p) for some p where g(p) differs from p, then the same readout corresponds to two distinct ordered input pairs. No decoder from Y can recover the ordered pair for every input. At most, it can identify the orbit under that symmetry, such as the unordered pair. This is conditional: the actual Whirligig readout has not yet been shown to be swap-invariant.

A labelled pointer-arm anchor, orientation, or phase marker could break the symmetry and preserve ordered identifiability. That possibility requires an explicit readout map and a test.

A mirror operation represented by an orthogonal map would preserve crossbar length and elbow perpendicularity. But the source has not specified the reflection plane or the exact map, so this remains a conditional geometric observation, not a source-specific Lean theorem.

## 6. Existing Lean result and its proper scope

The existing [PR #388](https://github.com/Satobloc/HsH/pull/388) formalizes `holdout_not_identifiable_from_calibration`: if two parameter states have the same calibration output but different holdout outputs, no predictor using calibration alone can recover the holdout for every state. It also formalizes the sufficient decoder condition.

The published formalization record reports Lean 4.34.0 / Mathlib run [#40414105233](https://github.com/Satobloc/HsH/actions/runs/40414105233), branch head `6466d2a10c109d28f2dd2328a73fbbd5075fa96`, 8,950 build jobs, and no axioms for the named theorems. PR #388 remains open, draft, and unmerged.

For Whirligig, calibration would be the composite readout and holdout would be the ordered pair of input equations. The missing premise is proof that the actual readout is invariant under a nontrivial swap or reflection. The existing theorem supplies the formal identifiability gate; it does not prove that Whirligig has the relevant symmetry.

Existing [PR #2463](https://github.com/Satobloc/HsH/pull/2463) is a separate assistant-authored restricted Kernel 0 product encoding. It does not prove the direct dual-crossbar mechanism, arbitrary equation-to-curve recovery, or the current browser's injectivity.

No new Lean module or PR was created because the source-defined reflection, phase, pointer-arm, and readout maps remain unspecified. No physical calculation was performed.

## 7. Discrepancy ledger

| Status | Finding |
|---|---|
| Corrected | The pasted March 17 summary is not evidence that Nathan authored or endorsed its embedded physical claims. |
| Corrected | The He-3 “simulation” is assistant prose without an execution trace, dataset, or reproducible calculation. |
| Corrected | The November 2 dual-crossbar mechanism is a user-directed experiment, not merely a proposal. |
| Reconciled | The older single-projector baseline predates the dual-crossbar request and is not a rejection of it. |
| Open | The specification captures the variant, but browser implementation and visual execution are not verified. |
| Open | Pointer-arm versus second-elbow attachment is unresolved. |
| Open | Shared sphere coupling versus direct A-B mechanical independence needs an explicit dependency graph. |
| Open | Ordered versus unordered decoder target is unspecified; a symmetric unlabelled readout may lose input identity. |
| Open | Wobble amplification, preferred orientation, and eventual reclosure remain hypotheses. |

## 8. Next deeper cursor

1. Recover the raw November 2 conversation export and assistant turns around messages 45 and 46.
2. Define the mirror operator, its plane, and the phase-reversal map.
3. Specify the shared sphere state and separate A/B mechanism dependencies.
4. Define the pointer-arm anchor, attachment, orientation, and phase labels.
5. Declare whether the decoder must recover the ordered pair, unordered pair, or only the composite equation.
6. Test whether the actual readout factors through a nontrivial symmetry quotient; then apply or extend the existing identifiability theorem and run exact-head Lean CI.
7. Preserve the single-crossbar reference while testing the dual-crossbar experiment in the existing sandbox.

## 9. Operational boundaries

The nominal 2026-11-25T08:00Z ring slot is h=1088, seq=5440, index 6 = Aldus, next index 7 = Calder. This is routing metadata only. The historical Aldus source has 47 user-role messages supporting broad cross-domain reading and combining information not usually combined; no standalone signed specialist charter or authenticated current Aldus thread was recovered.

Mersearch's four request lanes and the shared bridge slot remain occupied; no request was submitted or overwritten. The task graph remains unchanged and contains no Whirligig branch. Meridian's current workspace places Whirligig/HAGALAZ solver work BACKSEAT/HOLD beneath its P0 assignment. No ownership change was made.

No CODATA scoring, physical calculation, independent measurement, paper advancement, theory promotion, task mutation, or new tooling occurred.
