# Meridian | Two-bundle finite-core pair-energy repair
2026-10-15 | SANDBOXED mathematical result, not established SAT or nuclear physics.

## Minimal system and exact expansion

Choose one positive-definite spatial section of a proposed four-dimensional finite-core worldtube representation. This is a mathematical toy, not a Lorentz-covariant interaction or a physical nuclear-force assumption. There is no external spherical or lattice carrier.

Take two bundles of three points:
x_i = X + u_i; y_j = Y + v_j;
sum_i u_i = sum_j v_j = 0; d = Y-X.

For any smooth translation-invariant pair potential F on R^n:
E9 = sum_(i,j) F(d+v_j-u_i);
E0 = 9F(d); D = E9-E0.

Set w_ij=v_j-u_i and H=Hessian[F](d). Taylor expansion gives, term by term:

(1) Constant sum: 9F(d).

(2) Linear sum: grad F(d) dot sum_ij w_ij
    = grad F(d) dot (3 sum_j v_j - 3 sum_i u_i) = 0.

(3) Quadratic sum: (1/2) sum_ij w_ij^T H w_ij.
    The mixed terms vanish because both offset sums are zero.
    Each squared offset appears exactly three times.

Therefore the exact second-order decomposition, with remainder, is

D = (3/2)[sum_i u_i^T H u_i + sum_j v_j^T H v_j] + R3.

If each segment d to d+w_ij lies in a domain where the third derivative obeys
|D^3F(z)[h,h,h]| <= M3 |h|^3, Taylor's theorem gives

|R3| <= (M3/6) sum_ij |v_j-u_i|^3.

For F(z)=k|z|^2/2, H=kI and R3=0, reproducing the older EXACT variance identity:
D=(3k/2)[sum_i |u_i|^2 + sum_j |v_j|^2].
Its nonnegative sign is due to selecting a convex harmonic kernel, not a universal property of coarse-graining.

## Numerical, explicitly unfitted counterexample

Work in one spatial coordinate (embedded within the chosen section).
X=0; Y=2; u=(-0.2,0,0.2); v=(-0.1,0,0.1).
Use F_s(z)=-exp(-z*z/(2*s*s)); all energies are arbitrary units.
The offset-squared sums are 0.08+0.02=0.10.
F_s''(2)=exp(-2/(s*s)) * (1/(s*s)-4/(s**4)).
The second-order defect is D2=0.15*F_s''(2).

s=1: E9=-1.27835699384; E0=-1.21801754913;
     D=-0.0603394447089; D2=-0.0609008774565.
s=2: E9=-5.45871372274; E0=-5.45877593741;
     D=+0.0000622146742666; D2=0.
s=3: E9=-7.19922672572; E0=-7.20663662625;
     D=+0.00740990052845; D2=+0.00741423521219.
s=4: E9=-7.93627150842; E0=-7.94247212326;
     D=+0.00620061484332; D2=+0.00620505634630.

Thus the Hessian term reverses sign when the interaction range crosses separation 2. At s=2, second-order curvature vanishes but the EXACT defect does not: higher-order terms still contribute. No constants were fitted to a nuclear target.

## Complete reproducible Python 3 script (stdlib)

    from math import exp
    A = (-.2, 0., .2)
    B = (-.1, 0., .1)
    d = 2.
    def evaluate(s):
        def F(z):
            return -exp(-z*z/(2*s*s))
        fine = sum(F(d+v-u) for u in A for v in B)
        coarse = 9*F(d)
        H = exp(-d*d/(2*s*s))*(1/(s*s)-d*d/(s**4))
        D2 = 1.5*H*(sum(u*u for u in A)+sum(v*v for v in B))
        return fine,coarse,fine-coarse,D2,fine-coarse-D2
    for s in (1.,2.,3.,4.):
        print(s, ' '.join(f'{q:.12g}' for q in evaluate(s)))
    assert sum(A)==sum(B)==0.
    assert evaluate(1.)[2]<0 and evaluate(3.)[2]>0
    assert abs(evaluate(2.)[3])<1e-14

## Scientific boundary and next test

This proves that a coarse-graining defect in a specified pairwise interaction depends on the interaction Hessian and the internal second moments, not on a fixed universal sign. It does NOT prove nuclear binding, fermionic exclusion, Kerr/ER core mechanics, Hagalaz dynamics, or emergence of general relativity. Minkowski intervals are indefinite; Euclidean positive variance cannot be transplanted into spacetime without additional structure. Nuclear binding requires comparing relaxed assembled versus dissociated energy minima and independent constitutive laws.

Next: derive a timesheet-native covariant/contact kernel, conservation law, and finite-core constraints, then test the same two-bundle Hessian identity before any three-bundle claim.

Meridian
