# Sable Calculation Relay :00 | 2026-10-26T01Z | Real helium isotope mass minimal pair

STATUS: CODATA_COMPARED | COMMON_S_HISTORICAL_LAW_FAILED | Q_NESTING_CORRECTED | HSH_UNRESOLVED | NO_BEDROCK_PROMOTION

## Measured real physical systems and data
Actual nuclei: helium-3 helion (2 protons, 1 neutron), helium-4 alpha particle (2 protons, 2 neutrons). CODATA 2022 recommended values (NIST):
m(3He nucleus)=5.0064127862(16)e-27 kg; m(4He nucleus)=6.6446573450(21)e-27 kg.
m(p)=1.67262192595(52)e-27 kg; m(n)=1.67492750056(85)e-27 kg.
Sources: https://physics.nist.gov/cgi-bin/cuu/Value?mh= and https://physics.nist.gov/cuu/pdf/all.pdf
Measured uncertainties are CODATA standard uncertainties; correlations unavailable in this packet. No fabricated physical input.

## Primary SAT and later corrections
SAT archive "2026/SAT CORE - HELIUM STANDARD ATOM 2.txt" (actual title has em dash), blob 5e0f43950244bd5173799ec74b985944cf169ac2, lines 11-16, 35-48, 60-86: He-3 described with Q=9 constituent strands, later He-3 Q=3 effective bundle; inverse-Q numerical mass table.
SAT archive "2026/SAT MATH - BACKBONE.txt" (actual title has em dash), blob 1854995be3311f565739f2be64269cbb0385a82f, lines 43-50, 100-105, 386-391, 457-462: Q=3A, M=(Q*m0/(2B))*S, m0=1.0073e-27 kg, B=3/(4*pi), S=0.2621. Source is compiled/assistant-mediated; original dated user derivation not established.
Current HsH BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7, ND-2026-10-18-07: Q=9 quark-level and Q=3 hadron-level for the SAME He-3 system are nested counts, NOT a contradiction. OC-001 Q/inverse-Q and smoothing law remains open. Mercer 2026-09-19 Run 114 previously located positive-Q versus inverse-Q scaling conflict; no automatic new-theory assertion here.

## Exact algebra and measured test
With He-3 Q=9 and He-4 Q=12 at the SAME constituent resolution, common B, m0 and S imply
M3/M4=(9*m0*S/(2B))/(12*m0*S/(2B))=3/4=0.75, independently of numerical values of B,m0,S.
Observed CODATA nuclear mass ratio = 0.7534493543097819440680.
Observed minus historical fixed-S prediction = +0.0034493543097819440680.
Using CODATA +/- one-standard-uncertainty intervals, the observed ratio is in [0.7534493538308643, 0.7534493547886996], which does not contain 0.75. Correlation is not assumed for this conservative interval calculation; it is NOT a calibrated statistical significance.

Using exactly archived m0, S, B:
M3 historical common-S = 4.9765340278666666e-27 kg, residual -0.5968097240%.
M4 historical common-S = 6.6353787038222221e-27 kg, residual -0.1396406270%.
The absolute closeness is NOT independent prediction: archived m0 and S lack independently established derivations and uncertainty.

The literal historical inverse-Q table gives He-3 m0/3=3.3576666667e-28 kg, far below measured nuclear mass. Extending m0/Q to He-4 (explicit extrapolation, NOT source quotation) gives 2.51825e-28 kg and mass ratio 4/3, wrong direction.

The observed isotope pair would require S4/S3=0.99542191616456846 if the rest of the historical formula were held fixed. This is an inverse fit, NOT a correction or independent prediction. Do not tune S to measured masses.

Measured p,n and nuclear masses imply binding energies He-3 7.71798964967844 MeV, He-4 28.29561085477029 MeV; difference 20.57762120509184 MeV. Thus nuclear binding is a real additional sector, not removable by an unqualified common multiplicative constant. Any operative finite-core H(s)H law must derive the distinct binding and spin responses, not merely choose separate S values.

## Actual tests and gates
Python Decimal 55-digit numerical execution; SymPy exact ratio cancellation; dimensional check Q,B,S dimensionless, m0 mass; positivity and sign; CODATA input interval; SI/Planck native consistency c=G=hbar=1; nuclear binding energy from CODATA measured nucleons and nuclei. All internal algebra checks PASS. Historical exact isotope-mass claim FAIL. S(Q,n) / finite-core interbraid dynamics not derived, so UNRESOLVED. No active independent H(s)H CODATA candidate and no BEDROCK promotion.

Executed script SHA256: 22b38a2fc79321d85f25a78ca85729272b51daa3fac79424037b79c9e0ba64a4
Executed stdout SHA256: 0bf9f23512950da33f885278a423531d3aec22d8e1a308ce0dfecb67e0620773
Full executable code and stdout preserved in Nathan's Calculation Relay conversation and local report, not inferred from this digest.

## Reading and search
Current root BEDROCK 563 lines / 86946 chars, SHA 4cabda482c48c217614b868a2138409275df9bf7; STATE_OF_THE_THEORY 155 lines / 11012 chars, SHA b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual secrets.randbelow(3) -> 2 selected SAT "HsH COSMOTOPOLOGY.txt", blob 9f42b96adfa1cb9b310ad8d89843b93ae0379922, 2898 lines / 98867 chars, sampled substantial sections including unrelated Kerr/ER and surface topology; full fetched, not individually interpreted line by line. Mersearch four request lanes occupied; GitHub connector fallback searched SAT, HsH and HSH_RESOURCES. No completed Mersearch run claimed. No private source material included here.

NEXT: derive from existing finite-core/interaction equations a common, nonfitted S(Q,n) or binding functional that accounts for both actual isotope masses and helium spin/magnetic readouts; preserve failure if not found.
