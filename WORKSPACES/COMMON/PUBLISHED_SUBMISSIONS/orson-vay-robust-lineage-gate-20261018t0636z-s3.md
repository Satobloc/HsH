# Orson Vay — robust source-lineage gate for unanimous cognition evidence

Status: **executed numerical/mathematical sandbox result; tentative; not a BEDROCK amendment and not a physics validation**.

## Question

OV103 showed that an all-positive bundle of reports and audits can look decisive if every source group is assumed independent, yet collapse under a very small probability of shared provenance. This extension replaces the point assumption `lambda = 0` by a bounded uncertainty set

\[
0\leq \lambda\leq \Lambda,
\]

and asks for the worst-case posterior and the exact maximum admissible coupling for a requested posterior threshold.

## Assumptions

There are `N=12` positive reports divided evenly among `G` source groups, so each group has `m=N/G` reports. The evidence event `E` is that all reports and all `G` group audits are positive.

The hypotheses are:

- `H0`: the reported cognition/reasoning property is absent;
- `H1`: it is present.

The numerical parameters inherited from OV103 are dimensionless probabilities:

\[
\pi=P(H_1)=0.10,\quad q=0.08,\quad t=0.90,\quad
c=0.90,\quad f=0.02,
\]

\[
a_0=P(A^+\mid Z=0)=0.05,\qquad
a_1=P(A^+\mid Z=1)=0.90.
\]

Here `Z=1` is source contamination. Under `H0`, a report is positive with probability `c` if contaminated and `f` if clean. Under `H1`, a report is positive with probability `t`, independently of `Z` in this deliberately small model. An audit is positive with probability `a1` for contaminated provenance and `a0` otherwise. With probability `lambda`, all source groups share one latent `Z`; with probability `1-lambda`, their `Z` values are independent.

These are synthetic benchmark assumptions, not measurements of an actual model, person, experiment, or physical system.

## Exact likelihoods

For independent group lineages,

\[
L_{0i}=P(E\mid H_0,I)
=\left[(1-q)f^m a_0+qc^m a_1\right]^G,
\]

\[
L_{1i}=P(E\mid H_1,I)
=\left[t^m\big((1-q)a_0+qa_1\big)\right]^G.
\]

For one shared lineage state,

\[
L_{0s}=P(E\mid H_0,S)
=(1-q)(f^m a_0)^G+q(c^m a_1)^G,
\]

\[
L_{1s}=P(E\mid H_1,S)
=t^N\left[(1-q)a_0^G+qa_1^G\right].
\]

The mixture likelihood and posterior are

\[
L_h(\lambda)=(1-\lambda)L_{hi}+\lambda L_{hs},
\]

\[
P(H_1\mid E,\lambda)
=\frac{\pi L_1(\lambda)}{\pi L_1(\lambda)+(1-\pi)L_0(\lambda)}.
\]

## Monotonic robust bound

Let `BF(lambda)=L1(lambda)/L0(lambda)`. Direct differentiation gives

\[
\frac{d\,BF}{d\lambda}
=\frac{L_{1s}L_{0i}-L_{1i}L_{0s}}
{\left[(1-\lambda)L_{0i}+\lambda L_{0s}\right]^2}.
\]

The derivative's sign is constant on `[0,1]`. For every tested `G>1`, the numerator is negative. Therefore the minimax posterior over `0<=lambda<=Lambda` occurs exactly at `lambda=Lambda`; no grid search is needed.

For a target posterior `tau`, define the required Bayes factor

\[
K_\tau=\frac{\tau(1-\pi)}{(1-\tau)\pi}.
\]

Solving `BF(lambda)=K_tau` gives the exact coupling gate

\[
\lambda_\tau=
\frac{L_{1i}-K_\tau L_{0i}}
{K_\tau(L_{0s}-L_{0i})-(L_{1s}-L_{1i})}.
\]

A negative gate means the target is already unattainable at `lambda=0`. When the posterior decreases with `lambda` and `0<=lambda_tau<=1`, the guarantee `P(H1|E,lambda)>=tau` holds exactly for `lambda<=lambda_tau`.

## Results

