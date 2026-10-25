# Alberr Calculation Relay 2026-10-25 14Z: electron/proton gravity-scale audit

Status: CODATA_COMPARED / CONDITIONAL NEGATIVE TRANSFER / NO INDEPENDENT SAT PREDICTION.

Original HsH equations: hbar=m0*c*ell_f*B; G=c^2*ell_f*Omega/m0. Eliminating ell_f gives G=hbar*c*Omega/(B*m0^2), and in Planck units (c=G=hbar=1) Omega=B*(m0/mPlanck)^2. Both relations are dimensionally sound. Historical MACHINE1.py fixes m0 to electron mass, so proton substitution is explicitly hypothetical.

Measured systems: electron, proton and Newtonian gravitation. CODATA 2022 NIST (2024 v9): G=6.67430(15)e-11 m^3 kg^-1 s^-2; me=9.1093837139(28)e-31 kg; mp=1.67262192595(52)e-27 kg; exact c=299792458 m/s; exact h=6.62607015e-34 J s. B_e=3/(4*pi)=0.238732... historical; B_p=0.24123 historical rounded fit to proton/electron mass ratio, not independent.

Executed Python: mPlanck=2.1764343427178984e-8 kg; ell_e=1.6175401569202115e-12 m; Omega_e=4.1821368775858875e-46 (calibrated to measured G); Omega_p_sameB=1.4099893145798471e-39; Omega_p_Bfit=1.4247404269423415e-39. Historical Omega=1 electron formula produces G=1.5959066370521804e35 SI, not observed G. Fixing Omega from the electron and replacing m0 with proton plus fitted Bp produces G_p=1.9591523925502472e-17 SI, residual against CODATA G = -6.674298040847606e-11 SI, ratio 2.9353675929314647e-7. This is a conditional transfer failure, not a falsification of SAT/H(s)H. Universal Omega under naive mass-anchor substitution requires Bp/Be=(me/mp)^2=2.966077000967978e-7, inconsistent with the archived near-0.24 values. The model does NOT require mass-anchor substitution: that is the unresolved construction gate.

Source genealogy: SAT SCALING.txt blob dcf23fbeda258da813f54360ab1a7f33243c7089 (B(o), topology/bundling dependence); SAT SATOBLOC/SATOBLOCK_inputs.txt blob ee08d8a6f5f187847914442f5971c7e2ed8cecd7; HsH MACHINE1.py blob 6b0d229108186861bda48c54472cacb60afd9; HsH B_IS_INVERSE_REFRACTIVE_INDEX.md blob 8946e37a6e3b07a7d1f89e6f95c64769e96b0855; HsH QUANTUM GRAVITY.txt blob ad108b3e9e40f1948dd25b337eec191bdc5bf180. No unique correction; geometry/topology of Omega unresolved.

Actual random reading: SAT 2025-8-24 STATUS OVERVIEW.txt blob a23e1458a882340de4f6319c7eb8a34c7f6c5ab0 (144 lines, internal date 2025-08-31, curvature-action toy UV damping); HsH SAT_BOSONIC_TIME_LAGRANGIAN_DENSITY.txt blob 3705346433dcba8d8b7da9ac8f1d7c72366a4a69 (76 lines, May 11 2025 NotebookLM source synthesis). Controls: BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7; STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Mersearch four lanes occupied by existing requests, not overwritten; bounded three-repo GitHub code search fallback, not a Mersearch result.

Reproducible script, machine output, full report, and Class P plot retained in the live Calculation Relay conversation; public issue text is a compact intake artifact, not BEDROCK promotion. Next: recover exact semantics of electron m0 anchor, B(Q,topology) and Omega geometry before making cross-species claims.

CODATA: https://physics.nist.gov/cuu/pdf/wall_2022.pdf
