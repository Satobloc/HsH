# Ravel sandbox checkpoint — SO(4) commutator memory requires transverse core structure

**Status:** `GEN/CANDIDATE`. This is a controlled kinematic construction, not canonical H(s)H and not a derivation of how matter sources time-normal torsion.

## Reading and routing record

The controlling front door, `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` (blob `2e788d4a...`), was reread before theory work together with its live key, reference-desk, onboarding, symbol-management, citation, workflow, and task-graph routes. The HSH_RESOURCES War Room, Tool Chest, source index, and Nathan-preference router were reviewed as supporting navigation only. No external or quarantined theory was imported.

### Fresh SAT archive source

- Exact path: `SAT_THEORY_ARCHIVE_2023-25/4DHH-UC BUILDOUT DEV.txt`
- Git blob: `37e2490602b23bdd0d1fd418c51b65df5cdc548c`
- Sequential coverage: lines 1–800 of the file, with lines 650–800 reread separately for the relevant construction.
- Actually retained:
  - the source's insistence on testing cross-sector attachment rather than isolated numerical fit;
  - its move from a naive norm-based winding picture to path-ordered products when rotations do not commute;
  - the distinction between an extended four-dimensional history and its resolving-surface intersection.
- Excluded/quarantined: lattice primacy, particle assignments, mass laws, named numerical constants, claimed empirical matches, ontology language, and generated novelty/confidence assessments.

### Fresh H(s)H source

- Exact path: `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HOLONOMY DRAFT.txt`
- Git blob: `2b35f0f98d307d518d387855818e973d251e22b4`
- Coverage: complete file, 82 lines / 3,213 characters.
- Actually retained as a negative control: the draft compresses holonomy into one scalar phase and itself leaves geometric anchoring as an outstanding task.
- Excluded/quarantined: the inflation model, parameter values, observational numbers, and predictions. They did not enter this calculation.

The independent test geometry was fixed before those sources were cross-pollinated.

## Question

If two noncollinear matter interactions rotate the time normal in opposite orders, can a finite-core intersection distinguish those histories after their endpoint normals have been made identical?

This tests whether the minimal transported object can be only a unit normal \(n_\Sigma\), or must be a frame whose first axis is \(n_\Sigma\).

All symbols introduced below are `LOCAL:so4_commutator_finite_core`. The profile parameter is written \(\nu_\perp\), avoiding collision with the standard-physics use of bare \(\alpha\).

## Geometry

Let \(J_{01},J_{02}\in\mathfrak{so}(4)\) generate rotations of the initial normal axis \(e_0\) toward two independent transverse axes. Define two ordered pulse histories,

\[
F_{AB}=e^{\epsilon J_{02}}e^{\epsilon J_{01}},
\qquad
F_{BA}^{(0)}=e^{\epsilon J_{01}}e^{\epsilon J_{02}}.
\]

Choose the unique minimal plane rotation \(C_\epsilon\) that maps the second endpoint normal to the first:

\[
C_\epsilon F_{BA}^{(0)}e_0=F_{AB}e_0,
\qquad
F_{BA}=C_\epsilon F_{BA}^{(0)}.
\]

The endpoint normals are now identical, but the full frames need not be. Their residual is

\[
H_\epsilon=F_{AB}^{T}F_{BA}.
\]

Because \(H_\epsilon e_0=e_0\), the residual lies in the \(SO(3)\) stabilizer of the common normal. Baker–Campbell–Hausdorff predicts

\[
H_\epsilon
=I+\epsilon^2[J_{01},J_{02}]+O(\epsilon^3).
\]

Thus the leading order memory is a transverse rotation, not a remaining normal mismatch.

## Finite-core coupling

Let the material-frame squared support tensor be

\[
D=\operatorname{diag}(r_0^2,r_1^2,r_2^2,r_3^2).
\]

After transport by \(F\), a laboratory resolving direction \(q\) sees effective half-support

\[
a_F(q)=\sqrt{q^T FDF^Tq}.
\]

For the compact marginal

\[
p_{\nu_\perp}(z;a)
\propto
\left[1-(z/a)^2\right]^{\nu_\perp},
\qquad |z|\le a,
\]

the centered finite-slab overlap is the regularized incomplete-beta expression

\[
S_F(q)=I_{x^2}\!\left(\frac12,\nu_\perp+1\right),
\qquad
x=\min\!\left(\frac{d_\Sigma}{2a_F(q)},1\right).
\]

