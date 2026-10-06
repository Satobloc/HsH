# Meridian Free Build: Normal-bundle Hagalaz lift and scale invariants

Date: 2026-10-05
Worker: Meridian
Status: SILOED SANDBOX; not canonical theory; not a physical claim.

## Source intake actually read

OLD ARCHIVE: Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/THE SPHERES.txt, lines 1-900.
Extracted construction: nested/intersecting spheres; intersection circles as rotational carriers; deformation/wobble as driver; superhelical nesting; particle-path transport around a carrier; pressure/deformation changing carrier/frame; and the demand to solve under what conditions the geometry generates a curve.

CURRENT HsH / SEP-30 DUMP: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D_THEORIZING.txt, lines 1-800.
Extracted construction: compare genuinely 4D alternatives before trusting 3D projections; distinguish straight, helical, and vibrating filament constructions; type local tangent/intersection geometry; use executable toy models.

POST-CONSTRUCTION CROSS-CHECK: WORKSPACES/MERIDIAN/HAGALAZ_FRAMED_HYPERSPHERE_NOTE_2026-09-20.md and HAGALAZ_REPRESENTATION_TEST_2026-09-20.md. These already type sphere-to-sphere relations by displacement, scale ratio, and relative SO(4) frame rotation. The construction below instead supplies a candidate curve-making operator inside/along that relation.

## Independent construction

Take a regular arc-length base curve gamma(s) in R4 with unit tangent T. Choose two orthonormal directions Eu, Ev from a transported 3D normal frame. Define a sandbox Hagalaz lift, namespaced HAG:LIFT:

    H[r,phi;u,v](gamma)(s) = gamma(s) + r(s)[cos(phi(s)) Eu(s) + sin(phi(s)) Ev(s)].

This does not assert that every historical use of ᚼ meant this operator.

Interpretation: gamma is the lower-order carrier; r is next-order coil radius; phi is winding phase; (Eu,Ev) selects a normal-plane channel. Recursion H2(H1(gamma0)) gives a superhelix. Thus ᚼᚼ can be tested as recursion of one typed lift with new radius/phase/channel data at each order.

## Exact local derivative in a parallel/Bishop-type normal frame

For a transported normal frame Ei' = -kappa_i T and constant r, define

    K_phi = kappa_u cos(phi) + kappa_v sin(phi)
    q = r phi'.

Then

    Gamma' = (1 - r K_phi) T + q[-sin(phi) Eu + cos(phi) Ev]

and exactly

    |Gamma'|^2 = (1 - r K_phi)^2 + q^2.

One term is carrier bending sampled in the active normal direction; the other is new-order winding. For a straight carrier K_phi=0, so |Gamma'|=sqrt(1+q^2). For a circular carrier of radius R, with the winding plane containing its principal normal, K_phi=(1/R)cos(phi).

Direct finite-difference check with R=3, r=0.4 and 5 windings: maximum speed-formula error about 2.97e-7 away from endpoints; numerical and analytic mean speeds agree at about 1.202989.

## Scale result

Under uniform Euclidean dilation D_lambda: x -> lambda x, with corresponding winding count preserved:

    r -> lambda r
    kappa_i -> kappa_i/lambda
    phi' -> phi'/lambda.

Therefore the dimensionless combinations

    a = r K_phi
    q = r phi'

are scale invariants. Spot checks at lambda = 0.3, 1, 4, 10 preserved r/R = 0.133333 and r phi' = 0.666667.

### Consequence

Pure scaling cannot create a new superhelical morphology. A similarity map can resize/rotate/translate an existing morphology, but new-order winding is carried by phi and normal-plane channel choice. A viable Hagalaz grammar should therefore separate:

1. similarity state: translation + SO(4) frame rotation + scale;
2. recursive-lift state: normal-plane channel + winding phase + coil radius.

This is a discriminator against formulations that accidentally make scale change do the work of a new coiling order.

## Relation to existing framed-sphere representation

The existing Meridian tuple (Delta c, sigma, Q) is a clean external relation between framed spheres. HAG:LIFT can occupy the still-open internal/plumbing sector: Q relates ambient frames, sigma rescales lengths, while (r,phi,Pi_uv) generates the next-order curve.

Candidate combined sandbox state:

    H_state = (Delta c, sigma, Q ; r, phi, Pi_uv)

where Pi_uv is a typed oriented normal 2-plane.

## Failure conditions

1. Local immersion failure: Gamma'=0 only if q=0 and r K_phi=1 simultaneously. Nonzero winding protects local immersion but not global embedding.
2. Tube/focal failure: large r*kappa approaches the carrier curvature radius and can fold offset geometry through its focal set.
3. Frame failure: Frenet frames can become singular at curvature degeneracy; use a parallel/Bishop-type or explicitly regular material frame.
4. Global collision: local regularity does not prevent nonadjacent parameter values from colliding; numerical self-distance check required.
5. Physical failure: recursive geometry alone does not establish particle physics. A constitutive/dynamical law must select r, phi, Pi and connect readouts to data.

## Solver test / discriminator

Implement HAG:LIFT on arbitrary R4 carriers and test:

1. reparameterization stability after arc-length normalization;
2. scale covariance: D_lambda H[r,phi](gamma) must match H[lambda r,phi](D_lambda gamma);
3. SO(4) covariance under common rotation of curve and frame;
4. recursive order: compare H2(H1(gamma)) against any claimed one-step equivalent using a(s), q(s), curvature spectra, self-distance and projections.

Tight mathematical prediction: any correctly implemented canonical rotation-expansion solver that preserves morphology under uniform scaling must preserve r K_phi and r phi'. Drift under pure scale means the implementation is changing morphology, not merely scale.

## Next cursor

Build a Class-P R4 normal-bundle lift solver with a parallel-transported frame, then feed it a straight carrier, circular carrier, one Three-Spheres intersection circle, and one existing Hagalaz solver curve. Compare a(s), q(s), curvature invariants, self-distance and projection behavior before and after one and two ᚼ lifts.