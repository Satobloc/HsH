# Ravel sandbox | worldline-stiffness repair and contact-relaxation minimal pair

**Status:** SILOED PLAYGROUND / mathematical repair fixture. Not canonical SAT or H(s)H theory, not a particle model, and not evidence for a new interaction. All symbols are local.

## Result

The old identification \(EI=Mc^2\) conflates rest energy, beam rigidity, and coordinate-path curvature. The smallest repair gives finite-core bending its own derived length scale and contact deformation its own relaxation coordinate. The repaired contact model has the same static susceptibility as an enslaved-contact model but generically has two relaxation poles rather than one.

## Source ledger — exact paths and reading

### Historical/archive source

- 'Satobloc/SAT_THEORY_ARCHIVE_2023-25/PRE_HSH_ROUNDUP/3 H(S)H EQUATION ROUNDUP.txt'
- Substantially read lines 850–1200 after scanning the file in 300-line blocks.
- Extracted: solid-shell/liquid-core angular-momentum partition; low-viscosity shear boundary; proposed drag \(\Gamma\); material frame \(E(\rho)\in\mathrm{Gr}(3,6)\); claimed metastable twist-to-writhe transition; \(\kappa\approx v^2/(c^2r)\); and \(EI\equiv Mc^2\).
- Provenance: mixed Nathan and NotebookLM/assistant material. Assistant mathematics is not treated as Nathan-authored or canonical.

### Current H(s)H / September 30 source

- 'Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STATE OF SAT.txt'
- Read lines 1–320; scanned blocks through line 10,780; substantially read lines 10,250–10,780.
- Extracted: broad ontology may survive while old implementations change; proposed \(u^\mu u_\mu=-1\); a schematic gradient action; an elliptic-looking Euler–Lagrange equation; and the numerical instruction to evolve \(u^\mu\) by “relaxation or finite-difference update” then project to the unit hyperboloid.
- Provenance: unproved conversation proposals. “Relaxation” is not a constitutive law until its mobility/dissipation operator and timescale are specified.

### New-upload/routing review

- Reviewed 'Satobloc/HsH/indexes/mersearch_requests/2026-10-10-orson-one-drop-universe-math-001/SEARCH_RESULTS.md', including the overlap-potential hit in 'DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/[🗄️] 🍩 ONE DROP UNIVERSE__NotebookLM_export.json' at '$.messages[25].text'.
- Candidate discovery only. The export has unreliable role labels; constants and particle claims were not imported.
- Fresh request issued: '2026-10-11-ravel-contact-relaxation-hysteresis-001'. Results were pending at checkpoint time.

## 1. Source facts, inference, conjecture

**Source facts.** The archive construction represents persistent matter as a finite 4D worldtube, lets nested layers exchange angular momentum through a shear boundary while conserving the total, and tries to explain delayed reorientation with stiffness plus viscous drag. It compresses this into

\[
\kappa\approx\frac{v^2}{c^2r},\qquad EI\equiv Mc^2.
\]

**Ravel inference.** The first expression is trajectory curvature in a chosen spatial slicing, not automatically invariant relativistic curvature. The second is dimensionally inconsistent for ordinary beam rigidity.

**New sandbox conjecture.** A finite-core representation needs three typed objects: centerline motion, finite-core bending, and contact-layer relaxation. A two-coordinate linear contact system is the smallest nontrivial test.

## 2. Repair the curvature

For timelike centerline \(X^\mu(\tau)\),

\[
U^\mu=\frac{dX^\mu}{d\tau},\qquad A^\mu=\frac{dU^\mu}{d\tau},
\qquad \kappa_{\rm p}=\frac{\sqrt{A^\mu A_\mu}}{c^2}.
\]

A freely falling body in GR has \(A^\mu=0\), hence \(\kappa_{\rm p}=0\), even when its coordinate track looks curved. An orbit therefore does not itself prove elastic worldtube strain. H(s)H must distinguish invariant proper curvature, extrinsic curvature in an additional physical embedding, and slice/readout curvature.

