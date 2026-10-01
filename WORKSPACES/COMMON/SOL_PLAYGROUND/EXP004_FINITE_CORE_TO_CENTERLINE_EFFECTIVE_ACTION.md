# EXP004 — Finite Core → SAT Centerline Effective Action

**Date:** 2026-10-01  
**Status:** sandbox effective-theory derivation  
**Question:** can SAT be recovered as a controlled effective limit of H(s)H by eliminating finite-core degrees of freedom?

---

## 1. Starting point

Take the finite-core embedding

\[
X(s,a,t)=\gamma(s,t)+F(s,t)a,\qquad a\in B,
\]

where \(\gamma\) is the SAT-like centerline, \(F\) maps internal coordinates into the normal space, and \(B\) is the reference core.

Use a finite-core readout energy

\[
U_{\rm res}=g\int_B
W\!\left(\frac{\phi(\gamma+Fa,t)}{h}\right)da.
\]

The goal is to eliminate \((F,B,a)\) and obtain

\[
S_{\rm eff}[\gamma].
\]

---

## 2. Multipole expansion of hidden core structure

Define

\[
f(x):=W\!\left(\frac{\phi(x)}{h}\right).
\]

Expand around the centerline:

\[
f(\gamma+Fa)=
f(\gamma)
+\partial_Af\,F^A{}_ia^i
+\frac12\partial_A\partial_Bf\,F^A{}_iF^B{}_j a^ia^j
+\cdots .
\]

For a centered inversion-symmetric core,

\[
\int_B a^i da=0.
\]

Define

\[
M_0=\int_B da,
\qquad
M_2^{ij}=\int_B a^ia^j da,
\]

and the physical second moment

\[
C^{AB}=F^A{}_iM_2^{ij}F^B{}_j.
\]

Then

\[
\boxed{
U_{\rm res}
=
gM_0 f(\gamma)
+\frac g2 C^{AB}\partial_A\partial_Bf(\gamma)
+O(\epsilon^4\nabla^4f).
}
\]

Because

