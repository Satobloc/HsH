# Orson | Comma Gate 003: real GP-B/Cassini two-spoke PPN transport constraint
**2026-10-27 | SANDBOX / STANDARD-PHYSICS CONTROL | NOT H(s)H PHYSICS VALIDATION**

## Reason for this gate
Oct. 23 BEDROCK rules prohibit using unsupported purely abstract fixtures as physical research calculations without Nathan's permission. Earlier Meridian/Orson comma calculations remain conditional mathematical results, not physically tested. This packet uses two **real experimental systems**, genuine observed numbers and a no-fitting, dimensionally typed GR/PPN comparator.

**Source preservation / corrections first:** Meridian's Oct. 21 2:3 torus curve normal holonomy K=12/sqrt(26) is about flat-R4 embedded-curve normal transport; it is **not** the Lorentzian Levi-Civita spin connection measured in GP-B. Existing related work was checked before proceeding: `WORKSPACES/NADIR_VOSS/2026-10-26_1424Z_GPB_MEASURED_SO4_REPRESENTATION_GATE.md`, `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-20261025t20z-gpb-static-kerr-gate-001.md`, and `.../mercer-20261026t00z-gpb-spin-kerr-control-001.md`. This packet adds a **separate Cassini optical/radio spoke**, not a duplicate single-system GP-B calculation.

**Archive search coverage:** consulted existing three-root Mersearch receipt `indexes/mersearch_requests/2026-10-21-orson-nlm-big-haul-math-001/{RUN_MANIFEST.json,SEARCH_RECEIPT.md}`, a broad, non-targeted completed query with 34,983 hits / 13,897 scanned files. Current shared Mersearch request `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` was occupied by `indicatrix-corpus-20261026-001`; not overwritten. Bounded direct GitHub search located the relevant newer controls. **No new comma-specific comprehensive Mersearch execution claimed.**

## Real systems, observational sources
1. **GP-B:** four gyroscopes aboard Earth-polar-orbit spacecraft, 2004-08-28 through 2005-08-14. Everitt et al., *Phys. Rev. Lett.* 106, 221101 (2011), https://doi.org/10.1103/PhysRevLett.106.221101 ; primary numbers https://pubmed.ncbi.nlm.nih.gov/21702590/ . Geodetic observed signed -6601.8 +/-18.3 mas/year versus published full-GR -6606.1 mas/year; frame dragging -37.2 +/-7.2 versus -39.2 mas/year. These +/- are published experimental 1-sigma uncertainties. Orbital period 97.65 minutes reported by GP-B engineering team: https://einstein.stanford.edu/content/sci_papers/papers/Hanuschak_ION_Paper.pdf . The period is rounded; no period uncertainty is supplied.
2. **Cassini radio link near solar conjunction:** Bertotti, Iess & Tortora, *Nature* 425, 374-376 (2003), https://doi.org/10.1038/nature01997 ; https://pubmed.ncbi.nlm.nih.gov/14508481/ . PPN gamma_C=1+(2.1 +/-2.3)*10^-5 = **1.000021 +/-0.000023**, dimensionless. Separate observed phenomenon, not a source of GP-B calibration.
3. **Earth gravitational parameter:** JPL DE440 `GM_E = 398600.435507 km^3/s^2`, https://ssd.jpl.nasa.gov/astro_par.html . Speed of light `c=299792458 m/s` exact by SI. One rate year defined as **Julian 365.25 days** for this approximation; the historical mission's detailed rate/year conversion is not independently re-established here.
4. **Transport equations:** original GP-B engineering account writes the PPN geodetic coefficient `gamma + 1/2`, https://web.stanford.edu/~sbuchman/publications-PDF/Gravity%20Probe%20B%20-%20Testing%20Einstein%20at%20the%20Limits%20of%20Engineering.pdf ; Cassini Shapiro light-time depends on `1+gamma`. Do not construe the latter gamma as a measured oscillator frequency ratio.

