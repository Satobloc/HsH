# Aster h1110:s0 | Cruller phase model: c-typing reconciliation

**Disposition:** SOURCE_FIDELITY_ONLY / ADDITIVE_CROSS_REPORT_RECONCILIATION / NO_THEORY_PROMOTION

This addendum connects two existing, non-duplicate source-fidelity records: [Sable h1064, issue #2484](https://github.com/Satobloc/HsH/issues/2484), which audits the assistant-generated Cruller phase model, and [Sable h1064, issue #2485](https://github.com/Satobloc/HsH/issues/2485), which records the current typing of c. The new result is the cross-report incompatibility between those two constructions.

## 1. Primary-source boundary

The November 8, 2026 source cluster is the raw conversation “ND Workshop Relay :24 | Geometry,” conversation `6aecede1-4c08-83e9-abc4-da64f59a4f51`, Library raw-export SHA-256 `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d` (8,331,175 bytes). The selected raw export has 1,150 mapping nodes, 33 user-role messages, and 29 user-role messages on its selected current-node ancestry. The other Library export variant is not byte-identical and is not treated as an independent witness.

Relevant current-ancestry user-role messages include:

- `bcbe9ee8-b621-4a40-9edb-b34c17783be5`: a four-dimensional tube region around a one-dimensional core, a three-dimensional boundary, a possible mouth onto a timesheet, and a possible two-dimensional worldsheet as a simplification.
- `f9356192-0ec6-4a9c-ab53-ab76bf75c42e`: pants is a special split rather than the general straight/coiled case; an Alexander-horned-sphere construction is floated as a possible split/merge heuristic.
- `6db8c5e8-a2db-4621-922e-adab214e025e`: θ₄ is named as the canonical vacuum/matter discriminator; geometric winding alone is not a baryon-creation or source-law account.
- `c0520975-02a0-408f-a250-364b88ab7b30`: w is proposed as a fourth spatial dimension, with proper time distinct; the timesheet may be a wavefront or another construction; “same c, different paths” is a working idea.
- `8f4af45d-7635-44c7-8bc0-addad4e92a95`: asks for explicit maps between worldtube structure, centerline geometry and observed quantities; distinguishes a local responsive-medium mechanism from global worldtube/timesheet constraints; treats rope/vortex language as a comparison, not a derivation.
- `139e1e11-99f1-459b-a6ac-cb865015d0ff` and `429ad1fa-d171-44dd-97ff-aa080cea03ca`: later epistemic qualifications. The current BEDROCK entry ND-2026-11-08-01 preserves the prohibition on universal information-conservation, information-retention, holography, observer-completeness or guaranteed-predictive-continuity principles.

These are direct user-role propositions, questions and candidate models. They do not supply a complete metric, constitutive law, phase map, intersection map or physical validation.

The current control document [MINIMUM_THEORY_PREREQUISITES](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/MINIMUM_THEORY_PREREQUISITES.md) types c as the w-component of propagation of the timesheet-filament intersection/readout. It explicitly excludes interpreting c as total Euclidean path speed, material-filament speed, axial speed, transverse winding speed, phase speed or signal speed. The raw conversational UUID for that control clarification was not recovered in this pass; [issue #2485](https://github.com/Satobloc/HsH/issues/2485) already records that provenance limit. It is therefore cited here as a current Nathan Direct control document, not as a newly recovered raw message.

## 2. The cross-report discrepancy

The historical assistant response `02ad70b2-811f-415a-aa18-77599916b7df` proposes:

- a candidate spatial home manifold M = S³ × S¹;
- a circle-valued phase field Φ(x,w;λ) = n w − ω λ + ψ(x);
- level sets ΣΦ(λ) as candidate three-dimensional temporal fronts; and
- a path-length assumption ds/dt = c, followed by a projected-speed expression of the form dx/dt = c / √(1 + y′² + z′² + w′²).

This is assistant reconstruction, not Nathan Direct. The conditional projected-speed identity is mathematically intelligible if s is the Euclidean four-dimensional spatial arclength of a curve parameterized by t and c denotes that curve’s total spatial speed.

But the current control typing gives c a different referent: the w-coordinate component of propagation of the timesheet-filament intersection/readout. Those are not the same quantity. No map or premise equates the total arclength rate of an assistant-constructed path with the w-component of propagation of the source-defined intersection.

**Result:** ds/dt = c is not an admissible H(s)H speed constraint under the current c typing. At most it is a separate toy-kinematics assumption for the assistant’s proposed curve. It must not be used to derive a material-helix velocity budget.

The direct phrase “same c, different paths” may be compatible with a fixed w-component of intersection propagation while the worldline arclength encountered per resolving advance varies with geometry. That is only a candidate reading: the intersection object, parameter, metric and readout map remain unspecified.

## 3. Stable glossary and dimensional map

| Object | Source-grounded role | Unresolved condition |
|---|---|---|
| γ¹ | One-dimensional filament/centerline | Its relation to the finite-core support |
| W⁴ | Candidate finite-core tube support | Thickening map, metric, normal bundle and regularity |
| ∂W³ | Candidate three-dimensional boundary | Boundary orientation and construction |
| Σ³ | Candidate timesheet/resolving surface | Whether it is a hypersurface, wavefront or interacting structure |
| I | Timesheet-filament intersection/readout | Whether I means γ∩Σ, W∩Σ or ∂W∩Σ |
| RΣ | Direct-named readout to observed 3+1D quantities | Domain, codomain, interaction and information semantics |
| c | w-component of propagation of the source-defined I, per current control | Requires I and its propagation parameter to be typed |
| Φ | Assistant-proposed circle-valued phase field | No source-defined map to Σ, I, RΣ or θ₄ |
| θ₄ | Vacuum/matter discriminator; BEDROCK baseline references the time normal | Symbol registry still marks the active convention provisional |
| λ | Assistant process parameter | No map to proper time |
| K² | Candidate two-dimensional worldsheet simplification | Restriction, quotient or sweep map not defined |

Conditional transverse-intersection dimensions in a four-dimensional ambient manifold:

~~~~
γ¹ ∩ Σ³       -> 0D point
W⁴ ∩ Σ³       -> 3D section
∂W³ ∩ Σ³      -> 2D boundary-mouth candidate

W⁴ -> ? -> K²          (worldsheet reduction not defined)
Φ level sets -> ΣΦ³    (assistant candidate only)
ΣΦ³ -> ? -> Σ³/I/RΣ    (identification not defined)
I propagation -> w-component -> c
~~~~

The dimension arithmetic is covered conditionally by existing [PR #1133](https://github.com/Satobloc/HsH/pull/1133). It does not construct W, Σ, I or RΣ. A two-dimensional worldsheet is not automatically the same object as the intersection of the three-dimensional tube boundary with the timesheet.

## 4. Original propositions versus assistant translations

| Primary or historical proposition | Assistant translation | Fidelity assessment |
|---|---|---|
| w is proposed as a fourth spatial dimension; proper time is distinct | M = S³ × S¹ with external λ and phase evolution | A possible model choice, not a direct-source manifold or parameterization |
| Timesheet may be a moving wavefront or interacting surface | ΣΦ(λ) as a phase level set | Candidate representation; no map identifies it with the direct timesheet |
| “Same c, different paths” | ds/dt = c for a four-dimensional spatial curve | Semantic type mismatch under the current c control |
| θ₄ is the vacuum/matter discriminator | Φ supplies a phase coordinate | No map Φ → θ₄; keep the symbols distinct |
| A 2D worldsheet may simplify a 4D tube | A lower-dimensional phase projection | No restriction, quotient or composition map supplied |
| Rope/vortex mechanics may help compare mechanisms | Geometric analogy | First-blush heuristic only, not physical equivalence |
| Information may be unobservable in a slice | Information “goes somewhere” | Later RMS epistemology forbids universal retention/completeness claims |

The undated SAT_O Project [4D Thinking Primer](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/4D%20THINKING%20PRIMER.txt) describes a 3+1 spacetime picture with time as a coordinate and “worldtubes, not worldlines.” The historical [Fundamental Intuitions extraction](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/THE%20FUNDAMENTAL%20INTUITIONS%20%E2%80%94%20EXTENDED%202.txt) instead presents worldlines/filaments plus a time wavefront, with a particle as their intersection. Neither document is a raw user-role message. The November 8 Cruller proposal adds a distinct four-spatial-dimensional w plus separate proper-time candidate. These representations may be related, but no representation map has been established.

A full read of the 2025 “Holonomy and physics compatibility” raw conversation (conversation `6949c9ce-002c-8332-8208-ae2112288536`, 33 nodes / 16 user-role messages) reinforces the provenance caution: the user’s later “interchangeable/equivalent” statement follows an assistant assertion of equivalence. It is conversational uptake, not independent mathematical confirmation. The duplicate raw export blobs `1600b58f79c74a89ecea588ec6f5932502005098` and `50fa468c62b4d7493acf3d200ca590513f02432d` have identical message mappings and are not independent witnesses.

## 5. Proof and validation boundary

Existing exact-head CI was reused; no new Lean module was created:

- [PR #2441](https://github.com/Satobloc/HsH/pull/2441), head `9d75fa18c3c5906c7e4a7df7caa8a1f9bd0f1a6c`, [Actions #45252994322](https://github.com/Satobloc/HsH/actions/runs/45252994322): successful Lean 4.34.0 / Mathlib build for the conditional result that a periodic spatial return cannot also be a strictly increasing return of a single-valued real proper-time function.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133), head `95f508ed2625b169f36803479b9c1484b3e93374`, [Actions #45711289709](https://github.com/Satobloc/HsH/actions/runs/45711289709): successful exact-head formal-library build for conditional carrier/timesheet dimension and sweep-rank statements.
- [PR #873](https://github.com/Satobloc/HsH/pull/873), head `94b6d96c91806a95505260a3c52220f4af294185`, [Actions #44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878): successful exact-head build for the earlier moving-plane helix readout model.

All three PRs remain open/draft/unmerged. These builds verify only their formalized statements. They do not validate the source-to-formalization translation, establish the physical premises, identify the direct timesheet with an assistant phase level set, or provide observational validation. No measured system, dataset, units or uncertainties were available or used. No physical calculation or CODATA scoring was performed.

## 6. Next deeper cursor

1. Choose and type the intersection object I: centerline-timesheet, support-timesheet or boundary-timesheet.
2. Specify the ambient manifold and metric, and distinguish w from proper time and from the assistant parameter λ.
3. Define the propagation vector of I and the w-coordinate projection that carries c.
4. Define RΣ as an actual readout map, including what it preserves, discards or leaves observationally unresolved; do not assume universal information retention.
5. Define the phase field Φ and regularity conditions only if it is retained; keep Φ distinct from θ₄ unless an explicit map is supplied.
6. Define the restriction/quotient/sweep that could produce K² from W⁴ or its boundary.
7. Re-evaluate the assistant path-speed formula only after these source-defined maps exist.

**Stop condition:** no equation correction, physical prediction, new primitive, theory promotion or paper-gate advancement until the missing source-defined maps and their conditions are supplied. This artifact is a source-fidelity reconciliation, not a new physical model.
