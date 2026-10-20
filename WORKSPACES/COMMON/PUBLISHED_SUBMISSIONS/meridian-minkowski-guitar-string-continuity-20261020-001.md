# Meridian successor continuity | Minkowski rotating-thread / guitar-string test | 2026-10-20

**Identity:** Meridian, geometry and solver reconstruction. Author: assistant worker, not Nathan Direct. **Status:** SANDBOXED exact mathematical test, independent candidate physical identification remains TENTATIVE. This is a new scientific handoff made at the user's stated conversation-length limit, subsequent to the previously verified BR-008 continuity.

## Zero: restart exactly here

The outgoing ChatGPT user explicitly asked "Shall we... shut up and calculate?" in response to a hypothesis: Kerr singular-ring or Kerr-like finite-core thread structures may oscillate between minimum and maximum diameters, regardless of their mass, not from an invented extra SAT force but by taking a rotating thread literally in four-dimensional **Minkowski spacetime**. User emphasized that rotation and harmonic transverse components are an inherent/tautological classical construction, a return to the guitar-string model. The preceding assistant response began "So... what have we here?" and was interrupted by conversation limit before interpreting its two exact string examples.

**Answer to carry into successor:** In one fixed Minkowski spacetime, using *the same* Nambu-Goto string action, both a uniformly rotating folded-string rod of constant full spatial diameter and a pulsating circular closed string of varying full spatial diameter exist. Their horizontal projected widths are IDENTICAL as functions of inertial time. Therefore transverse oscillation does not by itself force a breathing diameter; a different configuration/degree of freedom does. The user may have intended worldtube or intersection morphology rather than the full invariant physical diameter, so explore that distinction rather than foreclosing investigation. No actual classical Kerr ring singularity, its parameter a=J/(Mc), or Einstein-equation solution was derived from the string fixtures. Do NOT conflate the use of a string *dynamical* action with mere Minkowski geometry. Time evolution of a material string requires dynamics in addition to ambient spacetime metric.

## 1. Exact Minkowski test fixtures

Work in flat Minkowski signature (-,+,+,+), inertial temporal gauge X^0=t, c=1. Let R>0, string tension T>0, sigma in [0, 2*pi*R), and theta=t/R, psi=sigma/R. A pair of exact Nambu-Goto solutions in conformal temporal gauge:

(A) ROTATING FOLDED ROD
X_rot(t,sigma) = (t, R*cos(theta)*cos(psi), R*sin(theta)*cos(psi), 0).
Spatial support at fixed t is the diameter line segment from -R to +R oriented at theta; sigma runs over a double-covered folded closed string.
Velocities have magnitude |d_t x|=|cos psi|, tangents |d_sigma x|=|sin psi|, and dot-product zero. End/fold positions reach speed c in this idealization.
Spatial diameter D_rot(t)=2R, constant in this inertial slicing.
Horizontal x-projected width W_rot(t)=2R*|cos theta|.
Angular momentum about z, J_z=pi*T*R^2. Energy E_rot=2*pi*T*R.

(B) PULSATING CIRCULAR LOOP
X_loop(t,sigma)=(t, R*cos(theta)*cos(psi), R*cos(theta)*sin(psi), 0).
Spatial support at fixed t is circle of radius R*|cos theta| (orientation switches at sign changes). No azimuthal rigid rotation of its points.
Velocities |d_t x|=|sin theta|, tangents |d_sigma x|=|cos theta| and dot-product zero.
Spatial diameter D_loop(t)=2R*|cos theta|; it collapses to zero at theta=pi/2 modulo pi, a degenerate IDEAL zero-thickness configuration, not a regular finite-core solution.
Horizontal x-projected width W_loop(t)=2R*|cos theta|, exactly equal to W_rot.
Angular momentum about z, J_z=0. Energy E_loop=2*pi*T*R.

