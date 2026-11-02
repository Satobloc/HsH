# Hale :00 | May 2025 SAT/aSAT Branch Boundary and Worldtube-Support Audit

**Run key:** REVROT3-19-20261011:545:s0  
**Date:** 2026-11-02  
**Lane:** 00, Nathan Direct / geometry fidelity  
**Disposition:** Source-fidelity correction and mathematical dependency audit completed. No new theory, physical calculation, Lean module, PR, branch, or public issue created.

This report corrects one source-labeling error in HsH issue #1213 and adds a distinct geometric-support audit. It does not repeat the graviton/gluon question-to-assertion analysis in #996, the temporal-support audit in #1013, or the three-view force crosswalk in #1271.

## 1. Source custody

### 1.1 May 4, 2025 raw conversation

- Path: `DEVELOPMENT_FULL_CONVOS/25.05.03•25.05.04•Fundamental Physics Explanations — raw.json`
- Git blob SHA-1: `9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9`
- Conversation ID: `6816e398-af14-8002-ab29-cb2d84caf989`
- 74 mapping nodes; 32 user-role nodes; 72-node selected current ancestry.
- First extant HsH archive commit: 2026-10-10T01:26:41Z. This is archive-ingest time, not conversation time.

### 1.2 FIE foundational document

*The Fundamental Intuitions — Extended* is dated 2025-02-02 and updated 2026-02-26. Its six-page PDF source SHA-256 is `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`; extracted-text blob SHA-1 is `9b94093053f28be8bf64ee227d3382d2296f63ea`; first archive commit was 2026-05-30T19:10:49Z. This is a Nathan-designated foundational document, but a message-level author/byline was not recovered. The six-page text extraction was read; PDF page images were not inspected.

The FIE describes worldlines as filaments, a time wavefront/surface, particle readout at their intersection, reciprocal interaction, and back-transmission that curves the time surface. Extensions A/B tentatively suggest coordinated bosonic/filament-vibration wavefronts and describe gravity as large-scale filament distortions. It does not define a graviton.

### 1.3 SAT-O / SAT4D lineage