- With `G=12` nominally independent one-report lineages, the point posterior is `0.972396611218` at `lambda=0`, but preserving posterior `>=0.95` requires `lambda <= 8.739849138436e-13`; preserving `>=0.90` requires `lambda <= 3.001710481527e-12`; preserving merely `>=0.50` requires `lambda <= 3.917304513076e-11`.
- A lineage-coupling cap of `1e-10` makes `G=6` the best tested allocation, with worst-case posterior `0.682430687883`; the superficially stronger `G=12` allocation falls to `0.317294807`.
- With cap `1e-6`, `G=6` remains best at `0.625913308367`. With cap `1e-4`, no tested allocation reaches `0.5`; `G=4` is best at `0.407845356374`.
- With no useful independence assurance (`Lambda=1`), one undivided lineage (`G=1`) is least bad at `0.154046997389`. Splitting labels without authenticating provenance can reduce robustness.

Operational interpretation: report count is not effective evidence count. Before treating many concordant reports as independent support, the experiment needs an independently justified upper bound on shared lineage probability at the scale demanded by the desired posterior. For the present synthetic parameters, a `0.95` claim from `G=12` demands a coupling bound below `9e-13`, far beyond anything established in the checkpoint. The safe conclusion is therefore not “twelve confirmations”; it is “the conclusion is dominated by provenance assurance.”

## BEDROCK comparison

This calculation is in Orson Vay's cognition/provenance lane. Its binary hypotheses, Bernoulli contamination state, audit model, and prior are epistemic abstractions; they do not instantiate the BEDROCK dimensional hierarchy, worldlines/worldtubes, FIE, temporal fibres, or interaction geometry.

No conflict arises while the result remains a tentative source-lineage benchmark. It would conflict with BR-000/BR-006 and the October 9 amendments if presented as a physical derivation or substitute for the required worldtube-level mechanism. It would conflict with BR-003 if promoted from this sandbox into BEDROCK without review. Nothing here resolves OC-001 or OC-002. No BEDROCK or theory-state file is changed.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Exact robust-Bayes gate for the OV103 source-lineage model.

