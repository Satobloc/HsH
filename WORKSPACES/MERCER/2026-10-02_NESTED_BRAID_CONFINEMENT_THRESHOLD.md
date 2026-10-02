# Mercer Sandbox — Nested-Braid Confinement Threshold

Date: 2026-10-02
Status: SANDBOX / noncanonical. Independent construction; no PRIOR_ART.

## Sources actually read
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SCRATCH 3.txt`, read completely. Quarry used: the historical "braid of three braids of three" scale analogy and the proposed electron-worldline coil/solenoid picture. Particle/force identifications in that source are not adopted.
- Current H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md`, read completely. Quarry used: type the measure/dimensions before coefficient comparison; wrong-dimensional geometric analogies are rejected rather than normalized into agreement.

## Construction
Model one strand in a three-strand braid as a helix
[
X(\theta)=(r\cos\theta,r\sin\theta,b\theta),\qquad x=r/b.
]
For axial tension (T) and bending modulus (B), energy per axial length is
[
e(x)=T\sqrt{1+x^2}+\frac{B}{2b^2}\frac{x^2}{(1+x^2)^{3/2}}.
]
The radial restoring-force density is
[
f_r=\frac{1}{b}\frac{de}{dx}
=\frac{x[-Bx^2+2B+2Tb^2(1+x^2)^2]}{2b^3(1+x^2)^{5/2}}.
]
Scripted symbolic differentiation and limiting checks give
[
f_r\to T/b\quad(x\to\infty),
]
so tension supplies an asymptotically constant confinement-like force density; bending alone does not.

Define the dimensionless constitutive ratio
[
C=Tb^2/B.
]
Writing (y=x^2), positivity of (f_r) for all (x>0) reduces to
[
2C(1+y)^2+2-y\ge0.
]
The exact monotonic-confinement threshold is
[
\boxed{C\ge1/24}.
]
Below (1/24), the helix energy develops a nonmonotonic radial interval; topology plus bending alone is therefore insufficient for monotonic confinement in this toy model.

## Scale recursion discriminator
For a braid-of-three-braids coarse step with pitch scale (b_{n+1}=\lambda b_n) and approximately additive locked axial tension (T_{n+1}\approx3T_n), the large-separation force-density ratio is
[
\frac{f_{\infty,n+1}}{f_{\infty,n}}\approx\frac{3}{\lambda}.
]
Thus a weaker larger-scale residual interaction is not automatic: this minimal construction requires (\lambda>3). If measured/geometric scale recursion has (\lambda\le3), the historical "same braid, weaker at larger scale" story needs additional constitutive physics.

## Failure / next test
Numerically minimize a finite three-strand elastic braid with self-avoidance while sweeping (C), (x), and scale ratio (\lambda). Test whether the analytic (C=1/24) monotonicity boundary survives finite-core/contact corrections. Compare two levels using the same dimensionless (C), then deliberately change (C) to separate geometric scale recursion from constitutive change.

No particle identity, historical constant, or force label was used as a target.