| Artifact | Git blob SHA-1 | Provenance |
|---|---|---|
| `SAT O Core Modules/SAT.O Official Directives.txt` | `167136310cdf33ca8f986f33634692314c1a0946` | First archived 2025-10-27; historical directive document |
| `SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt` | `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | June-2025 document; local file metadata created 2025-06-08 / modified 2025-06-09; first archived 2025-10-27 |
| `SAT_O REWRITE/SAT 4D/SAT O1 4D.txt` | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | Historical O1 module; same first archive commit |
| `SAT 4D Theory Work/SAT4D_4.txt` | `efc88f4523b2fd616e64898737c2aa45e5f39b9a` | First archived 2026-09-04; SATO.4D Coherence Project glossary |
| `SAT_O REWRITE/SAT 4D/4D THINKING PRIMER.txt` | `135bdf4bfc274de1388e5fe3c979e9810919b5d3` | First archived 2025-10-27; historical SAT_O Project training text |

The SAT-O directives specify a 4D manifold, 1D filaments, and a propagating 3D wavefront, while saying no metric, gauge, or connection is assumed a priori and further structure remains tentative.

The June SAT4D draft distinguishes a static “True Block Mode” (static filaments, moving time surface) from semi-dynamic/solidification alternatives. Its later O1 module gives filaments intrinsic tension/vibrational dynamics. The file does not explicitly assign O1 to Mode 2 or another alternate mode. Keep this unresolved rather than forcing a contradiction or silently merging the modes.

The O1 module defines a 1D curve `gamma : R -> R^(3,1)` and describes the worldtube as the 4D volume swept by a vibrating filament. Its historical action is:

`S[gamma] = integral d(lambda) L(gamma^mu, v^mu)`

`L = (1/2) m v^mu v_mu - V_tension(gamma)`

This is a document-level historical proposal, not a verbatim Nathan Direct turn and not a current accepted action. No action or coefficient was changed.

The SAT4D draft also contains an O9 table entry describing gravitons as quantized oscillations of filament strain. Treat this as a distinct historical draft variant, not as the current primitive and not as interchangeable with other O9-labelled files. The O9 identity collision remains governed by #996 and #1000; no O9 register was changed.

### 1.4 Later Saucepan exports are separate

- `saucepan_complete_chat_log_103_msgs.json`: blob `d9a25072ed462c714cdd04f2fb1bce4860d4b12d`, exported 2026-07-31T19:29:54.213Z, 103 messages, roles Nathan/Srena, no recovered conversation ID/title, first archived 2026-09-05.
- `SRENA SAT2.txt`: separate 17-message session titled “Srena - 2026-07-31 09:08”, created 2026-07-31T13:08:52.967805Z, first archived 2026-09-04. Its blob was not re-retrieved in this run.

Do not merge these sessions. The later graviton/gluon question-to-assertion material belongs to the 103-message export and is already audited in #996.

## 2. Correcting the May 2025 SAT/aSAT branch boundary

The raw selected ancestry gives this sequence:

| Message UUID | UTC timestamp | Direct content |
|---|---|---|
| `2b40efe6-eea0-49f4-a15a-6d6518a6afdc` | 2025-05-04T04:06:09.580Z | “What I understand about SAT” summary: particles as intersections of 4D filament-like structures with a time wavefront constituting “now” |
| `3416cb94-1682-420a-a727-57b15a27962c` | 2025-05-04T04:08:35.784Z | Asks the assistant to elaborate the basic concept and implications |
| `8dc814fb-256e-4313-8c7c-283cc1adc648` | 2025-05-04T04:31:38.691Z | Reveals SAT is the user's framework and memory was disabled for an independent prompt-path check |
| `b1c8c059-6882-473d-aad7-dad1e3d67a15` | 2025-05-04T04:39:55.345Z | Explicitly labels the *mass-mechanism exploration* “aSAT” |
| `3cf357ea-e215-4dd9-96c5-527c31386d5a` | 2025-05-04T04:41:01.235Z | Asks how the proposed interaction might be measured or quantified |
| `2729ae81-a8ff-46e9-bc21-e892c3193df1` | 2025-05-04T04:42:14.542Z | Asks how vacuum and matter differ in that view |
| `3f895920-0f09-4189-b53b-89e7debd4afd` | 2025-05-04T04:46:01.036Z | Describes aSAT as a semi-independent test developed from the same basic premise |

**Correction to issue #1213:** its phrase “the user describes an aSAT picture” is too broad when applied to the initial intersection/wavefront summary. The first relevant user turn describes what the user understands SAT to say. The aSAT label is introduced later for the semi-independent mass-mechanism exploration. The aSAT branch is not the origin label for the initial SAT premise.

The first turn is still a user-authored summary, not a canonical mathematical specification. The memory-disabled setup explains why the user wanted a separate prompt path; it does not make the assistant's output independent empirical evidence or independent physical confirmation.

## 3. Direct geometry versus assistant reconstruction

### Nathan Direct in the May 4 raw conversation

The direct geometric content is qualitative:

- filament-like structures exist in a 4D setting;
- a time wavefront constitutes the “now”;
- perceived particles are associated with intersections of those structures and the wavefront.

The phrase “4-dimensional filament-like structures” does not by itself settle intrinsic dimension. It could refer to 1D carriers embedded in 4D, extended finite-core worldtubes, or a deliberately broad description. Later sources must be kept as separate witnesses when resolving that ambiguity.

### Assistant-generated additions

These are not Nathan Direct equations:

- Assistant message `439fecaf-084d-4354-909d-e70cbd2a3108` interprets the phrase as higher-dimensional objects such as strings/branes.
- Assistant message `17f9a663-e1ce-41ed-bbf2-cff09ba041f3` introduces scalar fields `Phi(x,t)` and `T(x,t)`, wave equations, and a source term `S(x,t)`.
- Assistant message `1768ac2f-66f4-4403-92a4-113f87f9f78e` proposes mass as persistence, resistance, tangling, and interaction duration.
- Assistant message `88b7fab6-fc27-4647-911e-9465dabfc603` introduces a mass-index integral over an undefined local support.
- Assistant message `40b8331f-c167-491c-ad53-a3c4e82a4505` supplies an assistant-generated vacuum/matter distinction.

The assistant first treats “4D filament” as a higher-dimensional brane-like object, then later describes a 1D object embedded in 4D. The wording should have remained ambiguous until the intended carrier and core were defined. Later SAT4D material and current BEDROCK distinguish a 1D centerline from a finite-core worldtube.

## 4. Geometric support of the aSAT mass-index proposal

The assistant-generated mass index is of the form:

`M_f = integral over Sigma of (alpha C + beta T + gamma K) dV`

Its support is not defined. The dimension depends on which object `Sigma` is intended to denote.

For smooth submanifolds intersecting transversely in a 4D ambient manifold:

| Carrier A | Carrier B | Expected local intersection dimension |
|---|---|---:|
| 1D filament centerline | 3D timesheet | 1 + 3 - 4 = 0 |
| 2D worldsheet | 3D timesheet | 2 + 3 - 4 = 1 |
| 4D finite-core worldtube with interior | 3D timesheet | 4 + 3 - 4 = 3 |

These are conditional dimension counts, not physical calculations. They assume smoothness and transversality. A 0D centerline intersection is locally discrete, not a 3D volume. A 3D volume integral could instead be supported on a finite-core worldtube slice, but then the core, cross-section, slice map, and measure must be defined.

Thus the aSAT integral is **underdetermined**, not automatically impossible: it could be interpreted as a finite-core slice, but the assistant never supplies the map from centerline to core or specifies the support measure. Likewise, “interaction duration” needs a defined interval, proper-time parameter, finite core, or non-transverse contact; it cannot be inferred from a single transverse point intersection.

The assistant's coefficients and fields are undefined. No units, normalization, constitutive law, or data-backed mass relation is supplied. No mass law is accepted or calculated.

## 5. Current BEDROCK and missing metric/connection dependencies

Current BEDROCK (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`) adds an important qualification:

