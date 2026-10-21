> **UPDATE 2026-10-21:** The earlier candidate below was based on the OUTER radial torus-wall contact and is retained for historical provenance. The user specified the INNER radial rolling surface and an LCM-locked elbow. The canonical corrected implementation and tests are now [GRANN_INNER_WALL_ROTATIONAL_LOCK_2026-10-21.md](GRANN_INNER_WALL_ROTATIONAL_LOCK_2026-10-21.md). The inside-wall sign of rolling spin is positive; do not use the old outward-contact gearing as the default.

# GrAnn R/Q: minimum-return three-axis rotational lock

**Status:** Nathan Direct functional correction (2026-10-18), with a separately derived/tested **candidate** realization of a contact-preserving SO(3) lock. Not implemented in the live Whirligig browser instrument.

## Instruction hierarchy

Nathan clarifies that GrAnn–R/Q is fundamentally **rotational locking**:

1. Sphere rotation must pass through **all three spatial axes**.
2. The apparatus must use the **minimum simultaneous number of rotations** that brings the relevant source curve(s) and all mechanical parts back to their complete configurations.
3. The gimbal elbow's rotation count is to be **driven from that common denominator/return**, not independently prescribed by a decorative turn-rate slider.
4. Torus wall contact, sliding R and Q followers, variable crossbar and the single perpendicular projecting elbow remain required.

This supersedes treating geodesic curvature as the *primary purpose* of GrAnn, and supersedes arbitrary elbow curvature-gain modulation as the final mechanism. The earlier Darboux curvature-to-spin paper is retained as a mathematically useful alternative or consequence, NOT the new GrAnn functional definition.

**Important distinction:** The historical GrAnn self-intersection and self-tangency remain source-described geometry, but this revised *functional target* does not justify inventing or imposing a particular figure-eight material curve if the phase lock can be achieved by simpler geometry.

## Common denominator / minimum return

Normalize one torus circuit to one unit of `u`. If independently required axis and curve phase rates are reduced rationals `w_i=p_i/q_i` turns per torus circuit, then the smallest **integral number of complete torus circuits** on which every phase individually returns is

```
D = lcm(q_x, q_y, q_z, q_R, q_Q, ...).
n_i = D * p_i/q_i       integer total turns in that return.
```

Example: x=1/2, y=1/3, z=1/4, R=1, Q=1/6 turns per base circuit. Then **D=12 torus circuits** and `(n_x,n_y,n_z,n_R,n_Q)=(6,4,3,12,2)`. Checking every positive integer duration confirms no smaller positive integer than 12 returns all phases.

**Arithmetic caveat:** `D` (the least common return duration) and `lcm(n_x,n_y,n_z,n_R,n_Q)` (a possible joint gear count for the elbow) are distinct objects and must be displayed separately. Exact closure of SO(3), the two moving input contacts and the elbow-to-wall trace must be verified independently; phase integrality alone is not a mechanical closure proof. We should specify whether elbow *total turns* are D or the LCM of integer windings by the actual gear-linkage definition, rather than quietly conflating the two. Nathan's common-denominator instruction fixes **no independent elbow oscillator** in either case.

Also preserve the historic even-GrAnn-circuits requirement as an independently reported parity constraint, unless superseded by a later explicit instruction.

## Exact contact-preserving all-three-axes candidate

The earlier browser has only one GrAnn rotation phase `g psi`; its elbow rate and curvature gain are separately chosen. We can instead construct a minimal multi-axis **rotational lock** without violating the selected outer-wall rolling constraint.

Use torus major radius `R0` and equal sphere/tube radius `b=a`. Let `psi` be torus orbital angle, `e_r=(cos psi,sin psi,0)`, and `g=(R0+b)/b`. Choose an integer `N>g` that satisfies the required even-parity and R/Q closure divisibility constraints, and choose the **smallest eligible** N. Set

