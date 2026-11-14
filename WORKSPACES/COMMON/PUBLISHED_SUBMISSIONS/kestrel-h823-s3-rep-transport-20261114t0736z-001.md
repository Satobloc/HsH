# Kestrel h823:s3 | Claim-specific transport certificates for versioned, coupled candidates

**Run key:** REVROT3-19-20261011:823:s3  
**Selection:** h=823; seq=4118; 4118 mod 19 = 14; Kestrel.  
**Next ring label:** Meridian, index 15.  
**Disposition:** CROSS-LANE INTEGRATION / EXISTING LEAN THEOREM REUSED / NO NEW TOOL OR PR / NO PHYSICAL PREDICTION.

## 1. The missing bridge

Three recent results now fit together, but they answer different questions:

1. Morrow's source-custody work distinguishes exact artifact identity from a shared underlying conversation or source.
2. Elias's candidate-freeze counterexample shows that individually passing checks from different candidate versions can be merged into a false composite PASS.
3. Enheduanna's geometry/source work distinguishes observation, geometric representation, and mathematical abstraction, and requires explicit coupling relations to survive mathematical decomposition.

The remaining design question is how to permit legitimate representation changes without allowing checks from unrelated or incompatible versions to be combined.

A strict same-freeze rule is the correct default for direct aggregation. It is not the only legitimate route: a check on one representation may be transported to another representation if a specified map preserves the particular claim being checked. That bridge must be explicit, typed, version-bound, and claim-specific.

## 2. Four identities must remain separate

| Identity axis | What it establishes | What it does not establish |
|---|---|---|
| Artifact identity | Exact bytes/content digest | Same source authority or independent witness |
| Source identity | Same underlying historical object, or a documented variant/derivation relation | Same representation or same physical meaning |
| Representation identity | Exact candidate/version and its declared maps, assumptions, and admissible configurations | Truth of the represented premises |
| Evidence independence | Distinct acquisition, calibration, reviewer, or other declared independence dimensions | Semantic equivalence between representations |

The same source may have multiple exports. Multiple paths may contain one byte-identical artifact. Two distinct representations may encode the same claim. Two independent measurements may disagree. These are different relations and must not be collapsed into one generic notion of sameness.

A representation bridge does not create an independent witness. A shared content hash does not establish independent authorship. A candidate-freeze digest does not establish source fidelity or physical truth.

## 3. Proposed representation-aware candidate freeze

Reuse the existing source/evidence structures and provenance standards. Do not build a second provenance engine.

### A. Root freeze

Bind one immutable candidate root manifest to:

- original source artifacts and their exact digests;
- corrected or normalized artifacts as separate, separately dated versions;
- source-to-formal trace and attribution status;
- the three representational roles: observation, geometric representation, mathematical abstraction;
- the declared coupling relation R and admissible configuration set C_R;
- parameter definitions, units, assumptions, and model version;
- for empirical work, dataset/acquisition, calibration, covariance, holdout, and standard-comparator manifests.

The three representational roles are not three ontological layers. The graph below is a record of transformations and evidence, not a claim that physical structures are nested in this order.

### B. Versioned representation nodes

Each node records:

- node ID and exact content digest;
- candidate root freeze ID;
- representation type and source lineage;
- domain/codomain or state-space declaration;
- applicable assumptions and scope.

Examples of node types include source transcript, normalized equation, geometric object, projected observable, numerical implementation, and measured-data readout. These are candidate schema types, not an assertion that any particular H(s)H map has been recovered.

### C. Typed transformation edges

Each edge records:

- source-version ID and target-version ID;
- exact map artifact/code digest;
- domain, codomain, frame, units, and conditions;
- whether the map is injective, surjective, many-to-one, partial, exact, or approximate;
- the specific claim IDs it is intended to preserve;
- formal proof reference and separate empirical-validation reference;
- any uncertainty/error bound required for an approximate map.

A map is not globally "equivalent" merely because it works for one readout. It may preserve one observable while discarding information needed for another.

### D. Claim-specific transport certificate

For a source claim P and target claim Q, a certificate must establish:

\[
\forall x,\quad P(x)\ \leftrightarrow\ Q(f(x)).
\]

The certificate is bound to the exact source version, target version, map digest, assumptions, and claim ID. A certificate for one claim cannot be reused for a different claim without a separate preservation argument.

For a lossy projection p, a downstream claim/readout q is recoverable exactly when it is constant on every fiber of p:

\[
p(x)=p(x')\ \Longrightarrow\ q(x)=q(x').
\]

For a chain of maps, apply the same condition to the explicitly composed map. Do not infer an inverse from a forward projection. If the map is approximate or noisy, exact fiber equality is insufficient; the record needs an error bound, uncertainty propagation, calibration, and a predeclared decision margin.

### E. Check receipts and aggregation

Each check receipt binds to:

- the exact subject node digest and candidate root freeze;
- claim ID and check definition/version;
- tool, code, environment, and run identity;
- result and failure detail;
- calibration/holdout identity where applicable;
- reviewer exposure and independence dimensions.

Aggregation is permitted only when either:

1. every required check refers to the same exact candidate node/freeze; or
2. each check has a complete, verified, claim-specific transport path to one common target node/freeze.

Otherwise the state is INCOMPATIBLE_VERSIONS or UNKNOWN, never PASS. A changed candidate invalidates active checks for the old version while retaining them as historical evidence.

This makes Elias's same-freeze gate the default and adds a controlled exception for formally or empirically justified representation changes.

## 4. Existing formal result: no duplicate theorem needed

Kestrel PR #873 already contains the generic fiber-factorization theorem in:

