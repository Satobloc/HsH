# Calder | GW170817 tidal-readout identifiability
**2026-10-30 01:24 UTC | P2 physical-geometry constraint candidate**

**Status:** `SOURCE-ANCHORED / 7 PYTHON ASSERTIONS PASSED / 19 LEAN TARGETS BUILT ON PRE-CLEANUP HEAD / FINAL LINTER-CLEANUP RE-RUN PENDING / NO H(s)H PREDICTION / NO BEDROCK PROMOTION`

## Finding

GW170817 supplies a real binary-neutron-star inspiral whose waveform constrains an effective tidal-deformability parameter. It is a useful external constraint on the *readout architecture* needed by H(s)H, but it is not an H(s)H prediction. Nathan's recovered worldtube/Kerr-shell statements are prose geometry and measurement questions; no source-faithful map from that geometry to a neutron-star Love response, and no SAT-O/Blockwave tidal equation, was recovered.

This is distinct from Calder's earlier GW170817 emission/propagation-lag investigation (issue #656 / PR #655), which concerned the gamma/GW arrival-time budget rather than tidal deformability.

## Nathan Direct and provenance

Bounded Mersearch lanes were occupied and not overwritten. A direct raw-export read was made from HsH file `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`, Git blob `c49367b0faa424491e7b3520a034b9e44fe6897f`.

Relevant archive messages labelled `user`:
- `09c6d26f-934f-4be6-b2ae-21a6fc281147` (2026-09-06 08:09:54.609Z): helices, nested superhelices, braids, winding, fluid/medium and Kelvin vortices.
- `2a34f106-0dd0-488f-a0e6-97748320c955` (2026-09-07 05:32:10.090Z): “Kerr should be the core,” with an ergosphere/layer and coiling.
- `8471543a-6ed1-4743-9073-74735f019da4` (2026-09-07 07:39:00.690Z): four-dimensional worldtube with Kerr cross-section and deformable shells.
- `62b85640-6a36-47b7-b064-94c97106f9b6` (2026-09-10 14:43:07.491Z): asks what measurements constrain shell deformability, permeability and stability.

Archive role labels are provenance, not external identity authentication. These are not Love-number equations. The standard equations below are GR references and assistant formalization, not Nathan Direct equations.

## Actual system and published posterior

