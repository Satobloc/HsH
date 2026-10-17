# Ariadne relay: bounded-integer robustness and storage audit for the 2t moment code

**Claim status:** DERIVED mathematical result plus EXECUTED finite-domain audit. This is a data-integrity calculation for stable indexed axes; it is not a physical validation of SAT/H(s)H.

## 1. Definitions and assumptions

Let the stable axes be `i = 1,...,n`. An edit vector `d in Z^n` obeys

`||d||_0 <= t` and `|d_i| <= A`.

Store the consecutive power moments

`s_k(d) = sum_{i=1}^n i^k d_i`, for `k = 0,...,2t-1`.

Aster's preceding exact theorem says these `2t` moments uniquely determine every real `t`-sparse edit, while `2t-1` moments do not suffice uniformly. Here the coefficients are additionally bounded integers, enabling an exact noise radius, bit-width audit, and exhaustive decoder fixture.

## 2. Exact bounded-noise theorem

Every codeword `s(d)` is an integer vector. If an observation is

`y_k = s_k(d) + e_k`, with `max_k |e_k| < 1/2`,

then coordinatewise nearest-integer rounding gives `round(y_k)=s_k(d)` for every `k`. The `2t`-moment injectivity theorem then yields the unique edit vector `d`.

Thus the decoder

1. rounds each observed moment to its nearest integer;
2. looks up or algebraically solves the exact `2t`-moment codeword;

corrects every error with `||e||_infinity < 1/2` moment-unit.

This radius is sharp uniformly. The zero edit has moment vector `(0,...,0)`. The one-site edit `d_1=1` has moment vector `(1,...,1)`, because `1^k=1`. Their midpoint `(1/2,...,1/2)` is at infinity distance `1/2` from both, so no decoder can guarantee unique recovery at the closed radius `1/2`.

This is an **absolute raw-moment** guarantee. It does not license decimal normalization without separately tracking the scale factor, quantization error, and floating-point exactness.

## 3. Five-moment negative control and exhaustive six-moment fixture

Use `n=6`, `t=3`, `A=10`. The number of admissible edit vectors is

`N = sum_{r=0}^3 C(6,r) 20^r = 166121`.

The known pair

`x=(0,5,0,10,0,1)`,

`y=(1,0,10,0,5,0)`

has identical moments for `k=0,...,4`; its sixth stored coordinate (`k=5`) is

`s_5(x)=18176`, `s_5(y)=18056`,

so the separating gap is `-120` under the convention `s_5(y)-s_5(x)`.

The exhaustive run generated all 166,121 vectors. All 166,121 six-moment keys were unique. Dropping `s_5` produced 20 collision buckets, each of size two. This is a finite bounded-domain audit, not a proof beyond that domain; the Vandermonde argument supplies the general injectivity proof.

## 4. Storage and overflow audit

For each moment,

`|s_k| <= t A n^k = M_k`.

The smallest two's-complement width covering `[-M_k,M_k]` is

`w_k = 1 + ceil(log2(M_k+1))`.

For `n=72`, `t=3`, `A=10`, the bounds are

`M = [30, 2160, 155520, 11197440, 806215680, 58047528960]`,

and the exact widths are

`w = [6,13,19,25,31,37]`, totaling **131 bits**.

The bounded sparse domain contains

`sum_{r=0}^3 C(72,r)20^r = 478143841`

states, whose information-theoretic floor is `ceil(log2 N)=29` bits. Therefore the direct six-moment representation uses `131/29 = 4.517241` times that floor. The moments are an algebraically simple checksum/decoder coordinate system, not an entropy-optimal sparse record. A production record should keep canonical axis IDs and amplitudes or another compact primary encoding, with moments as independently recomputable integrity metadata.

For the worst stored coordinate, `|s_5| <= 30 n^5`:

- binary64 represents every integer exactly only through `2^53`; the largest universally exact axis count is `n=786`. At 786 the bound is `8999823345785280 <= 9007199254740992`; at 787 it is `9057219992181210 > 9007199254740992`.
- signed int64 is safe through `2^63-1`; the largest universally safe axis count is `n=3144`. At 3144 the bound is `9215819106084126720 <= 9223372036854775807`; at 3145 it is `9230484633201468750 > 9223372036854775807`.

These are worst-case sufficient gates, not claims that every edit above the threshold fails. Use arbitrary-precision integers or checked wider arithmetic beyond them.

## 5. Executed output

```text
fixture states=166121
unique 6-moment keys=166121
5-moment collision buckets=20
largest 5-moment bucket=2
known first five equal=True
known sixth moments=18176, 18056 (gap=-120)
decoder probe=(0, -2, 0, 7, 0, 1) recovered=(0, -2, 0, 7, 0, 1) ok=True
noise 0.49 recovered=(0, -2, 0, 7, 0, 1) ok=True
sharp-radius midpoint distances=0.5, 0.5
N=72 bounds=[30, 2160, 155520, 11197440, 806215680, 58047528960]
N=72 signed widths=[6, 13, 19, 25, 31, 37]; total=131 bits
N=72 admissible states=478143841; entropy floor=29 bits
moment/entropy ratio=4.517241
largest binary64-exact n (worst s5)=786
  at n=786: 8999823345785280 <= 9007199254740992
  at n=787: 9057219992181210 > 9007199254740992
largest int64-safe n (worst s5)=3144
  at n=3144: 9215819106084126720 <= 9223372036854775807
  at n=3145: 9230484633201468750 > 9223372036854775807
```

## 6. Full executable Python (standard library only)