- BR-006 treats finite-core worldtube geometry as the physical mechanism.
- ND-2026-10-18-07 says historical one-dimensional centerlines may be approximations to intended extended manifolds.

This prevents collapsing the physical object to a 1D centerline. Preserve both levels:

`gamma : I -> M^4` — possible 1D centerline representation  
`W_epsilon(gamma) subset M^4` — finite-core worldtube / extended physical object  
`Sigma_t subset M^4` — 3D time wavefront or timesheet  
`gamma(I) intersect Sigma_t` — centerline readout, 0D locally if transverse  
`W_epsilon(gamma) intersect Sigma_t` — possible 3D core slice if the worldtube has 4D interior

The centerline-to-core map, core radius/normal-bundle structure, and core-slice readout remain unspecified.

A separate mathematical dependency gap appears in the historical SAT4D_4 glossary (blob `efc88f4523b2fd616e64898737c2aa45e5f39b9a`). It says that the 4D manifold has no metric or connection assumed a priori, but then defines:

`u^mu` as a normal vector,  
`theta_4 = angle(v^mu, u^mu)`, and  
`S_munu = nabla_mu u_nu + nabla_nu u_mu`.

These expressions require additional structure:

- a hypersurface has a conormal covector without a metric, but a normal vector requires a metric or another specified identification;
- an angle requires a declared nondegenerate metric, signature, and normalization convention;
- lowering `u^mu` to `u_nu` requires a metric;
- `nabla` requires an affine connection.

If the intended metric is Lorentzian, the angle convention must also be stated; an ordinary Euclidean angle cannot be imported silently. The SAT4D_4 glossary does not provide these prerequisites. This is a definition gap, not a claim that the intended geometry is false.

The existing Nadir helix/slice formalization uses an all-plus Euclidean pairing. It therefore supplies a conditional Euclidean model, not the missing Lorentzian/general-manifold map.

## 6. Mapping diagram and unresolved compositions

```text
                    M^4
                     |
          +----------+-----------+
          |                      |
          v                      v
  gamma : I -> M^4       Sigma_t^3 -> M^4
  centerline/filament      time wavefront
          |                      |
          | thickening           |
          v                      |
  W_epsilon(gamma)               |
  finite-core worldtube          |
          |                      |
          +----------+-----------+
                     |
              intersection/readout
               /             \
              v               v
     gamma intersect       W_epsilon intersect
        Sigma_t              Sigma_t
          |                     |
        0D local              3D slice
          |                     |
          +----------+----------+
                     |
            particle/readout map
                     |
       filament-network interaction
                     |
        back-transmission to timesheet
                     |
              timesheet curvature

FIE: gravity described tentatively as large-scale filament distortions.
Current prior-conversation clarification (see #996): no graviton per se;
a soliton on the timesheet might qualify as a graviton. The map from
filament distortion to a timesheet soliton and then to an observable
remains missing.
```

This is a typed proposal for organizing source objects, not a completed physical model. No analogy substitutes for the missing projection and composition maps.

## 7. Existing Lean verification

No new Lean module or PR was created. Existing formalizations were reused.

