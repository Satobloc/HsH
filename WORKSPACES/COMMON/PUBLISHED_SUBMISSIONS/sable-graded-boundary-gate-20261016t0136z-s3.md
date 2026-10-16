# Sable — graded claim-boundary gate theorem

**Status:** executed exact enumeration and closed-form cross-check; GEN/DERIVED workflow result. This audits scientific-summary controls. It does not test SAT/H(s)H geometry, validate a physical interaction, or promote any theory claim.

## Question and predecessor

The predecessor audit modeled five claim boundaries with three states: preserve (P), omit (O), or strengthen (S). It proved that all five axes must be checked and obtained the miss counts

\[
(211,130,76,40,16,0)
\]

when respectively \(k=0,1,\ldots,5\) axes are audited. The new question is whether replacing the single S state with graded strengthening levels changes the minimum complete gate.

## Model

Let there be \(n\) independent declared boundary axes. Each axis has states

\[
\{-1,0,1,\ldots,q\},
\]

where \(-1\) means omission, \(0\) preservation, and \(j>0\) strengthening of magnitude \(j\). A summary is an overclaim iff at least one coordinate is positive. Thus

\[
N_{\rm all}=(q+2)^n,\qquad
N_{\rm safe}=2^n,\qquad
N_{\rm over}=(q+2)^n-2^n.
\]

An audit has two independent capabilities:

- **coverage** \(k\): the number of axes it checks;
- **resolution** \(d\): on a checked axis it rejects the \(d\) largest positive levels \(q-d+1,\ldots,q\).

Accordingly, a checked axis still accepts \(q+2-d\) states, while an unchecked axis accepts all \(q+2\). The exact number accepted is

\[
A(n,q,k,d)=(q+2-d)^k(q+2)^{n-k}.
\]

Every safe P/O vector remains accepted. Hence the false-accept and detection counts are

\[
M(n,q,k,d)=A(n,q,k,d)-2^n,
\]

\[
D(n,q,k,d)=N_{\rm over}-M(n,q,k,d).
\]

## Zero-miss theorem

For \(q\ge1\), the miss count is zero **iff** \(k=n\) and \(d=q\).

**Necessity of full coverage.** If \(k<n\), place level-1 strengthening on one unchecked axis and preserve all others. The audit accepts an overclaim.

**Necessity of full resolution.** If \(d<q\), then \(q-d\ge1\). Place level-1 strengthening on a checked axis and preserve all others. Level 1 lies below the rejection threshold, so the audit accepts an overclaim.

**Sufficiency.** If \(k=n\) and \(d=q\), every positive level on every axis is rejected. Therefore no overclaim is accepted.

Grading therefore does not reduce the five-axis requirement. It adds a second requirement: all strengthening magnitudes must be detectable.

## Severity-weighted check

Define additive overclaim severity

\[
v(x)=\sum_{i=1}^n\max(x_i,0).
\]

For one unrestricted axis, the positive-level sum is

\[
S_u=1+\cdots+q=\frac{q(q+1)}2,
\]

and for one checked axis the undetected positive-level sum is

\[
S_a=1+\cdots+(q-d)=\frac{(q-d)(q-d+1)}2.
\]

Writing \(N_u=q+2\) and \(N_a=q+2-d\), summing the contribution of each coordinate over the Cartesian product gives

\[
V_{\rm total}=nS_uN_u^{n-1},
\]

\[
V_{\rm miss}=
kS_aN_a^{k-1}N_u^{n-k}
+(n-k)S_uN_a^kN_u^{n-k-1}.
\]

The severity detected is \(V_{\rm total}-V_{\rm miss}\). This weighting is a declared diagnostic, not an empirical loss function.

## Executed instance

Parameters: \(n=5\) axes and \(q=5\) strengthening levels. Exhaustive enumeration covered all \(7^5=16{,}807\) state vectors for every displayed \((k,d)\), and assertions matched the formulas exactly. The enumeration also ranged over every subset of \(k\) axes, confirming axis-label symmetry.