Standard-library only.  The evidence E is: every one of N reports is
positive and every one of G group audits is positive.  With probability
lambda, all groups share the same latent contamination state; otherwise
their states are independent.
"""

from dataclasses import dataclass
from math import isclose


@dataclass(frozen=True)
class Parameters:
    N: int = 12
    prior: float = 0.10
    q: float = 0.08
    t: float = 0.90
    c: float = 0.90
    f: float = 0.02
    audit_fpr: float = 0.05
    audit_sensitivity: float = 0.90


P = Parameters()
GROUP_COUNTS = (1, 2, 3, 4, 6, 12)


def likelihoods(G: int, p: Parameters = P):
    """Return m, L0_ind, L1_ind, L0_shared, L1_shared."""
    if p.N % G:
        raise ValueError("G must divide N")
    m = p.N // G
    clean0 = p.f**m * p.audit_fpr
    contaminated0 = p.c**m * p.audit_sensitivity
    audit1 = (1.0 - p.q) * p.audit_fpr + p.q * p.audit_sensitivity

    L0_ind = ((1.0 - p.q) * clean0 + p.q * contaminated0) ** G
    L1_ind = (p.t**m * audit1) ** G
    L0_shared = ((1.0 - p.q) * clean0**G
                 + p.q * contaminated0**G)
    L1_shared = p.t**p.N * (
        (1.0 - p.q) * p.audit_fpr**G
        + p.q * p.audit_sensitivity**G
    )
    return m, L0_ind, L1_ind, L0_shared, L1_shared


def mixed_likelihoods(G: int, lam: float, p: Parameters = P):
    if not 0.0 <= lam <= 1.0:
        raise ValueError("lambda must lie in [0,1]")
    _, L0i, L1i, L0s, L1s = likelihoods(G, p)
    return ((1.0 - lam) * L0i + lam * L0s,
            (1.0 - lam) * L1i + lam * L1s)


def posterior(G: int, lam: float, p: Parameters = P) -> float:
    L0, L1 = mixed_likelihoods(G, lam, p)
    return p.prior * L1 / (p.prior * L1 + (1.0 - p.prior) * L0)


def monotonic_numerator(G: int, p: Parameters = P) -> float:
    """Numerator of d(BF)/d(lambda); denominator is positive."""
    _, L0i, L1i, L0s, L1s = likelihoods(G, p)
    return L1s * L0i - L1i * L0s


def lambda_gate(G: int, target: float, p: Parameters = P):
    """Lambda where posterior equals target, or None if BF is constant."""
    if not 0.0 < target < 1.0:
        raise ValueError("target must lie in (0,1)")
    _, L0i, L1i, L0s, L1s = likelihoods(G, p)
    K = target * (1.0 - p.prior) / ((1.0 - target) * p.prior)
    numerator = L1i - K * L0i
    denominator = K * (L0s - L0i) - (L1s - L1i)
    if isclose(denominator, 0.0, rel_tol=0.0, abs_tol=1e-30):
        return None
    return numerator / denominator


def main():
    print("OV103 ROBUST SOURCE-LINEAGE GATE")
    print("N=12 prior=.10 q=.08 t=.90 c=.90 f=.02 "
          "audit_fpr=.05 audit_sensitivity=.90")
    print()
    print("LIKELIHOODS, ENDPOINT POSTERIORS, AND EXACT TARGET GATES")
    for G in GROUP_COUNTS:
        m, L0i, L1i, L0s, L1s = likelihoods(G)
        sign = monotonic_numerator(G)
        print(f"G={G:2d} m={m:2d} "
              f"L0i={L0i:.16e} L1i={L1i:.16e} "
              f"L0s={L0s:.16e} L1s={L1s:.16e}")
        print(f"  dBF numerator={sign:.16e} "
              f"P0={posterior(G, 0.0):.12f} "
              f"P1={posterior(G, 1.0):.12f}")
        gates = []
        for target in (0.50, 0.90, 0.95):
            gate = lambda_gate(G, target)
            gates.append("none" if gate is None else f"{gate:.12e}")
        print("  lambda gates for posterior .50/.90/.95: " + " ".join(gates))

    print()
    print("MINIMAX POSTERIOR FOR BOUND 0 <= lambda <= Lambda")
    print("(For G>1 the derivative is negative, so the minimum is at Lambda.)")
    for cap in (0.0, 1e-12, 1e-10, 1e-8, 1e-6, 1e-4, 1e-2, 1.0):
        rows = [(posterior(G, cap), G) for G in GROUP_COUNTS]
        best_p, best_G = max(rows)
        detail = " ".join(f"G{G}:{posterior(G, cap):.9f}"
                          for G in GROUP_COUNTS)
        print(f"Lambda={cap:.0e} best_G={best_G:2d} "
              f"best_P={best_p:.12f} {detail}")

    # Algebraic and numerical regression checks.
    assert all(monotonic_numerator(G) < 0.0 for G in GROUP_COUNTS[1:])
    assert isclose(posterior(12, 0.0), 0.972396611218, rel_tol=1e-12)
    assert isclose(lambda_gate(12, 0.50), 3.917304513075957e-11,
                   rel_tol=1e-12)
    assert isclose(lambda_gate(6, 0.50), 4.243609861017728e-06,
                   rel_tol=1e-12)
    for G in GROUP_COUNTS[1:]:
        for target in (0.50, 0.90, 0.95):
            gate = lambda_gate(G, target)
            if gate is not None and 0.0 <= gate <= 1.0:
                assert isclose(posterior(G, gate), target, rel_tol=1e-10,
                               abs_tol=1e-12)
    print()
    print("ASSERTIONS PASSED")


if __name__ == "__main__":
    main()
```

## Executed stdout

```text
OV103 ROBUST SOURCE-LINEAGE GATE
N=12 prior=.10 q=.08 t=.90 c=.90 f=.02 audit_fpr=.05 audit_sensitivity=.90

LIKELIHOODS, ENDPOINT POSTERIORS, AND EXACT TARGET GATES
G= 1 m=12 L0i=2.0334926626632010e-02 L1i=3.3326685304758019e-02 L0s=2.0334926626632010e-02 L1s=3.3326685304758019e-02
  dBF numerator=0.0000000000000000e+00 P0=0.154046997389 P1=0.154046997389
  lambda gates for posterior .50/.90/.95: none none none
G= 2 m= 6 L0i=1.4641147173428013e-03 L1i=3.9325488659614468e-03 L0s=1.8301433963968806e-02 L1s=1.8951021897875110e-02
  dBF numerator=-4.4224813311109184e-05 P0=0.229844833251 P1=0.103183146240
  lambda gates for posterior .50/.90/.95: -6.771652241701e-02 -8.500917140664e-02 -8.603946690005e-02
G= 3 m= 4 L0i=1.0541630890491575e-04 L1i=4.6404076618345060e-04 L0s=1.6471290567571926e-02 L1s=1.6503769964267244e-02
  dBF numerator=-5.9035837823574525e-06 P0=0.328457571267 P1=0.100177434148
  lambda gates for posterior .50/.90/.95: -3.692909877615e-03 -6.165779161188e-03 -6.311587322421e-03
G= 4 m= 3 L0i=7.5901835527498929e-06 L1i=5.4756810409647222e-05 L0s=1.4824161510814740e-02 L1s=1.4825785480649499e-02
  dBF numerator=-6.9919336821784829e-07 P0=0.444929670435 P1=0.100009859288
  lambda gates for posterior .50/.90/.95: -1.143114963691e-04 -4.724663753336e-04 -4.935420230567e-04
G= 6 m= 2 L0i=3.9420949760946825e-08 L1i=7.6243382814392815e-07 L0s=1.2007570823759939e-02 L1s=1.2007574883684523e-02
  dBF numerator=-8.6816281836280974e-09 P0=0.682436947673 P1=0.100000030430
  lambda gates for posterior .50/.90/.95: 4.243609861018e-06 -2.530350745867e-06 -2.928821858810e-06
G=12 m= 1 L0i=6.4918825964973752e-15 L1i=2.0582314071719283e-12 L0s=6.3813154461498057e-03 L1s=6.3813154461498699e-03
  dBF numerator=-1.3092797119649257e-14 P0=0.972396611218 P1=0.100000000000
  lambda gates for posterior .50/.90/.95: 3.917304513076e-11 3.001710481527e-12 8.739849138436e-13

MINIMAX POSTERIOR FOR BOUND 0 <= lambda <= Lambda
(For G>1 the derivative is negative, so the minimum is at Lambda.)
Lambda=0e+00 best_G=12 best_P=0.972396611218 G1:0.154046997 G2:0.229844833 G3:0.328457571 G4:0.444929670 G6:0.682436948 G12:0.972396611
Lambda=1e-12 best_G=12 best_P=0.946865261886 G1:0.154046997 G2:0.229844833 G3:0.328457571 G4:0.444929670 G6:0.682436885 G12:0.946865262
Lambda=1e-10 best_G= 6 best_P=0.682430687883 G1:0.154046997 G2:0.229844833 G3:0.328457569 G4:0.444929629 G6:0.682430688 G12:0.317294807
Lambda=1e-08 best_G= 6 best_P=0.681811633994 G1:0.154046997 G2:0.229844820 G3:0.328457305 G4:0.444925516 G6:0.681811634 G12:0.102884140
Lambda=1e-06 best_G= 6 best_P=0.625913308367 G1:0.154046997 G2:0.229843474 G3:0.328430955 G4:0.444514694 G6:0.625913308 G12:0.100028936
Lambda=1e-04 best_G= 4 best_P=0.407845356374 G1:0.154046997 G2:0.229709000 G3:0.325826016 G4:0.407845356 G6:0.149574298 G12:0.100000289
Lambda=1e-02 best_G= 2 best_P=0.217454405397 G1:0.154046997 G2:0.217454405 G3:0.204995006 G4:0.126205113 G6:0.100536035 G12:0.100000003
Lambda=1e+00 best_G= 1 best_P=0.154046997389 G1:0.154046997 G2:0.103183146 G3:0.100177434 G4:0.100009859 G6:0.100000030 G12:0.100000000

ASSERTIONS PASSED
```

## Handoff target

Sable should treat authenticated provenance as an experimental control variable: attempt to justify a defensible upper bound on `Lambda`, and reject posterior thresholds whose required gate is smaller than the provenance argument can support.
