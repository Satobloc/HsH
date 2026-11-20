# GW241011: separating parameter summary, model restriction, and Bayesian operations

**Run:** REVROT3-19-20261011:961:s3  
**Nominal slot:** 2026-11-20T01:36:00Z  
**Actual invocation observed:** 2026-11-20T02:06:22.334053Z  
**Selected ring label:** Loom (index 1)  
**Next ring label:** Aster (index 2)  
**Classification:** assistant reconstruction / source-grounded model-architecture and formalization work; not authenticated historical Loom participation.

## Executive result

One source-to-model distinction has been made explicit and formally checked in a new Lean module: the GW241011 paper's symmetric component-parameter averages, its imposed equal-component restriction, and the statistical marginalization/evidence operations are different mathematical operations.

The paper defines two symmetric averages and explicitly assumes the corresponding antisymmetric combinations vanish. This is a model restriction motivated by parameter degeneracy, not an observation that the two compact objects have equal multipole deviations. An assistant-defined diagonal embedding and canonical idempotent projection provide a faithful algebraic representation of that restriction, but they are not source-defined physical maps.

The distinction matters for H(s)H: a proposed geometric mechanism must say whether equal component parameters are required by the geometry, imposed for identifiability, or merely unresolved by the detector/readout. Those possibilities cannot be silently interchanged.

## 1. Source and provenance

### Primary source

R. Das, N. V. Krishnendu, M. Saleem, C. K. Mishra and K. G. Arun, “Testing the Kerr hypothesis beyond the quadrupole with GW241011,” arXiv:2604.09828v1, submitted 2026-04-10.

- Versioned source: https://arxiv.org/html/2604.09828v1
- Abstract and version record: https://arxiv.org/abs/2604.09828
- Relevant source locations: equations (1)-(2), “Parametrizing departure from Kerr hypothesis,” “Details of the analysis,” the symmetric-combination restriction, prior choices, zero-noise injection definition, and Table I.
- The paper identifies GW241011 as the measured event and states that the analysis uses data/software from the Gravitational Wave Open Science Center.
- The paper places spin-induced quadrupole effects in the inspiral phasing beginning at 2PN and spin-induced octupole effects at 3.5PN. For Kerr black holes, the source sets the SIQM and SIOM parameters to one.

Event provenance is cross-checked against Abac et al., “GW241011 and GW241110: Exploring Binary Formation and Fundamental Physics with Asymmetric, High-spin Black Hole Coalescences,” Astrophysical Journal Letters 993, L21 (2025), arXiv:2510.26931. The 2026 parameterized test is a later analysis of the same event, not an independent observation.

### Prior HsH work

- Sable h961:s2 source-currentness / parameter-projection report: https://github.com/Satobloc/HsH/issues/2147
- Aster h961:s4 source QC and kernel/fiber correction: https://github.com/Satobloc/HsH/issues/2150
- Kestrel generic downstream-factorization theorem: PR #873, exact-head evidence described in Aster's h961:s4 receipt.

The Aster QC issue's publisher attempt was rejected for SHA mismatch and has no canonical published artifact. Its internal receipt and repository-only handoff were read; no retry or duplicate was made. The Aster report correctly distinguishes the source-defined symmetric averages from a detector response or H(s)H physical projection, and corrects the earlier kernel/fiber wording.

### Archive access and historical-source limits

Mersearch is not callable in this runtime. All four existing request lanes were inspected and remain occupied/requested; no lane was overwritten, retriggered, released, or replaced. The bounded GitHub fallback was not Mersearch and did not provide complete three-repository coverage.

The Loom historical role was recovered from the existing source-recovery report and source-tag ledger: archived conversation “Tag Conversation Corpus,” conversation ID 6aa67478-541c-83e9-b8fa-32d6d575eeb9, raw Git blob SHA-1 6668ca60e451f8737903423727da7f9a430484e1. Its ten user-role messages establish cumulative corpus tagging, timeline-first extraction, source-date verification, terminology crosswalks, preservation of historical/current definitions and corrections, and continuity maintenance. No separate signed specialist charter was recovered. The raw export endpoint returned an empty body on this read because of large-file handling; the existing source-recovery report and ledger were used rather than treating the empty API response as an empty source. No new Nathan-authored message was tagged in this run.

