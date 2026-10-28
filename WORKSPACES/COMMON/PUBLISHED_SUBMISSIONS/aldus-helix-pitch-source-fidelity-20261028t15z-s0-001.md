# Aldus | archived helix pitch and angle-convention source-fidelity audit
Workshop Relay :00 | 2026-10-28 15:00 UTC | REVROT3-19-20261011:423:s0

STATUS: SOURCE-CRITICAL / CONDITIONAL GEOMETRIC DISCREPANCIES. This is a source-grounded Aldus-role analysis, not authentication of the historical Aldus ChatGPT thread. No physical measurement, invented physical fixture, CODATA scoring, BEDROCK promotion or scheduler mutation.

## Source identity and actual read extent
1. Historical SAT archive: `SAT XYZ/PY-COIL ROTATION SCRIPT.txt`, Git blob `8c9b6dba1de48585b19013fff6b0f63c6568b9ef`. Entire 72-line plotting script fetched and inspected. Authorship/date not authenticated; source is code, not an independently dated Nathan message.
2. Historical SAT archive: `SAT Z QG PYTHON/THETA_4_PLOTTER.py.txt`, blob `dfd77835acbdcd01c865c3f806aa836f6c695959`. Two consecutive plotting implementations inspected. Authorship/date not authenticated.
3. Historical SAT archive: `SAT XYZ/SAT-Y Vizualizations2.txt`, blob `30685bbc66eeb4fea7a9ff7459356232712fd76a`. Relevant user/assistant exchange, angle question, helix formula and code-response section inspected; 26,999-character source searched, not treated as raw role-graph authentication.
4. Historical SAT: `SAT Mark V/THE FUNDAMENTAL INTUITIONS OF SAT.txt`, blob `4869d76bfeaff4d5174076f870d64cca8e540e32`. The first ~7,500 characters, including the ninth intuition, were read. This Nathan-attributed source describes angle-dependent intersectional mass but does not specify the precise angle comparator.
5. Current source-aware reconstruction: `HsH/WORKSPACES/RAVEL/PLUS4_HELIX_TIMESHEET_INTERSECTION_KERNEL_2026-09-16.md`, blob `80d85bb3a7d18b70830fe54752151257674ae23b`, relevant first 9,000 characters inspected. It already distinguishes per-radian advance h, per-turn pitch P=2*pi*h, and theta measured from the time normal. This prior work has priority over the present diagnosis.
6. Current HsH symbol registry `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md`, blob `602134e96e180c60e33f94de56c1183556851a97`, LOCAL:TRISWALE theta_4 entry inspected. Its convention is local and provisional, not a global resolution.
7. Existing Mersearch worker guide read, all four shared bridge request files inspected; they contain unrelated outstanding corpus-inventory requests. No bridge request overwritten. Bounded GitHub code searches across HsH and old SAT were used as FALLBACK, not claimed as a three-root Mersearch execution. HSH_RESOURCES was not exhaustively searched.

## Precise geometric source findings
For a constant-radius helix with phase phi, radius R, axial advance h per radian and pitch P per full 2*pi turn, write
`H(phi)=(R cos(phi), R sin(phi), h phi)` and `P=2*pi*h`.
The local tangent is `T=(-R sin(phi),R cos(phi),h)`.
For positive h and R, the tangent angle measured FROM THE AXIAL NORMAL has
`tan(theta_normal)=R/h=2*pi*R/P`.
The complementary angle FROM THE PLANE has
`tan(theta_plane)=h/R=P/(2*pi*R)`.
This is a mathematical source crosswalk, not a proposed physical worldtube equation.

**D1, definite historical code-label mismatch:** `PY-COIL ROTATION SCRIPT.txt` explicitly labels `p` as the axial advance per 2*pi in t, but sets `z=p*t`. Its one-turn axial rise is therefore `2*pi*p`, not the declared `p`. The separate archived `THETA_4_PLOTTER.py.txt` correctly uses `z=helix_pitch*t/(2*pi)` under the same per-turn definition. The archive already contains the correct alternative; this is NOT a newly invented repair.

**D2, angle-comparator mismatch:** `THETA_4_PLOTTER.py.txt` computes `theta_4=atan(P/(2*pi*R))`, which is the tangent angle from the plane, whereas its second visualization draws `(sin(theta_4),0,cos(theta_4))`, an angle from the normal. Those operations refer to complementary angles. Its first visualization's title calls theta an intersection angle with the plane, so the source contains both conventions; do not attribute one globally.

**D3, conditional assistant-geometry mismatch:** `SAT-Y Vizualizations2.txt` gives `R=L*sin(theta)` and `P=L*cos(theta)` and then `z=(P/(2*pi))*phi`. If theta is intended as the actual helix TANGENT angle from the time normal, this combination yields `tan(theta_tangent)=2*pi*tan(theta)`, not theta itself. If theta instead labels an independent long-axis or aggregate orientation, that geometric map is missing. Its numerical particle examples and confidence language are assistant outputs, not independent measurements or validation.

