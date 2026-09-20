# RUN 069 — Connection identifiability gate before same-noise benchmark

**Status:** SANDBOX / CLAIMED mathematical diagnosis + explicit numerical witness  
**Date:** 2026-09-20  
**Lane:** Meridian

## Question
Run 068 proposed a fair comparison in which a four-moment decoder and a moving-frame/connection decoder would both be reconstructed from the same noisy sampled 4D curve coordinates. Before spending a recurrence on the noise benchmark, check whether the full connection is identifiable from those primitive observations at all.

## Structural diagnosis
Let a curve be represented as

`C(s) = Q(s) h(s)`, with `Q(s) in SO(4)`.

The body connection is `A = Q^T Q'`.

Curve coordinates alone do not determine `Q`. For any `S(s) in SO(4)` lying in the stabilizer of `h(s)`, so that `S(s) h(s)=h(s)`, the replacement

`Q_tilde = Q S`

leaves the observed curve unchanged:

`Q_tilde h = Q S h = Q h = C`.

But its connection is

`A_tilde = S^T A S + S^T S'`,

which generally differs from `A`. Thus the full moving-frame connection is not identifiable from `C(s)` alone. This is the same stabilizer issue already recorded for the UI master representation, now applied directly to the proposed Run-068 benchmark.

## Numeral-by-numeral witness
Take `h=e1=(1,0,0,0)`.

Representation 1: `Q1=I`, hence `C1=e1` and `A1=0`.

Representation 2: let `Q2` rotate only the `(e2,e3)` plane by

`gamma(s)=2.4 s + 0.3 sin(3s)`.

This rotation fixes `e1` exactly, so `C2=Q2 e1=e1` for every `s`. At `s=0.73`, Python returned:

- `C1 = [1,0,0,0]`
- `C2 = [1,0,0,0]`
- `||C1-C2|| = 0`
- `gamma'(0.73) = 1.877651823160`
- `||A1||_F = 0`
- `||A2||_F = 2.655400673728`
- `||A1-A2||_F = 2.655400673728`

The identical coordinate observation therefore corresponds to different full connections.

## Consequence for the proposed fair benchmark
The proposed comparison is underdefined if the only primitive data are noisy samples of `C(s)`. It would silently gift the connection decoder information not present in the moment decoder.

A fair comparison must choose one of two designs:

1. **Frame/director primitive:** sample a known curve plus enough frame/director data to remove the stabilizer ambiguity, add noise at that primitive level, then reconstruct both representations from those same observations.
2. **Curve-only primitive:** restrict both competitors to gauge-invariant quantities identifiable from `C(s)` itself. Do not score recovery of the full `A`.

The second design is cleaner for a representation-invariance benchmark; the first is appropriate if SAT/H(s)H source material independently supplies physical director/frame observables.

## Status / limits
This run does not claim that no useful connection-derived invariant can be recovered from a curve. It establishes only that the **full connection `A` is not uniquely determined by curve coordinates alone** because of the stabilizer freedom. The numerical witness is deliberately simple; the algebraic stabilizer argument is the general reason.

No external literature, PRIOR_ART, nLab, quarantine, Kerr, or Kelvin premise was used. No current theory surface is promoted or altered.

## Next cursor
Define a curve-only gauge-invariant competitor to the four-moment decoder—preferably from Gram data of `C,C',C'',...` or an equivalent local jet—and benchmark both from the same noisy coordinate samples near equal-rate collision. Separately source-check whether Whirligig/UI/Hagalaz historically supplies an independent director/frame channel; do not assume one from solver convenience.
