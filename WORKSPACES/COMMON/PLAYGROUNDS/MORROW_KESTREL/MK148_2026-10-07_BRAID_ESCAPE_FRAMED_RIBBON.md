# MK148 — Morrow/Kestrel: braid escape vs framed-ribbon integer (2026-10-07)

**SANDBOXED; not canonical physics or H(s)H.** New independent calculation. No fitted constants, particle assignments, or quarantined material.

## Source ledger: exactly what was read
- **Original curated SAT archive (primary):** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`, lines 1–520 requested/read. Historical nested 4D superhelices and braid coupling; another section states `Q=L_wind+L_link+W_writhe` is an integer topological charge. That assertion is not assumed correct.
- **Original archive, direct originator testimony:** `The radical insight of SAT.txt`, blob `b2b188690f636a98af0b9ed8a213e743d8e0416e`, lines 1–145. Nathan-direct opening: the leap beyond a 4D plot is the *possibility* of physical cross-temporal filament connectivity/force transfer; other mechanisms negotiable. Model-generated exposition follows and is not originator authority.
- **Current HsH:** `🔑/O_EFF_IS_THE_REPRESENTATIONAL_DEFAULT.md`, blob `b1f6fdca422208874c1401106e64b68ef56c7968`, lines 1–200 (complete). Minimal rope/tube picture, twist until more distinctions are needed, real instantiation.
- **Current HsH, NLM deep read:** `DEVELOPMENT_FULL_CONVOS/4Oct2026/[🗄️] SAT RIGOR__NotebookLM_export.txt`, blob `6c1893699ddba8031acda6cc27b1adb4c2c93997`, lines 1–230 and 450–1000. Nathan-direct message indices 69,73,75,77 require minimality and standard-physics covariant mapping before importing mechanisms. Both speakers labeled `role:user` by exporter; attribution requires message content/adjacency.
- `🔑/🔑.md` opening/key topical index also read. Original archive BigBook indexes, HSH_RESOURCES Tool Chest/War Room/Toolkit source index/Einstein-Minkowski routing, directory metadata and preference router reviewed as navigation, not theory authority. Mersearch stable 1.0 worker guidance read; exact indexed files were used, no corpus-wide search required. No PRIOR_ART/private quarantine accessed.

## Result A: finite-core worldline braids can unwind in 3+1 dimensions

For two labeled particle centers at a common time, let `q=x1-x2` and `|q|=d>2a` for core radius `a`. Planar relative configurations have `π1(R²\\{0})=Z`; ordinary 3D relative configurations have `π1(R³\\{0})=0`. Indistinguishable exchanges in 3D retain only permutation parity `Z2`.

Explicit **based** nullhomotopy, local variables `s,u∈[0,1]`:
```
v(s,u) = ((1-u)*cos(2*pi*s)+u,
          (1-u)*sin(2*pi*s),
          sin(pi*u)*sin(pi*s)**2)
q(s,u) = d*v(s,u)/norm(v(s,u))
```
At `u=0`, `q` makes one planar turn; at `u=1`, `q=(d,0,0)`; at `s=0,1`, the basepoint remains `(d,0,0)` for all `u`. The only simultaneous zero of the first two components is `s=u=1/2`, where the third equals 1, so `v` never vanishes. All paths keep separation exactly `d`: no contact or reconnection. Numerically on 2001×801 mesh: min `|v|=0.83328465`, max normalized separation error ~1e-15. XY projected winding changes 1→0 across `u=0.5`, where projection crosses origin but full 3D separation stays finite. This is *topological permission*, not a dynamical prediction.

## Result B: a genuinely closed framed spatial ribbon has an integer

For a **closed curve in 3D** with a nonvanishing ribbon frame, standard Călugăreanu–White–Fuller relation: `Lk=Tw+Wr`, with integer self-link `Lk` and generally real, noninteger twist and writhe.

Test curve (2,3) torus knot:
```
C(t) = ((2+r*cos(3*t))*cos(2*t),
        (2+r*cos(3*t))*sin(2*t), r*sin(3*t))
n(t) = (cos(3*t)*cos(2*t), cos(3*t)*sin(2*t), sin(3*t))
C_offset(t) = C(t) + 0.12*n(t)
```
At `r=0.8`, N=1200 periodic quadrature points: Gauss `Lk=-6.0000000004`; `Tw=-2.6629378807`; `Wr=-3.3370606200`; `Tw+Wr=-5.9999985007` (residual ~1.5e-6). Changing minor radius 0.25→1.0 changes `Wr` from ~-3.030 to ~-3.518 while `Lk` remains -6. Thus historical `Q=L_wind+L_link+W_writhe` cannot generally be asserted integer: writhe alone is not integer, and the *compensating framed twist* must be accounted for.

## H(s)H completion candidate and attack

**New sandbox conjecture:** an integer interbraid sector, if one exists, may live in **physically closed, framed spatial loops/flux ribbons within the instantiated 3D structure**, not in free causal centerline worldlines. Smooth non-intersecting deformation exchanges twist with writhe while preserving self-link; reconnection can change link sector. Finite core supplies a possible physical framing, not automatically a closed curve.

**Type failure condition:** a causal worldline `X(t)=(t,x(t))` is a graph over time. A helix that returns to the same spatial location *at a later time* is not a simultaneously closed spatial ribbon. A worldtube intersecting a time surface in a 3-ball supplies no closed curve automatically. Without an actual closed material/flux ribbon or another physically justified constraint, the integer `Lk` cannot be imported as a particle label. A 4D worldline's rank-3 normal frame also does not automatically supply one scalar twist angle.

**Next solver:** (1) two finite cores with 2D confinement on/off, replay explicit noncontact unwinding and log clearance; (2) independently model a closed framed spatial filament, deform continuously, log `(Lk,Tw,Wr)` and trigger one controlled reconnection. Require a separately justified standard-physics action for energetic costs. If no closed ribbon is found in source geometry, keep this as a useful conditional result, not a SAT mechanism. No B, particle masses, or historical numerical anchors used.

**External machinery:** standard configuration-space homotopy and Călugăreanu–White–Fuller framed-ribbon identity; primary-literature page anchors not yet recovered, so no source-verified bibliography is claimed. HSH_RESOURCES remains reference/navigation, not theory authority.

**Morrow / Kestrel**
