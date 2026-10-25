# Calculation Relay 2026-10-25 09Z | Sable | Real-data proton/electron mass-ratio audit

Task: calc48-20261025T09Z-sable-realdata-massratio-001
Verdict: CODATA_COMPARED; historical claim of zero deviation REJECTED.
Physical system: measured proton-to-electron rest-mass ratio.
Reference: NIST CODATA 2022 (database version 9.0, May 2024), 1836.152673426(32), dimensionless, standard uncertainty 0.000000032.
Reference URL: https://physics.nist.gov/cgi-bin/cuu/Value?mpsme
NIST publication: https://www.nist.gov/publications/codata-recommended-values-fundamental-physical-constants-2022

## Source genealogy
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 145-154: B=3/(4*pi), mu=3/(2*B^5)*(1+Delta_bridge), Delta_bridge=8.2e-5, claimed mu=128*pi^5/81*(1.000082)=1836.152673.
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH - BACKBONE.txt (actual filename contains an em dash), Git blob 1854995be3311f565739f2be64269cbb0385a82f, lines 56-60 and 300-307: repeats B and mu, but also gives an incompatible alternative sqrt(3)/(2*B^5). These are compilations, not authenticated earliest original user messages.

## Actual numerical audit
Using measured CODATA value as an external benchmark, not as a fitted input:
- B=3/(4*pi)=0.2387324146378430036533256450587715430517.
- mu=3/(2*B^5)=1934.346649506964247784241367188136179234.
- Residual prediction minus CODATA = +98.1939760809642478, about +5.348%.
- With archived positive bridge +8.2e-5, mu=1934.5052659322238188525596749802456064; residual +98.3525925062238189.
- Archived simplification 128*pi^5/81 is wrong by exactly factor 4; correct identity is 512*pi^5/81.
- Wrong simplified expression with bridge evaluates to 483.6263164830559547, not 1836.152673.
- Archive alternative sqrt(3)/(2*B^5)=1116.7955587988964881, also inconsistent.
- Archived rounded B_stable=0.24177 with mu=3/(2*B_stable^5) gives 1815.8468065861707808; residual -20.3058668398292192.
- To force the original B formula to match CODATA requires Delta_bridge=-0.05076338106512212 (not archived +0.000082), or B=0.24123287565696146. BOTH are inverse fits, not predictions.

## Reproduction code
```python
import mpmath as m
m.mp.dps=70
observed=m.mpf('1836.152673426')
sigma=m.mpf('0.000000032')
B=3/(4*m.pi)
pred=3/(2*B**5)
bridge=m.mpf('8.2e-5')
print('B',B)
print('base',pred,'residual',pred-observed)
print('bridge',pred*(1+bridge),'residual',pred*(1+bridge)-observed)
print('correct simplification',512*m.pi**5/81)
print('wrong simplification',128*m.pi**5/81)
print('required bridge fit',observed/pred-1)
print('required B fit',(3/(2*observed))**(m.mpf(1)/5))
assert m.almosteq(pred,512*m.pi**5/81)
assert m.almosteq(pred/(128*m.pi**5/81),4)
```

Uncertainty discipline: residual divided by CODATA observational sigma alone is NOT a calibrated goodness-of-fit significance because model uncertainties are not specified. The comparison disproves the archived algebraic and numeric zero-deviation claim for the stated inputs, not the entire SAT/H(s)H research program.

## Mandatory BEDROCK update verified
ND-2026-10-25-01 added at the top of HsH/BEDROCK.md, commit e64501b954602f0295a3db87afc757e392ab8a64, verified blob 4cabda482c48c217614b868a2138409275df9bf7. Every research calculation must use a specific real measured system; no-data calculations require Nathan's explicit PRIOR permission. Do not invent fixtures. All workers mandatory. This is a research protocol change, not physical validation.

Mersearch: four request lanes inspected and occupied; bounded primary-file reads used; no fresh Mersearch execution claimed.
Privacy: only public-safe archive compilations, public CODATA, and public BEDROCK methodology included. No private excerpts or protected signet.
