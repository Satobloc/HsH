# Enheduanna :24 | 2026-10-25 23Z | Smith–Purcell measured-system near-field audit

STATUS: STANDARD MAXWELL CONTROL PASS / HISTORICAL JONES CROSSWALK MATHEMATICAL ONLY / H(s)H PHYSICAL LINK OPEN. seq=1797; next Tern Rook.

REAL SOURCE: Zhu et al., Nature Communications 17, 10911 (published 2026-10-22), DOI 10.1038/s41467-026-78729-w. Representative nominal electron 30 keV, silicon grating pitch 120 nm, gap 20 nm; Fig. 3 simulation normal-emission wavelength 365.4 nm. Maximum measured circular contrast 0.87 in a distinct optimized geometry. Experiment dates, pitch/beam uncertainties and uncertainty on maximum contrast not supplied in the main text used.

CODATA 2022 INPUT: electron rest energy 0.51099895069(16) MeV, NIST physics.nist.gov/cgi-bin/cuu/Value?mec2mev. This is an input, not a SAT prediction.

ORIGINAL SAT: SAT_THEORY_ARCHIVE_2023-25/MORE_PYTHON/timesheet_proj.py, Git blob 828e4e07da1c6696aba00126d46231576f780ee8; fixed-z transverse displacements X=Ax sin(n pi z/L) cos(n tau), Y=Ay sin(n pi z/L) cos(n tau+phi), with Ax=.7, Ay=.218, phi=2 radians. HsH ARCHIVE: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D_THEORIZING.txt, blob 3139f49f360fed5077d5e57c251244324beffe2a, lines ~2186 and 2548-2591, elliptical/circular transverse trace discussion. Authorship/message dates for those excerpts not independently verified. Current BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 and STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 read. Four live Mersearch lanes occupied; bounded GitHub fallback, no new Mersearch execution claimed.

CALCULATION (executed Python): gamma=1+T/(m_e c^2); beta=sqrt(1-gamma^-2)=0.3283761761568454. Smith-Purcell lambda=p(1/beta-cos theta). Evanescent transverse inverse decay kappa=(2 pi/lambda)/(beta gamma). Eliminating lambda gives delta=1/kappa=p gamma (1-beta cos theta)/(2 pi). At theta=90 degrees: delta=p gamma/(2 pi).

30 keV, p=120 nm, theta=90 degrees: lambda=365.4345495 nm, delta=20.2198436 nm, exp(-20nm/delta)=0.3719011 (exponential envelope only; NOT full Hankel amplitude or absolute intensity). 20 keV at same p/theta: lambda=441.3940646 nm, delta=19.8460935 nm. p=100 nm at 30 keV: delta=16.8498697 nm. With alpha=45 degrees and effective period p/cos alpha: lambda=516.8024961 nm and delta=28.5951771 nm. The paper's 365.4 nm is a rounded simulation control, not independent measured wavelength; difference +0.03455 nm is within displayed rounding.

CODATA MASS-ONLY propagated standard uncertainties: u(beta)=4.7174e-11, u(lambda)=5.2497e-8 nm, u(delta)=3.5108e-10 nm. They EXCLUDE beam-energy, grating, angular and gap uncertainties; no valid empirical z-score follows.

PAPER'S MEASURED CIRCULAR CONTRAST D=.87 implies I_RCP/I_LCP=(1+D)/(1-D)=14.384615 and two-channel fractions 0.935/0.065. The archived illustrative fixed-z displacement Jones crosswalk yields S3/S0=2 Ax Ay sin(phi)/(Ax^2+Ay^2)=0.516288714. It is NOT a prediction of the experiment: historical mechanical displacements have not been mapped to actual electric fields, and the moving-dot path has a time-varying envelope. Measured aggregate RCP/LCP intensities do not determine a unique coherent Jones state.

CHECKS: dimension/limits PASS; dispersion and decay algebra PASS; CODATA dependent arithmetic PASS; historical Jones representation PASS as math only; full FDTD angular polarization and physical H(s)H coupling OPEN; no invented coupling or promoted theory claim.

RANDOM READING: actual Python secrets.randbelow selected SAT SCALING.txt (blob dcf23fbeda258da813f54360ab1a7f33243c7089, 22550 chars retrieved, opening ~12.5k inspected) and HsH SAT—Blockwave Ideal Model.txt (blob dd0631bc0b25c951dc5e1d6738280e08487b46b2, 57038 chars retrieved, opening ~12.5k inspected). Both are historical, not operative authority.

COMPLETE SOURCE/OUTPUT: calculation script, stdout, results.json, full report and Class P figure are included in the turn's research bundle and visible in the conversation for manual archiving. No Lean execution claimed.
