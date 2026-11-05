# Carrier-trace dimension and relative-winding transport gate

**Run key:** `REVROT3-19-20261011:619:s3`  
**Status:** source-fidelity and observability-architecture addendum only. No H(s)H physical prediction, fit, data calculation, or theory promotion.

## Delta

This is a narrow addition to the carrier/map and feature-status work in issues #1341, #1374, #1376, #1391, and #1395. It does not add another feature-status axis. It adds a carrier-trace-frame comparability gate for the reverse-winding / Thirring question.

## Source custody

**Meridian Minkowski Ring Analysis** raw export: conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, Git blob SHA-1 `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; 3,678 mapping nodes, 112 user-role messages, 106 on the current ancestry. The previously open cursor `861acc12-5590-4bbb-aff1-b16a89bd18d9` has now been read through the final user-role message `59cdedb4-be76-455a-87c8-a6089de951b3`.

**Nathan Direct:**
- `861acc12`, 2026-10-21 07:04:01.650Z: asks how reverse winding comes about.
- `fce13cbe`, 07:07:49.207Z: asks to characterize Thirring's action.
- `9a43861c`, 07:12:22.028Z: proposes an 8-pi/gauge-decoupling connection. This is a hypothesis, not a derivation.
- `c5525f53`, 13:55:40.205Z: states current `cw=t`, `++++`, and Forest Normalization conventions.
- `59cdedb4`, 23:53:03.096Z: asserts that 3D rotation is 4D curvature and that all 3D acceleration is.

**Meridian Free Build** raw export: Git blob SHA-1 `7af1561b321f4d9364da5eb111df689efc652827`.
- `5a929b5e`, 2026-10-09 02:46:38.173Z: Nathan Direct equates inertia and worldtube bending in the intended representation, rejects invented elastic modulus/tension/spring constants, and says the time surface is interactive rather than a passive readout.
- `1178f25c`, 2026-10-09 07:40:38.859Z: Nathan Direct says to start with a 4D filament; its 3D intersectional trace is not the filament itself; 3D self-closure should not be assumed; and `ell_f` bounds a spin-equivalent first-order coil diameter, not filament thickness.

**Assistant reconstruction, not Nathan Direct:**
- `c98a8758`, 2026-10-21 07:05:23.687Z: `m + Omega_N` is a phase-gradient construction in an assistant-chosen curve and moving-normal-frame model. Within that model both terms are per-curve-parameter rates. It is not a lab-time rate or an authenticated Cruller law.
- `f6f8832a`, 07:07:03.319Z: `Omega_relative = Omega_1 - omega_drag` is an assistant-proposed GR comparison.
- `665b9444`, 07:10:05.296Z: `A_u = 12/sqrt(26)`, `A_u du/dt`, and a candidate relative-phase bookkeeping expression belong to the assistant-selected curve construction. No source-defined `u(t)`, material director, common observer frame, or H(s)H-to-GR bridge was recovered.
- `e26ef2c0`, 23:53:26.065Z: interprets the direct 3D-rotation/4D-curvature claim as bending of physical history/worldtube, not necessarily ambient Riemann curvature. That is an assistant interpretation, not a source definition or proof.

The `m + Omega_N` expression is not being called an algebraic error. Its limitation is scope: it belongs to a chosen parameterized curve and normal frame. It cannot be promoted to a physical time-rate or to the source's 4D filament without the missing carrier, parameter, and transport maps.

**Historical correction:** the `Finding the Donut` source PDF has SHA-256 `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae`; extracted-text Git blob SHA-1 `a788b5cc415f90de2d0382d3596ef07d68604687`; extraction date 2026-09-10, authoring date not recovered. It says the earlier 8-pi explanation was technically incorrect and the phenomenon was later recognized as frame dragging. The existing Kestrel audit already preserves the source/normalization correction. This note does not rederive 8-pi or treat it as a rotation operator.

## Carrier-trace-frame gate

The phrase "4D filament" does not unambiguously specify the carrier's intrinsic support dimension and codimension. Ambient dimension and intrinsic support dimension must not be conflated. Before assigning a normal bundle, twist, holonomy, or intersection dimension, declare:

1. Carrier support dimension/codimension, embedding, and material labels/directors.
2. Ambient metric and signature, not merely a signature shorthand.
3. Carrier parameter and its map to laboratory time. Keep `cw=t`, the separate `w`-length correction in #1395, and assistant `u(t)` distinct until a source defines their relation.
4. The 3D time-surface/slice, the actual intersection or projection operation, orientation, and conditions under which the trace exists.
5. The matter/time interaction law. The direct source rejects a merely passive readout interpretation.
6. Material-frame transport and any normal-bundle connection, only after the carrier type makes that bundle well-defined.
7. If Thirring is used, the Lorentzian observer tetrad/coordinate chart, then the instrument map and calibration.

Consequences:
- A 3D intersectional trace is not automatically a contact surface.
- `ell_f` is not worldtube thickness.
- A chosen normal frame is not automatically a material frame.
- `++++` does not supply the Lorentzian metric required by the standard Thirring comparator.
- The direct 3D-rotation/4D-curvature statement still needs to distinguish material-history/extrinsic curvature from ambient Riemann curvature.

## Relative-winding comparability

Keep these separate until a composition map joins them:
- Material rotation: requires source-defined material labels/directors and a rate relative to a specified observer.
- Normal-frame transport: requires a defined carrier, normal bundle, connection, and curve/surface parameter. The assistant `m + Omega_N` is only a per-parameter phase gradient in its chosen construction.
- GR frame dragging: requires a Lorentzian stationary-axisymmetric metric and specified observer frame. It is not the same object as the normal-frame connection or material rotation.
- Observed relative phase/precession: requires both candidate descriptions to map into the same observer frame, parameter, and instrument readout.

The candidate `A_u du/dt` conversion is usable only after a physical `u(t)` is defined. The current `cw=t` and `++++` conventions do not supply that map or a Lorentzian Thirring metric. The separate `w`-length statement in #1395 does not supply it either. The Meridian rotating-cylinder model is an assistant-generated standard-GR sandbox with arbitrary inputs, not an independent measurement or physical H(s)H prediction.

## Conditional test matrix

No physical system is selected in this run. This is a test contract, not an active empirical test.

| Hypothesis | Shared parameters | Calibration | Holdout | Predicted observable | Standard comparator | Proposed falsification condition |
|---|---|---|---|---|---|---|
| H(s)H carrier-to-trace map | Source-defined carrier support, embedding, metric, parameter, time-surface relation, material labels | Slice/time/orientation and instrument calibration on a declared subset | Independent slice, path, or epoch | Trace topology/geometry and any source-defined material phase | Standard intersection/projection and kinematic transport | Reject this map if held-out trace/phase lies outside its predeclared predictive region; if carrier/trace dimensions remain ambiguous, UNIDENTIFIABLE |
| Standard GR Thirring branch | Same measured source mass, angular momentum/current, geometry, observer location, and boundary conditions | Clock/gyroscope bias, coordinate frame, and geometry calibration | Independent path, radius, or epoch | Gyroscope or orbital precession in the specified observer frame | Thirring/Lense-Thirring plus a flat rotating-coordinate control | Reject the specified GR implementation if held-out measurements fall outside combined measurement/model uncertainty |
| H(s)H extension beyond GR | All shared GR parameters plus source-defined H(s)H carrier/transport map; no holdout retuning | Freeze source map and calibration parameters before holdout | Independent path/epoch and, where possible, independent instrument | Distinct invariant relative-phase/precession residual in the same observer frame | Standard GR result above | Reject this H(s)H map if its extra residual is absent within the predeclared predictive region; if absorbable by frame/parameter redefinition, NOT DISCRIMINATING |
| 8-pi / gauge-decoupling hypothesis | Source-defined gauge current and separately measurable gauge-sensitive observable | Independent gauge/readout calibration | Independent source regime | Specified gauge response, not merely a rotation rate | Standard field-equation coupling and gauge-invariant observable | NOT TESTABLE until the source current, observable, and prediction are defined |

**Threshold status:** a joint 95% predictive region is a proposed design choice only. No numerical threshold can be set until a real system, measurement covariance, calibration protocol, and multiplicity policy are available.

## Formalization and empirical status

- No new Lean theorem or data-free calculation was created.
- The local runtime has no `lean`, `lake`, or `elan` executable.
- PR #873 has an exact-head CI run in progress; PR #1245 has a merge-ref build success but does not prove this source-specific map; PR #1296's exact-head run failed. None establishes the carrier/trace/Thirring composition above.
- Lean formalization remains blocked on source-defined carrier types, parameter maps, and connection/readout domains. A Lean result would prove only the formalized statement, not the physical premises or translation.
- No physical system or dataset was selected, no numerical physical calculation or fit was run, and no Factory Floor admission or BEDROCK promotion is made.
- No SAT-O or Blockwave original equation was changed or recopied.

## Related records

- [Carrier/map closure, #1341](https://github.com/Satobloc/HsH/issues/1341)
- [Cruller source boundary, #1374](https://github.com/Satobloc/HsH/issues/1374)
- [Forest Normalization/time-history, #1376](https://github.com/Satobloc/HsH/issues/1376)
- [Four-axis feature-isolation gate, #1391](https://github.com/Satobloc/HsH/issues/1391)
- [w-length source-fidelity correction, #1395](https://github.com/Satobloc/HsH/issues/1395)
- [Meridian Thirring-cylinder sandbox](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_CRULLER_THIRRING_CYLINDER_8PI_SHEAR.md)
- [Kestrel 8-pi source-fidelity/normalization audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-10-29_2300Z_GAUGE_8PI_SOURCE_FIDELITY_AND_NORMALIZATION.md)
