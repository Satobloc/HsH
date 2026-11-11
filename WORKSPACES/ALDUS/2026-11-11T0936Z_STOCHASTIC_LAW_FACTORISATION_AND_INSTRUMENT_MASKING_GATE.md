# Aldus | h753:s3 | Stochastic law factorization and instrument masking

**Nominal slot:** 2026-11-11T09:36:00Z  
**Run key:** REVROT3-19-20261011:753:s3  
**Selected label:** Aldus, ring index 6  
**Successor:** Calder, ring index 7  
**Disposition:** METHOD ARCHITECTURE ADVANCE / EXISTING GENERIC LEAN THEOREM REUSED / REAL EXPERIMENTAL CANDIDATE / RAW DATA NOT RETRIEVED / NO P2 SELECTION / NO PHYSICAL VALIDATION.

## 1. Authority, source custody, and incoming context

The historical conversation is **Aldus [AUTO H(s)H Gitter]**, conversation 6a9dea2e-bb98-83ea-a74f-4beb4baa3153. The latest previously inspected raw-export snapshot is blob 2f5ea91a449446f64d298b50b0c2ef0d8533900a, containing 39 user-role messages. Direct user-role message fcff5c18-85c4-4efc-b7e5-df7ee20c0646 broadly endorses cross-disciplinary reading and explicitly favors combining information not usually combined.

No standalone signed Nathan-authored specialist charter was recovered. The raw-export path was re-fetched during this run and returned the expected blob SHA but an empty body. This report therefore relies on previously source-audited direct-message anchors and the Aldus check-in, not a fresh full raw-export transcription. No authenticated current Aldus ChatGPT thread was established. This is source-grounded assistant work, not historical-instance participation.

The current :36 architecture/prediction lane is a task-specific overlay, not a permanent rewrite of Aldus's broad historical remit.

Mira h753:s2 packet MIRA-H753-ALDUS-001 and its canonical receipt were read after this :36 execution had already started. They are POST_START_OPTIONAL_CONTEXT / OPERATIONAL_ONLY / QUARANTINE_HOLD_NO_PAYLOAD. Mira's historical charter and private research were not opened; no task, response obligation, or ownership was transferred. The predecessor :12 slot is disabled, so no h753:s1 predecessor handoff was expected.

## 2. Anti-duplication and the specific gap

This contribution is deliberately distinct from recent work:

- Aster h737 already established a deterministic 3D-to-2D measurement-operator sufficiency gate and complete-run stochastic holdout discipline for the rising-bubble/vortex-ring experiment.
- Nadir h750 already documented the GP-B segment-level nuisance/holdout leakage problem.
- Aldus h749 already separated first-extant/known-source chronology from first-public-release chronology.
- Aldus h750 already audited the conditional Lorentzian typing of an assistant-generated θ₄ contraction and the Blockwave primitive crosswalk.
- Loom h752 introduced the Claim Atomization and Scoring Contract (CASC), which freezes evaluation units and denominators.

The gap left open by Aster's work is the join between its deterministic factorization test and its stochastic outcome-distribution test. A stochastic holdout can compare predicted distributions, but a reduced representation is not thereby shown to preserve the distributional law. The missing question is whether the law itself is constant on the fibers of the proposed projection, and whether apparent sufficiency is physical or merely caused by a lossy instrument.

## 3. Law-valued factorization

Let:

- X be the admissible full physical-state space at the declared acquisition/run grain;
- R be a candidate reduced representation;
- π: X → R be the declared projection/coarse-graining;
- Y_phys be the physical outcome space;
- Y_obs be the recorded-data space;
- K_phys: X → P(Y_phys) be the physical outcome law;
- M be the instrument/observation Markov kernel;
- M_* be its induced map on probability laws;
- K_obs = M_* ∘ K_phys: X → P(Y_obs) be the observed-data law, when that instrument composition is actually specified.

For either law-valued map K: X → P(Y), an exact reduced law Kbar on the range of π exists precisely when:

K = Kbar ∘ π

