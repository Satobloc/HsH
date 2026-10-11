# Ravel sandbox — boundary morphology and the fourth-order memory gate

**Date:** 2026-10-11  
**Namespace:** `LOCAL:RAVEL-BCNL`  
**Status:** `GEN/CANDIDATE`; synthetic mechanics, not SAT/H(s)H evidence or a physical claim  
**Question:** Does the fourth-order contact architecture recovered in the preceding contact-closure build actually isolate one contact coordinate once the finite-core contact morphology and unloading law are specified?

## 1. Routing and source record

The live project front door, cross-formalism index, symbol controls, reference-desk route, toolbox ingestion control, and toolbox namespace ledger were checked before construction. The shared Mersearch request slot remained occupied by `2026-10-10-orson-one-drop-universe-math-001`; it was not overwritten. Direct repository retrieval was used only after that check.

### Old SAT archive — read in full

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-O Theory Work/pre-mathproofBAK.txt`

What was actually read: the entire 2025-06-22 mathematical pull-out. Relevant recovered pieces were:

1. the curvature-squared filament weight
   \[
   \mu[\gamma]\propto
   \exp\!\left[-2\int\|\ddot\gamma\|^2d\lambda\right];
   \]
2. an explicit four-coordinate oscillatory/hyperhelical embedding;
3. the linear tension kernel
   \[
   K_{\mu\nu}(\lambda,\lambda')
   =-T\delta_{\mu\nu}\partial_\lambda^2
   \delta(\lambda-\lambda');
   \]
4. the corresponding string-like dispersion
   \[
   \omega_n=|k_n|\sqrt{T/m}.
   \]

The file is a generated compilation, not a verified derivation. Its direct particle assignments, fitted constants, mass formulae, gauge identifications, and prediction claims remain `GEN/HISTORICAL` or `GEN/QUARANTINED`. None was used as a target here.

### H(s)H September 30 source — read in full

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`

What was actually read: lines 1–980, followed by an empty 1001–1500 request confirming EOF. Relevant pieces were:

1. finite-core carrier \(\Gamma\) kept distinct from its timesheet intersection operator;
2. exact straight-vibrating-filament to helical-intersection construction;
3. a reciprocal timesheet energy containing both tension and bending,
   \[
   E_\Sigma=\frac12\int d^3x
   \left[\rho_\Sigma\dot h^2+T_\Sigma|\nabla h|^2
   +B_\Sigma(\nabla^2h)^2\right];
   \]
4. the resulting \(\nabla^4h\) term and bending crossover
   \(\ell_b=\sqrt{B_\Sigma/T_\Sigma}\);
5. explicit warnings that the scalar sheet model is not GR and that bending dispersion and damping face independent observational gates.

This source supplies precedent for a fourth-order *timesheet* term. It does not prove that a local finite-core contact skin has the same constitutive coefficient or boundary conditions.

## 2. Independent construction before cross-pollination

The previous second-order contact operator failed because

\[
\frac{r_2}{r_1}=\frac{1+4q}{1+q}<4.
\]

The smallest local fourth-order replacement is the convex energy

\[
E[h]=\int_0^L
\left[
\frac{A_0}{2}h^2+
\frac{D_4}{2}(h_{ss})^2-fh
\right]ds,
\]

with gradient flow

\[
\eta_h h_\tau=-A_0h-D_4h_{ssss}+f.
\]

All symbols in this note are local:

| Symbol | Type and role | Dimensions |
|---|---|---|
| \(h(s,\tau)\) | scalar normal contact deformation | length or normalized amplitude |
| \(s\in[0,L]\) | intrinsic contact-support coordinate | length |
| \(A_0\) | local restoring coefficient | energy/(length·\(h^2\)) |
| \(D_4\) | contact-support bending coefficient | such that \(D_4h_{ssss}\) matches \(A_0h\) |
| \(d_4=D_4/(A_0L^4)\) | normalized bending | dimensionless |
| \(\eta_h\) | relaxation coefficient | chosen consistently with \(h_\tau\) |
| \(\beta_n\) | dimensionless boundary eigenvalue | dimensionless |

For a biharmonic eigenmode,

\[
\frac{r_n}{A_0/\eta_h}=1+d_4\beta_n^4.
\]

The scalar-closure gate is predeclared as

\[
G_{21}:=\frac{r_2}{r_1}\ge10.
\]

## 3. Boundary-condition minimal set

The first two dimensionless wavenumbers and the resulting gate are:

| Contact morphology | \((\beta_1,\beta_2)\) | \(G_{21}\) ceiling | Minimum \(d_4\) for 10× | \(G_{21}\) at \(d_4=0.02\) |
|---|---:|---:|---:|---:|
| Periodic closed rim | \((0,2\pi)\) | unbounded | 0.00577462 | 32.17091 |
| Hinged open patch | \((\pi,2\pi)\) | 16 | 0.01539897 | 10.91212 |
| Clamped–clamped patch | \((4.7300407,7.8532046)\) | 7.59850 | impossible | 6.99925 |
| Cantilever patch | \((1.8751041,4.6940911)\) | 39.27395 | 0.02486908 | 8.58721 |
| Free–free open patch | \((0,0)\) | 1 | impossible | 1 |

Numeral-by-numeral:

### Periodic closed rim

The retained coordinate is the uniform circumferential mode. The first shape mode has \(\beta=2\pi\):

\[
d_4\ge\frac{10-1}{(2\pi)^4}
=\frac{9}{1558.5454565}
=0.0057746150.
\]

The \(n=\pm1\) real sine/cosine pair is degenerate, but both are fast; the slow uniform coordinate remains unique.

### Hinged open patch

\[
\frac{1+16\pi^4d_4}{1+\pi^4d_4}\ge10
\]

