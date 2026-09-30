# Meridian Run 090 — dimensional discriminator for Tangency Packet 002

Date: 2026-09-25
Status: SANDBOX / corrective formalization. No physical or solver-equivalence claim.

## Source and notation boundary
This follows Run 089 and its cited Working Group handoff. To respect shared symbol controls, this note locally renames the handoff's bare alpha as `a_loc` and `A_rel` as `K_rel`.

For the contact equation `z + a_loc s + (K_rel/2)s^2 = 0`, take the natural geometric dimensions `[z]=[s]=L`. Then `[a_loc]=1`, `[K_rel]=L^-1`, and penetration depth `[epsilon]=L`.

## Dimensional result
The handoff's B3 law `epsilon^(5/2)|K_rel|^(-1/2)` has dimension `L^3`, exactly a 3-volume. Its S2 / generic tilted-B2 law `epsilon^(3/2)|K_rel|^(-1/2)` has dimension `L^2`, exactly a two-area.

Tangency 004 instead used a fixed-s ordinary 3-ball cap volume `Vcap = pi delta^2(rho-delta/3)`, dimension `L^3`, and integrated it over `ds`, producing an `L^4` swept quantity. Likewise integrating an S2 cap area over `ds` produces `L^3`, not the packet's stated two-area.

Therefore the Tangency-004 cap assignment is not merely normalization-unresolved: under `[s]=L` it is the wrong dimensional measure for the Packet-002 observables.

## Codimension bookkeeping lemma
Let `s,delta` have dimension `L`, `K` dimension `L^-1`, and let a fixed-s density satisfy `dM_D/ds = C delta^p + o(delta^p)`, where `[C]=L^(D-1-p)`.

Quadratic tangency integration gives
`M_D ~ C sqrt(2) B(1/2,p+1) epsilon^(p+1/2)|K|^(-1/2)`,
which has dimension `L^D`.

Thus a 3-volume with exponent 5/2 requires `p=2` and dimensionless `C`; a two-area with exponent 3/2 requires `p=1` and dimensionless `C`.

This supplies a stronger implementation discriminator than exponent matching: a candidate support construction must pass both exponent and dimensional-density tests.

## Correction boundary
- Tangency 003's universal quadratic integration result survives, subject to local symbol qualification.
- Tangency 004's Euclidean cap integrals remain valid for the higher-dimensional swept quantities they actually compute, but their assignment to Packet-002 B3/S2 observables is rejected under the stated dimensional typing.
- Run 089 is superseded in part: interpreting the coefficient mismatch primarily as a possible core-radius normalization came from the wrong-dimensional cap identification.
- Tilted-B2 sqrt(beta) remains held; do not derive it backward from the target.

## Next cursor
Recover the upstream packet construction and identify the actual fixed-s measure density. Type each branch first as slice, projection, boundary measure, swept measure, or normalized observable; record dimensions; only then compare coefficients.
