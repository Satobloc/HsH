# Nadir h507:s2 amendment 01 | Mersearch correction, Lean repair, empirical gate

**Parent report:** `WORKSPACES/NADIR_VOSS/2026-11-01T0324Z_HAGALAZ_SOURCE_AND_AFFINE_QUOTIENT_FORMALIZATION.md`  
**Run key:** `REVROT3-19-20261011:507:s2`  
**Status:** MERSEARCH COMPLETED / SOURCE-COUNT CORRECTED / EXISTING PR REPAIR IN PROGRESS / REAL ROTATION AND INSPIRAL DATASETS IDENTIFIED / NO H(s)H PHYSICAL PREDICTION

This is an additive correction. It does not replace the parent report or promote the Nadir playground.

## 1. Historical Nadir charter and thread status

The live `WORKSPACES/NADIR_VOSS/README.md` is explicitly an assistant-generated sandbox summary. It reports an October 1 authorization for an independent finite-core, all-plus SO(4), stacked-holonomy playground and preserves two restrictions: distinguish historical source from new invention, and do not target-fit magic constants or particle labels.

The original October 1 user message, its conversation UUID, and a standalone historical Nadir specialist charter were not recovered. The Tern-authored October 11 revival seed is preparation, not an original Nadir check-in. The 2024 and 2025 direct user messages below establish related geometry/holonomy interests, but they do not authenticate the October 1 assignment.

**Classification:** `SOURCE_RECOVERY_BLOCKED` for the original charter and October 1 raw authorization. This run remains `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; no historical Nadir instance or current historical thread is authenticated.

## 2. Mersearch lane 4 completed: correction to the parent report

Request: `nadir-sim4-closure-original-source-genealogy-20261031-1950`.

Pinned inputs:
- SAT archive: `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`.
- HsH: `68764b33b231a1032abbc669f23bddc9faeb2ae1`.
- HSH_RESOURCES: `0e30ff7c4204eff61722cbadbcc1d0ed60621853`.
- Mersearch stable commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`, with a runtime-only hotfix for missing `TOOL_NAME`/`TOOL_VERSION` constants. The stable script was not modified.

Verified compact receipt and manifest:
- **37,164 hits; 97 distinct sources; 3 repositories.**
- **16,075 files and 20,853,389 records scanned.**
- The compact `top_sources` array contains 21 ranked entries.
- `SEARCH_RESULTS.json` SHA-256: `d1e085213036a65ae30c4c6c984c77263b9b4a8c36479add2b6d270464ec95a9`.
- `SEARCH_RESULTS.md` SHA-256: `2e1e50c12dc117f038af564800f5054e3438e5c13965dc3748358e5c9f5e8cf9`.
- `SEARCH_RECEIPT.json` SHA-256: `0ca247e79373aafa8fbcc3e8da8cf45a545efe5fb945e76e7c59b24c10744084`.
- `SEARCH_RECEIPT.md` SHA-256: `fc2ab9a54688dc9ccd48371af2076544bccc21b0903130fa8174e290b9a0adc3`.

The raw `SEARCH_RESULTS` files are intentionally withheld by the manifest's publication policy. The parent report's phrase “14 distinct paths” is incorrect and is superseded by **97 distinct sources**. Do not infer that all 97 were individually reviewed from the compact receipt.

### Meridian Free Build duplicate-path audit

