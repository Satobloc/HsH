# Meridian MK145 | Transverse harmonic number controls finite-core reach
2026-10-14 22Z | s1 | SANDBOXED Euclidean 4D geometry; not a physical claim.

## Exact family and equations
Let ell=1 m, H=sqrt(3)ell/2, T=3pi H/2, theta(u)=pi(3u²-2u³), and
c_(A,n)(u)=(A sin(2pi n u), H cos(theta), H sin(theta), T u), 0<=u<=1, n integer>=1.
All geometric lengths are metres; u is dimensionless.

For a<b, delta=b-a, Delta=theta(b)-theta(a), the chord/tangent product is
[c(b)-c(a)]·c'(a) = T² delta + H² theta'(a) sin(Delta)
 + 2pi n A²[sin(2pi n b)-sin(2pi n a)]cos(2pi n a).
The first two terms are nonnegative. The last is >= -(2pi n)² A² delta.
Therefore A<T/(2pi n)=0.649519052838329/n m rigorously excludes all doubly normal chords. This is a sufficient, not sharp, bound.

For symmetric a=1/2-x,b=1/2+x, both normality equations coincide:
A²(x,n)=[2T²x+H²theta'(1/2-x)sin(theta(1/2+x)-theta(1/2-x))]/[-2pi n sin(4pi n x)].
Minimize separately over all intervals where denominator>0. This does not exclude asymmetric double normals.

With v=c', a=c'', curvature is kappa=sqrt[(v·v)(a·a)-(v·a)²]/|v|³.
At transverse sine extrema u_j=(j+1/2)/(2n), transverse velocity vanishes, and
kappa(A,u_j)²=kappa(0,u_j)²+(2pi n)^4 A²/|c'_0(u_j)|^4.
Thus the minimum over j of
|c'_0(u_j)|²/(2pi n)² sqrt[(2/ell)²-kappa(0,u_j)²]
is an exact analytic upper bound on the first local focal-radius crossing A_local where max_u kappa=2/ell.

## Deterministic numerical results (A in metres)
n | A_safe | A_local | A_ext upper | A_sym double
1 | .649519 | 1.263350 | 1.278918 | 1.425301
2 | .324760 | .235704 | .239936 | .855930
3 | .216506 | .094605 | .095607 | .613856
4 | .162380 | .050766 | .051062 | .473810
5 | .129904 | .031650 | .031756 | .384317
6 | .108253 | .021623 | .021668 | .322717
7 | .092788 | .015714 | .015734 | .277902
8 | .081190 | .011938 | .011949 | .243902

For n>=2, local curvature reaches 2/ell inside the rigorously certified no-double-normal range; n=1 does not have that global guarantee. The ell/2 cross-center cap remains a separate assumed geometric constraint.

For A=c/n² and n→infinity, transverse velocity tends to zero but transverse acceleration remains finite. Candidate limiting threshold:
c*=min_u |c'_0(u)|²/(4pi²) sqrt[4/ell²-kappa_0(u)²].
Numerical minimization places its minimum at endpoints, giving c*=0.735482538952187 m; n²A_local is 0.764038 at n=8 and 0.740100 at n=32. Endpoint global optimality has not been proved.

## Reproduction and controls
Local executed script: meridian_mk145_multitone_reach_gate.py; JSON and Class P figure saved alongside. Uses NumPy/SciPy/Matplotlib; deterministic scalar root and branch searches. Checks: symmetric normality residuals <1e-9, analytic curvature upper bounds, first-root neighborhoods, n-independent zero-amplitude curvature, inert n=0 control, independent finite-difference tangents. Numerical maximization is not interval-certified. No observational or constitutive validity is inferred.

Mercer handoff: test whether a source-motivated bending/tension energy selects a harmonic cutoff rather than treating a geometric reach limit as a force law.