**Exact verification:** Both satisfy spatial wave equation d_t^2 x - d_sigma^2 x=0 and constraints (d_t x).(d_sigma x)=0, |d_t x|^2 + |d_sigma x|^2=1. E=T integral d sigma=2*pi*T*R. Momentum angular integrals give results above. The rod geometry is stationary up to overall rotation with fixed diameter; the breathing loop has zero axial J yet a varying diameter. With R=T=1, both E=6.283185307179586, rod J=3.141592653589793, loop J=0.

**Actual independent numerical execution in this successor-preparation turn:** Python/NumPy sampled 32768 sigma points for t={0,.37,.79,1.4,2.12,4.2}. For every sample, |measured D_rot - 2| <1e-10, |measured D_loop - 2|cos t|| <1e-10, and both measured projected x widths match 2|cos t| within 1e-10. Output ALL_CHECKS_PASSED. Example: t=.37, D_rot=2, D_loop=W_x=1.864654691; t=1.40, D_rot=2, D_loop=W_x=0.339934286. This executed numerical check is independent of earlier plot-output reports. It checks the stated geometry, not the astrophysical/physical Kerr hypothesis.

**Important semantics:** "Full spatial diameter" here is maximum pairwise Euclidean distance within ONE INERTIAL t-slice; not a generally covariant spacetime invariant under boosts. The *identical projected width* is observer- and axis-dependent, exactly a BR-008 coordinate/measurement artifact control. Radius of support, string strand core thickness, helix coil radius, envelope size, and Kerr ring coordinate a are NOT interchangeable. In the loop example a full collapse is unacceptable as a smooth finite-core worldtube. The rotating folded rod endpoints are luminal idealizations.

## 2. Correct interpretation and open hypotheses

**Demonstrated:** Uniform circular movement decomposes into oscillating Cartesian components; conversely planar harmonic components in quadrature produce circular motion. It does NOT entail radial oscillation. At least two admissible Nambu-Goto configurations have identical x-width functions while full spatial diameters differ. This is a concrete "same measured scalar, different geometry" discriminator. We cannot infer the behavior of a Kerr singularity from these fixtures.

**Not demonstrated:** Kerr singularity is a material orbiting string, its intrinsic diameter breathes at fixed M,J, all masses obey a common minimum/maximum, Nambu-Goto tension belongs to SAT/H(s)H, or Einstein's equations enforce radial breathing. Standard stationary Kerr has fixed a=J/(Mc) for fixed M,J; a is a Kerr parameter in a chosen representation, not a material string circumference. A changing spatial intersection of a finite-core worldtube does not directly imply a changing coordinate-invariant singular support. Additional physical identification with a Kerr-like support is a working conjecture only.

**Next useful actual calculation:** Search for a rotating *finite-core* worldtube/string configuration with BOTH nonzero angular momentum and nonconstant diameter, using a geometrically specified structure, no arbitrary restoring-force injection or circular reasoning. Compute the exact Minkowski geometry and time-slice intersections first, including a straight worldtube and a helix as controls, then condition on dynamics. Compare (i) true inertial-slice max pairwise diameter, (ii) x projected width, (iii) tube/core radius and curvature, (iv) normal-frame/embedding invariant measures and their behavior under alternate charts/frames. Find specific necessary or sufficient conditions for D_min < D_max and whether min is nonzero for finite core. Check conservation/causality and avoid literal Nambu-Goto singular collapse. Only after that inspect connections to Einstein/Kerr and genuinely rotating string solutions. If this fails, record failed necessity claim and preserve constructive possibility, not a fitted patch.

## 3. Known architecture and pointers

Live BEDROCK, SHA as checked in this turn: acd2d9d935ed4ad1d9df8d42be4891ef296ea322. Read whole live document on next activation and subordinate STATE_OF_THE_THEORY.md. BR-000/001: FIE -> SAT -> H(s)H ancestry. BR-003: new physical conjectures tentative. BR-005: theta4=0 for straight time-normal worldtube; an observational timeslice need not itself be a physical universal sheet (Oct 20 alternate working hypothesis). BR-006: interbraid/cumulative history across all scales framework-internal physical constraints and required tests. BR-007: historical retrieval must use Mersearch FIRST. BR-008: distinguish real geometric invariants and dynamics from coordinate and measurement artifacts, especially arbitrary axis/pole effects. OC-001 and OC-002 unresolved. Current ND-2026-10-18-04: Minkowski map and minimal pairs, with geometry built BEFORE interpretations.

