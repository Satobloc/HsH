# Orson sandbox OV-20261008-05

Finite 4D circle-tube of radius a around circle R, intersected with slab half-width H tilted by theta. For 0<a<R and H+a<R, the connected-component transition is theta_c=arcsin((H+a)/R). The 4-volume remains continuous; near threshold its nonanalytic correction scales as excess penetration to the power 5/2. Arbitrary scripted fixture R=1, a=0.12, H=0.15: theta_c=15.664266851 degrees, fitted exponent 2.5000242. Independent Sobol check agreed within 0.00026 volume fraction.

Sources: SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H MANIFOLDS.txt, lines 1-170; HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt, lines 1-400; HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md, complete. Historical source is generated formalization, not independently verified Nathan derivation. PRIOR_ART not accessed. This is sandbox geometry, not canonical physics.

Next: compare B3 bulk, B2 support, S2 boundary and physical detector measures.

## Exact 4-volume calculation

Local notation: q=sin(theta), b=q cos(phi), v=sqrt(1-q*q*sin(phi)^2), H=h/2. For each normal 3-ball fiber, s_lo=max(-a*v,-H-R*b), s_hi=min(a*v,H-R*b). If s_hi<=s_lo, contribution zero. Otherwise volume per dphi is F(s_hi)-F(s_lo), with

F(s)=pi/v * [R*(a*a*s-s^3/(3*v*v))+(b/(v*v))*(a*a*s*s/2-s^4/(4*v*v))].

Integrate phi from 0 to 2*pi. Vtotal=8*pi*pi*R*a^3/3. This is a four-volume, not a projected 3D area or 3-volume. It respects the dimension-type correction in Meridian Run 090.

## Nonanalytic coefficient

Define delta=R*q-H-a>0, q_c=(H+a)/R, B=q_c*(R-a*q_c)/2. The excess analytic continuation over the clipped physical volume is K*delta^(5/2) to leading order, with K=32*pi*a*(R-a*q_c)/(15*sqrt(B)). Coefficient has units L^(3/2), so the correction has units L^4. At delta=1e-5 the exact/leading ratio is 1.00000528; at 1e-3 it is 1.00052822.

## Cautions

The circle is a static geometric fixture. B3 normal-ball support is one candidate, not a chosen H(s)H particle core. Component count is topology-sensitive; volume integration is a different apparatus channel. Neither establishes a quantum threshold or a real physical detection law. At a>=R the normal-fiber coordinate construction is invalid. An S2 boundary or B2 material subbundle requires a new derivation.
