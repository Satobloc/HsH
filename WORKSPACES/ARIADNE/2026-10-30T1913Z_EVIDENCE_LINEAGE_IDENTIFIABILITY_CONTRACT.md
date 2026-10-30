# Evidence lineage × readout identifiability: two orthogonal gates

**Status:** internal architecture addendum; no physical derivation, no theory promotion.  
**Run key:** `REVROT3-19-20261011:475:s3`; nominal h=475; seq=2378; Ariadne (index 3), next Alberr (index 4).  
**Execution:** current-assistant, source-grounded reconstruction; not authenticated historical Ariadne participation.  
**Branch at intake:** `main`, HEAD `852ed905845a590de68c4e940c5f4fad10b0cdb4`. Existing :36 lease unchanged.

## 1. The architectural addition

The current Calder GW170817, Ravel helion, and Kestrel cross-sector notes already define increasingly explicit model-to-observable chains. One important distinction is still not represented as a mandatory contract field:

1. **Readout identifiability:** can the forward map distinguish the latent states or parameters relevant to the claim?
2. **Evidence independence:** are two reported observations genuinely independent witnesses, or multiple channels/derivatives of the same event, source, calibration, or analysis?

These are orthogonal. A single rich observation may identify a state without providing replication. Many independent observations may still fail to identify a hidden state if the forward map maps distinct states to the same output.

**Proposed improvement:** extend the existing canonical Model-to-Observable Contract with (a) an identifiability record and (b) an evidence-lineage/dependence record. Do not create a parallel catalog or tool.

## 2. Gate A — identifiability

For a declared model map
[
F_\theta:X\to Y,
]
define
[
x_1\sim_F x_2\iff F_\theta(x_1)=F_\theta(x_2).
]
If distinct admissible states share an output, the observation identifies only their equivalence class. The contract must record one of:

- `IDENTIFIABLE_ON_DECLARED_DOMAIN`
- `IDENTIFIABLE_WITH_EXTRA_CHANNELS`
- `NONIDENTIFIABLE`
- `UNKNOWN / MAP_MISSING`

Parameter identifiability must be assessed under the actual likelihood and nuisance structure. A narrow posterior under restrictive priors is not, by itself, proof of identifiability.

### Existing Lean result, not a new proof

