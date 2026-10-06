# Ravel sandbox checkpoint — signed-response curvature decomposition

**Status:** speculative sandbox candidate, not canonical H(s)H theory. No historical particle label, constant, or target value was used as a fit target.

## Question

Earlier finite-contact readout tests found a signed omitted-mode response for an even mode (P8) even at mirror-symmetric support, while the odd mode (P9) vanished there. Is the surviving P8 effect created by the nonlinear nuisance optimizer, or is it already present in the forward readout geometry?

## Source record

### Controlling onboarding and workflow

Read before the build:

- `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — current front-door instructions, archive/search routing, provenance discipline, and workspace behavior.
- `Satobloc/HsH/REFERENCE_DESK/README.md` — reference-desk routing and separation of theory, history, resources, and workspace artifacts.
- Current orientation/task-graph, symbol-management/registry, citation-policy, and toolbox namespace documents pointed to by the front door — used only as workflow controls.

The 5 October `HSH_RESOURCES` packet was treated as routing/tool familiarization and standard-physics support only. No quarantined prior-art construction was imported into the independent model below.

### SAT archive source substantially read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`
- Read coverage: lines 1–1000 in two explicit chunks (1–500 and 501–1000).
- Retained source motifs: recursive curves in four-dimensional space; SO(4)-type transport/rotation; the separation between an underlying worldline or finite geometry and its lower-dimensional readout.
- Quarantined: lattice ontology, numerical constants, particle assignments, mass laws, claimed Standard-Model identifications, and zero-parameter claims.

### H(s)H source substantially read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/WORKING_GROUP_1.txt`
- Read coverage: lines 1–500; the file ended at approximately line 384, so this covered the full file.
- Retained source facts: the minimum-kernel chain from primitives through geometry, kinematics, dynamics, readout, output, and test; dependency purity; contamination logging; and the finite-core/worldtube construction remit.
- Not promoted to theory authority: historical role assignments, consensus language, or unverified claims inside the conversation.

## Boundary between source, inference, and conjecture

**Source facts.** The archive repeatedly distinguishes a four-dimensional construction from its observed projection/readout. The H(s)H working-group record requires an explicit readout layer and auditable dependency chain.

**Inference.** If a finite four-dimensional carrier is real rather than metaphorical, a signed deformation can become observationally asymmetric in two distinct places: (i) the forward finite-contact map itself and (ii) the projection/refit of nuisance geometry. These contributions must be measured separately.

**New sandbox conjecture.** Even and odd omitted angular modes obey different local parity laws. The even-mode signed response can have a nonzero symmetric intercept, whereas the odd-mode response requires a parity-breaking carrier coordinate and can vanish through cancellation between two different asymmetries.

## Independent construction

Use the existing branch-aware finite-contact solver, fixed support span

\[
\rho_+ + \rho_- = 2,
\qquad
a=\frac{\rho_- - \rho_+}{\rho_-+\rho_+},
\]

and a controlled odd baseline coordinate

\[
o=P_1=P_3=P_5,
\qquad P_2=P_4=P_6=-0.01.
\]

For a moment-isolated omitted mode \(P_\ell=\delta\), compare three held-out response layers:

\[
r_{\rm raw}=\Delta y_h,
\]

\[
r_{\rm tan}=\Delta y_h-J_h\widehat{\Delta\theta}_{\rm linear},
\]

\[
r_{\rm full}=y_h(\delta)-y_h(\widehat\theta_{\rm nonlinear}).
\]

For each layer, fit the signed power response

\[
\Lambda(x)=A x^2+B x^3+C x^4,
\qquad x=\delta/0.0025,
\]

and use \(B/A\) as the dimensionless signed-response measure.

## Result 1: P8 is already in the forward map

At exact mirror symmetry \((a,o)=(0,0)\):

