# Loom source-local tags | GW241011 symmetric restriction and Bayesian operations | 2026-11-20

**Run:** h961:s3  
**Scope:** one Lane 36 architecture/formalization artifact. Source-local tags only; no global dictionary changes. Mercer retains global precision/selectivity QA ownership.

## Source identity and authority

| Source | Class | Identity / extent | Use and limit |
|---|---|---|---|
| Das et al., “Testing the Kerr hypothesis beyond the quadrupole with GW241011” | Historical/standard research source | arXiv:2604.09828v1; submitted 2026-04-10; HTML lines 16-98; equations (1)-(2), analysis sections and Table I | Primary source for the parameter definitions, imposed restriction, Bayesian operations, priors, zero-noise injections and reported event results |
| Abac et al., “GW241011 and GW241110: Exploring Binary Formation and Fundamental Physics with Asymmetric, High-spin Black Hole Coalescences” | Historical/standard event source | ApJL 993 L21 (2025); arXiv:2510.26931 | Event provenance; same astrophysical event, not an independent observation |
| Sable h961:s2, issue #2147 | Assistant reconstruction | Source-currentness and parameter-projection report | Prior HsH analysis, not Nathan Direct or physical measurement |
| Aster h961:s4, issue #2150 | Assistant reconstruction / cross-lane QC | Source review and kernel/fiber correction; publisher rejected SHA, no canonical artifact | Correction to Sable's kernel/fiber wording; not independent empirical confirmation |
| Kestrel PR #873 | Assistant formalization | Exact-head generic downstream-factorization theorem | Abstract theorem only; not the GW241011 source-specific map |
| Loom PR #2151 | Assistant formalization | Draft module on branch research/loom-gw241011-symmetric-restriction-20261120t0136z | Formalizes the source-parameter restriction's algebraic representation; not physical validation |
| Nathan Direct | Not newly recovered for this subject | No new raw user-role message searched because Mersearch is unavailable and the existing four request lanes remain occupied | No original SAT-O/Blockwave equation or Nathan-intent claim is made |

## Source-local tags and typed operations

| Tag | Current definition | Guard |
|---|---|---|
| GW241011-OBSERVED-EVENT | Real astrophysical event analyzed by the paper | Event identity is not an independent replication |
| SOURCE-DEFINED-SYMMETRIC-COMPONENT-AVERAGE | The two source-defined averages of component deviations | Parameter summary, not detector response |
| MODEL-RESTRICTION-ANTISYMMETRIC-ZERO | Assumption that the antisymmetric combinations vanish | Modeling/identifiability restriction, not measured equality |
| ASSISTANT-DIAGONAL-EMBEDDING | Embedding of the equal-component subspace | Assistant reconstruction, not source-defined physical geometry |
| ASSISTANT-CANONICAL-IDEMPOTENT-PROJECTION | Composite P = J ∘ S | Algebraic projection only |
| BBH-NUISANCE-MARGINALIZATION | Posterior integration over standard BBH parameters | Statistical integration, not geometric projection |
| PRIOR-SUPPORT-SYMMETRIC-ABOUT-ZERO | Uniform prior U[-500,500] | Distributional symmetry, not component-exchange symmetry |
| PRIOR-SUPPORT-POSITIVE-ONLY | Uniform prior U[0,500] | Different prior support and model interpretation |
| BAYESIAN-EVIDENCE-PRIOR-INTEGRAL | Evidence integrates likelihood times prior over full parameter space | Prior-conditional model comparison |
| ZERO-NOISE-INJECTION-SYNTHETIC | GW241011-like synthetic recovery check | Not an independent observation |
| HOLDOUT-NOT-IDENTIFIED-IN-INSPECTED-SOURCE | No distinct independent holdout is specified in the inspected paper sections | Bounded negative source finding, not proof no other data exist |
| HSH-FORWARD-MAP-UNDEFINED | No source-authorized map from H(s)H geometry to these multipole/waveform parameters | Current project limitation, not a source claim |

## Relation edges

- SOURCE-DEFINED-SYMMETRIC-COMPONENT-AVERAGE --MANY_TO_ONE--> four component deviations.
- MODEL-RESTRICTION-ANTISYMMETRIC-ZERO --RESTRICTS_DOMAIN_TO--> equal-component diagonal subspace.
- ASSISTANT-DIAGONAL-EMBEDDING --RIGHT_INVERSE_OF--> source-defined summary map.
- ASSISTANT-CANONICAL-IDEMPOTENT-PROJECTION --COMPOSES--> diagonal embedding after summary map.
- BBH-NUISANCE-MARGINALIZATION --INTEGRATES_OVER--> standard BBH parameters.
- BAYESIAN-EVIDENCE-PRIOR-INTEGRAL --DEPENDS_ON--> likelihood and prior support.
- PRIOR-SUPPORT-SYMMETRIC-ABOUT-ZERO --DISTINCT_FROM--> component-exchange symmetry.
- ZERO-NOISE-INJECTION-SYNTHETIC --VALIDATES_RECOVERY_NOT--> independent astrophysical measurement.

## Status

- Tags remain source-local.
- No global tag dictionary, BEDROCK, or worker charter change.
- No new Nathan-authored historical corpus message was discovered or tagged.
- No original SAT-O/Blockwave equation was recovered or modified.
- No physical calculation, fit, prediction, independent measurement, or theory promotion.
- Mersearch unavailable; four request lanes remain requested/occupied and untouched.
