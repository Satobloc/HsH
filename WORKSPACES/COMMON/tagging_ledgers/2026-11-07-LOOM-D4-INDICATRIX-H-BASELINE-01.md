# Loom source-tag ledger: D4 indicatrix and H baseline

**Recorded:** 2026-11-07T21:00Z  
**Run key:** REVROT3-19-20261011:669:s0  
**Ledger type:** MANUAL SOURCE TAGGING / ADDITIVE / GEOMETRY-FIDELITY  
**Speaker rule:** raw archive user-role messages are Nathan; assistant messages remain assistant. The September 30 transcript lacks raw role metadata, so its user-turn attribution is explicitly transcript-inferred.

## A. September 30 D4 indicatrix transcript

- Source: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt
- Blob SHA-1: 5c4e20eb52043b655eb81496962133e0ffe33f04
- Read range: lines 2559-2576
- Attribution: surrounding dialogue turn sequence; not a raw role-coded export and no per-message timestamp.

**Tags:** INDICATRIX; EUCLIDEAN-4D-DESCRIPTIVE-GEOMETRY; FIXED-MOVABLE-HYPERSPHERE; CO-CENTERED-ROTATION-SCALE; MARKED-POINT-READOUT-INTENT; HELICAL-WORLDLINE-INTENT; TRANSCRIPT-TURN-ATTRIBUTION; RAW-ROLE-METADATA-ABSENT.

The user describes a fixed coordinate system and unit hypersphere, a coincident movable copy pinned at the origin, relative rotation and scale, and a marked point whose path relative to a fixed point is intended to trace a helical worldline. The transcript spells “helical word lines” once; retain that spelling as a transcription note.

**Authorship relation:** the geometric construction precedes the D4 name. The assistant had just supplied “D4 root lattice”; the user accepted it as a good fit. Tag the geometry as transcript-attributed user intent, but tag the D4 identification as ASSISTANT-TERM-INTRODUCTION; USER-ACCEPTED-CANDIDATE; NOT-USER-DERIVED-LATTICE-EQUIVALENCE.

## B. October 8-9 Meridian Free Build raw conversation

- Conversation ID: 6ac45d1f-17b0-83ea-ad1f-fa524602378b
- Raw blob SHA-1: 7af1561b321f4d9364da5eb111df689efc652827

| Message ID | Role / timestamp | Tags | Source-grounded note |
|---|---|---|---|
| ae5b9fd6-bb6f-4f08-97db-699c3bce0365 | user / 2026-10-08T21:53:45.340Z | NATHAN-DIRECT; H-BASELINE; SECOND-ORDER-SUPERHELIX; ZERO-DEVIATION-REFERENCE; ANGLE-DISPLACEMENT-SCALE; NORMALIZATION-INTENT | H is a reference baseline, not the object being studied. |
| efa37313-a2a8-4f78-940d-673c69a29fd1 | assistant / 2026-10-08T21:53:59.350Z | ASSISTANT-RECONSTRUCTION; SIX-FEATURE-VECTOR; METRIC-STATUS-UNRESOLVED | Six-coordinate H descriptor is not a verbatim direct equation and is not yet a strict metric. |
| 5f860c83-ced3-484b-9a37-e3ad35578c4e | assistant / 2026-10-09T00:26:10.077Z | SPECTRAL-FINGERPRINT-PROPOSAL; WINDING-COUNT-INPUT | Model-dependent fingerprint using a selected winding count. |
| 561964be-5879-4bb5-81c4-16c7ae5b8811 | assistant / 2026-10-09T01:00:27.267Z | ASSISTANT-SELF-CORRECTION; INPUT-NOT-PREDICTION | Winding count was an input, not a derived prediction. |
| 68ea28d0-7f74-4264-ace8-e910439eb327 | user / 2026-10-09T01:08:00.959Z | NATHAN-DIRECT; FIRST-ORDER-PERIOD-TENTATIVE; NEAR-C-PROPAGATION-TENTATIVE | Tentative constant first-order period and propagation near c. |
| 6f00a97a-aa84-45bf-9429-4ff70736014a | user / 2026-10-09T01:13:43.652Z | NATHAN-DIRECT; ONE-CORE; REJECTS-SEPARATE-CARRIER; SECOND-ORDER-SUPERHELIX | Direct correction: one helical core; larger winding is hollow. |
| 8e09c212-fd7b-4adb-9af8-bad24c39dba2 | assistant / 2026-10-09T01:13:45.955Z | SINGLE-CURVE-RECONSTRUCTION; RESPONSIVE-MEDIUM-FIELD-PROPOSAL | Closer to one-core geometry, but adds an undefined scalar field and energy functional. |
| 3c657387-b80b-4982-a61a-8e6d8568b8d1 | user / 2026-10-09T01:50:55.112Z | NATHAN-DIRECT; WORLDTUBE-CURVATURE-INERTIA; CLASSICAL-LIMIT-HYPOTHESIS | Separate worldtube/inertia audit remains in issue #1292. |

