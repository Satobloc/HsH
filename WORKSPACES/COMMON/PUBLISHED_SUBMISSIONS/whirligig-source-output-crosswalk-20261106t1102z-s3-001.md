# Whirligig source-to-output crosswalk: authority tiers and decoder gate

**Date:** 2026-11-06  
**Classification:** assistant-authored public-source architecture review; sandbox/instrument methodology only.  
**Disposition:** additive crosswalk. No code, branch, PR, deployment, physical claim, or theory status changed.

## Executive finding

The current Whirligig browser is a forward geometric instrument, not yet an information-conserving equation-to-curve codec. The existing output-contract and functional-audit documents already require source encoding, composition, decoding, source recovery, and representation-invariance. The missing integration is a typed map from the browser's actual input adapters and model-space trace to those existing requirements.

A concrete source-fidelity defect is also visible: `EQUATION_LIBRARY.md` still labels the current R/Q aperture gain as `0.58`, while the current browser code, the 2026-11-02 correction, and the current 2026-11-02 Sites integration section use `0.20`. The code follows the later sources. The library banner is stale; do not change the browser to `0.58` on its authority.

## 1. Source custody

Primary direct geometry source:

`DEVELOPMENT_FULL_CONVOS/CONVO_HAUL_2NOV2026/ND Create UI Gallery.txt`  
Git blob SHA-1: `b8bd7f0f8c561ed8abc295239e743049569fa0d0`.

Relevant direct-user message locators in this text export:

- [33] 2026-11-02T05:35:20.517Z and [34] 05:46:36.335Z: north/south polar lobes and east/west equatorial crossing/contact landmarks.
- [35] 06:10:27.158Z: one full Analemma circuit; inner torus circumference an even multiple of its length; equal inner/outer area introduced with the preference phrase "I'd say".
- [36] 06:23:29.885Z and [37] 06:24:25.011Z: sphere circumference equals the torus tube's small circumference.
- [39] 07:53:06.604Z, [40] 08:23:46.283Z, and [41] 08:34:14.091Z: elbow rotation is an even multiple of sphere roll; the follow-up says the relevant phases should be equal; "inner wall" means the inside surface of the tube. The short clarification does not independently disambiguate every variable reference, so the current phase interpretation remains a reconstruction.
- [43] 10:18:32.819Z: the trace "should just project where it projects", not be forced to a preselected target.
- [45] 10:45:55.076Z: a second independent crossbar is proposed; the polar curves should capture the entirety of information defined by the input equations; the composite curve should ideally be reverse-engineerable.

The text export has message indices and timestamps but no message UUIDs. None are invented.

The older SAT archive file `WHIRLIGIG -- REDEFINING SUCCESS.txt` (blob `fa7d8d419eb1e7c1b356816d73eec5453915ae10`) is a separate historical Whirligig source and predates the Nov. 2 Analemma specification. It is not substituted for the direct geometry messages above.

Navigation:
- [Raw Nov. 2 direct-source transcript](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/CONVO_HAUL_2NOV2026/ND%20Create%20UI%20Gallery.txt)
- [Historical Whirligig source in SAT archive](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/WHIRLIGIG%20--%20REDEFINING%20SUCCESS.txt)

Current technical anchors:

