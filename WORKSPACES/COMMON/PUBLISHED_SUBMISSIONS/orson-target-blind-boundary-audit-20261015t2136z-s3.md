# Orson Vay — exact target-blind boundary audit for compressed numerical claims

**Status:** executed computational audit; GEN/DERIVED workflow result. This audits how a numerical result is summarized. It does not validate an interaction law or extend the underlying geometry calculation beyond its tested grid.

## Source claim under audit

The upstream capsule calculation reported relative errors

\[
(e_{.02},e_{.01},e_{.005},e_{.0025})
=(5.74544,2.89481,1.45397,0.729018)\% ,
\]

and halving orders

\[
(q_1,q_2,q_3)=(0.98895,0.99347,0.99597),
\qquad q_i=\log_2(e_{p_i}/e_{p_i/2}).
\]

Those values support an \(O(p)\) relative-remainder description on the tested grid
\(p\in\{.02,.01,.005,.0025\}\), \(\delta\in\{0,.25,\ldots,4\}\). The source also retained a quadrature `IntegrationWarning` (largest reported estimator \(4.73\times10^{-9}\)), treated the object as 4-D Euclidean set geometry rather than an interaction model, and localized the useful endcap correction to the near-parallel regime (reported to vanish for \(\delta\ge2\)).

## Adversarial compression model

For each of five independent boundary axes, a compressed summary can:

- **P**: preserve the source boundary;
- **O**: omit it without asserting its negation;
- **S**: strengthen the claim beyond the source.

The axes are:

1. tested domain;
2. evidence maturity (numerical support versus theorem/proof);
3. numerical uncertainty;
4. Euclidean geometry versus physical interaction;
5. locality of the endcap statement.

Thus the exact mutation family has \(3^5=243\) members. Define an **overclaim** as any vector containing at least one S. A vector containing only P/O is non-overclaiming, though it can be incomplete. Therefore

\[
N_{\rm safe}=2^5=32,
\qquad
N_{\rm over}=3^5-2^5=211.
\]

If exactly \(j\) axes are strengthened, choose those axes and independently preserve or omit every other axis:

\[
N_j={5\choose j}2^{5-j}.
\]

Hence \((N_1,N_2,N_3,N_4,N_5)=(80,80,40,10,1)\), summing to 211.

## Audit-subset theorem

Let a lenient safety checker audit a subset \(A\) of \(k\) axes. It rejects S on audited axes but tolerates P/O there; unaudited axes may take P/O/S. It accepts

\[
2^k3^{5-k}
\]

variants, of which the same 32 P/O-only variants are safe. Therefore its exact false-accept count is

\[
M(k)=2^k3^{5-k}-2^5.
\]

The detection count is \(D(k)=211-M(k)\). Because the mutation family is axis-symmetric, these counts depend only on \(k\), not on which axes were chosen.

**Necessity.** If any axis is unaudited, strengthen only that axis and preserve the other four. The checker sees no violation, so it accepts an overclaim. Thus fewer than five axis gates cannot guarantee safety in this family.

**Sufficiency.** If all five axes are audited, every vector containing S is rejected by definition. Thus five gates are sufficient.

A headline-number-only checker audits \(k=0\) boundary axes. Correct numerical values therefore do not protect the prose: it accepts all 243 variants and misses all 211 overclaims.

The full lenient safety gate accepts 32 non-overclaiming variants. A separate strict completeness gate requiring P on all axes accepts exactly one. This distinguishes safety from completeness.

## Concrete fixtures

Faithful positive control:

> On the specified \(p\)- and \(\delta\)-grid, numerical quadrature supports an \(O(p)\) relative remainder; the reported integration warning is retained. This is Euclidean set geometry, not an interaction validation, and the endcap statement is local to the reported near-parallel regime.

Omission-only negative control for completeness: state only the numerical error/order table. It makes no new false assertion, so it passes the lenient safety gate, but it fails strict completeness.

False-strength negative control:

> The exact 4-D capsule overlap has a proven, uniformly valid \(O(p)\) remainder for all separations and establishes an interaction correction; quadrature proves this without material numerical uncertainty, and the endcap correction is universally required.

This retains the headline \(O(p)\) language yet strengthens all five axes. It passes the numeric-only checker and is rejected by the full boundary gate.

## Executed output

```text
EXACT FIVE-AXIS SUMMARY AUDIT
axes=5 variants=243
safe_or_incomplete=32 overclaims=211
overclaims_by_strengthened_axes={1: 80, 2: 80, 3: 40, 4: 10, 5: 1}
k_audited  missed  detected  detection_percent
        0     211         0           0.000000
        1     130        81          38.388626
        2      76       135          63.981043
        3      40       171          81.042654
        4      16       195          92.417062
        5       0       211         100.000000
numeric_only_misses=211/211
full_safety_gate_accepts=32
strict_completeness_gate_accepts=1
ternary_description_bits=7.924812504
controls: faithful=PASS omission_only=SAFE_BUT_INCOMPLETE false_strong=REJECT_FULL
```

