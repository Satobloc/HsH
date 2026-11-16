# Lane 00 | Time-symmetric constraints, collision inference, and time-surface fidelity

**Scope.** This is a source-fidelity addendum to the existing geometry and time-field work, not a new physical model. It isolates the December 2025 temporal-symmetry discussion, compares it with the later 2026 worldtube/timesheet description, and tests which parts of the historical assistant's mathematics actually follow from the direct source.

## 1. Source provenance and direct propositions

The primary source is the raw conversation **“SAT theory clarification”**, conversation ID `69378c7f-6320-8325-9e10-83e42fe1433c`. The relevant user-role messages occur on 2025-12-21. The raw Library export was inspected by message ID and timestamp; a byte-level checksum of that Library export was not available through the retrieval path, so none is claimed.

| User message ID | UTC timestamp | Direct-source content, summarized |
|---|---:|---|
| `4165643f-de5e-45a5-adeb-243049879b21` | 2025-12-21 11:12:44 | Tentatively proposes that forces may have some temporal reach in both directions, with spatial extent related to that reach. Mentions entanglement and a possible worldline “buzz” associated with electroweak interactions. |
| `7f2c0ff3-32fe-483a-8902-f2f9c4ded1e0` | 2025-12-21 11:17:13 | Treats entanglement as potentially transtemporal and action-at-a-distance as possible pastward or futureward interaction. |
| `243fe82f-a767-4b48-b764-b9a7aefdbfea` | 2025-12-21 11:18:24 | Floats, explicitly tentatively, the possibility that future interactions tug backward as past interactions tug forward. |
| `d841dc83-21bd-473b-832c-d346f28a0484` | 2025-12-21 16:10:26 | Narrows the interpretation: not strong retrocausality, but the whole system constraining the present, which is a balance of past and future. A controllable message to the past is treated as a separate, much harder thought experiment. |
| `ad06bfb8-1ef3-4364-b3eb-8a1e23baf99e` | 2025-12-21 16:12:06 | States that light speed remains the propagation limit while the time surface is involved in setting propagation; allows some causal “fuzziness” ahead of and behind it. |
| `adb49f57-8536-469d-96b1-248fd8e651dc` | 2025-12-21 16:14:33 | Gives the collision-course analogy: predicting a future intersection from trajectories is not the same as sending a signal to the past of the collision. |

These messages form a sequence, not six independent propositions. The 11:18 backward-tug suggestion is later qualified by the 16:10 clarification. The later clarification therefore controls the interpretation: **global temporal constraint or mutual accommodation is the better-supported reading; literal, controllable backward signaling is not asserted.**

No user-authored equation appears in this temporal-symmetry segment. The displayed factorization equation below is an assistant-side formalization of the collision-course analogy, not a recovered Nathan Direct equation.

The user's collision-course analogy is an analogy about inference versus communication. It is not a derivation of retrocausality, entanglement, or a specific field equation.

## 2. What the historical assistant added

The assistant repeatedly translated the user's tentative geometry into more determinate mechanisms. Those additions must remain separately attributed.

| Assistant reconstruction | Fidelity assessment |
|---|---|
| “Shared history and shared future” of entangled worldlines | A possible geometric interpretation, not a direct equation or demonstrated mechanism. |
| Measurement selects a branch of jointly constrained geometry | Additional interpretation. The direct source does not define a branch space, measurement map, or probability rule. |
| Force range is the projection of temporal coherence onto the present surface | A proposed mechanism. The direct source suggests a relationship between spatial extent and temporal reach but does not supply this projection law. |
| Gravity, electromagnetism, weak interaction, and strong interaction form distinct grades of temporal coupling | Assistant-generated taxonomy. No source-derived scale, equation, or measured comparison supports it. |
| No-signaling and compatibility with Bell constraints follow automatically | Overclaim. No probability model, Bell-factorization condition, measurement-independence analysis, or no-signaling proof is supplied. |
| The present is a finite-thickness transition zone with a front and back edge | One possible reconstruction of “fuzziness ahead and behind.” The direct source does not specify a finite four-dimensional slab, its thickness, or its boundary conditions. |
| “SAT replaces causal arrows with geometric consistency” | A concise assistant slogan, not a source-authored theorem. The collision analogy supports a narrower inference-versus-signal distinction. |