## 3. Repair the dimensions numeral by numeral

For a spatial elastic rod,

\[
E_{\rm bend}=\frac12\int B\kappa^2\,d\ell.
\]

Since \([E]={\rm J}\), \([d\ell]={\rm m}\), and \([\kappa^2]={\rm m}^{-2}\),

\[
[B]={\rm J\,m},
\qquad [Mc^2]={\rm J}.
\]

Thus \(B=EI=Mc^2\) is missing one length. The least committal repair is

\[
B=\zeta Mc^2\ell_*,
\]

where \(\ell_*\) is independently derived from finite-core geometry/constitutive mechanics. This is dimensional permission, not a derivation.

A typed proper-time rigidity term is

\[
S_{\rm rig}=\frac12\int d\tau\,Mc^2\ell_*^2\kappa_{\rm p}^2.
\]

The new scale cannot be deleted without changing the equation’s type. For a finite normal cross-section \(\mathcal C\), the geometric ingredient is a second moment

\[
I_\perp=\int_{\mathcal C}\xi_\perp^2\,d^3\xi,
\]

and a constitutive modulus is still needed before \(I_\perp\) becomes stiffness.

## 4. Minimal pair: enslaved versus relaxing contact

Let \(x\) be one soft director/wall coordinate and \(y\) one contact-pad/sheath coordinate. Use common energy and Rayleigh dissipation

\[
E=\frac12ax^2+cxy+\frac12by^2-F(t)x,
\qquad
\mathcal R=\frac12\eta_x\dot x^2+\frac12\eta_y\dot y^2.
\]

Then

\[
\eta_x\dot x+ax+cy=F(t),\qquad
\eta_y\dot y+cx+by=0.
\]

This is the one-mode Hessian reduction of the previous deformable-contact field:

\[
a=\langle\phi,H_{\psi\psi}\phi\rangle,\quad
b=\langle\chi,H_{hh}\chi\rangle,\quad
c=\langle\phi,H_{\psi h}\chi\rangle.
\]

### Pair A — contact enslaved

With \(\eta_y=0\),

\[
y=-\frac cbx,\qquad
E_{\rm eff}=\frac12\left(a-\frac{c^2}{b}\right)x^2-Fx.
\]

Thus \(a_{\rm eff}=a-c^2/b\), the one-mode form of the prior negative-definite pad backreaction.

### Pair B — contact relaxes independently

For \(F(t)=\Re(F_0e^{i\omega t})\),

\[
\chi_{\rm full}(\omega)
=\frac{b+i\omega\eta_y}
{(a+i\omega\eta_x)(b+i\omega\eta_y)-c^2},
\]

whereas

\[
\chi_{\rm enslaved}(\omega)
=\frac{1}{a-c^2/b+i\omega\eta_x}.
\]

They share

\[
\chi_{\rm full}(0)=\chi_{\rm enslaved}(0)
=\frac{1}{a-c^2/b}.
\]

The full positive decay rates are

\[
r_\pm=
\frac{a\eta_y+b\eta_x
\pm\sqrt{(a\eta_y+b\eta_x)^2
-4\eta_x\eta_y(ab-c^2)}}
{2\eta_x\eta_y}.
\]

## 5. Numerical fixture, numeral by numeral

Choose audit values only:

\[
a=3,\quad b=2,\quad c=1,\quad\eta_x=1,\quad\eta_y=5.
\]

No historical constant or particle label was targeted.

Stability:

\[
ab-c^2=(3)(2)-1^2=5>0.
\]

Stiffness eigenvalues:

\[
\lambda(H)=\frac{5\pm\sqrt5}{2}
=1.3819660113,\ 3.6180339887.
\]

Static reduction:

\[
a_{\rm eff}=3-\frac12=2.5,\qquad \chi(0)=1/2.5=0.4.
\]

Full decay polynomial and roots:

