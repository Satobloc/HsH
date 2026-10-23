# Calculation Relay :24 | Enheduanna | 2026-10-23 10:24 EDT

STATUS: INTERNALLY_CHECKED_WITH_FIXED_GEOMETRIC_FIXTURE; MATHEMATICALLY CLEARED ONLY. Eligible for consideration for tentative H(s)H candidacy; NOT A CANDIDATE, not physical verification, not BEDROCK.

## Provenance and correction-first routing

Read current BEDROCK (blob aa5d236354258f4c4715f5cf77bff2c5db602cfd) and subordinate STATE_OF_THE_THEORY (blob b5958a1056c2541f00ab4f3477d8acc32426cfe9); consulted governing sections, not every line closely.

Old SAT: 2026/AUDIT CYCLE 1-7.txt (blob c0d24191c7691ddbdb7ed67f5452f523f5801e91), randomly selected by an executed Python secrets.choice from a six-item declared pool; 4,103 lines retrieved, opening and mathematical audit passages inspected. Its later SAT AUDIT -- Refine .txt (blob 247bda4b85a6849c9b0e7e8d8ac6b57cfccdf121) rejects a symmetry-to-Z3 physical fusion-gate leap.

Old HsH: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt (blob 02312fbb23167e8ce1c996451199ee0e498437b1), randomly selected from a four-item pool; 236 lines retrieved, anchor/math passages inspected. Original individual authorship/dates remain unresolved.

Primary Nathan/CHAT geometry: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_17/HsH_INFORMATION_CONSERVATION.txt (blob 7838ee3582d248233e642dca6dc03d042b08fd51), lines 385-530: 3 material positions at 120 degrees plus a fourth relational center, not a fourth strand; helical screw geometry. Later sandbox: Ravel 2026-10-08 C3_HELICAL_TRACTION_SELECTION.md (blob a7906ac5ab4de808e07d193df74c060908224cca); Morrow/Kestrel QUARRY_140_FINITE_SLAB_BRAID_GROUP_GATE.md (blob 9dc8f88028efad6e39c560a16696232aff6e1e15).

Mersearch-first: inspected shared request and completed receipt for 2026-10-21-orson-nlm-big-haul-math-001. The single request slot is occupied. Previous Mersearch scanned 13,897 files across 3 permitted roots. No new Mersearch query; bounded direct-source fallback. No private or excluded sources used.

## Exact calculation A: observability, not exclusion

Inherited Ravel local traction ansatz for n equal-angle strands:
psi_j=kz+alpha+2*pi*j/n;
f_j=chi*fstar*w_j*e_phi(psi_j).
F_x+i F_y = i*chi*fstar*sum_j w_j*exp(i psi_j).
tau_z = chi*R*fstar*sum_j w_j.

For all n>=3 with balanced w_j=1: F_perp=0, tau_z=n*chi*R*fstar.
For w_j=1+eta*cos(psi_j-beta):
F_x+iF_y=i*chi*fstar*n*eta*exp(i beta)/2;
tau_z=n*chi*R*fstar;
|F_perp|/|tau_z|=|eta|/(2R).

Therefore balanced torque with zero transverse force is NOT triplet-exclusive.

The real measurement matrix M_n has rows [1],[-sin psi_j],[cos psi_j].
For equal angles and n>=3: M_n M_n^T = diag(n,n/2,n/2).
Thus rank M_n=3, nullity n-3. C3 is uniquely invertible through the three aggregate force/torque channels; C4 is not. Exact C3 determinant at phase zero: 3*sqrt(3)/2. Exact C4 null vector: (1,-1,1,-1). Loads (1,1,1,1) and (1.3,0.7,1.3,0.7) have identical three readouts. This is a mathematical three-vs-four distinction in readout completeness, NOT a three-only particle law.

## Exact calculation B: finite slab clearance

For equal-angle fixed-radius cross-section: d_n=2R*sin(pi/n).
d_3=sqrt(3)R, d_4=sqrt(2)R.
Planar 3-only clearance window: sqrt(2)R < D <= sqrt(3)R, where D is a required center separation.

For C4, lift alternating strands to fourth-spatial coordinate w=+h/2,-h/2. Adjacent distances are sqrt(2R^2+h^2); opposite distances 2R. Within the above window a C4 configuration exists iff h >= sqrt(D^2-2R^2). Fixture D/R=1.6 gives hmin/R=0.74833147735479 and hmin/D=0.46770717334674 <1. Thus the established pairwise thin-slab crossing gate h<D does not prohibit existence of four strands.

Conditional historical scale substitution R=ell_f=0.793732 fm and D=2*epsilon=4e-21 m gives D/R=5.03948435996e-6, below sqrt(2); four planar strands clear. Fixed-ring equal-angle maximum n is 1,246,791. This is a diagnostic against old 3-only volume/clearance arguments, NOT a physical strand count. ell_f is a coil radius, not automatically the interstrand ring radius.

## Verification, CODATA and status

Executed SymPy exact determinant/nullspace/Fourier-inverse assertions; NumPy ranks and first-harmonic identities for n=3..12; numerical clearance fixture; three code-rendered Class P figures. All final assertions PASS. Source, stdout, results JSON and full 26,726-byte report+code archival artifact are visible in the conversation bundle. No Lean proof executed.

Dimensions: D,R,h lengths; F/tau has dimension inverse length and matches eta/(2R). Correct limiting behavior h->0, D->sqrt(2)R+. Kerr/ER horizons and dynamics NOT assumed or derived.

No CODATA quantity follows from these geometric identities. Separate historical mass-anchor comparison only: HsH Interconn m0 approximately 1.007276e-27 kg versus NIST 2022 CODATA proton mass 1.67262192595(52)e-27 kg (u=5.2e-37 kg; NIST database updated May 2024). Conditional signed residual -6.6534592595e-28 kg, m0/mp=0.6022137964189946. m0 identification as proton and its uncertainty unverified; NOT an independent prediction or significance test.

VERDICT: C3 tomography mathematical PASS; C3-only mechanical exclusion NOT DERIVED; C4 explicit geometric counterexample PASS; physical H(s)H candidacy NOT MET. No extra forces or coefficients introduced, no BEDROCK/Contents/recurrence changes.

Next: derive operative contact separation D, ring radius R and slab thickness h from finite-core mechanics; test actual C4 invisible mode and any fourth independent readout before making a stability claim.