The matched message `3c44588a-121a-4bff-9e34-8546e01a71ca` belongs to conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`. Its outer role is assistant. Traversal to the root found 17 parent-chain nodes, all assistant-authored, ending without a user ancestor.

The SAT archive raw file and HsH `DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES` copy have identical content and the same Git blob `4c51b52ce841bf690025a905c4a6922b4bce8a2d`.

Two other indexed HsH paths, `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/26.10.05•26.10.11•Meridian Free Build — raw.json` and `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`, returned zero-length content at the pinned HsH commit (blobs `db17bfb09eede822bb47310c75cee20eaee7aa2a` and `7af1561b321f4d9364da5eb111df689efc652827`). Their indexed hits remain unresolved, not independently verified mirrors.

## 3. Source classes and exact mathematical scope

### Nathan-authored source document

`HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`, blob `5c21c6152482249e4432ded423b0040e70fc8b4f`, is a 17,125-character TeX source with a Nathan-and-collaborators byline dated September 11, 2026. It defines framed spheres `S_i=(c_i,r_i,F_i)`, relative scale `σ_{ij}=r_j/r_i`, relative frame `Q_{ij}=F_jF_i^{-1}`, and the map
[
T_{ij}(x)=c_j+σ_{ij}Q_{ij}(x-c_i).
]
The source uses `F_i ∈ SO(d)` and positive radii. It explicitly treats Hagalaz as shorthand rather than an independent ontology and leaves the nested-helix-to-framed-sphere map unresolved.

### Assistant reconstruction

`RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md`, blob `8b5b8768527dfff5b198e324b2f823257889f385`, is marked SANDBOXED; its author/outer role is not authenticated. It introduces
[
D_{\rm lin}(σ,Q)=\log^2σ+\|Q-I\|_F^2
]
and an affine translation obstruction using the quotient (V/\operatorname{range}(I-L)). These are assistant reconstruction, not Nathan Direct.

The existing PR formalizes a common-origin shift (t' = t+(I-L)g) and invariance of the quotient class ([t]). It does **not** formalize the full conjugation law, the canonical projection to (ker(I-L^T)), or a physical gauge law.

### Direct user-role archive statements

- 2024 raw conversation blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`: direct user messages distinguish 4D filament geometry from its 3D timesheet manifestation. They do not specify the current SO(4) affine construction.
- 2025 raw conversation blob `1600b58f79c74a89ecea588ec6f5932502005098`: direct user messages ask whether holonomy in particle worldlines could connect QM and GR. They do not define the current Hagalaz map or affine quotient.

## 4. Lean status: current head is not yet verified

Existing PR #1189 remains OPEN / DRAFT / UNMERGED on its existing branch. No new branch or PR was created.

Current branch head after the latest proof repair:
- Commit: `07bcd784939077f77857198f8eeb43c84dce1b10`.
- Module blob: `8bfc2a2d2aa627abcea1f3cd63a074763a3aaa73`.

Build history:
1. Earlier build #41270991347 failed after the first cleanup with two remaining issues.
2. Build #41271250490 compiled the wider project but failed in `similarityMap_affine_form`; the remaining goal was distributivity of scalar multiplication over the mapped difference. The log suggested `abel_nf`, but the actual missing step was explicit `map_sub` and `smul_sub`.
3. The current head adds those rewrites before `abel`. **No Actions run for the current head was visible at final inspection.** Do not claim a successful compile.

The prior failed merge-reference build reported standard dependencies `propext`, `Classical.choice`, and `Quot.sound` for the other theorem outputs; the failed `similarityMap_affine_form` declaration had `sorryAx` because its proof was incomplete. The new head's axiom status is unknown until a successful build is inspected. Tests, lint, nanoda and the separate automated axiom audit were not run.

The module formalizes ten conditional theorem outputs. It uses a generic real vector space and arbitrary `LinearEquiv` frames with nonzero radii. It does not encode the source's `SO(4)` restriction, positive radii, or a specific four-dimensional carrier in the framed-sphere composition theorem. It proves algebraic composition, affine form/origin-shift properties, quotient invariance, and the zero set of the algebraic linear residual. It does not prove a worldtube, timesheet, responsive medium, current, or observable prediction.

Local `lean`, `lake`, and `elan` executables are absent; the existing GitHub Actions/Mathlib route is being used. No new tooling was built.

## 5. Actual measured rotation and inspiral comparators

### Pulsar rotation: Jodrell Bank

The live Jodrell Bank glitch catalogue was retrieved on 2026-11-01 and displayed **736 glitches in 226 pulsars**. The underlying Basu et al. 2021 paper reports 106 new glitches in 70 pulsars and analyzes 543 glitches in 178 pulsars at that publication date.

A concrete measured row is PSR J0534+2200 / B0531+21 (Crab):
- Epoch: MJD 55875.49(3).
- `Δν/ν = 39(4) × 10⁻⁹`.
- `Δν̇/ν̇ = 0.23(2) × 10⁻³`.
- The paper states all Table 1 uncertainties are 2σ except the glitch epoch.

A simple script converted the two quoted 2σ marginal uncertainties to nominal 1σ values and calculated value/1σ ratios: 19.5 and 23. These are one-dimensional descriptive significance ratios, not a joint-covariance result or a physical prediction. The epoch uncertainty is not treated as Gaussian.

