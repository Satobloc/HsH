# RUN 097 — Three-Spheres → common ᚼ interface incorporation

**Branch/task:** `HAGALAZ-SOLVER-UNIFICATION` + supporting `LAB-SBS-001`  
**Status:** DURABLE INTERFACE RESULT / PARTIAL_INTERFACE  
**Date:** 2026-09-21  
**Operation:** run one real typed Three-Spheres carrier output through the current common ᚼ/interlingua state without forcing nonhomologous fields  
**Quarantine:** none consulted  
**Nathan Words feed:** NOT RELEVANT — this pass preserves already-established typing and does not resolve intended-object semantics.

## 1. Inputs actually traversed

Use the executable/regression-tested Three-Spheres control from `WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER/three_spheres_carrier.py`:

```text
c1 = (-1/2, 0)
c2 = (+1/2, 0)
c3 = (0, sqrt(3)/2)
R  = 1
```

The committed solver's regression contract gives the typed output:

```text
geometry          = CARRIER_PRESENT
numerics          = CERTIFIED
G                 = 2/3
r_c               = 1/sqrt(3)
kappa_2(K)        = 3
sigma_min(K)      = 1/2
relative_residual = 0
circumcenter      = (0, 1/(2 sqrt(3)))
```

The exact `G=2/3` value is asserted by the committed regression. The remaining values follow directly from the same 2x2 Gram system for this equilateral control.

## 2. Current common-state boundary

RUN 091's current ᚼ interlingua represents one helical/framed order by

```text
S_n = (c_n, r_n, F_n)
```

and a rung-locked finite step by

```text
U = (mu, xi, Q),   Q in SO(4),
```

with the general relative state allowing arbitrary `Delta c`, scale, and frame rotation. RUN 081 already established that Three-Spheres carrier admissibility is **not** presently a source-grounded homologous ᚼ residual and must enter as an external typed constraint channel.

Therefore this incorporation must not manufacture `F_n`, `Q`, `mu`, `xi`, transport, holonomy, or a ᚼ admissibility scalar from a carrier reconstruction that does not contain them.

## 3. Incorporation record

The real Three-Spheres output traverses the common interface safely as:

```yaml
common_record:
  primitive_geometry:
    centers:
      - [-0.5, 0.0]
      - [ 0.5, 0.0]
      - [ 0.0, 0.8660254037844386]
    equal_sphere_radius: 1.0
    ambient_dimension: 2   # control embedding; not promoted to a 4D framed state

  external_solver_channels:
    three_spheres:
      carrier:
        geometry_status: CARRIER_PRESENT
        numerical_status: CERTIFIED
        G: 0.6666666666666666
        carrier_radius: 0.5773502691896258
        circumcenter: [0.0, 0.2886751345948129]
        certification:
          kappa2_K: 3.0
          sigma_min_K: 0.5
          relative_residual: 0.0
        event_history: null

  hagalaz_framed_state:
    center: null
    radius: null
    frame_SO4: null

  hagalaz_step:
    mu: null
    xi: null
    Q_SO4: null

  transport:
    connection: null
    holonomy: null

  interface_disposition: PARTIAL_INTERFACE
```

`event_history` remains null because this is a pointwise `CARRIER_PRESENT` control, not a certified collapse crossing. That preserves RUN 085's rule that collapse status requires certified bracket/event history.

## 4. What this demonstrates

This is the first concrete external-solver incorporation test of the current ᚼ common-state architecture.

It succeeds at the **typed envelope** level:

- shared primitive geometry can be carried without renaming it as Hagalaz;
- Three-Spheres geometry and numerical certification remain separate;
- solver-specific carrier fields survive intact;
- unavailable/nonhomologous ᚼ frame/step/transport fields remain explicitly missing rather than receiving synthetic defaults.

It does **not** yet succeed as a full common framed-state traversal because the Three-Spheres carrier component alone does not provide a 4D sphere-locked frame or a relative similarity/transport operator.

Accordingly the required disposition is:

```text
PARTIAL_INTERFACE
```

not `INCORPORATED` and not `CONFLICT`.

## 5. Interface consequence

The common record needs a first-class solver-specific extension namespace, conceptually:

```text
CommonRecord = {
    primitive_state,
    framed_state?,
    relative_step?,
    transport?,
    external_solver_channels: { solver_id: typed_payload }
}
```

Optional common fields are semantically meaningful absences. They must not be auto-filled merely to make records look structurally uniform.

This is consistent with the project-highest-priority unification rule: **unify the carrier/envelope and comparison machinery; do not force equivalence of observables.**

## 6. Capability / information gain

The unification programme has now crossed from an interface sketch to one actual external typed payload. The main missing bridge is sharply localized: a common primitive 4D dataset carrying frames/directors is required before Three-Spheres and ᚼ can share the framed-state / SO(4) channels rather than only coexist in the typed envelope.

## 7. Durable boundary / next cursor

**Next cursor:** define one shared primitive 4D fixture containing centers **and** explicit orthonormal frames/directors; derive the Three-Spheres carrier channel and the ᚼ relative framed-state channel independently from that same fixture, then serialize both into the `CommonRecord` envelope above. Do not infer a Three-Spheres frame from carrier geometry unless the fixture explicitly supplies one.

This is the shortest route from `PARTIAL_INTERFACE` toward a genuine `INCORPORATED` cross-solver traversal.

No Nathan action required.
