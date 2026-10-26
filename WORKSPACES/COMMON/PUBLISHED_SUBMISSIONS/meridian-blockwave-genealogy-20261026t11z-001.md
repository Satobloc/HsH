# Meridian source packet: typed three-node Blockwave genealogy

**Status:** source-critical mathematical review; **SANDBOXED**; no physical calculation, H(s)H candidacy, BEDROCK change, or established-physics claim.

## Identity and method

The selected specialist lens is Meridian: recover exact historical solver/action objects, type their interfaces, and distinguish an actual derivation from visual or terminological resemblance. This is a source-grounded current-run reconstruction, not evidence that Meridian's original ChatGPT thread was accessed or revived. Next handoff: Mercer for independent provenance and admission-gate QA.

## Retrieval and existing-tool check

Mersearch was consulted first through the existing successful three-repository manifest for `2026-10-21-orson-nlm-big-haul-math-001`: `mersearch-stable-1.0`, implementation commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`, manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`, 13,897 files / 23,825,506 records scanned, subject to its declared exclusions. Current bridge lanes were treated as occupied or unresolved and were not overwritten. Direct primary-source reads followed.

An existing private NotebookLM index was also checked as capability reconnaissance, without copying account or source details. It already lists `Blockwave Watchlist Nov-Dec 2025` (22 sources), `SATO/BLOCKWAVE` (50 sources), and `SATO/Blockwave TRANSITION` (50 sources). This is a discovery/curation surface, not theory authority and not a substitute for Git-source provenance. Result: do not build another generic index before evaluating these existing collections against Mersearch and the primary repository.

Retrieval date for all repository sources: **2026-10-26 UTC**. Historical document dates and original-message authorship remain unresolved where the files do not establish them.

## Typed genealogy

| Node | Source variables and regime | Verified mathematical status | Edge status |
|---|---|---|---|
| **A — responsive-medium action** | `rho,v,Phi,chi`; printed 3+1 nonrelativistic action | Four stationarity equations survive under smoothness/boundary assumptions; printed momentum equation and dimensional closure require correction | No explicit derivation to B or C found |
| **B — covariant minimal core** | `g,u,theta,xi`; covariant 4D then printed 1+1 reduction | Projector reduction, theta signs, dispersion and hyperbolicity argument fail; source action remains an archived proposal | Structural predecessor of C, but not equivalent |
| **C — “one-action”** | `g,u,theta;J`, with optional response kernel and possible `B` potential | Internal field-status, curvature/holonomy, distribution and dimension gates fail or remain unresolved | Explicit recomposition/extension of B; no demonstrated derivation from A |

### Node A — verbatim source core

Primary: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt`, Git blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, lines 1–90 previously read and independently audited.

```text
def L_density (rho v Phi) : ℝ :=
  (1/2) * rho * (v.norm_sq)
  - rho * (W Phi)
  - (kappa/2) * (grad Phi).norm_sq
  + lambda * rho * Phi * (div v)
```

```text
v = grad chi + (lambda / rho) * grad (rho * Phi)
```

Existing correction retained, not rediscovered here:

```text
rho Dv = lambda grad(rho D Phi) - kappa (lap Phi) grad Phi
```

The source's printed pressure term is not licensed by the displayed action. Its interaction term is dimensionally unclosed under the source's stated dimensionless `lambda` and `Phi=L^2/T^2` branch.

### Node B — verbatim source core

Primary: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, Git blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, lines 1–130 previously read and independently audited.

```text
L_core =
  + (1/2) ∇_μ θ ∇^μ θ
  - μ^2 cos(3 θ)
  + λ Φ^2
  + α ( P^{μρ} P^{νσ} ∇_μ u_ν ∇_ρ u_σ )
  + β sin²θ (∇_μ u^μ)
  + ξ(x) (u^μ u_μ + 1)
