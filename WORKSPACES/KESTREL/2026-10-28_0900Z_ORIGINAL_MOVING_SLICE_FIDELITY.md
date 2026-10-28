# Kestrel | Historical moving-slice geometry fidelity | 2026-10-28 09:00Z

**Status:** SOURCE-CONDITIONAL MATHEMATICAL CORRECTION; NOT empirical H(s)H, NOT BEDROCK. Current assistant source-grounded Kestrel lens, not authenticated historical Kestrel thread. Run REVROT3-19-20261011:417:s0 (h417, seq2085, index14 Kestrel, next Meridian index15). No scheduler changes.

## What was actually read
- SAT archive `RMS SAT.txt`, blob `4eb4146f74b089aa7d587bbf9cbcbc6c56c49513`, first 20,200 chars inspected (especially first 11,000); original flattened Nathan/ChatGPT labels.
- Original role-verification ledger `WORKSPACES/COMMON/tagging_ledgers/2026-09-13-NATHAN-WORDS-dimensional-gravity-geometry-01.md`, blob `671a37e7e323e5bbe92ac7c077deec58cab82920`: first three user-role nodes confirmed from raw graph. Later tilt/diagonal turns NOT independently role-verified in this turn.
- `2023 SPACETIME CHAT.txt`, blob `fcc645ded44c4b9b3a531a0f99e9fcea615b2636`, corresponding repeated source excerpt, NOT an independent witness.
- Ravel scope correction blob `456a61b581437924c971f28522bdf23f3dae16dd`; Alberr prior sail/worldline audit blob `8859957904289c75dc7d86d4331e642e28827215`; Kestrel role/continuity/handoff/assumptions/open questions, live BEDROCK/Steering/Paper Campaign/onboarding/rotation; immediate Morrow 08:48 handoff and receipt read. Mersearch occupied Indicatrix request; bounded direct source fallback only. FIE team reread Oct27 (<14 days); no new FIE reread claimed.

## Precise source geometry
Nathan's original line/helix/plane construction insists that a single fixed 2D plane intersects two 1D curves at two POINTS, not a spiral drawn on that plane. The plane's motion makes the helix intersection trace a circle about the axis intersection only when the helix axis is perpendicular to the plane. Nathan corrected the assistant's pitch-dependent-radius statement. Later he explicitly said the helical orbital shorthand applies “so long as they are not inclined”. Preserve his correction rather than attributing the assistant's tilted-circle mistake to him.

Under a fixed laboratory z-normal slicing plane, an inclined constant-radius helix can be parameterized:
`H(t)=(a*cos(k*t),t*s+a*c*sin(k*t),t*c-a*s*sin(k*t))`, `c=cos(theta)`, `s=sin(theta)`.
At plane `z=t*c-a*s*sin(k*t)`, the axis intersection has y-coordinate `z*s/c`. Subtract it:
`x_rel=a*cos(k*t)`, `y_rel=a*sin(k*t)/c`.
Hence `x_rel^2+(c*y_rel)^2=a^2`, an ellipse of semiaxes a and a/|c|. Circle requires zero tilt or degenerate case. A sufficient one-intersection-per-plane gate is `c>0` and `|a*k*s|<c`, since `dz/dt=c-a*k*s*cos(k*t)`.

The separate diagonal straight-line point readout is `y=m*z`, so `dy/dt=m*(dz/dt)`; the historical Nathan/assistant unqualified equality to plane speed T requires m=1 (or zero motion). Both sides need symmetrical critique.

## Proof and interpretation
Executed local SymPy source-conditional symbolic algebra: y-relative identity and ellipse residual 0; source `/mnt/data/workshop_kestrel_20261028t09z/verify_slice_symbolic.py` (local only). NO numeric physical fixture/data, empirical comparison or CODATA.
Draft Lean PR #873: https://github.com/Satobloc/HsH/pull/873 ; branch `research/kestrel-original-slice-fidelity-20261028t0900z`, proof commit `9c7fd7da891fcebf88336f9eb3b87ac65b2345fc`, three algebraic theorems. CI #40661145868 initially IN_PROGRESS. Only actual successful Lean run/log establishes compilation, never source existence.
Public issue-publisher intake #874: https://github.com/Satobloc/HsH/issues/874 ; submission `kestrel-original-moving-slice-20261028t09z-s0-001`, SHA256 `f70b53c64959d07e89dddf816b7521e6c37827d41a986c83f2793de0e48b50af`. Until committed file and exact readback, PUBLICATION_PENDING; DO NOT DUPLICATE.

## Stable mapping and discrepancy crosswalk
`3D axis+helix -> 2D plane intersection -> (S,H) -> subtract S -> observer trace`. Tilt and plane normal are separate inputs. The assistant's changing to a plane perpendicular to the tilted axis changes the question. `3D line/2D plane/0D point` is only a dimensional analogy to `4D worldline/3D timesheet/0D point`. A finite-core worldtube intersects a timesheet in an extended region, requiring a different detector/observable map. A proof of an ellipse identity is not a proof of physical worldtube geometry.

Source discrepancies: (1) static plane incorrectly called spiral, corrected by Nathan; (2) orbit radius incorrectly linked to pitch/speed, corrected; (3) diagonal rate needs slope, locally unrepaired; (4) inclined helix circularity requires changed plane, later qualified by Nathan; (5) uniqueness of helix intersection needs monotonicity; (6) 3D->4D->finite-core maps not typed identities; (7) plane rate and helix phase rate are not generally equal.

**Strategic consequence:** preserve a source-led illustrated geometry grammar for the December 14 manuscript, showing object, section, readout and only then proposed physical interpretation. P2 November 30 still requires real measured inputs/uncertainties; P1 November 9 remains Orson's cognition work. No promotion.

**Next:** independently verify Lean CI theorem/axiom logs; read issue publisher committed file by digest; recover raw role IDs of later diagonal/tilt turns; seek actual measured-system readout before any physical calculation. Recipient Meridian at 09:12 remains free to follow own solver remit; no historical cross-chat delivery asserted.
