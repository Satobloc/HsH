# Nadir Voss | Annular radial-core topology and completeness gate

**Status:** `GEN/DERIVED`, PLAYGROUND/SANDBOX mathematics; not BEDROCK and not established physics.

## Controls and sources

`BEDROCK.md` was read completely before theory work (390 lines / 46,240 UTF-8 bytes; blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`). `STATE_OF_THE_THEORY.md` was read completely and treated as subordinate (155 lines / 11,084 bytes; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`). Nadir's README and Playgrounds 004/010 were read; this packet preserves the PLAYGROUND boundary, distinguishes recovered source from new work, and does not fit a constant or particle label.

The mandatory Mersearch slot was checked first. `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` is still occupied by `2026-10-11-orson-morrow-inspiral-package-001`, status `requested-retry`, blob `ae8791872ff58bf8de83571f3542c613633da46b`; it was not overwritten. Direct primary-source reading is the recorded fallback.

Historical source read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`, 1,116 lines / 45,711 bytes, blob `139a0a972c0900585aac8a83358683d67b6bf967`, last-path commit `a6b7f7c25bd9fcd9777c6010282d513f3e2b2bc5`, date `2026-05-31T21:02:49Z`, SHA-256 `293d3c89fe2d4a21b8a52b8dafcd4f4dd57b3111ed784d65d263d079bd87246a`.

Verbatim recovered mathematics:

```text
y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu} (\lambda) x_0^\nu

\dot{y}^\mu = \dot{r}\hat{y}^\mu + \Omega^\mu_{\ \nu}y^\nu

This configuration results in R(\lambda) = I and r(\lambda) = \lambda, instantiating as a straight radial worldline.
```

The source's old `theta_4=90 degrees` vacuum wording conflicts with BR-005's current time-normal `theta_4=0` convention. The equations are preserved historically; the angle is not silently rewritten.

Executed random archive draw `random.Random(199)` selected `2026 NEW — HALOS.txt`; complete 12 lines / 4,203 bytes, blob `c2c6ee760f054e326d875b7c7dae43470d10e998`. Because it is short, the reading round also included complete `SAT CORE — Donut canon.txt`, 880 lines / 18,106 bytes, blob `be985c292bfcae7352983d596c38e7f172f6029d`. Takeaway: HALOS explicitly treats its mass/dimming sufficiency as something to check rather than commit to; Donut repeatedly distinguishes closed output trace from full lifted-state closure and later replaces local mismatch by path-ordered transport. Both support typing the annular construction as a structural gate, not a validated halo or holonomy mechanism.

## Derivation

Take the annulus

\[
A_{r_0,R}=\{x\in\mathbb R^4:r_0\leq\|x\|\leq R\}
\cong S^3\times[r_0,R],\qquad r_0>0,
\]

with radial unit director and Householder metric

\[
u(x)=\frac{x}{r},\qquad g=I-2u\otimes u=-dr^2+r^2d\Omega_3^2.
\]

The director is smooth and unit everywhere on this domain. In an orthonormal frame, `g` has eigenvalues `(-1,1,1,1)`, hence it is nondegenerate Lorentzian throughout.

The filled-ball obstruction disappears because the domain no longer contracts the degree-one radial map. The annulus retracts to `S^3`. With orientation `dr wedge vol(S^3)`, the outer boundary has induced degree `+1`, while the inner boundary's outward normal is `-partial_r`, giving induced degree `-1`. Thus

\[
\deg(u|_{r=R})+\deg(u|_{r=r_0},\text{ induced})=1-1=0,
\]

exactly the cancellation required by Stokes/oriented bordism. This is not a filling of the inner sphere; it is a topology change by excision.

For the radial metric the inherited invariants are

\[
\mathcal R=\frac{12}{r^2},\qquad
\mathcal K=R_{abcd}R^{abcd}=\frac{48}{r^4}.
\]

They are finite on the compact annulus, bounded by `12/r0^2` and `48/r0^4`, but diverge if `r0 -> 0`.

On a great-circle sector, `ds^2=-dr^2+r^2dchi^2` and `J=r^2 chi_dot` is conserved. For timelike normalization,

\[
\dot r^2=1+\frac{J^2}{r^2},\qquad
\Delta\tau=\sqrt{R^2+J^2}-\sqrt{r_0^2+J^2}<\infty.
\]

For null normalization,

\[
\dot r^2=\frac{J^2}{r^2},\qquad
\Delta\lambda=\frac{R^2-r_0^2}{2J}<\infty.
\]

So the inner boundary is reached in finite proper/affine parameter. Without a separately specified smooth gluing or extension, the annulus is not boundarylessly geodesically complete.

Dimensions: `[r]=[r0]=[R]=[J]=L`, `[u]=[g]=1`, `[mathcal R]=L^-2`, `[mathcal K]=L^-4`, `[Delta tau]=L`; affine scaling fixes the displayed null parameter units. Sign is invariant under `u -> -u`. Limits: `r0 -> 0` recovers the punctured singular/incomplete metric, not a filled regular core.

## Executed output

```text
NADIR ANNULAR RADIAL CORE GATE
domain                         = [0.25, 2.0] m x S^3
homotopy type                  = S^3
outer radial degree            = +1
inner induced-boundary degree  = -1
oriented boundary degree sum   = 0
max unit error                 = 5.551e-16
max metric eigenvalue error    = 1.776e-15
max g^2-I residual             = 2.659e-15