```
sigma = sqrt(N^2-g^2) > 0
K = (sigma, 0, -g)   ;  |K|=N
Q(psi) = Rot_z(psi) * exp_SO3(psi [K]x)
```

where `[K]x` is the cross-product generator. This is a proposed **concrete** SO(3) realization, not source-given original apparatus hardware.

Differentiating the matrix product yields physical world angular velocity per unit orbital angle:

```
omega / psi_dot = sigma cos(psi) e_x + sigma sin(psi) e_y - (R0/b) e_z.
```

All three axes participate when `sigma>0`. The x/y components are the allowed rotation about the moving outer contact normal, while the z component satisfies the selected-contact no-slip requirement. With sphere center `C=R0 e_r` and contact offset `b e_r`:

```
dC/dpsi + (omega / psi_dot) cross (b e_r) = 0.
```

The body-frame material contact locus is `G_body(psi)=Q(psi)^T e_r(psi)`. In this candidate it is a closed *small circle* on the sphere traversed N times per torus circuit. It is GrAnn's rotating contact **track**, not an asserted reconstruction of its originally described Omph/t_ipode self-intersection. The actual arc length per individual material cycle is `L=2*pi*g/N`, so N material turns carry total contact arc length `2*pi*g`, matching the no-slip contact transport.

If the source-input phase orders are positive integers `d_R,d_Q,...`, a practical candidate is

```
k=lcm(2,d_R,d_Q,...).
N=k * (floor(g/k)+1)     // smallest multiple of k STRICTLY greater than g
```

provided the axis/curve orders have been measured or specified, not guessed. The elbow must be geared to the same master N-cycle phase and validated for complete configuration closure; no autonomous `pen_turns` or arbitrarily tuned curvature multiplier is the final mechanism.

## Executed mathematical check

A NumPy/SciPy `scipy.spatial.transform.Rotation` calculation with `R0=1.65`, `b=0.55`, `g=4`, `N=6` (minimal **even** N strictly greater than four) gave:

- `sigma=sqrt(20)=4.47213595499958`.
- physical world angular-velocity components x and y each cover roughly [-4.4721,+4.4721]; the z component is -3 per unit psi.
- torus outer-contact position residual max ~9.2e-16 model units;
- selected-point analytic slip residual max ~3.3e-16;
- full SO(3) orientation-seam Frobenius residual ~1.9e-15;
- GrAnn material track completes six turns; unit-sphere contact arc length traversed 2*pi*g~25.13274, one material circuit length ~4.18879.

The limiting `N=g=4` has `sigma=0` and does **NOT** engage all three axes. N=8 works but is not minimal, so would fail the *minimality* design requirement at this default radius. The selected-contact rolling demonstration is **not** a proof of global no-slip for the nonisolated equal-radius contact locus.

**Not done:** Integrating the Q matrix and N into both R/Q sliding-intersection branch solvers, removing the old independent elbow-rate law, deriving the real gear linkage and deciding whether elbow's total-turn count is D or `lcm(n_i)`, and testing full R/Q/crossbar/elbow/torus-wall closure. Those must be completed before marking the browser apparatus corrected.

## Implementation acceptance criteria

- GrAnn drives the sphere's complete SO(3) orientation, not a visual ring or independent oscillator; all three axes show nontrivial motion and pass a numerical angular-velocity check.
- The number N is computed from admissible periodicities and minimality, not picked for aesthetic output.
- R/Q contacts found by independent geometric intersections using the common transported frame; source loops return with consistent tangents and branches.
- One variable-length crossbar and one perpendicular elbow; the elbow turn count comes from the same lock with no free decorative oscillator.
- Torus outer-pivot contact, selected-point slip and actual wall intersections satisfy verified constraints.
- SO(3) frame, R and Q contact positions/tangents, elbow orientation, and Curvy Lisa trace all return together, or the candidate is rejected.
- Distinguish source-derived specifications, chosen kinematic interventions, and unproved equation-isomorphism/derivative claims.
