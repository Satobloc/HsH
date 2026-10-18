# Elias Kern — exact sequential audit-label stopping gate

**Status:** GEN/DERIVED synthetic decision mathematics, executed. This is a bounded
workflow-switchboard transfer test, not measured production telemetry, not a
SAT/H(s)H physics result, and not a change to BEDROCK.

## Question

Suppose a prototype must choose between two routing mechanisms after buying
audited binary outcomes one at a time. When should it stop auditing, and how much
does adaptive stopping improve on a precommitted fixed sample?

## Assumptions

- Competing mechanisms: H in {0,1}, with equal prior probability 1/2.
- A true audited outcome Z is Bernoulli(theta_h), with
  theta_0 = 0.41 and theta_1 = 0.59.
- Each recorded label is independently flipped with probability eta:
  Y = Z xor E, E ~ Bernoulli(eta).
- Therefore q_h = P(Y=1|H=h) = eta + (1-2 eta) theta_h.
- Wrong terminal choice costs 1; a correct choice costs 0.
- Each audited label costs c = 0.01 in the same loss units.
- The main dynamic-program horizon is N = 30 labels.
- Conditional independence, a fixed mechanism during the audit, known q_0/q_1,
  and perfect cost accounting are stipulated. They are not empirical findings.

All quantities are dimensionless expected losses or counts.

## Exact finite-horizon derivation

After n labels with k ones, equal-prior posterior odds are

\[
\Lambda_{n,k}
=\left(\frac{q_1}{q_0}\right)^k
 \left(\frac{1-q_1}{1-q_0}\right)^{n-k},
\qquad
p_{n,k}=P(H=1\mid n,k)=\frac{\Lambda_{n,k}}{1+\Lambda_{n,k}}.
\]

Stopping and choosing the posterior-MAP mechanism has conditional Bayes loss

\[
S_{n,k}=\min(p_{n,k},1-p_{n,k}).
\]

The prior-predictive probability of the next observed label being one is

\[
\bar q_{n,k}=(1-p_{n,k})q_0+p_{n,k}q_1.
\]

At the forced terminal horizon, V_{N,k}=S_{N,k}. Backward induction gives

\[
V_{n,k}=\min\left\{
S_{n,k},
c+(1-\bar q_{n,k})V_{n+1,k}
  +\bar q_{n,k}V_{n+1,k+1}
\right\}.
\]

The first term stops; the second buys one more audited label. Forward propagation
through the selected policy independently recovers

\[
V_{0,0}=E[\text{terminal error}]+cE[\tau],
\]

where tau is the stopping time. This forward/backward equality is an executed
consistency check.

For comparison, a fixed m-label plan has exact risk

\[
R_m=\frac12\sum_{k=0}^{m}
\min\left\{
{m\choose k}q_0^k(1-q_0)^{m-k},
{m\choose k}q_1^k(1-q_1)^{m-k}
\right\},
\]

and total loss R_m+cm. The best fixed plan minimizes this over 0 <= m <= N.

## Infinite-horizon symmetric threshold check

At eta=0, q_0=1-q_1=0.41. Each label moves the log-likelihood ratio by
plus or minus a = log(0.59/0.41). A symmetric rule that stops when the integer
walk first reaches plus or minus b has, under H=1, upward probability p=0.59,
downward probability q=0.41, and ratio r=q/p. Standard gambler's-ruin equations
then give

\[
P_{\rm err}(b)=\frac{r^b}{1+r^b},
\qquad
E[\tau_b]
=\frac{2b/(1+r^b)-b}{p-q},
\]

so

\[
J(b)=P_{\rm err}(b)+cE[\tau_b].
\]

Direct evaluation for b=1,...,10 selects b=4, with J(4)=0.327278396041.
The N=100 dynamic program gives 0.327283300565, only 4.904524e-6 higher,
providing an independent convergence benchmark.

## Executed numerical results

