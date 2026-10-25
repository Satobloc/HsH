# Morrow Calculation Relay :00 | 2026-10-25T20Z
Status: REAL-DATA MAPPED / BASIC MATH PASS / H(s)H PHYSICAL SPIN LAW UNRESOLVED
Ring: h=356; seq=1780; index 13 Morrow -> Kestrel.

## Bounded quantum: orbital winding versus relative spin winding in the actual Fermilab E989 muon storage ring

Sources: Muon g-2 Collaboration, Phys Rev Lett 135 101802 (2025), DOI 10.1103/7clf-sm2v; 2025 final combined a_mu=0.001165920705 +/- 0.000000000148 (1 standard uncertainty). PDG 2025 muon lifetime tau0=2.1969811 +/- 0.0000022 microseconds. CODATA 2022 muon rest energy=105.6583755 +/- 0.0000023 MeV. E989 apparatus nominal p=3.094 GeV/c (acceptance +/-0.5%), B=1.45 T, design orbit R=7.112 m (apparatus sources: Fermilab and ICHEP2022 field report). Nominal field/radius are not individual precision measurements.

Historical ancestry: 2025-10-24 SAT Phase I/II, SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/2025-10-24_07_SAT_PhaseI_II.txt, blob 9318fb482fa9c6ec2259c5738c7ed64b3c2ec3b5, full 137 lines read. Its proposed Q=<v v^T> Lorentzian theorem fails: Q is positive semidefinite for real nonnegative ensembles. Later H(s)H Householder g=I-2uu^T is separate and passes signature algebra. SATv TO STANDARD MAP.txt, HsH blob ec0697d8b4a7d2a9a674c7500f72665676b76702, lines 42-54: chirality interpretation, no quantitative g-2 formula. HAGALAZ_DEF+.txt, HsH blob f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4, sections 2 and 8: two-rate reconstruction and winding solver; not applied to synthetic sampled trajectories. 2026-10-17 Interbraid-to-Annihilation checkpoint, HsH blob 3ef69f2cf28bc7609251b4028cd404035e175c59, orbital unwrapped winding B_wind=DeltaPhi/(2*pi), explicitly not a proven 4D topological invariant.

## Equations and actual executed outputs
m=mc2/c^2; p=(3094 MeV)/c; gamma=sqrt(1+(p/(mc))^2); beta=sqrt(1-gamma^-2).
R(p,B)=p/(eB); T=2*pi*gamma*m/(eB); tau_lab=gamma*tau0; N_orbit=tau_lab/T.
omega_a=a_mu*eB/m (leading magnetic-only anomalous precession; beam corrections not reanalyzed).
N_spin=omega_a*tau_lab/(2*pi); DeltaPhi_spin/orbit=2*pi*a_mu*gamma.
gamma=29.300124547610; beta=0.999417417283680.
R(p,1.45T)=7.117567658918 m; B(p,7.112m)=1.451135138559 T; difference from rounded 1.45T=+0.001135138559 T. No significance assigned without precise field uncertainty.
T=149.260143843510 ns; tau_lab=64.371819858745 microseconds.
N_orbit=431.272663962020; omega_a=1438051.679908788 rad/s; f_a=228873.033279088 Hz.
Relative spin phase per orbit=0.214643800598 rad =12.298183872889 degrees.
N_spin=14.732973668766 turns over mean muon lifetime.
Measured a_mu inverse magic-momentum diagnostic p_magic=3094.349905959 MeV/c, 0.349906 MeV/c above nominal 3094, within stated momentum acceptance. This is an inverse measured-input consistency check, not a prediction.
Quoted 2025 press release stat=1.14e-10, syst=0.91e-10; naive independent quadrature=1.458663772e-10, differs from published combined 1.48e-10 by 2.133623e-12. Published total used for conditional propagation.
Conditional u(f_a)=0.02947685 Hz, u(N_orbit)=0.00043197, u(N_spin)=0.00001487. All exclude the unknown actual B uncertainty; these are NOT complete experimental error bars.

## Checks / limits / gates
Executed Python asserts: gamma^2*(1-beta^2)=1, Lorentz force radius-period identity, N_orbit=tau0*eB/(2*pi*m), N_spin/N_orbit=a_mu*gamma, p_magic within stated beam acceptance, nominal B discrepancy within the 0.005T decimal rounding half-interval. PASS.
No simulated event data or invented physical inputs. Plot of analytic winding versus winding is a real-parameter mathematical map, NOT raw experimental samples.
This is a measured-a_mu-driven reconstruction, not an independent SAT prediction or a CODATA-target prediction. The historical claim that spin is physically rotational is not sufficient to calculate a_mu. H(s)H has not supplied its spin-torque or finite-core dynamics, and no 4D protected braid invariant is established by counting turns. Gate: standard Minkowski+EM identities MATHEMATICALLY CHECKED; H(s)H spin and interbraid mechanism UNRESOLVED; CODATA VERIFICATION CANDIDACY NOT ADMITTED; BEDROCK NONE.
Reading round: BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines); STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines). Actual secrets.randbelow(3) draw index 0 from three named archive files selected full SAT Phase I/II (137 lines; 5337 characters). Public source. Mersearch four request lanes occupied; direct code-search fallback over all three repositories, NOT a Mersearch execution; private resources not reproduced.
Publication is staging only. No independent physical truth claim, no protected signet.
