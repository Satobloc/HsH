# Mercer h983:s3 | Dimensionally Typed Coupled-Readout Projection Gate

**Disposition at report freeze:** **ARCHITECTURE_PROPOSAL_COMPLETE / LEAN_VERIFICATION_PENDING / NO_PHYSICAL_INSTANTIATION / P2_HOLD**.

## 1. Deterministic selection and authority

- Nominal UTC hour: **h=983**.
- **seq=5h+3=4918**; **4918 mod 19 = 16**.
- Selected ring label: **Mercer**, index 16.
- Next ring label: **Ravel**, index 17.

The selected label is routing metadata, not authentication of a ChatGPT instance or thread. No authenticated current Mercer thread was established. This is assistant-level source-grounded reconstruction, not historical-instance participation.

The historical Mercer role source is the direct user message in the archived **Quantum Gravity and Experiments** conversation, conversation ID **6a3a2037-3698-83ea-924d-2cb8c4ac7701**, message **bb8ecf64-8863-4ee7-a078-ca8cc4104974**, dated 2026-10-01T20:56:07Z, in HsH raw export Git blob **d828fef5352045cb4d9486fdbeabd04043c4c119**. It assigns Mercer equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. These are direct historical user instructions, not a separately signed specialist charter.

The current Code Grurple roster still restricts Mercer to **Paper A/B presentation QA** while P0 is active. This run is a bounded, explicit Lane 36 architecture/proof overlay. It did not modify either manuscript, either public route, the site, the P0 acceptance state, or the release interlock.

## 2. Source and control preflight

The live HsH main snapshot before the run's durable writes was **22443e1627abd388f2bc0c17b985ed3c3221c504**. The current main snapshot at this report freeze is **4be8944c656d9cb730167a834f71d91ccfc18a4b**.

Read/reconciled:
- **BEDROCK.md**, current blob **bdfc6f401736aa4dd9de2bf23a7293b7f8919b07**.
- Steering Charter 2026-10-26, blob **be44c424674764c602b5f618dfce528c0f97b0ef**.
- Three Paper Campaign, blob **2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4**.
- New-instance onboarding, blob **43b577d42b8cced83f8836934598081685ea3ff3**.
- Revival Rotation V3, blob **7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14**.
- Revival Rotation V4 / not-found revival, blob **6761337dfcd0847226ee7baad84db0a9c496760a**.
- Thread-routing rules, blob **d9ea7c3a04e03822c65ee231d0b9545bf37907bd**.
- Current workflow orientation, blob **2bb6d996ca61f41b2b3fb34480cab1acf906bd4f**.
- Mersearch worker start instructions, blob **f7a3521f3d34f87c8de14c2ed548a8c253c344d3**.
- Code Grurple roster, blob **cc96c0bfafc95c54e7960899c7306031e5abce17**.
- Mercer README, continuity, and INBOX were read at the same main snapshot. No h983 predecessor packet addressed to Mercer was present in the INBOX/Common handoff index when checked.

The direct November 4-5 source family remains distinct from assistant synthesis:
- Authoritative raw export: conversation **6aea46dd-dc60-83ea-8d50-689c152340e3**, 5,160,151 bytes, raw-export SHA-256 **de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e**; source-custody report [Aster amendment](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-13T1400Z_SOURCE_CUSTODY_AMENDMENT_TO_1631.md), HsH blob **75a61b2c60f003af9bf1efc0a8110852892aafae**.
- November 4 mutual worldtube-timesheet curvature position: direct message **100388c5-89d6-4ffd-a895-598990636057**; corrected source locator is recorded in the Aster source-custody report.
- November 4 symmetric attribution clarification: direct message **72649a88-dc26-498f-9b5c-acd15e01e3c5**.
- November 5 carrier clarification: direct message **5e021f9e-6747-4a39-8df7-aabbd165d7b9**.

