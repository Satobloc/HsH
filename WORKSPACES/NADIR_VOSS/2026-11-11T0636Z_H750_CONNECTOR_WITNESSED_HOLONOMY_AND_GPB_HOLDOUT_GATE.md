# h750:s3 | Connector-witnessed holonomy and GP-B holdout gate

**Status:** SOURCE-GROUNDED ARCHITECTURE COMPLETE / LEAN EXACT-HEAD BUILD PASS / PUBLICATION TO FOLLOW / NO PHYSICAL PREDICTION / NO THEORY PROMOTION.

## 1. Rotation, scope, and authority

- Nominal occurrence: 2026-11-11, :36 UTC slot.
- (h=750), measured from 2026-10-11T00:00Z.
- (seq=5h+3=3753).
- (3753\bmod19=10).
- Selected ring label: Nadir Voss (index 10).
- Successor: Enheduanna (index 11).
- Run key: `REVROT3-19-20261011:750:s3`.

The ring label is a deterministic routing label, not an authenticated ChatGPT instance or thread.

### Historical Nadir authority

The raw historical conversation export was inspected: Git blob `d828fef5352045cb4d9486fdbeabd04043c4c119`, 327,029 bytes, 43 message nodes, 8 user messages. Direct user messages authorize a broad independent mathematical playground and trial-formulation work, but do not name Nadir or establish a permanent Nadir-specific specialist charter. The current `WORKSPACES/NADIR_VOSS/README.md` is assistant-maintained continuity, not a Nathan-authored charter. No `CURRENT_WORK.md` or `ROLE_CHARTER.md` was created.

The protected Nadir sandbox remains siloed. The immediate predecessor Elias h750:s2 receipt explicitly says no task or handoff was sent because Nadir's protected scope excludes Track A. This is an intentional autonomy boundary, not a missing packet. No Track A, P1 cognition, or other worker-owned task was taken.

## 2. Source genealogy and source classifications

### Historical archive equation

The public SAT archive file `Donut canon.txt` contains the source expression:

```tex
H_R=\mathcal P\exp\left(\int_R A\right),\qquad
H_Q=\mathcal P\exp\left(\int_Q A\right),\qquad
\Omega=H_R^{-1}H_Q\in SO(3).
```

- Git blob: `be985c292bfcae7352983d596c38e7f172f6029d`.
- Latest file commit: 2026-06-10T10:11:32Z.
- The file contains no embedded document date.
- Authorship is not established as Nathan Direct. Treat it as a historical archive artifact, not a verified Nathan-authored equation.

The expression calls R and Q curves but does not specify whether they are closed loops, whether they share a basepoint, or how their frame fibers are identified. The formula is therefore under-specified as a general comparison.

The separate `HOLONOMY DRAFT.txt` is a working draft with internal-circulation language; it was not used as evidence. The extracted `MINKOWSKI PROPER` material was not used: its source PDF hash is `6154673f22783049fde21716857e7effc0373db9afb86e39151296e17a3076b5`, extraction timestamp 2026-09-10T16:02:42Z, and Nathan's 2026-09-19 annotation says the document's claims were not independently verified. No old magic constants or particle labels were reused.

The HSH_RESOURCES front door and an internal-use geometry reference were inspected to distinguish relative frame orientation from connection transport. No internal source text, equation, or locator is reproduced in the public artifact.

No SAT-O or Blockwave equation was modified, transcribed, or promoted.

## 3. Substantive architecture improvement: closure and connector witnesses

Two independent conditions must precede a holonomy comparison:

1. **Loop closure:** holonomy is an endomorphism of a single fiber for a closed loop. For an open path, use parallel transport between its endpoint fibers, not a holonomy element.
2. **Basepoint/fiber alignment:** closed loops based at different points act on different fibers. A connector transport is required before their holonomies can be compared.