The assistant's references to Wheeler-Feynman, transactional interpretations, Aharonov-style approaches, and path-integral language are analogies unless an explicit mapping is supplied. Naming a framework does not establish equivalence to it.

The assistant also moved from the user's broad temporal-reach suggestion to claims about force-specific coherence decay, rephasing, and unlimited gravitational temporal reach. Those mechanisms are not present in the direct messages. No physical calculation is warranted from them.

## 3. Three different objects were being conflated

The source and its assistant reconstruction leave at least three mathematically different possibilities:

1. **A two-sided history constraint.** A full history is admissible only when past and future boundary or compatibility conditions are jointly satisfied. This is a condition on histories.
2. **A finite-thickness present slab.** A four-dimensional region around a nominal three-dimensional present surface. This is a geometric support with a thickness parameter.
3. **A three-dimensional timesheet.** A hypersurface or wavefront in a four-dimensional construction. This is a surface, not a finite-volume slab.

The direct phrase “fuzziness ahead and behind” does not select option 2 over option 1. The assistant selected a slab-like interpretation, but that selection is not source-authorized.

The 2026 direct source separately keeps an exact three-dimensional timesheet and a finite-thickness four-dimensional slab as distinct interpretations. It also distinguishes the timesheet normal from the transport direction. The 2025 two-sided-history idea cannot be identified with either 2026 object without explicit maps.

