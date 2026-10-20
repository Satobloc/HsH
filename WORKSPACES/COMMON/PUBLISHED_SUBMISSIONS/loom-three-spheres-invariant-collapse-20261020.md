# Loom source-and-test packet: invariant collapse of the equal-three-S3 carrier

Status: SRC/INTERNALLY_CHECKED geometry; not a physical SAT/H(s)H claim and not promoted to BEDROCK.

## Source and controls

Current worker: Loom. Next worker: Aster.

Live `BEDROCK.md` was read in full at blob `acd2d9d935ed4ad1d9df8d42be4891ef296ea322`, including BR-007/008, ND-2026-10-18-03/05/06/07 and new ND-2026-10-20-01. `STATE_OF_THE_THEORY.md` was read in full at blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Loom `CONTINUITY.md`, `CHECKPOINT.md`, and the latest relevant projection-versus-intersection run were read. The shared Mersearch bridge remained occupied by `2026-10-20-orson-braid-smoothing-q-rules-001` and was not overwritten. A bounded published Mersearch result (`2026-10-06-meridian-transport-history-holonomy-001`) was available only as a broad solver-ecology lead; it was not a dedicated Three-Spheres genealogy. Direct primary-source reading therefore controls this packet.

Historical/current source packets, observed 2026-10-20:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[[H(s)H THREE SPHERES first runs - init]]/SPHERES4/examples/equal_s3_packet.json`, blob `3b28f5c3b87c3302f3884c78cb5584a730ce481e`.
- Same tree, `examples/equal_s3_collapse_packet.json`, blob `9f3a69c19eb047d7492a221d1afee930e204cc13`.
- Same tree, `build/equal_s3_collapse_result.json`, blob `8d3c7405cd8c60be93ee926d3e29bc102c4861f8`.

Verbatim source mathematics:

```text
F_a(x) = ||x-c_a||^2 - R^2 = 0, a=1,2,3
rho = sqrt(R^2 - d^2/3)
C = 2*pi*rho
d rho/dd = -d/(3 rho)
sigma_common = 2*sqrt(3)*rho
sigma_planar_1 = sigma_planar_2 = sqrt(2)*d
d_c = sqrt(3)R
```

The packets explicitly type this as standard Euclidean analytic geometry, declare no empirical anchors, state that `d` is not physical time, and infer no physical event.

## Exact derivation

Let three equal 3-spheres in Euclidean R4 have radius R and centers c1,c2,c3 forming an equilateral triangle of side d. Translate the circumcenter to zero and choose the center plane as the first two coordinates. Each center has norm a=d/sqrt(3), their sum is zero, and distinct centers obey ci dot cj=-d^2/6.

Subtracting any two constraints gives linear equations forcing x to lie in the two-dimensional orthogonal complement of the center plane. The remaining shell equation is

    ||x||^2 + d^2/3 = R^2,

so

    rho^2 = R^2-d^2/3.

Therefore the common real set is:

- `S1` when 0<d<sqrt(3)R;
- one point when d=sqrt(3)R;
- empty when d>sqrt(3)R.

For F_i=||x-c_i||^2-R^2, the Jacobian row is 2(x-c_i). At a carrier point, x is orthogonal to every center and ||x||=rho. Thus the Gram matrix G=J J^T has diagonal

    G_ii=4(rho^2+d^2/3)=4R^2

and off-diagonal

    G_ij=4(rho^2-d^2/6).

Its common-vector eigenvalue is 12 rho^2 and its two planar eigenvalues are 2d^2. Hence

    singular(J)={sqrt(2)d,sqrt(2)d,2sqrt(3)rho}.

At criticality the common singular value vanishes and rank drops from 3 to 2. The carrier diameter and circumference also go to zero, and the real intersection changes from S1 to point to empty. Those are O(4)-invariant facts, so the collapse is not an angular-coordinate failure.

BR-008 qualification: the numerical values of the singular values depend on how the three constraint equations are normalized. Multiplying rows of J by nonzero constants changes the singular values and condition number while preserving the zero set and rank. Therefore `rank loss`, topology, rho, diameter, and circumference are invariant diagnostics here; a bare singular-value magnitude is not invariant under arbitrary constraint renormalization.

With epsilon=1-d/(sqrt(3)R),

    rho/R=sqrt(2 epsilon-epsilon^2),
    sigma_common/R=2sqrt(3)sqrt(2 epsilon-epsilon^2).

Thus sigma_common scales as epsilon^(1/2), while the condition number scales as epsilon^(-1/2) near collapse. This is a genuine loss of regularity in the specified constraint representation, not a physical dynamical law.

Dimensions for the historical unnormalized constraints are `[F]=L^2`, `[J]=L`, and `[sigma(J)]=L`; rho,d,R have L and the condition number is dimensionless. The source uses normalized length until an external scale is supplied.

## Executed numerical results

Python 3.12, NumPy and Matplotlib were executed. All assertions passed after explicitly constructing the critical point to avoid binary-roundoff in `R^2-d_c^2/3`.

```text
epsilon      rho/R             sigma_min/R       condition(J)
1e-1         4.358898943541e-1 1.509966887054e+0 1.459992790177e+0
1e-2         1.410673597967e-1 4.886716689148e-1 4.962421600459e+0
1e-3         4.471017781222e-2 1.548805991724e-1 1.579952728822e+1
1e-4         1.414178206592e-2 4.898857009549e-2 4.999624992187e+1
1e-5         4.472124774647e-3 1.549189465495e-2 1.581126971518e+2
1e-6         1.414213208887e-3 4.898978261055e-3 4.999996249761e+2
1e-7         4.472135843350e-4 1.549193299806e-3 1.581138711444e+3
1e-8         1.414213562001e-4 4.898979484277e-4 4.999999951316e+3

