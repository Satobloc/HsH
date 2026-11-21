# Observed-Slice Identifiability Gate v0.1

**Status:** PROPOSAL / ASSISTANT RECONSTRUCTION / NOT A PHYSICAL TEST  
**Scope:** Source-bound representation maps, observation-window compatibility, and identifiability of candidate histories versus selected properties.

This is an additive companion to the Coupling-Preserving Projection Gate and Meridian's Map-Family Freeze Gate. It does not replace Ravel's exact-fiber/readout results, Nadir's finite-resolution nontransitivity/error results, or Mercer's two-axis identifiability/discrimination work.

## 1. Source basis and attribution boundary

Nathan Direct's November 8 geometry discussion asks for explicit projection maps linking worldtube structure, centerline/slice descriptions, and measured observables. The same source distinguishes information in a complete history from information available in a present state or observational slice. It also rejects treating information conservation, holography, or universal observational completeness as an established H(s)H principle.

Primary raw export:
- Library artifact: `ND Workshop Relay _24 _ Geometry - raw.json`
- Conversation: `6aecede1-4c08-83e9-abc4-da64f59a4f51`
- Raw-export SHA-256: `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`
- Relevant user-role messages:
  - `8f4af45d-7635-44c7-8bc0-addad4e92a95`, body SHA-256 `0d71f0a2cd6a01d176dfbe5e0033c3fe8ba8dc27b9fe65dea393517a15d48a00`
  - `139e1e11-99f1-459b-a6ac-cb865015d0ff`, body SHA-256 `1abbcf1b6502673d502e896c58b238bea4206c089fdbaf00aa083e651cf9fcf7`
  - `429ad1fa-d171-44dd-97ff-aa080cea03ca`, body SHA-256 `06a04de48722ef38f9e2581b0628d224e9de9c4504982d3e40a451323dcea898`

The November 4 source-locator correction supplies a concrete mixed-origin example:
- Library artifact: `Workshop Relay _24 _ Geometry - raw (1).json`
- Conversation: `6aea46dd-dc60-83ea-8d50-689c152340e3`
- Raw-export SHA-256: `de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e`
- Message: `100388c5-89d6-4ffd-a895-598990636057`
- Body SHA-256: `8aa01ead3eed55c9b7a48fc5cbeda59a3829e3461d4aa9ba88ed64661b990c78`
- Direct user-authored span: half-open UTF-8 byte range `[0, 2374)`
- Embedded assistant-quoted span: `[2376, 15732)`
- Two newline delimiter bytes `[2374, 2376)` are left unassigned.

Both spans have the same outer message role (`user`), message ID, and body digest, but different span origins. The embedded assistant report's original assistant thread is not authenticated. Therefore, outer message role is insufficient for claim attribution. Source origin and the authorship/status of a later translation map must remain separate fields.

## 2. Source-bound map lineage

Every candidate map should carry:

1. Exact source artifact/export digest.
2. Exact conversation/message or document locator.
3. Exact claim-bearing span, with offset unit/convention and half-open bounds.
4. Span origin: Nathan Direct, assistant-quoted/reconstructed, historical source, standard reference, independent measurement, or unknown.
5. Source-to-candidate translation-map ID and construction status: source-defined, assistant reconstruction, standard-reference mapping, proposal, measured operator, or unknown.
6. Candidate-to-geometry, geometry-to-slice, slice-to-observable, and instrument/readout map IDs.
7. Immutable digests for the actual map definitions and any source correction that changes them.

A direct source statement does not make an assistant-authored geometric translation source-defined. A map ID is only an identity label until it is bound to the actual source/code digest and reviewed map definition.

## 3. Explicit observation pipeline

The minimum typed downstream chain is:

`Candidate → Geometry → Slice → Observable → Measured`

Each arrow is an explicit map with a declared domain, codomain, identity/version, and conditions. The candidate-to-geometry map may encode a worldtube/timesheet representation; the geometry-to-slice map is a projection/intersection; the slice-to-observable map is a readout; and the final map is the instrument/calibration operator.

These names are type slots, not claims that a particular worldtube-to-centerline, timesheet, contact-surface, or detector map has already been recovered. No such physical map is instantiated by this gate.

For a fair comparison, downstream projection, readout, instrument, calibration, and uncertainty treatment are shared across candidates unless the difference is explicitly included in the candidate family and frozen before holdout access.

## 4. Observation-anchored compatibility

