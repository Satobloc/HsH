# Aldus :48 | SAT neutrino mass triple versus PDG 2026
Task calc48-20261025T14Z-aldus-neutrino-splittings-001; 2026-10-25 14Z nominal; h=350; seq=1754; worker Aldus; next Calder.

REAL SYSTEM: Solar/reactor (KamLAND) and atmospheric/accelerator neutrino oscillations (SK, IceCube, T2K, NOvA). PDG 2026 neutrino review, Table 14.7, NuFIT 6.0 normal ordering with SK-ATM and IC24, revised March 2026, PDF August 6 2026:
https://pdg.lbl.gov/2026/reviews/rpp2026-rev-neutrino-mixing.pdf
Measured fit: dm21=(7.49 +0.19/-0.20)e-5 eV2, 3-sigma [6.92,8.05]e-5; dm32=(2.438 +0.021/-0.019)e-3 eV2, 3-sigma [2.376,2.503]e-3. Model-dependent global-fit extractions, not raw events.

HISTORICAL: SAT root PREDICTIONS.txt (filename prefixed with Unicode U+1F9F1), and HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM same filename, identical blob 93ea662e58c1ebb9456ba942329f2f47438c4631. One copied compilation, not independent derivations. Source gives m1,m2,m3=(5.0,8.9,16.3) meV, sum about 0.030 eV, but SAME source uses dm21=7.42e-5 and dm31=2.517e-3 eV2 in its appearance calculation. Original message date and author attribution unresolved. SAT GALLEYS.txt, blob cdc149c8335a55317924416bdcd8d41ed5fe3488, repeats the masses following a mixing-kernel claim, not a recovered full derivation.

EQUATIONS (normal ordering): dmij=mi^2-mj^2; 1 meV=1e-3 eV. dm21=(8.9^2-5.0^2)*1e-6=5.421e-5 eV2; dm32=(16.3^2-8.9^2)*1e-6=1.8648e-4 eV2; dm31=(16.3^2-5.0^2)*1e-6=2.4069e-4 eV2. Identity dm31=dm32+dm21 PASS. Sum 0.0302 eV consistent with rounded sum. SAME-SOURCE appearance-input residuals: dm21 -1.999e-5; dm31 -2.27631e-3 eV2. The appearance dm31 is about 10.46 times the mass-triple value.
PDG EXTERNAL residuals: dm21 -2.069e-5 eV2; dm32 -2.25152e-3 eV2. Both predicted splittings are below the PDG reported 3-sigma intervals. Residual divided by observational 1sigma only -10.345 and -118.501; NOT joint model significance, because no mass prediction uncertainties or covariance. Conditional inversion fixing m1=5.0 meV requires m2=9.994998749 meV and m3=50.377574376 meV; DATA FIT ONLY, not an independent SAT prediction or authorized correction.

EXECUTED PYTHON core (Decimal 55-digit):
from decimal import Decimal as D, getcontext
getcontext().prec=55
m=[D("5.0")*D("1e-3"),D("8.9")*D("1e-3"),D("16.3")*D("1e-3")]
d21=m[1]**2-m[0]**2; d32=m[2]**2-m[1]**2; d31=m[2]**2-m[0]**2
assert d31==d21+d32
assert d21==D("5.421e-5") and d32==D("1.8648e-4")
assert d31==D("2.4069e-4")
assert d21<D("6.92e-5") and d32<D("2.376e-3")
print(d21,d32,d31)
Full executed program SHA256 6a16bf02e63d9cc37bbe342a8134c22ec642a4428b57ff7fc7cb0e4d29d64332. All assertions PASS; complete code, JSON, stdout, precision figure retained for Nathan manual archival.

READING: BEDROCK full fetched 563 lines/86946 chars, blob 4cabda482c48c217614b868a2138409275df9bf7; all lines scanned in four bounded ranges, including ND-2026-10-25-01, ND-2026-10-18-02/03 and BR-007/008. STATE_OF_THE_THEORY full fetched/read 155 lines/11012 chars, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
RANDOM: Python secrets.randbelow(2) over [HsH SAT_CONVOS_5/music_lang.txt, SAT SAT O AUDITS/EMULATOR ANALYSIS.txt] returned index 1. Selected SAT file full fetched, 1325 lines/42077 chars, blob 34b4379689ea4c4f36b0066ee4cacd9b4d818585; beginning/middle/end inspected. Authentic unrelated observation: trivia player emulator probability models and Python expertise-breadth prototype.
MERSEARCH: guide blob 82ffe3ebd837de1d997af78b04d411481f75158e read; all four lanes occupied; none overwritten. NO Mersearch run claimed. GitHub fallback searched SAT and HsH, not HSH_RESOURCES; source genealogy partial. Procedural deviation: GitHub search preceded lane inspection. Privacy: no private records, protected signet, sensitive excerpts.

VERDICT: REJECTED for simultaneous archived numerical claims; underlying H(s)H neutrino mechanism UNRESOLVED; PDG_2026_COMPARED; CODATA NOT_APPLICABLE (not a CODATA quantity); no BEDROCK promotion.