## C. Candidate maps and typed terminology

The minimal continuous transformation family compatible with the transcript is a candidate positive-scale action with SO(4): T_(s,R)(x)=sRx, with composition (s2,R2)∘(s1,R1)=(s2s1,R2R1). A candidate marked-point readout is gamma_p(t)=s(t)R(t)p-p0. Neither is a recovered source equation; the direct transcript does not decide difference vector versus projection, ray, or multi-marker frame reconstruction.

A candidate D4 root-shell map is n -> n/sqrt(2) for norm-squared-2 D4 vectors. It gives finite unit marker directions on S3, but the source does not say whether the intended grid is the full lattice, root shell, or a continuous sphere carrying lattice markers. The finite D4 lattice symmetry group is not the full continuous SO(4).

The assistant H vector is a feature map, not a metric tensor or distance. Angle and log-scale are dimensionless while displacement carries length; a strict metric needs a reference length or explicit weights. Six feature slots do not automatically encode a general SO(4) rotation plus scale.

**Terminology tags:** INDICATRIX; D4-ROOT-SHELL-CANDIDATE; SO4-CONTINUOUS-ACTION-CANDIDATE; H-BASELINE; H-FEATURE-VECTOR; INDEX-SPHERE-ALIAS-UNRESOLVED; WORLDLINE-VS-WORLDTUBE-TYPE-DISTINCTION; H-SYMBOL-COLLISION.

## D. Related issue and Lean-source tags

- Issue #1244: MARCH-7-UNIVERSAL-INDICATRIX-UI; PHASE-SPIN-SPACE; RELATED-MOTIF-NOT-IDENTICAL.
- Issue #1292: SECOND-ORDER-SUPERHELIX; WORLDTUBE-INERTIA; SOURCE-FIDELITY.
- Issues #1120 and #1407: AFFINE-EUCLIDEAN-LIFT; 4D-CURVATURE; OBJECT-HIERARCHY.
- Issues #1073 and #1281: SAT-O-BLOCKWAVE-VERBATIM-SOURCE-LEDGER; REFERENCED-NOT-REEXTRACTED-IN-THIS-RUN.
- Issues #4 and #559: H-TRANSPORT-OBJECT and H-LAMBDA-CURVE; NOT-IDENTIFIED-WITH-H-BASELINE.
- PR #752: ABSTRACT-STABILIZER-PROOF; GENERIC-ASSUMPTIONS; NOT-CONCRETE-SO4-INSTANTIATION.
- PR #750: CONDITIONAL-ZERO-SCALE-DIRECTION-LOSS; NOT-REQUIRED-BY-UNIT-SPHERE-SOURCE.
- PR #1245: GENUINE-EUCLIDEAN-LIFTED-CURVE-GRAM-IDENTITY; NOT-H-OR-D4-PROOF.
- PR #1133: CONDITIONAL-DIMENSION-ARITHMETIC; PRESERVESSLICE-ASSUMED; PROJECTION-INTERFACE-NOT-D4-MAP.

## E. Additive source relationships