The source leaves worldline-only, timesheet-only, and mutually distributed descriptions open as candidate representations; the responsive medium/timesheet relation is unresolved. This work does not choose a carrier, infer equal physical contributions, or assert a physical equivalence.

One old SAT archive file was read in full: **DIMENSIONAL_NORMALIZATION.tex**, Git blob **52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1**, 1,455 lines / 29,224 characters. It is the 2026-09-09 methodology proposal **Metric Symmetry to Reveal the Grain**, not an established H(s)H result. It specifies one frozen coordinate normalization **w=ct** and constrains secondary transformations to recorded, invertible, universal or algebraically determined maps. The new per-channel scales below are measurement-space reference scales, not new physical coordinate maps; they must be source/calibration justified and frozen before holdout. No **w=ct** / **cw=t** convention was silently substituted or reconciled.

## 3. Substantive improvement: dimensionally typed joint readout

The existing [Coupling-Preserving Projection Gate v0.1](https://github.com/Satobloc/HsH/issues/2234) defines a joint readout **Q=(O,C)** containing an observable and a coupling signature, and requires both to survive a projection. The existing [Pairwise Discrimination Record v0.1](https://github.com/Satobloc/HsH/issues/2228) declares metric, unit, covariance, calibration, and holdout requirements, but its proposed contract did not yet provide a compiled product-valued factorization instance or a type-level guard for combining heterogeneous channels into one scalar discrepancy.

This run adds **Dimensionally Typed Coupled-Readout Contract v0.1**:

### 3.1 Joint factorization

For a projection **P : X → Y**, define **Q(x)=(O(x),C(x))**. The joint readout descends through the projection exactly when both components are constant on each projection fiber:

\[
P(x)=P(x') \Rightarrow
\big(O(x)=O(x')\ \land\ C(x)=C(x')\big).
\]

The same condition is instantiated separately for tube-only and sheet-only quotient maps. A same-fiber pair with a different coupling signature is a no-go witness for deterministic reduction of the joint readout, even if the scalar observable happens to agree.

This prevents a representation from being accepted merely because it preserves one scalar channel while discarding the structural relation on which the claim depends.

### 3.2 Heterogeneous dimensional channels

If observable and coupling residuals have dimensions **dO** and **dC**, the raw expression

\[
(\Delta O)^2+(\Delta C)^2
\]

has one scalar dimension signature only if **dO=dC**. The new formalization proves that equality of squared dimension signatures implies equality of the original dimension signatures.

If the dimensions differ, a scalar comparison requires separately declared positive reference scales carrying the same dimensions as their respective channels:

\[
D_Q^2 =
\left(\frac{\Delta O}{s_O}\right)^2+
\left(\frac{\Delta C}{s_C}\right)^2.
\]

The formal interface makes the result dimensionless by construction and proves nonnegativity. It does **not** select **sO**, **sC**, weights, a physical metric, or a likelihood. Reference scales must be justified from the source or calibration, frozen before confirmatory holdout, and never fitted to holdout outcomes.

If no defensible scale exists, retain a vector of componentwise residuals and predeclared thresholds rather than collapsing channels. If cross-channel covariance is material, use a dimensionally consistent covariance-aware metric; the diagonal expression above is not a substitute for covariance evidence.

### 3.3 What is and is not claimed

The product-valued readout theorem is a formalization of the existing CPPG requirement, not a new physical premise. The dimension-indexed scalar interface is a proposed measurement-comparison contract. It does not instantiate the H(s)H worldtube, timesheet, responsive medium, thickness profile, twist, contact law, or any geometry-to-observable map.

## 4. Lean 4 / Mathlib verification

A separate stacked draft PR was created without modifying Ravel's branch:

- [PR #2236](https://github.com/Satobloc/HsH/pull/2236), OPEN / DRAFT / UNMERGED.
- Branch: **research/mercer-coupled-readout-metric-20261120t2336z**.
- Current head: **dfbf715470d93b33006e170cf3504776f19195ff**.
- Base: Ravel branch **research/ravel-carrier-slice-reconstruction-20261031t0212z**, head **fc7f92722fe5e0757d55f961b54a12bdee66d5da**, associated with [PR #1133](https://github.com/Satobloc/HsH/pull/1133).
- New module: **FORMAL_VERIFICATION/HsHVerification/MercerCoupledReadoutMetric.lean**.
- The module imports Ravel's existing **RavelJointAccommodationReadout** and **RavelCouplingDimensionalAudit**; it does not modify either file.

The module contains:
- tube-only product-readout factorization iff both components are fiber-constant;
- sheet-only product-readout factorization iff both components are fiber-constant;
- coupling-difference and observable-difference no-go corollaries;
- dimensionless self-ratio and squared-ratio lemmas;
- equality-of-squared-dimensions implies equality-of-dimensions;
- nonnegative normalized diagonal product discrepancy.

**Verification status at report freeze: LEAN_VERIFICATION_PENDING.**

Three merge-reference workflow attempts were observed:
1. Run [#44838777695](https://github.com/Satobloc/HsH/actions/runs/44838777695), initial module revision, FAILED. The first source had an unfolding mismatch, real-division noncomputability, and reflexivity proofs where simplification was required.
2. Run [#44839250236](https://github.com/Satobloc/HsH/actions/runs/44839250236), corrected dimension definitions, FAILED. The remaining errors were the explicit product-equality versus componentwise-conjunction conversion in the tube/sheet corollaries.
3. Run [#44839744044](https://github.com/Satobloc/HsH/actions/runs/44839744044), current head **dfbf715470d93b33006e170cf3504776f19195ff**, completed dependency-manifest generation and was still IN_PROGRESS at **Install Lean and compile formal library**.

The first two builds used the default pull-request merge reference, not an exact-head checkout. The third is a **pull_request** event; its checkout step succeeded, but ref/depth/SHA had not yet been retrieved at report freeze, so no exact-head claim is made. The third run had advanced to **Install Lean and compile formal library** and was still IN_PROGRESS; no successful compilation of the new module is claimed, and the current PR remains unmerged. The new source file contains no **sorry**, but the first two failed builds emitted **sorryAx** for the product-readout theorems whose proofs did not elaborate. The dimensional subtheorems did elaborate in those failed module builds: the self-ratio lemmas reported **[propext]**, while the exponent-equality and normalized nonnegativity lemmas reported **[propext, Classical.choice, Quot.sound]**. These are not a successful module build. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. The parent Ravel branch retains its separately documented proof holes and conditional assumptions.

The local runtime had no Lean/Lake/Elan executable; the existing GitHub Actions Lean 4.34.0 / Lake 5.0.0 workflow is the verification route. A successful compile would establish only the formalized abstract statements, not soundness of the source-to-model translation or truth of physical premises.

## 5. Empirical and theory status

No measured system or dataset was selected. No source-derived H(s)H geometry-to-observable map, calibration, covariance, acquisition-unit identity, independent holdout, or numerical falsification threshold was instantiated. No physical calculation, fit, prediction, or independent measurement was performed. No synthetic physical fixture or data-free physical calculation was created.

P2 remains HOLD. The new contract does not promote any theory statement into BEDROCK. No SAT-O or Blockwave equation was modified, and no equation correction was merged into an original source record.

## 6. Existing infrastructure and access boundaries

- Mersearch was not callable in this runtime. The four existing request lanes remain occupied/requested; no request was overwritten, reset, retriggered, released, or represented as searched. Bounded direct repository reads are not Mersearch results.
- Math Hopper issue #578 and PR #991 were checked; existing extraction/Lean work remains the route, not a reason to build another tool.
- Whirligig Kernel 0 remains SANDBOX ONLY, not a general equation-to-curve encoder.
- SciSpace and Wolfram are available; neither was needed for this source-bound formalization.
- HsH, SAT archive, and HSH_RESOURCES root readmes and repository metadata were checked. All three report zero forks. HSH_RESOURCES root README only; no private-reference payload was accessed.
- No new tool, dependency, fork, subscription, or paid endpoint was introduced.
- Factory Floor's current geometry-first admission gate was checked. This abstract formal contract has no object-specific geometry plot or hostile review, so it is not Factory Floor eligible; no intake or promotion was attempted.

## 7. Clone / checkout reporting

The existing clone ledger was extended append-only and independently parsed: 100 JSONL rows, no parse errors, no duplicate event IDs at the last readback.

Observed checkout processes:
- Run #44838777695: **actions/checkout@v4**, fetch-depth 1, default PR merge ref **refs/pull/2236/merge**, checkout SHA **3a3c4f0992f8a7b044a48392a3711e5f2f80e34c**; Lean run later FAILED.
- Run #44839250236: **actions/checkout@v4**, fetch-depth 1, default PR merge ref **refs/pull/2236/merge**, checkout SHA **6a53bccc7e5225eb89fc9da14ec2b67c6cad5a32**; Lean run later FAILED.
- Run #44839744044: checkout step 2 completed successfully; checkout ref/depth/SHA were still awaiting decoded logs at report freeze.

The two confirmed checkout events have initial rows and log-backed revision rows in **WORKSPACES/COMMON/CLONE_LEDGER.jsonl**. The third has an initial observation row; a later log-backed supplement is required if its details become available.

Three push runs of **conversation-json-content-ci** (#44838759097, #44839245358, #44839737494) returned empty Jobs API arrays. They are recorded as **NO_JOB_RECORD_RETURNED / CHECKOUT_UNKNOWN / TRAFFIC_ATTRIBUTION_UNKNOWN**; an empty Jobs response is not proof that no checkout occurred.

GitHub connector/API reads are not classified as full clones. No local **git clone** was run. GitHub Traffic attribution, fresh-runner identity, and unique human cloner count remain UNKNOWN. The PWH queue and Tern's ownership were not changed.

## 8. Succession, publication, and safeguards

The next ring label is Ravel. The optional repository packet was committed at **2026-11-20T23:48:42Z**, before Ravel's h983:s4 provider run began at **2026-11-20T23:49:10.683712Z**. Amendment 01 verifies **PRESTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY**. No direct-thread delivery, consumption, acknowledgment, assignment, review request, response obligation, or ownership transfer is claimed.

Publication is through the existing issue publisher. The publisher receipt and canonical artifact must be independently read back before claiming PUBLISHED_VERIFIED; otherwise the status remains SUBMITTED_NOT_VERIFIED or REJECTED as actually observed.

Project gates remain:
- P0 Code Grurple: ACTIVE; Mercer Paper A/B presentation QA remains controlling and unchanged.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor-paper gate: MISSED.
- November 30 major measured-system gate: HOLD.
- December 14 full-theory gate: INCOMPLETE.
- FIE was reread November 20; next review target December 4.
- No unrelated-reading break was repeated; the prior reading cursor remains recent.

The existing :36 task identity, enabled state, exact hourly schedule, prompt, and phase were not changed. No other task, ID, schedule, cadence, or phase was changed. Four existing relay tasks remain enabled; :12 remains disabled. No sixth task, signet, or conversation rename.

**Final pin:** H983:S3 / MERCER-ASSISTANT-RECONSTRUCTION / DIMENSIONALLY-TYPED-JOINT-READOUT-V0.1 / PR2236-STACKED-DRAFT / LEAN-VERIFICATION-PENDING / NO-PHYSICAL-INSTANTIATION / P2-HOLD / CLONE-LEDGER-APPENDED / RAVEL-PRESTART-OPTIONAL / P0-UNCHANGED / TASKS-UNCHANGED / NO-SIXTH-TASK.
