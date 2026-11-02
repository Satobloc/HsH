# Meridian Playground | UI-to-finite-core worldtube bridge | 2026-11-01

**Status: PLAYGROUND / SPECULATIVE MATHEMATICS / NOT EVIDENCE / NOT H(s)H CANDIDACY.**
This is an explicitly sandboxed continuation of already recovered UI kinematics. It is not a claim that the UI generator is the physical ontology or that any chosen tube model is the correct H(s)H construction.

## Purpose

Explore the mathematical bridge from a scale-plus-rotation trajectory generator to a finite-core worldtube description. Keep separate:

1. the center trajectory or representative curve;
2. the moving normal frame / framing;
3. a finite-radius cross-section;
4. the swept worldtube or worldvolume;
5. readout/intersection with a resolving surface;
6. physical constitutive dynamics and observables.

The first five can be studied as geometry. The sixth requires independently sourced physics and must not be inferred from geometric elegance.

## Recovered source base

The archived source `2026/SAT CORE — UI CONFIG.txt` is byte-identical to `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UI CONFIG.txt`:
- exact blob SHA: `6817caf68943593f31d72d51798e0ba4589624a4`
- archived equations:
```
y^mu(lambda) = r(lambda) R^mu{}_nu(lambda) x_0^nu
dot y^mu = dot r yhat^mu + Omega^mu{}_nu y^nu
Omega = Rdot R^{-1}
L_UI = 1/2 dot r^2 + 1/2 r^2 Omega_{mu nu} Omega^{mu nu}
```
- The 2026-10-21 Morrow reconstruction established the velocity identity for r>0, with the smooth expression using u=R x0 at r=0, and corrected the selected-point kinetic term to `1/2 dot r^2 + 1/2 r^2 |Omega u|^2`. The archived Frobenius term is a distinct group/control-space cost unless separately justified.
- Morrow's result packet: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-ui-so4-audit-20261021-001.md`, blob `08c79af75872916d6cf74352f3680c8980a011b3`.
- Aster's two-plane closure packet: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-ui-two-plane-closure-gate-20261022-001.md`, blob `d05f5ef7f70d453ee6c178d060045ddf4ec8cc99`.
- Initial NLM math triage distinguishes generator from action/measure and warns that NotebookLM prose is not Nathan Direct by default: `WORKSPACES/COMMON/NLM_BIG_HAUL_INITIAL_MATH_TRIAGE_2026-10-21.md`, blob `ec0cc5559268573b0bf8762b4abe70c90af07161`.

### Source authority caution

A later repository summary is not a substitute for primary user-authored source passages. The exact UI CONFIG text is an equation-bearing source, but its authorship span and original conversation context still need recovery before treating associated ontology statements as Nathan Direct. NotebookLM export roles labelled `user` do not authenticate the author of their contents.

### Relevant H(s)H architecture controls

`STATE_OF_THE_THEORY.md` says H(s)H is intended as an explicit finite-core/worldtube continuation, and that representation, modeled object, readout, and physical status must not be collapsed. The source-ingestion ledger records Nathan's July 2026 correction: the worldline-to-worldtube transition is not simply adding thickness; the centerline-essentialist description is being replaced by explicit finite-core boundary/intersection description. This is an architectural direction, not a completed mathematical construction.

## Core mathematical setup

Let a regular center curve be `y(lambda) = r(lambda) R(lambda) x0`, with `x0 in S^3`, `R(lambda) in SO(4)`, and define `u=R x0`, `Omega=Rdot R^{-1}`. For `r>0`:

```
ydot = rdot u + r Omega u
|ydot|^2 = rdot^2 + r^2 |Omega u|^2
```

The center curve is only one-dimensional. A finite cross-section needs additional transverse data. Locally, choose an orthonormal frame `E_A(lambda)`, `A=1,2,3`, spanning the normal space to the unit tangent `T=ydot/|ydot|` in the ambient four-dimensional Euclidean arena. A local radius-`a` cross-section can be parameterized as:

```
X(lambda, n) = y(lambda) + a sum_A n^A E_A(lambda),
|n| = 1
```

This is a candidate tubular parametrization, not yet a global embedding. The normal frame has its own `SO(3)` gauge freedom. Frame transport, normal connection, holonomy, curvature, and global injectivity all matter. In a curved ambient space, replace the affine expression by the exponential map and restrict to a normal neighborhood.

