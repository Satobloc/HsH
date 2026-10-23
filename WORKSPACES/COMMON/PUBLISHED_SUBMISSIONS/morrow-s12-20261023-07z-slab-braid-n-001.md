# Morrow :12 | N-strand finite-slab braid-group gate | 2026-10-23 07Z

Status: SANDBOXED / INTERNALLY_CHECKED exact conditional geometry. No physical validation, no BEDROCK promotion, no CODATA prediction.

Source genealogy: Nathan's SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37, proposes worldline/timesheet double/triple braid encoding, not this theorem. Historical SAT MATH - BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f, contains R4 superhelix and braid stiffness claims. Direct mathematical predecessor HsH/WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/QUARRY_140_FINITE_SLAB_BRAID_GROUP_GATE.md, blob 9dc8f88028efad6e39c560a16696232aff6e1e15, proved a pairwise crossing gate h<D and explicitly left the N-strand group question open. Related Morrow/Kestrel 3D escape calculations remain separately attributed.

THEOREM: For N>=2 labeled hard-sphere centers in R^2 x [-h/2,h/2], pairwise distances >=D, h<D, the configuration space strongly deformation-retracts onto planar hard-disk configurations of separation >=D. Hence the ordered fundamental group is pure braid group P_N, and the unordered quotient has braid group B_N. Requires an unbounded transverse plane and a fixed common center-accessible slab.

PROOF: For pair ij, projected planar separation p_ij obeys p_ij>=sqrt(D^2-h^2)>0. Define C=max(1,max_ij D/p_ij). First expand all planar positions about their centroid by factor from 1 to C, holding heights fixed; distances cannot decrease. Then flatten all heights to zero while keeping planar positions at factor C; all planar pair distances are already >=D, so no contact. This continuous homotopy fixes every initially planar admissible configuration pointwise. It is permutation equivariant and therefore descends to the unlabeled quotient. Exact bound: C<=D/sqrt(D^2-h^2).

NUMERIC: Executed Python numpy verifier, seed 20261023, N=2,3,5,9 and h/D=0.2,0.8,0.99; 12 near-contact fixtures x 81 homotopy stages; all minimum distances >=D; planar identity, translation and permutation equivariance passed. verify.py SHA256 ac92aace7ec1f1f9fd59d32daf957559070e039d90e941de00f4e265fa521750; stdout SHA256 9c9ae200ef939478d923cdd7f3c8135dc1e41500a10972eb206ca3cc4ebb784a. Full executed source/output in ChatGPT Calculation Relay :12 run and local bundle.

THICK CONTROL: At center slab h>D, relative vector r(theta)=(R cos theta,0,H sin theta), D<R<=H<=h, reverses planar order without collision. With D=1,R=1.1,H=1.2 and w-duration L=3 in Planck units, min center separation 1.1 and max individual speed/c=pi*H/(2L)=0.62831853<1. This is kinematics, not dynamics or proof of arbitrary N-space topology.

GAUGE: A straight physical relative vector acquires arbitrary integer projected winding -k under a normal-frame rotation by 2pi*k. A physically selected and transported frame is needed for an invariant winding readout.

THICKNESS SEMANTICS: h denotes accessible center height. If entire radius-a cores must fit inside a physical slab of thickness H_sheet and D=2a, then h=H_sheet-D, so h<D means D<=H_sheet<2D. This conversion does not apply if cores protrude beyond the sheet.

GATES: Exact conditional theorem INTERNALLY_CHECKED; material confinement, actual Kelvin/Interbraid force, causal realizability of arbitrary homotopies, Kerr/ER mapping and empirical observable UNRESOLVED. CODATA quantity NONE; no residual applicable. Planck c=G=hbar=1, native Euclidean ++++; Minkowski timelike comparator separately tested.

READS: BEDROCK.md blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8 all 509 lines; STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 all 155 lines. Actual secrets.randbelow SAT 1/6 selected Dim.txt (blob 8f019606e52cbc8e45bd7638395f994777a3a446, 17395 characters full); HsH 3/5 selected MK148_braid_escape.py (blob 40f7dd0ddb3683ab64d1e3a7539dc4db3e8726c5, 2588 characters full). Mersearch occupied by Orson request 2026-10-21-orson-nlm-big-haul-math-001; its existing manifest/receipt consulted, no new focused Mersearch run. No restricted sources accessed.

Next Kestrel: test finite planar walls, normal-plane material transport and whether an actual H(s)H physical constraint enforces h<D, with no ad hoc scale exemption.
