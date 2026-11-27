# Aldus h1133:s3 | Centerline-fiber criterion for finite-core observability

**Nominal slot:** 2026-11-27T05:36:00Z  
**Run key:** `REVROT3-19-20261011:1133:s3`  
**Deterministic selection:** Aldus, ring index 6; next label Calder, index 7.  
**Disposition:** `EXISTING_LEAN_RESULT_APPLIED / CONDITIONAL_MAP_CRITERION / NO_PHYSICAL_MAP_INSTANTIATED / P2_HOLD`

## Result

This report makes one specific architecture improvement: it applies an already-compiled factorization theorem to the H(s)H finite-core-versus-centerline question. It does not introduce a new theorem, new physical field, or new data.

Let:

- `W` be the proposed fine finite-core worldtube support;
- `Gamma` be the image of a candidate centerline projection;
- `pi : W -> Gamma` be that projection;
- `R_W : W -> Y` be a calibrated readout into an observable space.

The readout can be represented using only the centerline exactly when there is an induced map `R_Gamma` such that

`R_W = R_Gamma o pi`

if and only if the readout is constant on every fiber of `pi`:

`for all x,y in W, pi(x)=pi(y) implies R_W(x)=R_W(y)`.

This is the H(s)H interpretation of the existing theorem `factorization_iff_fiberwise` in `NadirProjectionCoarseGrainFactorization.lean`, with the fine-to-coarse map set to the identity and the coarse readout set to `R_W`.

**Consequence:** if the measured readout factors through the centerline, that readout contains no information that distinguishes transverse points within a centerline fiber. Finite thickness is therefore unidentifiable from that readout. If factorization fails, there must be at least one pair of points with the same centerline projection and different readouts. That is necessary for a thickness-sensitive observation, but it is not sufficient to attribute the difference to thickness: twist, boundary interaction, a responsive medium, calibration error, or another uncontrolled coordinate could also separate the pair.

For noisy measurements, exact equality must be replaced by an observational-equivalence relation defined from the calibrated covariance or likelihood. The existing theorem is deterministic and exact; it does not supply that statistical extension.

## Explicit map hierarchy and current gaps

| Object | Intended type | Current standing |
|---|---|---|
| `Gamma` | 1D centerline/history | Source concept; exact parameterization and domain not fixed |
| `S` | 2D string worldsheet | Standard comparison object; not identified with H(s)H support |
| `W` | 4D finite-core worldtube support | H(s)H working target; metric, cross-section and evolution incomplete |
| `Sigma_t` | 3D time-surface/timesheet | Separate proposed object; incidence with `W` not defined |
| `partial W` | 3D boundary/contact surface | Optional candidate; no source-defined boundary law |
| `Y` | Observable/readout space | No H(s)H-specific readout map selected |

The required maps remain uninstantiated:

- `pi_WGamma : W -> Gamma` (centerline projection);
- `R_W : W -> Y` (calibrated readout);
- `sigma_t` (time-surface restriction or intersection);
- `q_WS` (any proposed relation to a 2D worldsheet);
- `i_boundary : partial W -> W` and a boundary interaction law.

A 2D worldsheet, a 1D worldline, a 4D worldtube, and a 3D time-surface are not interchangeable labels. Any relation among them requires explicit domains, codomains, projection/inclusion maps, and composition conditions. No equivalence between GR worldtubes and string-theory worldsheets is asserted.

## Forced versus optional structure

| Feature | Current status | What would be required to promote it |
|---|---|---|
| Finite-core thickness | Working H(s)H hypothesis, not empirically forced | Source-defined cross-section and centerline projection, calibrated readout that is not centerline-factorizable, and independent holdout evidence |
| Coil scale `ell_f` | Distinct from intrinsic thickness | A source-defined map showing how coil scale enters the observable; it cannot substitute for a thickness definition |
| Twist/winding | Tentative construction-level feature | Normal-frame or bundle definition, connection/holonomy law, and a gauge-invariant observable |
| Contact/boundary surface | Optional/tentative | Boundary inclusion, boundary conditions or coupling law, and a measurable boundary response |
| Responsive medium | Provisional and potentially eliminable | Independent evidence that the medium is required rather than an effective description |

