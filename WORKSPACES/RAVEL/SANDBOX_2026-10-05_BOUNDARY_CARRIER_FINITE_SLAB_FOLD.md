# Ravel sandbox — boundary-carrier finite-slab fold

**Status:** SILOED PLAYGROUND / exact within the declared local model; not canonical H(s)H.  
**Narrow question:** If finite resolving thickness is historical SAT architecture, does the exact fixed-span identifiability fold distinguish a bulk `B^3` finite core from its boundary carrier `S^2 = ∂B^3`?

## Sources and actual coverage

### Required internal reads

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-012_NAIVE_TIMESHEET_TO_FINITE_SLAB_LINEAGE.md` — full sequential read. It advances Nathan's firsthand move from a “naïve timesheet” to “slab thickness with flow dynamics,” while explicitly leaving the 4D/3D intersection form and bulk/support/boundary choice unresolved. It also types resolving thickness separately from finite-core radius. ⟦PROV:XW012·Direct-source/Architecture-discrimination/Object-split⟧
- `Satobloc/HsH/WORKSPACES/MERIDIAN/2026-09-25_RUN_103_THIN_SLAB_IDENTIFIABILITY_DISCRIMINATOR.md` — full sequential read. It supplies the frozen quadratic tangency model, the thin-slab bulk scaling, and the approximate bulk fold `h/r_c = 2/5`. ⟦PROV:MER103·Exact-geometry/Fold⟧
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md` — full sequential read only after the independent `B^3` reconstruction. It contains the already-existing exact bulk integral and numerical fold. ⟦PROV:MER104·Exact-reduction/Fixed-span⟧
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_105_EXACT_FINITE_SLAB_FOLD_UNIQUENESS.md` — full sequential read only after the independent reconstruction. It proves uniqueness of the bulk fold through `3t^5+5t^3-2=0`. ⟦PROV:MER105·Result/Uniqueness⟧

### Search and comparison coverage

- Front-door and current Common control surfaces were read before the construction resumed. Mersearch 1.0 request `2026-10-05-ravel-finite-slab-fold-001` was submitted with query `("slab thickness" OR "finite slab" OR "resolving thickness" OR timesheet) AND (flow OR intersection OR particle OR worldtube)` against the SAT archive. [Bridge run 37384300257](https://github.com/Satobloc/HsH/actions/runs/37384300257) had completed checkout, input capture, and validation and was still executing the pinned search at checkpoint close; no Mersearch hit is treated as evidence here.
- Google Drive targeted search `finite slab tangency resolving thickness identifiability`: zero results.
- Public Slack search in `#all-hsh-working-group-one`, after 2026-09-24: exact phrase `finite slab` returned zero; `tangency AND fold` exposed prior Ravel messages that cited Runs 104/105. This collision check is why the independently reconstructed `B^3` fold is treated as regression, not novelty.

Microcite resolver: `XW012`, `MER103`, `MER104`, and `MER105` denote the exact paths above; locator text names the cited heading(s). These citations support source/history claims only. The `S^2` calculation below is new sandbox derivation.

## Source fact → inference → conjecture boundary

**Source facts.** Finite resolving thickness was explicitly contemplated historically, but neither a thickness law nor the sampled carrier family was fixed. Existing HsH sandbox work solved the isotropic bulk-`B^3` local geometry and its unique fixed-span fold.

**Inference.** If bulk and boundary are live rival architectures, the same declared readout must be applied to both. A boundary carrier uses surface measure, not bulk volume; therefore its scaling power and fold need not equal the `B^3` values.

**Sandbox conjecture.** A measured fold position could be an internal morphology discriminator—provided a solver or experiment genuinely controls the ratio of resolving half-thickness to core radius and observes the correct typed measure.

## Declared local geometry

Use local, collision-safe notation

\[
q(s)=\frac{\kappa_{\rm rel}}2s^2,
\qquad |z|\le h_\Sigma,
\qquad \lambda=\frac{h_\Sigma}{r_c},
\]

where `r_c` is the carrier radius, `h_Σ` the resolving-slab half-thickness, and `κ_rel` the relative quadratic curvature. Units are

\[
[s]=[r_c]=[h_\Sigma]=L,
\qquad [\kappa_{\rm rel}]=L^{-1}.
\]

The common first/last-contact span is

\[
R=r_c+h_\Sigma=r_c(1+\lambda).
\]

At fixed `s`, a uniform `S^2_{r_c}` boundary has constant area-band density

\[
dA=2\pi r_c\,dz.
\]

Set

\[
x=s\sqrt{\frac{\kappa_{\rm rel}}{2r_c}}.
\]

For `x≥0`, the dimensionless admitted `z`-length is

\[
\ell_\lambda(x)=
\begin{cases}
2\lambda,&0\le x\le\sqrt{1-\lambda},\quad 0\le\lambda\le1,\\
2,&0\le x\le\sqrt{\lambda-1},\quad \lambda\ge1,\\
1+\lambda-x^2,&\sqrt{|1-\lambda|}\le x\le\sqrt{1+\lambda},\\
0,&x>\sqrt{1+\lambda}.
\end{cases}
\]

Therefore the exact boundary worldsheet measure inside the slab is

\[
\boxed{
M_{S^2}=4\pi\sqrt2\,
\frac{r_c^{5/2}}{\sqrt{\kappa_{\rm rel}}}\,I_{S^2}(\lambda)
},
\qquad
I_{S^2}(\lambda)=\int_0^\infty\ell_\lambda(x)\,dx.
\]

