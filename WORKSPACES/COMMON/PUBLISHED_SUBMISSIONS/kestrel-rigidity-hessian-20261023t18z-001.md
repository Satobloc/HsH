# Kestrel CODE 000: rigidity of the constrained two-frequency curve
Task: calc48-20261023T18Z-kestrel-rigidity-hessian-001
Date: 2026-10-23 18Z. Gate: INTERNALLY_CHECKED Euclidean mathematics. No physical validation or BEDROCK promotion.

Historical source correction: The Whirligig parent action is printed explicitly in HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 106-115:
L = kappa |H''|^2/2 + lambda_s (|H|^2-R(lambda)^2)^2/2 + k |H-G|^2/2.
The earlier SAT curvature action S[gamma]=(T/2) integral |gamma''|^2 dlambda appears in SAT_THEORY_ARCHIVE_2023-25/2025-8-24 STATUS OVERVIEW.txt, blob a23e1458a882340de4f6319c7eb8a34c7f6c5ab0, lines 23-25 (document header 2025-08-31). The later explicit pointwise unit-speed multiplier is NOT present in the printed historical action.

For the later constrained model H:[0,2pi]->R4, |H'|^2=1, E=int[|H''|^2/20+(|H|^2-1/4)^2/2]ds, the established Fourier certificate gives E>=9pi/25. Equality forces only harmonics 1 and 2 and constant |H|^2=9/20. Writing H=a cos s+b sin s+c cos 2s+d sin 2s, vanishing Fourier coefficients force a,b,c,d pairwise orthogonal, |a|^2=|b|^2=A^2, |c|^2=|d|^2=B^2. Together with unit speed, A^2+B^2=9/20 and A^2+4B^2=1, hence A^2=4/15 and B^2=11/60. Therefore EVERY global minimizer is an ambient O(4) image of the original two-frequency fixture. Uniqueness is modulo O(4), not absolute.

For an admissible infinitesimal perturbation eta with H0' dot eta'=0, the second-order energy coefficient is Q2=(1/20)int(|eta''|^2-5|eta'|^2+4|eta|^2)ds+2int(H0 dot eta)^2 ds. Its zero modes have harmonics 1 and 2, H0 dot eta=0 and H0' dot eta'=0. Exact SymPy Fourier constraint matrix: shape 18x16, rank 10, nullity 6. All six independent infinitesimal O(4) rotations lie in the kernel; hence they span the ENTIRE constrained Hessian kernel. An exactly unit-speed admissible translation eta=e1 gives Q2=14pi/15>0.

The original Interconn lines 113-115 assert kappa omega^4+2lambda_s r_h^2=0 => omega^4=2|lambda_s|r_h^2/kappa and claim stable coiling. For kappa>0 and r_h nonzero, the displayed implication needs lambda_s<0. But negative lambda_s makes the quartic radial action unbounded below even at unit speed: H_r=(r,cos s,sin s,0) yields E(r)=pi(-80r^4-120r^2-37)/80 -> minus infinity in the declared test normalization. Original stable-frequency interpretation UNRESOLVED, not silently repaired.

Executed SymPy script: kestrel_rigidity_hessian_20261023T18Z.py; SHA256 026e4c87eacc52eb245f2d578da9c34a54b7fe72f000320d1a01976a27f33ead; final result ALL_ASSERTIONS_PASSED. An initial test-harness structural-equality assertion failed and was corrected to algebraic difference testing, without modifying the model. Euclidean closed fixture is not future-directed Minkowski; no independent CODATA prediction exists. Historical equations and later mathematical constraints remain separate.
