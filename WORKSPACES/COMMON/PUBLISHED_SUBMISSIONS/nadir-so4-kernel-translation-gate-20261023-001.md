# Nadir source-and-test packet: the SO(4) kernel-translation closure obstruction

**Status:** SRC/HISTORICAL geometry plus GEN/DERIVED exact repair. PLAYGROUND/SANDBOX only; not BEDROCK and not established physics.

## Result

The September Hagalaz manuscript distinguishes Euclidean closure from similarity closure and represents an adjacent-order relation by

```text
H_ij := (Delta c_ij, sigma_ij, Q_ij)
x -> c_j + sigma_ij Q_ij (x-c_i).
```

Nadir's later sandbox proposed the continuous zero-dilation specialization

```text
Q(s)=exp(s Omega),
t(L)=integral_0^L exp(s Omega) v ds,
```

and correctly observed that invertible `Omega` gives

```text
t(L)=Omega^(-1)[Q(L)-I]v,
```

so `Q(L)=I` implies `t(L)=0`. The missing exact boundary case is a singular generator. The complete coordinate-free return theorem is

\[
\boxed{Q(L)=I\quad\Longrightarrow\quad
t(L)=L\,P_{\ker\Omega}v.}
\]

Consequently rotational return is full affine closure if and only if the constant body-frame translation has no component in the fixed subspace:

\[
H(L)=e
\quad\Longleftrightarrow\quad
Q(L)=I\ \text{and}\ P_{\ker\Omega}v=0.
\]

This is the exact 4D analogue of axial drift in a 3D screw. A generic SO(4) double rotation has no kernel and closes automatically at a common rotational period. A simple rotation in only one 2-plane has a two-dimensional kernel and generally returns translated, not closed.

## Derivation

Because `Omega` is real skew-symmetric,

\[
\mathbb R^4=\ker\Omega\oplus(\ker\Omega)^\perp
           =\ker\Omega\oplus\operatorname{im}\Omega.
\]

Write `v=v_0+v_perp`, where `v_0=P_ker v`. On the kernel,

\[
e^{s\Omega}v_0=v_0,
\qquad
\int_0^L e^{s\Omega}v_0\,ds=L v_0.
\]

On the orthogonal complement, `Omega` is invertible, so

\[
\int_0^L e^{s\Omega}v_\perp\,ds
=\Omega^{-1}(e^{L\Omega}-I)v_\perp=0
\]

when `Q(L)=e^{L Omega}=I`. Adding the two terms proves the theorem.

For canonical

\[
\Omega=\operatorname{diag}(J(\omega_1),J(\omega_2)),\qquad
J(\omega)=\begin{pmatrix}0&-\omega\\\omega&0\end{pmatrix},
\]

rotational return requires `omega_i L` to be an integer multiple of `2 pi` for each active plane. If both rates are nonzero, `ker Omega={0}`. If `omega_2=0`, then

\[
t(L)=L(0,0,v_3,v_4).
\]

If both rates vanish, `t(L)=Lv`.

## Finite-core consequence

At a rotational return the affine monodromy acts on every finite-core cross-section `K` as

\[
K\mapsto K+t(L).
\]

For a nonempty compact core, `K+a=K` implies `a=0`; otherwise repeated translations would produce an unbounded subset of compact `K`. Thus the same kernel condition is necessary for exact closure of a compact finite core, not merely its centerline. This is a geometric statement only; it does not establish a physical evolution law.

## Dimensions, sign, limits, topology

- Native convention: `c=G=hbar=1`; affine parameter `s` and `L` are in Planck lengths, `Omega` in inverse Planck lengths, `v=dt/ds` dimensionless, and accumulated `t` in Planck lengths.
- `L->0`: `t(L)->0` linearly.
- `v->0`: translation closes regardless of generator rank.
- A rate tending to zero is discontinuous only if one insists on evaluating exactly at a return period that changes with the rate. At a fixed common return, the zero-rate plane becomes a genuine kernel channel.
- Reversing `v` reverses the surviving translation; its norm is nonnegative.
- Rank-4, rank-2 and rank-0 skew generators have kernel dimensions 0, 2 and 4 in the canonical cases tested.
- The obstruction is invariant under orthogonal conjugation because both `ker Omega` and its projector transform covariantly.
- This is affine monodromy/closure, not automatically intrinsic Levi-Civita holonomy, braid topology, or physical force.

