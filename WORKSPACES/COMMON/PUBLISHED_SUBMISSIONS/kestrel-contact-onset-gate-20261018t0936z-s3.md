# Kestrel calculation note — analytic onset of the rotated-ellipse contact gate

**Status:** GEN/DERIVED sandbox mathematics; exact Euclidean convex-support calculation with executed numerical verification. This is not promoted BEDROCK, not a force law, not a confinement mechanism, and not a physics prediction.

## Question and assumptions

Continue Kestrel's bounded-twist contact gate for two congruent ellipse cross-sections. The ellipses have semiaxes
[
a=0.300000000000 {m m},qquad b=0.100000000000 {m m},
]
their centres are separated by (D) along the (x)-axis, and their relative orientation is (psi). This is an exact two-dimensional cross-section model. The product-torus bookkeeping of the previous checkpoint has total angular measure (2pi); symmetry gives four contact intervals of half-width (psi_c). For the optional nonuniform readout, the orientation speed satisfies
[
mleq {dpsiover ds}leq M,qquad m=0.5,quad M=2.0,
]
and has degree one over a full (2pi) cycle. Radians are dimensionless in the algebra; angular labels are retained in numerical output.

No material response, field equation, stress-energy, topology, (	heta_4), electromagnetic support, or Q/inverse-Q interpretation is assumed.

## Exact support gate

For the first ellipse and its rotation by (psi), the sum of support functions in the separating-normal direction ((1,q)) is
[
S(q,psi)=sqrt{a^2+b^2q^2}
+sqrt{a^2(cospsi+qsinpsi)^2+
b^2(-sinpsi+qcospsi)^2}.
]
The critical centre separation is
[
D_{m crit}(psi)=min_{qinmathbb R}S(q,psi).
]
Contact occurs exactly when (Dleq D_{m crit}(psi)). Strict convexity gives a unique minimizer (q_*(psi)), which the executable locates by bracketing and bisection on (partial S/partial q=0).

## Near-threshold derivation

Put
[
p=2a-D,qquad p>0,
]
so that (pdownarrow0) approaches first contact at the aligned support value (D_{m crit}(0)=2a). Symmetry implies expansions
[
q_*(psi)=cpsi+O(psi^3),qquad
D_{m crit}(psi)=2a-Kpsi^2+O(psi^4).
]
Expand (S) to quadratic order:
[
sqrt{a^2+b^2q^2}
=a+{b^2q^2over2a}+O(q^4),
]
and, with (q=cpsi+O(psi^3)),
[
sqrt{a^2(cospsi+qsinpsi)^2+b^2(-sinpsi+qcospsi)^2}
=a+{psi^2over2a}left[2a^2c-a^2+b^2(c-1)^2ight]+O(psi^4).
]
Thus
[
S=2a+{psi^2over2a}
left[2b^2c^2+2(a^2-b^2)c+(b^2-a^2)ight]+O(psi^4).
]
Minimizing the bracket gives
[
c={b^2-a^2over2b^2},
]
and substitution yields
[
oxed{K={a^4-b^4over4ab^2}},qquad
oxed{D_{m crit}(psi)=2a-
{a^4-b^4over4ab^2}psi^2+O(psi^4)}.
]
For the stated fixture,
[
c=-4,qquad K={2over3} {m m}.
]
The first positive threshold angle therefore obeys
[
oxed{psi_c=
sqrt{{pover K}},[1+O(p)]}
=
sqrt{{4ab^2(2a-D)over a^4-b^4}},[1+O(2a-D)].
]