- D4 name: assistant introduces; user accepts; no user-originated derivation of lattice equivalence.
- H baseline: direct user intent; six-coordinate vector: assistant reconstruction.
- Winding count: assistant input; explicitly not a derived prediction.
- One-core user correction SUPERSEDES the earlier assistant two-curve carrier construction.
- March 7 phase/spin-space UI and September 30 Euclidean worldline indicatrix share a sphere motif but are not identified.
- Indicatrix and later “index sphere” remain unmerged terms.
- H baseline is not identified with the H/transport object in #4 or H(lambda) in #559.

## F. Read-it-tag-it and operational provenance

- Read the Loom historical charter source recovery, Loom README/current-work/continuity/terminology register, the standing Read It Tag It policy, Aster current-work/inbox, the Sable-to-Loom h669 handoff, four Mersearch lane JSON files, publisher workflow/script, issues #1244/#1292/#1120/#1407/#1073/#1281/#4/#559, and PRs #750/#752/#1133/#1245/#991. These are tagged here as CHARTER-CONTEXT; ROUTING-CONTEXT; PUBLISHER-PROTOCOL; MERSEARCH-LANE-STATE; RELATED-SOURCE-LEDGER; FORMALIZATION-STATUS; or TOOLING-STATUS as applicable.
- Four Mersearch lane files contain request payloads. No new request or overwrite was made. This run referenced the existing #1073/#1281 equation ledgers; it did not re-fetch raw SAT-O/Blockwave files or rerun the Mersearch source set.
- Math Hopper PR #991 remains OPEN/DRAFT and extraction-only; Whirligig remains on hold; SciSpace is available. The three repositories have zero forks. No new tool, dependency, paid service, or external cost was introduced.
- Unrelated reading: Kakuzo Okakura, The Book of Tea, Project Gutenberg eBook 769, lines 134-207 read; next cursor line 208. Tag UNRELATED-HISTORICAL-READING; PHILOSOPHY; SOURCE-READ.
- FIE re-review due 2026-11-10, not yet due.
- No physical calculation, CODATA scoring, invented fixture, Factory Floor admission, plot, paper-gate advancement, or BEDROCK theory promotion.

## G. Next source cursor

Recover an original indicatrix diagram/source; decide full D4 lattice versus root shell; define marker correspondence and marked-point readout; define per-order transform-to-H map and units; define d_H or g_H before treating H as a strict metric. Only then formalize the maps in Lean. Preserve transcript attribution limits and all assistant/direct authorship boundaries.


## H. Cross-lens guardrails

- INSIDE the candidate geometry: a positive-scale SO(4) action on a co-centered indicatrix and a marked-point readout.
- OUTSIDE the model: the observable-worldline and measurement map is not defined.
- GR: Euclidean R4 is not yet Lorentzian spacetime; no signature, proper-time map, or metric identification is supplied.
- String theory: helical/winding vocabulary does not establish string winding; no compact dimension, worldsheet, or string tension is specified.
- SM/QM: D4 symmetry alone does not specify a gauge representation, particle multiplet, or measured spectrum.
- Information: the six-entry H descriptor is not an information metric; no probability model or Fisher tensor is defined.

These are comparison lenses and open tests, not equivalences. No WWRD rope analogy or physical equivalence was used.


## I. October 21 raw notation witness and October 29 prior-context witness

### October 21 raw direct message
- Conversation: Meridian Minkowski Ring Analysis, ID 6ad7e9c0-e8a0-83e9-984e-94d020de3abf.
- Raw blob: 56a84cb85d5c386efa4ea11d322d11e95e2c7703.
- Correct direct user-role message ID: c5525f53-b7cc-4444-8102-3bf6fdb1c892.
- Timestamp: 2026-10-21T13:55:40.205Z.
- Direct text: “So, we're always in cw=t, we're always in +/-(c+H_0)/2 [or whatever the proper expression of that is], we're always in Forest Normalizatin, and we're always in (++++)”.
- Tags: NATHAN-DIRECT-RAW-USER-ROLE; CW-EQUALS-T; FOREST-NORMALIZATION; POSITIVE-DEFINITE-++++-CLAIM; H0-EXPRESSION-TENTATIVE-PLACEHOLDER; NATURAL-UNITS-CONTEXT.
- An earlier Aster receipt carries a different UUID. The raw mapping above is the corrected locator.
- The surrounding conversation rejects an assistant-invented numerical coincidence as evidence; the illustrative 120-day period and shear were assistant-generated and discarded, not physical data.