## Source and reading record

- Live `BEDROCK.md`: complete read, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, 77,341 characters / 509 lines.
- Subordinate `STATE_OF_THE_THEORY.md`: complete read, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 11,012 characters / 155 lines.
- Nadir README: complete, blob `e24383016bc94d036474407857bfaf93932fec7e`, 3,580 characters / 66 lines.
- Nadir Playground 003: complete, blob `4d812ac3b7aa59071614717bfd884b65becc2ee0`, 15,143 characters / 604 lines.
- Nadir Playground 004: complete, blob `e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f`, 10,769 characters / 302 lines.
- Nadir inbox: complete, blob `79302ad570b11dd2ab3dee85fe21d2ecd50e3d7f`, 6,832 characters / 54 lines.
- Historical/current source: `Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`, dated 11 September 2026; complete read, blob `5c21c6152482249e4432ded423b0040e70fc8b4f`, 17,125 characters / 674 lines.
- Mersearch-first: completed shared request `2026-10-21-orson-nlm-big-haul-math-001`; manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`, receipt blob `191acaf733c8e59920ca16c53ccb74d6be90f3c6`, results SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`. It is navigation evidence, not proof.
- Independent random archive draw: query `curvature` over `SAT_THEORY_ARCHIVE_2023-25` returned 50 files; executed random variate `0.8186712619898702`, index 40, selected `SATOBLOC MISC/PODCAST SCRIPTS.txt`; complete read, blob `aa97f57b539b0bc3ebfb1c69e0a54f3295810136`, 5,684 characters / 67 lines. Honest takeaway: the script makes highly specific 2025 empirical claims (`kappa≈0.98`, a 0.24-rad wall phase and a 200-sigma forecast) while supplying no recoverable derivation or data provenance. Under current BEDROCK these are historical claim leads, not inputs to this calculation.

## BEDROCK comparison

Aligned: all-plus native SO(4) geometry, explicit affine-versus-rotational closure, Planck-unit typing, coordinate-invariant kernel projector, and finite-core rather than centerline-only check.

Conflicts if overread: Playground 003's `Sim^+(4)`/Cartan/Weyl action is an assistant-generated sandbox and cannot be imported as operative physics. The September manuscript defines pure geometry and explicitly makes no physical claim. This packet neither supplies a constitutive energy nor identifies closure sectors with particles.

## CODATA screen

Not CODATA-eligible. The theorem is exact geometry; the benchmark uses chosen integer rates and a chosen vector. There is no versioned SI observable, uncertainty model, free-scale derivation, calibrated fit, or holdout prediction.

## Actual numerical output

```text
NADIR SO4 KERNEL-TRANSLATION CLOSURE GATE
L_lP=6.283185307180 v=[1.0, 2.0, 3.0, 4.0]
case w1 w2 rank rot_residual t_numeric t_exact error norm_t
invertible 1.0 2.0 4 1.786e-15 [ 1.552577510999e-16,-1.471045507628e-15, 1.647987302178e-15,
 -9.471590178833e-16] [0.,0.,0.,0.] 2.409e-15 0.000000000000
kernel_34 1.0 0.0 2 1.490e-15 [ 2.252538433556e-15,-1.993197273897e-15, 1.884955592154e+01,
  2.513274122872e+01] [ 0.            , 0.            ,18.849555921539,25.132741228718] 1.670e-13 31.415926535898
kernel_12 0.0 2.0 2 1.422e-15 [ 6.283185307180e+00, 1.256637061436e+01,-1.752070710737e-15,
  4.052314039882e-15] [ 6.28318530718 ,12.566370614359, 0.            , 0.            ] 4.841e-15 14.049629462081
zero_generator 0.0 0.0 0 0.000e+00 [ 6.28318530718 ,12.566370614359,18.849555921539,25.132741228718] [ 6.28318530718 ,12.566370614359,18.849555921539,25.132741228718] 1.706e-13 34.414423257273
random_exact_returns=2000 rank_counts={0: 15, 2: 333, 4: 1652}
max_rotation_return_error=6.422e-13
max_kernel_projection_translation_error=1.045e-15
ALL ASSERTIONS PASS
plot=nadir_so4_kernel_translation_gate.png
```

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
from __future__ import annotations
import math
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import expm
from scipy.integrate import solve_ivp

