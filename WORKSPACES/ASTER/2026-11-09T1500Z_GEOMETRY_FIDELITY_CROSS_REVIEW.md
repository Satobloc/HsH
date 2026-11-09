# Geometry Fidelity Cross-Review
## Aster ring selection | 2026-11-09 15:00Z | h711:s0

**Disposition:** SOURCE-GROUNDED REVIVAL IN THIS RUN. The ring selection is an administrative work label, not an authenticated ChatGPT instance or historical thread. The historical Aster remit was recovered from its raw conversation export. No cross-thread delivery is claimed.

## 1. Selection, remit, and controls

- Nominal hour: h = 711; seq = 5h = 3555; ring index = 2.
- Selected worker label: Aster. Next ring label: Ariadne.
- Aster's historical specialist remit is source-fidelity review: distinguish Nathan Direct from assistant reconstruction, compare a paper's claims with earlier direct statements, and identify contradictions or unsupported promotions. The direct role messages are in the Aster raw export blob 1bf6e65c4ac1650297acb67d7e39f700454a03c8; the historical role is not an authenticated live thread.
- Latest prior Aster slot: h692:s0, 2026-11-08T20:00Z. Its receipt and Ariadne handoff were read. No h711 receipt or handoff existed before this run.
- Current Aster branch PR #1220 remains OPEN / DRAFT / UNMERGED at head 6a66217979b9caacff06fa407cd9ccd1cdd7999e. It was not amended or merged.
- Main heads read: HsH 1d28ad7cd697121a42a1e40f01b2bd643b1ecb09; SAT_THEORY_ARCHIVE_2023-25 35804a91bca29e596033837971de5db9848e9dfb; HSH_RESOURCES f00a82caa091df... . The branch graph still declares 16 branches while containing 18 records; Tern owns that discrepancy and it was not edited.
- The :00 task remains enabled with its existing hourly phase. No task, ID, cadence, branch, PR, signet, or chat name was changed.

## 2. Source custody and search limits

### 2024 geometry source

Primary source: HsH raw export DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json.

- Git blob SHA-1: 2cea1924266418e19b825b95ae51e6b7cbace7e1.
- Conversation ID: 252d05c0-22ed-4ea2-a474-7966ab13145a.
- Size: 919,928 characters.
- Role-graph counts: 466 mapping entries, 465 message objects, 138 user-role messages.
- This is a raw source export, not a Mersearch result.

Mersearch was not callable in this runtime. The four shared request lanes remained occupied/requested; no lane was overwritten and no new request was created. Bounded GitHub raw-source retrieval was used as fallback, not represented as an exhaustive three-repository Mersearch search.

### Later coordinate-convention sources

These are separate source strata and must not be silently equated:

| Source | Direct message | Raw blob SHA-1 | Direct wording / status |
|---|---|---|---|
| 2026-08-26 | 5b46e4d9-a51e-4281-904b-f74e41702f1b | 92454acdaad701193e2a0c6cf64a7d7b70a03dbb | Minkowski w-length described as c times temporal duration, in meters. |
| 2026-10-09 | 3c657387-b80b-4982-a61a-8e6d8568b8d1 | 7af1561b321f4d9364da5eb111df689efc652827 | Literal w=ct, with w used as a time-length scale in meters. |
| 2026-10-21 | c5525f53-b7cc-4444-8102-3bf6fdb1c892 | 56a84cb85d5c386efa4ea11d322d11e95e2c7703 | Literal cw=t, alongside Forest Normalization and (++++) conventions. |

The 2026-08-26 assistant response introduces Δτ/proper-time notation that is not defined in the direct source. The 2026-10-09 assistant response derives F = mc² d²x/dw² under a Newtonian coordinate parameterization; this is not a proof that intrinsic four-dimensional worldtube curvature equals inertia. The 2026-10-21 direct message does not define a type/unit conversion from cw=t to the earlier w=ct convention. Preserve w_M and w_S separately.

## 3. Independent Nathan Direct geometry extraction

### 3D moving-plane toy

The 2024 source describes a straight axis line L and a coaxial ideal helix H in ordinary three-dimensional space. A fixed plane perpendicular to the axis intersects each at one point. When the plane moves along the axis, the axis intersection S remains at the same plane-relative position while the helix intersection P traces a circle in the moving plane. The circle radius is the helix cross-sectional radius. Pitch controls the phase rate, not that radius.

