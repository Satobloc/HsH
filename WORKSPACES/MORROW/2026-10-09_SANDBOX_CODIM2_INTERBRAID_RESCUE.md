# Morrow + Kestrel: codimension-two interbraid rescue
**2026-10-09 | SANDBOXED | LOCAL:MORROW-KESTREL-20261009 | not canonical**

## Primary source reads and boundaries
- SAT archive: `SAT_O REWRITE/4D_THEORIZING.txt` (~170,401 characters available; substantial direct reads from opening, 72k–85k, 124k–163k). Nathan asks what geometrically interlocks and explicitly rejects importing SU(3) by fiat. **Assistant-generated** assertions in this historical conversation that Hopf and Borromean links of 1D filaments are topologically stable in free R4 are mathematically false. Do not attribute those assistant claims to Nathan.
- SAT archive: `000 Earliest SAT_RMS/002. Discreet Space and Dark Matter.txt` (full ~19,663 characters read; independent historical intake, not a premise of this construction).
- HsH September 30 dump: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` (full), `2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md` (full), `2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` (full).
- HsH: `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md` (full).
- Front door, current Common controls, Reference Desk, War Room declaration and HSH_RESOURCES toolkit/tool/preference routing reviewed. `PRIOR_ART` not opened. No corpus-wide search; direct known-path retrieval only.

## Exact mathematical result
Alexander duality for a compact locally contractible K in S4 gives `H~_1(S4\K) = H~^2(K)`. For a closed S2 defect this is Z; for ordinary B2 and B3 carriers it vanishes.

A Hopf link of two 1D circles in x4=0 **unlinks in R4 without contact**. Let
`C1(t)=(cos t,sin t,0,0)`, `C2(t;c,w)=(c+cos t,0,sin t,w)`.
The exact minimum separation for c>=1 is `sqrt((c-2)^2+w^2)`.
The homotopy `(c,w):(1,0)->(1,1)->(3,1)->(3,0)` unlinks the circles with **minimum clearance 1**.

Conditional rescue: take a closed 2D defect
`D={x1^2+x2^2+x3^2=R^2,x4=0}`,
defined by two length-valued physical-constraint candidates
`F1=(x1^2+x2^2+x3^2-R^2)/(2R)`, `F2=x4`.
A closed loop avoiding D has integer winding
`W=(1/2pi) integral_C (F1 dF2-F2 dF1)/(F1^2+F2^2)`.
For `R=1,r=1.2,C_delta(t)=(r+delta+r cos t,0,0,r sin t)`,
computed W=+1 for `0<=delta<1`, W=0 for `delta>1`, and W is undefined at the defect crossing `delta=1`. Numerical minimum gap at delta 0.95 is 0.05, at 0.999 is 0.001, at 1 is zero.

## Crucial failure / admissibility test
The W=1 loop passes through the **interior** of the B3 bounded by D. Thus it is valid for a standalone permeable S2 phase/constraint defect but **invalid if S2 is merely the boundary of a filled impenetrable B3 core**. An open B2 disk has an edge and does not supply the same H1 obstruction. A closed, materially instantiated codim-2 defect is additional structure, not automatic theory import.

## HsH translation and next cursor
Packet 002 already separates B3 bulk, S2 boundary, B2 rank-two support and finite slab, and Run 133 exposes a leading local readout degeneracy. Add a topological winding/clearance discriminator only **if** two actual relational contact constraints define a closed codimension-two zero set. Next solver: calculate F1,F2 from real finite-core/interface geometry, compare S2-only, B3-filled, B2-open and closed-defect fixtures under SO(4), thickness and reconnection; verify W integer and invariant without contact. Reject the mechanism if no physically defined closed defect exists or W changes without a zero/contact event after mesh convergence.

**Not derived:** SU(3), baryon/meson classification, triplet-only stability, binding energy, confinement, or empirical physics. This is a precise conditional completion of an old question, not a validation of old assistant topology claims.

**Calculation artifacts in task thread:** `morrow_kestrel_codim2_link_20261009.py`, `morrow_kestrel_codim2_checkpoint_20261009.md`, and three Class-P plots.