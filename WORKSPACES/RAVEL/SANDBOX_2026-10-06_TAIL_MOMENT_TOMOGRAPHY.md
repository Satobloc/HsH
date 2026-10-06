# Ravel sandbox — tail-moment tomography

**Status:** SILOED PLAYGROUND / GEN-CANDIDATE. This is a bounded geometry/readout theorem inside the declared quadratic-contact model. It is not canonical theory, a particle assignment, or an empirical claim.

## Exact question

What is the smallest additional readout beyond support and centroid that removes the symmetric-support singularity of the piecewise-stretched \(B^3/S^2\) inverse, and how far does that readout identify an arbitrary finite carrier?

The answer is:

- the \(h^{-2}\) tail coefficient recovers the second projected moment;
- inside the declared piecewise-stretched \(B^3/S^2\) family, that one extra moment recovers the bulk fraction even at exact support symmetry;
- agreement between the first- and second-moment bulk estimates is a new family-closure test;
- two moments do not identify an arbitrary carrier; the full large-thickness series is a triangular transform of all compact-support moments.

## Controls and resource disposition

Before substantive work I read the current `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` (blob `2e788d4a...`) and the materially relevant Common routing, symbol, citation, toolbox, workflow, branch, and execution-lease surfaces. I overview-read the Common Reference Desk, which records the supplied 5 October HSH_RESOURCES packet and its War Room links. The immediately preceding Ravel pass had already reviewed the underlying packet routers and directory families.

Disposition remains unchanged: HSH_RESOURCES is supporting reference/tool machinery, not theory authority. No `PRIOR_ART` path was opened. A post-construction HSH_RESOURCES search for `Hausdorff moment problem compact interval moments` returned no indexed hit, so no external toolkit result was imported.

The local notation \(c_{n,\pm}\) and \(m_n\) is sandbox-scoped. A current symbol-registry search found no declared matching shared entry; nothing is promoted into the shared registry here.

## Exact source coverage

### Old SAT archive

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt`

- SHA `5283ceb8d06109061543711ebe7c46954efe7ede`;
- sequentially read lines 1–1600 through GitHub;
- genre: Nathan/assistant development transcript mixing direct intuitions, generated formalizations, corrections, and speculative external comparisons.

The recoverable historical construction is the explicit separation of a helical centerline from material rotation of a finite tube cross-section, followed by a finite-thickness tube operator and a separate resolving operator. This supports the type distinction “carrier geometry first, readout second.” It does not supply the moment transform below. Kerr, Klein-bottle, particle-scale, closure, and cosmological claims were not imported. ⟦ARCHIVE:HSH-AHA-TOPOLOGY·L801–1600⟧

### H(s)H September 30 dump

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md`

- full sequential read;
- SHA `657b7b21fa27be8dd1cc1151e377e2f567f678ee`;
- status in source: sandboxed local-geometry formalization.

Run 136 proves that effective support and incidence are identifiable from its declared crossover coordinates while the internal split \(\rho_{\rm eff}=\rho_n+h\) remains non-identifiable without an independent thickness-sensitive observable. I retained only that inverse-map discipline after constructing the tail transform independently. Its crossover formulae are not used below. ⟦HSH:RUN136·FULL⟧

### Immediate dependency

`WORKSPACES/RAVEL/SANDBOX_2026-10-06_ASYMMETRIC_ORIENTATION_TAIL_INVERSION.md` was read in full from current main. It supplies the normalized two-orientation kernel, support/centroid theorem, and the family-conditional first-moment bulk inverse. ⟦RAVEL:ASYM-TAIL·FULL⟧

## Source / inference / conjecture boundary

**Source facts:** the archive distinguishes finite tube geometry, centerline coiling, material twist, and resolving operations; current H(s)H work requires independently typed observables to split latent quantities.

**Inference:** if the entire thickness curve belongs to one transported carrier, its large-\(h\) coefficients cannot be arbitrary fit terms; they must encode successive projected moments with parity fixed by orientation reversal.

**New sandbox construction:** the triangular tail-moment transform, explicit second- and third-moment inverses, the symmetry-safe \(B^3/S^2\) estimator, and the first/second-moment family closure below.

## Triangular tail-moment transform

Let

\[
Z\in[-\rho_+,\rho_-],\qquad m_n:=\mathbb E[Z^n],\qquad m_0=1.
\]

For \(h>\max(\rho_+,\rho_-)\), the clipped term in the earlier kernel vanishes and

\[
\bar O_+(h)
=
\left(1+\frac{\rho_+}{h}\right)^{-1/2}
\mathbb E\!\left[\left(1-\frac{Z}{h}\right)^{1/2}\right].
\]

Writing