which is equivalent to:

π(x₁) = π(x₂)  ⇒  K(x₁) = K(x₂)

for every admissible pair x₁,x₂ in X.

This is the existing fiber-compatibility/factorization theorem with its codomain Z instantiated as a type of probability laws. It is not a new theorem. The distinction from a deterministic readout is the codomain: the target is the complete probability law, not one realized value, a mean, or a selected moment.

### The instrument-masking distinction

Three cases must not be collapsed:

1. **Physical-law sufficiency:** K_phys is constant on every π-fiber.
2. **Observed-law sufficiency:** K_obs is constant on every π-fiber.
3. **Instrument masking:** there exist x₁,x₂ with π(x₁)=π(x₂), K_phys(x₁) ≠ K_phys(x₂), but M_*K_phys(x₁)=M_*K_phys(x₂).

In case 3, the instrument erases a distinction that remains in the physical outcome law. The reduced representation may be sufficient for that instrument's recorded distribution while being insufficient for the underlying physical law or for state reconstruction.

Therefore:

- Predictive sufficiency does not imply injective state reconstruction.
- Observed-law sufficiency does not imply physical-law sufficiency.
- A lossy instrument can conceal differences between candidate geometries.
- Agreement of a few moments does not establish equality of full distributions unless those moments were predeclared as the complete target statistic.

The instrument kernel, calibration, and nuisance structure must be explicit. If M is not independently constrained, INSTRUMENT_MASKING_UNRESOLVED is the correct disposition.

## 4. Exact theorem versus approximate empirical test

The exact theorem covers exact fiber-constancy. Real finite-data work will normally need an approximate test, for example:

sup over π(x₁)=π(x₂) of D(K(x₁),K(x₂)) ≤ ε,

where D is a predeclared distributional discrepancy and ε is set from the actual instrument uncertainty, calibration, and power analysis.

This approximate condition is a proposed empirical gate, not a Lean theorem or a calculated result. Neither D, ε, nor a numerical threshold is selected here. The choice must be fixed before the holdout is unsealed. The unit must be an independent acquisition run where the source experiment is stochastic, not adjacent frames from one movie.

## 5. Application to the measured 3D-LPT candidate

The real candidate is Estepa-Cantero et al., “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” Journal of Fluid Mechanics 1045 (2026), A27, DOI 10.1017/jfm.2026.12078. Published online 2026-10-16; issue publication 2026-10-25.

The existing Aster h737 report identifies:

- four frontal cameras feeding 4D-LPT / Shake-The-Box liquid-particle reconstruction;
- six cameras feeding MLOS bubble tomography;
- a transition region in which capture/release/breakup is stochastic;
- a warning that fixed 2D-PIV planes can miss out-of-plane motion, loss of axial symmetry, and localized bubble effects;
- three published illustrative cases that are not a replicated factorial design or a valid train/holdout split.

The inspected public source did not provide a verified full 4D-LPT track deposit, per-run calibration package, complete acquisition/run IDs, or joint covariance. No raw movies, tracks, calibration files, or data package were downloaded or analyzed in this run. The three illustrative cases are not treated as independent validation data.

The new gate asks two separate questions of any future 3D-to-2D reduction:

1. Does the physical outcome law factor through the reduced representation?
2. Does the recorded-data law after the actual instrument operator factor through it?

The second cannot answer the first unless the instrument map is sufficiently characterized. A 2D summary that predicts the recorded outcome distribution may still conceal physical distinctions that the 3D system retains.

Required before a test: full run-level tracks and outcomes, acquisition IDs, per-experiment calibration and camera metadata, the reconstruction/measurement operator, uncertainty and covariance information, and enough independent transition-region runs for a predeclared power analysis. Until then this is a source-grounded experiment-design gate, not a calculation or H(s)H prediction.

## 6. Consequence for the H(s)H shape hierarchy

For a declared target law K, distinguish a minimal representation π₀ from refinements that add finite-core thickness, twist/connection, or contact/medium structure.

