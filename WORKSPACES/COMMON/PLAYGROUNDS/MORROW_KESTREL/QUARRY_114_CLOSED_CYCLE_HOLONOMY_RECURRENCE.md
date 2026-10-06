# QUARRY 114 — CLOSED-CYCLE HOLONOMY RECURRENCE

**Status:** SILOED PLAYGROUND / LOCAL:CXIV / not canonical theory
**Role:** Morrow/GitKeeper with Kestrel topology brief

## Provenance actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HYPERFOAM THEORY/SAT4DHHUC.txt`, blob `2e1e163771dda9bd1132290ce758ef6d80a6d0fb`, complete 922-line file requested/read. Historical content used here: SAT's attempt to identify microscopic vibrational winding and macroscopic orbital winding as one structural class, plus the demand that integrated 4D history matter.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`, blob `f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4`, lines 1–1800 requested/read substantially. Current construction used here: path closure is distinct from embedded ordered frame history; SO(4)/normal-frame ordered exponentials are live solver machinery.
- Front-door/control/reference routing reread first. HSH_RESOURCES remained support/reference infrastructure; PRIOR_ART not imported.

## Independent construction
LOCAL:CXIV. Repeat a geometrically closed four-leg normal-frame commutator cycle
[
U_c=e^{aJ_x}e^{aJ_y}e^{-aJ_x}e^{-aJ_y}.
]
Every scalar channel total is zero per cycle, but (U_c\neq I) when the generators do not commute. After (N) closed cycles,
[
U_N=U_c^N.
]
For small (a), the single-cycle residual angle obeys
[
\theta_c\simeq a^2.
]
Hence repeated closed cycles accumulate an ordered phase approximately (N a^2) until compact-group recurrence folds the principal return angle back toward zero.

Numerical fixture at (a=0.2):
- (	heta_c=0.039867504378) rad.
- (N=78): return angle (3.109665341487) rad.
- (N=157): return angle (0.023987119827) rad.
- (N=158): return angle (0.015880384552) rad.

Thus a trajectory can close spatially on every orbit while its frame-history state walks around a compact holonomy cycle and later nearly recurs.

## Sandbox conjecture
This supplies a concrete alternative to monotonic “history-dependent force” ideas in old SAT. A long-bound resident can accumulate ordered frame history even when each orbital cycle returns to the same visible geometry. The memory is bounded/compact rather than secular: (U_N=U_c^N). Open first-pass trajectories do not possess the same repeated-cycle state variable.

If a physical readout couples to the conjugacy class of (U_N), apparent interaction/readout history could oscillate or recur rather than grow indefinitely.

## Failure conditions
- If the transverse/material frame is gauge, (U_N) is unobservable.
- If actual H(s)H dynamics constrain the cycle to commuting rotations, (U_c=I).
- If cycle-to-cycle geometry changes enough that the same (U_c) is not repeated, the simple power law (U_N=U_c^N) fails and a full ordered product is required.
- Spatial closure alone is not evidence of physical holonomy.

## Tight solver test
Construct a closed hyperhelical/orbital carrier whose visible geometry repeats each cycle. Blindly propagate the full frame operator for many cycles and compare:
1. scalar integrated angles,
2. endpoint centerline closure,
3. ordered frame return (U_N),
4. any existing finite-core/readout observable.

A decisive positive result requires an observable to track (U_N) while scalar totals and visible geometry remain unchanged. A decisive negative result is that all physical/readout channels are invariant under the accumulated holonomy.

## Next cursor
Replace the constant-cycle fixture with a slowly precessing hyperhelix so (U_{c,k}) varies by cycle, then test whether Magnus/ordered-product corrections produce robust recurrence bands or destroy them.