For a regular embedded curve in Euclidean space, a tubular neighborhood exists for sufficiently small radius below the curve's reach. The reach is controlled by both local curvature and nonlocal near-self-approach; it is not determined by centerline curvature alone. A local condition is `a * kappa_max < 1`; global non-overlap also requires radius below the relevant doubly-critical self-distance bound. Exact global thresholds depend on the chosen curve and metric.

## Questions to investigate in separate, bounded passes

### A. Minimal transverse data
- Is a full orthonormal normal triad required, or does H(s)H have a preferred two-plane or anisotropic cross-section?
- Which parts are gauge choices and which are invariants?
- What source specifies a circular, elliptic, layered, or otherwise anisotropic core?
- Can the same worldtube be represented by several frames with identical geometry?

### B. Frame transport and holonomy
- Derive the normal-bundle connection for a regular UI curve.
- Compare Frenet transport, Bishop/parallel transport, and any archive-specific prescription.
- Compute holonomy around closed center curves and separate frame-gauge artifacts from conjugacy-class invariants.
- Do not identify normal-frame holonomy with physical stored twist unless a material director or constitutive law establishes that interpretation.

### C. Tubular embedding and first contact
- For a specified source-derived curve and cross-section, calculate local curvature limits and global reach.
- Find the first loss of injectivity as tube radius increases.
- Distinguish local focal failure from nonlocal self-contact.
- Do not infer a braid force or energy from first geometric contact alone.

### D. Worldtube boundary and readout
- Define the tube boundary and its intersection with a specified resolving hypersurface.
- Determine when the intersection is a smooth curve/surface and when it changes topology.
- Distinguish a projection/readout from the complete higher-dimensional object.
- Avoid assuming that an intersection class is a protected particle label.

### E. Dynamics, only after geometry is explicit
- A kinematic generator and a tube embedding do not select a physical history.
- Recover a source-grounded action or constitutive law before deriving Euler-Lagrange equations, stability, tension, or bending response.
- Keep any proposed mathematical action explicitly marked as a trial functional in a separate sandbox.
- Do not add a core force, medium law, or fitted coefficient solely to obtain a desired stable tube.

## Proposed playground sequence

1. **Source genealogy:** retrieve earliest primary UI/TX and worldtube passages, classify Nathan Direct versus assistant synthesis, and record exact blob SHAs and commits.
2. **Geometry contract:** define the center curve, normal frame, cross-section shape, ambient metric, and domain. Do not assign numerical core radii without sourced values.
3. **Symbolic local geometry:** derive tangent vectors, induced metric, Jacobian, second fundamental forms, and local focal conditions for a general framed tube.
4. **Gauge audit:** determine how formulas transform under parameter re-labeling and `SO(3)` changes of normal frame.
5. **Global embedding:** use source-specified trajectories only; compute reach and self-contact with fully disclosed algorithms.
6. **Cross-sector bridge:** map any surviving geometric invariant to independently sourced Minkowski, spin, electromagnetic, or gravitational constraints. No one-sector match qualifies as a theory candidate.
7. **Formalization:** write Lean theorems for exact general identities after hypotheses and types are frozen. Compilation must be run, not inferred from source text.

## Immediate mathematical discriminator

For a general regular curve `y(s)` parameterized by arclength in `R^4`, with a smooth orthonormal normal frame `E_A(s)`, derive the full differential of
```
X(s,n)=y(s)+a E_A(s)n^A,   n in S^2,
```
including the normal connection `omega_AB(s)=E_A dot E'_B` and curvature components `kappa_A=T' dot E_A`. Determine exactly how the local volume Jacobian depends on `a`, `n`, curvature, and frame transport. Then identify which terms are frame-gauge invariant. This should be done symbolically first; any numerical test fixture requires explicit permission if it uses no real-world measured data.

## Gates and prohibitions

- This is a proposed playground; no data-free calculations have been executed in this note. Under BEDROCK ND-2026-10-25-01, executing purely mathematical fixtures or numerical tests requires Nathan's explicit permission first.
- Real-system calculations must use genuine sourced measurements, uncertainties, and provenance.
- Do not present source-derived, sandbox-derived, and model-derived content as one undifferentiated result.
- No CODATA comparison unless an independently derived dimensional observable and uncertainty budget exist.
- Mathematical clearance only makes a result eligible for candidacy consideration. H(s)H candidacy additionally requires explanatory/constraining power across multiple sectors. Physical verification is a separate gate.
- Preserve failures, nonunique repairs, and alternate cross-section/frame hypotheses.

**Authorship:** Meridian assistant sandbox proposal. Not Nathan Direct, not BEDROCK, and not theory authority.