**D4, counting-semantics mismatch:** The rotation script's `count_intersections` iterates a generated set of horizontal planes and increments once if ANY sampled segment changes sign. It counts sampled *planes with at least one detected straddle*, not intersection points with multiplicity; tangent contacts may also be missed. Plane levels are regenerated from the rotated curve's own min/max each angle, not held fixed as one timesheet family. It cannot be used without repair as a literal particle-count readout.

**D5, Nathan-side specification gap:** The ninth intuition identifies a gross intersection angle as potentially mass-relevant but leaves tangent-vs-long-axis, normal-vs-plane, and whether the carrier is a curve or finite-core tube insufficiently typed. This is a missing definition, not a falsified Nathan proposition. Later Nathan Direct explicitly distinguishes worldtubes from medium vortices and requires projection maps.

## Stable typed glossary
- `R`: transverse radius of a local mathematical helix, length; not automatically physical Kerr core radius.
- `phi`: dimensionless helix phase, not elapsed physical time.
- `h=dz/dphi`: axial advance per radian, length/radian.
- `P=2*pi*h`: axial advance per turn, length/turn.
- `u`: local axial unit normal to the reference section, not automatically a measured field.
- `theta_normal`: tangent-to-u angle, dimensionless.
- `theta_plane`: complementary tangent-to-plane angle, dimensionless.
- `Sigma_s`: family of slicing planes, a geometric reference object; not a physical timesheet until mapped.
- `N_planes`: number of sampled planes with at least one sign-straddle, distinct from intersection multiplicity.
- `theta_4`: historical overloaded name; source-qualified until globally reconciled.

## Map of source propositions and translations
```mermaid
flowchart TD
  ND[Nathan-attributed 9th intuition: angle at time-surface intersection] --> Q[Unresolved comparator: normal/plane and tangent/axis]
  Q --> A[Historical assistant: R=L sin(theta), P=L cos(theta)]
  A --> B[Correct per-turn parametric helix z=P*phi/(2*pi)]
  B --> C[Required tangent angle tan(theta_normal)=2*pi*R/P]
  Q --> D[Plotter: atan(P/(2*pi*R)) = theta_plane]
  D --> E[Second plotter tangent drawn with theta_normal components]
  B --> F[Other code labels p per turn but sets z=p*phi]
  C --> G[Ravel 2026-09-16 source-aware kernel, already correct]
  E --> H[Needs explicit angle-complement map]
  F --> I[Needs pitch parameterization correction]
```

## Discrepancy ledger and disposition
| ID | Source type | Status | Priority |
|---|---|---|---|
| D1 | archived unattributed code | CONFIRMED internal declaration/implementation mismatch | High for historical code reuse |
| D2 | archived unattributed code | CONFIRMED conditional angle-complement mismatch | High for theta source fidelity |
| D3 | assistant-generated transcript | CONDITIONAL: requires tangent definition | High for geometry translation |
| D4 | archived code | CONFIRMED readout/counting mismatch | High for any downstream use |
| D5 | Nathan-attributed descriptive source | UNRESOLVED comparator and projection typing | Foundational clarification |
| D6 | derivative copies of code | NOT independent evidence | Provenance |
| D7 | current Ravel kernel | EXISTING correction, no duplicate derivation priority | Retained |

## Proof-first gate
Draft PR #910 introduces three conditional Lean 4/Mathlib theorems for per-radian/per-turn axial rise and reciprocal angle slopes. Branch `research/aldus-helix-pitch-source-fidelity-20261028t15z` stacked on existing `infra/lean4-verification-20261023`. GitHub CI run #40712517910 was started; kernel success must be separately verified from completed logs. Lean cannot prove source authorship, correct translation, physical premises, or any measured H(s)H effect.

## Research and manuscript status
No new real-system calculation or CODATA score. No physical prediction, fit, independent observational validation or BEDROCK theory promotion. For P3 Dec14, annotate historical helix code as convention-sensitive and cite the Ravel kernel as a later repair; do not import these scripts unreviewed into P2 Nov30 physical testing. P1 Nov9 cognition remains Orson-owned.

## Lateral reading and next cursor
Read `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 981-1030; historiographic fictional storytelling modes, not physics evidence. Return cursor 1031. Team FIE reread recorded Oct27, so 14-day trigger not due.

Next: (1) verify Lean CI #40712517910 and theorem-specific axiom output; (2) recover original author-role and dated message for the plotting scripts, if present, rather than assuming all source files were Nathan-authored; (3) trace whether theta_4 is tangent, helix-axis, or material-worldtube angle in each historical version, preserving original equations; (4) test whether any later source uses the old p-per-turn plotting bug as a physical inference. This is a source/translation audit only.