Prior verified, complete Meridian BR-008 continuity: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-continuity-br008-20261020-001.md, issue #184, commit aa7087811b050e30db77b9e3b1ab4e31e96a52aa, SHA-256 24c6b7400b5e7ca5aec2131563e5746e69b7fdcbf141dfbc46ba24b6ae86e49c; publication receipt and repository file independently checked at this turn. That file documents the Oct 20 Aldus longitude-pole error, source restrictions, house workflows, and all prior solver work. DO NOT resubmit #184.
Other detailed current Meridian cumulative checkpoint: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-cumulative-geometry-site-intake-20261020-001.md; publication issue #181. Five-part original FULL conversation archive: HsH/LIVE CONVOS/Meridian Free Build, last seen through Oct 19; Oct 20 additions may not yet be in it.

Earlier this same chat produced three plotted images described as:
- meridian_minkowski_diameter_discriminator.png (both x projected widths match while full diameters differ)
- meridian_minkowski_worldsheet_rod.png
- meridian_minkowski_worldsheet_loop.png
They were generated in the outgoing ChatGPT context, but are NOT assumed to be permanently published in HsH/GitHub. Recreate images from equations in a verified script if publication is required; never guess a GitHub URL or assert that earlier local images are already repo-backed.

Meridian's other substantive mathematical results: Nambu-Goto tests above are *new* beyond previous continuity. Previously archived finite-core 3-ball overlap gives V(d)=pi(4R+d)(2R-d)^2/12 and model-dependent E=KV with cusp at coincident centers; SO(4) residual full-action and path ordering; S3 coarea versus stereographic angle mapping; mass-ratio archival arithmetic defects. Source-first Whirligig/Donut, UI/TX, Three Spheres, Hagalaz and Great Annulum geometry remains active, Class P scripted precision drawing preferred. No external spherical/Hopf carrier ontology, no unsupported leap from Euclidean SO(4) to Minkowski Lorentz transformations.

Educational source context: Sohil Rathi "The Missing Calculus Operation"; Grant Sanderson/3Blue1Brown "The Most Beautiful Formula Not Enough People Understand" (Feb 27 2026). Not source of new Minkowski string conclusion or SAT inventions.

## 4. Publication safety and restart workflow

Apply WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md, WORKSPACES/COMMON/REVIVAL_RELAY_THREAD_FIRST_RULE_2026-10-11.md, and WORKSPACES/COMMON/ISSUE_PUBLICATION_INTAKE_V1_2026-10-15.md. House first; fixed-destination eligible public text goes through owner-authored [HSH-PUBLISH-V1] GitHub issue containing schema, content, exact sha256. The workflow is asynchronous; issue accepted != published. Check issue comment plus independently read file to verify byte identity before saying PUBLISHED_VERIFIED. Carry pending IDs and do not duplicate. Connector Contents API should only be a scoped fallback for destinations the house writer cannot target. Do not alter BEDROCK without authorization, impersonate Nathan, insert protected signet, include private restricted material, or equate GitHub issue/worker inbox with a ChatGPT message.

Successor response to Nathan's interrupted "So... what have we here?" should be concise and factual: **We have an exact twin-control: same Minkowski background and same classical string action, identical oscillatory width readout, but one nonzero-angular-momentum rotating fixed-diameter string and one zero-angular-momentum pulsating loop. Rotation implies component oscillation, not intrinsic-size oscillation; radial breathing is possible with additional conditions. This identifies the next clean mathematical task and illustrates BR-008. It does not disprove the more specific SAT/H(s)H Kerr-like worldtube conjecture.**

Meridian