Primary source: LIGO/Virgo, “Properties of the Binary Neutron Star Merger GW170817,” *Phys. Rev. X* 9, 011001 (2019), DOI [10.1103/PhysRevX.9.011001](https://doi.org/10.1103/PhysRevX.9.011001), Tables II/IV and Sec. III.D. The underlying observation is calibrated detector strain from the 2017-08-17 inspiral. The paper marginalizes calibration uncertainty and compares waveform families and spin priors. These are Bayesian posterior summaries from one event, not independent experiments or direct radius measurements.

PhenomPNRT, Table II:
- Low-spin prior (component spin magnitude <=0.05): source-frame chirp mass \(1.186\pm0.001\,M_\odot\); \(q\in[0.73,1.00]\); 90% HPD \(\widetilde\Lambda=300^{+420}_{-230}=[70,720]\).
- High-spin prior (component spin magnitude <=0.89): \(q\in[0.53,1.00]\); one-sided 90% result \([0,630]\), which includes zero.
- The paper notes the low/high-spin posteriors become nearly identical when restricting to \(q\gtrsim0.5\); the broader high-spin result is tied to the lower-\(q\) tail and spin/mass-ratio degeneracy.

Table IV waveform-family upper endpoints:
- Low-spin 90% HPD: PhenomPNRT 720, TaylorF2 830, SEOBNRT 690, PhenomDNRT 730.
- High-spin one-sided 90%: 630, 730, 630, 640.
These are alternate analyses of the same event, not independent measurements.

## Executed calculation

`WORKSPACES/CALDER/CODE/gw170817_published_bounds_20261030.py` was executed locally with Python 3.11 and `Decimal`; **seven assertions passed**. It uses only the published table summaries and Raithel's published relation. No raw strain or sample arrays are read.

The reported interval intersection is
\[
[70,720]\cap[0,630]=[70,630],
\]
width 560. This is set arithmetic, not a combined posterior. The low-spin HPD interval excludes zero; the high-spin one-sided limit includes zero.

Raithel, Özel & Psaltis (2018), [arXiv:1803.07687](https://arxiv.org/abs/1803.07687), derive an approximate EOS-insensitive common-radius relation
\[
\widehat R\simeq(11.2\pm0.2)\frac{\mathcal M}{M_\odot}
\left(\frac{\widetilde\Lambda}{800}\right)^{1/6}\mathrm{km},
\]
with about 2% model uncertainty and stated validity \(q\geq0.6\).

Using the 2019 chirp mass \(1.186\pm0.001\,M_\odot\) and the PhenomPNRT low-spin HPD upper endpoint 720 gives a nominal conditional upper radius **13.052 km**. Varying the published coefficient (11.0–11.4) and chirp-mass endpoints (1.185–1.187) gives **12.808–13.296 km**, a sensitivity envelope, not a combined credible interval.

Across the low-spin waveform upper endpoints 690–830, nominal radius upper values are **12.960–13.365 km**, a **0.405 km** spread. Combining waveform, coefficient and chirp-mass extremes gives **12.718–13.615 km**, again only a sensitivity envelope. Since \(R\propto\widetilde\Lambda^{1/6}\), a 10% tightening of the \(\widetilde\Lambda\) upper bound (800 to 720) changes the nominal radius upper by only **1.74%**.

The low-spin \(q\) interval is within the Raithel \(q\geq0.6\) domain. The high-spin interval extends to \(q=0.53\), below that domain, so **no full high-spin radius conversion is claimed**. No CODATA constant is used: \(\widetilde\Lambda\) is dimensionless and the radius relation is used in its published km-per-solar-mass form.

## Common-EOS caveat

De et al. (2018), *Phys. Rev. Lett.* 121, 091102, [arXiv:1804.08583](https://arxiv.org/abs/1804.08583), use a common-EOS construction including \(\Lambda_1/\Lambda_2=q^6\). Their erratum [10.1103/PhysRevLett.121.259902](https://doi.org/10.1103/PhysRevLett.121.259902) retracts the original claim that the GW data strongly favor the common-EOS model. The relation is therefore a conditional modeling assumption, not an empirically selected law; the old Bayes-factor claim is not used.

## Explicit maps and mathematical result

The standard component readout is
\[
\Lambda_i=\frac{2}{3}k_{2,i}\left(\frac{c^2R_i}{Gm_i}\right)^5,
\]
and the standard binary projection is
\[
\widetilde\Lambda=\frac{16}{13}
\frac{(m_1+12m_2)m_1^4\Lambda_1+(m_2+12m_1)m_2^4\Lambda_2}
{(m_1+m_2)^5}.
\]

The explicit composition is
\[
((R_1,k_{2,1}),(R_2,k_{2,2}))
\to(\Lambda_1,\Lambda_2)\to\widetilde\Lambda.
\]
For any \(t>0\), \((R,k_2)\mapsto(tR,k_2/t^5)\) leaves the single-star \(\Lambda\) unchanged when \(k_2\) is free. The composed binary readout therefore has a distinct-positive-input non-injectivity witness. If \(k_2\) is fixed by an EOS or other constitutive law, the forward readout instead scales as \(R^5\).

Two interconnected Lean 4/Mathlib modules on existing draft PR #1061 contain **19 theorem targets**:
- `CalderGW170817TidalMap.lean`: 9 targets, including common mass scaling, component swap/equal-mass identities, free-\(k_2\) rescaling, fixed-\(k_2\) \(R^5\) scaling, and explicit binary-composition non-injectivity.
- `CalderGW170817PosteriorChecks.lean`: 10 targets for published intervals, interval intersection, waveform endpoint ranges and \(q\)-domain comparison.
Theorem-specific `#print axioms` commands are included.

These are standard-reference GR/readout statements, **not H(s)H equations**. Lean checks only the formalized statements; it does not establish that an H(s)H worldtube has a GR areal radius, Love number, common EOS or the same constitutive response.

**Lean execution receipt:** run `40989818520` completed successfully on the pre-cleanup PR head `5c16b0ab90b23f47fee965b83cd5d15e759ef9b7` (synthetic merge commit `6d9f4ec63434f0b06e2cc06929026b502c061f85`). The build used Lean 4.34.0 and completed **8,956 jobs**, including both Calder modules and all 19 theorem targets. The explicit `#print axioms` output for all 19 targets was inspected: dependencies were limited to standard Lean/Mathlib axioms (`propext`, `Classical.choice`, `Quot.sound`); no `sorryAx` appeared. The separate `axiom-audit`, `test` and `lint` workflow steps were skipped by the existing workflow configuration, so this is not an independent axiom-audit or test-suite result.

The successful build emitted non-fatal linter warnings in `CalderGW170817TidalMap.lean` (unreachable `ring` tactics and unused denominator hypotheses). A follow-up cleanup commit changed only tactic sequencing and unused binder names; current branch head is `bbbdc156a7c94962fbe563ba9a9d2d3e1b691676`. That latest cleanup head has not yet produced a new CI run, so **the substantive 19-target formalization compiled on the immediately preceding head, while the current warning-cleanup commit remains unverified**. The denominator hypotheses are retained as physical-domain annotations; Lean's totalized division makes the algebraic identities provable without using them, so the formal proof alone does not enforce the physical nonzero-denominator domain.

The workflow generated a Lake dependency manifest at runtime, but `lake-manifest.json` is absent from the stacked base branch. Exact transitive dependency-lock reproducibility therefore remains open.

## H(s)H consequence

The missing chain is
\[
\text{H(s)H worldtube + responsive medium}
\to(R_i,k_{2,i},m_i)\to\Lambda_i\to\widetilde\Lambda
\to p(\widetilde\Lambda,m_i,\chi_i\mid d).
\]
The H(s)H worldtube-to-response map is **not recovered**. A direct worldtube-to-waveform map could replace the intermediate GR readout, but it would still need explicit variables, composition rules and conditions.

GW170817's neutron stars are not Kerr black holes. The Nathan Kerr-cross-section proposal cannot be identified with a neutron-star material core without a derived bridge. This is a constraint on readout architecture, not a direct test of a Kerr-core neutron star, a contact-radius measurement, or H(s)H validation. No WWRD rope-universality claim is made.

A future falsifier is to freeze one H(s)H worldtube/medium-to-tidal-response map, predict a measured system without retuning, and compare against held-out waveform/posterior data across spin priors and waveform families. Until the map exists, there is no independent H(s)H prediction.

## Tooling, continuity and handoff

- Mersearch lanes 1–4 were occupied (Ravel, optics, chemistry, superconductors); none was overwritten. Direct HsH/raw and public-paper retrieval was a partial fallback, not a complete three-root Mersearch run.
- Existing Math Hopper extraction/triage and Whirligig visualization were inspected; neither is a proof engine or data source. Repo-scoped fork search returned no forks of `Satobloc/HsH`.
- SciSpace was used for discovery; LIGO/Virgo, Raithel and De sources were checked against primary publications and the erratum. No new tool project or paid API was created.
- Separate posterior-NPZ audit script `gw170817_posterior_audit_20261030.py` is explicitly **NOT EXECUTED** because binary retrieval was unavailable. No sample-median/q10 outputs are used.
- Unrelated reading break: `TheTANGLE` blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 821–850 read; next cursor 851. Last FIE re-review was 2026-10-27; 14-day threshold not due.
- Ring selection: \(h=457\), \(5h+2=2287\), Calder index 7, next Hale index 8. The selected Calder is the empirical angle-clustering/null-design specialist; a separate Calder name collision for Foundational Covariance/Global Architecture is not merged. Ring selection does not authenticate a ChatGPT thread.
- Existing branch `research/calder-gw170817-tidal-map-20261030t0124z` (current head `bbbdc156a7c94962fbe563ba9a9d2d3e1b691676`; immediately preceding compiled head `5c16b0ab90b23f47fee965b83cd5d15e759ef9b7`); draft PR #1061 remains stacked on `research/aldus-o9-audit-identity-20261029t0612z`, not ready to merge to `main`.
- No independent human hostile review, H(s)H forward map, held-out prediction or BEDROCK promotion is claimed. This is a P2 physical-geometry constraint candidate, not a completed November 30 paper; November 9, November 30 and December 14 gates remain separate.
- Repository handoff to Hale is the only delivery claimed; no historical ChatGPT-thread delivery or acknowledgment is claimed. Existing :24 automation was left unchanged; no sixth task, schedule/phase change, signet change or conversation rename occurred.

**Next:** obtain a new Lean run on cleanup head `bbbdc156...` and inspect its logs; keep PR #1061 draft; obtain and SHA-verify NPZ products before running the marked sample audit; derive the H(s)H worldtube/medium-to-response map; obtain independent hostile review before any BEDROCK or manuscript promotion.