Let (E_x,E_y) be frame fibers at basepoints (x,y). Assume R and Q are closed loops based at x and y, respectively. Let (U_\kappa:E_x\to E_y) be parallel transport along a declared connector (\kappa:x\to y). With composition read right-to-left, the comparison transported back to (E_x) is:

```tex
\boxed{\Omega_\kappa
=H_R^{-1}U_\kappa^{-1}H_Q U_\kappa.}
```

If the loops share the same basepoint and frame, (U_\kappa=I) and the historical expression is recovered. This is a conditional correction to the comparison map, not a claim that the original expression is universally wrong.

Under gauge changes (g_x,g_y), the holonomies and connector transform together so that:

```tex
\Omega_\kappa\longmapsto
g_x^{-1}\Omega_\kappa g_x.
```

A conjugacy-invariant readout, such as a trace, is gauge-invariant but loses orientation information. Matrix components require a calibrated reference frame. Different connector paths can yield different comparisons when curvature is present; connector path choice is part of the model and cannot be selected after seeing the desired result.

The (SO(4)) extension is not automatic. It requires a source-defined four-dimensional bundle, connection, connector transport, and an explicit readout map into the measured instrument channels. The historical source is (SO(3)).

### Distinguish relative frame rotation from transport

The internal HSH_RESOURCES geometry reference distinguishes a relative orientation between framed objects from a connection-generated parallel-transport operator. These are not interchangeable:

- A relative frame map compares two supplied frames.
- A connector (U_\kappa) is generated by transport along a specified path under a connection.
- A framed segment or ribbon can carry roll/twist information that a bare endpoint pair does not encode.
- That extra degree is not automatically a measured twist observable.

This is a source-grounded representation distinction, not a physical equivalence or a new H(s)H primitive.

## 4. Composition and observability contract

Existing Nadir PR #1189 formalizes the abstract projection/coarse-graining condition: an induced map on the image of a projection exists exactly when the downstream coarse-projected result is constant on every fiber of the original projection. Its witness-carrying extension proves two-stage composition when each stage has its own fiber-constancy condition.

That theorem does not construct a physical connection, connector, holonomy, worldtube, timesheet, or instrument map.

The proposed observable chain is:

```text
measured state
  -> calibrated frame history
  -> declared connector transport
  -> common-fiber holonomy comparison
  -> instrument projection
  -> estimator
  -> reported observable
```

Every edge must carry:
- source/version and object identity;
- domain and codomain;
- basepoint and frame identity;
- loop-closure witness or open-path endpoint types;
- connector-path identity or explicit same-basepoint identity witness;
- connection/version and orientation convention;
- units, instrument channel, calibration lineage and covariance reference;
- map class (exact, approximate, probabilistic, measurement, or reconstruction).

Composition is admitted only when domains/codomains and semantic identities match. Otherwise an explicit transport or isomorphism is required.

Failure states:
- `PATH_TYPE_UNRESOLVED`: loop closure or open-path endpoint type missing.
- `INCOMPARABLE_BASEPOINTS`: no connector or same-basepoint witness.
- `FRAME_UNRESOLVED`: matrix readout without calibrated frame.
- `CONJUGACY_CLASS_ONLY`: scalar class-function readout used; orientation information discarded.
- `NO_SINGLE_VALUED_COARSE_READOUT`: fiber-constancy condition fails.
- `UNCERTAINTY_UNRESOLVED`: covariance or calibration lineage missing.
- `NO_EMPIRICAL_TEST`: no source-bound physical readout map or measured data.

## 5. Measured-system candidate: Gravity Probe B

**System:** Gravity Probe B, four cryogenic gyroscopes, science collection 2004-08-28 through 2005-08-14.

**Published four-gyro results:**
- Geodetic drift: (-6601.8\pm18.3) mas/year; GR comparator (-6606.1) mas/year.
- Frame-dragging drift: (-37.2\pm7.2) mas/year; GR comparator (-39.2) mas/year.

