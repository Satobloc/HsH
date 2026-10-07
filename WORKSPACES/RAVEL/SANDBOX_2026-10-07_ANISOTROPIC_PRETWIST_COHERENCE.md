# Ravel sandbox — anisotropic pre-twist coherence

**Date:** 2026-10-07  
**Status:** `GEN/CANDIDATE`  
**Scope:** finite-core worldtube mechanics; open segment; weak constitutive anisotropy  
**Question:** after uniform pre-twist proved gauge-removable for an isotropic material frame, what is the smallest structure that can make that pre-twist observable?

Nothing here is promoted to canonical H(s)H. Historical constants and particle labels were not used as targets.

## Result in one sentence

An anisotropic finite core makes uniform pre-twist spectrally visible only through a coherence form factor; at specific total twists the leading splitting cancels even though both anisotropy and pre-twist are nonzero.

## 1. Controlling premises

1. The modeled object is a finite-core worldtube history; H(s)H is its representation, not the object itself.
2. The benchmark mechanics is an elastic finite segment with a transported material frame.
3. Carrier mechanics, boundary conditions, and the resolving map remain separate.
4. The current correction is respected: time-normal rotation/torsion is a metric/transport question, not the rejected `H_0+c` or dual-shell construction.
5. The previous Ravel calculation established a null result: on an open isotropic segment with covariant free ends, constant pre-twist is gauge-removable.

## 2. Independent construction

Let one real two-component root sector of the material-frame perturbation be

\[
\xi(s,t)\in\mathbb R^2,
\qquad
D_s\xi=(\partial_s+\delta J)\xi,
\qquad
J=\begin{pmatrix}0&-1\\1&0\end{pmatrix}.
\]

Here \(\delta\) is a uniform frame rotation per unit length. Replace the previous scalar stiffness by the smallest anisotropic constitutive tensor,

\[
\mathsf C_{\rm body}
=c_{\rm iso}
\begin{pmatrix}
1+\varepsilon_C&0\\
0&1-\varepsilon_C
\end{pmatrix},
\qquad |\varepsilon_C|\ll1.
\]

The quadratic strain energy is

\[
E[\xi]=\frac12\int_0^L
(D_s\xi)^T\mathsf C_{\rm body}(D_s\xi)\,ds.
\]

Gauge away the connection with

\[
\eta(s)=e^{\delta Js}\xi(s).
\]

Then \(D_s\xi=e^{-\delta Js}\eta_s\), but the constitutive tensor becomes spatially rotating:

\[
E[\eta]=\frac12\int_0^L
\eta_s^T\mathsf C(s)\eta_s\,ds,
\]

\[
\mathsf C(s)=e^{\delta Js}\mathsf C_{\rm body}e^{-\delta Js}.
\]

This isolates the actual mechanism. The connection alone remains removable. It becomes observable only relative to material axes that are not rotationally degenerate.

The natural free-end condition is

\[
\mathsf C(s)\eta_s=0
\quad\Longleftrightarrow\quad
\eta_s=0
\qquad(s=0,L).
\]

## 3. Weak-anisotropy splitting

For the unperturbed Neumann mode

\[
\phi_n(s)=\cos(q_ns),
\qquad q_n=\frac{n\pi}{L},
\]

the two polarizations are degenerate. First-order degenerate perturbation theory gives

\[
\lambda_{n,\pm}
=c_{\rm iso}q_n^2
\left[1\pm\varepsilon_C|F_n(x)|\right]
+O(\varepsilon_C^2),
\qquad x=\delta L,
\]

where

\[
F_n(x)=
\frac{\int_0^L\sin^2(q_ns)e^{2i\delta s}\,ds}
{\int_0^L\sin^2(q_ns)\,ds}.
\]

The integral reduces to

\[
\boxed{
|F_n(x)|=
\left|
\frac{n^2\pi^2\sin x}
{x(n^2\pi^2-x^2)}
\right|
}
\]

with the removable limits

\[
|F_n(0)|=1,
\qquad
|F_n(n\pi)|=\frac12.
\]

Thus

\[
\boxed{
\lambda_{n,+}-\lambda_{n,-}
=2c_{\rm iso}q_n^2\varepsilon_C|F_n(\delta L)|
+O(\varepsilon_C^2)
}.
\]

For an inertial law with scalar inertia \(\mathcal I\), the corresponding difference in squared resonance frequencies is

\[
\Delta\omega_n^2
=\frac{2c_{\rm iso}q_n^2}{\mathcal I}
\varepsilon_C|F_n(\delta L)|
+O(\varepsilon_C^2).
\]

The pinning and scalar damping terms cancel from the paired difference at this order.

## 4. Magic-twist cancellation

For mode \(n\), the leading anisotropic split vanishes whenever

\[
\delta L=m\pi,
\qquad m\in\mathbb Z,\quad m\ne0,n.
\]

This is not restoration of isotropy. It is coherent averaging: the rotating hard and soft axes contribute equal first-order weight over that mode.

Consequences:

- observing splitting is evidence for a frame-fixing constitutive structure;
- failing to observe splitting at one length is not evidence for isotropy;
- changing the effective length moves \(x=\delta L\) and should reveal the cancellation pattern;
- a resolver may change modal weights, but a carrier-level constitutive spectrum should retain the same zeros.

## 5. Numerical finite-element test

I discretized

\[
-\partial_s\!\left(\mathsf C(s)\partial_s\eta\right)
=\lambda\eta
\]

with 180 linear elements and natural free ends. The sandbox parameters were

\[
L=1.2,
\quad c_{\rm iso}=0.06,
\quad\varepsilon_C=0.02.
\]

For the first positive mode:

| Total twist \(x/\pi\) | FEM normalized split | First-order result |
|---:|---:|---:|
| 0 | 1.000025 | 1 |
| 1 | 0.499733 | 0.5 |
| 2 | \(1.388\times10^{-6}\) | 0 |
| 3 | \(8.677\times10^{-8}\) | 0 |

Across \(0\le x\le4\pi\), the maximum absolute error in the normalized first-order curve was \(2.85\times10^{-4}\).

With \(\varepsilon_C=0\), the largest numerical polarization split across four tested twist totals was only \(3.16\times10^{-12}\), directly reproducing the isotropic gauge-removal null result.

At the first magic twist \(x=2\pi\), the residual normalized split scaled as

\[
\text{residual}\propto\varepsilon_C^{1.9974},
\]

so the raw eigenvalue split is approximately cubic in \(\varepsilon_C\) there. The first-order cancellation is therefore not a numerical near miss.

## 6. Translation into current H(s)H language

### Source facts retained

- The fresh archive source treats the UI as a trajectory generator while leaving the action measure open, and explicitly permits that measure to depend on tangent, curvature, and local torsion.
- The fresh H(s)H roundup inspected after this construction uses a scalar filament stiffness and an orientation-dependent coupling, but packages them with lattice, fixed constants, particle fits, and closure claims that are not current controls.

### Current inference

The scalar stiffness used in the preceding finite-rod model is sufficient for a resonance ladder but cannot make an open segment's uniform pre-twist observable. The smallest productive extension is not another force or shell; it is a constitutive operator with unequal material directions.

### New sandbox conjecture

If an H(s)H finite core has persistent transverse structure, its observable torsion may be relational:

\[
\text{frame transport}
+\text{constitutive anisotropy}
+\text{boundary/intersection coherence}.
\]

No term alone is enough. In particular, a visually twisting centerline or frame need not leave a spectral signature.

## 7. Discriminator

Measure the lowest polarization pair for several controlled effective lengths \(L_j\). After removing the common affine \(q_n^2\) ladder, fit

\[
\frac{\Delta\omega_n^2}{q_n^2}
=A_C|F_n(\delta L)|,
\qquad
A_C=\frac{2c_{\rm iso}\varepsilon_C}{\mathcal I}.
\]

A constitutive-pre-twist mechanism must satisfy all of the following:

1. one \(\delta\) predicts the length-dependent zeros and half-amplitude point;
2. one amplitude \(A_C\) predicts every measured mode after its known \(n\)-dependent form factor is used;
3. resolver changes alter visibility/weights but not the zero locations;
4. the isotropic limit continuously removes the split.

## 8. Failure conditions

Reject or revise this architecture if:

- splitting persists as \(\varepsilon_C\to0\) on an open covariant segment;
- the zeros do not track \(\delta L=m\pi\);
- different modes require unrelated pre-twist rates;
- changing the resolving geometry moves carrier pole locations;
- endpoint clamps, detector orientation, or an unmodeled defect explain the split equally well;
- the inferred tensor is not positive definite.

## 9. Next solver test

Blindly generate spectra with unknown \((\delta,\varepsilon_C,c_{\rm iso}/\mathcal I)\), fit only two lengths, and predict a third length chosen near a magic-twist zero. Repeat with rotated detector tensors. A genuine constitutive carrier signature should preserve the zero while detector rotation changes only recovered amplitudes and modal weights.

## 10. Reading and provenance record

### Controlling/routing sources refreshed

- `HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — complete.
- `HsH/WORKSPACES/COMMON/REFERENCE_DESK/README.md` — complete overview.
- Current onboarding, symbol, citation, toolbox, workflow-orientation, branching, and `🔑/🔑.md` pointers were refreshed before construction.
- HSH_RESOURCES toolkit index, toolkit digestion plan, root index, Tool Chest, Nathan preference router, and War Room declaration were reviewed as routing/tool surfaces only.

### Fresh SAT archive source

- `SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — BYO LAGRANGIAN.txt`, blob `47ee684888525d9d71a6dd701041685681f3dc49`, complete 4,178 decoded characters.
  - Retained: fixed \(\mathbb R^4\) reference axes, \(SO(4)\) trajectory generation, the separation between generator and action measure, and permission for a path functional to depend on tangent, curvature, and local torsion.
  - Quarantined: linear radial expansion as a timewave, zero-mass vacuum assertions, particle-identity language, and the claim that a valid closure spectrum should reproduce a particular known spectrum.
  - Translation: the present constitutive tensor is one explicitly declared action measure on a generated framed path; it is not claimed to follow from the UI itself.

### Fresh H(s)H source

- `HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/Interconn.txt`, blob `02312fbb23167e8ce1c996451199ee0e498437b1`, complete 24,633 decoded characters.
  - Retained only: persistent filament geometry, a quadratic stiffness term, and the need for an orientation-sensitive interaction.
  - Quarantined: 24-cell/HSUCV primacy, fixed constants, particle and mass assignments, claimed force closure, threshold claims, and numerical matches.
  - Role here: negative control after the independent construction. Its scalar stiffness cannot produce the anisotropic coherence law derived above.

### Mersearch request

- Request ID: `2026-10-07-ravel-anisotropic-core-spectrum-001`.
- Query: `(anisotrop* OR elliptic* OR oval OR ribbon OR cross-section OR stiffness OR bending) AND (torsion OR twist OR frame OR worldtube OR filament OR rod OR tube)`.
- Stable engine: `Mercer_Searcher_1.0`, pinned commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.

## 11. Reproducibility

- Solver: `WORKSPACES/RAVEL/CODE/anisotropic_pretwist_spectrum.py`
- Data: `WORKSPACES/RAVEL/DATA/anisotropic_pretwist_spectrum.json`
- Class-P diagnostic: `WORKSPACES/RAVEL/FIGURES/anisotropic_pretwist_spectrum.svg`
