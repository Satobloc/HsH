# Loom S0 | 4D ring projection versus 3D intersection
**Run:** REVROT3-19-20261014:08:s0. **Status:** SANDBOXED mathematics; no physical prediction or historical authorship promotion.

## Exact derivation
Let U=[u,v] be a 4×2 orthonormal frame in Euclidean R4. The circle is X(phi)=R U(cos(phi),sin(phi)). Let H={x:n·x=d}, |n|=1, P=I-nn^T, and let a finite slab be |n·x-d|<=a. The slab is a phase-accessibility proxy, not a 4D tube's exact intersection volume.

(PU)^T(PU)=I_2-(U^T n)(U^T n)^T. Thus projected singular values are exactly 1 and sqrt(1-||U^Tn||²). Define sin(theta)=||U^Tn||, 0<=theta<=pi/2. The projected ellipse has semiaxes R and R cos(theta), area pi R² cos(theta). At theta=pi/2 its projection becomes a line, not two points.

The signed hyperplane distance is a sinusoid with amplitude A=R||U^Tn||=R sin(theta). With uniformly sampled phase, exact slab fraction is
f(d,a,A)=[asin(clip((d+a)/A))-asin(clip((d-a)/A))]/pi for A>0,
where clip(x)=max(-1,min(1,x)); at A=0, f=1 if |d|<=a, otherwise 0.
For d=0, f=1 if A<=a, else (2/pi)asin(a/A). At a=0 and theta>0, the exact H intersection comprises two isolated ring points (measure-zero phase), while the projected ellipse/line persists.

For 0<a<R, the *geometric* full-to-partial clipping onset is theta_c=asin(a/R). As delta=theta-theta_c approaches 0 from above:
1-f=(2/pi)sqrt(2 cot(theta_c)) sqrt(delta)+O(delta^(3/2)).
This cusp does not establish any physical transition. For a/R=0.1, theta_c=0.100167421162 rad, coefficient 2.83990570036 rad^(-1/2).

At d=0 with partial clipping, ellipse aspect b=cos(theta) and phase fraction f jointly recover a/R=sqrt(1-b²) sin(pi f/2). The aspect alone does not determine f; offset d adds further degeneracy.

## Numerical fixtures (R=1,a=0.1,d=0)
|theta rad|minor/major|phase fraction|
|--:|--:|--:|
|0|1|1|
|0.100167421162|0.994987437|1|
|0.2387|0.971646167|0.278004387|
|0.246|0.969894284|0.269384639|
|pi/4|0.707106781|0.090334471|
|pi/2|0|0.063768561|

At theta=0.246, shifting d from 0 to 0.22R leaves ellipse aspect 0.969894284 but changes f from 0.269384639 to 0.335988113. Tuning a/R=sin(0.2387) trivially makes theta_c=0.2387: this is a parameter-fit negative control, **not** a derivation of SAT's historical angle.

## Executable verification
Local reproducible script: loom_20261014_4d_intersection_geometry.py; JSON: loom_20261014_4d_intersection_results.json; Class-P figures: loom_20261014_projection_vs_intersection_classP.png and loom_20261014_clipped_arcs_classP.png; full local derivation: loom_20261014_4d_intersection_derivation.md. They were executed and created in this run's conversation container, **not** uploaded to GitHub by this note.

40 seeded random SO(4) fixtures with 1,000,003 phase samples each passed; maximum sampled-vs-exact duty error 8.16e-7, SO(4) invariance discrepancy 1.33e-15, scale-invariance discrepancy 1.11e-16. Inverse core-ratio and offset negative controls passed.

## Semantic distinctions for tagging
PROJECTED_ELLIPSE is not HYPERPLANE_INTERSECTION; FINITE_SLAB_ACCESSIBILITY is not a measured particle coupling or full finite-core worldtube cross-section. Historical photoneutrino ancestry remains in WORKSPACES/LOOM/RUNS/2026-10-12_PHOTONEUTRINO_PROVENANCE_CHAIN.md; do not promote secondary material to Nathan-direct. Suggested Aster check: require each compressed claim to preserve its operation type (projection, intersection, slab accessibility) and parameter provenance; otherwise an apparently identical 'two points/line' record silently changes meaning.
