# Ravel sandbox checkpoint — transported-normal profile invariance

**Status:** GEN/CANDIDATE. This is an independent sandbox construction, not canonical H(s)H. It tests kinematics only: it does **not** derive the matter source of time-normal torsion.

## Exact reading record

### SAT archive source

- `SAT_THEORY_ARCHIVE_2023-25/H(s)H_TIME_RESIDUALS.txt`
- Git blob: `ff346a1953e2f0d0a60c29fc6d389b11e75e2172`
- Substantially read sequentially: lines 1–700 of 1334.
- Material actually used:
  - lines 43–104: the old UI/Whirlygig/Spheres/Graticule roles and the distinction between normalization and reorientation;
  - lines 108–383: system-derived scales, normalized variables, and derivative conversion;
  - lines 385–496: exact `w=ct` reparameterization of an action, including unchanged canonical momenta and the rescaled Hamiltonian;
  - lines 498–691: dimensionless finite-core curvature/torsion scaling and comparison of old/new kernels only after normalization.
- Provenance caution: the file is historical/generated conversation material. I treat its constructions as SRC/CANDIDATE/HISTORICAL, not current authority.

### Current H(s)H source

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`
- Git blob: `f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4`
- Read completely: lines 1–745.
- Material actually used:
  - lines 343–426: closure, intrinsic transport, embedded four-dimensional frame history, and ordered rotations are different tasks;
  - lines 430–467: the Euclidean-background plus unit-field metric-induction candidate, explicitly sandboxed;
  - lines 653–689: solver ecology in which finite-core/tangency and ordered-frame engines remain distinct modules.

The required project front door and its live routing, symbol, citation, workflow, scheduler, and task-graph pointers were reread before theory work. The 5 October `HSH_RESOURCES` packet was reviewed only as quarantined routing/tool familiarity; no result below was imported from it.

## Source fact → inference → conjecture

### Source facts

1. The archive insists that scale and coordinate normalization must be separated from physical reorientation before two kernels or Lagrangians are compared.
2. The September 30 H(s)H map distinguishes intrinsic transport and embedded frame history from mere closure; ordered rotations can retain path information even when endpoint geometry looks similar.
3. The finite-core intersection solver and the ordered-frame engine were not yet one coupled solver in the mapped toolchain.

### Inference

An observed intersection profile should not be asked to carry both the body's finite-core morphology and the path history of the resolving normal. Those are separate latent channels:

- carrier morphology: radius \(r_c\) and edge exponent \(\alpha\);
- local resolving geometry: thickness \(d_\Sigma\) and relative offset;
- transport history: the normal field \(n_\Sigma(\tau)\).

If a model holds the resolving normal fixed when it actually rotates, it can counterfeit that missing rotation by changing the inferred core radius and edge shape. A morphology parameter is credible only if it transfers after normal transport is accounted for.

### New sandbox conjecture

Treat time-normal torsion kinematically as transport of the resolving normal and let finite-core structure enter only through an intersection kernel. In four-dimensional notation,

\[
\frac{d n_\Sigma}{d\tau}=\Omega_\Sigma(\tau)n_\Sigma,
\qquad \Omega_\Sigma(\tau)\in\mathfrak{so}(4),
\qquad n_\Sigma\!\cdot n_\Sigma=1.
\]

For a controlled planar reduction, this becomes \(\psi'(\tau)=\omega_\Sigma(\tau)\). Given a carrier worldtube embedding \(X(\phi,s)\) and resolving-hypersurface reference point \(x_\Sigma(\tau)\), define

\[
u(\phi,s;\tau)=n_\Sigma(\tau)\cdot
\bigl[X(\phi,s)-x_\Sigma(\tau)\bigr].
\]

Use the normalized finite-core profile inherited from the preceding Ravel construction,

\[
p_\alpha(z)=\frac{C_\alpha}{r_c}
\left[1-\left(\frac{z}{r_c}\right)^2\right]^\alpha,
\qquad
C_\alpha=\frac{\Gamma(\alpha+3/2)}{\sqrt\pi\,\Gamma(\alpha+1)},
\]

and its cumulative overlap \(W_\alpha\). The observable is the carrier average

\[
S(\tau)=\frac{1}{2\pi}\int_0^{2\pi}
W_\alpha\!\left(u(\phi,0;\tau);d_\Sigma,r_c\right)d\phi.
\]

The sharp claim is not a particular value of \(\alpha\). It is the **profile-invariance condition**

\[
(r_c,\alpha)_{\Sigma_1}=(r_c,\alpha)_{\Sigma_2}
\]

after fitting a shared transported normal, while \(d_\Sigma\) and the local relative geometry may change.

## Synthetic discriminator

I generated a circular carrier with a nominal tilt ramp from \(5^\circ\) to \(19^\circ\). The hidden resolving normal rotates as

\[
\psi(\tau)=A\sin(2\pi\tau+\varphi),
\]

so the effective relative tilt is nominal tilt minus \(\psi\). Hidden parameters were \(d_1=0.08\), \(d_2=0.14\), \(r_c=0.06\), \(\alpha=0.65\), \(A=2.4^\circ\), and \(\varphi=0.7\). No historical particle label or constant was used as a target.

The transported-normal model learned \(d_1,r_c,\alpha,A,\varphi\) from the first thickness. Only the high-angle half of the second thickness was used to estimate \(d_2\); the contact/lower-angle half was held out.

| Quantity | Hidden | Recovered |
|---|---:|---:|
| \(d_1\) | 0.080000 | 0.080030 |
| \(d_2\) | 0.140000 | 0.140025 |
| \(r_c\) | 0.060000 | 0.060047 |
| \(\alpha\) | 0.650000 | 0.646739 |
| \(A\) | \(2.400000^\circ\) | \(2.397196^\circ\) |
| \(\varphi\) | 0.700000 | 0.701313 |

Controls:

- transported-normal training \(\chi^2=88.75\) for 84 observations and five fitted parameters;
- withheld second-thickness signal RMS \(=1.41\sigma\), support RMS \(=0.78\sigma\);
- fixed-normal null: withheld signal RMS \(=972.49\sigma\), support RMS \(=141.55\sigma\), with \(\alpha\) driven to its lower bound;
- stronger affine-angle null, \(\theta_{\rm eff}=a+b\theta_{\rm nominal}\): withheld signal RMS \(=184.04\sigma\), support RMS \(=41.23\sigma\), with \(\alpha=-0.398\);
- dynamic dimensionless-Jacobian condition number \(=122.85\);
- five-start peak-to-peak spread in \(\alpha\) was \(1.23\times10^{-8}\).

Thus even a freely offset-and-rescaled static calibration cannot mimic a path-dependent normal while preserving transferable core morphology. In this controlled case the edge exponent survives transport; the nulls misassign transport error to the core.

## Failure conditions

Reject or revise this architecture if any of the following occurs in a less idealized solver:

1. withheld transfer exceeds \(2\sigma\) RMS after realistic instrument convolution;
2. recovered \(\alpha\) or \(r_c\) shifts by more than 5% between independently calibrated resolving thicknesses;
3. an endpoint-only or affine-angle null predicts as well as the path-transport model after complexity penalties;
4. multistart solutions split into transport/profile degeneracy families;
5. normal transport inferred from one observable fails to predict a second observable without refitting the core.

## Next solver test

Replace the sinusoidal planar rotation with two noncommuting generators \(A,B\in\mathfrak{so}(4)\). Compare paths

\[
U_{AB}=e^{\epsilon A}e^{\epsilon B},
\qquad
U_{BA}=e^{\epsilon B}e^{\epsilon A},
\]

whose leading difference is \(\epsilon^2[A,B]\). Construct trajectories with matched endpoint normal to first order but reversed ordering, and ask whether the finite-core intersection signal resolves the commutator without changing \((r_c,\alpha)\). A positive result would make ordered frame history observable through morphology-preserving intersection; a null result would sharply limit what H(s)H can encode in scalar overlap alone.

## Reproducibility

- Code: `WORKSPACES/RAVEL/CODE/transported_normal_profile_transfer.py`
- Machine-readable output: `WORKSPACES/RAVEL/DATA/transported_normal_profile_transfer.json`
- Figure: `WORKSPACES/RAVEL/FIGURES/transported_normal_profile_transfer.svg`
- Random seed: `2026100702`
