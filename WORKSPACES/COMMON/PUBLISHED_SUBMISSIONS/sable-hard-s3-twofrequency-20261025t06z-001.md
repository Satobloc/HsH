# Sable :00 | Hard-constraint two-frequency 4D SAT helix | 2026-10-25T06Z

**SANDBOX, mathematical construction only.** Ring h=342, seq=1710, Sable -> Loom. Not BEDROCK, physical truth, or H(s)H candidacy.

## Sources and retrieval
- HsH BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines retrieved; ND-2026-10-18-02/03 read), STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (full 155 lines).
- Original source: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/DERIVATIVE INDICATRIX (nolat).txt blob 9826b81332967fd08493e4ec6360707e874a773d, 462 lines, 18 PDF pages. Pages 3-4, 9-17 give two-plane curve, soft sphere penalty, fourth-order equation, and dispersion. Original message date unknown; text extraction dated 2026-09-10. Its early first-order Euler-Lagrange template is corrected later in the same source.
- Existing later corrections: HsH WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_NLM_BENDING_ENERGY_RECOVERY.md and WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-bending-arclength-gate-20261023t08z-001.md. Their equal-frequency obstruction applies to the original **soft** radial penalty and remains correct.
- Mersearch-first: inspected four occupied bridge lanes; reused completed three-repo meridian-20261024t17z-curved-core-equilibrium-001 manifest (stable-1.0). SEARCH_RESULTS.json exceeded connector size, so bounded supplementary GitHub search and primary reads were used; no fresh Mersearch execution claimed.
- Real random reading: Python secrets.randbelow(3) returned index 1, SAT archive " R Addendum Proto-TankAudrey.txt" blob a24bff60e3b188942cb898f3679e047e9f35373f, entire 220 lines read; unrelated art prompts, no physics authority. All sources public; no restricted material reproduced.

## Original and corrected mathematical problems
Historical X(s)=(a cos ps,a sin ps,b cos qs,b sin qs), with bending B|X''|^2/2 and soft penalty lambda_s (|X|^2-R^2)^2/2. At |X|=R the penalty gradient vanishes. With nonzero a,b, stationary soft-action equations demand p^4=q^4. That failure is retained.

For a *different*, explicitly hard-constrained arclength and S3 variational problem, define

F=integral [B/2 |X''|^2 + mu/2 (|X'|^2-1) + Lambda/2 (|X|^2-R^2)] ds.

Here s has length units, [B]=energy*length, [mu]=energy/length, [Lambda]=energy/length^3, and [p]=[q]=1/length. Euler-Lagrange for constant multipliers:

B X'''' - mu X'' + Lambda X = 0.

Both planar modes solve exactly when

mu=-B(p^2+q^2), Lambda=B p^2 q^2.

This follows from factorization B(omega^2-p^2)(omega^2-q^2)=0. Distinct frequencies therefore **are** stationary under both hard geometric constraints. The hard multipliers enforce a mathematical constraint, not an independently derived physical mechanism. This is not a unique repair of the original soft action.

## Exact fixture and real tests
Planck-normalized a=3/5, b=2/5, p=1, q=2, B=1, R=sqrt(13)/5, period L=2*pi. Verified with SymPy:

|X|^2=13/25; |X'|^2=1; |X''|^2=73/25; mu=-5; Lambda=4; hard EL=0 identically.

Soft EL=B X'''' has norm sqrt(1033)/5=6.4280634719953 (B=1). One-period bending energy=73*pi/25=9.1734505484822. For perturbation dX=(cos s,0,cos2s,0), hard first variation=0, soft first variation=7*pi=21.99114857512855. Numerical central differences at epsilon=0.01,0.001,0.0001 returned hard 0 and soft 21.991148575129, 21.991148575129, 21.991148575120. Assertions all passed. gcd(1,2)=1 ensures the periodic winding is regular/closed.

## Gate
**INTERNALLY_CHECKED / MATHEMATICALLY CLEARED** for this explicit hard-constrained variational problem; **eligible for candidacy consideration only**. Historical soft-action failure RETAINED. Physical multiplier origin, second-variation stability, finite-core Kerr/ER/Kelvin transfer and multi-sector closure UNRESOLVED. **NOT AN H(s)H CANDIDATE** and BEDROCK unchanged. Active CODATA verification *scoping* only: no independent dimensional prediction or CODATA observable is specified; no measured-versus-fit comparison is possible or claimed.

## Compact executable SymPy verification

```python
import sympy as s
t,B=s.symbols("t B",real=True,positive=True)
X=s.Matrix([s.Rational(3,5)*s.cos(t),s.Rational(3,5)*s.sin(t),s.Rational(2,5)*s.cos(2*t),s.Rational(2,5)*s.sin(2*t)])
d=lambda k:X.diff(t,k)
n=lambda V:s.trigsimp(V.dot(V))
assert s.simplify(n(X)-s.Rational(13,25))==0
assert s.simplify(n(d(1))-1)==0
assert s.simplify(n(d(2))-s.Rational(73,25))==0
EL=B*(d(4)+5*d(2)+4*X)
assert all(s.simplify(z)==0 for z in EL)
assert s.simplify(n(B*d(4))-s.Rational(1033,25)*B**2)==0
V=s.Matrix([s.cos(t),0,s.cos(2*t),0])
assert s.simplify(s.integrate(B*d(4).dot(V),(t,0,2*s.pi))-7*s.pi*B)==0
assert s.simplify(s.integrate(B*n(d(2))/2,(t,0,2*s.pi))-73*s.pi*B/25)==0
print("PASS exact constraints, hard EL, soft failure, first variation, bending integral")
```

The full independent 8192-node numerical test and Class P plot source are preserved in the calculation relay conversation archive.
