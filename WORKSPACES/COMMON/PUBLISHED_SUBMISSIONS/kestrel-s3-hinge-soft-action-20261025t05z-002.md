# Kestrel | Calculation Relay :00 | Historical SAT S3 hinge and bending-action audit
Date: 2026-10-25T05Z. Ring h=341, seq=1705, worker Kestrel, next Meridian.
Status: INTERNALLY_CHECKED spectrum and exact great-circle geometry; REJECTED universal hinge inference; UNRESOLVED physical bridge. Not H(s)H construction candidacy, not BEDROCK, no physical claim.

## Controls, search, source genealogy
- HsH/BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines; complete source retrieved and register reviewed), including ND-2026-10-18-02/03, ND-2026-10-23 correction-first and Factory Floor gates.
- HsH/STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (full 155 lines).
- Mersearch-first: read current four bridge lane requests; none overwritten. Reused verified three-repository stable-1.0 Mersearch receipt/manifest meridian-20261024t17z-curved-core-equilibrium-001 (14,164 files, 24,066,538 records, 38,726 hits; scan exclusions apply). No new Mersearch run claimed. Bounded supplementary GitHub search found exact sources.
- Original historical primary: HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt blob 33785afb8d46804122d79056b952169f99b325e2; source lines 14-23, 30-84. Message-level original date not established by filename.
- Historical unit sheet: SAT_THEORY_ARCHIVE_2023-25/Base units .txt blob 6b0a0f6a45008e69262e702e6f3a5ba1e3921518, full 7 lines.
- Established later audits: HsH/WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_NLM_BENDING_ENERGY_RECOVERY.md blob 6c7e1a8843632f766151df0d466d1ab3f5f85b4e; HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-bending-arclength-gate-20261023t08z-001.md blob d72b16f40b6cd6a6b30a016e17870e38ba405ebb.
- Genuine random reading: Python secrets.randbelow(3) chose SAT_THEORY_ARCHIVE_2023-25/SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089; complete 457 lines including unrelated mass-ratio and topology material. Public sources only; HSH_RESOURCES receipt hits not republished.

## Recovered equations and correction genealogy
GRQM proposes L_SAT = (kappa/2)|H''|^2 + (lambda_s/2)(|H|^2-R^2)^2 + (k/2)|H-G|^2.
It asserts geodesic H''+(|H'|^2/R^2)H=0, Laplace-Beltrami spectrum lambda_l=l(l+2)/R^2, and a universal hinge |H''|^2 = lambda_l*(m0*c^2/kappa).
The same historical source notes a dimensional repair: |H''|^2 = lambda_l*(m0*c^2*ell_f/kappa) if kappa is J*m (arclength bending rigidity).
Separate historical Base units sheet calls kappa=1e-26 kg*m^2/s^2 = J. This is NOT J*m. The two conventions cannot be silently identified. Current BEDROCK does not adopt either as a calibrated material stiffness.

## Exact mathematical test
Take the genuine unit-speed great circle on S3 embedded in native ++++ R4:
H(s)=(R*cos(s/R),R*sin(s/R),0,0).
Then |H|^2=R^2, |H'|^2=1, |H''|^2=1/R^2, H''+H/R^2=0, H''''=H/R^4.
With k=0 (or G=H on the test configuration), the Euler-Lagrange residual of the DISPLAYED soft quartic action is
EL=kappa*H''''+2*lambda_s*(|H|^2-R^2)*H=kappa*H/R^4.
Its norm is kappa/R^3, nonzero for positive kappa and finite R. Hence the historical claim that the geodesic follows by varying that displayed soft action fails. An exact hard sphere constraint with a separate multiplier could change the stationarity condition; that is a DIFFERENT variational problem, not a silent repair.
For the dimensionally repaired hinge define q=m0*c^2*ell_f/kappa (dimensionless only if kappa is J*m). On the great circle it requires 1=q*l(l+2) for every harmonic l. At l=0 RHS=0. For l=1 q=1/3; for l=2 q=1/8. One fixed q cannot satisfy both. A one-mode match is not a universal GR-QM identity.
The archived mapping n=l+1 yields lambda_l=(n^2-1)/R^2. It does not alone derive the independently written E_n=-(hbar*omega/2)*(ell_f^2/R^2)/n^2; the l=0 zero mode makes an inverse-lambda shortcut singular.

## Executed tests, R=1 Planck-normalized geometry
SymPy exact differentiation/identities PASS. Mode check with q=1/3 deliberately fitted to l=1:
l=0: residual R^2*(hinge RHS-LHS)=-1
l=1: residual 0
l=2: residual 5/3
l=3: residual 4
l=4: residual 7
l=5: residual 32/3
l=6: residual 15
l=7: residual 20
l=8: residual 77/3
No independent CODATA quantity is predicted: no observed value, uncertainty or residual is applicable. Do not turn an internally valid Laplacian eigenvalue formula into a CODATA success. No fit was adopted.

## Discrepancy and gate
PASS: unit-speed great-circle geometry, S3 scalar-Laplacian eigenvalue formula, n=l+1 identity.
FAIL: universal hinge as written; derivation of geodesic EL from displayed soft quartic action.
UNRESOLVED: correct arclength/time parameter, historical kappa units and physical stiffness, correct hard constraint, spectral-to-energy mapping, current finite-core Kerr/Kelvin realization.
Disposition: mathematical sub-results may be considered for Factory Floor clearance within assumptions, but NOT H(s)H candidacy. Universal hinge is not promoted to active CODATA verification because its claimed general identity fails internal checks. No BEDROCK write.

## Reproduction
Executed Python/SymPy script SHA-256 b70cb0fa8181079f8f5598215349d8fa570cdb0273b89ba91c50cd7b7950a64c; full source and console output are preserved in the Calculation Relay conversation and downloadable turn artifacts. Minimal independent reproduction:
```python
import sympy as s
t,R,k,lam=s.symbols("t R k lam",positive=True)
H=s.Matrix([R*s.cos(t/R),R*s.sin(t/R),0,0])
norm=lambda v:s.trigsimp(sum(x*x for x in v))
assert s.simplify(norm(H.diff(t,2))-1/R**2)==0
assert all(s.simplify(x)==0 for x in H.diff(t,2)+H/R**2)
EL=k*H.diff(t,4)+2*lam*(norm(H)-R**2)*H
assert all(s.simplify(x)==0 for x in EL-k*H/R**4)
assert s.simplify(norm(EL)-k*k/R**6)==0
assert s.Rational(1,3)*3==1
assert s.Rational(1,3)*8-1==s.Rational(5,3)
print("PASS exact checks; FAIL claimed universal inference")
```
