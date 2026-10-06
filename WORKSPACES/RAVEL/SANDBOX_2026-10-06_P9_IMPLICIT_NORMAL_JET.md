# Ravel sandbox — P9 implicit nuisance-normal jet

**Status:** `GEN/ACTIVE` sandbox calculation; not canonical SAT/H(s)H and not an empirical particle claim.  
**Question:** does the mirror-odd P9 cancellation survive when the nuisance optimum is differentiated directly, rather than inferred from a finite amplitude polynomial window?

## Source coverage and boundary

### Historical SAT source actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/26R Worldline Topos.txt`
- Coverage: substantial contiguous opening, from the initial particle/worldline taxonomy through the molecular/macroscopic/pulsar discussion and the April 8 precession setup.
- Source fact (`SRC/HISTORICAL`): the document repeatedly distinguishes a persistent four-dimensional path/bundle from a lower-dimensional intersection trace, and makes the trace depend on orientation relative to a resolving timesheet.
- Quarantine: its particle assignments, lattice, numerical constants, direct mass rules, “dark” claims, and polished certainty were not imported. They are unsupported or collide with current controls.

### Live H(s)H source actually read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md`
- Coverage: complete file.
- Source fact (`SAT/ACTIVE`): within a frozen quadratic-contact model, the exact finite-slab readout reduces to a dimensionless function $H(r)$, has a numerically located fold at $r=h/\varepsilon\approx0.36866247$, and therefore has a two-valued inverse near the fold. The source explicitly does not promote this to a full-worldtube or particle statement.

### Routing/reference review

