# Calder h1042:s3 | Mechanism-separated response and temporal-order identifiability

**Nominal UTC slot:** 2026-11-23T10:36Z  
**Run key:** `REVROT3-19-20261011:1042:s3`  
**Selected routing label:** Calder, ring index 7  
**Next routing label:** Hale, ring index 8, h1042:s4  
**Disposition:** `SOURCE_RECONSTRUCTION_COMPLETE / MECHANISM_CHANNELS_SEPARATED / CONDITIONAL_LEAN_DRAFT / NO_PHYSICAL_TEST / P2_HOLD`

## 1. Identity, authority and role

The rotation calculation is `h=1042`, `seq=5h+3=5213`, and `5213 mod 19 = 7`, selecting Calder. This is a routing label, not authentication of a historical Calder instance or current ChatGPT thread.

The best historical role evidence is the 2026-09-12 worker-authored self-report in `WORKSPACES/COMMON/CHECKINS.md`, blob `886069e71d4aec7a3f8d199d6d889b930a05c17`, lines 53-106. It supports empirical angle-clustering, adversarial null design, independent-unit discipline, statistical calibration/covariance, and source/method provenance separation. It is not a standalone signed Nathan Direct specialist charter. The separate Foundational Covariance / Global Architecture Calder identity remains distinct. No authenticated current empirical-Calder thread was established.

## 2. Primary-source recovery and epistemic status

Mersearch was the preferred archive route, but no callable Mersearch action was available in this execution and all four canonical request lanes remained occupied/requested. No request was overwritten, released, retriggered or created. The bounded fallback was direct reading of the public SAT archive source files, not a Mersearch result.

Sources actually read:

1. Historical author-labelled document `SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt`, SAT archive blob `1a50bc22075cdef4b7d3e4ef58da6a0b87650011`. The document is labelled Nathan McKnight; its document date was not recovered. It distinguishes constituent chirality/charge cancellation, ordinary bulk elasticity/dissipation, the Kelvin-like vortical response, and filament-on-filament interaction. It explicitly calls the battery/centrifuge sketch low-credence and low-priority, and says it mixes a spin-hysteresis test with a separate back/forward-tug test.
2. User-role passage in `SRENA SAT2.txt`, SAT archive blob `fe01fc85b1874c1573843724f035ee292fd48961`, lines 923-930. The transcript labels the speaker `Nathan`; he rejects braid-only Coulomb interaction and says “Why hello, Kelvin.” The following vortex-theory elaboration is assistant text, not Nathan Direct.
3. Current Primary Operational Guideline, 2026-11-08, blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`, §2.1: worldtube and timesheet are the two minimal primitives; a responsive medium is provisionally useful, not an established independent ontological commitment, and may be eliminated or absorbed.
4. Live BEDROCK, blob `2629ab29a5838d933c31727455553d206577a258`, ND-2026-10-22-02: Kelvin-vortex or a justified equivalent response is an active working constraint/hypothesis, not a proven physical law.

The historical “two-force universe” vocabulary in the battery note is preserved as historical source language. It is not promoted to current canonical theory. The 2026-11-08 Primary Operational Guideline controls over BEDROCK in any direct conflict.

## 3. Substantive architecture improvement

The historical battery sketch mixes two different experimental questions and several distinct response channels. The new architecture separates them before any physical test is proposed.

### A. Kelvin-like / electrogravity candidate

Question: does the source-required Kelvin-like response, or a justified equivalent, produce an observable beyond the minimally sufficient standard account?

Required map chain:

`measured rotating-object history -> finite worldtube representation -> measured constituent-geometry/chirality inventory -> explicit coarse-graining/response map -> medium/vortical observable -> calibrated instrument readout`

The source lists geometric descriptors such as radius-to-pitch, thickness-to-diameter, bending resistance, internal/external helical structure and dissipation. It does not supply a quantitative response law or the weights by which constituent handedness aggregates to a bulk response.

Charge state and constituent chirality must remain separate variables. A battery voltage or external charge state is not automatically a measurement of internal handedness. A charge-to-chirality proxy requires its own source-backed measurement map and uncertainty.

### B. Interbraid / temporal-order candidate

Question: does a filament-on-filament interaction or history-dependent tug produce a response that depends on the order of otherwise matched operations?

The assistant-proposed minimal contrast is an `A then B` sequence against `B then A`, with the same total exposure, geometry, initial/final conditions, material state and calibration. This is a test-design proposal, not a Nathan equation or established physical law.

For paired observations `R_AB` and `R_BA`, the local decomposition is:

\[
R_{even}=(R_{AB}+R_{BA})/2,\qquad
R_{odd}=(R_{AB}-R_{BA})/2.
\]

The even component is invariant under sequence reversal; the odd component changes sign. A nonzero odd component is not uniquely H(s)H: standard thermal, electromagnetic, mechanical and instrument memory must be modeled and measured as competing explanations.

### C. Material elasticity and dissipation

Bulk elasticity, damping, strain and energy loss are measured material properties and standard comparator terms. The historical source explicitly separates them from constituent chirality cancellation. They must not be used as interchangeable labels for chirality suppression or for an H(s)H force.

### D. Contact and geometry

The historical source names filament interactions and collision/contact events, but does not define a contact surface. If contact is relevant, the minimum representation is a source-bound incidence/event relation with a measured event record. A new contact-surface ontology is not forced.

Worldtube finite extent and thickness relative to diameter are source-relevant descriptors where internal structure matters, but no cross-section profile or thickness law is supplied. Helical centerline/handedness is not the same thing as an intrinsic cross-section twist field; no twist connection is specified. A spatial 3D coil extended through time is not silently identified with a genuinely 4D coil; the projection/extrusion map must be explicit.

## 4. Formal result and verification boundary

Created proof-only child PR [#2419](https://github.com/Satobloc/HsH/pull/2419), branch `research/calder-mechanism-separation-20261123t1036z`, stacked on the existing Lean infrastructure PR #262 by targeting `infra/lean4-verification-20261023`.

The module `FORMAL_VERIFICATION/HsHVerification/CalderMechanismSeparation.lean` formalizes:

- paired-order reconstruction of the even and odd components;
- uniqueness of those components when both orderings are observed;
- the fact that a single-order observation cannot identify the even/odd split;
- conditional non-injectivity of a scalar readout explicitly modeled as the sum of three channels.

The last theorem is conditional on an additive observation model. It does not assert that the physical response is additive, that the three source-described channels share units, or that their maps have been measured.

**Lean status at report preparation:** exact-head run #45159508269 was `IN_PROGRESS`; no successful compilation or final theorem-specific axiom audit is claimed until the completed run and logs are read. The source contains `#print axioms` commands for each theorem. Lean checks only the formalized conditional statements, not source translation, physical premises or empirical validity.

