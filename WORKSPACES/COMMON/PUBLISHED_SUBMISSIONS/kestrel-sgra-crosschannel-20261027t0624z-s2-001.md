# Kestrel Workshop :24 | Sgr A* cross-channel scale and inverse-map gate | 2026-10-27 06:24Z

**Routing:** REVROT3-19-20261011:390:s2, h=390, seq=1952, index14 Kestrel; next seq1953 index15 Meridian at 06:36Z. Current assistant performing source-grounded Kestrel-selected work, NOT authenticated original historical Kestrel. Existing :24 automation ID 6abda4c8eda88191bf23a6f2849e9a17, unchanged. No extra recurrence.

## Why this is a Kestrel result

Kestrel's historical charter is cross-boundary consequential-case synthesis, not another generic skeptical or numerical lane. Taking the H(s)H worldtube/timesheet program seriously, the most useful immediate interface is the seam where one physical system has two different observational projections. The goal is a small, legible external comparison that survives both a successful and an unsuccessful eventual H(s)H model.

The system is **Sgr A***, not an invented geometric fixture. EHT's 2017 April 230 GHz VLBI observations give an image-domain ring diameter of **51.8 +/- 2.3 microarcseconds (68% credible interval)**. EHT Paper IV (2022) explicitly notes source variability and morphology/method dependence; its GRMHD-calibrated gravitational angular scale **4.8 (-0.7,+1.4) microarcseconds** is a *model-dependent inference*, not another independent image measurement.

A physically different observation channel, GRAVITY/VLTI stellar-orbit astrometry, gives the gravitational angular radius **5.125 +/- 0.009(stat) +/- 0.020(sys) microarcseconds**, quoted from the orbital posterior in EHT Paper VI (2022). The mass and distance are strongly correlated in that fit; the published angular-scale posterior must be used rather than pretending M and D are independent. GRAVITY 2022 central values M=4.297 million nominal solar masses and D=8277 pc are source-locked cross-check inputs. Their orbital model assumes GR, and the EHT calibration uses GRMHD. Thus independent instruments do not mean independent theoretical assumptions.

**Executed Python result:** k_eff = observed ring diameter / independently inferred angular gravitational radius = **10.10731707317 +/- 0.45085999357** (approximate 68% first-order uncertainty; EHT and VLTI statistical covariance set to zero; common theory/systematic covariance and non-Gaussian posterior not modeled). The VLTI gravitational angular radius is within EHT's broad GRMHD-calibrated interval [4.1,6.2] microarcseconds. No Gaussian significance is inferred from that asymmetric interval.

As a numerical provenance cross-check only, IAU 2015 *exact nominal conversion* GM_sun=1.3271244e20 m^3/s^2, exact c and au, and the GRAVITY central M,D reproduce theta_g = **5.12433147071 microarcseconds**, 0.00066852929 below the rounded published 5.125. This is NOT a separate observation, not a CODATA G measurement and not a physics prediction. CODATA 2022's adjusted G was deliberately not introduced because the nominal GM conversion and angular ratio do not require it.

**Reproducible executable:** WORKSPACES/KESTREL/CODE/sgrA_crosschannel_20261027.py (committed on main and read back). An equivalent local script was actually executed with JSON output and uncertainty propagation.

## Three proof obligations and translation gate

New stacked draft PR #690, branch research/kestrel-sgra-crosschannel-20261027t0624z, based on the already existing Lean verification PR #262 branch. The new source FORMAL_VERIFICATION/HsHVerification/KestrelSgrACrossChannel.lean defines the conditional one-angle law theta=k*M/D and states:
1. joint nonzero scaling (M,D)->(lambda*M,lambda*D) leaves theta unchanged;
2. with external distance and nonzero k, algebraic mass recovery is possible;
3. defining k_eff as observed diameter / measured theta_g reproduces the same diameter identically, **so it is calibration, not a prediction**.

These are symbolic statements motivated by a real measured system. They do NOT derive EHT emission physics, establish an H(s)H forward map, identify worldtube cores, or make k a universal constant. Lean CI run 40461414268 was initiated; proof status requires actual job/log inspection before claiming compilation.

## Consequential P2 interface

A useful H(s)H forward map must specify finite-core/timesheet/responsive-medium state, transport/interaction and radiative transfer to a 230 GHz brightness observable, including viewing geometry and scattering, **before** using EHT diameter to choose a coefficient. It should predict ring diameter, thickness, time variability or polarization from independently constrained inputs, with uncertainties. The ring size above is already inspected, so fitting it later cannot be described as blind validation. Reserve genuinely unconsulted epochs, frequencies or observables for held-out prediction.

**Provenance hierarchy:** (1) observed EHT ring, (2) GRAVITY orbital inferred theta_g, (3) IAU nominal conversion, (4) conditional Lean algebra, (5) H(s)H interpretation still PROPOSED. No verbatim historical SAT-O/Blockwave equation is claimed here. The four shared Mersearch bridge request lanes were occupied with other searches; no lane overwritten and no Mersearch completion claimed. Historical FIE opening 0th-10th intuitions and propositions A-F were directly read from HsH original-text blob 4869d76bfeaff4d5174076f870d64cca8e540e32; this is a bounded FIE re-review, not the full extended corpus.

**References:**
- EHT Sgr A* Paper IV, ApJL 930 L15 (2022), https://doi.org/10.3847/2041-8213/ac6736
- EHT Sgr A* Paper VI, ApJL 930 L17 (2022), https://par.nsf.gov/servlets/purl/10330546
- GRAVITY Collaboration (2022), A&A 657 L12, https://doi.org/10.1051/0004-6361/202142465
- IAU 2015 nominal solar GM, https://arxiv.org/abs/1510.07674
- Kestrel charter, WORKSPACES/KESTREL/README.md, Git blob 77d6cb451fb83d9ee9f1079cb0b95565e0fb5124.

**Status:** EMPIRICAL CROSS-CHANNEL RATIO EXECUTED / NO HSH FORWARD PREDICTION / LEAN CI INITIATED / PAPER P2 INPUT NOT YET VALIDATED / NO BEDROCK PROMOTION. Orson's P1 Nov 9, P2 Nov 30 and P3 Dec 14 remain separate gates.
