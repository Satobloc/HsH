# Calder h1061:s3 | Force-to-observable admission gate

**Run key:** REVROT3-19-20261011:1061:s3  
**Nominal slot:** 2026-11-24T05:36Z  
**Ring:** Calder, index 7. Next label: Hale, index 8.  
**Disposition:** SOURCE-GROUNDED ASSISTANT REVIVAL; FORCE CHANNELS DECOMPOSED; BEC ANALOG ONLY; H(s)H PREDICTION NOT FORMED.

## 1. Substantive improvement

Three source claims that could otherwise be conflated are now kept separate:

1. **Electrogravity:** a proposed Kelvin-vortex / responsive-medium mechanism for electromagnetic and gravitational effects.
2. **Interbraid force:** proposed filament-on-filament interaction, including collisions, braid contact and trans-temporal tug.
3. **Parallel-force consistency:** the expectation that a three-filament structure proposed to produce QCD should have a corresponding parallel-force structure.

The 23Na BEC vortex-pairing experiment can at most be an analogue candidate for the Electrogravity medium-response channel. It does not test Interbraid force or the parallel-force consistency claim.

Reusable admission rule:

> A force claim is not an empirical prediction until a source-authorized, uncertainty-bearing composition maps its proposed geometry and dynamics to a registered observable.

This is a new prediction-architecture gate, not a new physical model.

## 2. Source custody and epistemic status

**Nathan Direct, July 11, 2026.** Original raw export:

Satobloc/SAT_THEORY_ARCHIVE_2023-25/DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.07.11•26.07.17•Reasoning with SAT-HSH Skill — raw.json

Blob: b7868607d89f66bbc0e638398182fb2d6b2da2ce.

- f8e3ca00-6348-43d3-9602-014002b9feed, 07:11:40.400Z: proposes a worldline “with thickness”, tube coils and Kelvin-vortex-like stirring in a BEC spacetime-fabric concept.
- c3f309e3-fc8d-4cca-98f7-4072c322e722, 12:54:18.441Z: states that if three filaments coil to produce QCD, a parallel structure should imply a parallel force.
- d27667d7-fd7f-4795-9263-a29fc16abed9, 13:10:39.082Z: distinguishes Electrogravity from Interbraid force.

These are direct proposals, not derived equations or independently validated physical claims.

The archived *Fundamental Intuitions, Extended* PDF (Git blob ba0af013da1681a070b4947def6499cedb403162) supplies the filament / time-surface conceptual foundation, but no quantitative BEC coupling or force law.

Live BEDROCK keeps the responsive-medium question open at OC-002. The November 3 incorporation-tier note treats the BEC example as a working hypothesis, not Tier 3 or Tier 4. The current methodology requires system-specific evidence and does not license universal information or predictive-continuity claims.

**Standard measured source:** Seo, Ko, Kim and Shin, “Observation of vortex-antivortex pairing in decaying 2D turbulence of a superfluid gas”, *Scientific Reports* 7, 4587 (2017), DOI 10.1038/s41598-017-04122-9: https://doi.org/10.1038/s41598-017-04122-9.

This is an actual 23Na atomic condensate, not an observed spacetime vacuum.

## 3. Source-defined measurement chain

The paper defines the Bragg resonance using ε = q²/(2m) + q·v, q = 2ħkL x̂′ and ε = ħδ. For a positive vortex it gives δd = −(2ħkL/m)y′/r². These are source equations, not new calculations.

Its sign readout uses the Bragg signal SB = n+ − n− and the local derivative response. For small dipoles whose Bragg signal is absent, the paper uses the crescent shape of merged density-depleted cores. It then constructs a signed vortex catalog and derives dipole, cluster and nearest-neighbour statistics.

Reported source values include:
- Trap frequencies 2π × (4.3, 3.5, 350) Hz; atom number 4.0(3) × 10^6; condensate fraction 80%.
- Thomas-Fermi radii (155, 190, 1.9) μm; BEC healing length ξ ≈ 0.6 μm; Rz/ξ ≈ 3.
- Approximately 20 vortices at T/Tc ≈ 0.5 and R/ξ ≈ 290.
- C2 ≈ 0.4, Nd/Nv ≈ 0.45 and Nc/Nv ≈ 0.2.
- A random sign configuration has C2 = 0.5.

C2 averages same-sign indicators over each vortex’s two nearest neighbours. The random C2 = 0.5 benchmark is not the complete standard dynamical comparator. The paper’s 20 random configurations are used for the dipole-moment and dipole/cluster comparison panels, not as a full GP time-evolution model.

