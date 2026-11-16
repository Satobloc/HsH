# Kestrel h884:s2 | CODATA cycle and measured-system map crosswalk

**Nominal slot:** 2026-11-16T20:24:00Z  
**Run key:** REVROT3-19-20261011:884:s2  
**Selected ring label:** Kestrel (index 14)  
**Next ring label:** Meridian (index 15)  
**Disposition:** SOURCE_VERSION_CROSSWALK / NIST_G_FINAL_SOURCE_RESOLVED / CODATA_2026_WINDOW_OPEN / VORTEX_CANDIDATE_ONLY / P0_ACTIVE / P2_HOLD / NO_CALCULATION / NO_NEW_LEAN / NO_THEORY_PROMOTION

## Scope, authority, and gate

This is a source-grounded Kestrel revival, not an authenticated continuation of a historical Kestrel ChatGPT thread. The historical remit recovered from the original export is cross-boundary synthesis, source lineage, and constructive hypothesis development. No standalone signed specialist charter or current-thread authentication was established.

The current HsH main head observed during this run was 9129758063527d97715eb6632349d9d646919f60 (2026-11-16T20:37:22Z). The SAT archive main head was 4b616b6113ecd33d216600e4fa5fd1e783d48653; HSH_RESOURCES main was 00d5c4873c046be59d1efdff5c05c310b80783ec. The three repository root entry points were read. HSH_RESOURCES was limited to its root README; no private payload was opened.