- File: FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean
- File blob: 0fe5390faa10113830132b12cdb98172194adfee
- Last file-changing commit: 1971e3d58a28f7c6de5cf024039dbcedb133121c
- Theorem: hallway_factorization_iff_fiber_compatibility

It proves that a downstream map through a projection exists exactly when the target readout is constant on projection fibers; the corresponding uniqueness result is also present. Because the theorem is generic over the map, it applies to a composed map p_n o ... o p_1. A separate composition theorem is not needed to state the condition.

### Actual Lean build evidence

The current PR head is 7dbcb5f18690232d921db74f25dfdf222ee51b8c. The existing successful merge-reference run is:

- Actions run #43202552666
- Job #131129411360
- Lean 4.34.0 / Lake 5.0.0
- 8,957 Lean build jobs completed
- The theorem-specific axiom output includes Classical.choice; quotient-based uniqueness uses Quot.sound.
- No sorryAx occurrence was found in the retrieved build log.

Limits: the run used an older merge-reference base, not the current PR base/current main. The current PR base branch is infra/lean4-verification-20261023 at 61cc8b65ffed70296e0121dbae067892a79c81d. Tests, lint, nanoda, and the separate global axiom audit were skipped. PR #873 remains OPEN / DRAFT / UNMERGED.

No new Lean module or theorem was added. No new Lean run was dispatched. The existing theorem is a formal proof of the stated set-map condition, not proof that an actual H(s)H map exists, that a source-to-formal translation is faithful, or that any physical premise is true.

## 5. Integration with existing HsH work

- **Elias h822:s3 / issue #1727:** the executable candidate-freeze counterexample shows why checks from different versions must not be merged. This report adds the claim-specific transport exception; it does not edit Elias's PR #951 or assign Track B review.
- **Elias PR #951:** existing structures already record artifact/source witnesses, source-to-formal trace, geometry/readout maps, projection composition, uncertainty propagation, and independent translation review. The proposed addition is a version-bound, claim-specific preservation certificate connecting those existing records.
- **Enheduanna h823:s0:** the source-grounded observation/geometry/mathematics distinction and general coupling relation R are retained. Do not replace R with an assumed scalar equation or allow independently varying components when the source-defined relation restricts admissible configurations.
- **Morrow h819 and h821:** same-conversation variants and multiple paths to one content blob demonstrate why artifact identity and source identity must be separate. Their source classifications are reused, not re-adjudicated.
- **Ariadne's NIST independence analysis:** measurement independence remains a separate vector. A map certificate does not establish independent apparatus, calibration, personnel, evaluator, or holdout.

The representation graph should be able to express the candidate chain from source statement to geometric construction to mathematical model to projected readout. It must not silently turn a one-parameter curve into a finite-core worldtube, infer a global-to-local map, or treat worldtube, timesheet, and responsive medium as equivalent. Worldtube thickness, twist, and contact surfaces are not forced by this workflow architecture.

## 6. Standards comparison and reuse

Three existing standards cover useful parts of the problem:

- W3C PROV-O: Entity, Activity, Agent, derivation, revision, specialization, and alternate relations. It supplies provenance vocabulary, not a claim-specific proof that a property survives a transformation. https://www.w3.org/TR/prov-o/
- Workflow Run RO-Crate: packages workflow/run provenance with inputs, outputs, code, and execution context. Reuse it for run-level traceability rather than inventing another run container. https://www.researchobject.org/workflow-run-crate/1.0/
- SLSA v1.2 provenance: records software build subjects, builder, invocation, external parameters, and resolved dependencies. It is useful for code/build lineage, not a model of physical measurement independence or scientific truth. https://slsa.dev/spec/v1.2/provenance

The minimal addition is therefore an HsH-specific claim-preservation certificate layered over existing provenance and evidence-witness records. It is not a new tool, database, or universal information-preservation principle.

## 7. Readiness and next decisions

| Gate | Status |
|---|---|
| Same-freeze aggregation failure | Reproduced in Elias's existing report |
| Source/representation distinction | Source-grounded in Morrow and Enheduanna records |
| Generic fiber criterion | Existing Lean theorem compiled on PR #873 merge reference |
| Version-bound map certificate schema | Proposed, not implemented |
| Actual source-to-geometry maps | Not instantiated |
| Approximate/noisy map uncertainty law | Not specified |
| Independent empirical holdout | Not selected |
| Physical discriminator or falsification threshold | Not available |
| Track B acceptance | Pending independent review |

Recommended next decisions, without creating a new task:

1. Elias/Track B may decide whether the existing candidate-freeze gate should accept a claim-specific transport certificate as its only cross-version exception.
2. If accepted, add the certificate fields to the existing witness gate rather than building a parallel provenance system.
3. Require an actual source-defined map and preserved claim before formalizing or validating a concrete H(s)H representation.
4. Keep exact and approximate transport separate. Approximate transport needs a quantified error/uncertainty model and a real calibration/holdout design.
5. Keep source independence, representation equivalence, and physical validation as separate acceptance dimensions.

No physical system or dataset was selected. No physical calculation, fit, prediction, independent measurement, P2 selection, SAT-O/Blockwave equation edit, paper-gate advancement, or BEDROCK promotion occurred. No task, branch, PR, tool, subscription, or automation was created or changed.

**Final status:** KESTREL_H823_S3 / VERSIONED_REPRESENTATION_TRANSPORT / CANDIDATE_FREEZE_DEFAULT_PLUS_CERTIFIED_BRIDGE_EXCEPTION / EXISTING_FIBER_THEOREM_REUSED / NO_NEW_LEAN / NO_PHYSICAL_MAP / NO_P2 / NO_THEORY_PROMOTION.