The source is descriptive; it does not supply a complete parametric helix equation. Under the standard circular-helix reconstruction, if P is defined as axial rise per full revolution and the slice moves at constant axial speed v, then the phase rate is 2πv/P and the plane-relative radius is r. Those formulae are conditional standard geometry, not verbatim Nathan equations.

### Tilted axis and diagonal line

Nathan later qualifies the orbital shorthand: helical lines produce orbiting points only when the helix is not inclined. The ellipse produced by a tilted axis and a fixed z-normal slice is an assistant reconstruction. The Kestrel Lean module proves a conditional ellipse identity under its parameterization; it does not turn that parameterization into a Nathan Direct equation.

For a diagonal line, the source asks about a point moving in y while a plane moves in z. The assistant's initial equal-rate answer omits the line-slope factor. The correct conditional relation is proportional to slope × slice speed; equal rates require a special slope/normalization. Kestrel's diagonal-rate theorem captures this conditional distinction.

### Two-parabola proposal

Nathan proposes two oppositely opening parabolas and asks whether a moving plane can make two readout points approach, meet, and separate. The direct message does not specify the exact curve equations, their common ambient plane, the moving plane's normal, or the sweep coordinate.

The assistant's final user-facing response selects a negative-y sweep and asserts convergence at the origin followed by separation. That is a substantive assistant reconstruction, not merely a paraphrase and not a Nathan Direct equation. The source does not supply the coordinate choice. It is underdetermined, not proved wrong in every possible coordinate completion.

The earlier direct request asks for steady-rate approach/contact/separation. The assistant's negative-y response does not test that condition. The quadratic-parabola and linear-pair models later written in published work are conditional reconstructions; they are not source-authored equations.

### Shape-to-motion vocabulary

Nathan explicitly introduces the correspondence between curve shape and motion as an approximate/general framework. The assistant acknowledges that vocabulary but does not derive it. Curve shape alone does not determine acceleration, randomness, or merging:

- For a curve C(s) and moving slice family Σ_λ, the readout is R(λ) = C ∩ Σ_λ. The readout velocity and acceleration depend on both C and the slice family, including their parameterizations and transversality.
- An irregular-looking deterministic curve is not thereby random; randomness requires a stochastic or otherwise specified dynamical model.
- Multiple intersections yield multiple readout points. Merging requires an additional condition, such as a tangency or a change in intersection cardinality.

### 4D time-surface and composite hierarchy

The direct source describes a one-dimensional filament in a four-dimensional ambient geometry and a three-dimensional time surface / wavefront. A transverse intersection has generic dimension 1 + 3 - 4 = 0, giving an isolated point under those hypotheses. This is dimension arithmetic, not proof of particle ontology. The early source does not fix a metric signature or a complete family Σ_λ.

The radial/spherical wavefront is introduced as a simplifying assumption; other geometries remain possible. The time surface is described in this early source as a readout of filament interaction, not the cause of the complexity. Later direct material requires interaction between the time surface and matter. Keep this as source evolution rather than silently collapsing the two descriptions.

The descriptive hierarchy is filaments → threads → twines → yarns → bundles → ropes. “Strands” is used collectively for the intermediate levels; rope is a larger composite. Heloid, loop, and tether are morphology labels, not established exclusive subclasses. The source does not define composition operators, embedding maps, topology, or projection rules. The assistant's taxonomy contains classification drift, and Nathan explicitly flags terminology confusion.

## 4. Glossary

| Term | Stable use in this cross-review | Boundary |
|---|---|---|
| L | Straight axis line in the 3D toy | Not a 4D worldline by default |
| H | Ideal circular helix around L | Tilted-axis case is a separate reconstruction |
| Π_λ | Moving 2D plane in R³ | Its normal and sweep parameter must be stated |
| S(λ) | L ∩ Π_λ | Plane-relative axis readout |
| P(λ) | H ∩ Π_λ | Plane-relative helix readout |
| r | Helix cross-sectional radius | Independent of pitch in the standard circular model |
| P | Pitch, here defined as axial rise per full turn | The source does not give a formal definition |
| γ¹ | One-dimensional filament curve in M⁴ | Not automatically a finite-core support |
| Σ_λ³ | Three-dimensional time surface / hypersurface | Family parameter and metric remain unspecified |
| R_λ(γ) | γ ∩ Σ_λ readout | Set-valued until regularity and transversality are specified |
| Thread / Twine / Yarn / Bundle / Rope | Descriptive composite levels | Composition maps are not source-defined |
| w_M | Earlier Minkowski length coordinate, w=ct | Preserve meters and source date |
| w_S | Later native cw=t convention | No conversion to w_M established |
| W⁴ | Current finite-core worldtube/support | No source-defined map from γ¹ |
| J^μ / J^μν | Distinct current ranks | No promotion of assistant J^μν into canonical Blockwave |