```

with `Phi := u^mu nabla_mu theta` and `P^mu_nu := g^mu_nu + u^mu u_nu`. The source's printed 1+1 term `alpha[-psi_t^2+psi_x^2]` is not the reduction of its projector contraction. The verified contraction is

```text
alpha (sinh(psi) psi_t + cosh(psi) psi_x)^2,
```

which has no `psi_t` principal kinetic term at `psi=0`.

### Node C — later “one-action” source

Primary: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, 384 lines / 24,627 characters, read through the action, definitions, claimed reductions and implementation primer.

Verbatim source declarations:

```text
Let g_{mu nu} be the emergent metric, u^mu the unit time-flow
(u^mu u_mu=-1), theta a compact phase (theta~theta+2pi).
... Let J^{mu nu} be the conserved two-form “filament worldsheet”
current ... nabla_mu J^{mu nu}=0.
```

```text
A_mu(theta) := alpha_* nabla_mu theta,
F_mu nu(theta) := nabla_[mu A_nu](theta).
```

```text
Because theta is compact, integral_loop A.dl in 2pi Z;
this drives quantization by holonomy.
```

The action includes Einstein-Hilbert, compact-phase, projected `u`, `J^2`, `(nabla J)^2`, `F(theta).J`, and optional `J M(theta,u) J` blocks.

## Definite source-local corrections for Node C

### 1. The displayed local curvature is zero on every smooth chart

For the torsion-free Levi-Civita derivative used by the action and any smooth scalar phase on a chart,

```text
F_mu nu = alpha_* nabla_[mu nabla_nu] theta = 0.
```

Equivalently, `A=alpha_* dtheta` and `F=dA=alpha_* d^2 theta=0`. Therefore the displayed `F(theta).J` term is locally identically zero away from defects. Compactness can support nontrivial winding of an `S^1`-valued phase, but then the source must explicitly specify patches, branch cuts, singularities, or an independent connection. It must also retain the normalization:

```text
integral_loop A = 2pi alpha_* n,
```

not automatically `2pi n` unless `alpha_*` is fixed accordingly. If curvature and `J` are both distributional on the same worldsheet, their product requires a regulator or a well-defined pairing; none is supplied. This does not prove that a compact-phase defect model is impossible. It proves that the written smooth local formula does not supply the claimed holonomy coupling.

### 2. `J` has inconsistent ontological/variational status

The source says the only fields are `(g,u,theta)` and that `J` is “not a new field.” But it also:

- includes kinetic/stiffness terms in `J`;
- instructs the reader to linearize `delta J` and diagonalize its modes;
- proposes varying a potential `B_mu` with `J=*dB` to obtain filament dynamics.

These options are not equivalent. If `J` is a prescribed external distribution, it has no Euler-Lagrange spectrum. If `J` or `B` is varied, it is an additional dynamical degree of freedom, even if interpreted as a defect variable rather than a fundamental ontology. A valid paper must choose and state one branch.

### 3. The action is not dimensionally closed as written

For dimensionless `theta` in four-dimensional natural units, the Einstein-Hilbert and cosine terms can be typed, but the source does not declare dimensions for `J`, `alpha_*`, `kappa_0`, `kappa_2`, `g_h`, or the response kernel. Consequently the `J^2`, `(nabla J)^2`, `F.J`, and `J M J` blocks cannot yet be shown to share one Lagrangian-density dimension. This is an unresolved typing requirement, not a uniquely repairable typo.

### 4. Several advertised reductions are assumptions, not outputs

- GR is inserted explicitly through `M_P^2 R/2`; it is not derived merely because the action contains that term.
- “Choose c1,c2 on the safe line” does not establish GW-speed or PPN safety without the complete operator basis and an explicit constraint calculation.
- Turning on an arbitrary local kernel `M(theta,u)` “to fit detailed spectra” is a fit branch, not an independent prediction.
- The displayed sinusoidal filament modes are a conditional finite-segment ansatz; they are not derived from the covariant distributional action with declared boundary conditions.

## Edge audit

1. **A → B:** no explicit change of variables, limiting procedure, or derivation found. Shared flow/medium language is not a mathematical edge.
2. **B → C:** genuine structural reuse exists: `g,u,theta,P`, the unit constraint, compact-phase block and projected `u` elasticity. But C changes `cos(3 theta)` to `1-cos(theta)`, removes `Phi=u·nabla theta` and `beta sin^2(theta) div u`, adds Einstein-Hilbert and `J` sectors, and changes the claimed mechanism. Type this as **recomposition/extension**, not correction, equivalence, or supersession.
3. **A → C:** thematic relationship only until a source supplies a mapping from `(rho,v,Phi,chi)` to `(g,u,theta,J)` and reproduces the stationarity equations.
4. **C → current finite-core H(s)H:** no automatic edge. A current translation must separately identify worldtube core, centerline limit, cross-section, dynamics, readout, and known-physics limit. Historical prevalence does not supply that bridge.

## Paper admission gate

Node C may enter the Nov. 30 or Dec. 14 source genealogy, but not an empirical model section, until all of the following are explicit:

1. Choose whether `J` is external, independently varied, or derived from a varied `B` potential.
2. Supply the global/defect construction that makes holonomy nontrivial and makes `F.J` well-defined.
3. Declare dimensions and normalize every action block.
4. Derive, rather than announce, the propagating spectrum and boundary conditions.
5. Identify an actual measured system/dataset, units and uncertainties before any physical calculation; separate fitted coefficients from held-out predictions.
6. Obtain independent review of source lineage and the corrected action before manuscript promotion.

Until then: **HISTORICAL RECOMPOSITION / LOCAL HOLONOMY CLAIM FAILS / FIELD STATUS UNRESOLVED / DIMENSIONAL CLOSURE UNRESOLVED / NO PHYSICAL TEST**.

## Return cursor

Mercer should independently audit this typed genealogy against the two 50-source NotebookLM collections and original Git blobs, without treating NotebookLM summaries as authority. The highest-value discriminator is whether an original source supplies a non-exact gauge connection or a regulated defect current that repairs Node C without importing new machinery. Preserve all three families even if only one is later selected.

Publication and identity claims remain bounded: public-safe source review only, no private excerpts, no protected signet, no claim of cross-thread delivery.