Given an actual measured value, a declared output pseudometric, and a predeclared nonnegative tolerance, define the compatible candidate set as all candidates whose predicted measured output lies within that tolerance of the observation.

This is an observation-anchored set, not a pairwise “within tolerance” equivalence relation. Fixed-radius closeness need not be transitive; the gate does not quotient candidates by a relation that may fail transitivity.

The tolerance must be derived from the actual measurement protocol, calibration, resolution, and joint uncertainty model. For multichannel observations, use the full covariance or an explicitly justified covariance-normalized metric. Do not treat correlated derived channels as independent evidence.

## 5. Identifiability conditions

Two questions must be kept separate:

- **Full candidate/history identifiability:** the compatible set contains at most one candidate.
- **Property identifiability:** the claimed property has the same value for every candidate in the compatible set.

A particular property can therefore be identifiable even when the complete candidate history or geometry is not. Conversely, if two compatible candidates differ on the claimed thickness, twist, contact-surface status, curvature, or other target property, that property is not identifiable from the current observation under the declared tolerance.

This is conditional. The gate does not assert that every physical observation map is non-injective or that complete histories are universally unrecoverable. It says what follows if multiple candidates remain compatible with a particular observation.

## 6. Conditional model-separation bound

For two candidate predictions measured in the same pseudometric and compared with the same observation window:

- If both candidates are compatible with the same observation, their predicted outputs must be within twice the declared tolerance.
- If their predicted separation is greater than twice that tolerance, they cannot both be compatible with the same observation.
- The converse is not asserted: separation at or below twice the tolerance does not guarantee that a common compatible observation exists.

This is a deterministic triangle-inequality result, not a p-value, confidence interval, likelihood ratio, or physical falsification threshold. It becomes empirically useful only after the output metric and tolerance are fixed from real measurements and the shared calibration/holdout protocol.

## 7. H(s)H versus standard comparator

A candidate H(s)H representation and its standard-physics comparator must use the same measured system, observable definition, instrument/readout, calibration data, covariance treatment, nuisance parameters, and untouched holdout.

A candidate is not discriminating merely because its geometry or terminology differs. It must yield a frozen, source-supported observable prediction that differs from the standard comparator beyond the declared measurement resolution, or identify a property that is constant across its own compatible set but not shared by the comparator's compatible set.

The complete candidate family and map identities must be frozen before holdout access. No post-hoc map, parameter, twist, thickness, or contact-surface addition may be used to rescue a failed prediction.

## 8. Formalization and existing work

The companion Lean module is `HsHVerification.EnheduannaObservedSliceIdentifiability` in [PR #2293](https://github.com/Satobloc/HsH/pull/2293). It formalizes:
- source-span origin separately from outer message role;
- source origin separately from translation-map construction status;
- the typed candidate-to-geometry-to-slice-to-observable-to-measurement composition;
- observation-anchored compatible candidate sets;
- full-candidate uniqueness versus property identifiability;
- the two-tolerance separation bound.

Relevant prior work:
- [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133): exact-fiber readout descent and explicit projection composition.
- [Nadir PR #2214](https://github.com/Satobloc/HsH/pull/2214): finite-resolution neighborhoods, nontransitivity, and error accumulation.
- [Mercer issue #1867](https://github.com/Satobloc/HsH/issues/1867): two-axis identifiability/discrimination.
- [Enheduanna PR #1619](https://github.com/Satobloc/HsH/pull/1619): source attestation, context exposure, output occurrence, and attribution.
- [Coupling-Preserving Projection Gate v0.1](COUPLING_PRESERVING_PROJECTION_GATE_V0_1.md).
- [Map-Family Freeze Gate v0.1](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-h998-s3-map-family-freeze-gate-20261121t1436z-001.md).

Lean verifies only the encoded statements. It does not authenticate the source export, validate the semantic translation from source words to geometry, establish a physical premise, or prove an empirical prediction.

## 9. Current empirical status

**NOT TEST READY / P2 HOLD.**

No physical system, dataset, provenance-locked measurements, units, joint covariance, calibration, holdout, numerical tolerance, H(s)H prediction, fit, independent measurement, or falsification threshold is instantiated here. No new physical primitive or equation is proposed. The gate does not advance a paper milestone or promote any theory claim to BEDROCK.

A real instantiation must begin with an identifiable measured system and source-complete dataset, then populate and freeze the entire map chain before testing against independent holdout data.