### October 29 TOPLESS witness
- Intake: WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-29_TOPLESS_GEOMETRIC_INTAKE.md, blob 74ce884326a25877dd226977a1c91eb016174893.
- Aster recovery delta: WORKSPACES/ASTER/2026-11-06_TOPLESS_PRIOR_CONTEXT_RECOVERY_DELTA.md, blob 8971125f18e9cad09b45c370e96a25159b2872.
- Prior-context retrieval identifies user-role messages at 2026-10-29T17:00:52Z and 17:28:42Z and reports a later w=ct / Forest Normalization clarification, equal intrinsic wavefront speed c, and coiled/bunched matter versus straighter vacuum worldlines.
- Tags: USER-AUTHORED-INDEX; PRIOR-CONTEXT-WITNESS; RAW-ARCHIVE-NOT-RECOVERED; FULL-BODY-ABSENT; MESSAGE-UUID-ABSENT; PARENT-BRANCH-ABSENT; SUPERSESSION-NOT-ESTABLISHED.
- Keep the raw October 21 cw=t witness and the October 29 w=ct prior-context witness separate. No conversion map or source-authenticated supersession is established. Do not silently normalize either notation.

### Chronology boundary
September 30 indicatrix transcript -> October 8 H baseline -> October 9 one-core/worldtube claims -> October 21 raw cw=t/Forest Normalization/++++ -> October 29 TOPLESS prior-context w=ct witness. The H baseline is not yet mapped to either notation witness or the D4 indicatrix.

## J. Post-run control-plane and routing sources read

Read after initial work to complete the preflight audit: BEDROCK.md; Steering Charter 2026-10-26; Three Paper Campaign 2026-10-26; NEW_INSTANCE_START_HERE; INSTANCE_ONBOARDING_3REPO; README_ONBOARDING_POINTER; REVIVAL_ROTATION_PROTOCOL; REVIVAL_ROTATION_V3; REVIVAL_ROTATION_THREAD_ROUTING; REVIVAL_REENTRY_PROTOCOL_V2; REVIVAL_RELAY_THREAD_FIRST_RULE; REVIVAL_RELAY_NAVIGATION_PREFLIGHT; REFERENCE_DESK README; TOOLBOX_TOOLKIT_ROUTER; CROSS_REPO_SCRIPT_EXECUTION_STANDARD; SHARED_STATE_WRITE_SAFETY; AUTOMATION_WORKFLOW_CONTROL; SCHEDULER_AUTHORITY_MUST_READ; MERSEARCH_WORKER_START_HERE; MERSEARCH_RELEASES; WRITE_ROUTE_SMOKE_TEST; TOOLBOX_INGESTION_NAMESPACE_PRIORITY; WORKER_AUTONOMY_HANDOFF_PROTOCOL; NO_CONVERSATION_RENAMING_POLICY; FACTORY_FLOOR_GEOMETRY_FIRST_GATE. Tags: CONTROLLING-DIRECTIVE; TOOL-ROUTE-PREFLIGHT; THREAD-FIRST; SCHEDULER-AUTHORITY; SHARED-STATE-WRITE-SAFETY; MERSEARCH-PROTOCOL; FACTORY-FLOOR-GATE.

Bounded existing-thread search: Loom workspace README/CURRENT_WORK/CONTINUITY/CHECKPOINT/INBOX plus prior-conversation context search found no authenticated usable current Loom thread. The archived LOOM Tag Conversation Corpus conversation is historical; the October 29 TOPLESS item is prior-context only and supplies no current thread pointer. Current automation chat_ref=null. Source-grounded revival in the scheduled turn was therefore used; no cross-thread delivery is claimed.

Write-route audit: the project protocol prefers a local checked-out Git/house route or the approved issue-publisher workflow. This runtime exposed no local Git push/checkout route; the issue publisher was used for public output, and direct GitHub connector writes were used as fallback for internal continuity/receipt files. The preflight audit occurred after the initial internal writes, a process-order deviation; future runs must perform this route check before the first write. No tool or dependency was built.
