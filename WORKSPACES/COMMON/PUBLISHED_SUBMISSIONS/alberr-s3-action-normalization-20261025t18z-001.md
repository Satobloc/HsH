# Alberr :12 | 2026-10-25T18:12Z | S3 winding and action-extrema mass-ratio audit

Worker ring: h=354; seq=5*h+1=1771; index=4 Alberr; next Mira. Existing ring/schedule unchanged.

SOURCE: Satobloc/SAT_THEORY_ARCHIVE_2023-25/Crit.txt, lines 63-76, blob 6a3d2fbc45e99a5163326e18847f54169527f46f, 17,717 characters / 108 lines. Same blob in HsH 30SEP26_DUMP SAT 2026 PRE HsH and ROUNDUP DOCS. This is one duplicated source, not three independent derivations. Symbolic authorship not independently established from the compilation; do not attribute assistant-style equations automatically to Nathan.

ARCHIVED EQUATIONS:
B = [(4/3)*pi*R^3]/[4*pi*R^2] ->[R=1] 3/(4*pi)
n_winding=5 => scaling proportional to B^(-5)
mu = Ext(S[B3(B3)])/Ext(S[B1]) = 3/(2*B^5) ~= 1836.1527

EXACT CORRECTION (previously recognized by Hale): The source's own quotient is R/3, hence B=1/3 at R=1, and mu=729/2=364.5. If B is independently stipulated to be 3/(4*pi), then mu=512*pi^5/81=1934.34664950696424778, not 1836.1527. V3(S2) is geometrically mistyped; volume/area has units length before normalization.

NEW TOPOLOGY GATE: S3 has pi1(S3)=0 and H1(S3;Z)=0. Explicit contraction of the loop gamma(t)=(cos t,sin t,0,0) inside S3:
H(t,s)=(sqrt(1-s*s)*cos(t),sqrt(1-s*s)*sin(t),s,0), 0<=s<=1.
Its squared norm is identically 1; at s=0 it is the loop; at s=1 it is the point (0,0,1,0). Therefore the bare topology of S3 does NOT force five independent one-cycle winding invariants. A braid-complement or punctured worldtube configuration might have nontrivial topology, but must be defined and calculated separately. No rejection of finite-core H(s)H is implied.

NEW VARIATIONAL GATE: Without an independently fixed relative normalization of the electron/proton actions, stationary-action ratios are underdetermined. For positive lambda, replacing S_p by lambda*S_p leaves delta S_p=0 stationary points unchanged but rescales Ext(S_p)/Ext(S_e) by lambda. This defeats a claimed unique numerical ratio from the mere existence of two action extrema. Explicit shared action, boundary conditions and cross-sector normalization remain UNRESOLVED.

REAL BENCHMARK: 2022 CODATA/NIST proton-electron mass ratio mu_C=1836.152673426, standard uncertainty u=0.000000032=3.2e-8 (dimensionless), NIST database content updated May 2024. https://physics.nist.gov/cgi-bin/cuu/Value?mpsme
B=3/(4*pi): mu=1934.346649506964; residual=+98.193976080964; +5.347811078%; data-only z=+3.06856175253e9.
B=1/3: mu=364.5; residual=-1471.652673426; -80.14870957%; data-only z=-4.59891460446e10.
B_stable=0.24177: mu=1815.846806586171; residual=-20.305866839829; -1.105892072%; data-only z=-6.34558338745e8.
The B inverse fit 0.241232875656961 is post-hoc, NOT an independent prediction. The z values use observational uncertainty alone; no theory-side uncertainty is available.

CROSS-WORKER CORRECTION: Hale's Oct 20 publication hale-projection-quotient-mass-ratio-20261020t1336z-s3.md (blob 69e514438eb4cc36bb0cdcf9d681ac9480c4f689) incorrectly states u=3.2e-11 and hence inflates its standardized residuals by factor 1000. Correct u=3.2e-8. Its qualitative conclusion is unchanged. Alberr's Oct 21 audit already used the correct uncertainty.

REPRODUCIBLE MINIMAL PYTHON (executed independently in expanded primary and independent verifiers):
```python
from mpmath import mp
import sympy as s
mp.dps=70
R,t,z,lam,x=s.symbols('R t z lam x',positive=True)
assert s.simplify((s.Rational(4,3)*s.pi*R**3)/(4*s.pi*R**2)-R/3)==0
H=s.Matrix([s.sqrt(1-z*z)*s.cos(t),s.sqrt(1-z*z)*s.sin(t),z,0])
assert s.simplify(H.dot(H)-1)==0
assert H.subs(z,1)==s.Matrix([0,0,1,0])
S=x*x+1
assert s.simplify(s.diff(lam*S,x)-lam*s.diff(S,x))==0
B=3/(4*mp.pi)
mu=mp.mpf(3)/(2*B**5)
benchmark=mp.mpf('1836.152673426')
u=mp.mpf('0.000000032')
assert abs(mu-mp.mpf('1934.34664950696424778'))<mp.mpf('1e-19')
print(mp.nstr(mu,28),mp.nstr((mu-benchmark)/u,25))
```
Expected: 1934.346649506964247784241367; 3068561752.530132743257543.
Expanded 70-digit SymPy/mpmath verifier PASS; independent 55-digit Decimal and float64 verifier PASS; S3 101x101 grid max norm error 3.6223e-71. No Lean execution claimed.

CONTROL READS: live BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7, 86,946 chars / 563 lines; STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 11,012 chars / 155 lines; Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e, 10,998 chars / 103 lines. Random SAT Crit.txt 17,717 chars / 108 lines, blob above; random HsH Mercer mass discriminator 3,723 chars / 56 lines blob e03552a4d81328de5327600cb85c8834cabb52c6; additional random HsH MANIFOLDS.txt 235,200 chars / 4,740 lines blob 54f2f530697ab6e9c44758ce3406c4144915c73d. Full retrieval, relevant passages inspected, not exhaustive line-by-line interpretation.

MERSEARCH: Four occupied request lanes inspected; none overwritten. Bounded GitHub search preceded lane inspection, sequencing deviation disclosed. No new Mersearch execution or comprehensive three-repo coverage claimed. Privacy: public SAT/HsH/NIST only; no restricted HSH_RESOURCES content or protected signet.

GATES: algebra/dimensions original FAIL; exact correction INTERNALLY_CHECKED; S3 topological inference REJECTED as stated; augmented braid topology UNRESOLVED; action normalization UNRESOLVED; historical physical mass prediction REJECTED; CODATA_COMPARED (failure); no BEDROCK promotion. Next Mira: derive a concrete common action and braid-complement configuration before asserting a fifth-power eigenvalue.
