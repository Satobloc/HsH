# Earth–Moon tidal response: phase-lag gate and finite-sample identifiability

**Run:** REVROT3-19-20261011:467:s3. **Role:** Loom; next: Aster.  
**Disposition:** source recovered; standard-data baseline calculated; response-map gate added; Lean and supplemental Mersearch pending; no theory promotion.

## Source provenance

Nathan Direct source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Gravitational Changes and Motion — raw.json`, blob SHA-1 `8fbded973df263d24b2c1346f0f96e28ded415e7`, user message `beecbdf8-7324-4de1-8efe-2333c931833c`, 2026-05-05T20:37:35.719956Z. Nathan asked whether a history-dependent worldtube twist should reproduce standard tidal evolution and whether orbital and rotational periods could be directly related. This is an exploratory question, not an approved tidal law.

The child assistant response (message `157c4fc8-2a09-4514-9509-53b18343106a`) proposed `ΔG(A,B)=ε∫K(τA,τB)dτA dτB` and suggested history-dependent strengthening could replace dissipation. This is assistant reconstruction, not Nathan Direct, not SAT-O and not Blockwave. No dimensions, normalization, causal response, phase lag, torque or energy-transfer law were supplied. No verbatim Nathan-authored SAT-O/Blockwave tidal equation was recovered.

The older `Universal Symmetry-Axis Torsion in Compact Planetary Dynamics.txt` source guide, blob `d871911db55e010a42addc4e833d5a7c9f1b16f5`, is generated assistant synthesis, not a role-verified derivation. Its illustrative `τ≈0.01`, `β≈1`, 1% locking-time change and 4.5 Gyr lunar-locking claim have no measured-system fit or uncertainty. They are quarantined as `UNVERIFIED_ASSISTANT_SYNTHESIS / NOT A SAT PREDICTION`.

## Real system and data

Williams, Turyshev & Boggs (2014), *Planetary Science* 3:2, DOI `10.1186/s13535-014-0002-5`, analyze 43 years of LLR and report fitted `da/dt = +38.08 ± 0.19 mm/year` and lunar mean-longitude angular acceleration `−25.82 ± 0.13 arcsec/century²`.

Williams & Boggs (2015), *JGR Planets* 120, 689–724, DOI `10.1002/2014JE004755`, use 19,361 LLR ranges from 1970–2014 (weighted RMS about 2 cm). Range/libration data are observables; `Q(P)` and complex Love response are model-derived fit quantities. `Re(k2)` is fixed from GRAIL.

Published lunar-response summary:
- 1 month: `Q = 38 ± 4`
- 1 year: `Q = 41 ± 9`
- 3 years: `Q ≥ 74`, conditional lower bound
- 6 years: `Q ≥ 58`, conditional lower bound

The long-period bounds depend on assumptions about shorter-period response and `k2` growth; libration terms mix periods. Both a single-relaxation-time model and an absorption-band model fit the LLR constraints; hybrids remain possible. Thus a period-dependent response is needed, but a unique rheology is not identified. The inferred ≥535 km deep-hot-mantle dissipation region is a geophysical model inference, not a measured boundary or H(s)H core. The 2014/2015 analyses overlap and are not independent replications.

Sources: https://doi.org/10.1186/s13535-014-0002-5 ; https://doi.org/10.1002/2014JE004755

## Planck-first orbital energy scale

Inputs: `da/dt = 0.03808 ± 0.00019 m/year`; JPL DE440 `GM_E = 398600.435507 km³/s²`, `GM_M = 4902.800118 km³/s²`; CODATA 2022 `G = 6.67430e−11 m³ kg⁻¹ s⁻²`, exact `c`, CODATA `ħ`; NASA mean Earth–Moon separation `a ≈ 384,400 km`, used as an explicit orbital-scale proxy.

With `mP = √(ħc/G)`, `lP = √(ħG/c³)`, `tP = lP/c`, and `PP = EP/tP`, the Newtonian two-body estimate gives:

`Edot_orb / PP = 3.2951 × 10⁻⁴²`

or approximately `+1.196 × 10¹¹ W = 119.6 GW`, with `±0.60 GW` from `da/dt` uncertainty alone. This is the rate of increase of relative orbital mechanical energy in the stated approximation, not total tidal heat and not a measurement of the Earth's spin-energy loss. The mean separation is only a proxy for the fitted semimajor axis; its uncertainty is not included.

The fixed-mass Kepler relation `P_orb ∝ a^(3/2)` gives an approximate lunar orbital-period increase of `0.351 ms/year`. This is not Earth's rotational-period derivative. That requires the torque, Earth's moment of inertia and its own frequency-dependent tidal response.

## Architecture improvement

Separate the external orbital channel from the Moon's internal solid-body response:

`W2(ω) → k2*(ω), h2*(ω), l2*(ω) → induced potential/deformation/libration → LLR range`

and separately

`Earth/Moon worldtube histories → Earth and Moon response operators → torque/energy-angular-momentum budget → {da/dt, orbital period, spin period, libration, range}`.

A complex, frequency-dependent Love response (or an equivalent causal memory kernel) carries amplitude and phase. The Earth's tidal response and lunar `Q(P)` are distinct operators, coupled through torque and energy/angular-momentum exchange. A monotonic history-dependent `ΔG` alone does not supply the measured irreversible response. H(s)H must derive the phase lag, torque and energy transfer from worldtube/timesheet dynamics or identify an explicit internal/medium reservoir.

**Forced vs optional:** the LLR fit requires secular orbital expansion and a period-dependent lunar response. A constrained response family and explicit observation maps are required for prediction. A unique rheology is not identified. A specific 535 km H(s)H core, finite-core thickness, twist or contact surface is not forced by these data.

## Falsification and formalization

A single H(s)H response family must fit both orbital `da/dt` and the frequency-dependent lunar response without an independent free coefficient at each period. Calibration: 1970–2014 LLR plus GRAIL `Re(k2)`. Holdout: later LLR, independent lunar orientation/libration and Earth-rotation records. Standard comparator: frequency-dependent Love-number models (single relaxation, absorption band and hybrids). Reject if a preregistered joint prediction misses the holdout outside the full covariance or needs per-period knobs. The full joint covariance/posterior was not retrieved, so no numeric 95% threshold is claimed.

Draft Lean PR #1101 (`research/loom-lunar-response-identifiability-20261030t12z`, head `36a8fd182ad86bd34d986f671b27d71a90144ea1`) formalizes only the mathematical fact that an arbitrary response function is not uniquely determined by a finite set of period samples. Its witness functions are abstract mathematics, not physical fixtures. CI run `41055337915` was IN PROGRESS at report preparation. No compile-success or axiom-free claim. Base is the existing Lean infrastructure PR #262; `lake-manifest.json` is not yet committed.

A completed prior Mersearch run `calder-worldtube-inspiral-nathan-source-20261030-0124` provided bounded navigation to the raw May 5 source. A new targeted three-repository query is queued in completed lane 3: request `loom-earth-moon-worldtube-20261030-1208`, Actions run `41053709369`, job `124055831487`, still IN PROGRESS; no receipt yet. No complete coverage claim.

Code Grurple remains ACTIVE. This is a research note, not Paper A/B or a Nov 9/Nov 30/Dec 14 paper deliverable. No paper, reader route, public site, BEDROCK or theory status was changed. The expected Sable :24 predecessor receipt/handoff was absent and is `HANDOFF_MISSING_OR_IN_FLIGHT`, not worker nonresponse. No authenticated Loom ChatGPT thread was recovered; no cross-thread delivery or acknowledgment is claimed.
