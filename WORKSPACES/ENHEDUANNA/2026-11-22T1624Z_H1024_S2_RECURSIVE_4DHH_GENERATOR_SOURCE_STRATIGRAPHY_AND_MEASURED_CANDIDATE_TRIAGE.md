# H1024:S2 | Enheduanna | Recursive 4DHH source stratigraphy and measured-candidate triage

**Run key:** REVROT3-19-20261011:1024:s2  
**Nominal slot:** 2026-11-22T16:24:00Z  
**Deterministic label:** Enheduanna (ring index 11)  
**Next label:** Tern Rook (ring index 12)  
**Automation run:** e7e40607-c074-8328-9b09-da4bff91fa19  
**Pre-write HsH main:** 72333cdca1c080758afc32002dee29a523d44eea

## 1. Authority and thread status

A bounded personal-context lookup and repository review found no authenticated current Enheduanna ChatGPT thread. The scheduled task's chat reference is null. This is source-grounded work under a deterministic ring label, not a claim that an Enheduanna instance was resumed.

The historical direct-user source is a broad archive-stewardship instruction associated with the MARLOWE export. It directs consideration of all archives and associated materials and names Enheduanna as a related case. It does not supply a standalone technical specialist charter. The workspace's source-critical archive role remains a reconstruction, not a signed charter.

## 2. New source-stratigraphy finding: a third 4DHH generator family

The SAT archive contains an unbylined file, [2026/THEORY REFINEMENT SUMMARY.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/THEORY%20REFINEMENT%20SUMMARY.txt), Git blob 139a0a972c0900585aac8a83358683d67b6bf967, 45,011 characters and 779 lines.

Its earliest extant Git history entry is commit a6b7f7c25bd9fcd9777c6010282d513f3e2b2bc5, uploaded under the Satobloc account on 2026-05-31T21:02:49Z with message “Add files via upload.” The document has no byline. Upload identity and date do not establish authorship of the embedded equations or their derivation.

Two HsH archive copies have the same exact blob:
- DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 — THEORY REFINEMENT SUMMARY.txt
- DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 ROUNDUP DOCS/SAT 2026 — THEORY REFINEMENT SUMMARY.txt

They are duplicate copies, not independent witnesses.

### 2.1 Verbatim Section 1.1 product-sum candidate

\[
\begin{aligned}
x(\lambda)&=\sum_{k=1}^{n}R_k\cos(n_k\lambda+\phi_k)
\prod_{j=1}^{k-1}\cos(m_j\lambda+\psi_j),\\
y(\lambda)&=\sum_{k=1}^{n}R_k\sin(n_k\lambda+\phi_k)
\prod_{j=1}^{k-1}\cos(m_j\lambda+\psi_j),\\
z(\lambda)&=\sum_{k=1}^{n}R_k\cos(m_k\lambda+\theta_k)
\prod_{j=1}^{k-1}\sin(n_j\lambda+\chi_j),\\
w(\lambda)&=\sum_{k=1}^{n}R_k\sin(m_k\lambda+\theta_k)
\prod_{j=1}^{k-1}\sin(n_j\lambda+\chi_j).
\end{aligned}
\]

The prose calls n the order or number of nested coiling levels, describes lambda as an affine parameter representing path length, and describes n_k,m_k as winding numbers.

This is a finite product-sum with order-dependent modulation. It is not an explicit recurrence or level-to-level composition law.

### 2.2 Internal formulation changes are unmapped

The same document later introduces:
1. A radial/rotational expression y^mu(lambda)=r(lambda)R^mu_nu(lambda)x_0^nu, with x_0 in S^3 and R in SO(4).
2. A two-frequency expression H(lambda)=(x,y,z,t), using R(lambda), r_h, omega_s, omega_h and separate phase parameters.

No parameter map connects these to the Section 1.1 coefficients. The document invokes 4D Minkowski space while separately using S^3 and SO(4), without an explicit metric/signature map. The first formula uses w as a fourth coordinate; a later formula uses t. No coordinate-role map is supplied.

### 2.3 Dimensional and worldtube typing gaps

The source calls lambda a path-length parameter and n_k,m_k winding numbers, but n_k lambda and m_k lambda must be dimensionless. If lambda has length units and n_k,m_k are dimensionless winding integers, a normalization length is missing. If n_k,m_k carry inverse-length units, the source must say so and distinguish them from integer winding numbers. No normalization or units are declared.

The four coordinate functions do not identify a temporal coordinate, metric signature, or map into a Lorentzian manifold. A one-parameter curve does not define a finite-core worldtube: no sweep/thickening map, support, boundary conditions, responsive-medium relation, timesheet readout or action-level current coupling is supplied.