\[
\bar O_+(h)=1+\sum_{n\ge1}\frac{c_{n,+}}{h^n},
\]

gives the exact coefficient convolution

\[
c_{n,+}
=
\sum_{k=0}^{n}
\binom{-1/2}{n-k}\rho_+^{\,n-k}
\binom{1/2}{k}(-1)^k m_k.
\]

The coefficient multiplying \(m_n\) is \(\binom{1/2}{n}(-1)^n\neq0\). The map is therefore triangular: known support plus \(c_{1,+},\ldots,c_{N,+}\) recursively recovers \(m_1,\ldots,m_N\).

Orientation reversal replaces \(Z\mapsto-Z\) and \(\rho_+\mapsto\rho_-\):

\[
\bar O_-(h)
=
\left(1+\frac{\rho_-}{h}\right)^{-1/2}
\mathbb E\!\left[\left(1+\frac{Z}{h}\right)^{1/2}\right].
\]

It yields the same even moments and sign-reversed odd moments. Thus the second orientation is not needed for noiseless algebraic uniqueness, but it supplies parity closures that can expose miscentering, deformation, or apparatus changes.

## First three coefficients

For the plus orientation:

\[
c_{1,+}=-\frac{\rho_++m_1}{2},
\]

\[
c_{2,+}=\frac{3\rho_+^2+2\rho_+m_1-m_2}{8},
\]

\[
c_{3,+}=\frac{-5\rho_+^3-3\rho_+^2m_1+\rho_+m_2-m_3}{16}.
\]

The reverse formulas follow from \((m_1,m_2,m_3)\mapsto(-m_1,m_2,-m_3)\) and \(\rho_+\mapsto\rho_-\).

Define the second-tail residual after removing the known first tail,

\[
Q_{2,+}:=
\lim_{h\to\infty}
h^2\left[
\bar O_+(h)-1+\frac{\rho_++m_1}{2h}
\right]
=c_{2,+}.
\]

Then

\[
\boxed{
m_2=3\rho_+^2+2\rho_+m_1-8Q_{2,+}
}
\]

and independently

\[
\boxed{
m_2=3\rho_-^2-2\rho_-m_1-8Q_{2,-}.
}
\]

Equality of these two reconstructions is the next target-free orientation closure.

## Symmetry-safe morphology inverse

For the already-declared piecewise stretch

\[
z(u)=\rho_+u\quad(u<0),
\qquad
z(u)=\rho_-u\quad(u\ge0),
\]

with mixture

\[
p_w(u)=w_B\frac34(1-u^2)+(1-w_B)\frac12,
\]

the reference second moment is

\[
\mathbb E[u^2]=\frac13-\frac{2w_B}{15}.
\]

Therefore

\[
m_2
=
\frac{\rho_+^2+\rho_-^2}{2}
\left(\frac13-\frac{2w_B}{15}\right)
\]

and

\[
\boxed{
w_B^{(2)}
=
\frac52-
\frac{15m_2}{\rho_+^2+\rho_-^2}.
}
\]

Unlike the earlier centroid inverse, this remains finite at \(\rho_+=\rho_-\). When support is asymmetric, the first-moment estimate

\[
w_B^{(1)}=4-\frac{16m_1}{\rho_--\rho_+}
\]

must agree with \(w_B^{(2)}\). The family now makes an overdetermined prediction:

\[
\boxed{w_B^{(1)}-w_B^{(2)}=0.}
\]

The second moment therefore does two jobs: it repairs the symmetry singularity and tests the piecewise-stretched family rather than merely fitting it.

## Why this does not identify an arbitrary carrier

On \([-1,1]\), define

\[
p_\epsilon(u)=\frac12\left[1+\epsilon P_3(u)\right],
\qquad
P_3(u)=\frac12(5u^3-3u),
\qquad |\epsilon|\le1.
\]

Every member has the same support and

\[
m_1=0,
\qquad
m_2=\frac13,
\]

but

\[
m_3=\frac{2\epsilon}{35}.
\]

Thus endpoints, centroid, and variance do not determine a general projected density. The \(h^{-3}\) coefficient distinguishes this explicit family.

More generally, the full tail series recovers all moments recursively. For a compact interval, the standard Hausdorff moment theorem says the complete moment sequence uniquely determines the measure. This is a uniqueness statement for exact infinite data, not a claim of stable inversion from a short noisy sweep.

## Numerical audit

`WORKSPACES/RAVEL/CODE/tail_moment_tomography.py` performs direct Gauss–Legendre quadrature of the exact two-orientation kernel and fits seven inverse-thickness coefficients over

\[
30\le h/\rho_{\max}\le600.
\]

