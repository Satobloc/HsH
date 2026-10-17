# Ariadne — complete homomorphism and trit-completion classification for the 24×3 phase gate

Status: GEN/DERIVED finite-group mathematics; exact enumeration EXECUTED. The historical 72-snap interpretation remains SAT/OPEN. This classifies a declared representation; it does not establish historical intent, a physical state space, or a physical interaction.

## Starting point

The preceding gate studied one map

    r(i,j) = i + 8j mod 24

on G = Z_24 × Z_3. It found 72 algebraic labels, 24 phase values, and a three-element kernel. The present calculation replaces that one example by a classification of every group homomorphism

    phi: Z_24 × Z_3 -> Z_24

and every linear trit augmentation

    q: Z_24 × Z_3 -> Z_3.

## Classification of all phase homomorphisms

A homomorphism is fixed by the images of (1,0) and (0,1). The first image is arbitrary a in Z_24. Because (0,1) has order 3, its image b must satisfy

    3b = 0 mod 24,

so b is one of 0, 8, or 16. Write b=8k with k in Z_3. Every phase homomorphism is therefore

    phi_(a,k)(i,j) = a i + 8 k j mod 24,

giving exactly 24×3=72 phase maps.

Use the Chinese decomposition Z_24 ≅ Z_8 × Z_3. Modulo 8,

    phi_8(i,j) = a i mod 8,

because 8kj vanishes. This component is surjective exactly when a is odd.

Modulo 3,

    phi_3(i,j) = (a mod 3)(i mod 3) + 2k j mod 3.

This component is surjective exactly when the row (a mod 3, 2k) is nonzero. Thus the full phase map is surjective exactly when

    a is odd, and not(a divisible by 3 and k=0).

There are 32 such maps. Every surjective map still has

    |kernel(phi)| = |G|/|Z_24| = 72/24 = 3.

Consequently no phase-only homomorphism can individuate all 72 labels. The information deficit for a maximally informative phase map is exactly log2(3)=1.584962500721156 bits.

## Classification of all linear trit completions

Every homomorphism q:G->Z_3 has the form

    q_(c,d)(i,j) = c(i mod 3) + d j mod 3,

with c,d in Z_3. Consider the augmented signature

    Psi(i,j) = (phi_(a,k)(i,j), q_(c,d)(i,j))
             in Z_24 × Z_3.

The 2-primary component is invertible exactly when a is odd. On the 3-primary component the map is the matrix

    [ a mod 3    2k ]
    [    c        d ]

over F_3. Its determinant is

    Delta = a d - 2 k c mod 3.

Since domain and codomain both have 72 elements, Psi is injective exactly when it is invertible. Therefore the necessary and sufficient condition is

    a odd and (a d - 2 k c) mod 3 != 0.

Of the 24×3×3×3=648 augmented maps, exactly 192 satisfy this condition and resolve all 72 labels.

For the original map (a,k)=(1,1), choosing q=j means (c,d)=(0,1), determinant 1, and 72 distinct signatures. In contrast q=i+2j has (c,d)=(1,2), determinant 0, and leaves only 24 signatures: an added coordinate can be algebraically present yet carry no independent information.

A one-bit augmentation cannot solve the maximally informative phase case. Every phase fibre has three elements, while a binary alphabet has two values, so at least two fibre elements must collide.

## Exact executed output

```text
homomorphism classification: Z_24 x Z_3 -> Z_24
phase_maps=72
phase_kernel_hist=3:32,6:16,9:4,12:8,18:2,24:8,36:1,72:1
surjective_phase_maps=32
surjective_phase_examples=[(1, 0), (1, 1), (1, 2), (3, 1), (3, 2), (5, 0), (5, 1), (5, 2)]
maximally_informative_phase_kernel_size=3
lost_information_bits=log2(3)=1.584962500721156
linear trit completion: q(i,j)=c*i+d*j mod 3
augmented_maps=648
augmented_image_hist=1:1,2:1,3:32,4:2,6:32,8:4,9:48,12:64,18:48,24:128,36:96,72:192
injective_augmented_maps=192
injective_fraction=192/648
injectivity_criterion=a odd and (a*d-2*k*c) mod 3 != 0
original_map=(a,k)=(1,1): kernel_size=3
repair_q=j: (c,d)=(0,1), augmented_states=72
negative_control_q=i+2j: determinant=0, augmented_states=24
binary_separating_tags_for_three_element_fibre=0
ALL_EXACT_ASSERTIONS_PASSED
```

## Bounded conclusion

The prior threefold degeneracy is not an accident of r=i+8j. It is the best any homomorphism from Z_24×Z_3 to a single Z_24 phase can do. A trit is necessary by cardinality and sufficient only when its 3-primary row is linearly independent of the phase row. The determinant test provides a compact gate for any proposed third coordinate:

    preserve 72 states iff a is odd and a*d-2*k*c is nonzero mod 3.