**Disposition:** candidate/unattributed reconstruction, not Nathan Direct, not a corrected SAT-O equation, not a complete worldline and not a worldtube model. The file is a composite of multiple unmapped formulations, not one canonical generator.

## 3. Relation to other source families

The direct June 23 user message indexed in NATHAN_VERIFIED_WORDS_COMPENDIUM.md (conversation 6a3a279a-10cc-83ea-9abf-4fc1dab9fb55, message 28895d46-780e-46d9-a4cd-646f92fad193) states one nested 4D helical worldline/worldtube structure and leaves scale placement unresolved. It does not contain the Section 1.1 product-sum equation. The later summary is not attributable to that direct message without a recovered authoring chain.

The separate [SAT.4DHH.UC.pdf](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT.4DHH.UC.pdf) was uploaded the preceding day, 2026-05-30. Its first page labels it “LLM DROP.” Its additive harmonic generator uses a distinguished first coordinate lambda, common scale ell_f, integer modes n_i, phases phi_i and transverse directions e_i. A four-message “Superhelix Field Theory” export repeats that additive form, but the context preceding its first user-role message is absent. It does not establish embedded equation authorship.

The 2025 bylined SAT4D three-axis baseline and the additive 2026 LLM-DROP family are already cross-referenced in Kestrel's source/curvature reports. Neither is silently equated with the recursive product-sum family.