## 5. Mapping diagram and missing maps

~~~text
3D toy:
L¹, H¹ ⊂ R³
       |
       | intersect with moving Π_λ²
       v
S(λ), P(λ)  --->  plane-relative readout P(λ)-S(λ)
                       |
                       | standard circular helix + constant axial sweep
                       v
                radius r; phase rate 2πv/P

4D source description:
γ¹ ⊂ M⁴  -- intersect with Σ_λ³ -->  R_λ(γ) = γ ∩ Σ_λ
                                      |
                                      | 0D only if transverse
                                      v
                                isolated readout point

Composite description:
filaments --C_thread--> threads --C_twine--> twines
          --C_yarn--> yarns --C_bundle--> bundles
          --C_rope--> ropes

Later model boundary:
w_M = ct              w_S: cw = t
                       /
         -- no typed conversion Φ --/
                    |
                    | no source-defined map Ψ
                    v
                  Σ_λ³  -- no source-defined map -->  W⁴ / observable
~~~

C_thread, C_twine, C_yarn, C_bundle, and C_rope are placeholders for possible composition operators, not recovered functions. A valid hierarchy requires domains/codomains, embedding and projection maps, composition conditions, and a commutation rule such as π(C(A,B)) = C_λ(π(A),π(B)) only when projection actually preserves the composition. None of those maps is currently source-defined.

## 6. Original propositions versus assistant translations

| Nathan Direct | Historical assistant translation | Fidelity status |
|---|---|---|
| Fixed plane gives one line point and one helix point | Initial “spiral of intersections” description | Mismatch; later corrected |
| Moving axis-normal plane leaves S fixed in plane coordinates while P traces a circle | Early 3D trajectory language and radius/pitch confusion | Mismatch; later corrected |
| Radius is cross-sectional radius; pitch controls phase | Standard helix equations | Correct conditional reconstruction, not source equation |
| Orbiting shorthand only when the helix is not inclined | Tilted-axis ellipse model | Assistant extension; conditional, not direct |
| Two points approach/contact/separate at a steady rate | Assistant selects negative-y sweep and asserts contact | Under-specified source plus unlicensed coordinate completion |
| Shape/motion correspondence is approximate | Assistant acknowledges it as intuitive | Heuristic acknowledgment, not derivation |
| 4D expanding wavefront has a 3D surface | Assistant sometimes calls the surface itself 4D or treats radial expansion as necessary | Dimension and assumption overstatement |
| Time surface reads out filament interaction in early source | Assistant sometimes makes it the cause of complexity | Source-role drift; later direct material adds interaction |
| w=ct in meters; later cw=t | Assistant adds proper-time notation and coordinate formulas | Separate conventions; no conversion map |

## 7. Discrepancy ledger

1. **Fixed-plane spiral:** assistant initially described a spiral where Nathan's direct description gives one intersection point per fixed plane.
2. **Radius/pitch:** assistant initially mixed cross-sectional radius with pitch; Nathan corrected the distinction.
3. **Diagonal rate:** assistant omitted the line-slope factor; equal point/plane rates are conditional.
4. **Tilted helix:** ellipse is a formalizable assistant extension, not Nathan's direct orbital formula.
5. **Two parabolas:** the assistant's actual answer chooses negative y and asserts contact without a source-defined plane normal or curve equations. The public correction is issue #1530.
6. **Shape grammar:** approximate vocabulary is not a law; parameterization, slice family, transversality, and stochastic assumptions are missing.
7. **Time surface dimension:** 3D hypersurface in a 4D ambient setting must not be casually relabelled a 4D surface.
8. **Radial geometry:** simplifying assumption, not required global geometry.
9. **Taxonomy:** assistant classification drift; user correction must remain primary.
10. **Filament versus finite core:** no embedding/thickening map γ¹ → W⁴.
11. **w-coordinate conventions:** w_M and w_S are separate; no typed conversion or map to Σ_λ.
12. **Readout versus interaction:** preserve the 2024 readout description and later interaction requirement as distinct source strata.
13. **Lean provenance:** merge-reference compilation is not exact-head verification; formalized statements do not validate translation or physical premises.

