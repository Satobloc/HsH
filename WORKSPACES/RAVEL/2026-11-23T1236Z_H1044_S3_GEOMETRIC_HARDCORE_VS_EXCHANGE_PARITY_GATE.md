# Ravel h1044:s3 — geometric hard-core exclusion versus exchange parity

**Nominal UTC slot:** 2026-11-23T12:36Z  
**Run key:** REVROT3-19-20261011:1044:s3  
**Selected ring label:** Ravel (index 17)  
**Next ring label:** Orson Vay (index 18), h1044:s4  
**Disposition:** FORMAL_COUNTEREXAMPLE_AND_POLARIZATION_GATE_COMPILED / SOURCE_HYPOTHESIS_PRESERVED / PHYSICAL_MAP_ABSENT / P2_HOLD

## 1. Role, authority, and source coverage

Ravel is a deterministic ring label, not an authenticated model, instance, or thread. The scheduled execution had no authenticated Ravel thread reference. No direct-thread delivery, historical-instance continuity, or cross-thread acknowledgement is claimed.

No standalone signed Ravel specialist charter was found. The historical remit was recovered from direct user-role messages in the Ravel Syncmathcek conversation, 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f, raw export SHA-256 b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba, Git blob 17cfe3feb830f70009557d063482b35adba0834b. Direct role-setting messages identify Ravel as primary co-theorist (2026-09-07T22:30:51.036Z, message 638d13ba-1541-483d-853f-3b6d04b9b1b2) and expand the remit toward conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, methodological risk, skill specialization, and source lineage (2026-09-08T09:27:54.450Z, message c5639160-5631-4373-90c2-68d7c4c022de). These are historical user-role sources, not a signed charter or evidence of current-thread authentication.

The live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, revival V3/thread-first controls, Ravel README/STATE/CONTINUITY/INBOX, current main, current Ravel PR branch, recent receipts, and the available historical role/source records were read. The three-repository front doors were checked. SAT archive README, AI-files ORIENTATION/RESOURCES/WAYFINDING, and HSH_RESOURCES root README/AI start page were read. HSH_RESOURCES was treated as a private reference boundary: no private source payload or PRIOR_ART document was opened or used.

Mersearch was checked first, but no callable Mersearch action was available in this execution context. The four canonical request lanes were occupied; none was overwritten, released, retriggered, or created. The source evidence below comes from the existing source-fidelity extraction and verified batches, not from a new Mersearch result.

## 2. Nathan Direct source: preserve the proposal as a proposal

The relevant direct user message is c0d7fc1c-dc72-4cc7-b2a0-1e2cb686be4e, 2026-09-07T08:28:03.333Z, recipient all. It appears in the existing extraction WORKSPACES/COMMON/extraction_outputs/2026-09-13-RAVEL-AFTER-025946.md at lines 817 onward, with author.role=user:

