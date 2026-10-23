# CODE 000 / Gate 011 — Null screen versus a finite-core material worldtube

**Status: SANDBOXED rigorous Minkowski algebra and executed numeric fixture. NOT Factory-Floor cleared and NOT an H(s)H construction candidate.**

## Sources and scope
Checked current BEDROCK.md (2026-10-23 correction-first), live Mersearch slot (still Orson-owned, not overwritten), Ravel's `WORKSPACES/RAVEL/CODE/ravel_helix_tube_reach_gate_20261013.py`, Meridian's `WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_020_FINITE_TUBE_TENSION_GAUGE_GATE_2026-10-11.md`, and quarantined `WORKSPACES/WORLDTUBE_LAB/KERR_CORE_BASELINE.md`. Prior calculation 010 used conditional guided null paths. This correction must distinguish a null propagating **excitation** from a physical **worldtube core**. Earlier round normal 3-ball calculations are appropriate to non-null Euclidean R4 centerlines or appropriate timelike Lorentzian centerlines, **not null centerlines**.

## Exact calculation
Let Minkowski coordinates (ct,x,y,z) with metric diag(-1,+1,+1,+1). For a unit-speed spatial path X(s), the null tangent is k=(1,X'(s)). Then g(k,k)=−1+|X'|²=0. Choose ell=(1,-X')/2 and spacelike e1=(0,E1), e2=(0,E2), with E1,E2 orthonormal and perpendicular to X'. The null frame has Gram matrix:
```
[ 0 -1  0  0]
[-1  0  0  0]
[ 0  0  1  0]
[ 0  0  0  1]
```
The orthogonal complement k-perp is span{k,e1,e2}, with restricted Gram diag(0,1,1), **rank 2**. There is NO positive-definite 3D normal vector space or canonical round B³ transverse to a null line in Minkowski 3+1. The natural spacelike *screen quotient* k-perp/span{k} is 2D. A round screen disk B² can be drawn, but assigning it physical radius/energy/guidance requires established physical structure; a choice of screen is observer/auxiliary-null dependent.

For a timelike physical centerline U, by contrast U-perp has a 3D positive-definite metric, so Fermi-Walker round B³ transverse cores can be defined locally, subject to local acceleration/finite reach. This is compatible with Meridian 020's qualified Lorentzian calculation, not a contradiction.

## Executed fixture
For illustrative spatial curve radius R=.16 length-units, N=6 and intrinsic spatial length L=10, angular rate b=2πN/L, axial fraction v=sqrt(1−(Rb)²).
X(s)=(R cos(bs), R sin(bs),v s).
Local Python execution 2026-10-23 computed:
- vL=7.976007167488266 length-units;
- curvature κ=R b²=2.2739568540109882 inverse length-units;
- local curvature radius 1/κ=.4397620817809799 length-units;
- max screen orthogonality error 1.6653345369377348e−16;
- null frame Gram entries equal analytic matrix to displayed precision.
Real plotted finite-radius worldtube is *not* shown: figure only shows spacelike screen disks for a null **excitation path** and a separate straight null path. Figure: `/mnt/data/code000_gate011_null_screen.png` and `.svg`, created in this turn.

## Crucial cross-sector reconstruction consequences
- Geometry/time: preserving the assertion ds/dt=c does NOT give a canonical material B³ worldtube cross-section. Distinguish local speed of excitation from the timelike/non-null worldtube centerline.
- GR: null rays in flat Minkowski require guidance to follow curved paths; no artificial Kerr/gravity/medium law added.
- SAT finite core: Ravel's R4 Euclidean reach test and Meridian 020's timelike Fermi tube cannot be directly pasted onto a null centerline. Null B² screen is only the transverse optical construction.
- EM/modes: coupling between coiled worldtube and guided propagation remains uncomputed. Photon/neutrino alternatives retained, none selected.
- QCD, spin, flavor, Kerr/ER, cosmological expansion: no promotion, no new observables.
- Volume claims: a hypothetical round B³ cross-section of a null beam would be ill-typed; do not compare 4-volume/mass proxies without a non-null worldtube carrier.

## Next gate
Recover physical **non-null** centerline parameterization and effective metric from current H(s)H equations; construct Fermi transported B³ cross sections along that carrier; separately solve permitted guided-null excitations on/along it using established Maxwell/medium or other archived equations. Compute whether surface and optical paths close together, and check reach and interference. Then map both through the same time-sheet/Cruller projection.

**Prove/Play:** exact null-frame algebra and independent numerical check, plus visualization. **Lean:** not run. **Factory Floor:** not submitted. **Physical candidacy:** no. **Mersearch:** occupied by Orson, no new run.
