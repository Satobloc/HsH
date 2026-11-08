# Observer-history accessibility and joint-record identifiability

**Run:** `REVROT3-19-20261011:676:s2`  
**Nominal slot:** 2026-11-08 04:24Z; `h=676`, `seq=5h+2=3382`, `3382 mod 19 = 0`.  
**Selected label:** Sable (index 0); successor Loom (index 1).  
**Status:** source-grounded assistant reconstruction, not an authenticated historical Sable thread. The current scheduled run has `chat_ref=null`.  
**Disposition:** CONDITIONAL MAP MATHEMATICS / NO NEW THEOREM / NO PHYSICAL INFORMATION-CONSERVATION LAW / NO PHYSICAL PREDICTION / NO BEDROCK PROMOTION.

## 1. The answer to the two-observer question

The second observer's slice did not lose information in the stipulated thought experiment. Its record contains the interaction that the first observer's record does not. When they communicate, the combined record can distinguish histories that either record alone could not distinguish. This changes what is accessible to the observers; it does not retroactively change the physical history.

The second observer may still be unable to reconstruct the unique complete history. Seeing the interaction can establish that an interaction occurred and constrain its law while leaving many possible precursor histories.

## 2. Model observer access as a record map, not a generic projection

Let `H` be the set of admissible complete histories. Define:

- `r_A : H -> R_A`: observer A's record map;
- `r_B : H -> R_B`: observer B's record map;
- `r_AB(h) = (r_A(h), r_B(h))`: the combined record after communication.

These are observation/record maps. They are not asserted to be physical projections, and they are not the H(s)H worldtube-timesheet intersection operation.

Define `h ~A h'` when A's record is the same for both histories, and similarly for B. Then:

\[
h\sim_{AB}h'
\iff
r_A(h)=r_A(h')\ \text{and}\ r_B(h)=r_B(h').
\]

Thus the combined indistinguishability relation is the intersection of the individual relations. Its fiber at a history is:

\[
\operatorname{Fib}_{AB}(h)
=
\operatorname{Fib}_{A}(h)\cap\operatorname{Fib}_{B}(h).
\]

The combined record can refine the set of histories compatible with the evidence, but it need not identify one unique history. The information A learns from B travels through the stipulated communication channel between records. That does not establish that the underlying physical interaction radiated or conducted information into the surrounding medium.

A target property `q : H -> Z` is uniquely recoverable from A's record exactly when `q` is constant on every fiber of `r_A`. If two complete histories produce the same A-record but different values of `q`, A cannot determine `q` from that record alone.

### Two qualifications

First, a single instantaneous 3D hypersurface cannot contain an extended trajectory segment. "Seeing a particle streak by" implicitly requires a sequence/family of slices or a finite spacetime sampling domain. Distinguish the instantaneous slice, the observer's sampling domain, the accumulated record, the retained record, and the shared record. A record that looks like a complete traversal is not proof of full coverage; repeated states or alternative sampling paths may remain compatible unless the sampling map and coverage are independently established.

The thought experiment does not posit light or a causal cone, so no relativistic signal-propagation constraint should be imported.

## 3. What would make information preservation a physical law?

A complete four-dimensional history can encode every event by construction, if it is genuinely complete. But that is a statement about the completeness of a description, not yet a proof that the physical dynamics preserve state distinguishability.

A physical law needs a declared complete state space `X` and evolution map:

\[
\Phi_{t_2,t_1}:X_{t_1}\rightarrow X_{t_2}.
\]

Injectivity on the admissible domain preserves distinguishability of complete states; bijectivity is the stronger reversible-state condition. In a quantum model, the corresponding closed-system condition is unitary evolution. An effective open-system map can be many-to-one even when a larger system including its environment has reversible dynamics.

Spacetime dimensionality alone does not guarantee injectivity. A lower-dimensional state space can have invertible dynamics, and a four-dimensional spacetime description can be paired with non-injective effective evolution. Four dimensions may be needed for the particular extended-history representation in this thought experiment, but that does not prove that information conservation itself requires four dimensions.

This observer-map analysis is not a thermodynamic entropy definition. It concerns distinguishability and identifiability; entropy requires a statistical state or a defined multiplicity/probability over microstates.

## 4. Existing conditional Lean results already cover the abstract map question

The open Kestrel PR #873 contains `KestrelProjectedIncidence.lean`, including:

- `hallway_factorization_iff_fiber_compatibility`: a downstream quantity factors through a reduced record exactly when it is constant on every fiber of that record map;
- `joint_readout_injective_of_separating_pair`: two readout maps jointly identify the source state if every distinct admissible pair is separated by at least one channel;
- `downstream_readout_cannot_restore_coarse_collapsed_pair`: a deterministic downstream map cannot restore a distinction already collapsed upstream.

These are conditional mathematical results. They do not prove that physical observer records satisfy the separation premise, that `H` is the true physical state/history space, or that the universe preserves information.

**Verification scope:** PR #873 is OPEN / DRAFT / UNMERGED. Head `1971e3d58a28f7c6de5cf024039dbcedb133121c`; current base `61cc8b65ffed70296e0121dbae067892a79c81d4`. Actions run #42153410233 succeeded on synthetic merge commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, which used older base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. The module built at 8,932/8,955; the full build completed at 8,955. The joint-readout theorem's `#print axioms` output lists `propext`, `Classical.choice`, and `Quot.sound`; the factorization theorem lists `Classical.choice`; the downstream non-restoration theorem lists no axioms. No `sorryAx` appeared in the captured theorem-specific outputs, but the separate global axiom audit, nanoda, tests, and lint were not run.