| Layer | P8 \(B/A\) |
|---|---:|
| Raw forward map | -0.00145386 |
| Linear tangent-projected | -0.00243706 |
| Full nonlinear refit | -0.00293762 |
| Nonlinear increment beyond tangent | -0.00050057 |

About 49.5% of the full signed response is already present with nuisance parameters frozen. Linear nuisance removal amplifies rather than erases it; nonlinear refitting adds roughly 17.0% of the full magnitude beyond the tangent layer. Therefore the P8 effect is principally forward-map curvature reinforced by nuisance geometry, not an endpoint-asymmetry artifact and not solely an optimizer artifact.

The local parity-allowed full-refit law near symmetry is

\[
\frac{B_8}{A_8}\approx
-0.00294194
+0.164987a^2
-0.374105ao
-2.58695o^2.
\]

Its nonzero intercept is the key even-mode mechanism.

## Result 2: P9 has two parity-breaking sources and a cancellation line

At \((a,o)=(0,0)\), P9 is numerically null:

\[
(B_9/A_9)_{\rm raw}=1.85\times10^{-13},
\quad
(B_9/A_9)_{\rm full}=9.10\times10^{-9}.
\]

Near symmetry, the full-refit response is

\[
\frac{B_9}{A_9}\approx 0.00571447a+0.0336518o,
\]

with local fit RMSE \(4.26\times10^{-5}\). Hence

\[
o\approx -0.169812a
\]

is a cancellation line: support asymmetry and odd baseline morphology can both be nonzero while the observed P9 sign response vanishes. A null signed response therefore does **not** prove a symmetric carrier.

The corresponding raw-forward cancellation line is \(o\approx-0.101043a\); the line moves after tangent projection and nonlinear refit. That displacement is itself a readout/refit diagnostic.

## Geometry/mechanism in H(s)H language

Interpret \(a\) as a signed imbalance of the two finite contact directions of a worldtube cross-section, and \(o\) as an internal fore–aft skew of the transported cross-sectional morphology. Under simultaneous mirror reversal,

\[
(a,o,\delta_\ell)\mapsto(-a,-o,(-1)^\ell\delta_\ell).
\]

Consequently, an even omitted mode admits a scalar response built from \(1,a^2,ao,o^2\), while an odd omitted mode admits the leading pseudoscalar combination \(\alpha_a a+\alpha_o o\). This is the smallest mechanism found here that generates particle-like signed readout without inserting a particle identity or historical target value.

## Discriminator and next solver test

Run a blind dense two-dimensional sweep around

\[
o=-0.169812a
\]

without refitting the coefficients. The construction predicts:

1. P9 \(B/A\) changes sign across that line.
2. P9 remains near zero along the line despite visibly asymmetric support and baseline geometry.
3. P8 does not acquire the same linear zero line; it retains its symmetric intercept and is invariant under the simultaneous mirror \((a,o)\to(-a,-o)\).
4. The raw, tangent, and full P9 zero lines are distinct, allowing the forward and readout/refit contributions to be separated experimentally or numerically.

## Failure conditions

Reject this sandbox mechanism if any of the following occurs under denser sampling or higher quadrature order:

- P9 remains appreciably nonzero at \((a,o)=(0,0)\).
- The simultaneous-mirror covariance fails.
- The predicted P9 sign reversal does not occur across the cancellation line.
- P8 loses its nonzero symmetric intercept after numerical convergence.
- The fitted coefficients vary materially with amplitude window, quadrature order, training/held-out grid, or covariance choice.

Current audits: maximum lower-moment drift \(6.41\times10^{-14}\); zero optimizer retries or failures; maximum mirror-covariance error in \(B/A\), \(8.28\times10^{-7}\).

## Durable artifacts

- Solver: `WORKSPACES/RAVEL/CODE/signed_response_curvature_map.py`
- Machine-readable surface and fitted laws: `WORKSPACES/RAVEL/DATA/signed_response_curvature_map.json`
- Figure: `WORKSPACES/RAVEL/FIGURES/signed_response_curvature_map.svg`

