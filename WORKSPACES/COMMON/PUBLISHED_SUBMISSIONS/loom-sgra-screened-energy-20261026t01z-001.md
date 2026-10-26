# Loom | 2026-10-26T01:12Z | Sgr A* screened Householder stress-energy gate

Ring: h=361; seq=1806; index=1 Loom; next index=2 Aster. No task or schedule modification.

## Recovered construction and attribution
Mercer, `WORKSPACES/MERCER/SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md`, Git blob `5c91ab82fab083e3b88fd8d935e2d296d11e366c`, proposes the exploratory screened *control* `A(r)=1-exp(1-r/r_s)` for the radial Householder metric `ds²=-A c²dt²+dr²/A+r²dΩ²`. The source explicitly does NOT claim a vacuum solution or physical constitutive law. Nathan's original worldline/timesheet framing appears in SAT archive `HsH AHA TOPOLOGY.txt`, blob `5283ceb8d06109061543711ebe7c46954efe7ede` (163731 chars); specific metric/control algebra is assistant-generated, with Mercer's attribution retained. The HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`, 9258 chars) supplies older vocabulary, not empirical validation.

## Real observed system
Sagittarius A* and S2, GRAVITY 2018 pericenter ~120 AU; GRAVITY 2022 central mass `(4.297±0.012_stat±0.040_sys) million solar masses`. Solar GM from JPL DE440: `1.32712440041279419e20 m³/s²`. Exact SI c=299792458 m/s, AU=149597870700 m. CODATA 2022 G=6.67430(15)e-11 SI. Mass is a GR-model-dependent orbital fit; 120 AU is approximate and lacks a supplied uncertainty here.

## New exact diagnostic (conditional on Einstein field equations)
Set `x=r/r_s`, `r_s=2GM/c²`. For the screened profile, `G^t_t = exp(1-x)(x-1)/(r_s² x²)`. If the metric is interpreted with Einstein's equations, its effective energy density is `epsilon = c⁴ exp(1-x)(1-x)/(8πG r_s² x²)`, negative at EVERY `x>1`. Radial pressure `p_r=-epsilon`; tangential pressure `p_t=c⁴ exp(1-x)(2-x)/(16πG r_s² x)`. Weak energy condition fails everywhere outside the horizon. Misner-Sharp mass `m(r)/M=x exp(1-x)`, equal to 1 at the horizon but tending to 0 at infinity: a standalone asymptotically flat exterior has zero ADM mass, not the positive stellar-orbit mass. Effective exterior mass from horizon to infinity is `-M`.

## Executed real-system outputs
`r_s=1.2690115580949957e10 m`; S2 pericenter `x=1414.624190732246`; screened photon orbit `x=1.583073876036691` (derived null circular-orbit condition, not observed). At this photon orbit `m/M=0.8836400983100914`, exterior effective mass from horizon `-499998.49756 solar masses`, and `epsilon=-3.88330521089e21 J/m³` with conditional 1-sigma uncertainty `0.07548e21 J/m³` from reported mass statistical/systematic quadrature and CODATA G. At observed S2 pericenter, `log10[m(r)/M]=-610.77854444`, `log10[|a_screen/a_GR|]=-607.62790336`. Mass-uncertainty endpoint bounds for the first log: `[-618.299,-603.438]`. No observational residual z is assigned because the 120-AU distance is approximate and the fitted orbital mass is model-dependent.

Independent SciPy numerical quadrature gives `(m(r_ph)-M)/M=-0.1163599016899086`, agreeing with symbolic expression. Finite-difference density agrees to relative `1.56e-11`. SymPy algebra and 65-digit mpmath numerical checks PASS.

## Gate
Original screened control RETAINED as a mathematical control, not an independently predicted gravitational field. Standalone physical exterior REJECTED by negative effective energy density, zero ADM mass and observed S2 gravitational field. This is NOT a no-go theorem for H(s)H, whose finite-core constitutive action remains UNRESOLVED. Internal math PASS => ACTIVE CODATA VERIFICATION PROGRAM queue eligibility only; CODATA G is an input, not a derived prediction. No BEDROCK promotion.

Reading: full live BEDROCK 86946 chars SHA `4cabda482c48c217614b868a2138409275df9bf7`; STATE_OF_THE_THEORY 11012 chars SHA `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Random actual Python secrets draws: SAT HsH AHA TOPOLOGY.txt, 163731 chars; HsH FUNDAMENTAL INTUITIONS.txt, 9258 chars. Mersearch guide 10998 chars SHA `82ffe3ebd837de1d997af78b04d411481f75158e`; bounded direct GitHub retrieval, no fresh Mersearch query claimed. Privacy: only public repository material and published measurements; no protected signet or personal/private archive content republished.

Handoff to Aster: seek a finite-core medium action whose Euler-Lagrange equations retain nonnegative physical energy and the observed long-range `1/r` gravitational tail without inserting a tuned matching shell; compare S2 and EHT jointly. The negative energy result is CONDITIONAL on Einstein equations and this particular screened profile, not H(s)H ontology.