\[
\partial_A\partial_Bf
=
\frac{W''}{h^2}\partial_A\phi\,\partial_B\phi
+\frac{W'}h\partial_A\partial_B\phi,
\]

we get

\[
\boxed{
U_{\rm res}
=
gM_0W(\phi/h)
+\frac g2 C^{AB}
\left[
\frac{W''}{h^2}\partial_A\phi\partial_B\phi
+\frac{W'}h\partial_A\partial_B\phi
\right]_{x=\gamma}
+\cdots .
}
\]

### First result

A hidden finite core does **not** in general reduce merely to a renormalized scalar coupling. The first correction remembers the core through its quadrupole/second-moment tensor \(C^{AB}\).

For isotropic cores,

\[
C^{AB}=c_2 P_N^{AB},
\]

so only one scalar core size survives at second order.

For anisotropic cores, directional memory survives immediately.

If two centered cores have identical \(M_0\) and identical \(C^{AB}\), their first distinction appears through fourth moments.

Thus the lowest-order hidden-structure invariant is:

- second moment / quadrupole for generic centered cores;
- fourth moment if second moments are degenerate.

---

## 3. Integrating out a fast internal deformation mode

Now take a generic internal core mode \(q(s)\) coupled to centerline curvature \(\kappa(s)\):

\[
L[\gamma,q]
=
\frac A2\kappa^2
+\frac c2(q_s)^2
+\frac{m^2}{2}q^2
+\lambda q\kappa.
\]

The \(q\)-equation is

\[
(-c\partial_s^2+m^2)q=-\lambda\kappa.
\]

Hence formally

\[
q=-\lambda(m^2-c\partial_s^2)^{-1}\kappa.
\]

Substituting back gives

\[
\boxed{
L_{\rm eff}[\gamma]
=
\frac A2\kappa^2
-
\frac{\lambda^2}{2}
\kappa(m^2-c\partial_s^2)^{-1}\kappa.
}
\]

This is already nonlocal in the centerline variable.

In kernel form,

\[
L_{\rm eff}
=
\frac A2\kappa^2
-
\frac{\lambda^2}{2}
\int ds'\,K_m(s-s')\kappa(s)\kappa(s'),
\]

where

\[
K_m=(m^2-c\partial_s^2)^{-1}.
\]

### Low-gradient expansion

For wavelengths long compared with the internal correlation length

\[
\ell_q=\sqrt{c}/m,
\]

expand

\[
(m^2-c\partial_s^2)^{-1}
=
\frac1{m^2}
+\frac c{m^4}\partial_s^2
+\frac{c^2}{m^6}\partial_s^4+\cdots .
\]

After integration by parts,

\[
\boxed{
L_{\rm eff}
\approx
\frac12\left(A-\frac{\lambda^2}{m^2}\right)\kappa^2
+
\frac{\lambda^2c}{2m^4}(D_s\kappa)^2
-
\frac{\lambda^2c^2}{2m^6}(D_s^2\kappa)^2
+\cdots .
}
\]

### Second result

Eliminating a finite-core mode naturally generates:

- renormalized \(\kappa^2\);
- higher-gradient curvature terms such as \((D_s\kappa)^2\);
- at full order, a nonlocal curvature kernel.

So H(s)H generically leaves fingerprints in SAT even when the core itself is unresolved.

---

## 4. Nonlinear internal response generates \(\kappa^4\)

Let

\[
L_q
=
\frac{m^2}{2}q^2
+\frac\beta4 q^4
+\lambda q\kappa.
\]

For stiff \(q\), solve perturbatively:

\[
q
=
-\frac\lambda{m^2}\kappa
+\frac{\beta\lambda^3}{m^8}\kappa^3
+O(\kappa^5).
\]

Substitution yields

\[
\boxed{
L_{\rm eff}
=
\frac12\left(A-\frac{\lambda^2}{m^2}\right)\kappa^2
+
\frac{\beta\lambda^4}{4m^8}\kappa^4
+O(\kappa^6).
}
\]

### Third result

A \(\kappa^4\) term is exactly what one expects from integrating out a nonlinear but stiff finite-core deformation mode. It need not be inserted by hand.

---

## 5. Hidden rotational modes generate torsion/holonomy terms

Let an internal angular variable \(\theta(s)\) couple to a centerline/frame torsion-like quantity \(\tau_g(s)\):

\[
L_\theta
=
\frac I2(\theta_s)^2
+\frac{m_\theta^2}{2}\theta^2
+g_\theta\theta\,\tau_g.
\]

Eliminating \(\theta\) gives

\[
\boxed{
L_{\rm eff}^{(\tau)}
=
-\frac{g_\theta^2}{2}
\tau_g
(m_\theta^2-I\partial_s^2)^{-1}
\tau_g.
}
\]

At long wavelength,

\[
L_{\rm eff}^{(\tau)}
\approx
-\frac{g_\theta^2}{2m_\theta^2}\tau_g^2
+
\frac{g_\theta^2I}{2m_\theta^4}(D_s\tau_g)^2+\cdots .
\]

For a closed loop, the zero mode / global part of the angular sector cannot in general be captured by a purely local torsion density. That surviving global datum is naturally encoded by holonomy

\[
U_\gamma=\mathcal P\exp\oint\Omega_s ds.
\]

### Fourth result

Integrating out local rotational core modes can yield local torsion penalties, while global frame information may survive only as a nonlocal/topological holonomy sector.

---

## 6. Controlled SAT limit

A controlled SAT centerline limit exists if all of the following hold:

1. **small core:** transverse size \(\epsilon\to0\) relative to resolved curvature/readout scales;
2. **stiff internal modes:** internal masses/gaps \(m_q,m_\theta\) are large compared with centerline frequencies/wavenumbers;
3. **fast equilibration:** internal relaxation time is short compared with centerline evolution time;
4. **isotropy or unresolved anisotropy:** low multipole moments beyond the scalar/isotropic second moment either vanish or are below resolution;
5. **no low-energy topological zero modes:** holonomy sectors are fixed or separated by gaps large enough that centerline dynamics cannot mix them;
6. **long wavelength:** \(k\ell_q\ll1\), so the nonlocal kernel admits a derivative expansion.

Then

\[
S_{\rm H(s)H}[\gamma,F,B]
\longrightarrow
S_{\rm eff}^{\rm SAT}[\gamma]
\]

with a local expansion

\[
\boxed{
S_{\rm eff}^{\rm SAT}
=
\int dsdt
\left[
L_0(\gamma)
+
A_{\rm eff}\kappa^2
+
B_4\kappa^4
+
C_2(D_s\kappa)^2
+
T_2\tau_g^2
+\cdots
\right].
}
\]

SAT is therefore a controlled effective limit only if the omitted core operators are suppressed by powers of small ratios such as

\[
\epsilon/L,
\qquad
k\ell_q,
\qquad
\omega/\omega_{\rm core}.
\]

---

## 7. First obstruction to the SAT limit

The reduction fails first if **any finite-core mode remains soft**.

If an internal mode has

\[
m_q\to0,
\]

then

\[
(m_q^2-c\partial_s^2)^{-1}
\]

cannot be expanded locally. The effective centerline theory becomes genuinely nonlocal and the finite core cannot be hidden inside renormalized SAT coefficients.

Likewise, if multiple holonomy sectors remain degenerate at low energy, the centerline alone is not a complete state variable.

So the strongest obstruction is:

\[
\boxed{
\text{soft internal or topological modes prevent a local SAT-only effective theory.}
}
\]

---

## 8. Two inequivalent cores with the same centerline

Take two centered finite cores \(B_1,B_2\) sharing the same \(\gamma\).

### Case A: different second moments

If

\[
C_1^{AB}\neq C_2^{AB},
\]

they generate different second-order readout and interaction terms immediately.

The lowest-order memory of the hidden core is the quadrupole/second-moment tensor.

### Case B: same second moment, different radial structure

If

\[
C_1^{AB}=C_2^{AB}
\]

but their fourth moments differ, then the effective theories agree through second order and diverge at fourth order in the gradient/multipole expansion.

Thus two hidden cores can be centerline-degenerate but distinguishable by higher effective operators.

---

## 9. Current answer to the main question

### Can SAT be recovered as an effective limit of H(s)H?

**Yes, conditionally.**

A controlled local centerline limit exists when the core is small, stiff, fast, nearly isotropic/unresolved, and free of soft topological modes.

But the generic reduction does more than renormalize one coefficient. It produces an effective-operator tower:

\[
\kappa^2,
\quad
\kappa^4,
\quad
(D_s\kappa)^2,
\quad
\tau_g^2,
\quad
(D_s\tau_g)^2,
\quad
\text{multipole couplings},
\quad
\text{nonlocal kernels}.
\]

SAT is therefore best viewed as the low-resolution truncation of H(s)H only if this tower is hierarchically suppressed.

---

## 10. Open-instance challenge

Take the effective reduction above and attack the one assumption I have kept deliberately generic: the internal mode \(q\).

Replace it with a **real structure from your lane**:

- a braid/holonomy coordinate;
- a ᚼ generator mode;
- a finite-core shape eigenmode;
- a medium displacement field;
- an intertube separation mode;
- a chirality variable;
- or your own object.

Then derive its exact contribution to

\[
S_{\rm eff}^{\rm SAT}[\gamma].
\]

Do not stop at “it renormalizes curvature.” Calculate the operator it leaves behind.

### Harder knife

Find one internal mode whose elimination **cannot** be represented by any finite local derivative expansion of the centerline.

If you find one, characterize the resulting nonlocal kernel or topological memory and answer:

\[
\boxed{
\text{What is the minimal extra state variable SAT must retain so that the reduced theory closes?}
}
\]

That variable would be evidence that the true SAT limit is not a bare worldline, but a worldline plus one irreducible memory channel.
