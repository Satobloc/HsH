# Sable Calculation Relay :48 | 2026-10-26T04Z | Historical SAT action-scale closure

Task `calc48-20261026T04Z-sable-action-scale-001`; h=364, seq=1824, ring worker Sable, successor Loom. STATUS: `CODATA_COMPARED` (historical numerical assertion fails); `REJECTED AS WRITTEN` (HsH length-from-frequency formula dimensionally invalid); `UNRESOLVED` physical finite-core normalization. No BEDROCK promotion.

## Exact recovered claims and source genealogy

SAT archive `2026/SAT MATH — BACKBONE.txt`, Git blob `1854995be3311f565739f2be64269cbb0385a82f`, G1 lines 284, 323, 332: `m0≈1.0073×10^-27 kg`, `ell_f≈0.7937 fm`, `B=3/(4pi)`, `hbar=m0*c*ell_f*B`, followed by scorecard claim `1.054×10^-34 J s` and `0.0%` deviation. Compiled file original equation composition date/individual authorship not established; a generated scorecard is not a measurement.

HsH `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt`, blob `02312fbb23167e8ce1c996451199ee0e498437b1`, lines 9-14: `ell_f=[h*c/(2*pi*f_He3*alpha^2)]^(1/3)=(2A/T)^(1/3)≈0.793732 fm`; `m0≈1.007276×10^-27 kg`; `B=3/(4pi)`. No independently verified provenance for the He-3 frequency or `A/T` in that passage. Later BEDROCK ND-2026-10-18-07 identifies historical ell_f as first-order *coil radius*, NOT intrinsic core thickness or measured proton charge radius.

## Real physical system and versioned measurements

NIST CODATA 2022 web version 9.0 (May 9, 2024): proton mass `m_p=1.67262192595(52)×10^-27 kg`; proton rms charge radius `r_p=8.4075(64)×10^-16 m`; exact SI `h=6.62607015×10^-34 J s`, `c=299792458 m/s`; `hbar=h/(2pi)=1.05457181764615639×10^-34 J s`. The measured proton mass and charge radius are comparison controls, NOT substitutes for the distinct historical anchors. The historical m0 and ell_f have no sourced standard uncertainties.

## Executed, unfitted calculation

Native Planck units `c=G=hbar=1`: `hbar_model/hbar_CODATA=(m0/mP)*(ell_f/lP)*B`; this is algebraically identical to the SI comparison. With SAT G1 rounded anchors: ratio `0.5425892021702560`, `hbar_model=5.72199281167865×10^-35 J s`, residual `-4.82372536478292×10^-35 J s` (fractional `-45.74107978%`). With HsH refined anchors: ratio `0.5425981497212255`, `hbar_model=5.72208717002954×10^-35 J s`, residual `-4.82363100643202×10^-35 J s` (fractional `-45.74018503%`). Both disagree with the historical 0% scorecard. No uncertainty-normalized z score exists because hbar is exact in SI and the historical anchor uncertainties are unspecified.

Dimensional gate: `[m0*c*ell_f]=M L^2 T^-1=[hbar]`, PASS. However with measured frequency `[f_He3]=T^-1` and dimensionless alpha, `[h*c/f_He3]=M L^3 T^-1`, so `[(h*c/f_He3)^(1/3)]=M^(1/3) L T^(-1/3) != L`. Thus the recovered HsH ell_f expression FAILS as an SI length derivation; a unique missing conversion is not supplied. The source's second `(2A/T)^(1/3)` form cannot be audited without defining A and T units.

Control only, NOT a theory prediction: replacing BOTH historical anchors with measured `m_p` and measured `r_p` would yield `m_p*c*r_p*B/hbar=0.9543783835 ± 0.0007264968` (uncorrelated propagation), but this changes the physical definitions and is not a valid repair. In particular the coil radius is not a proton charge radius. The archival `1.007276` resembles CODATA proton mass **in atomic mass units**, but unit-confusion is only a hypothesis, not a proven source correction.

Primary Python `sable_action_scale.py` SHA-256 `0d3a8d9de33199905c747357f7d52bfc2c2fd76af4854f2f2501abae91eb3dea`; real execution `ALL ASSERTIONS PASS`, SymPy dimensional checks, mpmath 75 digits, Planck/SI closure, sign/limit tests. Complete source/output retained in originating chat. Mersearch guide consulted; all four bridge request lanes occupied by 2026-10-25 inventory requests and not overwritten; no fresh Mersearch run. Both main archives directly read with SHA-provenance; chronology remains partial. Privacy guard: public main-archive excerpts and public CODATA data only, no restricted HSH_RESOURCES or protected signet.

Next worker Loom: recover independent definitions/derivations of `m0`, `ell_f`, `A/T`, and the He-3 frequency before proposing any correction. Propagate a justified change across mass, Casimir and action sectors without fitted constants.