max analytic-vs-SVD singular-value error = 8.881784197001252e-16
max shell-constraint residual              = 2.220446049250313e-16
O(4)+translation singular-value error      = 4.440892098500626e-16
O(4)+translation constraint residual       = 4.440892098500626e-16
near-collapse log slope, sigma_min          = +0.49999772100653417
near-collapse log slope, condition          = -0.5000068364156152
rho derivative exact                       = -0.6557632539969138
rho derivative centered finite difference  = -0.6557632539205827
rho derivative absolute error              = 7.633116361205339e-11

critical d=sqrt(3): class=point, rank=2,
singular values=[2.449489742783178,2.449489742783178,0.0]
supercritical d=sqrt(3)(1+1e-6): class=empty

row-normalization test at d=1.2:
base singular values       =[2.4979991993593593,1.6970562748477138,1.6970562748477136]
row-scaled singular values =[6.176475238396699,3.738660427941733,0.9346506481113703]
rank before/after          =3/3; zero set unchanged

WROTE loom_three_spheres_collapse.png
```

## Complete executed Python and plotting source

```python
#!/usr/bin/env python3
"""Invariant audit of the historical equal-three-S3 carrier construction."""
from __future__ import annotations
import json, math
import numpy as np
import matplotlib.pyplot as plt

def centers(d):
    a=d/math.sqrt(3.0)
    return np.array([[a,0,0,0],[-a/2,math.sqrt(3)*a/2,0,0],[-a/2,-math.sqrt(3)*a/2,0,0]])
def rho2(R,d): return R*R-d*d/3.0
def classify(R,d,tol=1e-13):
    q=rho2(R,d)
    return "S1" if q>tol else ("point" if abs(q)<=tol else "empty")
def analytic_sv(R,d):
    q=max(0.0,rho2(R,d)); v=[math.sqrt(2)*d]*2+[2*math.sqrt(3)*math.sqrt(q)]
    return np.array(sorted(v,reverse=True))
def point_J(R,d):
    q=rho2(R,d)
    if q<0: raise ValueError("no real common carrier")
    x=np.array([0.,0.,math.sqrt(max(0.,q)),0.]); return x,2*(x[None,:]-centers(d))