## 2. Five operations that must not be conflated

The source and its analysis contain several distinct transformations.

### A. Source-defined parameter summary

The paper defines component deviations by \(\kappa_i=1+\delta\kappa_i\) and \(\lambda_i=1+\delta\lambda_i\), then defines:

\[
\delta\kappa_s=\frac{\delta\kappa_1+\delta\kappa_2}{2},
\qquad
\delta\lambda_s=\frac{\delta\lambda_1+\delta\lambda_2}{2}.
\]

Call this summary map \(S:\mathbb{R}^4\rightarrow\mathbb{R}^2\). It is a parameter-space summary. Aster's correction remains controlling: its kernel is the antisymmetric subspace \(\{(t,-t,s,-s):t,s\in\mathbb{R}\}\); each fiber is an affine coset of that kernel. Only the zero fiber equals the kernel.

### B. Source-defined model restriction

The paper explicitly assumes the corresponding antisymmetric combinations vanish, implying:

\[
\delta\kappa_1=\delta\kappa_2,
\qquad
\delta\lambda_1=\delta\lambda_2.
\]

This restricts inference to the equal-component, diagonal subspace. It is not an empirical observation that the two bodies have identical multipole deviations. The source explains that simultaneous estimation of all four component parameters would be uninformative because of degeneracies among those parameters and with masses and spins.

### C. Assistant-defined diagonal embedding and canonical projection

For a source-faithful algebraic representation, define an embedding \(J:\mathbb{R}^2\rightarrow\mathbb{R}^4\) by duplicating each symmetric parameter into both component slots. Define \(P=J\circ S\).

The paper does not define \(J\) or \(P\). They are assistant reconstructions of the imposed equal-component restriction, not detector responses, physical-space projections, or H(s)H worldtube/timesheet maps.

The new Lean module proves:

- \(S\circ J=\mathrm{id}\);
- \(J\) is injective;
- \(P^2=P\);
- \(S\circ P=S\);
- the fixed points of \(P\) are exactly the equal-component parameter states;
- \(P(x)=P(y)\) if and only if \(S(x)=S(y)\).

These statements formalize the algebra of the restricted parameterization. They do not establish that the physical binary must lie in the diagonal subspace.

### D. Bayesian marginalization

The paper obtains the posterior for the symmetric multipole parameters by marginalizing over the standard BBH parameters. This is integration over nuisance/model parameters, not a deterministic geometric projection and not the same operation as imposing antisymmetric components to zero.

### E. Bayesian evidence and prior support

The paper defines Bayesian evidence by integrating likelihood times prior over the full parameter space. Its Bayes factor is therefore conditional on the specified model and prior.

The paper uses two distinct prior families:

- “Symmetric priors”: uniform support symmetric about zero, \(\mathcal{U}[-500,500]\).
- “Positive priors”: uniform support restricted to positive values, \(\mathcal{U}[0,500]\).

This prior symmetry is not the same as component-exchange symmetry in the parameterization. The source reports different posterior summaries and Bayes factors for these prior choices. They must remain separately tagged and separately frozen in any future comparison.

The source also uses GW241011-like zero-noise injections. It defines these as synthetic signals injected into data with no stochastic noise realization while retaining the detector noise power spectral density in the likelihood. These are recovery/degeneracy checks, not independent astrophysical observations.

## 3. New source-local tag crosswalk

The new tag ledger is source-local and additive. It does not change the global tag dictionary.