Classification: `MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_ONLY_BUILD_UNVERIFIED / CURRENT_BASE_MERGE_BUILD_UNVERIFIED`. No new Lean theorem was added because the abstract two-channel and fiber-compatibility results already exist. The physical observer maps remain undefined.

## 5. Current H(s)H source status

The current BEDROCK material inspected here does not establish a universal information-conservation law. It does require separation of structural coarse-graining, timesheet intersection, instrument readout, and physical dynamics. Its nested-worldtube minimal-pair rule says that if two full geometries share a coarse representation but yield different observable predictions, that representation is insufficient for the observable.

A historical July 4, 2026 file, `H(s)H MANIFOLDS.txt`, asserts a 3-form current condition `d*J = 0` and a "lossless BV push-forward." This is historical material, not a verified current law. The later SAT archive `INGESTION_LEDGER.md` explicitly lists "BV as lossless" among claims not supported by the older toolkit list and states that BV push-forward is coarse-graining unless restricted injectivity or information preservation is actually proved. The current synthesis state calls for quantifying information loss and non-uniqueness, and says speculative transitions require an action, conservation ledger, and observation map.

Disposition: retain the old 3-form/BV construction as a historical candidate for source-critical review. Do not promote it into BEDROCK.

## 6. Helicity and measured-system boundary

The 2017 Scheeler et al. vortex-tube experiment measured helicity, twist, writhe, and their evolution in controlled fluid configurations. It did not measure a microscopic information current, molecular correlations, a bulk-rotation transfer channel, or a radiative/conductive information flux. Twist decay alone therefore does not identify where microscopic information is stored or whether an H(s)H conservation law holds. A public raw-data deposit for that 2017 study was not confirmed in this pass.

A newer measured finite-core comparator is Barckicke, Falcon and Gissinger (2026), "Kelvin wave propagation along vortex cores." The paper reports measured m=1 helical bending modes and m=2 double-helix core modes and makes supporting spatiotemporal data available through figshare DOI `10.6084/m9.figshare.30903347`. This is a candidate for future finite-core response and mode-identifiability work, not evidence for H(s)H information conservation or rope universality.

No CODATA quantity was used, no numerical comparison was made, and no physical calculation was performed. P2 November 30 remains HOLD and no system was selected.

## 7. Next discriminators

1. Define the complete physical state and its evolution law before asserting information preservation.
2. Define actual observer sampling domains and record maps from an explicit physical model.
3. Test whether the joint record separates histories that either individual record cannot distinguish.
4. Keep law inference separate from reconstruction of the particular past history.
5. If H(s)H proposes a conserved information current, derive its continuity equation and boundary terms from a source-faithful action and identify an independent observable.
6. For helicity, obtain raw core/flow data, acquisition method, units, uncertainty, and covariance before proposing microscopic or surrounding-medium transfer channels.

## 8. Source ledger

- Current [BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md), blob `527924246cc25caf7fac02dce4b20f024013cd19`.
- [Task Branch Graph](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json), blob `fc53157389b3052de8fc45ffdcc17d5034984435`; `branch_count=16` while 18 records are present. Tern-owned; not changed.
- [Joint-readout identifiability gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/relay36-joint-readout-identifiability-gate-20261103t0636z-001.md), blob `05d8ae7f5f4b734515ef70776e475ac36303715e`.
- [Aldus vector-timesheet map/fiber audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-vector-timesheet-fiber-compatibility-20261107t2200z-001.md), blob `92d7e21eaedc75ed7618be6aa965db69ea4d421e`.
- [Sable projection/composition and CI-scope audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-07T0504Z_PROJECTION_COMPOSITION_AND_CI_SCOPE_AUDIT.md), blob `ba6b254ce73b9b865732d798b696d699de3e7188`.
- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873), head `1971e3d58a28f7c6de5cf024039dbcedb133121c`; Actions run #42153410233, job #127681789766.
- [SAT/H(s)H synthesis state](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_HSH_SYNTHESIS_STATE.md), blob `a39106a1231555dbfd5091e488f5d4b771f4da48`.
- [SAT archive ingestion ledger](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/INGESTION_LEDGER.md), blob `8c095421bcc00d58059eddbcfdb7a62a1486bc13`.
- Historical [H(s)H MANIFOLDS](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/H%28s%29H%20Dev%20%2B/H%28s%29H%20MANIFOLDS.txt), blob `54f2f530697ab6e9c44758ce3406c4144915c73d`.
- Scheeler et al. (2017), [Complete measurement of helicity and its dynamics in vortex tubes](https://doi.org/10.1126/science.aam6897).
- Barckicke, Falcon and Gissinger (2026), [Kelvin wave propagation along vortex cores](https://www.nature.com/articles/s41567-026-03175-w); data DOI `10.6084/m9.figshare.30903347`.

**Retrieval limits:** Mersearch was not exposed as a callable connector in this runtime and all four shared request lanes were occupied/requested; none was overwritten or submitted. Bounded direct retrieval was used across available archive surfaces; this is not an exhaustive Mersearch corpus scan. No local Lean/Lake or Mersearch executable was present. Existing Math Hopper and Whirligig work was left intact; SciSpace was available but not needed. No new tool, dependency, paid service, branch, or physical calculation was created.

**Final status:** `OBSERVER_RECORD_MAPS_CONDITIONALLY_IDENTIFIED / JOINT_READOUT_THEOREM_REUSED / PHYSICAL_HISTORY_MAP_UNINSTANTIATED / INFORMATION_CONSERVATION_LAW_NOT_ESTABLISHED / NO_PHYSICAL_CALCULATION / NO_CODATA_COMPARISON / NO_P2_SELECTION / NO_PAPER_GATE_ADVANCEMENT / NO_BEDROCK_PROMOTION`.
