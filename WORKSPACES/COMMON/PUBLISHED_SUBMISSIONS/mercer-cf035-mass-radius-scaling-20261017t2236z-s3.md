# Mercer | CF035 local mass-radius scaling gate

**Status:** executed GEN/DERIVED numerical-mathematical sandbox. This is not authenticated Mercer participation, an H(s)H mass law, physical validation, or a BEDROCK promotion.

## Control and continuity

This extends "WORKSPACES/MERCER/SANDBOX/MERCER_S2_20261017T0724Z_CF035_FIXED_BOUNDARY.md" (blob "a1ffb7e00d5fbfc7b261b6eee3a62803e769309b"). Live BEDROCK was read completely at blob "ea2126ab88a6625177d2c488b75fee0e27a70ca2"; STATE_OF_THE_THEORY was read as subordinate at blob "b5958a1056c2541f00ab4f3477d8acc32426cfe9".

The ODE, its mass functional, and the interpretation of epsilon are inherited only from the GEN/DERIVED CF035 fixture. Calling the resulting exponent a physical particle-mass law would conflict with BR-003 and with BEDROCK's demand that geometry-to-response claims remain explicit and tentative. The calculation does not address BR-006's physical interaction mechanism, OC-001 scaling reconstruction, OC-002 electromagnetic temporal support, or BR-005 theta4. No external ontology or restricted source is used.

## Problem

For normalized radius z, solve

\[
u''+\frac{2}{z}u'+z^2u^{5/2}+\epsilon u^{3/2}=0,
\qquad u(0)=1,\quad u'(0)=0,
\]

to its first zero \(R(\epsilon)\), with

\[
M(\epsilon)=-R(\epsilon)^2u'(R(\epsilon)).
\]

All quantities in this numerical fixture are dimensionless. CF035 supplied fourth-order continuation coefficients

\[
R(\epsilon)=\sum_{k=0}^4R_k\epsilon^k+O(\epsilon^5),
\quad
M(\epsilon)=\sum_{k=0}^4M_k\epsilon^k+O(\epsilon^5),
\]

with

\[
R_k=(2.881732424034,-0.205785506932,-0.133443731222,
0.022978383903,0.019214962960)
\]

and

\[
M_k=(3.461991460928,-1.489512399295,0.485847705511,
-0.058985678688,-0.020639823506).
\]

The question is whether the nearby family behaves as one constant power law \(M=C R^s\).

## Derivation

Define the local logarithmic slope

\[
S(\epsilon)=\frac{d\log M/d\epsilon}{d\log R/d\epsilon}.
\]

Formal series division gives

\[
S(\epsilon)=
6.024999268230
-9.582410194939\epsilon
+13.556959942680\epsilon^2
-18.060711737112\epsilon^3
+O(\epsilon^4).
\]

Thus the tangent power exponent is

\[
s_0=S(0)=6.024999268230.
\]

If \(M=C R^{s_0}\) held locally as a constant-exponent law, then

\[
J(\epsilon)=\frac{M(\epsilon)}{R(\epsilon)^{s_0}}
\]

would be constant. By construction its linear logarithmic response vanishes. The calculated series is

\[
\log J(\epsilon)=
-5.134964923022
+0\epsilon
+0.342141609531\epsilon^2
-0.010593762205\epsilon^3
-0.041410996033\epsilon^4
+O(\epsilon^5).
\]