This remains a representation-level result. Applying it to an actual historical 72-state table still requires recovery of that table's defined states, operators, and intended equivalences.

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Exact classification of homomorphic 24×3 phase encodings.

GEN/DERIVED finite-group mathematics.  This extends the explicit map
r(i,j)=i+8j mod 24 to every homomorphism Z_24 x Z_3 -> Z_24 and every
linear trit augmentation.  It makes no claim about historical intent or
physical validity.
"""

from collections import Counter
from itertools import product

G = tuple(product(range(24), range(3)))


def phase(x: tuple[int, int], a: int, k: int) -> int:
    """All homomorphisms G -> Z_24 have this form, with b=8k."""
    i, j = x
    return (a * i + 8 * k * j) % 24


def trit(x: tuple[int, int], c: int, d: int) -> int:
    """All homomorphisms G -> Z_3 have this form."""
    i, j = x
    return (c * (i % 3) + d * j) % 3


def kernel_size(a: int, k: int) -> int:
    return sum(phase(x, a, k) == 0 for x in G)


def augmented_count(a: int, k: int, c: int, d: int) -> int:
    return len({(phase(x, a, k), trit(x, c, d)) for x in G})


def predicted_phase_surjective(a: int, k: int) -> bool:
    # Chinese decomposition Z_24 = Z_8 x Z_3:
    # mod 8 requires a to be a unit; mod 3 requires row (a,2k) nonzero.
    return a % 2 == 1 and not (a % 3 == 0 and k == 0)


def predicted_augmented_injective(a: int, k: int, c: int, d: int) -> bool:
    # The Z_8 component requires a odd.  On the 3-primary component the
    # matrix [[a,2k],[c,d]] must have nonzero determinant over F_3.
    determinant = (a * d - 2 * k * c) % 3
    return a % 2 == 1 and determinant != 0


def main() -> None:
    phase_kernel_hist = Counter()
    surjective = []
    for a, k in product(range(24), range(3)):
        ks = kernel_size(a, k)
        image_size = len(G) // ks
        phase_kernel_hist[ks] += 1
        observed = image_size == 24
        predicted = predicted_phase_surjective(a, k)
        assert observed == predicted
        if observed:
            surjective.append((a, k))

    injective = []
    rank_hist = Counter()
    for a, k, c, d in product(range(24), range(3), range(3), range(3)):
        count = augmented_count(a, k, c, d)
        rank_hist[count] += 1
        observed = count == 72
        predicted = predicted_augmented_injective(a, k, c, d)
        assert observed == predicted
        if observed:
            injective.append((a, k, c, d))

    # The original map and its minimal repair.
    assert kernel_size(1, 1) == 3
    assert augmented_count(1, 1, 0, 1) == 72

    # A determinant-zero trit is redundant and fails.
    assert augmented_count(1, 1, 1, 2) == 24

    # No one-bit augmentation can separate each 3-element phase fibre.
    # This enumerates every possible binary labelling of one fibre.
    binary_separating_tags = 0
    for tags in product(range(2), repeat=3):
        if len(set(tags)) == 3:
            binary_separating_tags += 1
    assert binary_separating_tags == 0

    print("homomorphism classification: Z_24 x Z_3 -> Z_24")
    print(f"phase_maps={24*3}")
    print("phase_kernel_hist="
          + ",".join(f"{size}:{phase_kernel_hist[size]}"
                     for size in sorted(phase_kernel_hist)))
    print(f"surjective_phase_maps={len(surjective)}")
    print(f"surjective_phase_examples={surjective[:8]}")
    print("maximally_informative_phase_kernel_size=3")
    print("lost_information_bits=log2(3)=1.584962500721156")
    print("linear trit completion: q(i,j)=c*i+d*j mod 3")
    print(f"augmented_maps={24*3*3*3}")
    print("augmented_image_hist="
          + ",".join(f"{size}:{rank_hist[size]}"
                     for size in sorted(rank_hist)))
    print(f"injective_augmented_maps={len(injective)}")
    print(f"injective_fraction={len(injective)}/{24*3*3*3}")
    print("injectivity_criterion=a odd and (a*d-2*k*c) mod 3 != 0")
    print("original_map=(a,k)=(1,1): kernel_size=3")
    print("repair_q=j: (c,d)=(0,1), augmented_states=72")
    print("negative_control_q=i+2j: determinant=0, augmented_states=24")
    print("binary_separating_tags_for_three_element_fibre=0")
    print("ALL_EXACT_ASSERTIONS_PASSED")


if __name__ == "__main__":
    main()
```