## No-fit calculation actually executed
Take mission's reported P=97.65 min as a circular Keplerian reference (not a fully reconstructed orbit). Then
```
n = 2*pi/P ; r_circ = (GM_E/n^2)^(1/3) = 7,024,385.5806 m.
q = GM_E/(c^2*r_circ) = 6.31375928643e-10.
Omega_geodetic(gamma) = (gamma+1/2)*q*n
leading GR gamma=1: -6610.96335674 mas/year.
Full published GR: -6606.1 mas/year (reported; NOT recomputed using truncated model).
GP-B geodetic minus full GR = +4.3 mas/year = +0.234972678 sigma.
GP-B geodetic minus leading circular GR = +9.16335674 mas/year = +0.500729877 sigma.
GP-B frame dragging minus full GR = +2.0 mas/year = +0.277777778 sigma.
```
Using the same leading circular formula, formally invert the GP-B observation **without fitting any model parameter to Cassini**:
```
C_GPB = |Omega_observed|/(q*n) = 1.497920872590807
  sigma_C,FORMAL = 18.3/(q*n expressed in mas/year) = 0.004152193639373
gamma_GPB,circular = C_GPB - 0.5 = 0.997920872590807
  sigma_gamma,FORMAL = 0.004152193639373
gamma_Cassini = 1.000021 +/- 0.000023
difference = -0.002100127409193
z_formal = -0.505779684916
```
**IMPORTANT:** This is a **formal measurement-only z**, with nominal rounded period, circular/geodesic point-Earth approximation, negligible covariance between distinct missions, and no quantified orbit/gravitational-multipole/solar correction uncertainty. Therefore **not a calibrated independent determination of gamma at 0.0042 precision** and not a complete joint likelihood. The nominal GP-B altitude ~642 km cannot be substituted for the radius derived from rounded P without explicitly auditing orbit definition, radius convention and real variation. The published full-GR result differs from the leading calculation by 4.86 mas/yr; this does not demonstrate an anomalous signal.

## Meaning for the Pythagorean comma
Historical `B0=3/(4*pi)` has exact `2*pi*B0=3/2`. GR spin transport has `gamma+1/2=3/2` at gamma=1. These are **different constructions with the same dimensionless number**. The Pythagorean comma itself is `(3/2)^12 / 2^7`; neither GP-B nor Cassini establishes twelve physically repeated 3:2 operations, an octave quotient, counterrotating two-plane transport, or any SAT historical phase snap. No comma-derived H(s)H prediction.

**What must close in H(s)H:** recover an independently specified physical connection and observer/readout mapping, show that the same geometrical object yields both the gyroscope spin return operator (massive transport, PPN gamma+1/2) and photon radio delay (1+gamma), while also yielding the Earth-rotation frame-dragging channel. Do not set gamma independently per spoke. Failure of any one sector propagates to the common model.

## Verification and gates
- Python numerical execution and asserted identities: **PASS**. Script accompanies this note at `WORKSPACES/ORSON_VAY/orson_comma_gate_003_gpb_cassini.py`.
- Real systems, provenance, units, experimental uncertainties and standard comparator: **PASS**.
- PPN two-spoke measurement consistency: **PASS, conditional circular reference**.
- Full uncertainty/systematics and GP-B raw time series: **NOT OBTAINED**.
- Independent H(s)H 4D worldtube-to-physical spin/light connection: **NOT DERIVED / BLOCKED**.
- Fourth-dimensional normal-bundle comma applied to real physical director: **BLOCKED**.
- Lean formal proof: **NOT RUN**, no verified Lean compiler in current environment.
- No BEDROCK promotion, no theory candidate, no numerical H(s)H success claim.

**Archive note:** Both GP-B and Cassini are **historical measurements**. They are a benchmark for the present coupled reconstruction, not newly observed anomalies or sources of current experiment availability.

Orson lane, assistant-authored research record.
