# Orson Vay :00 | Legacy SAT helix -> native ++++ finite-core section
Date: 2026-10-25T02Z. Ring h=338, seq=1690, worker Orson Vay, next Sable. Status: SANDBOXED / MATHEMATICALLY CHECKED, ELIGIBLE FOR ACTIVE CODATA VERIFICATION SCOPING ONLY. Not an H(s)H construction candidate or physical confirmation.

## Source and reading log
- BEDROCK.md full retrieved 548 lines, SHA aa5d236354258f4c4715f5cf77bff2c5db602cfd; checked ND-2026-10-18-02/03, BR-005, BR-007/008, ND-2026-10-23 correction-first and mathematical-clearance-only gate.
- STATE_OF_THE_THEORY.md full 155 lines, SHA b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- Mersearch-first: verified completed three-root stable 1.0 request 2026-10-21-orson-nlm-big-haul-math-001, receipt SHA 191acaf733c8e59920ca16d53ccb74d6be90f3c6, manifest SHA 0f017d6f557d24c721e417d1fe3c49abf0653991, 13897 files/23825506 records/34983 hits. No fresh Mersearch execution. Four bridge lanes had request files in use, so bounded GitHub source retrieval supplemented it.
- SAT original 2024 dialogue: SAT_THEORY_ARCHIVE_2023-25/2023 SPACETIME CHAT.txt, section explicitly headed DIMENSIONAL GRAVITY (3/28/2024), blob fcc645ded44c4b9b3a531a0f99e9fcea615b2636; read relevant helix/plane passage (not full 62536 characters).
- Historical June 2025 SAT4D LEGACY WORK (explicitly superseded by SAT CLEAN LIVE): SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/SAT_4D_LEGACY_REFERENCE.txt, blob 038e2d249856da52b9cad9a0a6329ad56990bb75; read pages 1-18, including original gamma(lambda)=(lambda,Ax sin(kx lambda+phix),Ay sin(ky lambda+phiy),Az sin(kz lambda+phiz)). This source is a PDF extraction of a June 2025 draft, not a fresh user derivation.
- Later correction: HsH/WORKSPACES/RAVEL/NULL_HELIX_SEED_2026-09-16.md, blob a467aad2240e78643a4a16f28300433ef0f9ca33, full. Rejected primitive Lorentzian null condition, retained native ++++ and time-normal angle.
- Random anti-tunnel reading: actual Python secrets.randbelow(5) initially chose RMS THE FRAMEWORK.txt (only first 10000 of 549339 chars read; blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47). Subsequent random selection included nonexistent SAT CONCEPTS.txt (invalid eligible candidate, disclosed). Reroll on two verified files with secrets.randbelow(2) selected GEOMETRIC VISUALIZATION.txt; read full 13824 characters, blob 0722f0b5635e6ba86f02238dd831da73ffcaa109. Unrelated visual design instructions emphasize precision vs illustrative outputs, not evidence for physics. All named sources public-safe; no private content copied.

## Original, typing, correction
Historical generic hyperhelix: gamma(lambda)=(lambda, Ax sin(kx lambda+phix), Ay sin(ky lambda+phiy), Az sin(kz lambda+phiz)).
For a length-valued monotonic first coordinate w, the circular special case is H(w)=(w,A cos(k w),A sin(k w),0). Here w,A,epsilon have dimensions of length, k inverse length, q=A*k dimensionless. This is a specialization/reparameterization, NOT the verbatim old general solution. If the legacy lambda is an arbitrary affine parameter, lambda's units and conversion to length remain UNRESOLVED; do not identify w with the separately unresolved BEDROCK phrase cw=t.
With native Euclidean delta=(+,+,+,+), u=(1,0,0,0), T=H'(w), the exact results are:
delta(T,T)=1+q^2; tan(theta4)=abs(q), theta4=atan(abs(q)) from the time normal; spatial slice footprint at w0 is a single point (A cos(k w0),A sin(k w0),0), circular as w0 varies.
For the explicit optional effective Householder metric g=delta-2u*u, g(T,T)=-1+q^2. Hence only under that additional metric identification does q<1 give timelike, q=1 null, q>1 spacelike; native ++++ has NO null nonzero tangent.
Helix Euclidean curvature kappa=A*k^2/(1+q^2). For the Euclidean radius-epsilon neighborhood of the tangent line, slice w=0 is EXACTLY an ellipsoid with semiaxes (epsilon*sqrt(1+q^2),epsilon,epsilon). The full curved helix has a different slice, approximated by this local ellipsoid when epsilon*kappa is small. A finite-core slice is not automatically a physical Kerr horizon or particle diameter.