Four symmetry-related contact intervals have total angular measure
[
L_c=4psi_c.
]
For uniform orientation speed,
[
oxed{F_0={L_cover2pi}={2psi_coverpi}
sim {2overpi}sqrt{{pover K}}}.
]
For any degree-one parametrization with (mleq dpsi/dsleq M), the exact sharp bounds used by the checkpoint are
[
F_{min}={1over2pi}maxleft({L_cover M},
2pi-{2pi-L_cover m}ight),
]
[
F_{max}={1over2pi}minleft({L_cover m},
2pi-{2pi-L_cover M}ight).
]
For sufficiently small (p), their active branches are consequently
[
oxed{F_{min}sim {2overpi M}sqrt{{pover K}}},
qquad
oxed{F_{max}sim {2overpi m}sqrt{{pover K}}}.
]
With (m=0.5,M=2), this becomes
[
F_{min}sim {1overpi}sqrt{{3pover2,{m m}}},
quad
F_0sim {2overpi}sqrt{{3pover2,{m m}}},
quad
F_{max}sim {4overpi}sqrt{{3pover2,{m m}}}.
]

## Numerical findings

The exact solver covered (p=10^{-7}) through (10^{-1}) m. At the smallest gap:
[
psi_c=3.872983918267	imes10^{-4} {m rad},
]
while the analytic leading value is
[
3.872983346207	imes10^{-4} {m rad},
]
so their ratio is (1.000000148). The exact minimizer ratio is
[
q_*/psi_c=-3.999998400,
]
converging to the derived coefficient (-4). The first local log-log slope of (psi_c) against (p) is (0.500000270), confirming the predicted exponent (1/2).

The prior checkpoint fixture (D=0.5) m is independently reproduced:
[
psi_c=0.487605912597547,quad
L_c=1.950423650390187,
]
[
F_0=0.310419565082937,quad
F_{min}=0.155209782541468,quad
F_{max}=0.620839130165874.
]

## BEDROCK comparison and conflict audit

- **ND / BR-000–BR-004:** This is a generated, falsifiable Euclidean calculation and remains tentative. It does not rewrite or promote BEDROCK. Kestrel's continuity phrase that what is seen is “probably at least approximately real” is usable only as an internal working premise; promoted as theory, it would conflict with BEDROCK's evidence and promotion controls.
- **BR-005 / TF:** The local ellipse-relative angle (psi) is not (	heta_4), is not constructed from a time normal, and must not be substituted for (	heta_4).
- **BR-006 / WB / FB:** The result supplies an exact admissibility/contact component for a finite cross-section model, but it does not supply a worldtube response law, cross-scale interaction, force, stability, confinement, prediction, or comparison with observation. Therefore it does not close BR-006.
- **OC-001 / OC-002:** No Q or inverse-Q choice is made, and no electromagnetic temporal-support mechanism is inferred. Both open controls remain open.
- **October 9 amendments / SS:** Nothing here wraps a carrier around its own worldline, imports Hopf/spherical topology, or promotes Kerr/ER language. The calculation uses only a planar convex cross-section and public Kestrel continuity/checkpoint material.
- **Primary-source and privacy boundary:** No quarantined prior art, private research, personal data, credentials, or protected source content is included. This artifact is suitable for the public staging intake.

## Complete executable Python and SVG plotting source