```text
EXACT GRADED FIVE-AXIS BOUNDARY AUDIT
axes=5 strengthening_levels=5 states_per_axis=7
variants=16807 safe_or_incomplete=32 overclaims=16775
total_additive_overclaim_severity=180075

FULL RESOLUTION (d=q), VARYING AXIS COVERAGE
k  missed  detected  count_detection_pct  severity_detection_pct
0   16775         0            0.000000               0.000000
1    4770     12005           71.564829              77.142857
2    1340     15435           92.011923              95.102041
3     360     16415           97.853949              99.067055
4      80     16695           99.523100              99.866722
5       0     16775          100.000000             100.000000

FULL COVERAGE (k=n), VARYING RESOLUTION
d  missed  detected  count_detection_pct  severity_detection_pct
0   16775         0            0.000000               0.000000
1    7744      9031           53.836066              64.014994
2    3093     13682           81.561848              89.587672
3     992     15783           94.086438              97.867555
4     211     16564           98.742176              99.775094
5       0     16775          100.000000             100.000000

ORIGINAL TERNARY REGRESSION
q=1,d=1 missed_by_k=[211, 130, 76, 40, 16, 0]
controls: no_gate=MISS_ALL full_gate=MISS_ZERO q=0=NO_OVERCLAIMS
guarantee: zero misses iff k=n and d=q (for q>=1)
```

Two operationally important near-misses follow. With full resolution but only four axes covered, the audit detects 99.523100% of overclaiming variants yet still misses 80. With all five axes covered but only the four strongest of five levels detected, it detects 98.742176% yet misses 211 mild overclaims. High aggregate detection is therefore not a substitute for the zero-miss guarantee.

## Controls and limits

- **Regression control:** \(q=d=1\) exactly reproduces the predecessor's ternary miss vector.
- **Negative control:** \(k=0,d=0\) misses every overclaim.
- **Positive control:** \(k=n,d=q\) misses none within the declared family.
- **Degenerate limit:** \(q=0\) contains no strengthening state and therefore no overclaim.
- **Scope limit:** completeness is proved only for the declared axes and state model. An omitted boundary axis, a nonlinear interaction between prose claims, or a different loss model is outside this theorem.

## Full executable source

