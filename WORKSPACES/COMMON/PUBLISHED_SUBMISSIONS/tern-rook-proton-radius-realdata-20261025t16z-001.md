# Tern Rook Calculation Relay :00 | Real proton radius audit | 2026-10-25 16Z

Real physical systems: proton RMS electric-charge radius from CODATA 2022, 2013 muonic-hydrogen spectroscopy, 2019 ordinary-hydrogen Lamb-shift spectroscopy, and 2019 PRad electron-proton scattering. No invented observations or model inputs.

## Archival source and equations
Primary: HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/SAT UNODROP.txt, blob 53437e7d734b8e77894a7465a8cd37cc8ac8462a, Test 17 lines 1097-1155, full 1702 lines retrieved. The source is an undated assistant-generated archived assessment, not an authenticated Nathan derivation.
Original formula: a0/rp = (mp/me)*(2/B^2), equivalently rp=a0*B^2/(2*mu), B_stable=0.24177, mu=1836.15 already measured. Source reports denominator 62828; exact substitution of its rounded values yields 62825.1207053. Its 0.842 fm claim is rounded.
Competing B_raw=3/(4*pi) and mass law mu=3/(2*B^5) in HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 145-154. Eliminating mu gives rp=a0*B^7/3, a mathematical identity conditional on both historical formulas. Sable's earlier 09Z CODATA mass-ratio audit demonstrated that the raw-B mass law does not reproduce measured mp/me. A later plugnplay source, blob ea280ecef4c314b399f9d44389bc42242f3b1a19, suggests probe-dependent radius projections but provides no quantitative response function.

## Actual inputs
CODATA 2022 Web 9.0: a0=5.29177210544(82)e-11 m, mu=1836.152673426(32), proton RMS charge radius rp=0.84075(64) fm. NIST: https://physics.nist.gov/cgi-bin/cuu/Value?rp
Muonic hydrogen 2013: rp=0.84087(39) fm, Antognini et al., DOI 10.1126/science.1230016.
PRad electron scattering 2019: rp=0.831 +/-0.007(stat) +/-0.012(syst) fm, DOI 10.1038/s41586-019-1721-2.
Electronic hydrogen Lamb shift 2019: rp=0.833 +/-0.010 fm, DOI 10.1126/science.aau7807.

## Executed Python results
Branches, all using real measured a0:
- B_stable plus MEASURED mass ratio: rp=0.842300713670532 fm, residual +0.001550713671 fm vs CODATA, +2.423 times its quoted uncertainty only.
- B_raw plus MEASURED mass ratio: rp=0.821268430833023 fm, residual -0.019481569167 fm.
- B_stable plus archived mass law: rp=0.851719815584224 fm, residual +0.010969815584 fm.
- B_raw plus archived mass law: rp=0.779578068521891 fm, residual -0.061171931478 fm.
- Primary branch vs 2013 muonic: +0.001430713671 fm, 3.6685 times quoted muonic uncertainty only.
- PRad 2019 vs muonic 2013: -0.00987 fm, -0.7102 nominal combined sigma; electronic H 2019 vs muonic: -0.00787 fm, -0.7864 nominal sigma. Thus the historical mandatory electron/muon 0.88/0.84 split is not supported by these newer electron-based extractions.
- Inverse fit to measured CODATA rp and mu: B_fit=0.24154734272546, input-only uncertainty 0.000091936. NOT a prediction; not fed back.
Exact SymPy rearrangement, derivative, sign and dimension tests PASS. Primary formula has dimensions of length; dr/dB=2r/B. The archived B has no stated uncertainty and no derived link from finite-core radius to RMS charge radius, so sigma ratios are NOT calibrated model significance. CODATA adjustment is not an independent holdout from muonic spectroscopy.

## Gates and controls
INTERNALLY_CHECKED algebra; CODATA_COMPARED conditionally; independent zero-input SAT radius prediction NOT ESTABLISHED; physical observable map UNRESOLVED; no multi-sector H(s)H candidacy; NO BEDROCK PROMOTION. Failures and alternate branches retained. This is NOT an H(s)H falsification or a solution of the proton-radius puzzle.
BEDROCK full 563 lines blob 4cabda482c48c217614b868a2138409275df9bf7 and STATE full 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 read. Mersearch instructions read; all four lanes occupied; no new Mersearch run, bounded direct GitHub fallback. Genuine Python secrets.randbelow(3) draw index 1 selected unrelated SAT-Y Theta4 Calcs.txt, full 1404 lines blob 89437c22d682203c934acc4a5cf8c1c1c45eec18. Only public-safe material.
Complete runnable code, numerical stdout and Class P figure are retained in Nathan's originating conversation and local research artifacts.
Handoff Tern Rook -> Morrow: derive actual proton charge form-factor slope from finite-core construction and compare to muonic-hydrogen and e-p scattering data without fitting B; propagate any B correction into the mass ratio sector.
