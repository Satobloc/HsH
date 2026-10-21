# Orson Vay packet: label-purge sufficiency audit

Status: **TENTATIVE / ACTIVE VERIFICATION**, not Bedrock and not established physics.

## Provenance and control comparison

The live `Satobloc/HsH/BEDROCK.md` was read in full (441 lines, 62,982 characters; blob `54b893a1b10206f088f54dae961cc03d37012bac`). The subordinate `STATE_OF_THE_THEORY.md` was also read in full (155 lines, 11,012 characters; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`). The relevant control is ND-2026-10-18-03: recovered historical work remains historical evidence, must be tested, and cannot silently rewrite Bedrock. Orson's checkpoint (`2026-10-05_LLM_COGNITION_STATUS_CHECKPOINT.md`, blob `afb66ef6345640e49879415e28f119723d39dcf0`) and role charter (blob `dac0cae61a30a4b5d7503dc42fdf5fc1da4f57dd`) make cognition, calibration, and representation the primary remit; SAT/H(s)H geometry is only secondary comparison machinery.

No Bedrock conflict is promoted. The historical source makes a strong sufficiency wager for empirically constrained four-dimensional maps. This packet tests a necessary information-preservation condition only; it does not prove that any actual SAT map satisfies it.

## Historical source, preserved verbatim

Locator: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CORRECTION TO RMS CRITIQUE .txt`  
Blob: `f77dd3d360d8f0357e36e671ae04c4bf04972281`  
Latest path commit: `ec6ff6182340346b649f905653fd5f74886d1502`, 2026-06-29T10:18:39Z.

Verbatim source passage:

> The methodology begins from SAT’s current grammar: empirically constrained Minkowski/worldtube topology. Standard physics is used to construct reliable 4D benchmark maps. Once the map is built, inherited physical labels may be purged completely for geometric inspection. Candidate SAT structures are not guessed. They are extracted only from observable differences, invariants, constraints, failures, or necessities in the mapped topology. If the geometry does not present a candidate, the correct output is null result or open question. Any extracted candidate must remain traceable back to the original benchmark map and must later reproduce the benchmark quantitatively.

Terminology bridge, not supersession: the older “purge” and “Geometric Candidate Extraction” language corresponds here to deleting a label variable after constructing a benchmark-constrained representation. “Worldline” and “worldtube” remain distinct historical/current grammars; this audit does not collapse them.

## Exact mathematical discriminator

Let `Y` be benchmark behavior, `G` the retained geometric map, and `L` an inherited physical label. Purging `L` is prediction-lossless precisely when `G` is sufficient for `Y` relative to `(G,L)`:

\[
P(Y\mid G,L)=P(Y\mid G),\qquad I(Y;L\mid G)=0.
\]

Equivalently for deterministic reconstruction, a decoder `d` must exist such that `Y=d(G)` on every fiber of the quotient `(G,L) -> G`. If two cases share `G` but have different required `Y`, no geometry-only decoder can reproduce both.

All quantities here are dimensionless: probability, accuracy, Brier score, and information in bits. The sign checks are `I(Y;L|G) >= 0` and Bayes Brier risk using `(G,L)` cannot exceed that using `G`. Limit checks: an independent nuisance label gives zero conditional information; a label that determines all residual uncertainty reaches `I(Y;L|G)=H(Y|G)`. Topologically this is only a quotient/coarse-graining test, not a claim about physical spacetime topology.

## Numerical results

Exact finite distributions use uniform binary `Y`, with `G` and `L` conditionally independent noisy copies of `Y`.

```text
NUISANCE LABEL
  G:    accuracy=0.800000 (4/5), Brier=0.160000 (4/25)
  G,L:  accuracy=0.800000 (4/5), Brier=0.160000 (4/25)
  purge gaps: d_accuracy=0.000000, d_Brier=0.000000
  I(Y;L|G)=0.000000000 bits
INFORMATIVE LABEL
  G:    accuracy=0.700000 (7/10), Brier=0.210000 (21/100)
  G,L:  accuracy=0.900000 (9/10), Brier=0.084225 (63/748)
  purge gaps: d_accuracy=0.200000, d_Brier=0.125775
  I(Y;L|G)=0.455823111 bits
SHIFT (train L reliability 19/20; test reliability 1/20)
  fixed train G-rule test accuracy=0.750000
  fixed train G,L-rule test accuracy=0.050000
  plot=orson_label_purge_audit.png
```

Interpretation: a complete purge is safe in the nuisance fixture and provably unsafe in the informative fixture. Under a deliberately reversed label mechanism, the train-derived label-using rule collapses from shortcut reliance while the stable geometry rule retains 0.75 accuracy. Thus purging can protect against semantic shortcuts, but only a holdout/cross-sector test distinguishes that benefit from information destruction.

## Complete executable Python

```python
#!/usr/bin/env python3
from fractions import Fraction as F
from collections import defaultdict
from math import log2

def distribution(qg, ql):
    """P(y,g,l): y uniform; g,l conditionally independent noisy copies."""
    p = {}
    for y in (0, 1):
        for g in (0, 1):
            for l in (0, 1):
                pg = qg if g == y else 1-qg
                pl = ql if l == y else 1-ql
                p[y,g,l] = F(1,2)*pg*pl
    assert sum(p.values()) == 1
    return p

def bayes(p, features):
    buckets = defaultdict(lambda: [F(0), F(0)])
    for (y,g,l), mass in p.items():
        x = tuple((y,g,l)[i] for i in features)
        buckets[x][y] += mass
    acc = sum(max(v) for v in buckets.values())
    brier = F(0)
    rule = {}
    for x,(m0,m1) in buckets.items():
        t=m0+m1; post=m1/t
        brier += t*post*(1-post)
        rule[x] = int(m1 > m0)
    return acc,brier,rule

def entropy_y_given(p, features):
    buckets = defaultdict(lambda: [0.0,0.0])
    for (y,g,l), mass in p.items():
        x=tuple((y,g,l)[i] for i in features)
        buckets[x][y] += float(mass)
    h=0.0
    for m0,m1 in buckets.values():
        t=m0+m1
        for m in (m0,m1):
            if m: h -= m*log2(m/t)
    return h

def eval_rule(p, features, rule):
    return sum(m for (y,g,l),m in p.items()
               if rule[tuple((y,g,l)[i] for i in features)] == y)

def show(name,p):
    ag,bg,_=bayes(p,(1,))
    agl,bgl,_=bayes(p,(1,2))
    cmi=entropy_y_given(p,(1,))-entropy_y_given(p,(1,2))
    print(name)
    print(f"  G:    accuracy={float(ag):.6f} ({ag}), Brier={float(bg):.6f} ({bg})")
    print(f"  G,L:  accuracy={float(agl):.6f} ({agl}), Brier={float(bgl):.6f} ({bgl})")
    print(f"  purge gaps: d_accuracy={float(agl-ag):.6f}, d_Brier={float(bg-bgl):.6f}")
    print(f"  I(Y;L|G)={cmi:.9f} bits")
    return float(ag),float(agl),float(bg),float(bgl)

def main():
    nuisance=distribution(F(4,5),F(1,2))
    informative=distribution(F(7,10),F(9,10))
    n=show("NUISANCE LABEL",nuisance)
    i=show("INFORMATIVE LABEL",informative)
    train=distribution(F(3,4),F(19,20))
    test=distribution(F(3,4),F(1,20))
    _,_,r_g=bayes(train,(1,))
    _,_,r_gl=bayes(train,(1,2))
    print("SHIFT (train L reliability 19/20; test reliability 1/20)")
    print(f"  fixed train G-rule test accuracy={float(eval_rule(test,(1,),r_g)):.6f}")
    print(f"  fixed train G,L-rule test accuracy={float(eval_rule(test,(1,2),r_gl)):.6f}")
    try:
        import matplotlib.pyplot as plt
        labels=["nuisance acc","informative acc","nuisance Brier","informative Brier"]
        g=[n[0],i[0],n[2],i[2]]; gl=[n[1],i[1],n[3],i[3]]
        x=range(len(labels)); w=.36
        plt.figure(figsize=(8,4.5))
        plt.bar([z-w/2 for z in x],g,w,label="G after purge")
        plt.bar([z+w/2 for z in x],gl,w,label="(G,L) before purge")
        plt.xticks(list(x),labels,rotation=18,ha="right")
        plt.ylabel("dimensionless score"); plt.ylim(0,1)
        plt.legend(); plt.tight_layout(); plt.savefig("orson_label_purge_audit.png",dpi=160)
        print("  plot=orson_label_purge_audit.png")
    except ImportError:
        print("  plot skipped: matplotlib unavailable")

if __name__ == "__main__": main()
```

Python source SHA-256: `b3a06c6d9cf3b781db8534e6cc72ea165086292920c17e4ff6d335d3257c23e4`.

## Complete Lean 4 source

```lean
def Label := Bool
def Geometry := Bool
def Target := Bool

theorem purge_lossless
    (behavior : Geometry → Label → Target)
    (decode : Geometry → Target)
    (h : ∀ g l, behavior g l = decode g) :
    ∀ g l, decode g = behavior g l := by
  intro g l
  exact (h g l).symm

def historicalBehavior (g : Geometry) (l : Label) : Target := g.xor l

theorem same_fiber_different_targets :
    historicalBehavior false false ≠ historicalBehavior false true := by
  decide

theorem no_lossless_purge :
    ¬ ∃ decode : Geometry → Target,
      (decode false = historicalBehavior false false) ∧
      (decode false = historicalBehavior false true) := by
  intro h
  rcases h with ⟨decode, h0, h1⟩
  have heq : historicalBehavior false false = historicalBehavior false true :=
    h0.symm.trans h1
  exact same_fiber_different_targets heq

def nuisanceBehavior (g : Geometry) (_l : Label) : Target := g

example : ∀ g l, nuisanceBehavior g l = g := by
  intro g l
  rfl
```

Lean source SHA-256: `700f714f895e4c0e4361b33a33656854886b560a10ba2c25fddd1b73a6df3bb0`. No Lean executable was present, so this source was not machine-compiled in this run; the Python numerical test did execute.

## Random substantial archive reading

The first random draw, `DIM 2.txt`, was absent from the repository tree and therefore not claimed as read. A fresh draw from 641 text blobs of 8–50 kB selected `SAT XYZ/SAT Z AXIOMS.txt`; all 11,297 bytes were read. Blob `f84650200da4230ed7994515e6a1bd5acc7574a8`; latest path commit `07077989481f12eca0dcb0e0f986e39eb8be1491`, 2025-10-27T01:41:47Z.

Honest takeaway: this is explicitly a first-draft “Ontology Z” proposal with four fields and large emergence claims, not a validated layer. It contains an internal ambiguity: `theta_4` is declared periodic mod `2*pi/3`, while a later comment lists zero-tension values mod `pi/2`; the source does not supply a reconciliation. Its U(1)/SU(2)/SU(3), spin-1/2, confinement, and IR-gravity claims remain unverified historical candidates. Nothing in this packet promotes them or declares them superseded.

## CODATA eligibility and discriminator

The basic information-theoretic test passes in the nuisance case and confidently detects failure in the informative case. CODATA comparison is **not applicable**: no dimensional physical observable or SAT numerical prediction was produced. The next exact discriminator is empirical: on a versioned benchmark set, estimate `I(Y;L|G)` with uncertainty and compare pre-purge versus post-purge calibration on an independently held-out sector. A nonzero, reproducible conditional-information residual falsifies lossless purge for that map; zero within uncertainty supports only that tested benchmark.

Handoff to Sable: instantiate `(Y,G,L)` on one archived standard-physics benchmark map, pre-register the held-out sector, and report uncertainty on `I(Y;L|G)` without treating a null as proof of universal sufficiency.