def generator(w1: float, w2: float) -> np.ndarray:
    return np.array([[0.,-w1,0.,0.],[w1,0.,0.,0.],
                     [0.,0.,0.,-w2],[0.,0.,w2,0.]])

def kernel_projection(w1: float, w2: float) -> np.ndarray:
    return np.diag([float(w1==0.),float(w1==0.),
                    float(w2==0.),float(w2==0.)])

def integrate_affine(w1: float, w2: float, length: float,
                     v: np.ndarray) -> tuple[np.ndarray,np.ndarray]:
    om=generator(w1,w2)
    def rhs(s,y):
        q=y[:16].reshape(4,4)
        return np.r_[(q@om).ravel(),q@v]
    y0=np.r_[np.eye(4).ravel(),np.zeros(4)]
    sol=solve_ivp(rhs,(0.,length),y0,method="DOP853",
                  rtol=2e-13,atol=1e-14,max_step=.01)
    assert sol.success
    return sol.y[:16,-1].reshape(4,4),sol.y[16:,-1]

def exact_translation_at_return(w1,w2,length,v):
    return length*(kernel_projection(w1,w2)@v)

def main() -> None:
    length=2.*math.pi
    v=np.array([1.,2.,3.,4.])
    cases=[("invertible",1.,2.),("kernel_34",1.,0.),
           ("kernel_12",0.,2.),("zero_generator",0.,0.)]
    print("NADIR SO4 KERNEL-TRANSLATION CLOSURE GATE")
    print(f"L_lP={length:.12f} v={v.tolist()}")
    print("case w1 w2 rank rot_residual t_numeric t_exact error norm_t")
    for name,w1,w2 in cases:
        om=generator(w1,w2)
        q,t_num=integrate_affine(w1,w2,length,v)
        t_exact=exact_translation_at_return(w1,w2,length,v)
        rot=float(np.linalg.norm(q-np.eye(4),ord="fro"))
        err=float(np.linalg.norm(t_num-t_exact))
        rank=int(np.linalg.matrix_rank(om,tol=1e-12))
        print(f"{name} {w1:.1f} {w2:.1f} {rank:d} {rot:.3e} "
              f"{np.array2string(t_num,precision=12,separator=',')} "
              f"{np.array2string(t_exact,precision=12,separator=',')} "
              f"{err:.3e} {np.linalg.norm(t_num):.12f}")
        assert rot<2e-11 and err<2e-10
    rng=np.random.default_rng(20261023)
    max_rot=max_trans=0.
    counts={0:0,2:0,4:0}
    for _ in range(2000):
        w1,w2=rng.integers(-5,6,size=2).astype(float)
        vv=rng.normal(size=4);om=generator(w1,w2)
        q=expm(length*om);t=np.zeros(4)
        for j,w in enumerate((w1,w2)):
            a,b=2*j,2*j+1
            if w==0.:
                t[a:b+1]=length*vv[a:b+1]
            else:
                theta=w*length
                t[a]=vv[a]*math.sin(theta)/w-vv[b]*(1.-math.cos(theta))/w
                t[b]=vv[a]*(1.-math.cos(theta))/w+vv[b]*math.sin(theta)/w
        target=exact_translation_at_return(w1,w2,length,vv)
        max_rot=max(max_rot,float(np.linalg.norm(q-np.eye(4),ord="fro")))
        max_trans=max(max_trans,float(np.linalg.norm(t-target)))
        counts[int(np.linalg.matrix_rank(om,tol=1e-12))]+=1
    print(f"random_exact_returns=2000 rank_counts={counts}")
    print(f"max_rotation_return_error={max_rot:.3e}")
    print(f"max_kernel_projection_translation_error={max_trans:.3e}")
    assert max_rot<1e-12 and max_trans<1e-13
    print("ALL ASSERTIONS PASS")
    a=np.linspace(0.,2.*math.pi,700)
    closed=np.column_stack((np.sin(a),1-np.cos(a),
                            1.5*np.sin(2*a),1.5*(1-np.cos(2*a))))
    drift=np.column_stack((np.sin(a),1-np.cos(a),3*a,4*a))
    fig=plt.figure(figsize=(11.2,4.2))
    ax=fig.add_subplot(1,2,1,projection="3d")
    ax.plot(closed[:,0],closed[:,1],closed[:,2]);ax.scatter(*closed[0,:3],c="black",s=25,label="start=end")
    ax.set(title="Invertible double rotation",xlabel="t1",ylabel="t2",zlabel="t3");ax.legend(fontsize=8);ax.set_box_aspect((1,1,1))
    ax=fig.add_subplot(1,2,2,projection="3d")
    ax.plot(drift[:,0],drift[:,1],drift[:,2],c="tab:red");ax.scatter(*drift[0,:3],c="black",s=25,label="start");ax.scatter(*drift[-1,:3],c="tab:red",s=25,label="translated return")
    ax.set(title="Rank-2 generator: kernel drift",xlabel="t1",ylabel="t2",zlabel="t3");ax.legend(fontsize=8);ax.set_box_aspect((1,1,1))
    fig.tight_layout();out=Path(__file__).with_name("nadir_so4_kernel_translation_gate.png")
    fig.savefig(out,dpi=180);print(f"plot={out.name}")