Explicitly, with `a=√|1-λ|`, `b=√(1+λ)`, and `P_λ(x)=(1+λ)x-x^3/3`,

\[
I_{S^2}(\lambda)=
\begin{cases}
2\lambda a+P_\lambda(b)-P_\lambda(a),&0\le\lambda\le1,\\
2a+P_\lambda(b)-P_\lambda(a),&\lambda\ge1.
\end{cases}
\]

This has units `[M_{S^2}]=L^3`, as required for surface area transported along `s`.

## Exact fixed-span fold

At fixed measured `R`,

\[
M_{S^2}=4\pi\sqrt2\,
\frac{R^{5/2}}{\sqrt{\kappa_{\rm rel}}}
H_{S^2}(\lambda),
\qquad
H_{S^2}=\frac{I_{S^2}(\lambda)}{(1+\lambda)^{5/2}}.
\]

For `0<λ<1`, set

\[
t=\sqrt{\frac{1-\lambda}{1+\lambda}}\in(0,1).
\]

Direct reduction gives

\[
H_{S^2}(t)=\frac{4\sqrt2\pi}{3}(1+t^2)(1-t^3),
\]

so its interior stationary point is the unique root of

\[
\boxed{5t^3+3t-2=0}.
\]

The derivative of the polynomial is `15t²+3>0`, so the root is unique. On `λ>1`, writing `u=√((λ-1)/(λ+1))` gives

\[
H_{S^2}(u)=\frac{4\sqrt2\pi}{3}(1-u^2)(1-u^3),
\]

whose derivative is negative for `0<u<1`. Thus there is exactly one positive fold:

\[
\boxed{\lambda^{S^2}_*=0.6241059479219366}.
\]

The existing bulk result is

\[
\boxed{\lambda^{B^3}_*=0.3686624730684828},
\]

so the carrier-dependent separation is

\[
\boxed{\Delta\lambda_*=0.2554434748534538}.
\]

Independent Simpson integration of the unsimplified clipped sections agreed with the closed forms to `≤2.4×10^-14` over representative `λ∈[10^-3,10]`; polynomial-root residuals are at floating-point roundoff.

## Candidate comparison and surviving invariant

| Architecture | Typed measure | Fixed-span power | Unique fold |
|---|---:|---:|---:|
| bulk `B^3` | four-volume | `R^(7/2) κ_rel^(-1/2)` | `0.3686624731` |
| boundary `S^2=∂B^3` | transported surface measure | `R^(5/2) κ_rel^(-1/2)` | `0.6241059479` |
| centerline | incidence/contact only | no finite-core overlap measure | no such fold |

The dimensionless fold location survives unknown overall gain, `R`, and `κ_rel`. It is therefore stronger than comparing raw response amplitudes, whose dimensions differ between bulk and boundary carriers.

The result also blocks one tempting inference: finite resolving thickness alone does **not** create a detector “forbidden-cell floor.” It creates a latent clipping/overlap law. A nonzero detector-cell floor requires a separately declared pushforward, binning kernel, or noise model.

## Prediction packet earned: internal solver discriminator

- **Exact prediction:** a top-hat finite-slab solver using uniform `S^2` surface measure must lose local inverse rank at `h_Σ/r_c = 0.6241059479219366`; the uniform `B^3` bulk solver must do so at `0.3686624730684828`.
- **Assumptions:** isotropic radius `r_c`; nondegenerate quadratic tangency; locally constant `κ_rel`; top-hat slab; uniform declared bulk or surface measure; contact span `R=r_c+h_Σ` independently measured.
- **Readout map:** sweep `λ` at fixed `R` and record the appropriate overlap measure; locate the response maximum or Jacobian zero.
- **Independent comparator:** first/last-contact span plus the rival carrier's fold position.
- **Uncertainty:** numerical error is negligible at shown precision; model-form error from higher contact order, anisotropy, varying fibers, weighting kernels, or ambient curvature is unquantified and dominant.
- **Falsification:** within the declared local model, failure to recover the scaling collapse, the cubic fold equation, a single sign change, or both inverse branches below the maximum falsifies the implementation. In a fuller model, stable fold migration under refinement falsifies this leading approximation rather than the algebra.

No external empirical particle prediction is earned.

## Centerline and layered limits

At fixed apparatus `h_Σ>0`, `r_c→0` eventually swallows the entire carrier and destroys the normalized morphology discriminator. If `h_Σ=λr_c` co-scales, the dimensionless curve survives as finite-core limiting data while the dimensional measure tends to zero. A mixed bulk/boundary carrier will generally interpolate nonlinearly between the two folds only after its weights are typed in commensurate detector units; raw `L^4` and `L^3` measures cannot be added.

## Paper update

One lemma is paper-ready for a narrow bulk/support/boundary/readout non-equivalence paper: **the exact fixed-span fold is carrier-measure dependent even when support radius and contact geometry are identical.** No paper skeleton is opened yet because the mixed-layer readout and common-unit detector map remain missing.

## Exact handoff / next dependency

**Meridian:** implement branch-aware inversion for the `S^2` formula above beside the existing `B^3` harness, verify both folds by direct quadrature, then introduce one explicitly calibrated detector functional that maps bulk and boundary measures into common output units. Only after that calibration, derive the fold trajectory for a layered mixture; do not add `L^4` and `L^3` measures directly.