~~~text
MODEL theta0=0.41 theta1=0.59 cost=0.01 horizon=30 equal_priors
flip q0 q1 seq_total seq_Elabels seq_error fixed_m fixed_error fixed_total gain_pct
0.00 0.4100 0.5900 0.331242705572 12.332438997 0.207918315598  9 0.287809021028 0.377809021028 12.325358
0.05 0.4190 0.5810 0.357082696995 11.627577875 0.240806918241  7 0.327389843813 0.397389843813 10.142974
0.10 0.4280 0.5720 0.381227230422 8.400614703 0.297221083395  7 0.345725487342 0.415725487342 8.298326
0.20 0.4460 0.5540 0.430364326619 8.481545360 0.345548873020  3 0.419314928000 0.449314928000 4.217666
0.50 0.5000 0.5000 0.500000000000 0.000000000 0.500000000000  0 0.500000000000 0.500000000000 0.000000

NO_FLIP_POLICY continuation posterior bands
n remaining p_min p_max continue_states
 0 30 0.500000000 0.500000000 1
 1 29 0.410000000 0.590000000 2
 2 28 0.325648973 0.674351027 3
 3 27 0.251261393 0.748738607 4
 4 26 0.325648973 0.674351027 3
 5 25 0.251261393 0.748738607 4
10 20 0.325648973 0.674351027 3
15 15 0.251261393 0.748738607 4
20 10 0.325648973 0.674351027 3
25  5 0.410000000 0.590000000 2
29  1 NONE NONE 0

NO_FLIP_STOP_DISTRIBUTION nonzero entries
n=4:0.149431220 n=6:0.144589648 n=8:0.122416826 n=10:0.101529018 n=12:0.083912887 n=14:0.069312045 n=16:0.057245907 n=18:0.047279466 n=19:0.071677666 n=21:0.041859638 n=23:0.030377540 n=25:0.022044980 n=27:0.015998042 n=28:0.021848225 n=29:0.020476891
mass=1.000000000000 E_labels=12.332438997 terminal_error=0.207918315598 total=0.331242705572

NO_FLIP_HORIZON_CONVERGENCE
horizon total E_labels terminal_error
  2 0.420000000000 1.000000000 0.410000000000
  4 0.391296000000 2.483800000 0.366458000000
  6 0.375627507200 4.076793660 0.334859570600
  8 0.364256881975 5.232829159 0.311928590384
 10 0.356005219249 6.071764121 0.295287578042
 15 0.342414271803 8.174594364 0.260668328168
 20 0.337595181360 9.952943791 0.238065743450
 25 0.333090247428 11.640230666 0.216687940767
 30 0.331242705572 12.332438997 0.207918315598
 40 0.328801748201 13.246981072 0.196331937481
 60 0.327503335594 13.733451264 0.190168822953
100 0.327283300565 13.815890762 0.189124392948

NO_FLIP_INFINITE_SYMMETRIC_THRESHOLD
boundary error E_labels total
 1 0.410000000000 1.000000000 0.420000000000
 2 0.325648973266 3.874467261 0.364393645874
 3 0.251261392636 8.291286912 0.334174261757
 4 0.189101112873 13.817728317 0.327278396041
 5 0.139454646564 20.030297413 0.339757620695
 6 0.101215420360 26.585638643 0.367071806787
 7 0.072577273582 33.243989833 0.405017171907
 8 0.051577085652 39.859814609 0.450175231739
 9 0.036414702851 46.358529715 0.500000000000
10 0.025589419951 52.712286672 0.552712286672
best_boundary=4 best_total=0.327278396041

checks=PASS: DP/forward equality; mass conservation; adaptive<=fixed; eta=.5 stop-immediately; degradation monotone; horizon value monotone
plot=elias_sequential_audit_gate.svg
boundary=stipulated synthetic mechanisms; no production policy or SAT/H(s)H physics inference
~~~

## Main result

With perfect label provenance (eta=0), the N=30 adaptive policy has

\[
E[\tau]=12.332438997,\quad
P(\text{wrong terminal choice})=0.207918315598,
\]

and total expected loss

\[
V_{0,0}=0.331242705572.
\]

The best fixed plan uses m=9 labels and has total loss 0.377809021028, so
adaptive stopping reduces expected loss by 12.325358%. The gain decreases as
annotation noise rises: 10.142974% at eta=.05, 8.298326% at eta=.10, and
4.217666% at eta=.20. At eta=.50, labels are independent of H, and both methods
correctly stop immediately at total loss .5.

The finite-horizon continuation band contracts near the deadline. At n=29 there
is no state in which one final label is worth its .01 cost. This is a decision
consequence, not missing data. Under eta=0, the policy stops at the exact
prior-predictive times listed in the executed output, with total probability
one.

