# Quarry CXXXIX — Resolving-slab thickness as an exact 4D braid-memory gate

**Status:** SILOED SANDBOX / Morrow + Kestrel. Not canonical theory.

## Provenance actually read
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`, lines 1–1100 requested/read substantially. Retained: local particle topology embedded in a global 4D return geometry; local topology is not to be erased by the global completion. Historical Kerr/CTC/particle identifications remain source claims, not imported results.
- Current H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`, lines 1–1300 requested/read substantially. Retained: finite-core worldtubes, resolving slab `Sigma_t^(h)`, recursive geometry and the need to distinguish topology from readout/projection. Historical constants/particle labels were not used as targets.
- Supporting historical cross-pollination after the construction: `Satobloc/HSH_RESOURCES/HISTORICAL/HINTON — 4TH DIM NEW ERA.txt` and `HISTORICAL/HINTON — 4TH DIMENSION.txt`, opening 500 lines each. Used only for the lower-dimensional-section/higher-dimensional-object discipline, not theory authority.

## Construction
CXXXVIII showed that an ordinary projected braid crossing can reverse sign in unrestricted 4D by rotating its separator through the fourth direction without collision.

Use LOCAL:MK139 notation. At a projected xy crossing let the relative separator be
```
q = (Delta_z, Delta_w)
```
where `Delta_z` is the ordinary over/under separator and `Delta_w` is separation in the fourth direction. Let `D_core` be the minimum allowed centerline separation imposed by finite cores. Collision exclusion is

```
Delta_z^2 + Delta_w^2 >= D_core^2.
```

Now constrain each centerline to a resolving slab of total fourth-direction thickness `h_Sigma`. The maximum relative fourth-coordinate separation is then
```
|Delta_w| <= h_Sigma.
```

To reverse crossing sign continuously, `Delta_z` must pass through zero. At that instant finite-core exclusion requires
```
|Delta_w| >= D_core.
```

Therefore the reduced constrained configuration space has an exact gate:

```
h_Sigma < D_core  => projected crossing sign cannot reverse without contact,
h_Sigma >= D_core => a collision-free 4D bypass exists.
```

Equivalently define the LOCAL dimensionless gate
```
chi_slab := h_Sigma / D_core.
```
Then `chi_slab=1` is the local topology-changing threshold in this fixture.

This is stronger than an energetic barrier: below threshold, the admissible configuration space itself separates into + and - crossing components. Above threshold those components connect through the fourth direction.

## Optional energetic completion
If leaving the central resolving manifold also costs
```
V_conf = (K4/2) Delta_w^2,
```
then an available bypass has a minimum peak confinement cost at least `K4 D_core^2/2`. Comparing that with a contact/reconnection barrier `E_c` gives a dynamical route-selection threshold `K4 D_core^2 = 2 E_c`, but this is an added sandbox completion, not source-derived dynamics.

## Audacious completion
The timesheet/resolving-slab thickness may be exactly the missing dimensional-admissibility gate that lets H(s)H use braid memory while retaining a genuinely 4D ambient geometry. The braid would not be protected in ambient R4; it would be protected in the finite-core state space conditioned by the resolving slab.

This suggests a clean distinction:
- ambient topology: ordinary braid memory leaks in 4D;
- conditioned topology: braid sectors can become disconnected when `chi_slab<1`;
- reconnection/readout event: crossing `chi_slab=1` opens a 4D bypass channel even before literal core contact is required.

## Failure conditions
1. If H(s)H centerlines are not actually constrained by the resolving slab, this gate is the wrong state space.
2. If the relevant fourth-direction relative excursion is not bounded by `h_Sigma`, the threshold does not follow.
3. In a full multi-strand/global geometry another collision-free path may exist outside this two-coordinate local reduction; that must be searched numerically.
4. If finite-core exclusion permits interpenetration/reconnection before `D_core`, replace the hard disk by the actual interaction law.

## Next solver
Build a three-strand finite-radius `Delta^2` fixture and run constrained path optimization in full R4 while varying `chi_slab`. Test whether the minimum-action path changes homotopy class at `chi_slab=1` or whether global degrees of freedom move the threshold. Track projected braid word, minimum pair distance, normal-frame holonomy and reconnection/contact events separately.

**Carry-forward:** ordinary braid topology is not fundamental in unrestricted R4, but finite-core + finite resolving-slab thickness can restore exact crossing-sector disconnection in the constrained configuration space.
