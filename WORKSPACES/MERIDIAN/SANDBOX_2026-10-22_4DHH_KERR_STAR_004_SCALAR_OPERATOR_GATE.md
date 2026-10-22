# STAR 004 | Rotating Kerr-oblate worldtube: the exact scalar comparator and the missing physical dynamics

**2026-10-22 | Meridian | mathematical sandbox, NOT EFT or particle-spectrum recovery**

## Mandatory sources and precedence
Read current BEDROCK and AGENTS.md. The SAT archive is the second technical authority after BEDROCK. Existing Kelvin-vortex medium, literal spin, precession/shelf-cocking and time interpretations cannot be silently omitted; no new physical laws may be inserted merely to manufacture predictions.
Read the original `SAT O Derivations/SAT_D2_MODE_EXPANSION.txt` (historic filament tension kernel and linear dispersion), `SAT_D4_STRAIN_CURVATURE_MAPPING.txt`, `SAT_D5_GAUGE_TOPOLOGY.txt`, and Ravel's `KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md`. Read HsH coil-let/bosonic-wave structural candidate lab, high-priority but unresolved. Bounded connector search of Kelvin-wave source families performed; no published output or calculated medium law has been silently promoted. Shared Mersearch slot remains occupied by Orson's 2026-10-21 request: NO Mersearch run claimed.

## Kinematic geometry and exact operator
Carry forward the previous finite-radius oblate *comparison* surface, not a physical Kerr metric or the complete four-spatial-dimensional 4DHH native geometry. At fixed r, define E=r²+a² cos²θ and S=(r²+a²) sin²θ. Induced Lorentzian worldvolume metric:
```
ds²_worldvolume = -c² dt² + E dθ² + S (dφ + Ω dt)².
```
Exact inverse h^{tt}=-1/c², h^{tφ}=Ω/c², h^{φφ}=1/S-Ω²/c², h^{θθ}=1/E; determinant -c² E S. For constant Ω, the purely geometric d'Alembertian acting on scalar functions is
```
Box_h = -(1/c²) (∂t - Ω ∂φ)²
        + (1/√(ES)) ∂θ[√(S/E) ∂θ]
        + (1/S) ∂φ².
```
It is coordinate-equivalent to `-∂t²/c² + Δ_Σ` on a static oblate surface. Setting `Box_h f=0` as an *actual physical wave equation* would add a dynamical assumption not supplied by geometry alone: **there is NO claimed physical SAT excitation or frequency**. The operator is a standard scalar comparator only.

## Separation and the rotation-sign check
For eigenmodes f=e^{-iωt+imφ} Y(θ), and -Δ_Σ Y=λ Y, the **conditional** scalar equation Box_h f=0 gives:
```
(ω + m Ω)² = c² λ;  ω = -m Ω ± c√λ.
```
The -mΩ term is exactly a rotating-coordinate frequency shift, not Kerr frame dragging or a new physical coupling. A sign mismatch can arise from using φ as inertial angle instead; coordinate conventions must be explicit.

## First-order intrinsic spectral terms inherited from STAR 003
Let ε=a²/r² small. Spatial geometric eigenvalues:
```
λ_10 r² = 2 - (4/5)ε + O(ε²)
λ_1±1 r² = 2 - (8/5)ε + O(ε²)
λ_1±1 - λ_10 = -4a²/(5r⁴) + O(a⁴/r⁶).
```
These are geometric spectral values with units length^-2, not physical frequencies. Directly reused and independently recomputed in executed SymPy script.

## Critical comparison to original SAT.O / Blockwave
SAT.O D2 uses `K=-T ∂λ²` and the *dynamical* wave relation `ω_k=|k|√(T/m)`; its T/m encodes a propagation law and cannot be borrowed. The oblate Laplacian recovers a geometric spatial kernel on the chosen finite cross section but NOT its physical time normalization, quantum commutators, mode labels, or the whole 4DHH dynamics. The old theory's actual Kelvin-like constitutive response has to be recovered on its own terms. The new coil-let lab calls for traveling higher-order coils and a closure invariant; that excitation topology does not follow from scalar Laplacian eigenfunctions. Therefore scalar modes are a comparison control, **not** a demonstration of physical photoneutrino modes.

## Geometry/electrogravity/flavor fail-rigid gates
1. Recover the explicitly existing medium propagation equation or circulation invariant from the archive, including boundary conditions and type-checked physical units. If wave speed differs from c, record why the actual medium produces it rather than inserting v by hand.
2. Establish embedding of a material Kerr-associated finite worldtube (spatial section plus internal 4DHH coiling) into the native 4D geometry: the current model's rigid azimuthal chart is pure reparameterization of a static surface history.
3. Propagate inherited literal spin J, gyro/magnetic moment μ, and (gsimeq2) control; account for electron overextreme classical Kerr-Newman and lack of physical horizon.
4. Establish the local time normal vs circulating bulk transport and Frobenius integrability; do not identify them automatically.
5. Tie rung precession/shelf-cocking and operator holonomy to the same intrinsic/extrinsic geometry, then independently test particle-sector frequencies/statistics.
6. Hold out experimental values until dimensionless closure; never quietly fit free EFT coefficients.

## Execution and exact checks
Real local run of Python+SymPy `/mnt/data/hsh_star_004_operator.py` (attached to this conversation) confirmed determinant, inverse components, Fourier time symbol and both STAR 003 first-order rational coefficients. The initial script run caught a mistaken sign expectation in an assertion; corrected and reran. The verified time symbol on e^{-iωt+imφ} is `+(ω+mΩ)²/c²`, yielding the dispersion equation above when combined with spatial eigenvalue `-λ`. No external Einstein-Maxwell or Kelvin dynamics was solved.

**Verdict:** Full geometric kinematic scalar operator recovered exactly, and its coordinate-rotation contribution distinguished from physical dynamics. *Not* an EFT or physical mode-spectrum derivation. The next real physics step is archive recovery and calculation of the existing Kelvin/4DHH transport/response operator, not invention of a new wave action.
