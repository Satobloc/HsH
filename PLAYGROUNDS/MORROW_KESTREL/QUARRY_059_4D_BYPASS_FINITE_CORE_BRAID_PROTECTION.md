# Quarry LIX — 4D bypass criterion for finite-core braid protection

Status: SANDBOXED / Morrow–Kestrel playground

## Provenance actually read
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`, lines requested/read 1–900. Relevant construction: local particle topology retained inside a larger globally returning 4D worldtube/CTC congruence; twist/writhe can trade under deformation and reconnection changes admissible linking class.
- Current H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`, blob `d66ae2d1a8fca09ad9b813df6a33dfbda2c7dd2f`, lines requested/read 1–1000. Relevant current architecture: finite-core corrections, topology-change benchmarks, typed solver interfaces, exact finite-core/tangency solver and explicit demand that topology changes be distinguished from projection/conditioning artifacts.

## Independent construction
Local apparent crossing:
```
X1(s)=(s,0,0,+h)
X2(t)=(0,t,0,-h)
```
Then
```
D^2(s,t)=s^2+t^2+4h^2
d_min=2|h|.
```
For equal finite-core tube radii rho, disjointness requires centerline distance >=2rho, hence a crossing-changing 4D bypass exists iff
```
|h| >= rho.
```
If dynamics confine the fourth coordinate to |w|<=H, a local 3D braid crossing is protected against this bypass only if
```
H < rho.
```
Define the dimensionless protection parameter chi4=H/rho. chi4<1 gives a finite-core obstruction; chi4>=1 opens a 4D bypass channel.

## Inference
A braid drawn in a 3D readout is not automatically a topological invariant of the 4D carrier. Effective braid protection can instead be a confinement-plus-core phenomenon. This gives a concrete mechanism by which 3D braid sectors can be long-lived inside a 4D theory without pretending ordinary 3D knot invariants survive unrestricted codimension.

## Audacious completion
H(s)H particle “topology” may be metastable configuration-space topology: finite core deletes a collision tube from configuration space, while timesheet/shell dynamics limit transverse fourth-direction excursion. Crossing order becomes dynamically protected when chi4<1 and can change when chi4 crosses unity. Reconnection can therefore be a gate-opening event rather than literal centerline intersection.

## Failure condition
If the actual H(s)H dynamics allow H>=rho generically at negligible energy, ordinary 3D braid labels cannot be fundamental conserved sectors. Conversely, if no physical fourth-direction coordinate corresponds to this local bypass, the fixture is the wrong reduction.

## Tight next solver
Derive H from the actual shell/timesheet potential rather than inserting it. Compute the minimum-action path between opposite projected crossing orders in full 4D finite-core configuration space. Measure barrier DeltaE(chi4). Candidate discriminator: the bypass barrier should collapse at chi4=1 in the hard-wall fixture, with the exact threshold shifting calculably for soft cores.