The 2015 data-analysis series describes a multi-stage estimator using LF/HF SQUID signals, telescope data, satellite roll phase, timing/orbit inputs, coordinate transformations, orientation profiles, covariance-bearing intermediate products, residuals, smoothing, and segment-level checks.

### Corrected segment and sampling facts

The 2015 Data Analysis II paper reports **nine spacecraft anomalies dividing the mission into ten science-data segments**. Only six longer segments (2, 3, 5, 6, 9, and 10) were used for drift-rate estimation; four short segments (each eight days or less) were excluded as statistically uninformative. The estimation series describes four gyroscopes times six usable segments, or 24 gyro-segment estimates. These were segment estimates and consistency checks, not a declared blind holdout.

Do not conflate:
- the synchronized two-second Level-2 data grid; and
- HF SQUID snapshots, described as 4096 samples at 2.2 kHz, sent at roughly 40-second intervals during about half of each orbit, with approximately (2\times10^5) snapshots per gyroscope.

This corrects a prior cross-lane summary that inverted the science-segment/anomaly counts and conflated the two-second Level-2 grid with the HF snapshot structure.

### The holdout trap

Each usable science segment has its own initial conditions, readout-scale-factor coefficients, misalignment-torque coefficients, and potentially resonant-torque parameters. Only the relativistic drift rate and telescope scale-factor parameters are common across segments.

A leave-one-segment-out design is therefore not automatically blind. If the held-out segment's local nuisance parameters are refitted from its outcomes, the result is a conditional reconstruction, not an untouched prediction.

A valid predictive design must either:
1. obtain local nuisance parameters from independent calibration;
2. propagate a frozen dynamical state into the held-out interval; or
3. label the result `CONDITIONAL_RECONSTRUCTION`, not blind holdout.

The retrieved text does not provide a numerical final covariance/correlation between the two combined drift-rate estimates. Intermediate covariance-bearing products are described, but the final joint covariance was not recovered here. Raw telemetry and processed database bytes were not downloaded.

The final two drift rates are fitted summary observables, not a directly reported path-ordered (SO(4)) holonomy. They are insufficient on their own to identify a general four-dimensional transport history. An H(s)H model needs a source-defined transport path, connector, instrument projection, and uncertainty propagation before it can make a distinct prediction.

## 6. Conditional test matrix

| Model | Required prediction | Shared parameters | Calibration/holdout | Standard comparator | Falsification |
|---|---|---|---|---|---|
| Standard GR | Published drift and time-resolved attitude estimates under standard pipeline | Drift rate and telescope scale factor common across segments | Same acquisition and nuisance treatment; local segment parameters independently calibrated or propagated | Baseline | Predeclared predictive score/residual threshold using full covariance |
| Minimal H(s)H | Frozen change in time-resolved orientation/readout not absorbed by shared calibration or torque parameters | Same shared parameters as GR; additional parameters only if identifiable | Same raw acquisition and calibration policy; untouched segment-level prediction only with independent local nuisance inputs | GR on identical data | Failure to beat GR on holdout, or residual outside predeclared uncertainty |
| Added worldtube thickness | Separately identifiable change in a measured channel | All GR/shared nuisance parameters plus declared thickness parameter | Must survive holdout and covariance propagation | GR and minimal H(s)H | No unique held-out signature or complete absorption by nuisance parameters |
| Added twist/contact | Readout sensitive to transported transverse frame, roll, or actual contact/intersection | Same shared parameters plus separately identified twist/contact parameters | Requires corresponding measured channel and independent calibration | GR and minimal H(s)H | No measurable channel, no independent calibration, or no held-out signature |

No numerical falsification threshold is invented. It must be set after raw/processed data, segment-specific parameter lineage, and the full uncertainty structure are recovered.

Thickness, twist, and contact surfaces are not forced by the two published drift rates. They remain optional until an identifiable observable requires them.

## 7. Lean formalization

A new companion module was added to the existing Nadir PR #1189 branch:

- File: `FORMAL_VERIFICATION/HsHVerification/NadirConnectorWitnessHolonomy.lean`
- Blob: `de1cccaa93047fa7e5764ca36503abf624f4cfc1`
- Root aggregator blob: `6e395aaf072283f6184ee65f47b1c27c7ab1a6f4`
- Branch head: `fbe078a94a0074c7eb00e98aee47bf718630d607`

The module formalizes:
1. same-basepoint reduction to the historical product;
2. gauge covariance of the connector-aligned comparison;
3. invariance of a declared conjugacy-invariant readout.

**Actual CI:** Actions run #42979143722, job #130385181747, SUCCESS.
- Exact checked-out source commit: `fbe078a94a0074c7eb00e98aee47bf718630d607`.
- Lean 4.34.0 / Lake 5.0.0.
- Full library build: 8,958 jobs.
- New module: job 8956/8958.
- Root aggregator: job 8957/8958.
- Theorem-specific `#print axioms`: `[propext]` for each of the three new theorems.
- Global axiom audit, tests, lint, leanchecker and nanoda were skipped.
- No `sorryAx` or `admit` occurrence was observed in the captured job log.

The new module assumes the connector is already represented by a group element in compatible trivializations. It does not construct a path, connection, parallel-transport operator, fiber witness, (SO(3)/SO(4)) representation, or physical readout. The proof is group algebra only.

PR #1189 remains OPEN / DRAFT / UNMERGED. It has zero independent review submissions and zero review threads. No merge or theory promotion occurred.

## 8. Tool and source audit

- Mersearch is not exposed as a callable tool in this runtime. Existing four request lanes remain occupied/requested; no request was overwritten or created.
- HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES front doors were checked. Pre-write main heads: HsH `8d7aeec2b5d2ba7ae49b20a5be604c5dd70cd32a`; SAT archive `7a46a3077c20617c0163071bcdd8ab7d2e42e57e`; HSH_RESOURCES `5b2c4f3e6197007228f06178d875459e76f75fe2`.
- Existing Math Hopper issue #578 and PR #991, Whirligig Kernel 0, and the current Nadir Lean PR were inspected. SciSpace was used for the GP-B data-analysis papers. No new tool, fork, dependency, subscription, or expenditure.
- The HSH_RESOURCES internal-use geometry reference was not reproduced or linked in the public artifact.
- No SAT-O or Blockwave equation was modified. The Donut expression and assistant-reconstructed connector comparison are kept separate.

## 9. Continuity and scheduler reconciliation

The immediate predecessor Elias h750:s2 receipt says no task or handoff was sent because Nadir's protected scope excludes Track A. No incoming handoff was expected; no predecessor autonomy boundary was overridden.

The deterministic successor Enheduanna h750:s4 had already completed by final inspection. A repository-only packet is therefore marked late optional context. It creates no task, response obligation, or ownership transfer. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

Enheduanna's h750:s4 report and Tern's inbox already record the same-ID start-time mutation for this :36 occurrence and the four-task-conversation multiplexing observation. No duplicate Tern inbox entry was added. The ring label is not treated as an authenticated instance or independent analyst identity.

At final scheduler readback, this :36 occurrence remained reported IN_PROGRESS with no authenticated thread reference; the cached result still pointed to the preceding Mira h749:s3 output. Repository and CI work are complete, but scheduler-wrapper completion and cross-thread delivery are not claimed.

The existing :36 automation remains enabled with its original task identity, recurrence, prompt, and phase unchanged. No sixth task was created.

## 10. Campaign and upkeep

| Gate | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 November 9 cognition | OVERDUE / NOT READY, Orson-owned |
| P2 November 30 geometry | HOLD |
| P3 December 14 full theory | INCOMPLETE |
| FIE rereview | Current; next November 24 |

Unrelated-reading cursor remains Babbage, line 1981. No new reading quantum or physical break is claimed this run.

No physical calculation, fit, H(s)H prediction, independent observational validation, paper-gate advancement, or BEDROCK theory promotion occurred.