Twelve fixtures cover four support pairs, including exact symmetry, and \(w_B\in\{0.1,0.5,0.9\}\).

- maximum absolute error across recovered moments \(m_1,m_2,m_3\): \(8.15\times10^{-6}\);
- maximum absolute error of \(w_B^{(2)}\): \(3.50\times10^{-8}\);
- maximum \(|w_B^{(1)}-w_B^{(2)}|\) on asymmetric fixtures: \(3.31\times10^{-6}\).

The \(P_3\) counterexample numerically preserves the first two moments while changing \(m_3\) with the predicted sign and magnitude.

## Candidate comparison

| Readout retained | General compact carrier | Declared stretched \(B^3/S^2\) family |
|---|---|---|
| Supports only | endpoints | endpoints |
| \(h^{-1}\) tail | centroid | bulk fraction only when asymmetric |
| \(h^{-2}\) tail | second moment | symmetry-safe bulk fraction + family closure |
| \(h^{-3}\) tail | third moment / skew channel | additional held-out check |
| Full exact tail series | all moments; unique measure in principle | strongly overdetermined |

## Failure conditions

1. **Moderate-thickness aliasing:** a low-order polynomial fit outside the true tail biases higher moments.
2. **Noise amplification:** each additional coefficient is progressively ill-conditioned; exact uniqueness does not imply practical recoverability.
3. **Kernel error:** non-top-hat resolving profiles, unknown gain, or curvature corrections change the coefficient map.
4. **Orientation-dependent deformation:** reversal must transport one carrier rather than create two different densities.
5. **Support error:** support bias enters every recursive moment and can masquerade as morphology.
6. **Family misspecification:** \(w_B^{(2)}\in[0,1]\) is not proof of a \(B^3/S^2\) mixture; disagreement with \(w_B^{(1)}\) rejects the family, but agreement does not exclude all alternatives.

## Experiment / solver discriminator

1. Freeze the support estimates \(\rho_\pm\) from independent incidence thresholds.
2. Measure both orientation curves over a preregistered large-\(h\) ladder.
3. Fit \(c_{1,\pm},c_{2,\pm},c_{3,\pm}\) jointly with parity constraints, not independently after looking at outcomes.
4. Reconstruct \(m_1,m_2,m_3\) twice and report orientation-closure residuals.
5. For the declared stretched \(B^3/S^2\) family, compare \(w_B^{(1)}\) and \(w_B^{(2)}\), including a symmetric-support fixture where only \(w_B^{(2)}\) exists.
6. Hold out moderate-thickness settings and predict their occupancies without refitting.

Wrong parity, disagreement between the two \(m_2\) reconstructions, \(w_B^{(2)}\notin[0,1]\), disagreement between \(w_B^{(1)}\) and \(w_B^{(2)}\), or structured held-out residuals rejects the minimal family/kernel packet.

## Post-construction collision check

GitHub searches found no existing HsH file for `tail moment tomography second moment occupancy`. Slack recovered the preceding Ravel asymmetric-tail packet and two relevant Parallax warnings: moment-equivalent carriers can remain finite-thickness-readout inequivalent, and third directional moments form an independent parity-odd channel. Those results are compatible with the present conclusion but do not duplicate the triangular tail transform or the symmetry-safe estimator.

## What follows for H(s)H

If the 4D finite carrier picture is taken seriously, “particle morphology” cannot be assigned from a single footprint or a single fitted radius. H(s)H needs a transportable readout hierarchy: support from thresholds, centroid from the first tail, variance from the second tail, skew from the third, and only then a morphology model. The smallest mechanics remains one finite carrier plus one declared resolver; the new content is that thickness sweep coefficients are constrained moments of that carrier, not independent phenomenological knobs.

No paper update is earned until finite-noise conditioning establishes how many moments are practically recoverable and a blinded held-out sweep tests the family closure.

## Exact next handoff

Meridian: preregister a joint two-orientation fit for \((c_1,c_2,c_3)\) with support uncertainty propagated. Calder/Blind Auditor: compute the Fisher/condition spectrum versus thickness ladder and determine the largest moment order recoverable before noise amplification makes the inversion non-identifiable in practice.

## Microcite resolution

- `ARCHIVE:HSH-AHA-TOPOLOGY` → `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt`, SHA `5283ceb8d06109061543711ebe7c46954efe7ede`.
- `HSH:RUN136` → `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md`, SHA `657b7b21fa27be8dd1cc1151e377e2f567f678ee`.
- `RAVEL:ASYM-TAIL` → `Satobloc/HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-06_ASYMMETRIC_ORIENTATION_TAIL_INVERSION.md`, SHA `39f7517d88aa468f5ad61aea11b7c3a120a8f102`.