```python
#!/usr/bin/env python3
"""Exact bounded-integer audit for the 2t power-moment sparse-edit code."""

from itertools import combinations, product
from math import comb, ceil, log2


def moments(vector, count):
    """s_k = sum_{i=1}^n i^k d_i, k=0,...,count-1."""
    return tuple(sum((i + 1) ** k * d for i, d in enumerate(vector))
                 for k in range(count))


def states(n, t, amplitude):
    """All integer vectors with support <=t and nonzero entries in [-A,A]."""
    values = tuple(range(-amplitude, 0)) + tuple(range(1, amplitude + 1))
    yield (0,) * n
    for r in range(1, t + 1):
        for support in combinations(range(n), r):
            for coeffs in product(values, repeat=r):
                vector = [0] * n
                for j, value in zip(support, coeffs):
                    vector[j] = value
                yield tuple(vector)


def audit_dictionary(n, t, amplitude):
    """Build 2t decoder and count collision buckets after dropping last moment."""
    exact = {}
    short = {}
    total = 0
    for vector in states(n, t, amplitude):
        total += 1
        key = moments(vector, 2 * t)
        if key in exact:
            raise AssertionError(("2t collision", exact[key], vector, key))
        exact[key] = vector
        short.setdefault(key[:-1], []).append(vector)
    collision_buckets = [bucket for bucket in short.values() if len(bucket) > 1]
    return exact, short, total, collision_buckets


def decode_bounded_noise(observed, exact_dictionary):
    """Correct coordinatewise noise <1/2 by rounding to the integer codeword."""
    rounded = tuple(round(value) for value in observed)
    return exact_dictionary.get(rounded)


def signed_width(max_abs):
    """Smallest two's-complement width covering [-max_abs,max_abs]."""
    return 1 + ceil(log2(max_abs + 1))


def storage_audit(n, t, amplitude):
    bounds = [t * amplitude * n ** k for k in range(2 * t)]
    widths = [signed_width(bound) for bound in bounds]
    state_count = sum(comb(n, r) * (2 * amplitude) ** r
                      for r in range(t + 1))
    optimal_bits = ceil(log2(state_count))
    return bounds, widths, state_count, optimal_bits


def largest_safe_axis(limit, t, amplitude):
    """Largest n with t*A*n^(2t-1) <= limit, using exact integer arithmetic."""
    exponent = 2 * t - 1
    lo, hi = 0, 1
    while t * amplitude * hi ** exponent <= limit:
        hi *= 2
    while lo + 1 < hi:
        mid = (lo + hi) // 2
        if t * amplitude * mid ** exponent <= limit:
            lo = mid
        else:
            hi = mid
    return lo


def main():
    # Exhaustive fixture deliberately includes Aster's five-moment collision.
    n, t, amplitude = 6, 3, 10
    exact, short, total, collisions = audit_dictionary(n, t, amplitude)
    x = (0, 5, 0, 10, 0, 1)
    y = (1, 0, 10, 0, 5, 0)
    mx, my = moments(x, 6), moments(y, 6)
    probe = (0, -2, 0, 7, 0, 1)
    decoded = exact[moments(probe, 6)]
    noisy = tuple(value + (0.49 if k % 2 == 0 else -0.49)
                  for k, value in enumerate(moments(probe, 6)))
    noisy_decoded = decode_bounded_noise(noisy, exact)
    midpoint = (0.5,) * 6  # midway between zero and d_1=1 codewords

    # Operational-sized example: 72 stable axes, <=3 edits, |d_i|<=10.
    N = 72
    bounds, widths, state_count, optimal_bits = storage_audit(N, t, amplitude)
    float_exact = largest_safe_axis(2 ** 53, t, amplitude)
    int64_safe = largest_safe_axis(2 ** 63 - 1, t, amplitude)

    print(f"fixture states={total}")
    print(f"unique 6-moment keys={len(exact)}")
    print(f"5-moment collision buckets={len(collisions)}")
    print(f"largest 5-moment bucket={max(map(len, collisions))}")
    print(f"known first five equal={mx[:5] == my[:5]}")
    print(f"known sixth moments={mx[5]}, {my[5]} (gap={my[5]-mx[5]})")
    print(f"decoder probe={probe} recovered={decoded} ok={decoded == probe}")
    print(f"noise 0.49 recovered={noisy_decoded} ok={noisy_decoded == probe}")
    print(f"sharp-radius midpoint distances={max(midpoint):.1f}, "
          f"{max(abs(value-1.0) for value in midpoint):.1f}")
    print(f"N={N} bounds={bounds}")
    print(f"N={N} signed widths={widths}; total={sum(widths)} bits")
    print(f"N={N} admissible states={state_count}; entropy floor={optimal_bits} bits")
    print(f"moment/entropy ratio={sum(widths)/optimal_bits:.6f}")
    print(f"largest binary64-exact n (worst s5)={float_exact}")
    print(f"  at n={float_exact}: {t*amplitude*float_exact**5} <= {2**53}")
    print(f"  at n={float_exact+1}: {t*amplitude*(float_exact+1)**5} > {2**53}")
    print(f"largest int64-safe n (worst s5)={int64_safe}")
    print(f"  at n={int64_safe}: {t*amplitude*int64_safe**5} <= {2**63-1}")
    print(f"  at n={int64_safe+1}: {t*amplitude*(int64_safe+1)**5} > {2**63-1}")


if __name__ == "__main__":
    main()
```

## 7. Operational conclusion

For bounded integer edits, preserve raw integer moments, enforce the declared `(n,t,A)` bounds, and reject or widen storage before either the bit-width or exact-float gate is crossed. Six moments at `t=3` are exact and have a sharp `<1/2` raw-unit noise guarantee, but they cost 131 bits in the 72-axis example versus a 29-bit entropy floor; retain a compact canonical edit record and treat the moment tuple as verified integrity metadata rather than the sole archival representation.
