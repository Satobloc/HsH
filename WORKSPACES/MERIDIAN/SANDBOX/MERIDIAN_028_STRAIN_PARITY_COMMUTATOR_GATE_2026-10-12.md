# Meridian 028 | Exact strain-parity commutator gate
2026-10-12 | SANDBOX | Source-grounded relay reconstruction, not original Meridian participation; no physical SAT/H(s)H claim.

## Sources
- Predecessor: WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_026_TRANSPORTED_METRIC_SYMMETRY_GATE_2026-10-12.md, blob 6bb56af5dba59bc980973e7c4b873db3fd43c483.
- Earlier review: WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_WHirlIGIG_HOSTILE_REVIEW_MK171_2026-10-11.md, blob 0e0269993239f90c6dfdeb5c56597470874a8f01.
- Historical source excerpts (derivative, authorship unverified): SAT archive _AUTO_EXTRACTED_TEXT/WHIRLIGIG SUMMARY (nolat).txt, blob d8985d9f58cbbeb333c6f94de0c6dd23f900efe0, pp. 1-3; 2026 discussions/WHIRLIGIG SIMPLIFICATION TAKE 1.txt, blob bfe1a8771bf6faa2d8281863c7f4092f711020fa.
- Cross-Formalism Index blob cccca10267064650dffbc68dd0a6672ee65167e3. No restricted/external sources.

## Exact theorem
H(s)=(cos 2s,sin 2s,cos 3s,sin 3s)/sqrt(2), P=diag(1,1,-1,-1), H(s+pi)=P H(s).
For any constant S in GL+(4), let Htilde=SH, Ptilde=S P S^-1, C=S^T S, G=S^-T S^-1.

Ptilde^2=I, Ptilde^T G Ptilde=G. Moreover,

    Ptilde^T Ptilde=I  iff  [C,P]=0.

Proof: Ptilde^T Ptilde=S^-T P C P S^-1; I=S^-T C S^-1.

For fixed-Euclidean radial Hessian M(s)=Htilde(s)Htilde(s)^T, its half-turn defect is exactly

    Delta(s)=M(s)Ptilde-Ptilde M(s+pi)
            =M(s)(Ptilde-Ptilde^T).

Because the full-span curve H spans R4, Delta(s) vanishes for every s iff Ptilde is Euclidean-orthogonal iff [C,P]=0. Hence even strongly anisotropic deformations confined within parity blocks preserve the exact selection rule. This is a constitutive-law discriminator, not proof that a permitted sideband is nonzero.

## General infinitesimal strain theorem
Set S(epsilon)=exp(epsilon A), E=(A+A^T)/2, W=(A-A^T)/2. Then

    Ptilde-Ptilde^T = 2 epsilon [E,P] + O(epsilon^2).

With |H|=1 and period average <HH^T>=I/4,

    RMS_F(Delta) = |epsilon| ||[E,P]||_F + O(epsilon^2).

Only the symmetric cross-parity strain contributes to the linear defect. Skew rotations and symmetric within-parity strains contribute zero. This generalizes Meridian 026's 2 sqrt(2) coefficient, but the present exp(epsilon A) and predecessor's I+epsilon A differ at finite epsilon.

## Scripted numerical controls
4096 evenly spaced samples, direct-vs-rank-one defect identity, exact G-isometry, C-commutator criterion, 5 matrix families, 8 seeded random A generators. All assertions passed. At epsilon=0.01 and 0.2:

| A | Predicted slope | RMS(0.01) | RMS(0.2) |
|---|---:|---:|---:|
| E13+E31 | 2.828427125 | 0.028293581929 | 0.641670677626 |
| E13 | 1.414213562 | 0.014143063684 | 0.290213714355 |
| E12+E21 | 0 | <3e-15 | <3e-15 |
| E13-E31 | 0 | <3e-15 | <3e-15 |
| diag(1,-1,0,0) | 0 | <3e-15 | <3e-15 |

All transported-metric residuals <1e-12. Eight seeded random matrices match first-order predicted slope within relative error 0.001 at epsilon=1e-5.

Reproducible local artifacts: meridian_028_parity_strain_gate.py (SHA256 2e218f9c87eb811bf382635aa955ffd3c82ed3bf2681b34a3ed5711b92f10624); meridian_028_parity_strain_results.json (SHA256 833d981877acee7e1ded60da1f9495f435ab2bf9f1f312191f4dd3b4924520f3); Class P precision figure meridian_028_parity_strain_class_P.png. Full local report SHA256 7151c564e4d088f665db3678b02945515a06597d78dc942a745e5b39c8fd9ad1.

## Limits and next cursor
Constant S; specific full-span 2:3 carrier; rank-one radial Hessian; fixed Euclidean vs correctly transported constitutive metric; periodic half-turn symmetry. No finite-core dynamics or physical electron-to-planet bridge follows. A varying S(s) produces connection terms in D^4 and requires covariant-operator testing. Next: derive and test the transformed fourth derivative for nonconstant S(s), including a false-positive sideband null.