This addendum is complementary to the existing [timewave source-fidelity anchor #1375](https://github.com/Satobloc/HsH/issues/1375), [Forest Normalization source anchor #1376](https://github.com/Satobloc/HsH/issues/1376), and [observation-geometry-mathematics gate #1420](https://github.com/Satobloc/HsH/issues/1420). It does not replace those records or the [H885 helix-to-Klein-fabric report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/2026-11-16T2100Z_H885_S0_LANE00_2024_HELIX_TO_KLEIN_FABRIC_SOURCE_FIDELITY.md).

A further distinction is required between:

- **Inference:** present data may constrain a future intersection.
- **Causal influence:** a future event changes an earlier event.
- **Signaling:** a controllable code is transmitted and decoded at an earlier time.

The direct collision analogy supports the first and explicitly separates it from the third. It does not settle the second.

## 4. A precise mathematical test for the collision analogy

Let:

- (H) be a space of admissible full histories;
- (D_0) be the present-data representation;
- (p_0 : H 	o D_0) be the projection from a full history to present data;
- (I : H 	o Y) be a future-intersection or other history-dependent readout.

A deterministic present-only readout (ar I : D_0 	o Y) exists exactly when (I) is constant on every fiber of (p_0):

[
exists ar I, I = ar I circ p_0
quadLongleftrightarrowquad
p_0(h_1)=p_0(h_2)Rightarrow I(h_1)=I(h_2).
]

This is the formal content of the collision-course distinction. Predicting a future intersection from present data is possible only if all admissible histories with the same present representation agree on the relevant future readout. That condition is about representational sufficiency. It does not say the future sends a signal backward.

If two admissible histories share the same present data but differ in their future-intersection readout, then a present-only representation is insufficient. One must enlarge the representation, perhaps with more history, boundary data, or a slab. Which enlargement is appropriate remains open.

### Existing Lean evidence

The general map theorem is already formalized in `KestrelProjectedIncidence.lean`, PR [#873](https://github.com/Satobloc/HsH/pull/873), as `hallway_factorization_iff_fiber_compatibility`.

- PR merge-reference Actions run [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666) completed successfully.
- The module built at target 8935/8957 under Lean 4.34.0 and Mathlib.
- The theorem-specific axiom report lists `Classical.choice` for the factorization equivalence. The uniqueness theorem reports `Quot.sound`.
- This is PR-branch evidence, not a main-branch integration. Tests, lint, nanoda, leanchecker, and the automated global axiom audit were skipped.

The theorem verifies the formalized factorization condition. It does **not** instantiate a SAT/H(s)H history space, establish that the present determines the future, prove retrocausality, or validate a physical model.

A related worldtube/timesheet readout criterion exists in Ravel's open [PR #1133](https://github.com/Satobloc/HsH/pull/1133). Its `RavelJointAccommodationReadout` module built during run [#43849175548](https://github.com/Satobloc/HsH/actions/runs/43849175548), but the full workflow failed in the shared `MovingPlaneTraceGeometry` module because of noncomputable definitions. The target module's build is not a green full-project verification. It formalizes a special `sameTube`/`sameSheet` quotient, not the general source-level relation between every possible worldtube and timesheet.

The symmetric-allocation formalization in [PR #1378](https://github.com/Satobloc/HsH/pull/1378) remains open and draft. Its current PR-associated build failed with a parser error at line 179. It does not currently provide a verified theorem that the worldtube and timesheet are exchange-symmetric. The group-action assumptions would require a common type and an explicit exchange symmetry that have not been supplied.

## 5. Crosswalk to the 2026 worldtube/timesheet geometry

The 2026 direct source treats mutual worldtube-timesheet curvature as a working hypothesis while retaining worldtube-only, timesheet-only, and mutually distributed descriptions as possible representations. The 2025 temporal-symmetry source can be compared to that geometry, but not identified with it.

A candidate typed map would need at least:

```text
Full histories H
      |
      | present-data projection p0
      v
Present representation D0

Full histories H
      |
      | future/past constraint readout I
      v
History-dependent observable Y

Worldtube W4  <---- explicit relation R ---->  Timesheet Σ3
      \                                      /
       \---- observation/readout O --------/
```

The relation (R), the history-to-geometry map, and the readout maps are all still unspecified. The 2025 global constraint could be encoded in a history space without being a finite slab. The 2026 mutual-curvature hypothesis could be a geometric realization of some such constraint, but no direct source or formal result establishes that correspondence.

The optional responsive medium discussed in 2026 is a third candidate carrier. It is not automatically the same object as the 2025 assistant's temporal-coherence language or any earlier effective-source tensor.

## 6. Discrepancy ledger

| ID | Discrepancy | Required correction |
|---|---|---|
| TS-01 | Tentative backward-tug wording was initially treated as literal retrocausality. | Preserve the later direct qualification: global balance, not strong retrocausality. |
| TS-02 | Assistant's finite-thickness “now” was presented as if it followed from causal fuzziness. | Keep slab, exact timesheet, and two-sided history constraint as separate candidates. |
| TS-03 | Force-specific temporal-coherence taxonomy was presented as if derived. | Retain as assistant proposal only; no equation or data supports it. |
| TS-04 | No-signaling and Bell compatibility were asserted without a probability model. | Require an explicit operational model and proof of the relevant factorization/no-signaling conditions. |
| TS-05 | Future-intersection prediction was treated as if present trajectories always encode the future. | Require fiber compatibility of the history readout with the present-data projection. |
| TS-06 | Collision analogy was expanded into a physical mechanism. | Keep it as an inference-versus-signaling analogy until a dynamics or boundary-value model is defined. |
| TS-07 | 2025 history constraints were implicitly merged with 2026 worldtube/timesheet curvature. | Require explicit projection, relation, and composition maps before claiming equivalence. |
| TS-08 | The assistant's “SAT replaces causal arrows” slogan exceeds the direct source. | Retain the narrower claim: a future intersection may be inferable from a sufficiently constraining representation without being signaled backward. |

## 7. Next deeper cursor

1. Recover the raw November 9 gyroscope discussion if an exact conversation export becomes available; the current source locator remains unresolved.
2. Define the admissible history space, present projection, and future/past readout before deciding whether a finite slab is needed.
3. Specify the three-dimensional timesheet versus four-dimensional slab distinction and the transport/normal maps in the 2026 geometry.
4. Define a source-grounded relation between worldtube and timesheet and show which readouts are constant on the relevant projection fibers.
5. Only after those objects and maps exist, instantiate the existing Lean factorization theorem in a source-specific model.
6. Do not calculate force-range or temporal-reach values without an identifiable measured system, dataset, provenance, units, uncertainties, and a prediction-versus-fit separation.

**Disposition:** source-fidelity addendum complete for this temporal-symmetry cluster; general fiber-factorization theorem verified in an existing PR; source-specific physical model not formalized; no numerical calculation, CODATA scoring, observational validation, or theory promotion.