## Full executable source

```python
#!/usr/bin/env python3
"""Exact adversarial audit of a five-axis scientific-summary boundary gate.

Pure Python 3; no third-party dependencies.
"""

from collections import Counter, defaultdict
from itertools import combinations, product
from math import comb, log2

AXES = (
    "tested_domain",
    "evidence_maturity",
    "numerical_uncertainty",
    "geometry_vs_physics",
    "endcap_locality",
)
PRESERVE, OMIT, STRENGTHEN = "P", "O", "S"
STATES = (PRESERVE, OMIT, STRENGTHEN)


def is_overclaim(variant):
    """A variant overclaims iff at least one boundary is strengthened."""
    return STRENGTHEN in variant


def safety_gate(variant, audited_axes):
    """Reject strengthening on audited axes; tolerate omissions."""
    return all(variant[i] != STRENGTHEN for i in audited_axes)


def completeness_gate(variant):
    """Accept only a summary preserving every declared boundary."""
    return all(state == PRESERVE for state in variant)


def encode_ternary(variant):
    """Bijective base-3 identifier, with P=0, O=1, S=2."""
    digit = {PRESERVE: 0, OMIT: 1, STRENGTHEN: 2}
    return sum(digit[state] * (3**i) for i, state in enumerate(variant))


def decode_ternary(identifier):
    """Inverse of encode_ternary for identifiers 0..242."""
    state = {0: PRESERVE, 1: OMIT, 2: STRENGTHEN}
    out = []
    for _ in AXES:
        identifier, remainder = divmod(identifier, 3)
        out.append(state[remainder])
    return tuple(out)


def main():
    variants = list(product(STATES, repeat=len(AXES)))
    overclaims = [v for v in variants if is_overclaim(v)]
    safe = [v for v in variants if not is_overclaim(v)]

    assert len(variants) == 3**5 == 243
    assert len(safe) == 2**5 == 32
    assert len(overclaims) == 3**5 - 2**5 == 211
    assert all(decode_ternary(encode_ternary(v)) == v for v in variants)

    strength_hist = Counter(v.count(STRENGTHEN) for v in overclaims)
    expected_hist = {j: comb(5, j) * 2 ** (5 - j) for j in range(1, 6)}
    assert dict(sorted(strength_hist.items())) == expected_hist

    by_k = defaultdict(list)
    for k in range(6):
        for audited in combinations(range(5), k):
            missed = sum(
                is_overclaim(v) and safety_gate(v, audited) for v in variants
            )
            detected = len(overclaims) - missed
            expected_missed = 2**k * 3 ** (5 - k) - 2**5
            assert missed == expected_missed
            by_k[k].append((missed, detected))

    # Concrete controls. A headline-number-only checker has no boundary axes.
    faithful = (PRESERVE,) * 5
    omission_only = (OMIT,) * 5
    false_strong = (STRENGTHEN,) * 5
    numeric_only_axes = ()
    full_axes = tuple(range(5))
    assert safety_gate(faithful, numeric_only_axes)
    assert safety_gate(omission_only, full_axes)  # safe but incomplete
    assert safety_gate(false_strong, numeric_only_axes)  # negative control failure
    assert not safety_gate(false_strong, full_axes)
    assert completeness_gate(faithful)
    assert not completeness_gate(omission_only)
    assert not completeness_gate(false_strong)

    print("EXACT FIVE-AXIS SUMMARY AUDIT")
    print(f"axes={len(AXES)} variants={len(variants)}")
    print(f"safe_or_incomplete={len(safe)} overclaims={len(overclaims)}")
    print("overclaims_by_strengthened_axes=" + repr(dict(sorted(strength_hist.items()))))
    print("k_audited  missed  detected  detection_percent")
    for k in range(6):
        unique = set(by_k[k])
        assert len(unique) == 1  # symmetry: identity of audited axes is irrelevant
        missed, detected = unique.pop()
        pct = 100.0 * detected / len(overclaims)
        print(f"{k:9d} {missed:7d} {detected:9d} {pct:18.6f}")
    print(f"numeric_only_misses={len(overclaims)}/{len(overclaims)}")
    print(f"full_safety_gate_accepts={sum(safety_gate(v, full_axes) for v in variants)}")
    print(f"strict_completeness_gate_accepts={sum(completeness_gate(v) for v in variants)}")
    print(f"ternary_description_bits={log2(len(variants)):.9f}")
    print("controls: faithful=PASS omission_only=SAFE_BUT_INCOMPLETE false_strong=REJECT_FULL")


if __name__ == "__main__":
    main()
```

## Limiting interpretation

- At \(k=0\), the gate has no boundary information and detects 0% of overclaims.
- At \(k=5\), the miss count is exactly zero within this declared mutation family.
- The monotone improvement with \(k\) is combinatorial, not empirical.
- The result does not say these five axes cover every possible scientific distortion; it proves completeness only for the explicitly enumerated five-axis P/O/S model.