The paper says each plotted point uses 15–20 measurements of the same experiment and reports SEM. That does not establish independent preparation units. The paper also notes incomplete quantitative understanding of finite-temperature dissipation.

Data are available from the corresponding author on reasonable request. Raw images, per-shot catalogs, preparation IDs, full covariance and classifier-confidence records were not retrieved. No fit or physical calculation was performed.

## 4. Explicit map contract

For an Electrogravity/BEC analogue, the required composition is:

**H(s)H geometry → BEC medium forcing → BEC state / vortex field → Bragg signal → signed vortex catalog → registered statistics.**

| Map | Domain to codomain | Status |
|---|---|---|
| G1 | Worldtube / coil geometry to BEC-medium forcing or constitutive coupling | **MISSING** |
| G2 | BEC forcing to condensate state and vortex dynamics | Standard BEC model family exists; no H(s)H-specific modification is defined |
| G3 | Vortex velocity to Bragg response | Source-defined |
| G4 | Bragg / condensate images to signed vortex catalog | Source-defined procedure; calibration uncertainty incomplete |
| G5 | Signed catalog to δp², C2, dipole moment and dipole/cluster fractions | Source-defined |

Because G1 is missing, G5∘G4∘G3∘G2∘G1 cannot produce an H(s)H prediction. Interbraid requires a separate filament-contact-to-force map and a separate measured observable. The parallel-force statement has no force law, state variable, scale, time dependence or observable. It remains a consistency expectation, not a falsifiable prediction.

## 5. Test matrix

| Track | Hypothesis | Shared parameters | Calibration / holdout | Observable | Comparator | Falsification |
|---|---|---|---|---|---|---|
| H0-BEC | Conventional 2D BEC vortex dynamics | Atom number, trap, T/Tc, ξ, stirring, damping, Bragg and imaging calibration | Calibrate sign classifier on trajectory-known dipoles; hold out whole independent preparations | Joint vector (δp², C2, Nd/Nv, Nc/Nv, d/R) | Standard 2D quantum-turbulence / GP-based model family plus conditional random-sign null preserving each shot’s positions and N+/N− | Pre-register predictive region; numeric threshold awaits raw data and uncertainty structure |
| H1-EG-BEC | H(s)H adds worldtube/coil-mediated BEC response | Same nuisance parameters as H0, plus a source-defined coupling only after one exists | Same calibration and whole-preparation holdout; freeze map and parameters before holdout | Same joint vector, with a distinct predicted change required | H0 under identical calibration | **PREDICTION_NOT_FORMED:** G1 and the coupling law are absent |
| H2-IB | Interbraid force | Not specified | No mapped calibration system | No source-authorized BEC observable | No matched BEC comparator | Not tested by this experiment |
| H3-PF | Parallel-force consistency | No force law or scale | No calibration / holdout system | No observable specified | No comparator specified | Consistency expectation only |
| H0-REP | Representation-only H(s)H | Same as H0 | Same data and measurement map | Identical to H0 | H0 | Not empirically distinguishable here |

**Minimum data contract:** raw condensate and Bragg images; per-vortex position, sign, sign-source and confidence; hold time; preparation and shot IDs; Nv, N+, N−; trap, temperature and instrument metadata; calibration and uncertainty records.

Calibrate Bragg-derivative and crescent-morphology sign assignments separately, stratified by pair separation and signal strength. Use the complete independently prepared configuration as the resampling unit, not vortices or nearest-neighbour edges. Freeze shared nuisance parameters and classifier rules on calibration data. Propagate classifier, instrument and between-preparation uncertainty into the joint observable vector. Do not treat C2, dipole fraction and cluster fraction as independent confirmations because they share the same signed catalog.

A standard-model failure would not by itself validate H(s)H. H(s)H needs its own frozen, distinct holdout prediction.

## 6. Geometry: forced versus optional

| Feature | Source status | BEC implication |
|---|---|---|
| Finite worldtube thickness | Direct July 11 proposal, but no profile, radius, normal bundle or constitutive law | Not measured. BEC healing length ξ is not worldtube thickness |
| Coil / twist | Tube coils proposed; FIE discusses coil/twist-locking as a possible mechanism, but no independent twist field or map is specified | Not measured; optional |
| Contact surface | “Braid contact” proposed for Interbraid, but no surface, boundary condition or contact law defined | Not tested; optional |
| Timesheet / responsive medium | Live H(s)H working hypothesis; OC-002 remains open | A laboratory BEC is a real medium, but no map equates it with the proposed spacetime fabric |