\[
5r^2-17r+5=0,
\]

\[
r_-=\frac{17-\sqrt{189}}{10}=0.3252272915,
\qquad
r_+=\frac{17+\sqrt{189}}{10}=3.0747727085.
\]

Hence

\[
\tau_{\rm slow}=1/r_-=3.0747727085,\qquad
\tau_{\rm fast}=1/r_+=0.3252272915.
\]

The enslaved model has \(r=2.5\), \(\tau=0.4\).

At \(\omega=0.1\):

\[
|\chi_{\rm full}|=0.39389333,\quad
\arg\chi_{\rm full}=-4.91799^\circ,
\]

\[
|\chi_{\rm enslaved}|=0.39968038,\quad
\arg\chi_{\rm enslaved}=-2.29061^\circ.
\]

For unit forcing, \(|\oint x\,dF|=\pi[-\Im\chi]\):

\[
A_{\rm full}=0.10608645,\qquad
A_{\rm enslaved}=0.05018519.
\]

The independent contact coordinate makes the low-frequency loop area \(2.1139\) times larger here while leaving static compliance unchanged.

A separate DOP853 time-domain integration recovered the analytic complex
susceptibility at \(\omega=0.1,1,10\).  Relative complex errors were,
respectively, \(1.13\times10^{-14}\), \(5.52\times10^{-13}\), and
\(3.12\times10^{-4}\) for the full model (the high-frequency value is limited
by the fixed sampling window).  The enslaved-model errors were
\(9.06\times10^{-15}\), \(4.84\times10^{-13}\), and \(2.66\times10^{-4}\).

## 6. What this does not generate

For \(F=0\),

\[
\frac{dE}{dt}=-\eta_x\dot x^2-\eta_y\dot y^2\le0.
\]

If \(a>0\), \(b>0\), and \(ab-c^2>0\), the origin is the unique minimum. This model gives phase lag and a finite-frequency loop, but **not remanent memory**; loop area vanishes as \(\omega\to0\).

Repair rule:

- relaxation gives delayed response;
- persistent hysteresis needs non-convex energy, pinning/inequality constraint, topology, or an independently retained variable.

Calling a finite-rate loop “memory” without checking its zero-rate limit is insufficient.

## 7. Failure conditions

1. \(ab-c^2\le0\): no stable local equilibrium.
2. Different \(\chi(0)\): not a kinetic minimal pair; static energy/calibration changed.
3. Only one broad-band ring-down pole: no evidence for an independently relaxing contact mode in that bandwidth.
4. Remanence at zero rate: convex two-coordinate gradient model falsified; a real retention mechanism is missing.
5. Annular/parity-symmetric contact gives the same polar response as one-sided contact: selector contamination.
6. Orbital coordinate curvature is used as material strain without an embedding or constitutive map.

## 8. Tight solver/experiment candidate

At a previously computed static contact equilibrium:

1. construct \(H_{\psi\psi}\), \(H_{hh}\), and \(H_{\psi h}\);
2. project onto the softest director mode \(\phi\) and dominant contact mode \(\chi\);
3. perturb contact load sinusoidally over six frequency decades;
4. fit one-pole and two-pole models while forcing common \(\chi(0)\);
5. repeat with the annular contact null.

**Discriminator:** independent contact relaxation is supported only if a second reproducible pole improves the fit while static susceptibility remains fixed and the annular polar channel remains null.

## Artifacts

- 'WORKSPACES/RAVEL/CODE/contact_relaxation_minimal_pair.py'
- 'WORKSPACES/RAVEL/DATA/contact_relaxation_minimal_pair.json'
- generated by the script: 'WORKSPACES/RAVEL/FIGURES/contact_relaxation_minimal_pair.svg'

## Next cursor

Replace the illustrative \(a,b,c,\eta_x,\eta_y\) by mode projections from the full deformable-contact field solution. Test whether the second pole survives grid refinement and whether apparent remanence collapses under an adiabatically slow cycle.