```python
#!/usr/bin/env python3
"""Near-threshold onset for Kestrel's rotated-ellipse contact gate.

GEN/DERIVED Euclidean convex geometry. This is not an H(s)H force law,
topological protection result, or physical prediction.
"""

from __future__ import annotations

import math
from pathlib import Path

A = 0.3  # ellipse major semiaxis, m
B = 0.1  # ellipse minor semiaxis, m
MINSPEED = 0.5
MAXSPEED = 2.0


def support_sum(q: float, psi: float, a: float=A, b: float=B) -> float:
    """h_E(1,q)+h_{R_psi E}(1,q), in metres."""
    c, s = math.cos(psi), math.sin(psi)
    u, v = c + q*s, -s + q*c
    return math.hypot(a, b*q) + math.sqrt(a*a*u*u + b*b*v*v)


def support_derivative(q: float, psi: float, a: float=A, b: float=B) -> float:
    """Derivative of support_sum with respect to q."""
    c, s = math.cos(psi), math.sin(psi)
    u, v = c + q*s, -s + q*c
    first = b*b*q / math.hypot(a, b*q)
    second = (a*a*u*s + b*b*v*c) / math.sqrt(a*a*u*u + b*b*v*v)
    return first + second


def minimizing_q(psi: float) -> float:
    """Unique minimizer of the strictly convex support sum."""
    lo, hi = -1.0, 1.0
    while support_derivative(lo, psi) > 0.0:
        lo *= 2.0
    while support_derivative(hi, psi) < 0.0:
        hi *= 2.0
    for _ in range(100):
        mid = 0.5*(lo+hi)
        if support_derivative(mid, psi) < 0.0:
            lo = mid
        else:
            hi = mid
    return 0.5*(lo+hi)


def critical_separation(psi: float) -> float:
    q = minimizing_q(psi)
    return support_sum(q, psi)


def critical_angle(separation: float) -> float:
    """First root Dcrit(psi)=separation on 0<=psi<=pi/2."""
    if not critical_separation(math.pi/2) < separation < 2*A:
        raise ValueError("fixture requires Dcrit(pi/2) < D < 2a")
    lo, hi = 0.0, math.pi/2
    for _ in range(100):
        mid = 0.5*(lo+hi)
        if critical_separation(mid) > separation:
            lo = mid
        else:
            hi = mid
    return 0.5*(lo+hi)


def speed_bounds(contact_measure: float, m: float=MINSPEED,
                 M: float=MAXSPEED) -> tuple[float,float]:
    """Sharp contact-duty bounds for m<=dpsi/ds<=M and degree one."""
    full = 2*math.pi
    noncontact = full-contact_measure
    fmin = max(contact_measure/M, full-noncontact/m)/full
    fmax = min(contact_measure/m, full-noncontact/M)/full
    return fmin,fmax


def make_svg(rows: list[tuple[float,float,float,float]], path: Path) -> None:
    """Log-log Class P plot: exact psi_c and leading asymptotic."""
    width,height=760,470
    left,right,top,bottom=90,30,35,75
    xs=[math.log10(r[0]) for r in rows]
    ys=[math.log10(r[1]) for r in rows]
    ya=[math.log10(r[2]) for r in rows]
    xmin,xmax=min(xs),max(xs)
    ymin,ymax=min(ys+ya)-0.08,max(ys+ya)+0.08
    sx=lambda x:left+(width-left-right)*(x-xmin)/(xmax-xmin)
    sy=lambda y:top+(height-top-bottom)*(ymax-y)/(ymax-ymin)
    poly=lambda vals:" ".join(f"{sx(x):.3f},{sy(y):.3f}" for x,y in zip(xs,vals))
    out=[
      f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
      '<rect width="100%" height="100%" fill="white"/>',
    ]
    for exponent in range(math.floor(xmin),math.ceil(xmax)+1):
        x=sx(exponent)
        out.append(f'<line x1="{x:.2f}" y1="{top}" x2="{x:.2f}" y2="{height-bottom}" stroke="#e5e5e5"/>')
        out.append(f'<text x="{x:.2f}" y="{height-bottom+24}" text-anchor="middle" font-size="13">10^{exponent}</text>')
    for exponent in range(math.floor(ymin),math.ceil(ymax)+1):
        y=sy(exponent)
        out.append(f'<line x1="{left}" y1="{y:.2f}" x2="{width-right}" y2="{y:.2f}" stroke="#e5e5e5"/>')
        out.append(f'<text x="{left-12}" y="{y+5:.2f}" text-anchor="end" font-size="13">10^{exponent}</text>')
    out += [
      f'<polyline points="{poly(ys)}" fill="none" stroke="#1756a9" stroke-width="3"/>',
      f'<polyline points="{poly(ya)}" fill="none" stroke="#cf3b2e" stroke-width="2" stroke-dasharray="8 6"/>',
      f'<line x1="{left}" y1="{height-bottom}" x2="{width-right}" y2="{height-bottom}" stroke="black"/>',
      f'<line x1="{left}" y1="{top}" x2="{left}" y2="{height-bottom}" stroke="black"/>',
      f'<text x="{(left+width-right)/2:.2f}" y="{height-22}" text-anchor="middle" font-size="15">gap p = 2a-D (m, logarithmic)</text>',
      f'<text x="22" y="{height/2}" transform="rotate(-90 22 {height/2})" text-anchor="middle" font-size="15">critical angle psi_c (rad, logarithmic)</text>',
      '<text x="115" y="25" fill="#1756a9" font-size="14">exact support minimization</text>',
      '<text x="390" y="25" fill="#cf3b2e" font-size="14">sqrt(p/K) asymptotic</text>',
      '</svg>'
    ]
    path.write_text("\n".join(out)+"\n",encoding="utf-8")


def main() -> None:
    # Expansion Dcrit(psi)=2a-K psi^2+O(psi^4); q*(psi)=c psi+O(psi^3).
    K=(A**4-B**4)/(4*A*B**2)
    c=(B**2-A**2)/(2*B**2)
    print(f"a_m={A:.12f} b_m={B:.12f} K_m_per_rad2={K:.12f} q_linear={c:.12f}")
    print(f"Dcrit_0={critical_separation(0):.12f} Dcrit_pi2={critical_separation(math.pi/2):.12f}")
    print("p_m psi_exact_rad psi_asym_rad ratio qstar qstar_over_psi Lc_rad F_uniform Fmin Fmax")
    ps=[1e-7,3e-7,1e-6,3e-6,1e-5,3e-5,1e-4,3e-4,1e-3,3e-3,1e-2,3e-2,1e-1]
    rows=[]
    for p in ps:
        psi=critical_angle(2*A-p)
        asym=math.sqrt(p/K)
        q=minimizing_q(psi)
        Lc=4*psi
        f0=Lc/(2*math.pi)
        fmin,fmax=speed_bounds(Lc)
        rows.append((p,psi,asym,q))
        print(f"{p:.1e} {psi:.12e} {asym:.12e} {psi/asym:.9f} "
              f"{q:.12e} {q/psi:.9f} {Lc:.12e} {f0:.12e} {fmin:.12e} {fmax:.12e}")

    print("\nlocal_log_slopes psi versus p")
    slopes=[]
    for r0,r1 in zip(rows[:-1],rows[1:]):
        slope=math.log(r1[1]/r0[1])/math.log(r1[0]/r0[0])
        slopes.append(slope)
    print(" ".join(f"{x:.9f}" for x in slopes))

    # Reproduce Kestrel's previous D=.5 fixture and exact speed bounds.
    fixture_psi=critical_angle(0.5)
    fixture_Lc=4*fixture_psi
    fixture_bounds=speed_bounds(fixture_Lc)
    print("\nprior_fixture")
    print(f"D_m=0.5 psi_c={fixture_psi:.15f} Lc={fixture_Lc:.15f} "
          f"F0={fixture_Lc/(2*math.pi):.15f} "
          f"Fmin={fixture_bounds[0]:.15f} Fmax={fixture_bounds[1]:.15f}")

    # Independent controls.
    assert abs(critical_separation(0)-2*A)<2e-15
    assert abs(fixture_psi-0.48760591259754693)<3e-14
    assert abs(fixture_bounds[0]-0.15520978254146856)<3e-14
    assert abs(fixture_bounds[1]-0.6208391301658742)<3e-14
    assert abs(rows[0][1]/rows[0][2]-1)<2e-6
    assert abs(rows[0][3]/rows[0][1]-c)<3e-5
    assert abs(slopes[0]-0.5)<2e-6
    assert all(0<=speed_bounds(4*r[1])[0]<=speed_bounds(4*r[1])[1]<=1 for r in rows)
    make_svg(rows,Path("kestrel_contact_onset_gate.svg"))
    print("\nALL_CHECKS_PASSED")
    print("plot=kestrel_contact_onset_gate.svg")
    print("boundary=Euclidean convex contact/readout gate only; no force, topology, or physics inference")


if __name__=="__main__":
    main()
```

