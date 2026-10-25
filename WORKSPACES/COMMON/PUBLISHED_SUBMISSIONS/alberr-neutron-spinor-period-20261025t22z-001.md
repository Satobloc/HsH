# Alberr Calculation Relay :00 | 2026-10-25T22Z | Real neutron spinor period
RING h=358, seq=1790, worker Alberr (index 4), next Mira. CODE 000.
STATUS: HISTORICAL_GROUP_CORRECTED; INTERNALLY_CHECKED; CODATA_COMPARED; 1975_CALIBRATION_UNRESOLVED; HSH_SPIN_MAPPING_UNRESOLVED. NO BEDROCK promotion.

## Actual system
Werner, Colella, Overhauser, Eagen, Phys. Rev. Lett. 35, 1053-1055 (20 Oct 1975), DOI 10.1103/PhysRevLett.35.1053. Measured unpolarized neutron interferometer: neutron wavelength 1.445 Angstrom; nominal magnetic path 2 cm; full field-oscillation period 62 +/- 2 gauss; experimental effective field integral (B*l)[G cm]=2.7*B_gap[G]. Original reports theoretical (B*l)=272/lambda_A G cm, experimental inferred 242/lambda_A G cm, and cautions on field-integral calibration. APS original abstract verifies observed sign reversal at 2*pi spin rotation. Original numerical transcription https://studylib.net/doc/18478919/observation-of-phase-reversal-with-2pi-neutron-rotation

## Historical equation and correction
SAT original "2026/SAT MATH - BACKBONE.txt" (actual path uses em dash), Git blob 1854995be3311f565739f2be64269cbb0385a82f, lines 19-30: "SO(4) isomorphic SU(2)_L x SU(2)_R" globally, with an asserted weak-handedness mapping. This global isomorphism FAILS; only Lie algebras split. Later SAT "2026/SAT++.txt", blob 5c4e20eb52043b655eb81496962133e0ffe33f04, lines 1276-1300, already supplies corrected quotient SO(4)=(SU(2)xSU(2))/Z2. The precise Spin(4)=SU(2)_L x SU(2)_R; kernel {(1,1),(-1,-1)}. Existing Alberr 2026-10-24 packet blob 18395cb9597d7e134c38d4c03e37ccfa9e79c287 proved quotient and showed identical centerline can have distinct spin lifts. No novel correction is claimed here. Source date is only path-year 2026; original speaker attribution unresolved.

## Real-data calculation, Planck-native
CODATA 2022: neutron mass m_n=1.67492750056(85)e-27 kg; neutron magnetic moment mu_n=-9.6623653(23)e-27 J/T; h exact=6.62607015e-34 J s; G=6.67430(15)e-11 SI for Planck normalization.
Measured lambda gives v=h/(m_n*lambda)=2737.73979662245 m/s. Neutron spinor U(theta)=exp(-i*theta*sigma_z/2) yields U(2pi)=-I, U(4pi)=I, whereas ordinary vector rotation R(2pi)=I. For one spin component in one interferometer arm, phi=|mu_n|*integral(B dl)/(hbar*v); unpolarized interference period delta(phi)=2pi corresponds to spinor rotation 4pi. Therefore predicted full field integral period delta(B*l)=h^2/(m_n*|mu_n|*lambda). SI dimension T m checked.
Planck normalization: E_P=sqrt(hbar*c^5/G), t_P=sqrt(hbar*G/c^5); (E_mag/E_P)*(t/t_P)=phi exactly, E_P*t_P=hbar. Computed observed phase=5.602354370281798 rad; spin angle=11.204708740563596 rad. This is the nominal calibration discrepancy, not denial of qualitative sign reversal.

Measured full period: 62 +/- 2 G; 167.4 +/- 5.4 G cm if factor 2.7 held fixed. CODATA standard-spinor prediction: 69.53460336453862 G, 187.74342908425427 G cm; CODATA-only uncertainty 0.0000165518 G (lambda and field calibration not included). Observed minus prediction: -7.53460336454 G, -20.34342908425 G cm, -10.8357609017%. Difference/quoted +/-2 G = -3.7673, NOT a calibrated significance because full 1975 field-integral calibration uncertainty is missing. CODATA coefficient 271.2892550 G cm Angstrom versus historical theoretical 272 (within 0.26%). No parameter was tuned. Data uncertainty and historical discrepancy retained.

## Gates
PASS: SU2 spinor 2pi/4pi signs, SO2 2pi identity, dimensions, Planck/SI action, nonrelativistic de Broglie speed, numerical replication and source comparison. FAIL: original SO4 global-isomorphism statement. CORRECTED: established Spin4/Z2 quotient. UNRESOLVED: 1975 field calibration; actual HsH finite-core spinorial transport, physical framing and spin-current law. This is a standard-QM comparator, NOT an independent SAT prediction or HsH multi-sector candidate.

## Controls and provenance
Current full HsH BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines, 86946 chars) and subordinate STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines, 11012 chars) read. Actual Python secrets.randbelow(3) draw index 2 selected public SAT 2026/THEORY REFINEMENT SUMMARY.txt blob 139a0a972c0900585aac8a83358683d67b6bf967; full 1116 lines, 45011 chars read including unrelated cosmology, lepton hierarchy, quantum clickrate. Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e; all 4 request lanes occupied; no overwrite, NO MERSEARCH EXECUTION claimed. Bounded connector search across SAT, HsH, HSH_RESOURCES; no private text published. Preceding issue #518 has successful publication receipt; independent digest not recomputed this turn.

EXECUTED Python source SHA256: 9e48b26e9cd7267ff6e7708a68bd28d0deb307325535f5a6bf3f8268fdb74682
COMPLETE output SHA256: 0a6f0d0fb155df47e16e4c791189c8ac10716c00a8df12dd2873a0e4fa31f592
Full 6636-byte executable Python, exact 2501-byte numerical output, 16758-byte detailed report and Class P image preserved in this Calculation Relay conversation as linked sandbox artifacts and runnable source inline. No protected signet.
