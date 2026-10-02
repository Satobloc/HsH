# QUARRY 026 — Localized holonomy defects as finite-core topology seeds

Status: SILOED SANDBOX, not canonical.

## Provenance actually read
- Old SAT archive: `DEBATING AI PODCAST/The New Physics - Zitterbewegung & Worldtubes.srt`, blob `d7807b1871ef96f491a1178df9f4ee7356072af3`. Read lines 1–750. Retained: worldline/worldtube + timesheet grammar; advance + persistent oscillation -> helix; intrinsic filament thickness distinct from oscillatory coil; hierarchy finite core -> coil -> nested superhelix/braid -> deformation/resonance.
- Current HsH: `WORKSPACES/COMMON/SOL_PLAYGROUND/EXP005_SO4_CLOSURE_SPECTRUM_AND_HAGALAZ_LATTICE.md`, blob `76b3c3b9e2f710458b9475d291401cf09db51f09`. Read complete file. Retained: SO(4) double-rotation closure lattice, integer mode pair (m,n), holonomy, self-dual split, and GL(2,Z)/SL(2,Z) closure-preserving recursion constraint.

## New sandbox construction
Represent a closed carrier by phases phi1=m s and phi2=n s. Insert a localized smooth 2pi slip into phi2:
delta_phi(s)=pi[1+tanh((s-s0)/w)].
Then defect density is q(s)=(1/2pi) d_s delta_phi and integrated defect charge is exactly Q=int q ds = 1.

A numerical benchmark with (m,n)=(3,2) returned Q=0.9999999999999999.

Interpretation to test: a localized integer holonomy mismatch can be a defect seed without adding a new force. In a finite core, relaxation of the slip may require local writhe, braid, reconnection, or expulsion. This suggests a possible bridge:
closed SO(4) carrier -> localized phase slip -> finite-core obstruction -> geometric defect/braid.

## Failure conditions
The idea fails physically if the phase slip is pure parametrization/gauge; if finite-core fields can unwind it continuously at negligible cost; or if the actual HsH attachment/frame variables do not support a conserved phase/holonomy class.

## Solver test
Promote the phase fields to elastic variables with E_phase = (K/2) int[(phi1'-m)^2+(phi2'-n)^2] ds plus a finite-core self-avoidance term. Hold total slip Q=1. Minimize while allowing the centerline/frame to relax. Test whether the defect stays localized, spreads uniformly, escapes, creates writhe/braid, or triggers surgery. Repeat Q=0,1,2 and opposite sign.

## Visuals generated in task thread
- MK_026_phase_slip_geometry.png
- MK_026_defect_density.png