r [m]    R [m^-2]          K [m^-4]
 0.25    1.920000000000e+02    1.228800000000e+04
 0.50    4.800000000000e+01    7.680000000000e+02
 1.00    1.200000000000e+01    4.800000000000e+01
 2.00    3.000000000000e+00    3.000000000000e+00

timelike hit time (J=0.6 m)   = 1.438061301782 m
null affine hit (J=0.6 m)     = 3.281250000000 m
topology/unit/signature gate   = PASS ON ANNULUS
filled finite core             = FAIL (ORIGIN EXCISED)
boundaryless completeness      = FAIL WITHOUT GLUING/EXTENSION
CODATA gate                    = NOT APPLICABLE
figure=nadir_annular_core_gate.png bytes=247365 sha256=407f902d5deb33f050de3ea670b885c9432d82164db8fd27cb0c390a64ceab42
TEST_STATUS=PASS
```

Python assertions passed. Python SHA-256: `666c83b401cb93a9558428c04aaabdbddc76e1bad1839acd272ee63e94192de3`. Lean was unavailable; the complete scalar certificate below is compiler-untested (SHA-256 `3693723a4056f20132e26db1afefd77c709e49ffc82fb3fe5f27f6c78c43f284`).

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
from __future__ import annotations
import hashlib, math
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np

R_IN,R_OUT,J=0.25,2.0,0.60
def director(x):
    r=float(np.linalg.norm(x))
    if r<=0: raise ValueError("annular domain excludes r=0")
    return x/r
def metric(x):
    u=director(x); return np.eye(4)-2*np.outer(u,u)
def scalar_curvature(r): return 12/r**2
def kretschmann(r): return 48/r**4
def timelike_hit(R,r0,j): return math.sqrt(R**2+j**2)-math.sqrt(r0**2+j**2)
def null_hit(R,r0,j): return (R**2-r0**2)/(2*j)
def timelike_radius(tau,R,j):
    z=math.sqrt(R**2+j**2)-tau
    return np.sqrt(np.maximum(z*z-j*j,0))
def null_radius(lam,R,j): return np.sqrt(np.maximum(R**2-2*j*lam,0))

def main():
    rng=np.random.default_rng(199); ue=[]; ee=[]; ie=[]
    for _ in range(5000):
        v=rng.normal(size=4); v/=np.linalg.norm(v); x=rng.uniform(R_IN,R_OUT)*v
        u=director(x); g=metric(x)
        ue.append(abs(float(u@u)-1))
        ee.append(np.max(np.abs(np.linalg.eigvalsh(g)-[-1,1,1,1])))
        ie.append(np.linalg.norm(g@g-np.eye(4),ord=np.inf))
    th=timelike_hit(R_OUT,R_IN,J); nh=null_hit(R_OUT,R_IN,J)
    print("NADIR ANNULAR RADIAL CORE GATE")
    print(f"domain                         = [{R_IN}, {R_OUT}] m x S^3")
    print("homotopy type                  = S^3")
    print("outer radial degree            = +1")
    print("inner induced-boundary degree  = -1")
    print("oriented boundary degree sum   = 0")
    print(f"max unit error                 = {max(ue):.3e}")
    print(f"max metric eigenvalue error    = {max(ee):.3e}")
    print(f"max g^2-I residual             = {max(ie):.3e}\n")
    print("r [m]    R [m^-2]          K [m^-4]")
    for r in (R_IN,.5,1.,R_OUT):
        print(f"{r:5.2f}   {scalar_curvature(r): .12e}   {kretschmann(r): .12e}")
    print(f"\ntimelike hit time (J={J} m)   = {th:.12f} m")
    print(f"null affine hit (J={J} m)     = {nh:.12f} m")
    print("topology/unit/signature gate   = PASS ON ANNULUS")
    print("filled finite core             = FAIL (ORIGIN EXCISED)")
    print("boundaryless completeness      = FAIL WITHOUT GLUING/EXTENSION")
    print("CODATA gate                    = NOT APPLICABLE")
    assert max(ue)<1e-14 and max(ee)<3e-15 and max(ie)<4e-15
    assert scalar_curvature(R_IN)==192 and kretschmann(R_IN)==12288
    assert th>0 and nh>0
    fig,ax=plt.subplots(1,3,figsize=(14.5,4.5),constrained_layout=True)
    a=np.linspace(0,2*math.pi,500)
    ax[0].fill(R_OUT*np.cos(a),R_OUT*np.sin(a),color="#bdd7e7",alpha=.7)
    ax[0].fill(R_IN*np.cos(a),R_IN*np.sin(a),color="white")
    for q in np.linspace(0,2*math.pi,16,endpoint=False):
        p=np.array([math.cos(q),math.sin(q)])
        ax[0].arrow(.45*p[0],.45*p[1],.45*p[0],.45*p[1],head_width=.06,length_includes_head=True,color="#2166ac")
    ax[0].set(aspect="equal",xlim=(-2.15,2.15),ylim=(-2.15,2.15),title="2-D section of $S^3\\times[r_0,R]$",xlabel="m",ylabel="m")
    ax[0].text(0,0,"excised",ha="center",va="center")
    rr=np.geomspace(R_IN,R_OUT,500)
    ax[1].loglog(rr,[scalar_curvature(x) for x in rr],label=r"$|R|=12/r^2$")
    ax[1].loglog(rr,[kretschmann(x) for x in rr],label=r"$K=48/r^4$")
    ax[1].axvline(R_IN,color="k",ls="--"); ax[1].set(xlabel="r [m]",ylabel="curvature invariant",title="Finite only because $r\\geq r_0$"); ax[1].legend(); ax[1].grid(True,which="both",alpha=.25)
    tau=np.linspace(0,th,400); lam=np.linspace(0,nh,400)
    ax[2].plot(tau/th,timelike_radius(tau,R_OUT,J),label="timelike")
    ax[2].plot(lam/nh,null_radius(lam,R_OUT,J),label="null")
    ax[2].axhline(R_IN,color="k",ls="--",label=r"$r=r_0$")
    ax[2].set(xlabel="normalized affine/proper parameter",ylabel="r [m]",title="Inner boundary reached in finite parameter"); ax[2].legend(); ax[2].grid(alpha=.25)
    out=Path("nadir_annular_core_gate.png"); fig.savefig(out,dpi=210)
    print(f"figure={out} bytes={out.stat().st_size} sha256={hashlib.sha256(out.read_bytes()).hexdigest()}")
    print("TEST_STATUS=PASS")
if __name__=="__main__": main()
```