## 5. Test matrix, deliberately not instantiated

| Candidate | Controlled contrast | Observable required | Standard comparator | Failure condition |
|---|---|---|---|---|
| Kelvin-like / electrogravity response | Matched geometry, material and spin; vary constituent chirality only if independently measured; record charge separately | Predeclared field/circulation/vorticity readout with units and calibration | Maxwell + GR for charged rotating matter; conventional fluid/vortex dynamics where an ordinary fluid is actually present | No preregistered H(s)H residual on independent holdout, or residual absorbed by the standard model |
| Interbraid / temporal order | Matched `A→B` versus `B→A` sequences, randomized order and equal total exposure | Force, trajectory, timing or other source-authorized readout with complete time history | Standard mechanics/GR plus thermal, electromagnetic, mechanical and instrument-memory controls | Order-odd component absent within joint uncertainty or fully explained by standard memory |
| Material response | Measure rather than conflate modulus, damping, strain, temperature and energy loss | Material-response and environmental channels | Established continuum/material mechanics | Residual follows ordinary material response and supplies no independent H(s)H discriminator |
| Contact/interbraid event | Independently witnessed contact/collision versus matched noncontact condition | Event/trajectory/impulse record | Standard contact and collision mechanics | No source-bound contact event or no residual beyond the standard comparator |

For any future instantiation, calibrate on declared training runs, freeze all maps and nuisance parameters, and hold out complete independent acquisition units. Disjoint unit identifiers alone do not prove statistical independence. Propagate shared calibration, registration, timing, material and instrument covariance. No model may be retuned after holdout access.

No measured system, raw dataset, acquisition manifest, units, uncertainty budget or holdout was selected in this run. No physical calculation, fit, numerical prediction or falsification threshold was produced. The battery/centrifuge sketch remains a low-priority historical proposal, not a selected P2 system.

## 6. Campaign and tooling boundary

- P0 Code Grurple remains ACTIVE and Tern-owned.
- P1 cognition remains OVERDUE / NOT READY / FROZEN / Orson-owned.
- P2 November 30 remains HOLD. Issue #565 still has no selected real system; the Barckicke air-water vortex is a candidate only, with raw Figshare version/bytes, acquisition IDs, calibration/covariance and holdout access still unretrieved.
- P3 December 14 remains INCOMPLETE.
- FIE next full rereview is December 4; last full rereview November 20. The unrelated-reading break was completed November 21; neither was repeated.

Existing Math Hopper #578 and its extraction path, Lean infrastructure PR #262, Calder PR #2167, Whirligig Kernel0 and the available SciSpace connector were checked. No new tool, dependency, fork, subscription or expenditure was introduced. HSH_RESOURCES was limited to its root README/private-reference boundary; no private payload was opened.

No BEDROCK, SAT-O or Blockwave equation was changed. No theory, primitive, paper gate or P2 candidate was promoted.

## 7. Return position

**NOW:** the historical battery sketch is separated into Kelvin-like response, interbraid/temporal-order response and ordinary material elasticity. The conditional algebraic identifiability lemmas are in draft PR #2419; exact-head Lean verification is pending.

**NEXT:** obtain the completed Lean run and inspect its actual theorem-specific axiom output. For any physical test, first recover a source-authorized chirality/coarse-graining and worldtube-to-observable map, then identify a real measured system and independent acquisition package. Do not treat external charge as a chirality proxy without a validated map.

**STOP:** no battery apparatus build, no P2 selection, no physical calculation without measured inputs, no new contact surface/twist primitive, no BEDROCK promotion, and no task/scheduler mutation.

**RETURN:** [PR #2419](https://github.com/Satobloc/HsH/pull/2419), the source-authored historical battery note blob above, live BEDROCK ND-2026-10-22-02, and the current Primary Operational Guideline §2.1.