Existing public issue [#370](https://github.com/Satobloc/HsH/issues/370) already uses the 2026 summary for an earlier three-tube intersection-order analysis. This report is a source-typing addendum only. It does not repeat that issue's synthetic calculation or treat it as physical evidence.

### SAT-O1 and Blockwave custody

No SAT-O1 or Blockwave original was changed or corrected:
- SAT-O1 source SATOBLOC/SAT O1 4D.txt, blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; archived-copy SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937; FileIndex last-write 2025-06-09T18:44:50Z.
- Blockwave attachment source, blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; archived-copy SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664; user-supplied attachment event 2025-09-16T16:31:26.687Z.

See the existing Nadir h1020 source/proof crosswalk and Enheduanna h1016 source-role report for verbatim originals. No corrected equation was issued.

## 4. Formalization status

Existing [PR #2143](https://github.com/Satobloc/HsH/pull/2143) contains an additive-generator n=3 special-case theorem and a curvature-symmetry candidate. It does not formalize the Section 1.1 recursive product-sum or connect it to the later SO(4) and two-frequency forms.

Current push run [#44649028244](https://github.com/Satobloc/HsH/actions/runs/44649028244) fails at the current PR head with parser errors at lines 32, 41 and 54; the later nthSuperhelixThreeMode identifier is consequently unknown. An earlier successful run applied to a prior head and does not establish the current theorem.

No new Lean module was added. The candidate lacks a single typed domain/codomain, temporal-coordinate choice, metric, dimensional normalization and composition maps. Formalizing one physical interpretation would require assumptions not supplied by the source. No data-free fixture or numerical calculation was created. Existing projection and connector-holonomy PRs do not prove this generator.

## 5. Measured-system candidate inventory

This is a source inventory, not a selected physical system or numerical comparison.

| Candidate | Actual observation and provenance | Limits before use |
|---|---|---|
| He-II vortex rings | Tang et al., Nature Communications 14, 2941 (2023), DOI [10.1038/s41467-023-38787-w](https://doi.org/10.1038/s41467-023-38787-w). Tracer-particle imaging, ellipse-based ring reconstruction, reported centroid-position uncertainty, source-data XLSX and supplementary movies. | Tracer particles track the vortex; the microscopic core radius is not directly imaged. Retrieve source data, acquisition/calibration details, particle-size calibration and propagated ellipse/3D reconstruction covariance before calculation. |
| GW170817 inspiral | GWOSC release DOI [10.7935/K5B8566F](https://doi.org/10.7935/K5B8566F), H1/L1/V1 calibrated strain, HDF5/GWF/ASCII products, 4096/16384 Hz data, data-quality flags and versioned noise-subtracted products. | Known L1 glitch, H1 low-frequency excess noise and windowing, detector calibration envelopes and PSD versions. Calibration files include LIGO-P1900040 and PSD products LIGO-P1900011. Parameter estimates are waveform/model-dependent; astronomical calibration papers using GR waveforms are not independent tests of GR. |
| Climbing-rope response | Emri et al., Sports Technology (2008), DOI [10.1002/jst.62](https://doi.org/10.1002/jst.62), reports an experimental falling-weight method and time-dependent viscoelasto-plastic response, impact force, deformation, energy storage/dissipation and nonlinear error propagation. UIAA 101 and EN 892 specify test protocols. | First-blush mechanical constraint heuristic only. No universal rope-to-filament equivalence. Test geometry, conditioning, friction, hysteresis and sample construction must be retained. |

He-II vortex-ring data are the most tractable first laboratory candidate for finite-core/loop and responsive-medium investigation, but the core itself is not directly resolved. GW170817 is a separate high-value inspiral benchmark, not a substitute for laboratory core metrology. Rope mechanics remains an ancillary contact/response comparator.

### CODATA gate

NIST still presents CODATA 2022 Version 9.0 as the current recommended-value release. The 2026 adjustment is in progress, with the stated input cutoff of 2026-12-31. The adjustment is a least-squares synthesis of theory and experiment with correlated inputs and published residual/correlation information. No CODATA values were inserted and no numerical comparison was performed.

Before future comparison: freeze the CODATA version, identify each measurement route, retrieve covariance/correlation and calibration material, record model-dependence, and separate measured, calibrated, fitted and predicted quantities. Freeze the H(s)H observable before fitting.

## 6. Mersearch, tooling and access boundary

No new Mersearch query was run:
- All four canonical request lanes are occupied.
- No local Mersearch executable or local repository checkout exists.
- The shared bridge searches all three roots, but a current explicit HSH_RESOURCES no-payload boundary prevents using that bridge for this task.
- Existing completed Mersearch receipts for Blockwave, SAT-O worldline/timesheet, SO(4) source geometry and worldtube/inspiral were consulted as navigation aids. They do not establish a dedicated search of the May 31 recursive-summary source family.

A bounded GitHub search was used on HsH and SAT_THEORY_ARCHIVE only. The HSH_RESOURCES root README and AI start page were read. **Access-boundary deviation:** one HSH_RESOURCES payload file was inadvertently fetched before the explicit no-payload instruction in the current Aster BOOT was found. It is excluded from this report and all conclusions; no further payload access, quotation, link, modification or publication occurred. Future payload access remains blocked pending the owner's explicit boundary decision. The deviation is recorded here and in the continuity handoff; do not repeat it.

Existing Math Hopper/Lean PRs and Whirligig resources were checked. SciSpace is available as a connected research capability but was not needed for this bounded source audit. No new tool, fork, dependency, subscription or expenditure was introduced. The local environment has no gh, Lean, Lake, Elan or Mersearch executable. Internal writes used the GitHub Contents API only after checking the local/house-tool route and shared-state write-safety instructions.

## 7. P0, campaign and upkeep

At pre-write main 72333cdca1c080758afc32002dee29a523d44eea, all eight protected Paper A/B source and presentation-control blobs matched their pinned identifiers. The three discovery source/control files also matched their pinned blobs.

- [P0 issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains open and ACTIVE.
- [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains open, draft and unmerged.
- No accepted live reader route, independent browser acceptance or explicit standdown was established.
- No deployment, source repair, merge or rebase occurred.

Campaign status:
- P1 cognition: overdue, frozen, not ready, Orson-owned.
- P2 measured-system geometry: HOLD. November 23 first-draft/hostile-review gate and November 30 major gate remain separate.
- P3 full theory: incomplete; December 14 remains the full-theory gate.

FIE was fully reread on 2026-11-20: six extracted pages, 12,892 characters. Next full review target is 2026-12-04. The unrelated-reading break was also completed 2026-11-20: Lamport, pages 6-8, next cursor 2481. Neither was repeated.

The task graph remains 18 branch records against 16 declared, 17 reachable and one unreachable. No graph repair or ownership change was attempted.

## 8. Continuity and disposition

- No authenticated current Enheduanna thread was found; no cross-thread delivery is claimed.
- The prior Nadir optional packet remains addressed to h1020:s3, not this h1024:s2 run, and was not marked consumed.
- Next deterministic label is Tern Rook. A repository-only optional context packet is provided with no assignment, review request, response obligation or ownership transfer.
- No public issue was created. Existing issue #370 already covers the source at a higher level; this delta is an internal source-typing/access-boundary note, not a new public theory result.
- No task ID, schedule, phase, signet or conversation name was changed. No sixth task was created.

**Disposition:** SOURCE_STRATIGRAPHY_DELTA_COMPLETE / RECURSIVE_GENERATOR_TYPE_GAPS_OPEN / MEASURED_CANDIDATES_IDENTIFIED_NOT_SELECTED / NO_PHYSICAL_CALCULATION / NO_NEW_LEAN_MODULE / P0_ACTIVE / LANE24_HOLD.