- If K factors through π₀, the extra structures are not required for that target law at that readout and resolution.
- If K does not factor through π₀ but does factor through a source-defined refinement π₁, the refinement is a candidate requirement for that target, not a universal ontological proof.
- If only K_obs factors after the instrument kernel while K_phys does not, classify the result as instrument-masked, not as evidence that the underlying geometry is simpler.
- If no candidate map factors, the representation, physical law, or instrument chain is incomplete or wrong; do not add arbitrary flexibility until the failure is diagnosed.

A thickness, twist, or contact feature is not FORCED merely because it improves calibration fit. A target-specific extension requires: an explicit source-defined map; identifiable sensitivity not absorbed by shared/nuisance/calibration directions; a frozen standard comparator; and independent run-level predictive success. Otherwise use OPTIONAL, UNIDENTIFIED, or UNRESOLVED.

No H(s)H physical map was instantiated here. Worldtube thickness, twist, and contact remain unvalidated for this experiment. No P2 system was selected; P2 remains HOLD.

## 7. Formal verification and limits

Existing source: Kestrel PR #873, FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean, module blob 0fe5390faa10113830132b12cdb98172194adfee.

The source declares hallway_factorization_iff_fiber_compatibility with arbitrary codomain Z, and a companion uniqueness theorem. Consequently the formal statement applies unchanged when Z is a probability-law type. The Lean specialization is the existing theorem applied to K: X → P(Y); no new theorem is needed for exact law-valued factorization.

Existing exact-PR-head verification was rechecked through GitHub Actions:

- Run #41468951678, job #125357139451: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0.
- Full library build: 8,954 jobs.
- The factorization theorem's recorded axiom footprint includes Classical.choice; uniqueness includes Quot.sound.
- PR #873 remains OPEN / DRAFT / UNMERGED.

No local Lean/Lake/Elan toolchain is installed in this runtime. No new Lean code or compilation was performed in this run. The prior exact-head build verifies the generic formal theorem, not this physical interpretation, the Markov-kernel composition, the actual camera operator, or the experiment's data. The approximate divergence test and the physical/instrument maps remain unformalized and unvalidated.

## 8. Tool, campaign, and maintenance disposition

- Mersearch was not callable in this runtime; all four shared request lanes remain occupied. GitHub search/fetch was used only as a bounded fallback and is not represented as a Mersearch run.
- Existing Kestrel PR #873 and Nadir PR #1189 were inspected; no duplicate theorem or new PR was created.
- Math Hopper #578 / PR #991, Whirligig Kernel 0, and existing SciSpace capability were checked before proposing any new tooling. No new tool, fork, dependency, subscription, or paid service was created.
- FIE rereview was completed 2026-11-10; next review due 2026-11-24.
- Unrelated reading: SAT archive SAT Mark V/TheTANGLE.txt, requested lines 2091–2130. This is a creative transcript excerpt, not theory evidence. Next cursor: line 2131.
- P0 Code Grurple remains ACTIVE. P1 November 9 cognition remains OVERDUE / NOT READY and Orson-owned. P2 November 30 geometry remains HOLD. P3 December 14 full theory remains INCOMPLETE.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation modification, manuscript edit, paper-gate advancement, or BEDROCK promotion occurred.

**Return pin:** H753:S3 / ALDUS / CALDER-NEXT / MIRA-POST-START-OPTIONAL-OPERATIONAL-CONTEXT-CONSUMED / LAW-VALUED-FIBER-FACTORIZATION / PHYSICAL-LAW-VS-OBSERVED-LAW / INSTRUMENT-MASKING / EXISTING-KESTREL-THEOREM-REUSED / EXACT-HEAD-CI-EVIDENCE-RECHECKED / NO-NEW-LEAN-BUILD / 3DLPT-RAW-DATA-NOT-RETRIEVED / P2-HOLD / P0-ACTIVE / P1-NOT-READY / P3-INCOMPLETE / FIE-NOV24 / THE-TANGLE-CURSOR-2131 / NO-THEORY-PROMOTION
