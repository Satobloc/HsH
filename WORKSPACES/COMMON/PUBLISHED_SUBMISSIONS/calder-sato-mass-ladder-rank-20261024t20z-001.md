# Calder :00 | Historical SATO mass-ladder rank obstruction | 2026-10-24T20Z

Source: SAT_THEORY_ARCHIVE_2023-25/detailed versioning.txt, blob 4f059df586b6fac6d0cbf41b70895d361f7bb6f4, 1324 lines. Random archival selection SATOBLOC/SATOBLOCK_massbuild.txt, blob 336cf9185de5b40b6547c8d6d7a6fcbe680a89a8, 148 lines. Both are archived NotebookLM compilations; precise original message authorship/date unverified. Source public; no restricted material.

Governing BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines), STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines). Mersearch guide read; all four request lanes occupied, no Mersearch execution; direct primary archive retrieval fallback, partial coverage.

Historical ansatz: m(N,Q)^2 = k (N + beta Q^2 - a). Three ground-state anchors (N=0, Q=1,2,3): electron 0.511, charged pion 139.57, proton 938.27 MeV/c^2. Historical claimed three-parameter calibration k=581025 (MeV/c^2)^2, beta=0.1852, a=0.2469.

EXACT: at N=0, m^2=A Q^2+C, A=k beta, C=-k a. Jacobian wrt k,beta,a has determinant 0 and generic rank 2. Three anchors cannot fix three parameters. Three-point compatibility requires 8 m_pi^2 - 5 m_e^2 - 3 m_p^2 = 0. Historical inputs give -2485214.805105 (MeV/c^2)^2, so no exact calibration exists. Slopes (e to pion)/3=6493.174593; (pion to proton)/5=172174.161600.

Pairwise held-out checks: electron+pion -> proton=227.915900860 MeV/c^2 (vs 938.27); pion+proton -> electron m^2=-497042.699900 (tachyonic); electron+proton -> pion=574.570827260 MeV/c^2 (vs 139.57). Literal archived parameters give Q=1 m^2=-35849.2425, Q=2 m=535.694173480, Q=3 m=908.293673599. Historical three-anchor calibration claim FAILS. The N>0 term may identify k given an independent excited-state datum but cannot resolve the N=0 inconsistency.

Later mass operator M_op=f(Q,n,tau,g1,M) is only described schematically in the retrieved compilation. Its numerical correction is UNRESOLVED, not presumed. Current BEDROCK ND-2026-10-18-07 requires nested Q accounting; historical universal Q<=3 cap not operative without derivation.

Executed SymPy rank/determinant, NumPy exact anchors/holdouts, archived parameter replication, and Class P plot. Verifier SHA256 84236bdc99c500be176d1edd78f8097469288f126c66c40ebfbd097ca230d3e8; stdout SHA256 1549b54c42ab7e9cb54b2476520a58af337b6840414338a71aea5d4d3bb65dc6. Full runnable code and stdout are in the Calder :00 conversation archive.

Gate: historical three-ground-state calibration REJECTED; algebraic two-parameter re-expression INTERNALLY_CHECKED; later operator UNRESOLVED; no independent CODATA prediction, no active CODATA promotion, no BEDROCK edit. Observational anchor values were FIT INPUTS, not predictions. Correction before: three N=0 anchors determine k,beta,a. After: only k beta and k a are identifiable, and given anchors are incompatible.