Thus the current sources do not force a separately adjustable twist field, a contact interaction, or a responsive medium. Nor do they establish a measured finite thickness. The working finite-core representation remains a hypothesis, not an observational result.

## Conditional test matrix

| Hypothesis | Required map and observable | Shared calibration and holdout | Standard comparator | Failure condition |
|---|---|---|---|---|
| Thickness adds observable structure | `pi_WGamma` plus `R_W`; a fiber-separated readout component | Freeze instrument response, covariance, nuisance parameters and support before an independent holdout | Same measurement operator applied to the minimally sufficient centerline/finite-body standard model | If all admissible readouts factor through `pi_WGamma` within pre-registered uncertainty, thickness is not required by that channel |
| Twist adds observable structure | Normal bundle/frame, connection or holonomy, and gauge-invariant readout | Freeze frame convention and calibration before holdout | Standard transport/orientation model with the same calibration | If the predicted twist-sensitive residual is absent within holdout uncertainty, that specific twist/readout claim fails |
| Contact surface adds observable structure | Boundary inclusion and explicit boundary coupling/readout | Freeze boundary conditions and shared nuisance parameters | Standard boundary-condition model | If the boundary response is reproduced by the standard comparator within uncertainty, the added contact law is not required |

These are conditional test requirements, not completed empirical tests. No numeric falsification threshold can be assigned before a physical system, dataset, units, uncertainty model, and source-derived readout are selected.

## Formal verification actually inspected

Existing work was reused rather than duplicated:

- PR #1189, branch `research/nadir-affine-translation-quotient-20261101t0324z`;
- module `FORMAL_VERIFICATION/HsHVerification/NadirProjectionCoarseGrainFactorization.lean`;
- tested source commit `3f344a3f120a9ed63c1836549e3bcb696589eaea`;
- Actions run [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757), job `139212241107`.

The run log explicitly checked out the expected commit and confirmed the actual checkout matched it. The full Lean build completed successfully with 8,963 jobs. The run executed theorem-specific `#print axioms` commands:

- `factorization_iff_fiberwise`: `Classical.choice`;
- `inducedCoarseGraining_unique`: `Quot.sound`.

No `sorryAx` or `admit` appeared in the target module's inspected proof output. The module blob on the current branch matches the blob at the tested source commit. This does not establish that the entire PR head or any merge is verified. The PR remains open/draft/unmerged.

The module contains no separate `#eval` witness. The actual verification here is the exact-source Lean build and theorem-specific axiom reporting, not a numerical evaluation or physical calculation. Tests, lint, global axiom audit, leanchecker and nanoda were not run.

Lean verifies only the formalized factorization statement. It does not establish that `W`, `Gamma`, `pi_WGamma`, or `R_W` are physically well-defined, source-faithful, or empirically true.

## Source and campaign boundaries

- Current HsH geometry/map-family records: [issue #1341](https://github.com/Satobloc/HsH/issues/1341) and [Map-Family Freeze Gate #2286](https://github.com/Satobloc/HsH/issues/2286).
- Current three-paper register: [P2 register #565](https://github.com/Satobloc/HsH/issues/565); P2 remains HOLD.
- Current BEDROCK was read from the HsH main branch. No BEDROCK promotion is proposed.
- Historical Aldus role evidence is a direct user-role message in the raw conversation export, message ID `939e981d-72ec-451b-81a3-f0a07b3a2c48`, raw blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`. It supports a broad cross-domain synthesis remit; no standalone signed Aldus charter was found. Assistant-authored later phrasing is treated as reconstruction, not Nathan Direct.
- Mersearch capacity was checked before further archive discovery. All four request lanes remain occupied: lanes 1, 3 and 4 have no verified request-scoped manifest/receipt; lane 2 has output but no verified release. No lane was overwritten, released, or retriggered. No new Mersearch search is claimed.

No physical system or raw dataset was selected or acquired in this run. No physical calculation, fit, prediction, uncertainty propagation, SAT-O/Blockwave equation edit, manuscript advancement, or theory promotion occurred.

P1 remains overdue/frozen/Orson-owned; P2 remains HOLD for November 30; P3 remains incomplete for December 14. P0 presentation safety remains FAIL and release remains unauthorized.

No task ID, schedule, phase, automation, worker inbox, queue, graph, or checkpoint was changed.