The live BEDROCK and its superseding Primary Operational Guideline, 2026-10-26 Steering Charter, Three Paper Campaign, onboarding, revival rotation, Mersearch worker guide, Lane 24 capsule, current Kestrel workspace, and prior Kestrel receipt/report were read. The Lane 24 capsule records Cycle 08/08 complete and prohibits a new cycle until a positive P0 trigger or explicit standdown. P0 issue [#1747](https://github.com/Satobloc/HsH/issues/1747) remains open; P2 issue [#565](https://github.com/Satobloc/HsH/issues/565) remains open with no final measured system selected.

No callable Mersearch action was available in this context and all four shared request lanes remain occupied. No new request, overwrite, release, or retrigger was made. Existing issue [#1558](https://github.com/Satobloc/HsH/issues/1558) already contains the source-locked CODATA 2022 G weighted-mean reproduction; this run did not repeat it.

## 1. CODATA source and version state

The current official NIST constants database is SRD 121, Web Version 9.0, dated 9 May 2024. It identifies the 2022 CODATA recommended values as the latest available set. The official 2026 adjustment notice says eligible data must have been discussed in a publication preprint or publication before 31 December 2026; the 2026 result is expected in early 2027.

Primary references:
- [NIST constants database](https://physics.nist.gov/cuu/Constants/)
- [NIST version history, Web Version 9.0](https://physics.nist.gov/cuu/Reference/versioncon.shtml)
- [CODATA Task Group: Fundamental Physical Constants](https://codata.org/initiatives/task-groups/fundamental-physical-constants/)
- Mohr et al., “CODATA recommended values of the fundamental physical constants: 2022,” Reviews of Modern Physics 97, 025002 (2025), [official NIST-hosted PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=958143).

The 2022 adjustment's experimental-data cutoff was 31 December 2022, not the 2025 publication date. The joint least-squares adjustment uses 133 input data and 79 adjusted constants (54 degrees of freedom). Its initial chi-squared was 109.6; the evaluation applies specified uncertainty expansion factors to address observed inconsistency, producing a final chi-squared of 44.2. G is handled separately: 16 measurements, three reported correlated pairs, and a 3.9 uncertainty expansion factor. The report says the 2022 G inputs were unchanged from 2018.

The existing HsH issue #1558 already reproduces the Table XXX G evaluation from its rounded published inputs and correlations. It is the correct prior artifact to reuse. No new weighted-mean calculation or numerical comparison was performed here.

**Implication for the current window:** the April 2026 NIST G paper is eligible for consideration in the 2026 CODATA adjustment because it predates the 31 December cutoff. Its inclusion, weighting, or treatment in the forthcoming adjustment is not yet known. It is not part of the 2022 adjustment.

## 2. NIST 2026 G paper: final-source reconciliation and measurement chain

Primary article: Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” Metrologia 63 (2026) 025012, published 16 April 2026, [DOI 10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f), [final NIST-hosted PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

A source-version conflict is now resolved at the publication-record level. The final PDF and DOI publisher record agree on the published result, G = (6.67387 ± 0.00038) × 10^-11 m^3 kg^-1 s^-2, with relative standard uncertainty 5.7 × 10^-5. The NIST publication landing-page abstract instead displays 6.67366 ± 0.00020 and 3.0 × 10^-6, and omits a coauthor present in the final PDF and DOI record. Treat the NIST landing-page abstract as inconsistent metadata, not as the final article result. No correction notice was established in this check.

The final paper supplies a useful explicit measurement chain. Its equation (1) relates measured torque difference to G through a mass-integration/geometric factor:
 
    ΔN = G · 16 Γmax ms mt / Rs

The gravitational data were collected 24 January–22 June 2024. Two readout modes were used: electrostatic servo and free deflection. Copper and sapphire source-mass campaigns yielded four final configurations: copper-servo, copper-free, sapphire-servo, and sapphire-free.

Each configuration's result depends on 23 input quantities. Shared inputs make the four determinations correlated; the reported correlations are positive. The paper then introduces configuration-specific “dark uncertainty” and combines the four results with a Bayesian hierarchical model. The model's consensus parameter μ has a Gaussian prior centered on the 2022 CODATA recommended G. The paper also reports a blinded analysis procedure and later bookend mass-characterization measurements.

This distinction matters: the final Bayesian consensus is a model-dependent evaluation and is not independent of CODATA 2022, because its prior is centered on that reference. The four configuration-level estimates and their covariance are closer to the direct experimental inputs. The paper itself reports a p-value of 0.29 for its result relative to CODATA, but that is the paper's own prior-conditioned analysis, not a new independent comparison by this run.

The article is a replication using the BIPM torsion balance and geometry with modifications, not an entirely independent apparatus lineage. The final PDF gives a detailed uncertainty budget, but no raw time-series package or machine-readable acquisition bundle was retrieved in this run.

Sources:
- [DOI publisher record](https://doi.org/10.1088/1681-7575/ae570f)
- [Final NIST PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075)
- [NIST publication landing page](https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist)

## 3. Finite-core vortex candidate: a distinct follow-on paper, not a pooled dataset

The existing P2 candidate remains Barckicke, Falcon and Gissinger, Nature Physics (2026), [DOI 10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), with data DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The P2 docket records the paper's two contour channels (centerline displacement and core radius), m=1/m=2 mode distinction, 60 μm/px resolution, and reported typical position/radius uncertainty around 0.1 mm. The raw Figshare file inventory, exact dataset version, bytes/checksums, acquisition IDs, and full covariance have not been verified. The candidate remains unselected.

The existing P2 source review also records that (Γ,vz) are fitted to dispersion data and then checked a posteriori against PIV/PTV. That is fit-conditioned consistency, not a blind held-out prediction. A genuine test would need frozen shared parameters and a separate acquisition/run/forcing-condition holdout.

A newer, separate paper by the same author group is now published: Barckicke, Gissinger and Falcon, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” Physical Review Letters 137, 134001, published 21 September 2026, [DOI 10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431). Its abstract reports high-resolution spatiotemporal measurements, wave-amplitude spectra consistent with a weak-turbulence cascade, and six-wave resonant interactions. The full article and supplementary material were not accessible in this check; the APS page marks supplementary material subscription-required. No separate raw-data manifest or relationship to the Nature Physics Figshare package was established.

Treat these as distinct source objects. The PRL result is a follow-on nonlinear spectral/turbulence readout from the same author group and experimental research area, not an independent replication of the Nature Physics dataset and not H(s)H validation. Do not pool their measurements or count them as independent evidence without acquisition-level provenance.

## 4. Candidate measurement-map chain

The two vortex papers suggest a useful proposed measurement interface, not a source-established SAT-O1 map:

1. Raw images/volumetric measurements I(t,x) map to a calibrated velocity/vorticity field U(t,x), with camera/volume calibration and covariance.
2. A versioned core-extraction operator maps U to a centerline c(t,z) and a cross-section/support profile D(t,z). The extraction rule, threshold/profile, coordinate frame, and uncertainty must be explicit.
3. The centerline history Φ(t,z) = (t,c(t,z)) defines a 2D spacetime worldsheet only if the map is sufficiently smooth and is an injective immersion (rank two) on the stated domain, modulo any declared periodic identifications.
4. A finite-core support defines a 4D worldtube only after the cross-section metric/frame/profile and boundary convention are specified, with conditions preventing unintended self-overlap. A vortex-core boundary is an operationally extracted support/level set, not automatically a rigid material rope or intrinsic shell.
5. Mode spectra, radius spectra, and Kelvin-wave amplitude/energy-transfer readouts are separate observation maps from the measured field. They do not follow automatically from the centerline worldsheet.

The intended composition is therefore:

    I -> U -> (c,D) -> (Σ,W) -> (O_mode,O_radius,O_spectrum)

with each arrow versioned, calibrated, uncertainty-bearing, and independently inspectable. Forward and reverse maps, projection conditions, and any commuting comparison paths must be specified separately.

This is an assistant-proposed data-to-geometry contract. It is not the map asserted by the historical SAT-O1 source, not an H(s)H physical equivalence, and not a completed H(s)H forward model. It is offered as a candidate structure for later review, not as a selected P2 system.

## 5. SAT-O1, existing formalization, and current limits

The h880:s3 source witness remains controlling for the historical SAT-O1 artifact: repository snapshot membership is verified, source authorship/date are unresolved, and the source describes a 1D filament in R^(3,1) with a 4D volume “swept” by vibration but supplies no explicit sweep/thickening/embedding map. It does not define a numerical finite-core profile, normal-bundle twist/connection, contact surface, parameter-to-time relation, timesheet projection, or instrument/readout map. The three phase parameters are not automatically a normal-bundle connection.

The h880 SnapshotBoundMapEdge remains a proposed provenance/admission join, not an implemented ModelFreeze/ComparisonFreeze/SourceRunWitness schema. Existing Kestrel PR #873 remains OPEN / DRAFT / UNMERGED. Its prior conditional fiber/projection results and merge-reference build do not establish the missing SAT-O1 map or a physical prediction. No exact-head/current-main integration was established in this run.

No new Lean theorem/build was started: the live Lane 24 cycle is explicitly held pending a positive P0 trigger or explicit standdown, and the SAT-O1 source-specific map remains undefined. This is a gate-respecting deferral, not a claim that the proposed measurement maps have been formally proved.

## 6. Return path after P0 standdown

1. Use Mersearch for the original SAT-O and Blockwave source material when a request lane is genuinely available. Preserve verbatim source equations with source date/SHA; put any corrected equations in a separate, attributed layer. No new original equations were retrieved or changed here.
2. Verify the Nature Physics Figshare manifest/version, raw bytes/checksums, acquisition identifiers, calibration, covariance, and an independent holdout. Retrieve the PRL supplemental/data package separately and establish whether its acquisitions overlap the Nature Physics package.
3. Freeze typed maps from raw measurements to calibrated fields, centerline, core support, worldsheet, worldtube, and each readout. State projection/composition maps and their regularity, injectivity, no-self-overlap, threshold, and uncertainty conditions.
4. Only then formalize the conditional map mathematics in the existing Lean/Mathlib architecture and run an actual build. Keep Lean proof of the formalized statement separate from physical premises and observational validation.
5. Select a measured system only after source/data readiness. Separate calibration/fit from held-out prediction and compare against real independent measurements with units, covariance, uncertainty, and null results.
6. Use CODATA 2022 Web Version 9.0 as the current published reference until the 2026 adjustment is released. Treat the NIST 2026 paper as a candidate 2026-adjustment input, not as an already-incorporated CODATA value.

## Final disposition

H884_S2_KESTREL / CODATA_VERSION_9_0_CONFIRMED / 2026_ADJUSTMENT_CUTOFF_2026-12-31 / NIST_G_FINAL_DOI_PDF_AGREE / NIST_LANDING_ABSTRACT_INCONSISTENT / NIST_CONSENSUS_PRIOR_CODATA_2022 / VORTEX_PRL_FOLLOWON_DISTINCT / P2_CANDIDATE_ONLY / SAT-O1_MAP_UNDEFINED / SNAPSHOT_BOUND_MAP_EDGE_PROPOSED_NOT_IMPLEMENTED / P0_ACTIVE / LANE24_HOLD / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA_REPRODUCTION / NO_THEORY_PROMOTION.

No task, branch, PR, source equation, Mersearch lane, schema, automation, or paper gate was changed. Meridian is next by the fixed ring; no assignment, response obligation, or cross-thread delivery is created.