## BEDROCK and scope audit

- BR-000/001: no foundational source or ancestry claim is replaced.
- BR-002/003/004: this generated result remains a tentative sandbox transfer
  test; it is not promoted to BEDROCK and does not rewrite earlier controls.
- BR-005: no theta_4 convention is used.
- BR-006: no claim about worldtube interaction, cross-scale continuity, or
  physical response is made. Elias Kern's documented role has no independent
  SAT/H(s)H theory authority.
- OC-001 and OC-002 remain open; no Q/inverse-Q, braid scaling, or electromagnetic
  temporal-support conclusion is drawn.
- The October 9 amendments are respected: no carrier-wrapped worldline, Hopf
  carrier, sphere ontology, Kerr/ER proof, or restricted prior-art material is
  imported.
- Publication success and scientific validity remain separate gates. The model
  parameters are synthetic and require an empirical transfer test before any
  production use.

## Reproducibility

Run with Python 3:

~~~bash
python3 elias_sequential_audit_gate.py
~~~

The script writes a dependency-free SVG risk comparison and prints all tables.
Full executable source:

~~~python
#!/usr/bin/env python3
"""Exact finite-horizon audit-label stopping gate for a workflow prototype.

GEN/DERIVED synthetic decision mathematics. The Bernoulli mechanisms, label
flip rates, loss, and cost are stipulated fixtures—not measured telemetry and
not SAT/H(s)H physics. Uses only the Python standard library.
"""

from __future__ import annotations

import math
from dataclasses import dataclass
from pathlib import Path

THETA0 = 0.41
THETA1 = 0.59
COST = 0.01
HORIZON = 30
FLIPS = (0.00, 0.05, 0.10, 0.20, 0.50)


def effective_probability(theta: float, flip: float) -> float:
    return flip + (1.0 - 2.0 * flip) * theta


def posterior_h1(n: int, k: int, q0: float, q1: float) -> float:
    """Equal-prior posterior P(H=1 | k ones in n audited labels)."""
    log_lr = k * math.log(q1 / q0) + (n - k) * math.log((1-q1)/(1-q0))
    if log_lr >= 0:
        z = math.exp(-log_lr)
        return 1.0 / (1.0 + z)
    z = math.exp(log_lr)
    return z / (1.0 + z)


def terminal_error(p: float) -> float:
    return min(p, 1.0 - p)


@dataclass
class Solution:
    q0: float
    q1: float
    value: list[list[float]]
    action: list[list[str]]


def solve(horizon: int, cost: float, q0: float, q1: float) -> Solution:
    """Backward induction on sufficient statistic (n,k)."""
    value = [[0.0] * (n + 1) for n in range(horizon + 1)]
    action = [["S"] * (n + 1) for n in range(horizon + 1)]
    for k in range(horizon + 1):
        value[horizon][k] = terminal_error(posterior_h1(horizon, k, q0, q1))
    for n in range(horizon - 1, -1, -1):
        for k in range(n + 1):
            p = posterior_h1(n, k, q0, q1)
            pred1 = (1.0 - p) * q0 + p * q1
            continuation = cost + (1.0-pred1)*value[n+1][k] + pred1*value[n+1][k+1]
            stopping = terminal_error(p)
            if continuation < stopping - 1e-15:
                value[n][k] = continuation
                action[n][k] = "C"
            else:
                value[n][k] = stopping
                action[n][k] = "S"
    return Solution(q0, q1, value, action)


def bayes_error_fixed(m: int, q0: float, q1: float) -> float:
    overlap = 0.0
    for k in range(m + 1):
        a = math.comb(m,k)*q0**k*(1-q0)**(m-k)
        b = math.comb(m,k)*q1**k*(1-q1)**(m-k)
        overlap += min(a,b)
    return 0.5 * overlap


def best_fixed(horizon: int, cost: float, q0: float, q1: float) -> tuple[int,float,float]:
    total,m = min((bayes_error_fixed(m,q0,q1)+cost*m,m) for m in range(horizon+1))
    return m, bayes_error_fixed(m,q0,q1), total