### PR #1133 — Ravel carrier/sheet dimension gate

- Current PR head: `d8579403952ca658cf5dd0547e8c181701d18145`
- Module blob: `69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4`
- Successful workflow run #41348936553, job #124974692430
- Lean 4.34.0 / Lake 5.0.0
- Successful PR merge-ref build; current module blob matches the merge-ref module.
- The arithmetic theorem gives 0 for the 1D/3D/4D expected transverse-intersection dimension.
- It does not prove geometric transversality, existence, or uniqueness.
- The run log contains no `sorryAx`, `admit`, or Lean error. Tests, lint, nanoda, and automated axiom audit were skipped.

### PR #262 — Nadir helix/slice geometry

- Current PR head: `c7dc2c483f50ae03fc7a7c530829170135e18d92`
- Module blob: `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`
- Successful workflow run #41301288857, job #124832543107
- Successful PR merge-ref build.
- Proves unique affine line/hyperplane intersection under nonzero normal/tangent pairing, plus a separate circular-helix slice result.
- Uses an all-plus Euclidean pairing. It is not a Lorentzian or general time-wavefront proof.

No standalone exact-head build was run in this execution. No local Lean/Lake/Elan executable is installed. Compilation checks the formalized statements only; it does not validate the source translation or physical premises.

## 8. Discrepancy ledger

1. **Issue #1213 branch label:** the first May 4 SAT summary was overbroadly called an aSAT picture. The aSAT label begins later, at the mass-mechanism exploration.
2. **Intrinsic versus ambient dimension:** “4D filament-like” in the direct summary is underdetermined; later documents distinguish a 1D centerline from a finite-core 4D worldtube.
3. **Assistant mass support:** the aSAT mass-index integral does not specify whether it integrates over a centerline event, a timesheet, or a finite-core slice.
4. **Duration and vacuum/matter criteria:** assistant-generated and undefined; no direct acceptance or physical law.
5. **Metric/connection:** SAT-O directives withhold these structures a priori, while the SAT4D_4 glossary uses angle, index lowering, and covariant derivative without declaring them.
6. **Static/dynamic mode layering:** SAT4D draft Mode 1 and O1 vibration dynamics are not explicitly assigned to separate modes.
7. **Graviton status:** current prior-conversation clarification says the time wavefront/wavesheet is primitive and a graviton is only a possible soliton. Its raw message locator has not been recovered; the Common note is an assistant transcription and preserves the literal spelling “waferont”.
8. **O9 identity:** no O9 equation was changed or unified. The SAT4D draft O9 table, standalone graviton strain file, mass-spectrum O9, and optical-retardance O9 remain versioned historical objects. See #996 and #1000.
9. **Srena export identity:** the 103-message and 17-message Saucepan exports are distinct sessions and must not be merged.

## 9. Scope controls and next cursor

- No CODATA scoring, external literature comparison, physical calculation, invented fixture, or independent measurement.
- No SAT-O or Blockwave equation was corrected or promoted.
- No new tool, paid service, branch, PR, or automation.
- Existing Math Hopper, Whirligig, and Lean PRs were checked; no new tooling was needed. SciSpace is available but was not used because this was an internal-first source audit. No exhaustive fork count is claimed.
- Code Grurple remains active; no Paper A/B or reader work was performed.
- P1/P2/P3 gates remain November 9 / November 30 / December 14.
- Orson's protected cognition allocation was untouched.
- FIE full re-review is due November 10; last recorded full review was October 27. This run read the six-page extraction for source context but did not constitute a new independent review.
- Last unrelated reading break: TheTANGLE, lines 1281–1320; next cursor 1321. No redundant break was performed.

Next deeper cursor:
1. Recover the raw October 29 direct graviton clarification.
2. Define the centerline-to-finite-core map and timesheet/core-slice projection.
3. Declare metric, signature, and connection before formalizing theta-four or strain.
4. Resolve whether SAT4D O1 vibration dynamics belongs to Mode 2 or another explicit extension.
5. Keep the May 2025 aSAT mass mechanism sandboxed until its support, measure, and constitutive law are defined.

**Publication disposition:** internal report retained in the Hale workspace. No new public issue was opened because #1213 already contains the source submission, its publisher run rejected the SHA, the current publisher listens only to `issues.opened`, and the edit/append listener PR #1251 remains unmerged. Creating another issue or bypassing the publisher would risk duplication. The correction is pending an authorized append/retry route.
