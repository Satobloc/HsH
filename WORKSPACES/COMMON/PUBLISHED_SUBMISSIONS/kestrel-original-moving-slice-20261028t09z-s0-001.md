# Kestrel moving-plane source-fidelity result | 2026-10-28 09:00 UTC

**Scope:** historical Nathan Direct / assistant geometry comparison, no empirical SAT/H(s)H validation. Current assistant used Kestrel's cross-boundary synthesis remit; historical Kestrel ChatGPT thread was not authenticated.

## Original source and source-status
Historical SAT archive: `RMS SAT.txt`, Git blob `4eb4146f74b089aa7d587bbf9cbcbc6c56c49513`, first ~20,200 characters inspected. Independent earlier raw-role audit of the opening three Nathan turns: HsH `WORKSPACES/COMMON/tagging_ledgers/2026-09-13-NATHAN-WORDS-dimensional-gravity-geometry-01.md`, blob `671a37e7e323e5bbe92ac7c077deec58cab82920`. Later tilted-helix turns were read in the flattened Nathan/ChatGPT-labeled source; their raw role IDs need rechecking. A second archived `2023 SPACETIME CHAT.txt` repeats part of the dialogue and is not an independent witness.

Nathan's stepwise construction: static straight line and helix intersected by a transverse plane -> two points S,H -> moving plane -> H orbits S in plane-relative coordinates. Nathan explicitly corrects the assistant twice: a fixed plane does not contain a spiral, and the orbit radius depends on helix radius, not pitch or slice speed. The assistant subsequently calls the orbit circular even when the helix axis is tilted but the plane remains laboratory-z-normal. Nathan later qualifies the vocabulary: "Helical lines form orbiting points, so long as they are not inclined". Preserve this later correction rather than imputing a permanent tilted-circle claim to Nathan.

## Exact source-conditional geometry
Let c=cos(theta), s=sin(theta), c != 0. A circular helix around tilted straight axis is

`H(t)=(a cos(k t), t s + a c sin(k t), t c - a s sin(k t))`.

Intersect with laboratory plane `Z=z`, and subtract the straight-axis intersection `S_z=(0,z tan(theta),z)`. The relative trace is

`x=a cos(k t_H)`, `y=(a/c) sin(k t_H)`, so **`x^2+(c*y)^2=a^2`**.

Thus the readout is an ellipse with semiaxes `a` and `a/|c|`, not a circle when tilted and nondegenerate. A unique intersection for every z follows, for example, when `c>0` and `|a*k*s|<c`, since `dz/dt=c-a*k*s*cos(k t)` stays positive. Without such a gate the readout may have multiple points. This is a symbolic geometrical identity, not a physical simulation.

A separate historical diagonal-line statement equates point D's in-plane speed to plane speed T. The correct readout is `dy/dt=(dy/dz)*(dz/dt)`; equality with T requires unit slope or zero slice speed. Both Nathan and the assistant accepted the unqualified rate in that bounded passage.

## Verification, limitations, and return
Executed SymPy symbolic script found ellipse residual zero and the exact derivative. Draft Lean/Mathlib PR #873 contains three conditional lemmas (ellipse, not-circle under tilt, diagonal slope); compile status must be read from actual new-head CI, not inferred from source commit. No observational data, numerical fixtures, CODATA scoring, physical H(s)H prediction or BEDROCK promotion.

Typed hierarchy: 3D line intersect 2D plane -> 0D point; proposed 4D worldline intersect 3D timesheet -> 0D point; 4D finite-core worldtube intersect timesheet -> extended region. The dimension-raising analogy and physical apparatus map remain UNPROVED and require explicit embedding/slice/readout maps.

**Next:** recover raw role-tagged diagonal/tilt turns; inspect actual Lean CI/axioms; retain this as a P3 historical geometry-grammar figure, not P2 real-data evidence. Orson Nov 9 P1, P2 Nov 30, P3 Dec 14 gates stay separate. Existing :00 task and all five phases unchanged. No cross-chat delivery claimed.