PR [#676](https://github.com/Satobloc/HsH/pull/676) contains a generic assistant-reconstructed engine/paint lemma: if two distinct states produce identical outputs in every context, the context-indexed observation map is non-injective; one separating context distinguishes that pair.

Exact head `c54c417bac415e00e2456262ceb197d2590aae91`; GitHub Actions run `41056801972`, job `124066269828`, completed SUCCESS on 2026-10-30 12:43:06Z. The job explicitly completed the Lean-library compilation step. Exact Lean version and theorem-specific axiom-output audit were not recovered from run metadata. The source contains no literal `sorry`.

This is a valid generic conditional result, not a theorem about the actual Kirk/Riley model, not a source-to-math validation, and not evidence of human/LLM cognition. The underlying Kirk/Riley TXT/README/workflow bundle remains unrecovered; the source stratigraphy is recorded in `WORKSPACES/ARIADNE/2026-10-30T1548Z_MERSEARCH_COMPLETION_SOURCE_STRATIGRAPHY.md`.

## 3. Gate B — evidence lineage

Represent evidence as a typed provenance DAG. At minimum distinguish:

- raw acquisition / raw artifact;
- transformed data / extraction;
- derived summary or posterior;
- instrument and calibration;
- analysis pipeline and prior;
- event/system identity;
- fit use versus genuine holdout.

Useful edge types include `SAME_BLOB`, `SAME_CONVERSATION_GRAPH`, `DERIVED_FROM`, `SAME_EVENT`, `SAME_PHYSICAL_SYSTEM`, `SHARED_CALIBRATION`, `SHARED_ANALYSIS_PIPELINE`, `SHARED_PRIOR`, `USED_FOR_FIT`, and `HELD_OUT_FOR_TEST`.

Do not compress independence into one Boolean. Record it at the level relevant to the claim:

| Level | Required question |
|---|---|
| Artifact | Are these distinct raw objects or duplicate paths/exports? |
| Acquisition | Were measurements separately acquired? |
| Instrument/calibration | Are response and calibration dependencies shared? |
| Analysis | Are reductions, priors, and pipelines independent? |
| Event/system | Are these separate events/systems or channels from one object? |
| Fit/holdout | Was the claimed holdout excluded from fitting and model selection? |

A shared frozen model parameter vector across channels is desirable; it is not itself evidence dependence. Separate channel-specific refits, however, do not constitute a shared-parameter prediction.

### Keep two outcomes distinct

- **Cross-channel consistency:** multiple readouts from one event/system agree with one frozen model and their joint dependence/covariance is handled.
- **Independent replication:** a new acquisition/event/system passes a prediction fixed before its data were used.

A same-event multi-channel test can be powerful, but it is not automatically an independent event-level replication. Duplicate paths, transcript derivatives, posterior summaries, waveform variants, or repeated prompts do not multiply the number of independent witnesses.

## 4. Real-system crosswalk

### GW170817

Calder's current note records one 2017-08-17 event with two readout families: a 2019 low-spin PhenomPNRT tidal-posterior summary (300; 90% HPD [70, 720]), a high-spin one-sided 90% upper limit [0, 630], and a GW/EM arrival delay (+1.74\pm0.05\,\mathrm{s}) at an initial distance (40\pm8\,\mathrm{Mpc}).

These are channels of the same event, not independent mergers. The waveform/prior variants are robustness analyses of the same strain data. Raw posterior samples were not retrieved. The H(s)H tidal map is missing; the propagation map is missing; an unconstrained source-emission delay makes propagation non-identifiable. Correct status: `DESIGN_ONLY / MAP_MISSING / SOURCE_DELAY_UNCONSTRAINED`. No numerical score or new physical calculation was performed.

Primary sources: Abbott et al., *GW170817: Observation of Gravitational Waves from a Binary Neutron Star Inspiral*, PRL 119, 161101 (2017), DOI 10.1103/PhysRevLett.119.161101; Abbott et al., *Properties of the Binary Neutron Star Merger GW170817*, PRX 9, 011001 (2019), DOI 10.1103/PhysRevX.9.011001; Goldstein et al., *An ordinary short gamma-ray burst with extraordinary implications: Fermi-GBM detection of GRB 170817A*, ApJL 848, L14 (2017), DOI 10.3847/2041-8213/aa8f41. These are the underlying measurement/analysis sources; citation is not H(s)H validation.

Project crosswalk: `WORKSPACES/CALDER/2026-10-30T1802Z_GW170817_JOINT_READOUT_AND_LEAN_GATE.md`, blob `758c6997c338f900befa2fb6121a49393bf2d3b6`.

### Sgr A*

Kestrel's existing contract records S2 orbital precession factor (1.10\pm0.19), EHT emission-ring diameter (51.8\pm2.3\,\mu\mathrm{as}), and GRAVITY orbital (\theta_g=5.125\pm0.009\text{ (stat)}\pm0.020\text{ (sys)}\,\mu\mathrm{as}). These are distinct modalities of the same Galactic-centre source, not independent object-level systems. The reported ring-to-orbital scale ratio (10.107317\pm0.450860) was propagated under zero assumed inter-channel covariance; it is not a GR residual, Kerr-core size, or independent H(s)H prediction. The ratio is quoted from the existing source-locked Kestrel analysis, not recomputed here.

Primary sources: GRAVITY Collaboration, A&A 636, L5 (2020), DOI 10.1051/0004-6361/202037813; Event Horizon Telescope Collaboration, ApJL 930, L12 (2022), DOI 10.3847/2041-8213/ac6736 and DOI 10.3847/2041-8213/ac6756. These citations support the observational inputs, not an H(s)H interpretation.

Project crosswalk: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-cross-sector-observable-contract-20261027t1012z-s1-001.md`, blob `79fd92ceeaf273a30104396f904d84c6aeeb1811`.

### Kirk/Riley source genealogy

The existing Mersearch completion note distinguishes a direct user-role methodology statement, a derivative January 21 podcast transcript, and mechanically extracted text/cue files. The SRT and its two HsH paths are one blob; the text/cue files derive from it, and speaker attribution remains null. This is one transcript lineage, not several independent witnesses. The underlying Kirk/Riley source bundle and the original January 22 raw conversation remain unrecovered. The generic PR #676 theorem therefore cannot be attached to the actual model.

Source: `WORKSPACES/ARIADNE/2026-10-30T1548Z_MERSEARCH_COMPLETION_SOURCE_STRATIGRAPHY.md`, blob `4aa6a9b8cc2d2b86cd02577dcd4e9ae4356df212`. Its existing Mersearch request scanned 15,590 files / 20,808,904 records and reported 551 lexical hits across 31 paths; raw result files remain withheld and default exclusions applied. This is bounded coverage, not proof of archive-wide absence. No new Mersearch request was run.

## 5. Minimal fields to add to the existing packet

```text
forward_map_id
latent_state_domain
observable_codomain
parameter_vector_hash
parameter_freeze_timestamp
identifiability_status
observational_equivalence_class_or_separating_channel
raw_acquisition_ids
raw_artifact_blob_ids
provenance_parent_ids
event_or_system_cluster
instrument_and_calibration_ids
analysis_pipeline_and_prior_ids
uncertainty_covariance_id
calibration_dataset_ids
holdout_dataset_ids
holdout_access_audit
independence_vector
cross_channel_consistency_status
independent_replication_status
standard_comparator
pre_registered_score_and_falsification_threshold
```

An independent reviewer should be able to reconstruct the evidence DAG, identify shared dependencies, verify that the parameter freeze predates holdout access, and determine whether the forward map separates the target alternatives.

## 6. Lean and execution triage

Existing adjacent work was checked rather than duplicated:

| PR | Exact head | Existing CI | Scope |
|---|---|---|---|
| [#676](https://github.com/Satobloc/HsH/pull/676) | `c54c417bac415e00e2456262ceb197d2590aae91` | run `41056801972`: SUCCESS | generic assistant-reconstructed identifiability plus source-date arithmetic |
| [#790](https://github.com/Satobloc/HsH/pull/790) | `3dca89458b7d4d9754e799a88fd648a4aa175ad2` | run `40802623796`: SUCCESS | conditional role/transclusion and branch-projection gates |
| [#945](https://github.com/Satobloc/HsH/pull/945) | `765ce3ac3cf5c21347dcbefba3c746704cf6394e` | run `40776838230`: SUCCESS | conditional history-versus-position factorization |
| [#926](https://github.com/Satobloc/HsH/pull/926) | `da71e761dddcbead5e735453a20bef7198587d56` | run `40742802553`: FAILURE | source-visibility projection not verified at that head |

The future proof target is a finite source-backed provenance graph with explicit witness levels and a declared independence relation. No new generic/data-free theorem was attempted: the relation is not yet operationally defined tightly enough, and no specific prior permission for a new data-free proof was recovered. A finite Lean proof could check the encoded source graph, but not prove the extraction or annotations true.

No local Lean command, physical calculation, synthetic fixture, new tool, branch, PR, or public issue was created. Existing Math Hopper, Mersearch stable 1.0, Lean PR/CI, and previously audited Whirligig/SciSpace/fork routes were reused; no new tooling was built.

## 7. Governance and next cursor

- Current BEDROCK remains controlling; no amendment or promotion.
- P1 remains Orson-owned; this note does not count as an Orson cognition turn.
- P2 remains blocked on source-faithful forward maps and raw measured-data/readout availability.
- P3 must preserve the distinction between source, reconstruction, proof, measurement, and unresolved postulate.
- Code Grurple remains ACTIVE because both public paper-reader routes remain pending. This is an internal workspace note only; no issue, PR, manuscript, or public-site change.
- FIE was last fully reviewed 2026-10-27; the 14-day threshold is not due. The preceding Ariadne run already read unrelated `BULBEK.txt`, lines 201–240, return cursor 241; no redundant second break was added.
- No physical calculation, data-free numerical fixture, new Lean proof, scheduler mutation, or signet use.

**Next project-level action:** when the publication interlock permits ordinary P2 work, add these two gates to the existing canonical readout contract and require an independently acquired holdout before claiming replication. First recover the missing H(s)H forward maps and raw source/likelihood inputs. Current status: **ARCHITECTURE_ADVANCED / PHYSICAL_PREDICTION_NOT_YET_EXECUTABLE**.
