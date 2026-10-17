# Aster calculation: exact individuation gate for a claimed 24×3=72 phase-snap scheme

**Run key:** `REVROT3-19-20261015:14:s3`  
**Worker lane reconstructed:** Aster; no authenticated historical Aster participation claimed.  
**Status:** `GEN/DERIVED` finite-group counterexample; `SAT/OPEN` for the historical 72-snap claim.  
**Executed:** Python 3 exact enumeration and assertions below.

## Source-grounded question

Aster's current theory-facing checkpoint records that a generated SAT RIGOR answer did not individuate the requested 72 phase snaps and appeared to rely on generic 24×3 partitioning. It requires an indexed state map, transformations, invariants, and a derivation before 72 can count as 72 distinct transitions.

This calculation tests one minimal interpretation: 24 equally spaced phase positions and three one-third-turn sector offsets, with only the resulting circular phase resolved. It is a counterexample to `72 labels => 72 distinguishable phase states`. It does not establish what the historical source intended, falsify every possible 72-state construction, validate a physical phase snap, or promote a SAT/H(s)H primitive.

## Exact model

Let

\[G=\mathbb Z_{24}\times\mathbb Z_3=\{(i,j):0\le i<24,\ 0\le j<3\}.\]

There are 72 algebraic labels. Assume `i` is one of 24 equally spaced phase positions, `j` is one of three sector offsets separated by one third of a turn, and the only readout is total phase modulo one turn:

\[\phi(i,j)=\frac{i}{24}+\frac{j}{3}\pmod 1.\]

Since `1/3=8/24`, encode the readout as

\[r(i,j)=i+8j\pmod{24}.\]

This is a homomorphism from `Z_24 × Z_3` to `Z_24`.

## Kernel, quotient, and exact count

Two labels are phase-indistinguishable exactly when

\[(i'-i)+8(j'-j)=0\pmod{24}.\]

The kernel is

\[\ker r=\{(0,0),(16,1),(8,2)\}.\]

Thus `|ker r|=3`. By the finite-group first isomorphism theorem,

\[|\operatorname{im}r|=\frac{|G|}{|\ker r|}=\frac{72}{3}=24.\]

Every observable phase fibre has three labels; for example

\[r^{-1}(0)=\{(0,0),(8,2),(16,1)\}.\]

Hence the single-phase realization has 72 labels but only 24 distinguishable phase states, with `G/ker r ≅ Z_24`. The degeneracy is exact algebra, not numerical error.

## Transition version

If a snap means an increment `Δ=(Δi,Δj)`, its resolved phase increment is

\[\Delta r=\Delta i+8\Delta j\pmod{24}.\]

There are again 72 increment labels but only 24 phase increments, each of multiplicity three. Reinterpreting labels as transformations does not remove the degeneracy when the only invariant is the same phase readout.

## Necessary repair and information bound

The negative control retains the sector coordinate:

\[\sigma(i,j)=(r(i,j),j).\]

This signature is injective: equal `j` and equal `r` imply equal `i mod 24`. It yields all 72 signatures, but now `j` must be independently observable or dynamically consequential, not merely a redundant phase offset.

Each phase fibre has three members, so any extra discriminator needs at least three values. A binary flag is insufficient by the pigeonhole principle. The missing label information is

\[\log_2 3=1.584962500721156\ \text{bits per phase state}.\]

A valid 72-snap construction therefore needs at least a trit-equivalent independent invariant, or a richer state variable, beyond single circular phase.

## Controls and decision gate

- Label count: exactly 72.
- Phase-only states: 24 classes of size 3.
- Phase-only transitions: 24 increments of multiplicity 3.
- Augmented `(r,j)` signature: 72 distinct states.
- Binary augmentation: insufficient for each three-element fibre.
- Numerical uncertainty: none for modular enumeration; only the printed `log2(3)` decimal is floating-point.

To pass the Aster gate, a historical 72-snap proposal must list entries 1–72, define state variables and operators, give an injective distinguishing signature, identify intended symmetry quotients, and show that the threefold sector is not merely a one-third-turn offset. Until then, 24×3 is bookkeeping, not a derivation of 72 distinct phase snaps.

## Executed output

```text
MODEL: G = Z_24 x Z_3; phase readout r(i,j) = i + 8j mod 24
label_count=72
distinct_phase_readouts=24
kernel=[(0, 0), (8, 2), (16, 1)]
fibre_size_set=[3]
example_fibre_r0=[(0, 0), (8, 2), (16, 1)]
transition_label_count=72
distinct_phase_increments=24
multiplicity_per_increment=[3]
augmented_signature_count=72
information_lost_bits=log2(3)=1.584962500721156
minimum_extra_alphabet_size=3
phase_spacing_turns=1/24
all_exact_assertions=PASS
```

## Full runnable Python

```python
#!/usr/bin/env python3
"""Exact finite-group test of a naive 24×3 phase-snap construction.

No third-party packages are required.  The model tested is explicitly only a
counterexample/gate: labels (i,j) in Z_24 × Z_3 are read out by the single
phase residue r = i + 8j (mod 24).
"""

from collections import Counter, defaultdict
from fractions import Fraction
from math import log2

N = 24
M = 3
SHIFT = N // M


def readout(label: tuple[int, int]) -> int:
    i, j = label
    return (i + SHIFT * j) % N


def add(a: tuple[int, int], b: tuple[int, int]) -> tuple[int, int]:
    return ((a[0] + b[0]) % N, (a[1] + b[1]) % M)


labels = [(i, j) for i in range(N) for j in range(M)]
fibres: dict[int, list[tuple[int, int]]] = defaultdict(list)
for x in labels:
    fibres[readout(x)].append(x)

kernel = [x for x in labels if readout(x) == 0]
assert len(labels) == 72
assert len(fibres) == 24
assert set(map(len, fibres.values())) == {3}
assert kernel == [(0, 0), (8, 2), (16, 1)]

# Every equal-readout pair differs by a kernel element, and conversely.
for x in labels:
    for y in labels:
        delta = ((y[0] - x[0]) % N, (y[1] - x[1]) % M)
        assert (readout(x) == readout(y)) == (delta in kernel)

# Transition labels suffer exactly the same quotient under a phase-only
# readout: 72 algebraic increments but only 24 observable phase increments.
transition_counts = Counter(readout(delta) for delta in labels)
assert len(transition_counts) == 24
assert set(transition_counts.values()) == {3}

# Negative control: retaining the sector coordinate is injective.
augmented = {(readout(x), x[1]) for x in labels}
assert len(augmented) == 72

# A binary tag cannot separate three members of every fibre (pigeonhole).
for r, fibre in fibres.items():
    one_bit_tags = [x[1] % 2 for x in fibre]
    assert len(set(one_bit_tags)) < len(fibre)

print("MODEL: G = Z_24 x Z_3; phase readout r(i,j) = i + 8j mod 24")
print(f"label_count={len(labels)}")
print(f"distinct_phase_readouts={len(fibres)}")
print(f"kernel={kernel}")
print(f"fibre_size_set={sorted(set(map(len, fibres.values())))}")
print(f"example_fibre_r0={fibres[0]}")
print(f"transition_label_count={len(labels)}")
print(f"distinct_phase_increments={len(transition_counts)}")
print(f"multiplicity_per_increment={sorted(set(transition_counts.values()))}")
print(f"augmented_signature_count={len(augmented)}")
print(f"information_lost_bits=log2(3)={log2(3):.15f}")
print(f"minimum_extra_alphabet_size={max(map(len, fibres.values()))}")
print(f"phase_spacing_turns={Fraction(1, N)}")
print("all_exact_assertions=PASS")
```
