# Calder Calculation Relay :00 | Real J-PET spin-plane CPT observable | 2026-10-25 15Z

## Physical system and original measurements
Real ortho-positronium -> three photons, J-PET detector, August 2018 (26 days, 7.3 million candidates, approximately 1.9 million selected), published by Moskal et al., Nature Communications 12, 5658 (2021), DOI 10.1038/s41467-021-25905-9.
Observed <O_CPT>=+0.00025 +/-0.00036 (dimensionless, total reported uncertainty; statistical component 0.00033).
Reported analyzing power P=0.374 and corrected C_CPT=+0.00067 +/-0.00095.
Independent older experimental comparator: Vetter and Freedman, PRL 91, 263401 (2003), C_CPT=+0.0026 +/-0.0031.
No event-level data were obtained or simulated. Only original published aggregate observations and detector specifications were used.

## Original SAT/H(s)H construction and genealogy
Historical SAT-W primary: Satobloc/SAT_THEORY_ARCHIVE_2023-25, 2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt, Git blob ec0697d8b4a7d2a9a674c7500f72665676b76702, 145 lines examined. It proposes opposite matter/antimatter geometric chirality and photon polarization as a directional disturbance; it gives no annihilation-amplitude or CPT-correlator formula. HsH 2026-10-17 interbraid-to-annihilation checkpoint, blob 3ef69f2cf28bc7609251b4028cd404035e175c59, retains this as unproved. Modern SAT physical worldtubes must not be conflated with medium vortices. No original historical equation for C_CPT was recovered.

## Exact measured operator and checks
O_CPT = S dot (k1 cross k2)/|k1 cross k2|, where S is the inferred spin axis and k1,k2 are photon momenta ordered by energy. Under parity S (axial) and k1 cross k2 (axial) are both unchanged: O is P-even. Under naive time reversal S reverses while k1 cross k2 remains unchanged: O is T-odd. The paper classifies this as CPT-odd. Symbolic SymPy cross-product tests passed. Normalization fails when the two photon momenta are collinear; that is a readout degeneracy, not a physical singularity. No arbitrary vectors or artificial event records were introduced.

## Actual executed numerical results
Approximate analyzing-power factorization: 0.67*(2/3)*0.92*0.91=0.3739493333333333, consistent with the published approximate 0.374.
Using the rounded published raw <O> and P gives C=0.000668449197861, and uncertainty 0.000962566844920 if P is treated as fixed. Authors report 0.00067 +/-0.00095; exact uncertainty replication from rounded inputs is NOT achieved and cannot be resolved without full calibration/covariance.
Using the published corrected C: residual from CPT-even zero=+0.00067, z=+0.705263157895, two-sided Gaussian p=0.480646483427, statistical-normal 95% interval [-0.00119196578531,+0.00253196578531].
Older 2003 minus 2021 C=+0.00193, independent-error z_difference=+0.595256716769. No weighted pooling, and the different 2024 photon-polarization O2 operator is NOT combined with this spin-plane operator.
Detector causal control: paper's Eq.(4) delta_ij=||r_i-r_j|-c|t_i-t_j||, with c exact SI 299792458 m/s, reported approximate 250 ps interaction timing resolution, and delta_min<0.15 m secondary-scattering rejection. c*250 ps=0.0749481145 m; 0.15 m/c=500.346142797 ps; threshold is 2.00138457 single-hit timing resolutions, or 1.41519 independent pair-difference timing resolutions if each hit has 250 ps standard uncertainty. Detector spatial uncertainties preclude treating this as a calibrated sigma threshold.

## Gate and failure ledger
Real data and source provenance PASS. Exact symmetry signs PASS. Numerical replication PASS for central C and approximately for analyzing power. Exact published corrected uncertainty from rounded inputs UNRESOLVED. Original SAT-W chirality remains a qualitative proposal, NOT an independent prediction of C_CPT. No CODATA quantity is defined for this correlation, so use direct experimental comparator rather than pretending a CODATA residual. H(s)H finite-core spin/annihilation mapping UNRESOLVED; not a construction candidate; no BEDROCK promotion.
Random archive reading: actual Python secrets.randbelow(3) returned 1; SAT archive BLACK HOLES AND BIG BANGS.txt, Git blob 708c70ee1a721e81f0b9e0586e5617422407fa06, complete 87 lines/19518 characters read including unrelated topics. Speculative assertions not used as measurements.
Current BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines) and STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines) fetched; ND-2026-10-18-02/03 and ND-2026-10-25-01 reviewed.
Mersearch stable 1.0 worker instructions read; four shared request lanes inspected and occupied; no new Mersearch run, no claim of comprehensive three-repository coverage. Bounded direct primary reads only.
Executed full Python/SymPy/Matplotlib source and complete console output are preserved inline in the originating Calculation Relay conversation; local source SHA-256 599d4edea6ce714b5a0e7904ed698b09b82528a2b0a16c787b062d234c65363c, output SHA-256 08dd61fe57c728996c3b5dda661265cf5c1dbb851f6801980dfd686d7c10b261.