gives

\[
d_4\ge\frac{9}{6\pi^4}
=\frac{1.5}{\pi^4}
=0.0153989734.
\]

At \(d_4=0.02\),

\[
r_1/(A_0/\eta_h)=2.94818182,
\]

\[
r_2/(A_0/\eta_h)=32.17090913,
\]

\[
G_{21}=10.91211841.
\]

### Clamped–clamped patch

Even as \(d_4\to\infty\),

\[
G_{21}\to
\left(\frac{7.8532046}{4.7300407}\right)^4
=7.59850454<10.
\]

No amount of pure bending stiffness passes the declared gate.

### Cantilever patch

\[
d_4\ge
\frac{9}{4.6940911^4-10(1.8751041)^4}
=0.0248690792.
\]

### Free–free patch

Constant and linear/tilt profiles both have zero curvature. The restoring term gives both the same rate \(A_0/\eta_h\), so

\[
G_{21}=1.
\]

Fourth-order stiffness cannot reduce the state to one coordinate unless another mechanism removes the affine mode.

## 4. Geometry translation into present H(s)H language

Conditional on the local-support model:

- If \(s\) parameterizes a closed transverse contact rim \(S^1\), the natural slow coordinate is mean rim compression. Periodicity can isolate it from nonuniform shape modes.
- If \(s\) parameterizes an open axial scar/contact patch with free ends, both offset and tilt remain soft. At least two contact coordinates survive.
- If both ends are fully clamped, bending alone cannot produce the selected 10× gap; its modal ratio has the hard ceiling 7.5985.
- A one-end-anchored patch can pass, but only beyond a larger normalized bending threshold.

This is a morphology discriminator. “The contact has bending stiffness” is incomplete; closure depends on whether the support is a closed rim, hinged patch, clamped patch, cantilever patch, or free patch.

## 5. Nonlinear unloading minimal pair

Mode isolation is not the same as persistent memory.

For the passing hinged fixture \(d_4=0.02\), project onto its normalized first mode \(\phi=\sqrt2\sin\pi s\), for which

\[
\int_0^1\phi^4ds=\frac32.
\]

### Convex nonlinear contact

Use

\[
U_c(a)=\frac{\lambda_1}{2}a^2+
\frac{gC_4}{4}a^4-F(\tau)a,
\]

with \(\lambda_1=2.94818182\), \(g=2\), \(C_4=3/2\), and a load \(F=5\) from \(\tau=1\) to \(4\).

Numerical integration gives:

- maximum loaded amplitude: \(0.91540347\);
- amplitude at \(\tau=15\): \(5.54\times10^{-15}\).

It returns to the unique minimum. The fourth-order mode gap validates a scalar reduction, but it does not create retention.

### Explicit bistable comparator

Use the deliberately different storage architecture

\[
U_b(a)=\frac{g}{4}(a^2-a_0^2)^2-F(\tau)a,
\]

with \(g=4\), \(a_0=1\). The positive-load spinodal is

\[
F_c=\frac{2ga_0^3}{3\sqrt3}
=1.53960072.
\]

Applying \(F=2>F_c\) over the same interval moves the state from \(a=-1\) to the positive well. After unloading, the computed amplitude is \(a=1.00000000\).

This comparison does not promote a double well into H(s)H. It identifies the missing logical ingredient: persistent contact state needs non-convexity, pinning, topology, or an independently conserved coordinate in addition to spectral isolation.

## 6. Cross-pollination after the construction

The old archive and September specification now have a precise limited use:

- the archive curvature-squared action provides historical SAT precedent for fourth-order geometry;
- the September timesheet energy provides a current sandbox precedent for tension-plus-bending response;
- neither fixes the local contact support, \(D_4\), or its boundary conditions;
- the local boundary calculation therefore remains `GEN/CANDIDATE`, not a recovered SAT result.

The global timesheet field \(h(\mathbf x,\tau)\), the filament centerline \(\gamma(\lambda)\), and the local contact deformation \(h(s,\tau)\) are three different objects. Identical-looking fourth derivatives do not establish semantic identity.

## 7. Failure conditions

Reject the scalar contact-memory architecture if any of the following holds:

1. the actual finite-core contact support is open and free, leaving two affine soft modes;
2. the support is clamped–clamped and no additional operator raises its spectral ceiling above 7.5985;
3. a nominally periodic rim does not couple to its uniform mode;
4. the fourth-order coefficient lacks a constitutive source in the modeled tube/sheet geometry;
5. cyclic unloading of the derived convex energy returns to one state, while persistent history is required;
6. the spectral gap or modal participation fails under mesh refinement and geometric perturbation.

## 8. Tight next calculation

Build three explicit finite-core contact geometries with no fitted mode coefficients:

1. closed circumferential rim \(S^1\);
2. free open axial patch;
3. one-end-anchored axial patch.

For each, derive the boundary terms directly from the same tube–timesheet energy, compute the coupled director/contact Hessian, and measure:

- number of contact-dominated modes below the director cutoff;
- \(r_2/r_1\);
- load residue of the candidate slow mode;
- retained deformation after a full load–unload cycle.

**Prediction candidate:** if the closed-rim interpretation is the right finite-core morphology, a single mean-compression mode should survive while nonuniform circumferential modes move above the gap. If open/free contact is correct, at least two slow contact coordinates should remain. This is a direct solver-level discriminator between competing worldtube morphologies.

## 9. Reproducible artifacts

- `WORKSPACES/RAVEL/CODE/fourth_order_boundary_memory_gate.py`
- `WORKSPACES/RAVEL/DATA/fourth_order_boundary_memory_gate.json`
- `WORKSPACES/RAVEL/FIGURES/fourth_order_boundary_memory_gate.svg`

