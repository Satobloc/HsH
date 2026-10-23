# Ravel 2026-10-23 08Z: historical SAT bending maximum is parameter-dependent

SANDBOX, public-safe, not established physics. BEDROCK unchanged.

CONTROLS: HsH BEDROCK.md blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8, full 509 lines; STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, full 155 lines. Includes ND-2026-10-18-02/03. Mersearch-first: inspected shared request 2026-10-21-orson-nlm-big-haul-math-001 and completed three-repo manifest. Slot occupied; no new Mersearch execution. Original primary sources: HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt blob 33785afb8d46804122d79056b952169f99b325e2; Interconn.txt blob 02312fbb23167e8ce1c996451199ee0e498437b1; SAT-GIGAPACK.txt blob 99a137e4891cd4a3ecaee86cf76a2d06c5af300b. Original message dates unknown. Random archival reading: real secrets.randbelow(3) selected THE BACK HALLS.txt, blob a7b307e958273f1577c9e90460fb358c136c66cb, complete 640 lines, including unrelated neutrino/lepton/quark corridors.

RECOVERED: L=kappa|H''|^2/2+lambda_s(|H|^2-R^2)^2/2+k|H-G|^2/2. With the historical [kappa]=N, [lambda_s]=J/m^7, [k]=J/m^5 and length-parameter s, all three terms are J/m^3. Interconn also adds T|H'|^2/2 with [T]=N=J/m, so the mixed terms have incompatible units. A 3D timesheet tube has transverse disk A2=pi*a_core^2 and kappa_line=kappa_vol*A2 [J*m]. A full 4D tube has transverse 3-ball V3=4pi*a_core^3/3 and requires [kappa_bulk]=J/m^2. Neither choice is yet physically established.

For k=0 and H=a(cos(omega*s),sin(omega*s),0,0), EL gives kappa*omega^4+2lambda_s(a^2-R^2)=0. A nonzero stationary harmonic cannot lie exactly at a=R. Formal bending density f_b=kappa*a^2*omega^4/2 peaks at lambda_s*R^4/4 when omega^4=lambda_s*R^2/kappa. Formal bending integral over one parameter period peaks at omega^4=(6/7)*lambda_s*R^2/kappa, a^2=4R^2/7.

CRITICAL FAIL: the harmonic has speed |H'|=a*omega, generally not 1, although s is called arclength in historical sources. Imposing true arclength yields kappa=2lambda_s*a^4*(R^2-a^2), possible only if kappa<=8lambda_s*R^6/27. For R=1,kappa=1,lambda_s=2, no unit-speed stationary circle exists. For R=1,kappa=.3,lambda_s=2, two unit-speed radii 0.579750959823 and 0.953566814390 were verified. Geometric curvature is 1/a, and physical one-loop bending energy E=pi*B_line/a diverges as a->0. The unnormalized action differs from invariant arclength bending by (a*omega)^3. The two formal maxima are therefore NOT physical maximum bending energies.

TESTS: SymPy exact differentiation/dimensions and SciPy quadrature passed. Distinct-frequency two-plane harmonic with both amplitudes nonzero fails for k=0, agreeing with earlier Meridian audit. Conditional geometric bound E<=B_line*L/(2*a_core^2) requires fixed L and a curvature ceiling.

CODATA 2022 NIST: c exact 299792458 m/s, G=6.67430(15)e-11. Derived Planck force c^4/G=1.210255564338e44 N with u=2.719961e39 N. Historical T~1.2e44 N has residual -1.025556e42 N (-0.847388%), within rounding at two significant figures. This is NOT an independent prediction, and no CODATA observable exists for the bending maximum.

GATE: algebra/dimensions INTERNALLY_CHECKED; mixed units and generic arclength identification FAIL; actual finite-core maximum, material constitutive law and Kerr translation UNRESOLVED; no physical/CODATA promotion. Next: recover actual historical thickness and finite-core frame, enforce invariant arclength and causal constraints.

Minimal runnable Python/SymPy:
```python
import sympy as s
a,R,k,l,w,q=s.symbols("a R k l w q",positive=True)
a2=R**2-k*w**4/(2*l)
fb=s.factor((k/2)*a2*w**4)
fq=s.factor(fb.subs(w**4,q))
assert s.simplify(fq.subs(q,l*R**2/k)-l*R**4/4)==0
assert s.simplify(s.diff(fq,q).subs(q,l*R**2/k))==0
assert s.simplify((2*l*a**4*(R**2-a**2)).subs(a,s.sqrt(s.Rational(2,3))*R)-8*l*R**6/27)==0
print("PASS: formal maximum and unit-speed bound; physical maximum unresolved")
```
