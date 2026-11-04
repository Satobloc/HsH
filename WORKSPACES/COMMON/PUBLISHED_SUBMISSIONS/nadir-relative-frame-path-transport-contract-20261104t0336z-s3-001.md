# Convention-aware frame and path-transport contract for HAGALAZ

**Date:** 2026-11-04  
**Status:** PRE-STANDDOWN ARCHITECTURE SPECIFICATION / NOT IMPLEMENTED / NO PHYSICAL CLAIM  
**Relationship:** Distinct addendum to the already-published global-frame/path-transport gate in issue #1228. This does not replace or resubmit that artifact.

## Executive result

The HAGALAZ common record currently stores a bare Q_SO4 value. That is under-typed. A relative-frame matrix depends on which side acts, how frames act on vectors, and which composition order is used. The existing Lean formalization already distinguishes two valid conventions and proves their conjugacy, but the RUN 098-099 common-record examples do not carry a convention tag.

The new architecture requirement is to preserve two separate channels:

1. **Endpoint-relative frame:** a relation computed from endpoint frames only.
2. **Path transport:** a group-valued result computed from a declared connection along an actual path history.

Neither channel may silently populate the other.

This is a schema and verification improvement only. The HAGALAZ solver branch remains BACKSEAT/HOLD under the active Code Grurple interlock. No solver, branch, PR, task graph, paper, or BEDROCK state was changed.

## 1. Source and authority boundary

The public SAT archive extraction FINDING THE DONUT (nolat).txt, blob a788b5cc415f90de2d0382d3596ef07d68604687, lines 740-811, describes a crossover where the two surfaces have the same curvature and coordinate frame, and attributes the remaining tangent-transition effect to “holonomy.” The extracted passage does not define a connection one-form, a group-valued transport law, path ordering, or a curvature tensor. It is a Nathan-attributed extraction, not a raw role-tagged conversation.

The separate public Donut canon.txt, blob be985c292bfcae7352983d596c38e7f172f6029d, is a historical archive synthesis whose author-role is not verified. It is not a recovered Nathan equation and is not source authority for a physical connection.

The Nadir workspace README, blob 82b8805a00608d0a97f94cf467ef00de5b4e54f4, describes an independent finite-core/SO(4) mathematical playground. The raw October 1 role-assignment export and message UUIDs remain unavailable. The current worker label is therefore a routing identity, not authentication of a Nadir ChatGPT instance or authorship of this report.

## 2. The convention defect

The public RUN 099 frame-rotation control uses the right increment

E_ij = F_i⁻¹ F_j

because its supplied frames are orthogonal and the record writes Q_ij = F_iᵀ F_j.

The existing Lean module NadirFrameTelescoping.lean in PR #1189 also defines the left-acting relative frame

L_ij = F_j F_i⁻¹.

These are related by conjugation:

L_ij = F_i E_ij F_i⁻¹.

They are not generally equal. Their composition orders differ:

- Right increments: E_ij E_jk = E_ik.
- Left-acting relative frames: L_jk L_ij = L_ik.

The existing module proves leftRelative_eq_conjugate_edge, edge_comp, and leftRelative_comp. A common record that stores only Q_SO4 cannot tell a consumer which law applies. A downstream solver can therefore reverse a product or compare matrices in different frames while believing it has preserved the same object.

### Required typed field

Every relative-frame record must carry:

- action side: LEFT_ACTING or RIGHT_INCREMENT;
- vector/frame convention: row or column action;
- exact formula and index order;
- base frame used for conjugation;
- composition order;
- group and representation;
- orientation and sign convention.

Do not normalize these fields away merely because the two matrices are conjugate. Conjugacy preserves class functions, not raw matrix entries in an unrecorded frame.

## 3. Keep endpoint frames separate from path transport

The existing published issue #1228 proves a conditional group-theoretic boundary: if every edge comparison comes from one single-valued global frame potential, finite path transport telescopes to an endpoint relation, same-endpoint paths agree, and closed paths have identity transport. If two same-endpoint paths have different transport, the edge map cannot be represented everywhere by one such global frame potential.

That theorem is a necessary condition for path-dependent transport. It does not prove curvature, nontrivial topology, a physical connection, or an H(s)H mechanism.

The common record therefore needs a second, distinct object:

### PathTransportChannel

- source geometry and connection provenance;
- base space and path domain;
- bundle/fiber, structure group, and representation;
- path identity, orientation, parameter and units;
- generator family Omega_gamma(s) or an equivalent declared connection;
- left-body or right-body evolution convention;
- path-ordering status and composition law;
- closure/basepoint when a holonomy is claimed;
- gauge action and gauge-covariant readout;
- observation map, calibration, covariance and uncertainty.

Reserve **holonomy** for transport around a genuinely closed loop. For an open path, use **transport** or **parallel transport**.

A nonzero generator commutator is an ordering warning, not proof of physical holonomy. Pairwise commuting generators may permit an ordinary exponential reduction under the required regularity assumptions; otherwise the ordered composition must be retained. Curvature and global holonomy are separate: a flat connection can still have nontrivial global holonomy on a non-simply-connected base, while nonzero curvature alone does not guarantee that every selected path pair yields different readouts.

