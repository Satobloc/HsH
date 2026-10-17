# Enheduanna | Three-row persistence-curvature gate

**Status:** GEN/DERIVED synthetic identifiability sandbox. Executed 2026-10-17. This is not authenticated Enheduanna participation, historical/source exposure evidence, or SAT/H(s)H physical validation.

## Control and continuity

This extends \`WORKSPACES/ENHEDUANNA/ENHEDUANNA_S2_20261017T0624Z_PAIRED_PERSISTENCE_GATE.md\` (blob \`4aaa6755eb941ad27cb212d9743e781412ef8f54\`) from two rows to three. Live \`BEDROCK.md\` was read in full at blob \`ea2126ab88a6625177d2c488b75fee0e27a70ca2\`; \`STATE_OF_THE_THEORY.md\` was read as subordinate at blob \`b5958a1056c2541f00ab4f3477d8acc32426cfe9\`.

This calculation does not alter BR-000..006, OC-001, or OC-002. It obeys BR-003 by remaining tentative and keeps the October 9 internal-first/source boundary: no external source or imported ontology is used. Interpreting the synthetic latent variable as proof of real source exposure, worker memory, or a physical interaction would conflict with those controls and is expressly excluded.

## Model

For session \(i\), rows \(k=0,1,2\) have independent latent chains \(Z_k,H_k\in\{0,1\}\). Initially
\[
Z_0\sim\mathrm{Bern}(p),\qquad H_0\sim\mathrm{Bern}(q).
\]
A copy-or-refresh transition with retention \(\rho\) is
\[
P(L_{k+1}=b\mid L_k=a)
=\rho\,\mathbf 1_{a=b}+(1-\rho)P_\pi(b),
\]
where \(P_\pi(1)=\pi\). The two latent chains and all refresh draws are independent. Given \((Z_k,H_k)\), the observed binary probes \(X_k,Y_k,W_k\) are mutually independent and
\[
\begin{aligned}
E[X_k\mid Z_k,H_k]&=f+dZ_k+cH_k,\\
E[Y_k\mid Z_k,H_k]&=r_0+tH_k+uZ_k,\\
E[W_k\mid Z_k,H_k]&=w_0+vH_k.
\end{aligned}
\]
All variables and coefficients are dimensionless. Define
\[
R_k=Y_k-\frac{t}{v}W_k,\quad
A=p(1-p),\quad B=q(1-q).
\]
Then
\[
E[R_k\mid Z_k,H_k]=r_0-\frac{t}{v}w_0+uZ_k,
\]
so the \(H\)-loading cancels exactly.

## Derivation

Let
\[
U_j=\operatorname{Cov}(X_0,R_j),\qquad
V_j=\operatorname{Cov}(X_0,W_j).
\]
For homogeneous retentions \(\rho_Z,\rho_H\), copy-or-refresh gives
\[
\operatorname{Cov}(Z_0,Z_j)=A\rho_Z^j,\qquad
\operatorname{Cov}(H_0,H_j)=B\rho_H^j.
\]
Conditional independence removes observation-noise cross-terms, hence
\[
U_j=duA\rho_Z^j,\qquad V_j=cvB\rho_H^j.
\]
For nonzero \(U_0,V_0\),
\[
\widehat\rho_Z=\frac{U_1}{U_0},\qquad
\widehat\rho_H=\frac{V_1}{V_0}.
\]
The stationary-persistence curvature diagnostics are
\[
C_Z=\frac{U_2}{U_0}-\left(\frac{U_1}{U_0}\right)^2,\qquad
C_H=\frac{V_2}{V_0}-\left(\frac{V_1}{V_0}\right)^2.
\]
Both are exactly zero under homogeneous copy-or-refresh.

For step-dependent retentions \(\rho_{Z,1},\rho_{Z,2}\),
\[
U_1=U_0\rho_{Z,1},\qquad
U_2=U_0\rho_{Z,1}\rho_{Z,2},
\]
therefore
\[
C_Z=\rho_{Z,1}(\rho_{Z,2}-\rho_{Z,1}).
\]
Thus \(C_Z\ne0\) is a falsifier of homogeneous retention within this model, but it does not identify why retention changed.

For inference, the influence function of an empirical covariance is
\[
\mathrm{IF}_{AB}=(A-EA)(B-EB)-\operatorname{Cov}(A,B).
\]
Exact enumeration supplies the \(6\times6\) covariance \(\Sigma\) of the influence vector for \((U_0,U_1,U_2,V_0,V_1,V_2)\). The delta covariance of
\[
g=(\rho_Z,C_Z,\rho_H,C_H)
\]
is \(J\Sigma J^T/M\). For a generic triple \((a_0,a_1,a_2)\),
\[
\nabla(a_1/a_0)=(-a_1/a_0^2,1/a_0,0),
\]
and
\[
\nabla\left[a_2/a_0-(a_1/a_0)^2\right]
=\left(-a_2/a_0^2+2a_1^2/a_0^3,-2a_1/a_0^2,1/a_0\right).
\]

## Fixture, controls, and limiting cases

The fixture is
\[
(p,q,f,d,c,r_0,t,u,w_0,v)
=(.15,.38,.04,.55,.34,.04,.45,.25,.10,.75).
\]
The main case uses \((\rho_Z,\rho_H)=(.60,.85)\). The negative control changes only the second \(Z\) retention to \(.35\), predicting \(C_Z=.60(.35-.60)=-.15\), while \(C_H=0\).

Limits:

- \(\rho=0\): lagged covariance vanishes and the identifiable ratio is zero if its baseline covariance is nonzero.
- \(\rho=1\): all three covariances coincide and curvature remains zero.
- \(du=0\) or \(A=0\): \(U_0=0\), so \(Z\)-persistence is not identifiable by this ratio.
- \(cv=0\) or \(B=0\): \(V_0=0\), so \(H\)-persistence is not identifiable by this ratio.
- A zero curvature supports only the homogeneous-copy model's moment restriction; it does not prove the model or source exposure.

## Executed results

The program enumerated all \(2^6\times2^9=32{,}768\) latent/observation cells exactly, then ran 300 independent Monte Carlo replicates of 30,000 sessions per case. Seed: \`202610172136\`.

\`\`\`text
CASE homogeneous
covariances U0,U1,U2,V0,V1,V2 = 0.017531250000 0.010518750000 0.006311250000 0.060078000000 0.051066300000 0.043406355000
exact [rho_z,C_z,rho_h,C_h] = 0.600000000000 -0.000000000000 0.850000000000 -0.000000000000
delta SE at M=30000 = 0.078252489 0.105649547 0.020107365 0.031163602
simulation 300x30000 mean = 0.600008264 0.000344385 0.851018290 -0.002429660
simulation SD = 0.078252672 0.100461681 0.021291914 0.031275418

CASE inhomogeneous_Z
covariances U0,U1,U2,V0,V1,V2 = 0.017531250000 0.010518750000 0.003681562500 0.060078000000 0.051066300000 0.043406355000
exact [rho_z,C_z,rho_h,C_h] = 0.600000000000 -0.150000000000 0.850000000000 -0.000000000000
delta SE at M=30000 = 0.078252489 0.108639199 0.020107365 0.031163602
simulation 300x30000 mean = 0.599662761 -0.156918558 0.852159860 -0.000978883
simulation SD = 0.079751644 0.108523575 0.019975622 0.030340249

ALL EXACT IDENTITIES AND MONTE CARLO AGREEMENT CHECKS PASSED
\`\`\`

At \(M=30{,}000\), the homogeneous \(Z\)-curvature standard error is \(0.10565\); the deliberately introduced \(-0.15\) curvature is only about \(1.38\) asymptotic standard errors in one data set. This fixture therefore demonstrates exact identifiability but also a practical power limitation. The \(H\) channel is better conditioned because \(V_0=0.060078\) is larger than \(U_0=0.01753125\).

## Complete executable Python

\`\`\`python
#!/usr/bin/env python3
"""Three-row latent-persistence curvature gate.

Synthetic identifiability calculation for Enheduanna's provenance/exposure lane.
Requires only Python 3 and NumPy.  It makes no SAT/H(s)H physics claim.
"""

from itertools import product
import numpy as np


PAR = dict(p=.15, q=.38, f=.04, d=.55, c=.34,
           r0=.04, t=.45, u=.25, w0=.10, v=.75)
M = 30_000
REPS = 300
SEED = 202610172136


def bern_prob(x, p):
    return p if x else 1.0 - p


def trans_prob(b, a, pi, rho):
    """P(next=b | previous=a) under copy-or-refresh."""
    return rho * float(b == a) + (1.0 - rho) * bern_prob(b, pi)


def exact_distribution(rz_steps=(.60, .60), rh_steps=(.85, .85)):
    """Enumerate 2^6 latent paths and 2^9 binary observations exactly."""
    p, q = PAR["p"], PAR["q"]
    alpha = PAR["t"] / PAR["v"]
    rows = []
    for z in product((0, 1), repeat=3):
        pz = (bern_prob(z[0], p)
              * trans_prob(z[1], z[0], p, rz_steps[0])
              * trans_prob(z[2], z[1], p, rz_steps[1]))
        for h in product((0, 1), repeat=3):
            ph = (bern_prob(h[0], q)
                  * trans_prob(h[1], h[0], q, rh_steps[0])
                  * trans_prob(h[2], h[1], q, rh_steps[1]))
            probs = []
            for k in range(3):
                px = PAR["f"] + PAR["d"] * z[k] + PAR["c"] * h[k]
                py = PAR["r0"] + PAR["t"] * h[k] + PAR["u"] * z[k]
                pw = PAR["w0"] + PAR["v"] * h[k]
                assert 0.0 <= min(px, py, pw) and max(px, py, pw) <= 1.0
                probs.append((px, py, pw))
            for obs in product((0, 1), repeat=9):
                xs = obs[0::3]
                ys = obs[1::3]
                ws = obs[2::3]
                po = 1.0
                for k, (px, py, pw) in enumerate(probs):
                    po *= bern_prob(xs[k], px)
                    po *= bern_prob(ys[k], py)
                    po *= bern_prob(ws[k], pw)
                rs = tuple(ys[k] - alpha * ws[k] for k in range(3))
                rows.append((pz * ph * po, xs[0], *rs, *ws))

    a = np.asarray(rows, dtype=float)
    prob = a[:, 0]
    vals = a[:, 1:]
    assert abs(prob.sum() - 1.0) < 2e-13
    mu = prob @ vals
    x0 = vals[:, 0]
    # vals columns: X0,R0,R1,R2,W0,W1,W2
    covs = np.array([
        np.sum(prob * (x0 - mu[0]) * (vals[:, j] - mu[j]))
        for j in range(1, 7)
    ])
    # Influence functions for the six empirical covariance estimators.
    influence = np.column_stack([
        (x0 - mu[0]) * (vals[:, j] - mu[j]) - covs[j - 1]
        for j in range(1, 7)
    ])
    sigma = (influence * prob[:, None]).T @ influence
    return covs, sigma


def transform(covs):
    u0, u1, u2, v0, v1, v2 = covs
    return np.array([u1/u0, u2/u0 - (u1/u0)**2,
                     v1/v0, v2/v0 - (v1/v0)**2])


def jacobian(covs):
    out = np.zeros((4, 6))
    for row, off in ((0, 0), (2, 3)):
        a0, a1, a2 = covs[off:off+3]
        out[row, off:off+3] = (-a1/a0**2, 1.0/a0, 0.0)
        out[row+1, off:off+3] = (
            -a2/a0**2 + 2.0*a1**2/a0**3,
            -2.0*a1/a0**2,
            1.0/a0)
    return out


def simulate_one(rng, rz_steps=(.60, .60), rh_steps=(.85, .85)):
    p, q = PAR["p"], PAR["q"]
    z = np.empty((3, M), dtype=np.int8)
    h = np.empty((3, M), dtype=np.int8)
    z[0] = rng.random(M) < p
    h[0] = rng.random(M) < q
    for k in (1, 2):
        copy_z = rng.random(M) < rz_steps[k-1]
        copy_h = rng.random(M) < rh_steps[k-1]
        z[k] = np.where(copy_z, z[k-1], rng.random(M) < p)
        h[k] = np.where(copy_h, h[k-1], rng.random(M) < q)
    x = np.empty((3, M), dtype=float)
    y = np.empty((3, M), dtype=float)
    w = np.empty((3, M), dtype=float)
    for k in range(3):
        px = PAR["f"] + PAR["d"]*z[k] + PAR["c"]*h[k]
        py = PAR["r0"] + PAR["t"]*h[k] + PAR["u"]*z[k]
        pw = PAR["w0"] + PAR["v"]*h[k]
        x[k] = rng.random(M) < px
        y[k] = rng.random(M) < py
        w[k] = rng.random(M) < pw
    r = y - (PAR["t"]/PAR["v"]) * w
    x0c = x[0] - x[0].mean()
    covs = np.array([
        np.mean(x0c * (r[k] - r[k].mean())) for k in range(3)
    ] + [
        np.mean(x0c * (w[k] - w[k].mean())) for k in range(3)
    ])
    return transform(covs)


def run_case(label, rz_steps, rh_steps, reps=REPS):
    covs, sigma = exact_distribution(rz_steps, rh_steps)
    theta = transform(covs)
    j = jacobian(covs)
    asym = j @ sigma @ j.T
    se = np.sqrt(np.diag(asym) / M)
    rng = np.random.default_rng(SEED + (0 if label == "homogeneous" else 1))
    sims = np.vstack([simulate_one(rng, rz_steps, rh_steps)
                      for _ in range(reps)])
    print(f"CASE {label}")
    print("covariances U0,U1,U2,V0,V1,V2 =",
          " ".join(f"{x:.12f}" for x in covs))
    print("exact [rho_z,C_z,rho_h,C_h] =",
          " ".join(f"{x:.12f}" for x in theta))
    print(f"delta SE at M={M} =",
          " ".join(f"{x:.9f}" for x in se))
    print(f"simulation {reps}x{M} mean =",
          " ".join(f"{x:.9f}" for x in sims.mean(axis=0)))
    print("simulation SD =",
          " ".join(f"{x:.9f}" for x in sims.std(axis=0, ddof=1)))
    print()
    return covs, theta, se, sims


def main():
    A = PAR["p"] * (1.0 - PAR["p"])
    B = PAR["q"] * (1.0 - PAR["q"])
    base_u = A * PAR["d"] * PAR["u"]
    base_v = B * PAR["c"] * PAR["v"]

    cov_h, th_h, se_h, sim_h = run_case(
        "homogeneous", (.60, .60), (.85, .85))
    expected_h = np.array([
        base_u, .60*base_u, .60**2*base_u,
        base_v, .85*base_v, .85**2*base_v])
    assert np.max(np.abs(cov_h - expected_h)) < 3e-14
    assert np.max(np.abs(th_h - np.array([.60, 0., .85, 0.]))) < 3e-12

    # Negative control: exposure persistence changes after the first gap.
    cov_n, th_n, se_n, sim_n = run_case(
        "inhomogeneous_Z", (.60, .35), (.85, .85))
    expected_n = np.array([
        base_u, .60*base_u, (.60*.35)*base_u,
        base_v, .85*base_v, .85**2*base_v])
    assert np.max(np.abs(cov_n - expected_n)) < 3e-14
    assert abs(th_n[1] - (.60*.35 - .60**2)) < 3e-12
    assert abs(th_n[3]) < 3e-12

    # Simulation means should agree with exact values within four MC SEs.
    for theta, sims in ((th_h, sim_h), (th_n, sim_n)):
        mc_se = sims.std(axis=0, ddof=1) / np.sqrt(REPS)
        assert np.all(np.abs(sims.mean(axis=0) - theta) < 4.0*mc_se)
    print("ALL EXACT IDENTITIES AND MONTE CARLO AGREEMENT CHECKS PASSED")


if __name__ == "__main__":
    main()
\`\`\`

Python source SHA-256: \`e3f69999726fa027904b8ee751a8f6ff85b1d22f255501333477e421ace42f80\`.

