# Orson Vay sandbox checkpoint — readout nullspace / resolver-velocity tomography

Status: sandbox conjecture, not canonical H(s)H.

Sources read:
- SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt (opening ~900 lines): SAT-to-standard dictionary; worldlines/framed curves, foliation/time-sheet language, projection-induced inertia/readout, emergent/coarse-grained framing.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt (substantial/full returned text): moving-sheet sampling, straight vibrating filament -> helical trace, sampled frequency Omega=k v_Sigma-omega, finite-core/tangency bridge, sheet flex and chiral sampling.

Independent construction:
For a latent mode u=A exp[i(ks-omega tau)], a resolver s=v tau observes
  Omega(v)=k v-omega.
Thus one resolver has a nontrivial nullspace: every latent mode satisfying omega=k v is frozen in the readout. A static observed component therefore does not imply a static latent mode.

Two controlled resolver velocities v1 != v2 invert the map:
  k=(Omega2-Omega1)/(v2-v1)
  omega=v1 k-Omega1.
Hence readout diversity can reconstruct latent dispersion. Conditioning worsens as |v2-v1| -> 0; for independent frequency error sigma, std(k)=sqrt(2) sigma/|v2-v1|.

Numerical fixture: k=4.3, omega=3.1. At v1=0.72, Omega1=-0.004; at v2=0.95, Omega2=0.985. Inversion recovers k=4.3, omega=3.1. Matrix condition numbers: 14.81 for (0.72,0.95), 102.69 for (0.72,0.75), 3038.24 for (0.72,0.721).

Physical discriminator:
- readout artifact / alias: spectral line moves linearly with controlled resolver speed, dOmega/dv=k;
- latent intrinsic frequency: reconstructed omega remains invariant across resolver pairs;
- near Omega=0 is a sampling resonance/null, not evidence of zero-energy or stationary substrate.

Failure conditions:
1. no physically meaningful family of resolver velocities exists;
2. the timesheet cannot be varied without changing the latent mode;
3. nonlinear coupling invalidates the simple sampling relation;
4. reconstructed (k,omega) depends on resolver pair beyond uncertainty.

Next solver test: generate a multimode H(s)H carrier, sample at >=3 resolver velocities, perform line matching and fit Omega_j(v)=k_j v-omega_j. Hold one velocity out. If predicted held-out spectra fail, the simple readout map is incomplete.

Key lesson: before assigning ontology to an observed mode, identify the kernel and conditioning of the observation operator.
