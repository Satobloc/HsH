> **Functional correction, 2026-10-18 (Nathan Direct):** GrAnn's intended primary role is the minimum common rotational lock: the sphere cycles through all three axes, source R/Q phase returns are synchronized, and elbow rotation count is derived from the common denominator. The curvature-to-spin construction below is a valid **alternative contact mechanism experiment**, not the GrAnn design specification. See [GRANN_ROTATIONAL_LOCK_2026-10-18.md](GRANN_ROTATIONAL_LOCK_2026-10-18.md) and [grann_rotational_lock.py](grann_rotational_lock.py). Do not implement the older independent curvature-gain elbow oscillator as if it were canonical.

# GrAnn as a curvature-to-spin connection: functional reconstruction

**Status:** SANDBOXED derivation and executed NumPy/SciPy numerical tests, not a full reconstruction of historical GrAnn, and not published to the live website. **Date:** 2026-10-18.

Sources: Nathan's FINDING THE DONUT pp. 23–27; the R/Q Whirligig Python solver and README; the 2026-10-09 Whirligig continuity handoff. The mechanism proposed below is a new inference from those source constraints, not a claim that its equations were explicitly specified in the source.

## Historical functional target

Two input curves R and Q must generate a RELATIONAL output, not a decorative direct superposition. GrAnn is constrained at the outer torus wall, with a special anchor at i_r, an antipodal tangency and an even material-circuit return. The independently sliding R/Q contacts define a varying bar, W_obble and its normal plane W_iggle, whose ONE elbow/ray writes Curvy Lisa on the torus. The archival output Q-with-respect-to-R was called a derivative, but no derivative operator was formally specified.

## Recovered missing degree of freedom

Let torus major radius R0, equal torus tube and sphere radius b=a, and torus orbital angle psi. Fix a selected outer-wall point P=(R0+b)e_r and C=R0 e_r. Rolling at that point demands:

    C_dot + omega cross (b e_r) = 0.

The equation cannot constrain spin around the contact normal e_r because e_r cross e_r=0. Thus a rolling ratio alone does NOT determine the sphere's full orientation.

**Functional interpretation:** GrAnn should be a material cam/contact curve G(s) on the sphere which determines this missing spin via its geodesic curvature, and transfers a path-dependent frame into the R/Q intersection selector and the gimbal elbow.

Take G(s)=g(s) as a unit-sphere curve parameterized by ACTUAL spherical arc length s. Set t=dg/ds, h=g cross t, signed kappa_g=(dt/ds).h, B(s)=[g,t,h], W(psi)=[e_r,e_phi,e_z], and Q=W B^T.

Modeling intervention: align the material contact tangent with the torus track tangent so Qg=e_r, Qt=e_phi and Qh=e_z. This is the simplest candidate for the historical, underdetermined cam-bearing contact rule.

The spherical Darboux frame obeys:

    dg/ds=t;
    dt/ds=-g+kappa_g h;
    dh/ds=-kappa_g t.

This gives the sphere's exact world angular velocity:

    omega=(psi_dot-s_dot)e_z - kappa_g(s)*s_dot*e_r.

Substituting into the nominated no-slip constraint yields:

    ds/dpsi = (R0+b)/b.

Thus the missing component is NOT an arbitrary dial:

    omega.e_r = -kappa_g(s)*s_dot.

The **geodesic curvature of GrAnn determines the contact-normal spin**. For a great-circle surrogate, kappa_g=0, so this channel is erased. The prior website reconstruction fixed the sphere center through its outer-wall pivot but algebraically reproduced the same world path; it did not implement this missing cam-curvature transfer.

This is a nominated-point contact law. For the original b=a condition, the full torus-tube/sphere contact locus is nonisolated, and globally no-slip rolling has NOT been established.

## Even winding is length-dependent

Let L_G be the actual length of one GrAnn material cycle on the UNIT sphere. In one torus orbit the cam advances by 2*pi*(R0+b)/b of dimensionless spherical arc length. The number of completed GrAnn circuits is therefore

    m_G=2*pi*(R0+b)/(b*L_G).

The historical even-multiple condition m_G=2k fixes a resonance:

    R0=b*(m_G*L_G/(2*pi)-1).

The current browser test that the radius-based gear (R0+b)/b is even is justified only for the great-circle reference L_G=2*pi. A noncircular GrAnn generally requires a different major radius to preserve even material winding.

## Executed numerical proof of concept

Use a smooth, closed, NON-self-intersecting cam as a null/coupling fixture, not the historical completed GrAnn:

    beta(theta)=A*sin(2 theta)
    G_A(theta)=(cos(beta)cos(theta),cos(beta)sin(theta),sin(beta)).