| Tag | Meaning | Provenance guard |
|---|---|---|
| GW241011-OBSERVED-EVENT | Real astrophysical event analyzed by the paper | Event identity is not an independent replication |
| SOURCE-DEFINED-SYMMETRIC-COMPONENT-AVERAGES | Two source-defined averages of component deviations | Parameter summary, not detector readout |
| MODEL-RESTRICTION-ANTISYMMETRIC-ZERO | Assumption that antisymmetric combinations vanish | Modeling/identifiability restriction, not measured equality |
| ASSISTANT-DEFINED-DIAGONAL-EMBEDDING | Embedding of the equal-component subspace | Assistant reconstruction, not a source-defined physical map |
| ASSISTANT-DEFINED-IDEMPOTENT-PROJECTION | \(P=J\circ S\) | Algebraic projection only |
| BBH-NUISANCE-MARGINALIZATION | Posterior integration over standard BBH parameters | Statistical integration, not geometric projection |
| PRIOR-SUPPORT-SYMMETRIC-ABOUT-ZERO | Uniform prior on \([-500,500]\) | Distributional symmetry, not component symmetry |
| PRIOR-SUPPORT-POSITIVE-ONLY | Uniform prior on \([0,500]\) | Different model/prior support |
| BAYESIAN-EVIDENCE-PRIOR-INTEGRAL | Evidence integrates likelihood and prior over full parameter space | Prior-conditional model comparison |
| ZERO-NOISE-INJECTION-SYNTHETIC | GW241011-like synthetic recovery check | Not an independent observation |
| HOLDOUT-NOT-IDENTIFIED-IN-INSPECTED-SOURCE | No distinct independent holdout is specified in the inspected paper sections | Bounded negative source finding, not proof no other data exist |
| HSH-FORWARD-MAP-UNDEFINED | No source-authorized map from H(s)H geometry to these multipole/waveform parameters | Current project limitation, not a source claim |

## 4. Conditional H(s)H prediction implications

The standard comparator is the Kerr/BBH waveform model, with \(\kappa_i=\lambda_i=1\). The source's parameterized alternative inserts deviations into the inspiral waveform, with quadrupole and octupole contributions entering at the stated PN orders.

For H(s)H to make a distinguishable prediction here, it must supply a source-faithful, explicit forward map:

\[
\text{H(s)H geometric degrees of freedom}
\rightarrow
(\delta\kappa_i,\delta\lambda_i)
\rightarrow
\text{PN phase corrections}
\rightarrow
\text{waveform}
\rightarrow
\text{detector strain/readout}.
\]

It must state whether equal component deviations are:

1. required by a specified geometric symmetry;
2. imposed as a modeling restriction for identifiability; or
3. unresolved because the available observation map is many-to-one.

Those are different claims. If H(s)H predicts nonzero antisymmetric component deviations, the paper's restricted symmetric analysis cannot test them. A separate parameterization or independent analysis would be required.

A credible H(s)H test would freeze the geometry-to-waveform map, waveform approximant, common BBH nuisance parameters, calibration treatment, prior support, and observation operator before examining an independent event or held-out data segment. The standard and H(s)H models would then be compared on a genuinely held-out observable, with posterior predictive uncertainty and a preregistered failure criterion.

| Test element | Current status |
|---|---|
| Measured system | GW241011 |
| Public data provenance | Paper states use of GWOSC data/software |
| Standard comparator | Kerr/BBH with \(\kappa_i=\lambda_i=1\), IMRPhenomXPHM |
| Source parameterization | Quadrupole and octupole deviations in inspiral phasing |
| Component restriction | Antisymmetric deviations fixed to zero |
| Prior alternatives | Symmetric-about-zero and positive-only uniform priors |
| Synthetic recovery check | GW241011-like zero-noise injections |
| Independent holdout | Not identified in inspected source |
| H(s)H geometry-to-waveform map | Undefined |
| Numerical H(s)H falsification threshold | Not instantiable |

**Forced by the source:** distinguish the source-defined summary, imposed equal-component restriction, nuisance marginalization, prior support, and evidence integral.

**Not forced:** a physical equality of component deviations, extra worldtube thickness, twist, contact surfaces, a new medium law, or any H(s)H multipole correction. Those require an explicit geometric construction and independently testable consequences.

## 5. Lean formalization

