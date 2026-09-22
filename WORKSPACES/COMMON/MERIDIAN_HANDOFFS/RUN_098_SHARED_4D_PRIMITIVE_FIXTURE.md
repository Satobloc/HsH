# RUN 098 — shared 4D primitive fixture gate

**Branch/task:** `HAGALAZ-SOLVER-UNIFICATION` + supporting `LAB-SBS-001`  
**Status:** DURABLE FIXTURE / INCORPORATION BRIDGE  
**Date:** 2026-09-22  
**Operation:** define one explicit 4D primitive fixture from which the Three-Spheres carrier control and a Hagalaz framed-state relation can be derived independently without manufacturing one solver's observables from the other  
**Quarantine:** none consulted  
**Nathan Words feed:** NOT RELEVANT — no intended-object ambiguity is resolved here; this is a deliberately declared control fixture using the already-established RUN 091 frame typing.

## 1. Source boundary

RUN 097 established `PARTIAL_INTERFACE`: the executable equilateral Three-Spheres control traverses the common envelope, but has no supplied 4D sphere-locked frame, Hagalaz step, connection, or holonomy. Its next cursor was to supply those primitives explicitly rather than infer them from carrier geometry.

RUN 091 types a Hagalaz order as `S=(c,r,F)` in `R^4`, `F in SO(4)`, with general relative state carrying arbitrary center displacement, scale, and frame rotation. The compact eight-slot step is a rung-locked specialization and must not be forced when translation is arbitrary.

## 2. Declared shared primitive fixture

Use standard orthonormal basis `(e_x,e_y,e_z,e_w)` of `R^4` and declare three equal framed spheres:

```text
R = 1

c1 = (-1/2, 0,         0, 0)
c2 = (+1/2, 0,         0, 0)
c3 = (0,    sqrt(3)/2, 0, 0)

F1 = F2 = F3 = I_4
r1 = r2 = r3 = 1

control_plane P = span(e_x,e_y)
```

The frames are **fixture inputs**. They are not reconstructed from the Three-Spheres circumcircle and therefore carry no claim that the carrier geometry uniquely determines a Hagalaz frame.

The plane `P` is also explicit. The existing Three-Spheres component is a 2D control solver, so its input is the orthogonal projection of the declared centers to `P`. Because all three centers already lie in `P`, projection changes no center coordinates.

## 3. Independent Three-Spheres derivation

Projected centers are exactly the RUN 097 regression control:

```text
(-1/2,0), (+1/2,0), (0,sqrt(3)/2), R=1.
```

Therefore the already-executed typed component returns:

```text
geometry          = CARRIER_PRESENT
numerics          = CERTIFIED
G                 = 2/3
r_c               = 1/sqrt(3)
kappa_2(K)        = 3
sigma_min(K)      = 1/2
relative_residual = 0
circumcenter_P    = (0,1/(2 sqrt(3)))
```

This remains a solver-specific carrier channel. It is not promoted into an SO(4) observable.

## 4. Independent Hagalaz framed-state derivation

The same primitive fixture directly supplies three valid framed orders:

```text
S_i = (c_i, 1, I_4).
```

For the ordered pair `S1 -> S2`, use the **general** RUN 091 relative-state channel, not the rung-locked eight-slot specialization:

```text
Delta c_12 = c2-c1 = (1,0,0,0)
mu_12      = r2/r1 = 1
Q_12       = F1^T F2 = I_4
```

Likewise,

```text
Delta c_23 = (-1/2, sqrt(3)/2, 0,0)
Delta c_31 = (-1/2,-sqrt(3)/2, 0,0)
mu_23 = mu_31 = 1
Q_23 = Q_31 = I_4.
```

The center loop closes exactly:

```text
Delta c_12 + Delta c_23 + Delta c_31 = 0.
```

The frame loop is also trivially closed:

```text
Q_12 Q_23 Q_31 = I_4.
```

This is a **zero-rotation control**, not evidence that nontrivial Hagalaz transport vanishes generally. No connection or path-ordered holonomy is supplied by this static fixture.

## 5. CommonRecord serialization

```yaml
common_record:
  primitive_state:
    ambient_dimension: 4
    equal_sphere_radius: 1.0
    control_plane_basis: [e_x, e_y]
    centers:
      - [-0.5, 0.0, 0.0, 0.0]
      - [ 0.5, 0.0, 0.0, 0.0]
      - [ 0.0, 0.8660254037844386, 0.0, 0.0]
    frames_SO4: [I4, I4, I4]

  external_solver_channels:
    three_spheres:
      input_projection: P_xy
      geometry_status: CARRIER_PRESENT
      numerical_status: CERTIFIED
      G: 0.6666666666666666
      carrier_radius: 0.5773502691896258
      circumcenter_P: [0.0, 0.2886751345948129]
      kappa2_K: 3.0
      sigma_min_K: 0.5
      relative_residual: 0.0

  hagalaz_framed_states:
    S1: {center: [-0.5,0,0,0], radius: 1.0, frame_SO4: I4}
    S2: {center: [ 0.5,0,0,0], radius: 1.0, frame_SO4: I4}
    S3: {center: [0,0.8660254037844386,0,0], radius: 1.0, frame_SO4: I4}

  hagalaz_general_relative_channels:
    S1_to_S2: {delta_c: [1,0,0,0], mu: 1.0, Q_SO4: I4}
    S2_to_S3: {delta_c: [-0.5,0.8660254037844386,0,0], mu: 1.0, Q_SO4: I4}
    S3_to_S1: {delta_c: [-0.5,-0.8660254037844386,0,0], mu: 1.0, Q_SO4: I4}
    center_loop_closure: exact
    frame_loop_closure: exact

  transport:
    connection: null
    path_ordered_holonomy: null

  interface_disposition: INCORPORATED_CONTROL
```

## 6. Result / typing consequence

The RUN 097 bridge can be crossed without false equivalence if the common primitive record owns the frames/directors explicitly.

The two solvers now consume the **same declared primitive dataset** but derive different typed channels:

- Three-Spheres consumes center geometry projected to its declared 2D control plane and returns carrier geometry + numerical certification;
- Hagalaz consumes the 4D centers, radii, and supplied SO(4) frames and returns general relative framed-state data;
- neither channel is inferred from the other's output.

This is the first genuine shared-primitive control fixture. `INCORPORATED_CONTROL` is deliberately narrower than claiming a dynamically nontrivial cross-solver incorporation: the SO(4) sector is identity and transport remains absent.

## 7. Capability / information gain

The remaining unification problem is no longer “how can Three-Spheres be given a frame?” The answer is: the shared primitive layer can supply one independently. The next discriminating test is whether both channels remain well typed under a controlled perturbation that activates frame rotation without changing the Three-Spheres center geometry.

That perturbation cleanly tests channel independence: rotate one supplied frame by a known SO(4) element while holding all centers/radii fixed. Three-Spheres carrier output should remain invariant; Hagalaz `Q` should change predictably. This is a direct interface-invariance test rather than another geometry case.

## 8. Durable boundary / next cursor

**Next cursor:** apply one declared single-plane SO(4) frame rotation to `F2` only, with centers/radii fixed. Verify analytically and/or computationally that the Three-Spheres typed carrier payload is unchanged while `Q_12` and `Q_23` acquire the expected inverse-related frame rotations. Serialize the perturbed record and classify `PASS`, `LEAKAGE`, or `CONFLICT`.

No Nathan action required.