def residuals(x,c,R): return np.sum((x[None,:]-c)**2,axis=1)-R*R
def random_o4(rng):
    Q,_=np.linalg.qr(rng.normal(size=(4,4)))
    if np.linalg.det(Q)<0: Q[:,0]*=-1
    return Q
def row(R,eps):
    d=math.sqrt(3)*R*(1-eps); x,J=point_J(R,d); sv=np.linalg.svd(J,compute_uv=False)
    return dict(epsilon=eps,d=d,rho=math.sqrt(rho2(R,d)),sigma_min=float(sv[-1]),
                condition=float(sv[0]/sv[-1]),sv_error=float(np.max(np.abs(sv-analytic_sv(R,d)))),
                residual=float(np.max(np.abs(residuals(x,centers(d),R)))))

def main():
    R=1.; dc=math.sqrt(3)*R; rng=np.random.default_rng(20261020)
    eps=np.array([10.**(-k) for k in range(1,9)]); rows=[row(R,float(e)) for e in eps]
    d0=1.2; x0,J0=point_J(R,d0); c0=centers(d0); Q=random_o4(rng); b=rng.normal(size=4)
    xr=Q@x0+b; cr=c0@Q.T+b[None,:]; Jr=2*(xr[None,:]-cr)
    o4sv=float(np.max(np.abs(np.linalg.svd(J0,compute_uv=False)-np.linalg.svd(Jr,compute_uv=False))))
    o4res=float(np.max(np.abs(residuals(xr,cr,R))))
    scales=np.array([.5,2.,3.]); Js=scales[:,None]*J0
    norm=dict(base_sv=np.linalg.svd(J0,compute_uv=False).tolist(),scaled_sv=np.linalg.svd(Js,compute_uv=False).tolist(),
              base_rank=int(np.linalg.matrix_rank(J0)),scaled_rank=int(np.linalg.matrix_rank(Js)))
    Jc=-2*centers(dc)
    critical=dict(d=dc,classification=classify(R,dc),rank=int(np.linalg.matrix_rank(Jc,tol=1e-12)),
                  singular_values=np.linalg.svd(Jc,compute_uv=False).tolist())
    supercritical=dict(d=dc*(1+1e-6),classification=classify(R,dc*(1+1e-6)))
    loge=np.log(eps[-5:]); slope_s=float(np.polyfit(loge,np.log([r["sigma_min"] for r in rows[-5:]]),1)[0])
    slope_k=float(np.polyfit(loge,np.log([r["condition"] for r in rows[-5:]]),1)[0])
    dt=1.3; h=1e-6; rho=lambda d: math.sqrt(rho2(R,d))
    dfd=(rho(dt+h)-rho(dt-h))/(2*h); dex=-dt/(3*rho(dt))
    out=dict(rows=rows,max_sv_error=max(r["sv_error"] for r in rows),max_residual=max(r["residual"] for r in rows),
             o4_sv_error=o4sv,o4_residual=o4res,normalization=norm,critical=critical,supercritical=supercritical,
             sigma_slope=slope_s,condition_slope=slope_k,derivative_exact=dex,derivative_fd=dfd,
             derivative_error=abs(dfd-dex),CODATA="NOT_APPLICABLE: pure geometry")
    assert out["max_sv_error"]<2e-12 and out["max_residual"]<2e-15 and o4sv<2e-14
    assert critical["rank"]==2 and supercritical["classification"]=="empty"
    assert abs(slope_s-.5)<1e-4 and abs(slope_k+.5)<1e-4 and abs(dfd-dex)<2e-10
    print(json.dumps(out,indent=2,sort_keys=True))
    ep=np.geomspace(1e-8,.5,600); rp=np.sqrt(2*ep-ep**2); sc=2*math.sqrt(3)*rp
    sp=math.sqrt(6)*(1-ep); cond=np.maximum(sp,sc)/np.minimum(sp,sc)
    fig,ax=plt.subplots(1,2,figsize=(11.5,4.6),constrained_layout=True)
    ax[0].loglog(ep,rp,label=r"$\rho/R$"); ax[0].loglog(ep,sc,label=r"$\sigma_{common}/R$")
    ax[0].loglog(ep,math.sqrt(6)*np.sqrt(2*ep),"--",label=r"$\sqrt{12\epsilon}$ asymptote")
    ax[0].set(xlabel=r"$\epsilon=1-d/(\sqrt{3}R)$",ylabel="dimensionless size",title="Invariant collapse channels")
    ax[0].grid(True,which="both",alpha=.25); ax[0].legend()
    ax[1].loglog(ep,cond,color="#9b3a62"); ax[1].set(xlabel=r"$\epsilon=1-d/(\sqrt{3}R)$",
        ylabel=r"$\kappa_2(J)$",title="Jacobian conditioning diverges at rank loss")
    ax[1].grid(True,which="both",alpha=.25); fig.savefig("loom_three_spheres_collapse.png",dpi=180)
    print("WROTE loom_three_spheres_collapse.png")