New draft PR: https://github.com/Satobloc/HsH/pull/2151

- Branch: research/loom-gw241011-symmetric-restriction-20261120t0136z
- Exact head: 9a97d3ec6cc6b285c5cfa3411fe1fa1e7430bb84
- Base: infra/lean4-verification-20261023, head 368f9af8d95d061b4581688759ed3eda309e9886
- New module: FORMAL_VERIFICATION/HsHVerification/GW241011SymmetricRestriction.lean
- Root import updated in FORMAL_VERIFICATION/HsHVerification.lean
- The module includes theorem-specific #print axioms statements.

The PR is draft/open/unmerged and stacked on the existing Lean infrastructure PR #262. The current Actions run is #44659202214, job #136032948324. At the time of this report's first compilation check, the run was IN_PROGRESS; exact-head compilation and axiom output must be checked before calling this VERIFIED.

No local Lean, Lake, or Elan executable is installed in this runtime. No new tooling, fork, dependency, or subscription was created. The project’s existing Lean 4.34.0 / Lake 5.0.0 workflow is reused.

Lean checks only the formalized algebra. It does not validate the paper's source translation, waveform implementation, physical assumptions, detector calibration, data analysis, or H(s)H theory.

## 6. Data and uncertainty boundary

No raw strain, posterior HDF5, detector calibration files, power-spectral-density files, or independent event data were downloaded or analyzed in this run. No new physical calculation, fit, posterior reconstruction, Bayes factor, prediction, independent measurement, or empirical falsification threshold is claimed.

The paper's published posterior intervals and Bayes factors are reported source results, not recomputed measurements. The source's zero-noise injection is synthetic. The same-event parameterized analysis is not an independent measurement of GW241011.

## 7. Repository, workflow, and project controls

- HsH main branch pre-write head: 6bdbfd8d913b03f6bc000f5b912c19d2bb33cad3.
- The HsH, SAT archive, and HSH_RESOURCES entry points and cross-formalism routing documents were read. HSH_RESOURCES was used only for internal routing/index metadata; no source payload was opened and no private locator is exposed here.
- Mersearch is not callable in this runtime. Four existing request lanes remain requested/occupied and untouched. GitHub search was a bounded fallback, not a substitute for full three-repository Mersearch coverage.
- Existing Math Hopper #578, Lean PR #991, Whirligig Kernel 0, Lean infrastructure PR #262, and relevant PRs #873 and #2071 were checked. No existing source-specific theorem for this restriction/projection pair was found.
- SciSpace is installed; it was not needed because the primary arXiv paper was directly accessible. No new tool or expense.
- The task graph remains ACTIVE_SEED, with 18 records against 16 declared branches. No graph mutation.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition remains overdue/not ready and Orson-owned; P2 remains HOLD; P3 remains INCOMPLETE. No ownership or paper-gate change.
- FIE review is next due 2026-11-24; the last recorded review was 2026-11-10, so no premature rereview was performed.
- Lateral reading completed: E. M. Forster, *The Machine Stops*, Chapter II, “The Mending Apparatus,” Wikisource lines 103–243. The chapter contrasts Kuno’s embodied recovery of near/far through walking with Vashti’s mediated distance and institutionalized knowledge. This is a literary observation, not evidence about H(s)H. Next cursor: Chapter III, “The Homeless.” A physical posture change cannot be verified by this runtime and is not claimed.
- No SAT-O or Blockwave equation was retrieved, copied, corrected, or changed. Mersearch unavailability prevented a fresh original-source search; no theory inference was made from absent originals.
- No BEDROCK change or theory promotion.

## 8. Durable status

The report is a source-to-model architecture improvement and a source-local tag crosswalk. It does not select GW241011 as an H(s)H system, advance P2, or establish a physical mechanism.

Publication status must be determined from the existing issue publisher's actual comment, Actions result, and independent fixed-path readback. A green Actions conclusion alone is not publication acceptance. If publication is pending, retain the issue ID, expected path, and exact digest without retrying or creating a duplicate.
