# Ravel sandbox — contact-overlap cusp locking (2026-10-02)

**Status:** SILOED PLAYGROUND. Not canonical SAT or H(s)H.

## Fresh source reads

- `SAT_THEORY_ARCHIVE_2023-25/SAT_CONCEPTS__May2026.txt` — full sequential read. Retained only the old mechanical claim that three-strand braid rigidity and filament/timesheet interaction should be literal mechanics. Rejected as controlling inputs: lattice assumptions, historical constants, particle assignments, and fitted force scales.
- `HsH/WORKSPACES/MERIDIAN/SANDBOX_2026-10-01_C3_HIDDEN_ORDER_GRAMMAR.md` — full sequential read. Retained the finite-core C3 strand set and its permutation-invariant phase (Q_3=e^{i3\theta}). This file is itself siloed, not canonical.
- Google Drive targeted search for H(s)H/contact/phase/finite-core controls — no relevant controlling document found.
- Common Slack targeted search after 2026-10-01 — no newer contact-phase mechanics found before this checkpoint.

## Object

A finite three-strand material support in a worldtube, resolved by one hypersurface. Strand (k) has phase (	heta_k). A single strand is in the resolving-contact state when

[
g(\delta)=\mathbf 1_{|\cos\delta|<x},qquad
x=\sqrt{1+\epsilon^2}-\epsilon,qquad
\epsilon=\rho_+/a.
]

Let (alpha=\arcsin x), so the gate occupies width (w=2\alpha) on a phase circle of length (L=\pi).

## Construction

A contact energy linear in total active contacts,
[
E_1=J\langle \sum_i g_i\rangle,
]
cannot lock relative phase: every shifted gate has the same duty fraction.

The least additional mechanic is the pair-overlap statistic
[
C(\Delta)=\langle g(\delta)g(\delta+\Delta)\rangle.
]
With (d=\operatorname{dist}(\Delta,\pi\mathbb Z)\in[0,\pi/2]),
[
C(d)=\frac1\pi\max\{w-d,,2w-\pi,,0\}.
]

For the C3 register (	heta_k=	heta+2\pi k/3), every pair has (d_0=\pi/3). The overlap law is nonsmooth at (d_0) only when
[
w=d_0 quad\text{or}\quad \pi-w=d_0.
]
Equivalently,
[
x=\frac12 \quad\text{or}\quad x=\frac{\sqrt3}{2},
]
which gives
[
\boxed{\epsilon=\frac34 \quad\text{or}\quad \epsilon=\frac1{4\sqrt3}}.
]

Perturb the equal-spacing mode as
[
(\theta_0,\theta_1,\theta_2)
=(0,,2\pi/3+u,,4\pi/3-u).
]
At either cusp ratio,
[
\sum_{i<j}C(\theta_i-\theta_j)
=
\sum_{i<j}C(2\pi/3)+\frac{2}{\pi}|u|+o(|u|).
]

Therefore an overlap penalty
[
E_{\rm ov}=J\sum_{i<j}C(\theta_i-\theta_j),qquad J>0,
]
creates a cusp restoring law
[
\Delta E_{\rm ov}=\frac{2J}{\pi}|u|+o(|u|),qquad
\tau_u=-\frac{2J}{\pi}\operatorname{sgn}u.
]
An attractive overlap sign makes the same C3 register unstable.

Away from the two cusp ratios, the hard-gate correlation is locally affine. The three pairwise first-order changes cancel, while the second derivative vanishes. Thus this minimal contact law supplies no harmonic phase stiffness away from the cusps.

## Interpretation boundary

**Source fact:** the archive names braid rigidity as a mechanical resistance and the HsH sandbox supplies a C3 finite-core phase coordinate.

**Derived consequence:** additive sheet-contact count cannot be that rigidity. A non-additive simultaneous-contact term is necessary.

**Sandbox conjecture:** the two previously geometric contact thresholds are candidate registry-pinning points, but only if overlapping readout/contact patches carry positive energy.

## Failure conditions

- If simultaneous contacts are energetically attractive, C3 registry is destabilized.
- If the interaction is additive in strand contact counts, relative phase is exactly unpinned.
- If finite interface thickness smooths the gate, the cusp becomes a constitutive rounded potential; the stiffness is no longer geometry-only.
- If strands are distinguishable or unequal, the symmetric mode and pair reduction require rederivation.
- This is readout-contact rigidity, not topological braid rigidity; confusing them is a category error.

## Solver test

Sweep (epsilon), phase perturbation (u), and interface smoothing (sigma). Measure
[
K_{\rm eff}(\epsilon,\sigma)
=
\left.\partial_u^2 E_{\rm ov}\right|_{u=0}
]
or, in the hard limit, the one-sided torque. The discriminator is two stiffness ridges converging to
[
\epsilon=\frac1{4\sqrt3},qquad \epsilon=\frac34
]
as (sigma\to0). Absence of those ridges falsifies contact-overlap locking for the implemented readout.