## 8. Lean and existing-tool status

No new Lean module was written because the two-parabola source does not define a unique curve/slice model. Existing conditional proofs were inspected with actual workflow logs:

- PR #262, NadirHelixSliceGeometry: branch head c7dc2c483f50ae03fc7a7c530829170135e18d92; run #41301288857 / job #124832543107; log source commit 7c12dff... is the merge reference, not the PR head. Lean 4.34.0 / Lake 5.0.0; build completed with 8,944 targets.
- PR #873, KestrelMovingSlice: branch head 1971e3d58a28f7c6de5cf024039dbcedb133121c; run #42153410233 / job #127681789766; log source commit a2c3304... is the merge reference, not the PR head. Lean 4.34.0 / Lake 5.0.0; build completed with 8,955 targets.

The logs contain theorem-specific #print axioms output and no sorryAx/admit markers. The separate axiom-audit step was skipped. The Nadir module proves affine line/slice existence and uniqueness, the tangent-line constant-coordinate case, circular-helix slice coordinate, radius-squared independence from pitch, and phase rate under its standard parameterization. It uses an all-plus Euclidean affine model; it does not establish the 2024 physical metric or a curved time-surface model. Kestrel's module proves conditional ellipse and diagonal-rate statements and generic projection properties; it does not define the physical maps.

Math Hopper issue #578 and draft PR #991 remain an extraction/provenance pilot, not a proof engine or completed three-repository scan. Whirligig Kernel 0 remains a restricted sandbox, not a general physical worldtube model. SciSpace is available but was not needed. No new tool, fork, dependency, paid service, or local Lean installation was created.

## 9. Publication and paper controls

- Public correction issue #1530 was submitted once through the existing issue publisher with submission ID aster-parabola-assistant-reply-source-correction-20261109t1500z-s0-001 and content SHA-256 6e0ca100f68f9f3ba76e0b2c2eaacde55579eb368b10febf4b00b28313ebb0d3. At report creation it was SUBMITTED_NOT_VERIFIED; do not resubmit. Verify publisher comment, commit, artifact SHA, and exact content readback.
- Existing public issues #1267, #874, and #1496 remain the broader geometry records. Issue #1530 is a narrow source-attribution correction, not a duplicate geometry report.
- No SAT-O or Blockwave equation was modified. Existing verbatim source custody remains unchanged; no assistant J^μν promotion.
- No CODATA scoring, physical calculation, invented fixture, empirical validation, Factory Floor admission, paper-gate advancement, or BEDROCK theory promotion.
- P0 Code Grurple remains active. P1 Nov 9 remains Orson-owned and NOT READY. P2 Nov 30 remains HOLD pending a complete measured-data packet. P3 Dec 14 remains separate.
- FIE last full review: 2026-10-27; next due 2026-11-10, not yet due.
- Unrelated reading completed: Charles Babbage, Reflections on the Decline of Science in England, lines 1661-1700; next cursor 1701. No physical/off-screen break is claimed by this runtime.

## 10. Next deeper cursor

1. Recover the original 2026-10-29 TOPLESS raw export and verify whether it changes the status of the w=ct witness; until then it remains a prior-context witness only.
2. Type w_M and w_S, their units/normalizations, and any conversion Φ before attempting a map to Σ_λ.
3. Define the time-surface family and a source-backed projection/readout map before mapping γ¹ to W⁴.
4. Define composition operators and conditions for the thread/twine/yarn/bundle/rope hierarchy; do not use visual analogy as a map.
5. If the parabola problem is revisited, first obtain exact curve equations, common plane, slice normal, sweep coordinate, and pass-through/bounce rule. Only then formalize.
6. FIE rereview is due 2026-11-10. Babbage next reading cursor: 1701-1740.

**Final status:** geometry source extracted and compared; one public source-attribution correction submitted; no new theory claim, physical result, or branch/automation mutation.