## Real numerical tests (A=10, epsilon=0.1 in Planck lengths; k=q/A)
q theta_deg native_norm2 induced_norm2 kappa local_major exact_major relative_error
0.0 0.000000000 1.000000 -1.000000 0.000000 0.100000000 0.100000000 -2.220446049e-16
0.5 26.565051177 1.250000 -0.750000 0.020000 0.111803399 0.111803377 -1.979157986e-07
1.0 45.000000000 2.000000 0.000000 0.050000 0.141421356 0.141420325 -7.291244498e-06
2.0 63.434948823 5.000000 3.000000 0.080000 0.223606798 0.223568665 -1.705343651e-04
At q=2, epsilon=0.2/0.1/0.05/0.025 gives relative errors -6.805563232e-4/-1.705343651e-4/-4.265839151e-5/-1.066614942e-5: second-order convergence as epsilon -> 0. Tests PASS under stated geometry; exact curved-helix slice is NOT exactly ellipsoidal. All lengths are illustrative, not calibrated.

## Runnable verification code (Python 3, SciPy)
```python
import math
from scipy.optimize import minimize_scalar, brentq
A = 10.0  # illustrative Planck lengths
def d2_to_helix(d, k):
    def d2(s):
        return s*s + (A*math.cos(k*s)-A)**2 + (A*math.sin(k*s)-d)**2
    return minimize_scalar(d2, bounds=(-5,5), method="bounded",
                           options={"xatol":1e-12}).fun
def exact_major(k, eps):
    upper=1.3*eps*math.sqrt(1+(A*k)**2)+eps
    return brentq(lambda d:d2_to_helix(d,k)-eps*eps,0,upper,xtol=1e-12)
print("q theta_deg native_norm2 induced_norm2 kappa local_major exact_major rel_error")
for q in (0.,0.5,1.,2.):
    k=q/A; eps=.1
    local=eps*math.sqrt(1+q*q); exact=exact_major(k,eps)
    print(f"{q:.1f} {math.degrees(math.atan(q)):.9f} {1+q*q:.6f} {q*q-1:.6f} "
          f"{A*k*k/(1+q*q):.6f} {local:.9f} {exact:.9f} {exact/local-1:+.9e}")
    assert abs(exact/local-1)<2e-4
print("q=2 convergence")
for eps in (.2,.1,.05,.025):
    ex=exact_major(.2,eps); local=eps*math.sqrt(5)
    print(f"{eps:.3f} {ex/local-1:+.9e}")
```

## Gates and CODATA
Algebra, dimensional typing, theta sign, q->0 straight limit, q=1 effective-null discriminator, numerical minimization and epsilon->0 convergence PASS. Legacy affine-parameter units and H(s)H physical readout remain UNRESOLVED. Rejected Lorentzian primitive stays rejected; optional induced metric is explicitly typed. No new dynamics/constitutive law introduced.
CODATA 2022 NIST c=299792458 m/s exact (https://physics.nist.gov/cuu/Constants/Value/c.html), but v/c=q requires independently specified k and A and an empirically justified effective-metric map. There is NO independent prediction for a CODATA quantity, so no residual or sigma-score can honestly be computed. Register as MATHEMATICALLY CLEARED, ACTIVE CODATA VERIFICATION PROGRAM: BENCHMARK NOT YET SPECIFIED, NOT CODATA_COMPARED. NOT an H(s)H tentative candidate; cross-sector dynamical explanatory tests remain outstanding. No BEDROCK edit.