None of thickness, twist or contact surfaces is forced by the 23Na data. Thickness is a direct representational proposal, while twist and contact surfaces remain optional, underdefined hypotheses.

## 7. Formalization decision

**Lean was not run.** The H(s)H geometry-to-medium map is absent, so there is no source-authorized forward map to formalize. A generic proof about identical observable maps would be data-free and would not establish the missing physical correspondence. No such formalization was attempted without specific permission.

This is not a theorem pass, counterexample search, physical calculation or observational validation.

## 8. Mersearch and repository boundaries

Mersearch-first was checked, but no callable Mersearch action was available. All four canonical request lanes remain occupied with status requested:
- Lane 1: calder-angle-geometry-source-fidelity-20261102-1337.
- Lane 2: perceptual-nexus-early-archive-20261120-01, with a run manifest and compact receipt but raw SEARCH_RESULTS withheld. Its receipt warns that ranking is a lexical navigation heuristic, not semantic ranking or source authority.
- Lane 3: calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001.
- Lane 4: kestrel-finite-core-geometry-source-fidelity-20261102-2200.

No lane was overwritten, retriggered or replaced. The July 11 original was retrieved from the public SAT archive’s immutable raw export and the 2017 article was read directly. This is a bounded fallback, not an exhaustive Mersearch result. SciSpace is available but was not needed for this primary-source check. No new tool, dependency, fork, subscription or expenditure; no HSH_RESOURCES private payload opened.

## 9. Workflow and campaign status

- Preflight branch: main c8d2b81af7f259950a80bdeeb0fe32fae8584fa1; generated-discovery commit parent ed920fb3c27ba06aaf94fa8f89c0775f1b80662b. The 31 MB payload was not re-parsed this run, so currentness is supported by commit chain only. Record-safety remains FAIL in the latest fully parsed snapshot.
- Task graph: 18 records versus declared branch_count 16; 5 completed, 12 active, 1 blocked; 17 reachable; one blocked/unreachable record; no cycles or dangling references.
- P0 issue #1747 remains active. Mercer and Aster recorded separate stale-fallback eligibility findings. PR #2009 remains open, draft and unmerged. Tern retains P0 release authority and Meridian implementation ownership. No code or queue mutation.
- Tern h1058:s4 remains the last PWH deep review. The routine five-verified-activation count is not established by receipts alone. The new P0 visual-fallback finding is available for Tern’s material-trigger decision; no duplicate deep review was performed.
- P1 remains overdue, frozen and Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains incomplete.
- The global PWH queue supersedes Calder’s older local FIE date: last full FIE review November 20, next December 4. No FIE re-review was due and no review cursor was advanced. Unrelated-source break last completed November 21; next due November 28.

## 10. Revival, continuity and scheduler

The deterministic ring selected Calder, but no authenticated current empirical-Calder thread or separately signed Nathan-authored specialist charter was established. The historical role is reconstructed from the September 12 Common Check-in: empirical angle-clustering, statistical calibration, null design, independent-unit discipline and source criticism. This is assistant-level source-grounded revival, not literal historical-worker continuity.

The existing :36 Worldtube task ID remains 6a9f52b69ec08191b0a2ba24a074f781. Its schedule remains hourly at minute :36, America/New_York, with DTSTART 2026-10-01 14:36 and the Worldtube phase. No task, ID, prompt, phase, cadence, enabled-state or sixth-task mutation. The automation get/peek connector action was unavailable, so no fresh direct scheduler readback is claimed; the current run context and live roster identify the existing task.

**Next ring label:** Hale. The :48 slot had already reached its scheduled start by the time this run was processed. Any successor packet is therefore POSTSTART_OPTIONAL_CONTEXT_ONLY. No direct-thread delivery, consumption, acknowledgment, assignment or response obligation is claimed.

## 11. Return position

**NOW:** Electrogravity, Interbraid and parallel-force claims are separated. The BEC candidate has a source-to-observable map contract and test matrix. The missing H(s)H geometry-to-medium map is the blocker.

**NEXT:** Obtain the source data through an authorized route; establish preparation/shot identity and classifier calibration; define a source-authorized Electrogravity coupling before forming a prediction. Keep Interbraid and parallel-force work on separate system/observable tracks.

**STOP:** No physical inference, data-free calculation, Lean proof, H(s)H theory promotion, PR merge, P0 intervention, worker reassignment or scheduler change.