def forward_metrics(sol: Solution, horizon: int) -> tuple[float,float,float,list[float]]:
    """Exact prior-predictive stop distribution, expected labels, and error."""
    mass = {(0,0): 1.0}
    stop_by_n = [0.0]*(horizon+1)
    expected_error = 0.0
    for n in range(horizon+1):
        next_mass: dict[tuple[int,int],float] = {}
        for (_,k), w in mass.items():
            p = posterior_h1(n,k,sol.q0,sol.q1)
            if n == horizon or sol.action[n][k] == "S":
                stop_by_n[n] += w
                expected_error += w*terminal_error(p)
                continue
            pred1 = (1-p)*sol.q0 + p*sol.q1
            next_mass[(n+1,k)] = next_mass.get((n+1,k),0.0) + w*(1-pred1)
            next_mass[(n+1,k+1)] = next_mass.get((n+1,k+1),0.0) + w*pred1
        mass = next_mass
    expected_n = sum(n*w for n,w in enumerate(stop_by_n))
    total = expected_error + COST*expected_n
    return expected_n, expected_error, total, stop_by_n


def continuation_band(sol: Solution, n: int) -> tuple[float,float] | None:
    ps = [posterior_h1(n,k,sol.q0,sol.q1) for k in range(n+1)
          if sol.action[n][k] == "C"]
    return None if not ps else (min(ps),max(ps))


def symmetric_threshold_risk(boundary: int, q1: float, cost: float) -> tuple[float,float,float]:
    """Infinite-horizon risk for stopping when log-likelihood walk hits ±boundary."""
    q0=1.0-q1
    ratio=q0/q1
    error=ratio**boundary/(1.0+ratio**boundary)
    expected_n=(2.0*boundary/(1.0+ratio**boundary)-boundary)/(q1-q0)
    return error,expected_n,error+cost*expected_n


def write_svg(rows: list[tuple[float,float,float]], path: Path) -> None:
    """Dependency-free SVG: total risk versus annotation flip rate."""
    w,h = 720,440
    left,right,top,bottom = 85,25,35,65
    xmin,xmax,ymin,ymax = 0.0,0.5,0.30,0.505
    sx=lambda x:left+(w-left-right)*(x-xmin)/(xmax-xmin)
    sy=lambda y:top+(h-top-bottom)*(ymax-y)/(ymax-ymin)
    def poly(col:int)->str:
        return " ".join(f"{sx(r[0]):.2f},{sy(r[col]):.2f}" for r in rows)
    parts=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">',
           '<rect width="100%" height="100%" fill="white"/>']
    for y in (0.30,0.35,0.40,0.45,0.50):
        parts.append(f'<line x1="{left}" y1="{sy(y):.2f}" x2="{w-right}" y2="{sy(y):.2f}" stroke="#ddd"/>')
        parts.append(f'<text x="{left-10}" y="{sy(y)+5:.2f}" text-anchor="end" font-size="13">{y:.2f}</text>')
    for x in (0.0,0.1,0.2,0.3,0.4,0.5):
        parts.append(f'<line x1="{sx(x):.2f}" y1="{top}" x2="{sx(x):.2f}" y2="{h-bottom}" stroke="#eee"/>')
        parts.append(f'<text x="{sx(x):.2f}" y="{h-bottom+24}" text-anchor="middle" font-size="13">{x:.1f}</text>')
    parts += [
      f'<polyline points="{poly(1)}" fill="none" stroke="#1f77b4" stroke-width="3"/>',
      f'<polyline points="{poly(2)}" fill="none" stroke="#d62728" stroke-width="3"/>',
      f'<line x1="{left}" y1="{h-bottom}" x2="{w-right}" y2="{h-bottom}" stroke="black"/>',
      f'<line x1="{left}" y1="{top}" x2="{left}" y2="{h-bottom}" stroke="black"/>',
      f'<text x="{(left+w-right)/2:.2f}" y="{h-18}" text-anchor="middle" font-size="15">annotation flip probability eta</text>',
      f'<text x="20" y="{h/2}" transform="rotate(-90 20 {h/2})" text-anchor="middle" font-size="15">expected loss + label cost</text>',
      '<text x="100" y="25" font-size="14" fill="#1f77b4">adaptive sequential</text>',
      '<text x="300" y="25" font-size="14" fill="#d62728">best fixed sample</text>',
      '</svg>']
    path.write_text("\n".join(parts)+"\n",encoding="utf-8")