## 4. Minimal acceptance test after the hold is lifted

Keep the shared primitive geometry and endpoint frames fixed. Supply two distinct, explicitly declared paths with the same endpoints.

The record must preserve:

1. the same endpoint-relative frame in both cases;
2. separate path identities and connection provenance;
3. the ordered transport for each path;
4. the declared left/right convention and composition law;
5. a gauge-covariant observable readout.

The test passes only if the common record preserves the distinction without deriving path transport from endpoint frames. A nontrivial difference must be supported by the declared connection/history and survive the specified readout. If the observation map collapses the two histories, the claimed path invariant is not identifiable from that readout.

Do not execute a new synthetic path fixture under the current permission gate. Use a genuine measured path/history where available, or obtain specific prior permission for a named sandbox calculation. The existing Nadir Dyson/second-order scripts are historical sandbox artifacts and were not rerun in this pass.

## 5. Test matrix and real-system boundary

| Case | Inputs and provenance | Comparator | Calibration / holdout | Observable | Falsification or current disposition |
|---|---|---|---|---|---|
| Static interface control | Existing RUN 098-099 shared primitive and supplied frames | Endpoint-relative frame channel | Centers/radii fixed; RUN 099 rotates only F2 | Q_SO4 and Three-Spheres carrier output | PASS for channel independence only. Not a transport or physical test. |
| Path-history integration | A source-derived connection and two measured or specifically authorized same-endpoint paths | Endpoint-only global frame potential and the appropriate standard connection | Freeze shared geometry and calibration before comparing paths | Gauge-covariant transport/holonomy readout | NOT RUN. Fails if the common record collapses the path histories or if the readout cannot distinguish them. |
| Gravity Probe B measured-system boundary | Four-gyro flight experiment, 2004-08-28 to 2005-08-14; published final drift-rate results | Standard GR predictions | The published analysis uses six long science segments with segment-specific nuisance parameters. Raw Level-2 archive ASGR-00002 was identified but not retrieved; full covariance remains unavailable. No holdout replay was performed. | Geodetic and frame-dragging drift rates, mas/yr | Existing published values: geodetic -6601.8 ± 18.3 versus GR -6606.1; frame dragging -37.2 ± 7.2 versus GR -39.2. The H(s)H forward prediction is undefined, so this is not an H(s)H fit or test. |

The existing Nadir GP-B measured-data gate reports that the J13 term produced by imposing a sequential product on the two published simultaneous drift components is an ordering artifact, not a measured connection or holonomy. Its magnitude is 0.000595 mas, about 8.27e-5 of the published 7.2 mas frame-dragging uncertainty. The published marginal uncertainties do not supply the missing joint covariance. No new GP-B arithmetic was performed here.

## 6. Formal verification already available

PR #1189 is OPEN / DRAFT / UNMERGED and is based on another research branch, not current main.

- Exact head: 581ecb223fbd92f9d95292272ecd1e98b5740f6a.
- Module: FORMAL_VERIFICATION/HsHVerification/NadirFrameTelescoping.lean.
- Module blob: fb11f8bf95f2e01abd43d23eeccc75b3af85ff9b.
- Exact-head Actions run: #41580322998.
- Job: #125733379421.
- Lean 4.34.0 / Lake 5.0.0.
- Full build: SUCCESS, 8,953 jobs.
- The theorem-specific reports for the endpoint and left/right composition results show propext; the path-dependent/global-frame exclusion theorem reports propext and Quot.sound.
- The module source contains no sorry or admit. The build job was configured with nanoda-allow-sorry=true, and the separate repository-wide axiom audit was skipped; therefore this is not a global no-sorry audit.

This verifies the encoded discrete group identities at that exact PR head. It does not verify the source-to-formalization translation, a continuous connection, a projected worldtube connection, physical transport, or observational truth. No new Lean theorem or compilation is claimed in this pass.

## 7. Existing-tool check and disposition

The existing HsH Whirligig/RQ material, Math Hopper records, and PR #1189 were inspected before considering new tooling. No separate Satobloc repository named Whirligig or Math Hopper surfaced in the repository search; the usable material is already in HsH. The SciSpace connector is available, but no new literature search or paid service was needed. No new tool, dependency, branch, PR, or automation was created.

The HAGALAZ-SOLVER-UNIFICATION task remains BACKSEAT/HOLD under Code Grurple. No change was made to its task-graph entry or PR #895. This note is a pre-standdown interface specification, not implementation, paper advancement, Factory Floor admission, or theory promotion.

## Next cursor

After Code Grurple standdown, use the existing solver harness to add a convention-tagged endpoint-frame channel and a separate path-history transport channel. First obtain a source-grounded connection or a genuine measured path/history. Then run the two-path same-endpoint acceptance test, formalize the convention/composition and ordering conditions in Lean 4/Mathlib, compile the exact head, inspect theorem-specific axioms and full logs, and compare the resulting observable against a declared standard comparator with real calibration/holdout data. If the source-defined connection or measured path is still missing, leave the physical prediction blocked rather than supplying an arbitrary Omega(s).