Refreshed `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Reference Desk, current workflow orientation, onboarding/symbol/citation/toolbox controls, and the HSH_RESOURCES index, Tool Chest, toolkit digestion plan, Nathan preference router, and War Room declaration. HSH_RESOURCES was used only for routing/familiarity; no external theory premise was imported. Mercer_Searcher/Mersearch is not exposed in this runtime, so retrieval used current indexes and direct source reads rather than generic repository search.

## Independent construction

Let $R(\theta,\delta)$ be the whitened training residual including the two support priors. Here $\delta$ changes only the withheld P9 moment; it does **not** move the support asymmetry $a$. The nuisance optimum obeys

\[
g(\theta,\delta)=J(\theta)^T R(\theta,\delta)=0,
\qquad J=\partial_\theta R.
\]

At $\delta=0$, the truth lies in the nuisance family and $R=0$. Write $\theta_k=d^k\theta_*/d\delta^k|_0$, $y_k=d^k y/d\delta^k|_0$, and $H=J^TJ$. Direct differentiation gives

\[
H\theta_1=J^Ty_1,
\qquad r_1=J\theta_1-y_1,
\qquad J^Tr_1=0.
\]

Let $Q=D_\theta J[\theta_1]$ and $q=Q\theta_1$. A second differentiation gives

\[
H\theta_2=-Q^Tr_1-J^T(q-y_2).
\]

For the held-out residual $e(\delta)=y_h(\delta)-m_h(\theta_*(\delta))$,

\[
e_1=y_{h,1}-J_h\theta_1,
\qquad
e_2=y_{h,2}-J_h\theta_2-q_h.
\]

The local signed response used by the prior P9 audits is therefore

\[
\boxed{
F_0=s\,\frac{\langle e_1,e_2\rangle}{\langle e_1,e_1\rangle}
}
\]

with $s=0.0025$. This is the $\delta\to0$ coefficient directly; no finite-amplitude residual polynomial is required.

Implementation note: the optimum is differentiated implicitly, but the forward/truth partial derivatives are centered finite differences. This removes amplitude-window bias, not derivative-discretization error.

## Calculation

Three acquisition designs were retained from the resolver audit: the original 16-channel geometric ladder, a jittered 16-channel ladder, and a dense 24-channel ladder. For each, I solved $F_0(a,o)=0$ on the two sides $a=a_*\pm10^{-4}$ of the original ladder's contact threshold $a_*=0.06125742185$.

| resolver | root below | root above | sided jump | shift from residual-jet root (below / above) |
|---|---:|---:|---:|---:|
| original 16 | -0.01744140 | -0.01249721 | +0.00494419 | +0.00425865 / +0.00049571 |
| jittered 16 | -0.01293494 | -0.01298323 | -0.00004829 | +0.00146451 / +0.00149460 |
| dense 24 | -0.00898757 | -0.00902152 | -0.00003395 | -0.00002534 / -0.00001625 |

Diagnostics:

- bracketed roots satisfy $|F_0|\le3.8\times10^{-9}$;
- first- and second-differentiated normal-equation residuals remain below $1.1\times10^{-8}$ and $5.2\times10^{-8}$;
- minimum $H$ eigenvalue is $1.22\times10^4$, maximum condition number $4.09\times10^3$;
- no finite-difference stencil crossed a training contact stratum;
- maximum directional log-support displacement was $1.87\times10^{-5}$;
- final derivative-step halving changes $F_0$ at a solved root by at most $8.4\times10^{-7}$, corresponding to roughly $2\times10^{-5}$ in the worst root given the local slope.

## Result

The direct local limit does **not** rescue a unique P9 cancellation curve.

1. The dense design is stable against removal of the finite-amplitude window: its roots move only $1.6$–$2.5\times10^{-5}$.
2. The 16-channel roots move materially, especially the original ladder just below contact.
3. The artificial sided jump of the original ladder remains large, but falls from the prior residual-jet estimate $8.71\times10^{-3}$ to $4.94\times10^{-3}$.
4. Jittered and dense ladders have small sided jumps, yet their limiting roots differ by about $3.9\times10^{-3}$. Continuity across one contact event is therefore insufficient for resolver invariance.

This supports a stronger negative discriminator: a statistic extracted from a finite-core intersection/readout is not an intrinsic worldtube label merely because it has a clean local zero or is continuous across one contact stratum. It must also converge under resolver refinement.

## Translation into current H(s)H language

- **Historical source fact:** the archive separated the extended 4D history from its intersectional trace.
- **Current inference:** the fitted residual is a property of the composed map $R_\Sigma\circ F$ plus the nuisance projection, not of $F$ alone.
- **New sandbox conjecture:** candidate particle-like “readout identities” should be defined as equivalence classes stable across an admissible resolver family, rather than by a single acquisition-specific zero.

After this independent construction, Run 104 provides a compatible caution: even an exact finite-core slab map can contain a fold and branch ambiguity. It does not prove the P9 behavior, but it explains why inverse/readout branch structure must be audited before a trace is promoted to object identity.

## Failure condition

Reject the present implicit-normal result if any of the following occurs:

1. analytic or automatic derivatives move a reported root by more than $5\times10^{-5}$ for the dense ladder or $1\times10^{-4}$ for either 16-channel ladder;
2. a nested resolver sequence converges to different nonzero root limits for different ladder families;
3. the nuisance Hessian loses rank or the derivative path crosses a contact stratum without a one-sided treatment;
4. a direct small-$\delta$ nonlinear refit fails to approach the implicit $F_0$ as $O(\delta^2)$.

Conditions 1 and 4 would falsify the numerical derivative implementation. Condition 2 would falsify the stronger claim that this zero is an intrinsic readout invariant.

## Next test / tight prediction

Build nested 16/24/32/48-channel ladders with matched endpoint coverage and solve the implicit system on both sides of every acquired contact threshold. The tight criterion is

\[
\max_{d,d'}|o_d^*(a)-o_{d'}^*(a)|\to0,
\qquad
|o_d^*(a_*^+)-o_d^*(a_*^-)|\to0
\]

as the maximum log-gap of the ladder tends to zero. If either limit remains nonzero, the P9 zero is resolver-relative and must not be used as a particle/worldtube invariant.

## Durable artifacts

- `WORKSPACES/RAVEL/CODE/p9_implicit_normal_jet.py`
- `WORKSPACES/RAVEL/DATA/p9_implicit_normal_jet.json`

**Next cursor:** replace centered partials by analytic cellwise derivatives (or a fixed-cell AD implementation) and run the nested-resolver convergence test.