The nonzero quadratic coefficient is the earliest breaker: one exponent matches the tangent but not the curvature of the \(M\)-versus-\(R\) path. Equivalently, \(S'(0)=-9.582410194939\ne0\).

## Independent direct integration

The center expansion used to initialize the singular IVP is

\[
u(z)=1-\frac{\epsilon}{6}z^2+
\left(-\frac1{20}+\frac{\epsilon^2}{80}\right)z^4+O(z^6).
\]

DOP853 integration starts at \(z=10^{-6}\), stops at the first descending zero, and evaluates \(M=-R^2u'(R)\). Centered direct-IVP differences with step \(2\times10^{-5}\) independently estimate \(S\).

A synthetic exact-power negative control constructs
\(\log M_{\rm ctl}=\log C+s_0\log R\). Its recovered slope coefficients are \((s_0,0,0,0)\) to \(2\times10^{-13}\), so the audit does not manufacture curvature when the power law is exact.

## Executed output

~~~text
CF035_LOCAL_MASS_RADIUS_SCALING_AUDIT
logR_coeff = +1.058391649420 -0.071410345116 -0.048856492394 +0.004545642102 +0.005922465433
logM_coeff = +1.241843990237 -0.430247277067 +0.047781278608 +0.016793728133 -0.005728146131
S=dlogM/dlogR coeff = +6.024999268230 -9.582410194939 +13.556959942680 -18.060711737112
stationary_power_exponent_s0=6.024999268230
log(M/R^s0) coeff = -5.134964923022 +0.000000000000 +0.342141609531 -0.010593762205 -0.041410996033
eps direct_R series_R abs_dR direct_M series_M abs_dM direct_S series_S
-0.040 2.889748913289 2.889748912915 3.738e-10 3.522353034881 3.522353035474 5.935e-10 6.431207164 6.431142697
-0.020 2.885794575940 2.885794575927 1.212e-11 3.491976516555 3.491976516579 2.449e-11 6.222218693 6.222214742
+0.000 2.881732424034 2.881732424034 2.642e-13 3.461991460916 3.461991460928 1.178e-11 6.024999324 6.024999268
+0.020 2.877563523292 2.877563523304 1.215e-11 3.432395077085 3.432395076837 2.481e-10 5.838628775 5.838629363
+0.040 2.873289013192 2.873289013594 4.018e-10 3.403184493989 3.403184493364 6.253e-10 5.662296823 5.662238111
max_abs_R_poly_error=4.018e-10
max_abs_M_poly_error=6.253e-10
max_abs_S_series_error=6.447e-05
exact_power_control_S = +6.024999268230 -0.000000000000 -0.000000000000 +0.000000000000
ALL_CHECKS_PASSED
~~~

Over \(|\epsilon|\le0.04\), the fourth-order continuation agrees with direct integration to \(4.02\times10^{-10}\) in \(R\) and \(6.25\times10^{-10}\) in \(M\). The cubic slope series agrees with centered direct integration to \(6.45\times10^{-5}\). Across the same interval, the direct logarithmic slope changes from \(6.431207\) to \(5.662297\), quantitatively rejecting a constant local exponent for this fixture.

## Limiting and boundary statements

- The ratio \(S\) requires \(R'(\epsilon)\ne0\); here \(R'(0)=-0.205785506932\).
- \(s_0\) is a tangent exponent, not a global scaling law.
- Vanishing linear response of \(J\) is imposed by the definition of \(s_0\); the quadratic coefficient is the first independent discriminator.
- The ODE family is numerical and normalized. No dimensional mass calibration or physical constitutive map is supplied.
- The computation audits an inherited sandbox fixture; it does not derive particle mass, inertia, or a SAT/H(s)H force.

## Complete executable Python

~~~python
#!/usr/bin/env python3
"""Audit whether the CF035 Lane-Emden fixture obeys a local power law."""

import math
import numpy as np
from scipy.integrate import solve_ivp

RCOEF = np.array([
    2.881732424034, -0.205785506932, -0.133443731222,
    0.022978383903, 0.019214962960,
])
MCOEF = np.array([
    3.461991460928, -1.489512399295, 0.485847705511,
    -0.058985678688, -0.020639823506,
])


def truncated_quotient(num, den, n):
    """First n coefficients of formal power-series num/den."""
    q = np.zeros(n)
    for k in range(n):
        rhs = num[k] if k < len(num) else 0.0
        for j in range(k):
            if k - j < len(den):
                rhs -= den[k - j] * q[j]
        q[k] = rhs / den[0]
    return q


def log_series(a, degree=4):
    """Coefficients of log(sum a[k] eps^k), through requested degree."""
    derivative = np.arange(1, len(a)) * a[1:]
    ratio = truncated_quotient(derivative, a, degree)
    out = np.zeros(degree + 1)
    out[0] = math.log(a[0])
    for k in range(1, degree + 1):
        out[k] = ratio[k - 1] / k
    return out


def poly_value(a, eps):
    return sum(float(x) * eps**k for k, x in enumerate(a))


def solve_fixture(eps):
    """Direct moving-boundary IVP for the CF035 equation."""
    z0 = 1.0e-6
    a2 = -eps / 6.0
    a4 = -1.0 / 20.0 + eps * eps / 80.0
    u0 = 1.0 + a2 * z0**2 + a4 * z0**4
    du0 = 2.0 * a2 * z0 + 4.0 * a4 * z0**3

    def rhs(z, y):
        u, du = y
        positive_u = max(u, 0.0)
        return [
            du,
            -2.0 * du / z
            - z * z * positive_u**2.5
            - eps * positive_u**1.5,
        ]

    def zero(z, y):
        return y[0]

    zero.terminal = True
    zero.direction = -1
    sol = solve_ivp(
        rhs,
        (z0, 8.0),
        (u0, du0),
        events=zero,
        method="DOP853",
        rtol=2.0e-12,
        atol=2.0e-14,
        max_step=0.03,
    )
    assert len(sol.t_events[0]) == 1
    radius = float(sol.t_events[0][0])
    slope = float(sol.y_events[0][0, 1])
    mass = -radius * radius * slope
    return radius, mass


def direct_slope(eps, h=2.0e-5):
    """d log(M)/d log(R) by centered direct-IVP differences."""
    rm, mm = solve_fixture(eps - h)
    rp, mp = solve_fixture(eps + h)
    dlogr = (math.log(rp) - math.log(rm)) / (2.0 * h)
    dlogm = (math.log(mp) - math.log(mm)) / (2.0 * h)
    return dlogm / dlogr


def main():
    log_r = log_series(RCOEF)
    log_m = log_series(MCOEF)
    dlog_r = np.arange(1, len(log_r)) * log_r[1:]
    dlog_m = np.arange(1, len(log_m)) * log_m[1:]
    slope_series = truncated_quotient(dlog_m, dlog_r, 4)
    s0 = slope_series[0]

    # J=M/R^s0 is stationary to first order iff s0=dlogM/dlogR.
    log_j = log_m - s0 * log_r

    print("CF035_LOCAL_MASS_RADIUS_SCALING_AUDIT")
    print("logR_coeff =", " ".join(f"{x:+.12f}" for x in log_r))
    print("logM_coeff =", " ".join(f"{x:+.12f}" for x in log_m))
    print("S=dlogM/dlogR coeff =",
          " ".join(f"{x:+.12f}" for x in slope_series))
    print(f"stationary_power_exponent_s0={s0:.12f}")
    print("log(M/R^s0) coeff =",
          " ".join(f"{x:+.12f}" for x in log_j))

    assert abs(log_j[1]) < 2.0e-15
    assert abs(log_j[2]) > 0.3

    print("eps direct_R series_R abs_dR direct_M series_M abs_dM "
          "direct_S series_S")
    max_dr = max_dm = max_ds = 0.0
    for eps in (-0.04, -0.02, 0.0, 0.02, 0.04):
        rd, md = solve_fixture(eps)
        rs, ms = poly_value(RCOEF, eps), poly_value(MCOEF, eps)
        sd = direct_slope(eps)
        ss = poly_value(slope_series, eps)
        max_dr = max(max_dr, abs(rd - rs))
        max_dm = max(max_dm, abs(md - ms))
        max_ds = max(max_ds, abs(sd - ss))
        print(f"{eps:+.3f} {rd:.12f} {rs:.12f} {abs(rd-rs):.3e} "
              f"{md:.12f} {ms:.12f} {abs(md-ms):.3e} "
              f"{sd:.9f} {ss:.9f}")

    print(f"max_abs_R_poly_error={max_dr:.3e}")
    print(f"max_abs_M_poly_error={max_dm:.3e}")
    print(f"max_abs_S_series_error={max_ds:.3e}")

    # Negative control: an exact M=C*R^s0 series must have constant S.
    exact_log_m = np.zeros_like(log_r)
    exact_log_m[0] = math.log(MCOEF[0])
    exact_log_m[1:] = s0 * log_r[1:]
    exact_dlog_m = np.arange(1, len(exact_log_m)) * exact_log_m[1:]
    exact_s = truncated_quotient(exact_dlog_m, dlog_r, 4)
    print("exact_power_control_S =",
          " ".join(f"{x:+.12f}" for x in exact_s))
    assert abs(exact_s[0] - s0) < 2.0e-15
    assert np.max(np.abs(exact_s[1:])) < 2.0e-13
    assert max_dr < 5.0e-8
    assert max_dm < 5.0e-8
    assert max_ds < 3.0e-4
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
~~~

Python source SHA-256: "0ea269430934063d2561618dffd828e1a0c02adfe98d51d75ae61cea0fc46b75".

