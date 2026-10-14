# Elias Kern | Strict-priority gate busy-period counterexample (2026-10-14)

**SANDBOXED.** Mathematical workflow experiment, not SAT/H(s)H physics, not a production switchboard rule, and not a claim of original Elias ChatGPT participation.

## Source-grounded starting point

The existing switchboard POC has a deterministic wake precedence: an unresolved fresh directive selects `incorporate_fresh_directive` before the requested bounded operation. The POC is a planner; the wake method does **not** itself mark that directive incorporated. Its existing registry/authority controls remain untouched. Elias's 2026-10-12 actor-registration fixture already distinguished identity admissibility from operational readiness. This pass studies what happens when such a priority gate is repeatedly invoked.

**Deterministic counterexample:** Hold `fresh=True, incorporated=False` without external state mutation and call the wake priority branch 1,000 times. All 1,000 select directive incorporation, none selects calculation. Setting `fresh=False` immediately admits calculation. This is a conditional livelock of the *unchanged planner state*, not proof of any actual production failure.

## Explicit stochastic extension (new construction, not upstream POC behavior)

Start with **one pending directive**. Each priority-service slot completes one directive and receives an independent Poisson number of new directives with mean `lambda`. Science work is allowed only after the backlog clears. No parallel processing, abandonment, or other blockers. Units: `lambda` = directives per service slot; `B` = slots until first opportunity to resume science.

The busy-period probability generating function obeys the branching equation

```text
G(z) = z * exp(lambda * (G(z) - 1)).
```

Lagrange inversion gives the **exact Borel mass**

```text
P(B=n) = exp(-lambda*n) * (lambda*n)^(n-1) / n!,  n>=1.
```

For `0 <= lambda < 1`,

```text
E[B] = 1/(1-lambda);
Var[B] = lambda/(1-lambda)^3.
```

At `lambda=1`, clearance is almost sure but expected delay diverges. At `lambda>1`, the finite-clearance probability `q<1` solves `q=exp(lambda*(q-1))`; thus `P(B=infinity)=1-q`.

## Computed fixtures

| lambda | E[B], slots | SD[B], slots | P(B>100) | P(B>1000) | P(B=infinity) | 95th percentile | 99th percentile |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 0.80 | 5 | 10 | 0.00137596 | <1e-8 | 0 | 20 | 50 |
| 0.90 | 10 | 30 | 0.01716058 | 0.00000982 | 0 | 43 | 140 |
| 0.95 | 20 | 87.18 | 0.04088507 | 0.00151542 | 0 | 80 | 357 |
| 0.99 | 100 | 994.99 | 0.07064298 | 0.01661684 | 0 | 183 | 1922 |
| 1.00 | infinite | infinite | 0.07956749 | 0.02522432 | 0 | 255 | 6366 |
| 1.10 | infinite | infinite | 0.19209217 | 0.17615167 | 0.17613414 | infinite | infinite |

A 100,000-trial independent queue simulation returned `P(B>100)` of 0.00141000 (lambda 0.80), 0.03988000 (0.95), and 0.19271000 (1.10), all within 1.63 estimated standard errors of the exact results.

## Minimal independent reproduction

```python
import math
def pmf(lam,n):
    if lam==0: return float(n==1)
    return math.exp(-lam*n+(n-1)*math.log(lam*n)-math.lgamma(n+1))
for lam in (0.8,0.9,0.95,0.99,1.0,1.1):
    tail100 = 1-sum(pmf(lam,n) for n in range(1,101))
    print(lam, round(tail100,8))
```

Full local executable: `elias_priority_busy_period_gate.py` (reproduces exact distributions, controls and Class-P plot; supplied as conversation artifact).

## Discriminator and interpretation

The key distinction is **priority safety vs progress liveness**. A safety-preserving gate can still indefinitely postpone calculation if the state never advances, or can have a heavy-tailed delay under a near-capacity arrival model. This motivates a *sandbox transfer test* that separately checks incorporation-state mutation, service capacity, and guaranteed bounded scientific work without silently relaxing locked TOP authority. It does **not** authorize a new scheduling policy. Real directive arrivals have not been shown to follow the synthetic Poisson model.

Source anchors: `WORKSPACES/ELIAS_KERN/README.md` (blob `5546d022...`), `WORKSPACES/ELIAS_KERN/SANDBOX_2026-10-12_ACTOR_REGISTRY_FAIL_CLOSED_TEST.md` (blob `8fe4070d...`), internal switchboard POC code (blob `49988a76...`). No private reference URLs exposed.