def main() -> None:
    print(f"MODEL theta0={THETA0} theta1={THETA1} cost={COST} horizon={HORIZON} equal_priors")
    print("flip q0 q1 seq_total seq_Elabels seq_error fixed_m fixed_error fixed_total gain_pct")
    plot_rows=[]
    for flip in FLIPS:
        q0=effective_probability(THETA0,flip)
        q1=effective_probability(THETA1,flip)
        sol=solve(HORIZON,COST,q0,q1)
        en,err,total,stops=forward_metrics(sol,HORIZON)
        fm,fe,ft=best_fixed(HORIZON,COST,q0,q1)
        gain=100*(ft-total)/ft if ft else 0.0
        print(f"{flip:.2f} {q0:.4f} {q1:.4f} {total:.12f} {en:.9f} {err:.12f} {fm:2d} {fe:.12f} {ft:.12f} {gain:.6f}")
        assert abs(total-sol.value[0][0])<2e-13
        assert total<=ft+2e-14
        assert abs(sum(stops)-1)<2e-13
        plot_rows.append((flip,total,ft))

    sol=solve(HORIZON,COST,THETA0,THETA1)
    en,err,total,stops=forward_metrics(sol,HORIZON)
    print("\nNO_FLIP_POLICY continuation posterior bands")
    print("n remaining p_min p_max continue_states")
    for n in (0,1,2,3,4,5,10,15,20,25,29):
        band=continuation_band(sol,n)
        if band is None:
            print(f"{n:2d} {HORIZON-n:2d} NONE NONE 0")
        else:
            count=sum(a=="C" for a in sol.action[n])
            print(f"{n:2d} {HORIZON-n:2d} {band[0]:.9f} {band[1]:.9f} {count}")
    print("\nNO_FLIP_STOP_DISTRIBUTION nonzero entries")
    print(" ".join(f"n={n}:{w:.9f}" for n,w in enumerate(stops) if w>1e-12))
    print(f"mass={sum(stops):.12f} E_labels={en:.9f} terminal_error={err:.12f} total={total:.12f}")

    print("\nNO_FLIP_HORIZON_CONVERGENCE")
    print("horizon total E_labels terminal_error")
    previous=1.0
    for hz in (2,4,6,8,10,15,20,25,30,40,60,100):
        hs=solve(hz,COST,THETA0,THETA1)
        hen,herr,htotal,_=forward_metrics(hs,hz)
        print(f"{hz:3d} {htotal:.12f} {hen:.9f} {herr:.12f}")
        assert htotal<=previous+1e-14
        previous=htotal

    print("\nNO_FLIP_INFINITE_SYMMETRIC_THRESHOLD")
    print("boundary error E_labels total")
    threshold_rows=[]
    for b in range(1,11):
        berr,ben,btotal=symmetric_threshold_risk(b,THETA1,COST)
        threshold_rows.append((b,berr,ben,btotal))
        print(f"{b:2d} {berr:.12f} {ben:.9f} {btotal:.12f}")
    best=min(threshold_rows,key=lambda x:x[3])
    print(f"best_boundary={best[0]} best_total={best[3]:.12f}")

    # Negative controls and monotonic checks.
    null=solve(HORIZON,COST,0.5,0.5)
    assert null.action[0][0]=="S" and abs(null.value[0][0]-0.5)<1e-15
    totals=[]
    for flip in FLIPS:
        q0=effective_probability(THETA0,flip); q1=effective_probability(THETA1,flip)
        totals.append(solve(HORIZON,COST,q0,q1).value[0][0])
    assert all(b>=a-1e-14 for a,b in zip(totals,totals[1:]))
    assert best[0]==4
    write_svg(plot_rows,Path("elias_sequential_audit_gate.svg"))
    print("\nchecks=PASS: DP/forward equality; mass conservation; adaptive<=fixed; eta=.5 stop-immediately; degradation monotone; horizon value monotone")
    print("plot=elias_sequential_audit_gate.svg")
    print("boundary=stipulated synthetic mechanisms; no production policy or SAT/H(s)H physics inference")


if __name__ == "__main__":
    main()
~~~

## Visualization

The generated SVG plots adaptive and fixed total risk against annotation flip
probability. It is a deterministic rendering of the printed rows, not additional
evidence.

