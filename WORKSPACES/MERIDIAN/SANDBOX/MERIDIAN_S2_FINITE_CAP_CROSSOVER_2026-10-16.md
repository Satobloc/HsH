# Meridian s2 | finite-cap regularization of R4 tube crossing

Run REVROT3-19-20261016:128:s2. SANDBOX GEN/DERIVED geometry, not a force law.
Source: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/REVROT3-19-20261015T09-s3-meridian-angle-overlap.md.

Two flat-capped radius-R R4 normal 3-ball tubes have axes
A(t)=(t,0,0,0), B(t)=(t cos(theta),t sin(theta),D,0), |t|<=L.
Define u=x2, v=-sin(theta)x1+cos(theta)x2, y=x3,z=x4.
The exact four-volume is (1/sin(theta)) times the integral over the
common-normal disk lens of the area of rectangle |u|<=a, |v|<=b
clipped by |cos(theta)u-v|<=L sin(theta) and
|u-cos(theta)v|<=L sin(theta), where
a^2=R^2-y^2-z^2, b^2=R^2-(y-D)^2-z^2.
At theta=0, V=2L*pi*(4R+D)*(2R-D)^2/12 exactly.

For p=2R-D->0+ with lambda=L sin(theta)/sqrt(Rp) fixed:
V ~ R^(3/2)*p^(5/2)*F(lambda)/(2 sin(theta)),
F(lambda)=pi*(2lambda-lambda^3/3+lambda^5/40) for 0<=lambda<=2,
F(lambda)=32pi/15 for lambda>=2.
The exact F is obtained by integrating the limiting constraints
U^2+w^2<=1-t, V^2+w^2<=1+t, |U-V|<=lambda,
then rotating m=(U+V)/sqrt(2), n=(U-V)/sqrt(2).
The remaining integral is (pi sqrt(2)/4)*integral
(2-n^2)^2 dn over |n|<=min(lambda/sqrt(2),sqrt(2)).
The leading normalized finite/parallel ratio is
1-lambda^2/6+lambda^4/80 (lambda<=2),
16/(15lambda) (lambda>=2).
Parallel penetration onset p^2 crosses over to p^(5/2) at fixed
nonzero theta. The infinite-axis 1/sin(theta) divergence is absent.

Executed deterministic Python NumPy quadrature + exact convex clipping.
R=1.2 nm, D=2.3 nm, L=3 nm: parallel V=0.111526539202 nm^4;
finite V at 2,6,10,15,90 degrees:
0.109741245847, 0.096839756054, 0.075860884540,
0.052303301691, 0.013537090599 nm^4.
Independent infinite kernel at 2 degrees is 0.387887845912 nm^4.
Quadrature 80-vs-128 relative agreement <3e-5.
Long-cap comparison to infinite result relative error 1.886e-7.
At lambda=1 and p=.01, computed F=5.304717395 vs exact
5.314527572; at lambda=2, 6.683122008 vs 6.702064328.
All code assertions passed. Full executable and numerical output
preserved in the current visible calculation relay message.
Next Mercer: compare to matched-station penalty without conflating it
with set-theoretic four-volume. No physical validation asserted.
