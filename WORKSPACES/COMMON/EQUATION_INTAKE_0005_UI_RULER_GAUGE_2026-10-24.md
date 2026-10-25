# Intake 0005 — UI as ruler, gauge-freedom gate (24 October 2026)

Status: mathematical diagnostic, not physics validation, and not an addition to BEDROCK. Nathan's 24OCT26 announcement is already separately preserved at WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-24_PRIOR_ART_UI_ARCHIVE_READING_ANNOUNCEMENT.md (read, blob 7fea3b2c4af54b526364f756643cd690d3d2c752). Do not duplicate the user-directive document.

Internal anchors directly read: Meridian UI Mapper README (blob 007f76348f6d927d00f5355bb0d5f7976fe23dbd) and Whirligig functional specification (blob e966e56458a4f009d638ee4e0a8eb60d77d7f95e). Historical/public comparators consulted separately: Kelvin/Tait vortex atoms, Hinton fourth dimension, Artin braid group (bibliographic claims must be independently source checked for any actual historical lineage).

**Question:** Can the UI encode/recover a point trajectory uniquely as a forcing function and SO(4) rotation history?

Let y(lambda)=r(lambda) R(lambda) e1, with R in SO(4), r>0.
The point y fixes r=norm_E4(y), u=y/r but NOT the full rotation R: for any S(lambda) in SO(3) stabilizing e1, R'=RS also satisfies R'e1=Re1=u. Thus it leaves y identical while changing the frame rotation history. SO(4) has six generators; normalized point on S3 has three; **three angular degrees of freedom remain invisible to the point path**. This is a gauge/identifiability statement, not a deficit in the UI as ruler.

**Executed SymPy test:** R=rotation in plane (1,2); S=rotation in (2,3), e1=(1,0,0,0). Symbolic simplification returned (RS-R)e1=(0,0,0,0) identically, while RS-R is generically nonzero. Executed 2026-10-24.

**Consequences:** At a nonzero point, UI can measure location, Euclidean radial scale and direction exactly given origin, scale and coordinate convention; it cannot uniquely invert a trajectory into all six physical SO(4) rotations without extra director/frame observations or an explicit gauge choice. If an arbitrary curve is given, choosing a minimal rotation is one representative, not an empirically determined full frame.

**Metric typing:** Standard Minkowski space has Lorentzian (-+++) metric and Lorentz symmetry O(1,3). A Euclidean R4 embedding with SO(4) is not Minkowski merely because a selected effective metric may be induced as g=delta-2 u tensor u; the induced metric, connection, and physical meaning of u require explicit specification. A curved metric is not globally Minkowski, though locally tangent frames can be Minkowskian. The UI is a chart/measurement apparatus unless actual dynamics supplied.

**Non-uniqueness caution:** A prescribed polar curve or variable-speed rotation may make a visually striking self crossing but does not automatically yield one intersection or a unique, lossless address. Point identifiers should use explicit tuple (chart, coordinate convention, parameter, curve ID, branch, gauge metadata, source-version), not inferred knot crossings alone.

**Whirligig translation gate:** An equation-to-curve encoder must specify information preserved and an inverse criterion; a geometric deformation path between encoded curves does not automatically give a valid derivation from one equation to another. Preserve bending functional, coordinate/gauge conventions and hold-out tests.

**Atlas design:** normalize source provenance separately from geometry. Graph nodes for source claim, equation version, mathematical equivalence class, geometric realization, observation, physical sector, and frame. Edges typed 'derives', 'reexpresses', 'analogous', 'supersedes', 'contradicts', 'physically verified', 'constructed with'. Never collapse by numerical closeness or glyph/code numerology alone.

Next: implement controlled metric-free UI calibration example, add transported director tests, and compare a pair of encodings of the same curve for representation-invariant Whirligig ranking. Read informal/off-topic archive material and external prior art as directed before next mathematical promotion.