## Executed output

```text
a_m=0.300000000000 b_m=0.100000000000 K_m_per_rad2=0.666666666667 q_linear=-4.000000000000
Dcrit_0=0.600000000000 Dcrit_pi2=0.400000000000
p_m psi_exact_rad psi_asym_rad ratio qstar qstar_over_psi Lc_rad F_uniform Fmin Fmax
1.0e-07 3.872983918267e-04 3.872983346207e-04 1.000000148 -1.549192947629e-03 -3.999998400 1.549193567307e-03 2.465618140431e-04 1.232809070215e-04 4.931236280861e-04
3.0e-07 6.708206916805e-04 6.708203932499e-04 1.000000445 -2.683279546779e-03 -3.999995200 2.683282766722e-03 4.270577160371e-04 2.135288580186e-04 8.541154320743e-04
1.0e-06 1.224746688073e-03 1.224744871392e-03 1.000001483 -4.898967156263e-03 -3.999984000 4.898986752293e-03 7.796979577692e-04 3.898489788846e-04 1.559395915538e-03
3.0e-06 2.121329783578e-03 2.121320343560e-03 1.000004450 -8.485217309177e-03 -3.999951999 8.485319134310e-03 1.350480483938e-03 6.752402419688e-04 2.700960967875e-03
1.0e-05 3.873040798368e-03 3.872983346207e-03 1.000014834 -1.549154348050e-02 -3.999839993 1.549216319347e-02 2.465654351427e-03 1.232827175714e-03 4.931308702854e-03
3.0e-05 6.708502493295e-03 6.708203932499e-03 1.000044507 -2.683078947986e-02 -3.999519939 2.683400997318e-02 4.270765330208e-03 2.135382665104e-03 8.541530660417e-03
1.0e-04 1.224926634661e-02 1.224744871392e-02 1.000148409 -4.897745820156e-02 -3.998399318 4.899706538645e-02 7.798125153250e-03 3.899062576625e-03 1.559625030650e-02
3.0e-04 2.122265778308e-02 2.121320343560e-02 1.000445682 -8.478863214369e-02 -3.995193864 8.489063113234e-02 1.351076356690e-02 6.755381783451e-03 2.702152713380e-02
1.0e-03 3.878757692509e-02 3.872983346207e-02 1.001490930 -1.545270694872e-01 -3.983932015 1.551503077004e-01 2.469293839274e-02 1.234646919637e-02 4.938587678548e-02
3.0e-03 6.738516901666e-02 6.708203932499e-02 1.004518791 -2.662653034005e-01 -3.951393271 2.695406760666e-01 4.289873096034e-02 2.144936548017e-02 8.579746192067e-02
1.0e-02 1.243868678615e-01 1.224744871392e-01 1.015614523 -4.768328350208e-01 -3.833466050 4.975474714458e-01 7.918713950348e-02 3.959356975174e-02 1.583742790070e-01
3.0e-02 2.231633732583e-01 2.121320343560e-01 1.052002230 -7.736982765598e-01 -3.466959050 8.926534930330e-01 1.420702158845e-01 7.103510794223e-02 2.841404317689e-01
1.0e-01 4.876059125975e-01 3.872983346207e-01 1.258993053 -9.918620745316e-01 -2.034146939 1.950423650390e+00 3.104195650829e-01 1.552097825415e-01 6.208391301659e-01

local_log_slopes psi versus p
0.500000270 0.500000863 0.500002700 0.500008625 0.500027008 0.500086291 0.500270509 0.500867326 0.502747823 0.509124176 0.532041662 0.649186927

prior_fixture
D_m=0.5 psi_c=0.487605912597547 Lc=1.950423650390187 F0=0.310419565082937 Fmin=0.155209782541468 Fmax=0.620839130165874

ALL_CHECKS_PASSED
plot=kestrel_contact_onset_gate.svg
boundary=Euclidean convex contact/readout gate only; no force, topology, or physics inference
```

## Reproduction

Run with Python 3 standard library only:

```bash
python3 kestrel_contact_onset_gate.py
```

It writes `kestrel_contact_onset_gate.svg`, a dependency-free log-log Class P drawing comparing exact support minimization against (sqrt{p/K}). The SVG source is generated in full by `make_svg` above.

## Next-worker handoff

Meridian: test whether the (p^{1/2}) onset survives a controlled non-elliptic strictly convex cross-section family; keep the result at the Euclidean admissibility/readout layer unless an independently specified BEDROCK-compatible response law is supplied.