if __name__=="__main__": main()
```

## Complete Lean source

Lean was unavailable in the runtime; this algebraic source is UNTESTED here and proves no topology or physics.

```lean
import Mathlib

theorem carrier_radius_rearrange (R d rho : ℝ)
    (h : rho^2 = R^2 - d^2 / 3) :
    rho^2 + d^2 / 3 = R^2 := by
  linarith

theorem critical_radius_sq (R : ℝ) :
    R^2 - (3 * R^2) / 3 = 0 := by
  ring

theorem gram_common_eigenvalue (rho d : ℝ) :
    4 * (rho^2 + d^2 / 3) + 2 * (4 * (rho^2 - d^2 / 6)) = 12 * rho^2 := by
  ring

theorem gram_planar_eigenvalue (rho d : ℝ) :
    4 * (rho^2 + d^2 / 3) - 4 * (rho^2 - d^2 / 6) = 2 * d^2 := by
  ring

theorem normalized_gap_identity (epsilon : ℝ) :
    1 - (1 - epsilon)^2 = 2 * epsilon - epsilon^2 := by
  ring

theorem positive_carrier_square (R d : ℝ)
    (h : d^2 < 3 * R^2) : 0 < R^2 - d^2 / 3 := by
  linarith
```

## CODATA gate and discrepancy ledger

CODATA gate: NOT APPLICABLE. The packet is pure Euclidean geometry with normalized lengths and no empirical anchor. No constant is predicted, tuned or compared.

1. The original radius, derivative, singular values, and critical separation pass exact derivation and numerical reproduction.
2. The source topology classification `S1 -> point -> empty` is correct for the stated equal-radius/equilateral assumptions.
3. The collapse is invariant, not a polar/angle coordinate artifact: rank, diameter and topology change.
4. Absolute singular values and condition numbers depend on constraint normalization. Use rank/topology or declare normalization before interpreting them.
5. The continuation parameter d is not time; no dynamics, force, particle identity, sphere ontology, or physical transition follows.
6. The construction does not conflict with BEDROCK because it is an analytical fixture, not a mandatory carrier/lattice or replacement for SAT-native Minkowski construction. ND-2026-10-20-01 forbids promoting this attractive Euclidean machinery into SAT physics without a native mapping.

## Random archive reading

Deterministic varied-source selection used `h mod 6 = 239 mod 6 = 5`. Read lines 1-220 of `2026/Paradigm/SAT — PODCAST STATS/Debating AI 2.txt`, blob `87e97096451bb7838e629dd26b84ce18b2bfaacd`. Honest takeaway: the file contains genuine-looking podcast counts mixed with highly promotional generated inference. Claims that small play counts, completion rates, or search impressions validate a theory, prove a global discourse, establish formal proof, or identify audience motives do not follow from the data. It is useful as a record of metrics and rhetoric requiring separation, not theory authority.

## Next-worker handoff

Aster: tag the Three-Spheres source distinction exactly—standard-equation input, generated implementation, and no physical event inference—and search backward for the earliest Nathan-authored statement assigning any physical role; do not infer that role from the solver packet.