Numerically integrate its true arc length, periodically invert s(theta), form the right-handed frame Q=W B^T, then check pivot position, torus implicit surface, SO(3) closure, analytic selected-point velocity residual and independently finite-differenced velocity.

For b=0.55 and m_G=4 even GrAnn circuits per torus orbit:

| A | GrAnn length L_G | Needed torus major R0 | Contact-normal spin range per psi |
|---|---:|---:|---:|
| 0 (great-circle control) | 6.28318531 | 1.65000000 | 0 |
| 0.08 | 6.31318954 | 1.66050571 | about ±0.97214 |
| 0.22 | 6.50299701 | 1.72696506 | about ±2.89939 |

All nominated-contact/torus position residuals are of order 1e-15 or smaller. The A=0.22 SO(3) orientation closes to roughly 1.2e-15 in matrix norm after four GrAnn cycles. When the initial frames are aligned, its evolving orientation differs from the great-circle baseline by as much as 0.829 rad during the orbit, returning at the seam. This is real rotational transfer rather than the drawing of a differently shaped orbit.

Independent finite-difference contact-slip residual convergence for A=0.22:

    600 samples  -> 1.62e-3
    1200         -> 4.06e-4
    2400         -> 1.02e-4
    4800         -> 2.54e-5

The approximately fourfold reduction on doubling resolution independently supports the analytic selected-contact no-slip equation. The great-circle control has zero contact-normal spin. An important numerical correction during testing was to periodically WRAP arc-length inversion instead of extrapolating a one-period inverse beyond its domain.

Negative control: retaining old R0=1.65 for A=0.22 produces about 3.86479 GrAnn material circuits per torus orbit, NOT four. Its SO(3) seam mismatch is about 1.289 in Frobenius norm, i.e. a real failure of winding closure, not rounding noise.

## Correcting the historical anchor criterion

An earlier browser diagnostic compared the WHOLE moving R follower against the great-circle plane and labeled the maximum discrepancy an Omph failure. That was the wrong requirement: the source says GrAnn_Omph meets the DISTINGUISHED R-SIDE ANCHOR i_r, not every follower position along R. The correct test chooses that specific R anchor and compares it with the material track's specific self-intersection branch point and tangents. A maximum distance over the complete moving follower is not an Omph residual.

## Minimal implementation path

A. Material cam. Support closed regular immersed G(s), exact arc-length inversion and wrap, g/t/h/kappa_g, and contact transport Q=W B^T. Retain great circle as the zero-curvature control. Test selected-contact position/velocity, SO(3) orthogonality/determinant and orientation/tangent closure, and reject nonresonant windings without changing inputs silently.

B. Coupled source intersection. Current browser chooses a body sweep meridian with sweep=g1*psi, independent of GrAnn material frame. Instead derive its plane from the transported cam frame. Example candidate plane normal: n_Pi(s)=cos(alpha(s))*t(s)+sin(alpha(s))*h(s), where alpha follows specified gimbal constraints rather than a visual tuning gain. Solve n_Pi.R(u_R)=0 and n_Pi.Q(u_Q)=0 with branch continuation; report roots lost or ambiguous. This transmits GrAnn geometry into actual follower locations, not just an optical orientation.

C. Single elbow. For the resulting world crossbar d, project the transported cam tangent and R/Q source tangents with H=I-dd^T into the normal plane. Derive the ONE elbow's angle from a stated minimal-turn or tangent-match principle with continuous transport and residual checks. Remove arbitrary ad hoc curvature gain once the transported frame supplies the angle. Its first forward ray/torus-wall intersection is Curvy Lisa.

D. Historical topology. Solve a constrained spline/immersion problem for GrAnn self-intersection at a chosen i_r, antipodal self-tangency, tangent/branch continuation and even material winding. Compare three ablations: great-circle null, bent simple closed cam, and anchored self-intersecting cam. If only the last transmits the desired crossover/holonomy invariants, keep the historical topology as essential. Avoid constructing an arbitrary decorative figure eight.

E. Meaning of derivative. Curvy Lisa is a witness of an implicitly constrained two-input operator. A trace alone is not a derivative dQ/dR. Specify source and target charts, calculate the derivative/linearization of the constraint map and test reconstruction, path independence, tangent invariants, and negative controls before asserting a derived correspondence across GR, gauge and QM solution spaces.

### Current status

The derivation, example contact cam, winding resonance and numerical tests above are complete. The archived self-intersecting GrAnn, full coupling of cam transport into input followers and actual differential operator remain research work, and the main Sites browser instrument is not yet rewritten with this new functional mechanism.
