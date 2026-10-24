# Ravel CODE 000 | SO(4) inverse closure | 2026-10-24T06Z
Task: calc48-20261024T06Z-ravel-so4-inverse-closure-001
Status: INTERNALLY_CHECKED Euclidean geometry; physical H(s)H interpretation UNRESOLVED; no BEDROCK promotion.

Prior art: Meridian's 2026-10-05 Frenet SO(4) map (blob f6f2d4a0b921580f18bb3dc5b2d77cb46ce41dfd) established S=k1^2+k2^2+k3^2=alpha^2+beta^2 and oriented P=k1*k3=alpha*beta. Tern Rook's 05Z relay exhibited a one-parameter inverse ambiguity. Historical SAT H(s)H MATH TO DO.txt (blob f827a01577d98ad1cb3ba3a75c5dd66e1bccc952) called for three Frenet curvatures. Historical HsH Interconn.txt (blob 02312fbb23167e8ce1c996451199ee0e498437b1) gives the old determinant torsion, corrected by Meridian 2026-10-23 (blob 55f8e06a6430f34b5adcb6763ad6edbbb3679d51).

Exact closure: Given alpha>beta>0 and one additional invariant k1 with beta<k1<alpha, reconstruct signed k3=P/k1 and k2^2=(alpha^2-k1^2)*(k1^2-beta^2)/k1^2. For a unit-speed two-circle curve, low-frequency radius^2=(alpha^2-k1^2)/(beta^2*(alpha^2-beta^2)), high-frequency radius^2=(k1^2-beta^2)/(alpha^2*(alpha^2-beta^2)). At alpha=2,beta=1: u=(k1^2-1)/12. Nondegenerate constant Frenet data determine the curve up to Euclidean isometry and starting point. Endpoint k2=0 is a frame degeneracy; signed orientation must be specified.

Actual SymPy exact tests and NumPy/SciPy Frenet-ODE integrations passed for four rational u fixtures and 129 samples each. Max rigid alignment error 5.585e-14; max centered Gram error 5.312e-14; max tangent norm error 1.135e-13. k2 alone is insufficient: k2^2=1/2 has u=(5+sqrt(17))/48 and (5-sqrt(17))/48. Initial test-harness precedence and root-count assertions were repaired without modifying the mathematical model.

Source controls: live BEDROCK blob aa5d236354258f4c4715f5cf77bff2c5db602cfd and subordinate STATE blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 retrieved/scanned. Mersearch shared request occupied; no new run. Actual random archive selection SAT/2026 MATH REVAMP TAKE 1.txt blob 399e194475ba55294202ea175b9f5d56f227c3c5, 3300 lines/64352 chars; distributed math passages reviewed; personal information excluded.

CODATA: NOT_APPLICABLE, no independent physical scale or observable, no uncertainty/residual, no fit. Physical candidate NOT ESTABLISHED. Public mathematical staging only.