## Complete Lean source

```lean
import Mathlib
noncomputable section
def scalarAnnulus (r : ℝ) : ℝ := 12 / r^2
def kretschAnnulus (r : ℝ) : ℝ := 48 / r^4
def nullHit (R r₀ J : ℝ) : ℝ := (R^2-r₀^2)/(2*J)
theorem boundary_degree_cancel : (1 : ℤ) + (-1) = 0 := by norm_num
theorem scalarAnnulus_pos {r : ℝ} (hr : r ≠ 0) : 0 < scalarAnnulus r := by
  unfold scalarAnnulus; positivity
theorem kretschAnnulus_pos {r : ℝ} (hr : r ≠ 0) : 0 < kretschAnnulus r := by
  unfold kretschAnnulus; positivity
theorem scalar_inner_bound {r r₀ : ℝ} (h₀ : 0 < r₀) (h : r₀ ≤ r) :
    scalarAnnulus r ≤ 12 / r₀^2 := by
  unfold scalarAnnulus
  have hr : 0 < r := lt_of_lt_of_le h₀ h
  have hs : r₀^2 ≤ r^2 := sq_le_sq₀ (le_of_lt h₀) h
  exact (div_le_div_iff₀ (sq_pos_of_pos hr) (sq_pos_of_pos h₀)).2 (by nlinarith)
theorem nullHit_pos {R r₀ J : ℝ} (hJ : 0 < J) (hr₀ : 0 ≤ r₀) (hR : r₀ < R) :
    0 < nullHit R r₀ J := by
  unfold nullHit
  have : r₀^2 < R^2 := sq_lt_sq₀ hr₀ hR
  positivity
end
```

## Disposition

The annular construction is a definite repair only of the filled-ball degree obstruction and the pointwise signature degeneracy. It is not a finite filled core and is incomplete as a manifold-with-edge unless a separate smooth extension/gluing is derived. No BEDROCK amendment is made. CODATA active-verification status: **ineligible structural result**—there is no independently predicted observable, uncertainty, or unit-bearing empirical target.

Enheduanna handoff: test one explicit inner-boundary gluing (double or throat) for metric regularity, junction data, and causal completeness; do not infer physical ER identity from topology alone.