- Browser `index.html`: blob `6a3b00a31a672a7984acd8eae5ac199205c67950`.
- `ANALEMMA_CORRECTION_2026-10-21.md`: blob `3a830f552d8bb57cb3e69b5d6004c29cbf72bdcd`.
- `SITES_INTEGRATION.md`: blob `ded981f3692cd5d36621fe41967b71b58e0c48d3`.
- `EQUATION_LIBRARY.md`: blob `5efe7417740895cdb1c5c08e36bcb0981bfbd67c` ([file](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/instruments/whirligig/EQUATION_LIBRARY.md)).
- Existing output contract: blob `4777a0e546ac41293f15cbde7c180d1995e2c499` ([file](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/RUN_2026-09-19_2330_WHIRLIGIG_OUTPUT_CONTRACT.md)).
- Existing functional-audit spec: blob `e966e56458a4f009d638ee4e0a8eb60d77d7f95e` ([file](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/WHIRLIGIG_FUNCTIONAL_AUDIT_SPEC_2026-09-19.md)).
- [Current browser source](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/instruments/whirligig/index.html), [Analemma correction](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/instruments/whirligig/ANALEMMA_CORRECTION_2026-10-21.md), and [Sites integration](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/instruments/whirligig/SITES_INTEGRATION.md).
- [Factory reference preset](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/instruments/whirligig/presets/factory-reference-2026-11-02.json), [main spec](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/WHIRLIGIG_CONFIGURABLE_KINEMATICS_SPEC_2026-11-02.md), and [sandbox-branch spec](https://github.com/Satobloc/HsH/blob/whirligig-configurable-kinematics-2026-11-02/WORKSPACES/MERIDIAN/WHIRLIGIG_CONFIGURABLE_KINEMATICS_SPEC_2026-11-02.md).

## 2. Authority classes

| Item | Source status | Correct treatment |
|---|---|---|
| N/S lobe winding and E/W crossing/contact landmarks | Nathan Direct | Hard geometric landmarks; the analytic parameterization is still a model representation. |
| One Analemma circuit; inner circumference is an even multiple of its length | Nathan Direct | Even-multiple relation is direct. Choosing the minimum positive even multiple, hence two circuits, is a derived default, not an integer quoted in message [35]. |
| Sphere circumference equals tube circumference | Nathan Direct | Sets sphere radius equal to torus minor radius under the declared geometry convention. |
| Inner-wall contact means inside surface of tube | Nathan Direct | Contact-surface semantics, distinct from the ray's output intersection. |
| Trace follows its actual projection | Nathan Direct | Do not force a visually desired target curve. |
| Equal inner/outer area for smoothness | User preference | Selected reference criterion, not a forced constraint or proved global smoothness optimum. |
| Exact equal-area latitude formula and numerical constants | Assistant/model-derived | Conditional on the selected balance criterion; not a verbatim Nathan equation. |
| Elbow multiplier 2 and interpretation of "they should be set to equal" | Derived interpretation | Keep the phase assignment provisional until the source context is disambiguated. |
| Independent mirrored second crossbar and its separate tracing-arm path | Nathan Direct proposal | Separate mechanism variant; not implemented by the single-crossbar browser. |
| Polar curves preserve all input-equation information; composite trace is reverse-engineerable | Nathan Direct goal | Not yet demonstrated by the finite-profile forward browser; requires source and composite decoders. |
| Eventual trace reconnection | User goal/hypothesis | Not guaranteed by the current construction. |
| Stretched pole-to-pole curve with `B=0.25` | Assistant/model-derived candidate | Unapproved and unimplemented; distinct from equal-area reference and classical Viviani mode. |

This classification prevents a preference or assistant-selected parameter from silently becoming a hard geometric premise.

## 3. What the browser actually maps

The public equation library describes 42 scalar profiles, not an arbitrary field-equation parser or universal equation codec.

At code level:

`u(t) = gain * f(t + shift)`

The polar adapter uses:

`a(t) = 0.78 + 0.20 * tanh(u(t))`

and an equation-dependent bearing:

`phi(t) = t + 0.11 * (sin(2*t + w) - sin(w)) + 0.03 * (tanh(u(t)) - tanh(u(0)))`

where `w` is the configured bearing wobble (default `0.18`). The spherical point is `(sin(a)*cos(phi), sin(a)*sin(phi), +/-cos(a))`; the Q side uses the opposite sign for the polar z component. This is a specific nonlinear adapter over a declared profile family, not a demonstrated bijection from arbitrary equations to curves.

The Analemma is a separate mechanical phase/track channel. It is not either R/Q source curve.

The actual hierarchy is:

1. `E_R, E_Q`: selected source-equation/profile descriptors.
2. `C_R, C_Q`: their declared polar-curve representations.
3. `A(t)`: the separate Analemma material/roll track.
4. `K`: kinematic composition, including contact and phase rules.
5. `T_model`: model-space trace from the elbow ray's first forward hit on the full torus.
6. `P_camera`: 3D model-space to 2D screen projection.
7. `R_svg`: rendered/exported presentation.

Two distinctions matter:

- Sphere contact on the inner radial tube surface is not the same operation as the ray's output target. The trace target is the first forward hit on the full torus; it is not promised to lie on the inner radial wall.
- `P_camera` and SVG are presentation maps and generally lossy. The browser retains model-space hit points; any equation decoder should consume `T_model`, not a screenshot/SVG, unless camera metadata and projection loss are explicitly handled.

The current `rayHit` uses a finite sign-bracketing scan followed by bisection. The existing ray-hit completeness gate records that tangencies and multiple roots can be missed. `T_model` is therefore not certified as a complete first-hit trace for all admissible configurations.

## 4. Concrete documentation drift

`EQUATION_LIBRARY.md` still describes the current R/Q aperture mapping with coefficient `0.58`.

The current browser's `polar()` code uses `0.20`; `ANALEMMA_CORRECTION_2026-10-21.md` and the later 2026-11-02 section of `SITES_INTEGRATION.md` also use `0.20`. `SITES_INTEGRATION.md` retains `0.58` in its historical 2026-10-21 section, but its later 2026-11-02 section supersedes it.

**Recommended correction:** update the `EQUATION_LIBRARY.md` current-state banner to `0.20`, date the supersession of `0.58`, and document the equation-dependent bearing term. Do not alter browser code to match the stale banner.

The factory preset should also carry raw source locators and authority classes. Its pole-to-pole mode label should distinguish a constructed but unapproved/unimplemented candidate from a curve whose derivation has not begun. The sandbox spec contains a model-derived `B=0.25` candidate, while the factory preset still says curve derivation is pending. This is a cross-branch metadata mismatch, not a deployed-code defect.

## 5. Missing source-to-output contract

The existing Whirligig output contract and functional-audit spec already require an encoder, composition, decoder, source recovery, and representation-invariance. This note connects them to the current browser; it does not replace them.

Define:

- `E = (E_R, E_Q)`: input equation/profile descriptors, with units, domain, constants, boundary conditions, parameterization, clock, frame, and allowed equivalences.
- `C = (C_R, C_Q)`: source encoders into sphere curves.
- `K`: kinematic composition of both curves, the separate Analemma, contact rule, phase/gear settings, and mechanism variant.
- `T_model = K(C_R, C_Q, A)`: model-space torus trace.
- `P_camera`: declared 3D-to-2D view.
- `D_model`: decoder from model-space trace to the composite equation/relationship.
- `D_R, D_Q`: stronger decoders for recovery of the two original inputs.

A forward trace alone does not establish any decoder. A screenshot or SVG is not a substitute for `T_model`.

For any observation map `O` and target `T`, a deterministic decoder `D` satisfying `T = D o O` exists only if `O(x) = O(y)` implies `T(x) = T(y)`. The target must be constant on every observation fiber. This is the existing Kestrel factorization condition, not a new Whirligig theorem. If camera projection collapses distinct target states, screen pixels cannot recover the target without another view or a preserved model-space channel.

Minimum metadata for the preset/curve-provider interface:

- source file/blob and direct-message locator;
- authority class (`NATHAN_DIRECT`, `USER_PREFERENCE`, `DERIVED_CHOICE`, `ASSISTANT_CANDIDATE`);
- equation family and declared equivalence class;
- parameterization, clock, frame, and units;
- encoder and source-recovery status;
- mechanism variant and contact-surface rule;
- model-space trace and ray-root completeness status;
- camera projection and export format;
- decoder status and declared recovery tolerance.

## 6. Independent test matrix

| Hypothesis | Calibration / holdout | Observable | Comparator | Falsification condition |
|---|---|---|---|---|
| Source adapter preserves its declared equation family | Known family members / held-out members | Recovered source descriptor from `C_i` | Direct symbolic source representation | Non-equivalent descriptors collapse to the same curve, or recovery exceeds a predeclared tolerance. |
| Composite trace preserves both inputs and their relation | Reference R-Q pair / held-out pairs | Recovered composite relation and separate source components | Direct source-pair representation | A declared component or cross-channel relation cannot be recovered. |
| Decoder is independent of display projection | Canonical model trace / held-out camera views | Decoded source and relation | Model-space decoder versus image/SVG decoder | Camera changes alter claimed source recovery without an allowed equivalence. |
| First-forward-hit trace is complete | Existing analytic cases / tangency and multiple-root cases | Ordered positive intersections and first root | Exact root isolation on the same declared surface | A tangent/multiple root is missed or the returned hit is not first. |
| Ranking is representation-invariant | Equivalent encodings / held-out reparameterizations | Decoded source and bending-score ordering | Declared canonical/intrinsic representation | An allowed reparameterization changes the claimed invariant ranking. |
| Pole-to-pole mode is distinct and valid | Candidate-specific geometry / hostile review | Pole contacts, crossing, tangents, closure | Equal-area and classical Viviani kept separate | Extra contacts or required tangent/closure conditions fail. |

No numerical threshold is supplied. A threshold requires a declared error model and actual source/measurement domain; none is invented.

## 7. Formalization and epistemic boundary

The reusable formal result is already in Kestrel's `KestrelProjectedIncidence.lean` ([PR #873](https://github.com/Satobloc/HsH/pull/873), [current continuity record](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/CONTINUITY.md)):

- `hallway_factorization_iff_fiber_compatibility`
- exact-head Actions run #41468951678, Lean 4.34.0 / Lake 5.0.0, full build 8,954 jobs;
- theorem-specific axiom report: `Classical.choice`;
- associated uniqueness theorem: `Quot.sound`.

This is a conditional map/fiber theorem. It does not instantiate the Whirligig encoder, prove the ray-hit algorithm complete, or establish equation recovery. PR #873 remains open/draft/unmerged; separate modules have separate failures, so this is not a clean whole-PR result.

No new Lean file or run was created. The Whirligig source/observation/target maps and allowed equivalence classes are not yet fully instantiated. A new abstract proof without a real source/measurement target would be a data-free mathematical calculation, blocked pending explicit Nathan permission under the active BEDROCK rule.

No physical system, measured dataset, uncertainty model, physical prediction, H(s)H equivalence, or Factory Floor admission is supplied. The WWRD climbing-rope analogy is not used as a physical equivalence.

## 8. Branch and ownership boundary

- Pre-publication HsH `main`: `2b4763b447eeba09fe40a1a0e5bf3147bce6ec6d`.
- Sandbox branch `whirligig-configurable-kinematics-2026-11-02`: `0a24b181a06ee89843b241424142beca47435344`; its only commit adds the model-derived pole-to-pole candidate section to the spec.
- No PR exists for that branch.
- Main spec and sandbox-branch spec differ (232 versus 354 lines).
- Browser HTML blob is identical on main and sandbox branch; the branch did not implement its proposed controls or candidate.
- No live Sites deployment was verified.

Meridian remains the engineering/solver owner. This is a public-source crosswalk for independent review, not an implementation assignment or branch edit.
