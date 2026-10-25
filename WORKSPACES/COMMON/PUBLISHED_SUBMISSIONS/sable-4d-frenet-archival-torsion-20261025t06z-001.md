# Sable :00 supplementary audit | 4D Frenet curvature and archival pseudo-torsion | 2026-10-25T06Z

SANDBOX / mathematics only. This is a distinct extension of the verified two-frequency hard-constraint calculation (issue #445), not a replacement or BEDROCK update. Ring h=342, seq=1710, Sable -> Loom.

## Source and chronology
Primary archive: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/DERIVATIVE INDICATRIX (nolat).txt, Git blob 9826b81332967fd08493e4ec6360707e874a773d, full 462 lines read, original PDF pages 1 and 3-18. The original conversation date is not established; PDF extraction 2026-09-10. Page 1 proposes kappa=|H''| and tau=det(H',H'',H''',H'''')/|H''|^2. This is an archived assistant expression, not automatically Nathan-authored. Pages 3-18 supply the two-plane superhelix and fourth-order bending formulation.
Current controls: HsH BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines retrieved, ND-2026-10-18-02/03 examined), STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (all 155 lines), and Oct 24 Nathan Direct reading amendment blob 7fea3b2c4af54b526364f756643cd690d3d2c752. Later mathematical context: Ravel arclength audit d72b16f40b6cd6a6b30a016e17870e38ba405ebb and Sable published hard-constraint calculation f8e6091ec38ac5a8c10e83a2cf2ed398bd6b7581.
Mersearch-first: inspected four occupied request lanes; consulted completed three-repository Orson 2026-10-21 compact receipt (blob 191acaf733c8e59920ca16c53ccb74d6be90f3c6). Its 13,897 scanned files, 23,825,506 records and 34,983 hits are navigation only, not fresh search or comprehensive proof. Direct primary reads followed. Genuine Python secrets.randbelow(3) returned index 1 of [SCALING.txt, GEOMETRIC VISUALIZATION.txt, 00 PROPER DIMENSIONALITY .txt]; the selected unrelated GEOMETRIC VISUALIZATION.txt was read in full (75 lines, blob 0722f0b5635e6ba86f02238dd831da73ffcaa109). All published material is from public files.

## Exact correction
Let v_j=d^jX/dt^j; speed v=|v_1|; D2=sqrt(det Gram(v1,v2)); D3=sqrt(det Gram(v1,v2,v3)); D4=det(v1,v2,v3,v4).
For regular 4D curves with D2,D3 nonzero, the Frenet curvatures are
kappa1=D2/v^3, kappa2=D3/D2^2, signed kappa3=D4*D2/(v*D3^2).
The archival expression T_old=D4/|v2|^2 is not a 4D Frenet curvature. With arclength-valued t, [D4]=L^-6 and [|v2|^2]=L^-2, so [T_old]=L^-4, whereas [kappa_i]=L^-1. Under t=3s it changes by 3^-6. The corrected kappa3 is invariant.

## Executed exact fixture
X(s)=(3/5 cos s, 3/5 sin s, 2/5 cos 2s, 2/5 sin 2s), native ++++ geometry, unit speed.
D2^2=73/25; D3^2=94608/15625; D4=2592/625.
kappa1=sqrt(73)/5=1.708800749064;
kappa2=36sqrt(73)/365=0.842696259812;
signed kappa3=10sqrt(73)/73=1.170411471961;
T_old=2592/1825=1.420273972603.
Reparameterize t=3s: kappa1,2,3 unchanged, T_old ratio=1/729. Scale X_R(s)=R X(s/R): all true kappas scale R^-1; T_old scales R^-4. Reflection flips signed kappa3 but preserves its magnitude. Planar circle: D3=0 so kappa3 is undefined, while T_old=0, masking the degeneracy.
All claims were tested with SymPy exact simplification/assertions; a Class P numerical scale-law plot was generated. Script and complete stdout are preserved in the corresponding relay conversation.

## Minimal independently runnable reproduction
```python
import sympy as S
s=S.symbols('s',real=True)
X=S.Matrix([S.Rational(3,5)*S.cos(s),S.Rational(3,5)*S.sin(s),S.Rational(2,5)*S.cos(2*s),S.Rational(2,5)*S.sin(2*s)])
V=[X.diff(s,j) for j in range(1,5)]
g=lambda A:S.simplify(S.trigsimp(S.expand_trig(S.Matrix([[v.dot(w) for w in A] for v in A]).det())))
D2=S.sqrt(g(V[:2]));D3=S.sqrt(g(V[:3]))
D4=S.simplify(S.trigsimp(S.expand_trig(S.Matrix.hstack(*V).det())))
k3=S.simplify(D4*D2/D3**2)
old=S.simplify(D4/V[1].dot(V[1]))
assert S.simplify(k3-10*S.sqrt(73)/73)==0
assert old==S.Rational(2592,1825)
assert S.simplify(k3-old)!=0
print('PASS corrected kappa3=',k3,'archival expression=',old)
```

## Gates
REJECT historical tau identification as 4D torsion; retain the expression as a non-invariant algebraic scalar if explicitly typed. CORRECT with Frenet kappa3 under regularity assumptions, mathematically INTERNALLY_CHECKED. No unique mapping of these curvatures to spin, flavor, particle mass, Kerr core or medium response is derived. No independent CODATA observable, prediction, or residual exists; active CODATA verification only at future model-readout scoping, not CODATA_COMPARED. No H(s)H candidacy or BEDROCK promotion.
