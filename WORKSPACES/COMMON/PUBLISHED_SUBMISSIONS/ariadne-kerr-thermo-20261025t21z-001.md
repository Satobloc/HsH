# Ariadne :48 | 2026-10-25T21Z | Kerr thermodynamic unit gate
Task calc48-20261025T21Z-ariadne-kerr-thermo-001. h=357; seq=1789; ring index 3 Ariadne; successor Alberr.

STATUS: INTERNALLY_CHECKED standard-Kerr correction, OBSERVATIONAL_CONSTRAINT_COMPARED with actual Cygnus X-1. CODATA 2022 constants used as inputs only. No direct CODATA observable or independent H(s)H prediction. No BEDROCK promotion.

ARCHIVE: HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt, blob 54f2f530697ab6e9c44758ce3406c4144915c73d, 4740 lines, 235200 characters, heading 7/4/2026 (original message date unverified), lines 596 and 608-610:
Delta_r=(r^2+a_k^2)(1-Lambda_k*r^2/3)-2*M_k*r+Q_k^2;
Omega_H=a_k/(r_+^2+a_k^2);
T_H=hbar*c^3*sqrt(M_k^2-a_k^2-Q_k^2)/(4*pi*k_B*(r_+^2+a_k^2)).
The same file contains unproven mapping a_k=sqrt(Tr(Omega_k^T Omega_k)/2), which is NOT independently established as the Kerr length parameter.

SAT antecedent: SAT_THEORY_ARCHIVE_2023-25/black-hole chapter (path begins with emoji and ends BLACK HOLES.txt), blob 25380d839724fb98dca53516c520ba1cc3810bc9, lines 17-23,229, states Schwarzschild T=1/(8*pi*M) in G=hbar=c=k_B=1 and SI hbar*c^3/(8*pi*G*M*k_B). This is a standard reference, not independent Kerr evidence.

REAL SYSTEM: Cygnus X-1. M=21.2 +/- 2.2 solar masses, Miller-Jones et al., Science 2021, DOI 10.1126/science.abb3363. Spin chi>0.9985 (3-sigma lower bound), Zhao et al., ApJ 908,117 (2021), DOI 10.3847/1538-4357/abbcd6; model-dependent thin-disc continuum fit, alignment and torque assumptions. The lower bound is NOT a point measurement. IAU 2015 B3 exact nominal GM_sun=1.3271244e20 m^3/s^2. CODATA 2022 c=299792458 m/s, h=6.62607015e-34 J*s, k_B=1.380649e-23 J/K exact, G=6.67430(15)e-11 SI; G cancels in the nominal GM_sun normalization.

TEST: For the observationally constrained Kerr Q=0, Lambda=0 specialization, let r_g=GM/c^2, chi=Jc/(GM^2), q=sqrt(1-chi^2), a=chi*r_g, r_+=r_g*(1+q), r_-=r_g*(1-q).
Correct SI horizon angular velocity Omega_H=c*a/(r_+^2+a^2) [s^-1].
Correct SI Hawking temperature T_H=hbar*c*sqrt(r_g^2-a^2)/(2*pi*k_B*(r_+^2+a^2)) [K].
The archived Omega expression is in inverse meters, not SI inverse seconds. Its printed T expression has dimensions K*m^2/s^2, not K. In c=1 geometrized units it is still smaller than the standard Kerr temperature by a factor 2. Ratio of printed SI numeric formula to correct expression is c^2/2, dimensionful, not a physical residual. Correction follows standard surface gravity kappa=sqrt(r_g^2-a^2)/(r_+^2+a^2), T=hbar*c*kappa/(2*pi*k_B). For charged/de Sitter cases additional horizons and normalizations require separate derivation: do not promote this Kerr-only correction as a universal KNdS formula.

EXECUTED 65-digit mpmath + SymPy: at M=21.2 solar masses and the observed chi=0.9985 lower-bound boundary, r_g=31304.45080666 m, a=31257.49413045 m, r_+=33018.42309100 m, r_-=29590.47852232 m; a/r_+=0.946668290133; Omega_H=4532.96586103 rad/s, T_H=3.02165651707e-10 K, T_Schwarz=2.91050019385e-9 K, T/T_Schwarz=0.103819148456. For fixed mass and chi>0.9985, T_H is BELOW the boundary value and Omega_H ABOVE it. Mass-only standard relative uncertainty is 2.2/21.2=10.377%; a one-sided spin bound is not Gaussian. No Hawking-temperature measurement is claimed. Symbolic Schwarzschild chi->0, extremal chi->1, r_+*r_-=a^2, dimensions and sign checks PASS.

READING: full live BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 fetched (563 lines, 86946 chars), controlling ND-2026-10-25-01, ND-2026-10-18-02/03 and BR-007/008 inspected; full STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 fetched (155 lines, 11012 chars). Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e read. Four Mersearch lanes occupied by Orson, Tern, Morrow, Meridian; no run claimed; direct SAT and HsH searches are partial. Actual secrets.randbelow(3)=2 from declared three-file pool selected SAT Making AI Music Weird.srt, blob 26bd5b4ac6dbca0617c9a289c4741409de09c94e, 3971 lines, 67884 chars, complete retrieval and dispersed passage review. Around 16:55 the transcript contrasts technical resolution with loss of coherence. Unrelated to physics result. No private material, personal records or protected signet included.

VERDICT: Unique standard-Kerr dimensional/normalization correction INTERNALLY_CHECKED; measured black-hole constraint compared; general H(s)H Kerr-worldtube dynamics UNRESOLVED. No arbitrary parameters, numerical tuning, claim of Hawking observation or physical validation.
