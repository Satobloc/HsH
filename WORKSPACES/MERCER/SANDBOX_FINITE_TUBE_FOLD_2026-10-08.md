# SANDBOX | Mercer finite-worldtube optical-kink intersection | 2026-10-08

**Status:** independent sandbox construction, not canonical SAT/H(s)H, not a physics prediction. **Scope:** finite-radius continuation of Mercer's optical-kink laboratory reconstruction. **Symbol namespace:** LOCAL:MERCER:FINITE-TUBE-FOLD; all letters locally defined. No historical constant used as a target.

## Actual primary sources read this run
- Original SAT archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SAT_optics_finding.txt` (full retrieved text; read lab initialization, Phase 3 simulation feedback and optical/index discussion). Historical user packet states kink `theta_4(x)=(2pi/3)(1+tanh(mu*x))/2`, index modulation `Delta n=eta sin²(theta_4)`, and reports ~0.125 rad; this is *reported historical lab output*, not independently established physics.
- Original SAT archive: `SAT Mark V/SAT_Phase_Shift_Note.txt` (complete 2160-character LaTeX note). Different arctan profile and ~0.239-rad claim; its un-subtracted infinite-domain `sin²(theta)` integral is divergent. Do not merge these calculations without rederivation.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt` (full 14884-character generated synthesis). It describes filament tangent, time normal, theta-four misalignment, and 3D intersections. Generated synthesis is *not* Nathan-direct authority.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Mathematical Core.txt` (full 7199-character conversation extract). User-provided Mark IV.2 packet explicitly lists the ~0.125-rad optical laboratory target; assistant mathematical claims remain assistant claims.
- Current framing: `HsH/🔑/🔑.md` (relevant overview and O_eff / dynamic-block corrections). Do not convert this static local geometry exercise into a claim that the physical block is static.

Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, reference desk, 3-repo/symbol/citation/solver/workflow controls reviewed; October 5 resource routing familiarization via HSH_RESOURCES `HQ/THE_WAR_ROOM/DECLARATION.txt`, `indexes/ai_source_index/HSH_TOOLKIT.md`, `HQ/TOOL_CHEST.md`, `info/TOOLKIT_DIGESTION.md`, `!_HSH_RESOURCES_INDEX.md`, `info/NATHAN_PREFERENCES/BOOT.md`, and overview of linked resource families. No PRIOR_ART content accessed. Exact-path primary source reads, **not** a corpus-wide search; stable Mersearch remains the default for broad archive queries.

## Independent construction (conditional mapping)
Use dimensionless arclength `s/w`; promote the *historical optical scalar profile* to a hypothetical **oriented centerline tangent** (an additional assumption, not implied by the lab):

`theta(s) = (pi/3)(1+tanh(s/w))`;
`T(s)=(sin(theta),0,0,cos(theta))` in Euclidean R4; `u=e4`.
Integrate `X'(s)=sin(theta)`, `H'(s)=cos(theta)`. Set `H(s*)=0`.
The centerline time-direction fold occurs at `theta(s*)=pi/2`:
`s*/w=atanh(1/2)=0.549306144334`,
`kappa*=theta'(s*)=pi/(4w)`, `H''(s*)=-kappa*`.

Define an actual **4D radius-a tube** with perpendicular 3-ball cross-section:
`P(s,q,y,z)=gamma(s)+q(cos(theta),0,0,-sin(theta))+y e2+z e3`,
`q²+y²+z²<=a²`.
Intersect with the time surface `H=-d`. Its 3D cross-section is the union of disks
`q(s)=[H(s)+d]/sin(theta(s))`,
`x(s)=X(s)+q(s)cos(theta(s))`,
`y²+z²<=a²-q(s)²` wherever `|q(s)|<=a`.

**Geometric result:** for sufficiently small radius `a` (embedded tube), the intersection near the fold is one connected 3D body when `d<a`, pinches at `d=a`, and consists of two separated components when `d>a`. Thus finite radius delays the topology transition by precisely the local tube radius; it is **not** at the centerline fold `d=0`.

At the inner boundary, `H_min(s)=H(s)-a sin(theta(s))`, `X_min(s)=X(s)+a cos(theta(s))`.
With `xi=s-s*` and `a*kappa*<1`:
`H_min=-a-[kappa*(1-a*kappa*)/2]xi²+O(xi³)`,
`X_min=(1-a*kappa*)xi+O(xi²)`.
Therefore the **gap between 3D intersection components** obeys
`G(d,a)=2 sqrt(2(d-a)(1-a*kappa*)/kappa*) + O((d-a)^(3/2))`
as `d->a+`, assuming smooth nondegenerate fold and no distant tube overlaps.
Exponent 1/2 is universal to this local fold class; the prefactor is geometry/radius dependent.

## Scripted acceptance checks
Exact parametric root-solving against the 4D tube geometry (not a sketch):
```
a/w    (d-a)/w   numerical gap/w   local formula/w   ratio
0.10   0.001      0.09688515       0.09688094        1.00004
0.20   0.001      0.09266519       0.09266022        1.00005
0.40   0.001      0.08358721       0.08358179        1.00006
0.20   0.010      0.29317560       0.29301734        1.00054
```
Two roots of the allowed-region boundary for `d/a=0.75`; four for `d/a=1.25`. Script asserts both and verifies relative asymptotic error <0.1% at `(d-a)/w=.001` for three radius regimes. Local tube regularity needs `a*kappa<1`; conservative global check for this kink `a/w<3/pi`, plus self-separation verification.

**Class P artifacts / reproducibility:** `mercer_finite_tube_fold_20261008.py`, `mercer_finite_tube_intersections.png`, `mercer_finite_tube_gap_scaling.png` are attached to the Mercer Free Build conversation; no claim of repository presence for these files.

## Discriminator and failure conditions
1. **Critical mapping ambiguity:** the optical lab only constrains `sin²(theta)`. It does not determine the sign of `cos(theta)` or whether `theta` is a centerline tangent angle at all. Thus the optical phase **does not predict a fold** without an independent oriented-tangent identification. A no-fold constitutive model can share the optical index response. Compare these explicitly.
2. **Timelike-worldline obstruction:** if the standard induced Lorentz metric `g=delta-2u⊗u` is imposed with `u=e4`, `g(T,T)=1-2cos²(theta)`. The kink becomes null at 45 degrees, spacelike beyond 45 degrees and reaches `g(T,T)=+1` at the 90-degree fold. This construction cannot be a globally future-directed **timelike particle worldline**. It could still describe a nonmaterial/spacelike carrier or a director field. This is a sharp geometric compatibility test, not grounds to discard the optical source.
3. If `a*kappa*>=1`, the normal-tube map becomes singular and the fold formula fails; nonlocal self-overlap also invalidates simple component counting.
4. A physical mechanism must specify why the medium/time normal responds to these intersections and what observable measures component separation. Nothing in this geometry establishes an experimental particle splitting or a new universal phase constant.

## Next controlled test
Implement both (A) oriented tangent with fold and (B) non-fold optical director sharing `sin²(theta)`; calculate an orientation-sensitive observable from a *specified* constitutive law. Separately replace constant `u=e4` with a smooth bent time normal and compute intersection topology/causal character in the induced metric. Preserve the historical optical phase data only as provenance, not a fitted target.