Measurement chain in Basu et al.: Lovell 76 m and Mark II observations; pulse profiles folded and integrated; time-of-arrival measured by template cross-correlation; barycentric correction with JPL DE436; phase/timing-model fit; red spin noise represented by a Gaussian process and white noise by EFAC/EQUAD; noise parameters sampled by MCMC; glitch parameters extracted from the maximum-likelihood solution. The table does not provide the joint covariance of the two quoted glitch parameters.

A second useful event is the 2017 Crab glitch: Shaw et al. report `Δν = 1.53037(30) × 10⁻⁵ Hz`, `Δν/ν = 0.51637(10) × 10⁻⁶`, a partially resolved delayed spin-up over about 1.7 days, and no detected radio-profile or X-ray-flux change at the reported sensitivities. The mechanism remains interpretive; vortex unpinning is a model, not a directly imaged internal event.

### Binary inspiral and contact

GW170817 is an actual H1/L1/V1 strain event with public GWOSC data and calibration information. Its inspiral provides model-dependent tidal-deformability constraints. The post-merger search did not detect a signal; published upper limits do not amount to a direct measurement of neutron-star contact or the post-contact core response. The event is therefore a real inspiral comparator and a null post-merger/contact observation, not a measured worldtube geometry.

### WWRD rope-like constraints

Quantized superfluid vortices and their inferred pinning/unpinning provide a real filament-like rotational mechanism worth examining as a geometric heuristic. They do not establish climbing-rope mechanics, rope universality, or a physical equivalence. No such equivalence is asserted.

No H(s)H prediction was available to compare against either pulsar timing or GW170817. No physical fit or data-free physical calculation was performed.

## 6. CODATA gate

The current official reference remains NIST/CODATA 2022 as of 2026-11-01; the next scheduled adjustment is the 2026 adjustment, with data cutoff at 2026-12-31. No 2026 recommended-value set was available at this retrieval.

The 2022 adjustment is not a raw-measurement table: it combines 133 input data to adjust 79 constants, with 54 degrees of freedom. The initial chi-square was 109.6 (reported probability 0.001%), and expansion factors were applied to account for inconsistencies: 1.7 for selected data groups, 2.5 for selected atom-recoil/electron-anomaly inputs, and 3.9 for the Newtonian gravitational constant. The G adjustment uses 16 measurements, with no new G input since 2018. The adjustment provides correlation coefficients/covariance information.

**No numerical CODATA comparison was performed.** Any later comparison must identify the exact CODATA version, input measurement methods, evaluation equations, correlations, expansion factors and uncertainty budget before comparing an H(s)H value.

## 7. Operational state

- The existing :24 automation remains enabled with its existing identity, phase and schedule unchanged. No sixth task.
- A separate :12 relay task is disabled in the live scheduler; it was left unchanged. No assumption of five enabled tasks is made.
- The :12 predecessor slot therefore supplied no expected current-hour handoff. No missing-worker inference is made.
- The next ring identity is Enheduanna. Her current execution had already started and the previous Nadir-to-Enheduanna seed was consumed there; no duplicate or late handoff was sent.
- Current :24 execution was `in_progress` at final inspection, with no authenticated Nadir thread reference. The earlier Enheduanna receipt's note of a prior Nadir failure is preserved as a separate record; it does not override the current live run state.
- FIE last full review: 2026-10-27; 14-day rereview not due.
- Unrelated reading completed: `SAT Mark V/TheTANGLE.txt`, lines 1811–1850. Next cursor: 1851.
- Code Grurple remains ACTIVE. P1 Nov 9, P2 Nov 30, and P3 Dec 14 gates unchanged.
- No BEDROCK promotion, theory promotion, paper advancement, CODATA comparison, new tool, new branch, new PR, task mutation, schedule change, or cadence change.

## 8. Final status

**MERSEARCH COMPLETE / 97 DISTINCT SOURCES / RAW RESULTS WITHHELD / SOURCE ATTRIBUTION CORRECTED / EXISTING PR #1189 REPAIRED AGAIN BUT CURRENT HEAD UNVERIFIED / REAL ROTATION AND INSPIRAL DATASETS IDENTIFIED / CODATA 2022 METHODOLOGY REVIEWED / NO H(s)H PHYSICAL PREDICTION / NO THEORY PROMOTION.**