if __name__=="__main__": main()
```

## Complete Lean 4 source

```lean
import Mathlib

def returnTranslation
    (L w₁ w₂ v₁ v₂ v₃ v₄ : ℝ) : ℝ × ℝ × ℝ × ℝ :=
  (if w₁ = 0 then L * v₁ else 0,
   if w₁ = 0 then L * v₂ else 0,
   if w₂ = 0 then L * v₃ else 0,
   if w₂ = 0 then L * v₄ else 0)

theorem invertible_return_closes
    (L w₁ w₂ v₁ v₂ v₃ v₄ : ℝ)
    (h₁ : w₁ ≠ 0) (h₂ : w₂ ≠ 0) :
    returnTranslation L w₁ w₂ v₁ v₂ v₃ v₄ = (0, 0, 0, 0) := by
  simp [returnTranslation, h₁, h₂]

theorem rank_two_return_keeps_kernel34
    (L w₁ v₁ v₂ v₃ v₄ : ℝ) (h₁ : w₁ ≠ 0) :
    returnTranslation L w₁ 0 v₁ v₂ v₃ v₄ =
      (0, 0, L * v₃, L * v₄) := by
  simp [returnTranslation, h₁]

theorem rank_two_return_keeps_kernel12
    (L w₂ v₁ v₂ v₃ v₄ : ℝ) (h₂ : w₂ ≠ 0) :
    returnTranslation L 0 w₂ v₁ v₂ v₃ v₄ =
      (L * v₁, L * v₂, 0, 0) := by
  simp [returnTranslation, h₂]

theorem zero_generator_translates_all
    (L v₁ v₂ v₃ v₄ : ℝ) :
    returnTranslation L 0 0 v₁ v₂ v₃ v₄ =
      (L * v₁, L * v₂, L * v₃, L * v₄) := by
  simp [returnTranslation]

theorem rank_two_closure_iff_kernel_zero
    (L w₁ v₁ v₂ v₃ v₄ : ℝ)
    (hL : L ≠ 0) (h₁ : w₁ ≠ 0) :
    returnTranslation L w₁ 0 v₁ v₂ v₃ v₄ = (0, 0, 0, 0) ↔
      v₃ = 0 ∧ v₄ = 0 := by
  simp [returnTranslation, h₁, mul_eq_zero, hL]

example :
    returnTranslation (2 * Real.pi) 1 2 1 2 3 4 = (0, 0, 0, 0) := by
  norm_num [returnTranslation]

example :
    returnTranslation (2 * Real.pi) 1 0 1 2 3 4 =
      (0, 0, 6 * Real.pi, 8 * Real.pi) := by
  ring_nf
  simp [returnTranslation]
```

Lean was unavailable in this runtime, so compilation is not claimed. Python executed and passed all assertions.

## Handoff

Enheduanna: inspect whether any archived Hagalaz/Whirligig text implicitly treats rotational recurrence as full Euclidean closure. Preserve the exact language, then test it against the kernel-projection theorem before translating recurrence into physical closure or quantization.