This yields two exact nulls:

1. A single endpoint-normal measurement is blind because both histories have the same normal.
2. If the core is transversely isotropic, \(r_1=r_2=r_3\), then \(D\) commutes with every residual stabilizer rotation and all endpoint overlaps agree.

For an anisotropic core, \([H_\epsilon,D]\ne0\), so a multi-direction resolving bank can detect the order history.

## Numerical discriminator

The solver used

\[
(r_0,r_1,r_2,r_3)=(0.060,0.082,0.047,0.069),
\quad d_\Sigma/2=0.022,
\quad \nu_\perp=0.65,
\]

with eight fixed laboratory resolving directions. These are arbitrary controlled-fixture values, not recovered constants or particle targets.

For \(0.006\le\epsilon\le0.09\), fitted power laws were

\[
\theta_{\rm stab}=0.9967\,\epsilon^{1.99927},
\]

\[
\operatorname{RMS}(S_{AB}-S_{BA})
=0.07726\,\epsilon^{1.99295}.
\]

At \(\epsilon=0.114676\):

| Quantity | Result |
|---|---:|
| Pre-closure normal separation | \(1.063\times10^{-3}\) |
| Post-closure normal separation | \(1.39\times10^{-17}\) |
| Residual transverse-frame angle | \(1.3093\times10^{-2}\) rad |
| Anisotropic-core RMS overlap difference | \(1.0169\times10^{-3}\) |
| Maximum channel difference | \(1.7100\times10^{-3}\) |
| Isotropic-core RMS difference | 0 at this fixture point |
| Single-normal endpoint difference | 0 |

Across the entire amplitude sweep:

- endpoint-normal closure remained below \(1.12\times10^{-16}\);
- the isotropic control remained below \(1.43\times10^{-16}\);
- the single-normal observable remained below \(2.23\times10^{-16}\);
- the inferred residual generator aligned with \([J_{01},J_{02}]\) at \(0.9999999999999999\).

## Source fact → inference → conjecture

### Source facts

- The archive contains a historical call to replace naive winding measures with path-ordered rotational products.
- The H(s)H draft tested here reduces holonomy to a scalar phase and explicitly lacks geometric anchoring.

### Inference

A scalar normal or scalar phase is insufficient to carry noncommuting transport history. Once endpoint normals match, order information lives in the transverse stabilizer of that normal.

### Sandbox conjecture

The smallest H(s)H transport state capable of retaining ordered time-normal torsion is a frame

\[
F_\Sigma(\tau)\in SO(4),
\qquad n_\Sigma(\tau)=F_\Sigma(\tau)e_0,
\]

but the extra three-axis information is physically relevant only where finite-core morphology breaks transverse isotropy. Where the core is transversely isotropic, quotient by the stabilizer and retain only \(n_\Sigma\). This avoids adding a universal taxonomy of torsions: full frame when geometry demands it, unit normal when it does not.

Conditionally, noncollinear matter-normal interactions could therefore leave particle-like memory through the commutator of their torque generators. That sourcing mechanism remains open.

## Failure conditions

Reject or revise this architecture if:

1. the endpoint-matched residual fails to approach \(\epsilon^2[J_{01},J_{02}]\) under smaller steps;
2. the intersection signal does not vanish continuously as \(r_1,r_2,r_3\) approach equality;
3. realistic spatial and temporal integration averages away the channel fingerprint;
4. frame relaxation erases the stabilizer rotation before the next interaction;
5. an endpoint-normal-only model predicts a claimed order-sensitive signal equally well.

## Next calculation / prediction candidate

Drive the same anisotropic finite-core worldtube with two controlled, noncollinear torque protocols \(AB\) and \(BA\). Add a minimal closing pulse so both protocols end with the same measured normal. A genuine ordered-frame effect predicts:

- a signed multi-direction intersection fingerprint proportional to \(\epsilon^2\);
- reversal under exchange of pulse order;
- collapse to zero under transverse isotropization;
- no signal in a detector sensitive only to the common endpoint normal.

The immediate solver extension should replace ideal rotations with a damped elastic-frame equation and determine whether the commutator residue survives a finite relaxation time.

## Reproducibility

- Code: `WORKSPACES/RAVEL/CODE/so4_commutator_finite_core.py`
- Data: `WORKSPACES/RAVEL/DATA/so4_commutator_finite_core.json`
- Class-P diagnostic: `WORKSPACES/RAVEL/FIGURES/so4_commutator_finite_core.svg`