> The Kerr core = Pauli exclusion (I'm thinking, however, that this is ultimate Pauli exclusion, obeyed even by standard bosons, but just on a much smaller scale than the coil semi-impermeability, which is probably what the classic Pauli is)
>
> The shell structure = ~closed string  
> Shell structure deformation ~ vibration modes from ST

The wording is expressly exploratory: “I'm thinking,” “probably,” and the approximation marker “~” remain part of the source status. This is not a derived equivalence.

A separate direct correction, b9805319-9d77-4b43-874a-5af50c0b6ef7, 2026-09-07T08:06:58.114Z, says filament and timesheet distortions are necessary mutual accommodation as the two primitives exert force, and “The force is the true primitive.” This run does not rewrite the carrier ontology or invent a constitutive law.

The earlier Ravel source-fidelity report, WORKSPACES/RAVEL/2026-11-23T0500Z_H1037_S0_KERR_CORE_COIL_PERIODICITY_PAULI_STRING_FIDELITY.md, correctly retained the Kerr/Pauli and shell/string correspondences as hypotheses. This run adds a formal negative result to the Pauli branch; it does not promote the source proposal.

## 3. Standard quantum comparator

For identical particles, exchange acts on the complete one-particle labels, including spatial coordinates and spin. Fermionic amplitudes are exchange-odd; bosonic amplitudes are exchange-even. Pauli exclusion follows for two identical fermions occupying the same complete one-particle state. It is not a general rule that two particles with different spin labels cannot occupy the same spatial point.

Reference: James Binney and David Skinner, The Physics of Quantum Mechanics, Chapter 10, section 10.1.1, especially equations (10.4)–(10.12), pp. 227–229. The text explicitly swaps both spatial and spin labels, derives the fermion/boson signs, and derives the Pauli consequence. Public Oxford-hosted PDF: https://www-thphys.physics.ox.ac.uk/people/JamesBinney/qb.pdf

This makes Nathan Direct's two proposed exclusion scales importantly different:

- Kerr-core “ultimate exclusion,” even for ordinary bosons: if retained as a species-independent hard-core constraint, it is an additional H(s)H prediction, not ordinary Pauli exclusion. Standard bosonic exchange symmetry permits occupancy of the same complete one-particle state.
- Coil semi-permeability as “classic Pauli”: this needs a map into the fermionic exchange-odd sector, including spin/internal labels. A spatial non-overlap rule alone is not that map.

## 4. Substantive formal result

Added FORMAL_VERIFICATION/HsHVerification/RavelGeometricExclusionExchange.lean to Ravel's existing draft PR #1133 and imported it in the verification aggregator.

The finite algebraic model uses Fin 2 × Fin 2 configurations and executable integer-valued amplitudes. It defines:

- HardCore: zero amplitude on the diagonal in one fixed configuration basis;
- ExchangeEven: invariance under swapping the two labels;
- ExchangeOdd: sign reversal under swapping the two labels.

Two explicit, nonzero witnesses satisfy the same fixed-basis hard-core condition:

1. an exchange-even witness;
2. an exchange-odd witness.

The compiled theorem hardCore_does_not_select_exchange_parity therefore establishes that this fixed-basis diagonal-zero condition does not determine fermionic exchange parity. The converse direction is also proved: exchangeOdd_forces_hardCore.

A second result, allSuperpositionDiagonalZero_forces_skew, gives the stronger two-dimensional polarization gate. For a 2×2 bilinear coefficient matrix, if its diagonal quadratic vanishes for every superposition (x,y), then its off-diagonal coefficients sum to zero, so the matrix is skew-symmetric. This identifies a much stronger condition than merely zeroing the diagonal in one fixed basis.

The finite counterexample is an abstract algebraic witness, not a physical fixture, a Hilbert-space model, a spin-statistics derivation, or evidence that an H(s)H core is bosonic or fermionic. The integer scalar type is used to make the finite witness genuinely executable; it is not asserted as a physical amplitude field. The polarization theorem is a 2×2 algebraic condition, not a full quantum-mechanical derivation.

### Actual Lean run

PR #1133 verification run #45186541338 completed SUCCESS.

- Lean 4.34.0; Lake 5.0.0.
- Full library build: 8,957 jobs.
- The new module built at job step 8955/8957; the aggregate HsHVerification target completed.
- Actual executable #eval output: (1, 1).
- Four theorem-specific #print axioms outputs were inspected. They contain only standard propext, Classical.choice, and Quot.sound dependencies as applicable.
- No sorryAx, admit, or Lean error appeared in the module/build log.
- Tests, lint, leanchecker, nanoda, and a separate global axiom audit were skipped.

**Build qualification:** the workflow is a pull-request merge-reference build, not a standalone exact-head build. The new module blob at PR head e22fb5544185655d19a951dc4235ce876b22b6ed is a6117aae596cf262de07113a7dd9658de05b5f97, exactly matching the module blob in merge checkout 25e618fa5e01905e4afb51362c33ddac8754f125. The import is present in both PR-head and merge-reference aggregators; those aggregator blobs differ because the merge base contributes four additional imports. No exact-head-only build is claimed.

The initial real-valued #eval attempt was superseded: Lean compiled the theorem, but evaluation reduced to an opaque Real.ofCauchy placeholder rather than a useful numeric run. The module was corrected to use executable integer witnesses and the polarization gate, then rebuilt successfully. The corrected #eval result above is the one retained.

PR #1133 remains OPEN / DRAFT / UNMERGED. The branch remains research/ravel-carrier-slice-reconstruction-20261031t0212z; latest head e22fb5544185655d19a951dc4235ce876b22b6ed. An informational PR comment records the build and limits. No formal review, approval, merge, or theory promotion occurred.

## 5. Geometry-to-quantum map contract and independent test matrix

The theorem exposes the missing map rather than filling it with analogy. A Pauli-like correspondence needs a source-authorized map from geometric two-particle configurations into a complete quantum state space and an exchange action that swaps all relevant labels. For fermions, the image must lie in the exchange-odd sector. If the proposed geometric constraint is intended to imply antisymmetry, it must be strong enough to survive arbitrary superpositions/complete one-particle basis changes, not merely enforce non-overlap in one chosen spatial representation.

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification / readiness |
|---|---|---|---|---|---|
| H0: fixed-basis hard-core geometry alone selects Pauli parity | None; abstract algebra only | Not applicable; finite formal counterexample | Exchange parity of the two-label amplitude | Exchange-even and exchange-odd sectors both exist | Formal claim falsified: same diagonal-zero constraint admits both parities |
| H1: coil semi-permeability maps to ordinary Pauli exclusion | Same atomic Hamiltonian, spin labels, external fields, and instrument model as standard comparator | Not scoreable until the geometric-to-state map is fixed; calibration and independent transition holdout must then be frozen | Singlet/triplet energies, transition frequencies, and exchange-sensitive selection rules | Antisymmetrized two-electron quantum states plus the standard atomic/QED Hamiltonian | Fails if no map preserves the full exchange action, or if frozen holdout predictions miss measured transitions beyond the declared uncertainty |
| H2: Kerr core gives species-independent “ultimate exclusion” | Same interaction, density, trap, and instrument parameters as the bosonic comparator | No bosonic dataset selected; a future pair-correlation/scattering dataset must separate calibration from holdout | Short-separation pair correlation or scattering suppression, including bosonic same-state occupancy | Standard symmetric bosonic states, which permit same-state occupancy | Fails if the predicted core suppression is absent on independent data; no threshold can be set until the H(s)H response law and uncertainty are specified |
| H3: shell deformation maps to closed-string vibration modes | No shared parameter map yet | No measured system or mode dataset selected | A mode spectrum and its boundary-condition dependence | Closed-string worldsheet dynamics and periodic mode spectrum | Not scoreable until shell dimension, worldsheet projection, action, boundary conditions, and mode-preserving map are explicit |

### Candidate measured system, not yet a locked dataset

A plausible future anchor for H1 is the two-electron 4He system:

- Clausen et al., arXiv:2501.02983 (version 3, 2026-03-22), report a measured ionization frequency for metastable (1s)(2s) 3S1 helium of 1,152,842,742.7082(55)_stat(25)_sys MHz.
- The same preprint reports a QED comparator of 1,152,842,742.231(52) MHz and describes a 9σ discrepancy. That reported discrepancy is not H(s)H evidence and is not used as a validation target here.
- The paper describes cold-supersonic-beam spectroscopy, Rydberg-series extrapolation, and SI-traceable frequency calibration.
- Source: https://arxiv.org/abs/2501.02983

NIST ASD SRD 78, version 5.12, is a useful secondary He I level/transition index, but it is not a single raw acquisition package; individual entries require source and uncertainty classification, and some tabulated values are derived from theory. https://physics.nist.gov/PhysRefData/ASD/

The raw spectra/acquisition manifest and complete covariance package for a joint singlet/triplet holdout were not retrieved. The candidate is therefore DATA_RECONNAISSANCE_ONLY, not a selected P2 dataset. No fit, physical calculation, H(s)H prediction, uncertainty propagation, or numerical falsification threshold was performed.

## 6. String correspondence remains separate

The shell/closed-string and shell-deformation/string-vibration proposals were not formalized in this run. Before testing them, the shell must be typed as a spatial surface or spacetime worldvolume, and an explicit projection/embedding into a 2D string worldsheet must be supplied where needed. The map must preserve the relevant periodic boundary condition, action, mode labels, and spectrum. A closed shell is not automatically a closed string; a shell deformation is not automatically a string oscillator.

No S1/S2 shell topology was selected. No new SAT-O or Blockwave equation was copied, corrected, or promoted.

## 7. Campaign, tools, and boundaries

- P0 Code Grurple remains active; this work did not touch its protected release controls.
- P1 cognition remains overdue/frozen/not-ready and Orson-owned. Because Orson is the next ring label, no handoff or inbox entry was created that could divert his protected cognition remit.
- P2 November 23 first-draft/hostile-review checkpoint is not satisfied by this research note. P2 November 30 remains HOLD.
- P3 December 14 full-theory paper remains incomplete.
- FIE rereview is not due: latest full review 2026-11-20; next target 2026-12-04. The unrelated-reading break was completed 2026-11-21; neither was repeated.
- Existing Ravel PR #1133 and #2309, Math Hopper #578 / PR #991, and Whirligig Kernel0 were checked. HsH reports zero forks. SciSpace is available, but no literature-search task required it. No new tool, dependency, fork, subscription, or expense was introduced.
- No private HSH_RESOURCES payload was opened. No Mersearch request lane was changed.
- No physical calculation or fabricated fixture was used. No BEDROCK, SAT-O, Blockwave, task, schedule, phase, or ownership change was made.

## 8. Scheduler and return position

The existing Workshop Relay :36 task remains enabled with ID 6a9f52b69ec08191b0a2ba24a074f781, its original hourly America/New_York :36 schedule, and Worldtube phase. The current execution was associated with the nominal 2026-11-23T12:36Z occurrence; it started late. No task ID, prompt, cadence, phase, enabled state, or ownership was changed. No sixth task was created.

**NOW:** the fixed-basis hard-core/Pauli non-implication and the stronger all-superposition polarization condition are formally compiled and recorded.

**NEXT:** recover a source-authorized geometric-to-state map with complete spin/exchange labels; only then can the helium candidate be turned into a frozen calibration/holdout test. The shell/string map remains a separate obligation.

**STOP:** no Pauli equivalence, no universal boson-exclusion claim, no string equivalence, no physical prediction/fit, no P2 promotion, no BEDROCK change, and no Orson handoff.

**RETURN:** PR #1133, Lean run #45186541338, the Ravel source-fidelity report, and this report/receipt.