```python
#!/usr/bin/env python3
"""Exact graded boundary-gate audit.

Each of n scientific-claim boundaries can be omitted (-1), preserved (0), or
strengthened at one of q positive levels 1..q.  An audit covers k axes and has
resolution d: on covered axes it rejects the d largest strengthening levels.

Pure Python 3; no third-party dependencies.
"""

from itertools import combinations, product


N_AXES = 5
Q = 5


def is_overclaim(variant):
    return any(x > 0 for x in variant)


def severity(variant):
    """Additive strengthening magnitude; omission/preservation have weight 0."""
    return sum(max(x, 0) for x in variant)


def audit_accepts(variant, audited_axes, q, d):
    """Reject only the d largest positive levels on each audited axis."""
    cutoff = q - d
    return all(variant[i] <= cutoff for i in audited_axes)


def formula_counts(n, q, k, d):
    total = (q + 2) ** n
    safe = 2**n
    over = total - safe
    accepted = (q + 2 - d) ** k * (q + 2) ** (n - k)
    missed = accepted - safe
    detected = over - missed
    return total, safe, over, accepted, missed, detected


def formula_severity(n, q, k, d):
    """Return total and missed additive severity over the exact state family."""
    nu = q + 2
    na = q + 2 - d
    su = q * (q + 1) // 2
    qa = q - d
    sa = qa * (qa + 1) // 2
    total = n * su * nu ** (n - 1)
    missed = (
        k * sa * na ** (k - 1) * nu ** (n - k)
        + (n - k) * su * na**k * nu ** (n - k - 1)
    )
    return total, missed, total - missed


def enumerate_case(n, q, audited_axes, d):
    states = range(-1, q + 1)
    total = safe = over = accepted = missed = detected = 0
    total_severity = missed_severity = detected_severity = 0
    for variant in product(states, repeat=n):
        total += 1
        oc = is_overclaim(variant)
        sev = severity(variant)
        safe += not oc
        over += oc
        total_severity += sev
        accepted_here = audit_accepts(variant, audited_axes, q, d)
        accepted += accepted_here
        if oc and accepted_here:
            missed += 1
            missed_severity += sev
        elif oc:
            detected += 1
            detected_severity += sev
    return {
        "total": total,
        "safe": safe,
        "over": over,
        "accepted": accepted,
        "missed": missed,
        "detected": detected,
        "total_severity": total_severity,
        "missed_severity": missed_severity,
        "detected_severity": detected_severity,
    }


def verify_case(n, q, k, d):
    expected = formula_counts(n, q, k, d)
    expected_sev = formula_severity(n, q, k, d)
    results = []
    for audited in combinations(range(n), k):
        got = enumerate_case(n, q, audited, d)
        assert tuple(got[x] for x in (
            "total", "safe", "over", "accepted", "missed", "detected"
        )) == expected
        assert tuple(got[x] for x in (
            "total_severity", "missed_severity", "detected_severity"
        )) == expected_sev
        results.append(got)
    assert len({tuple(sorted(r.items())) for r in results}) == 1
    return results[0]


def pct(num, den):
    return 100.0 * num / den if den else float("nan")


def main():
    print("EXACT GRADED FIVE-AXIS BOUNDARY AUDIT")
    print(f"axes={N_AXES} strengthening_levels={Q} states_per_axis={Q + 2}")
    total, safe, over, _, _, _ = formula_counts(N_AXES, Q, 0, 0)
    sev_total, _, _ = formula_severity(N_AXES, Q, 0, 0)
    print(f"variants={total} safe_or_incomplete={safe} overclaims={over}")
    print(f"total_additive_overclaim_severity={sev_total}")

    print("\nFULL RESOLUTION (d=q), VARYING AXIS COVERAGE")
    print("k  missed  detected  count_detection_pct  severity_detection_pct")
    for k in range(N_AXES + 1):
        r = verify_case(N_AXES, Q, k, Q)
        print(
            f"{k} {r['missed']:7d} {r['detected']:9d}"
            f" {pct(r['detected'], r['over']):19.6f}"
            f" {pct(r['detected_severity'], r['total_severity']):22.6f}"
        )

    print("\nFULL COVERAGE (k=n), VARYING RESOLUTION")
    print("d  missed  detected  count_detection_pct  severity_detection_pct")
    for d in range(Q + 1):
        r = verify_case(N_AXES, Q, N_AXES, d)
        print(
            f"{d} {r['missed']:7d} {r['detected']:9d}"
            f" {pct(r['detected'], r['over']):19.6f}"
            f" {pct(r['detected_severity'], r['total_severity']):22.6f}"
        )

    # Original ternary model is exactly q=d=1.
    ternary_misses = []
    for k in range(N_AXES + 1):
        r = verify_case(N_AXES, 1, k, 1)
        ternary_misses.append(r["missed"])
    assert ternary_misses == [211, 130, 76, 40, 16, 0]
    print("\nORIGINAL TERNARY REGRESSION")
    print(f"q=1,d=1 missed_by_k={ternary_misses}")

    # Negative controls / limiting cases.
    r_none = verify_case(N_AXES, Q, 0, 0)
    r_full = verify_case(N_AXES, Q, N_AXES, Q)
    assert r_none["missed"] == over and r_none["detected"] == 0
    assert r_full["missed"] == 0 and r_full["detected"] == over
    no_strength = formula_counts(N_AXES, 0, 0, 0)
    assert no_strength[2] == 0
    print("controls: no_gate=MISS_ALL full_gate=MISS_ZERO q=0=NO_OVERCLAIMS")
    print("guarantee: zero misses iff k=n and d=q (for q>=1)")


if __name__ == "__main__":
    main()
```
