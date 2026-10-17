# Meridian 029 | Variable-frame fourth-derivative false-sideband gate
2026-10-12 17:00 UTC | SANDBOX | Source-grounded relay reconstruction, **not** historical Meridian participation; no physical SAT/H(s)H claim.

## Sources
- Meridian 028, `WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_028_STRAIN_PARITY_COMMUTATOR_GATE_2026-10-12.md`, blob `d40d22a3a4800ce140b116116ef3160d03567a2e`.
- Meridian 026 transported-metric gate, blob `6bb56af5dba59bc980973e7c4b873db3fd43c483`.
- SAT archive `_AUTO_EXTRACTED_TEXT/WHIRLIGIG SUMMARY (nolat).txt`, blob `d8985d9f58cbbeb333c6f94de0c6dd23f900efe0`, pp.1-4, derivative extraction, authorship of individual passages unverified; and `2026 discussions/WHIRLIGIG SIMPLIFICATION TAKE 1.txt`, blob `bfe1a8771bf6faa2d8281863c7f4092f711020fa`.
- Cross-Formalism Index blob `cccca10267064650dffbc68dd0a6672ee65167e3`.

## Exact conditional theorem
Let `H=(cos2s,sin2s,cos3s,sin3s)/sqrt(2)`, `P=diag(1,1,-1,-1)`, `L0=kappa D^4+k I+4lambda H H^T`, and `T0 eta(s)=P eta(s+pi)`. Then `[L0,T0]=0`.

For **any smooth invertible periodic frame field** `S(s)`, set `G=S^-T S^-1`, `A=S' S^-1`, `nabla=D-A=S D S^-1`, `Htilde=S H`. The completely transported operator and half-turn are

```
Ltilde = S L0 S^-1 = kappa nabla^4 + k I + 4lambda Htilde (Htilde^T G)
Ttilde eta(s) = S(s) P S(s+pi)^-1 eta(s+pi).
[Ltilde,Ttilde] = 0.
```

`nabla^4` means four **composed** covariant derivatives, not an ordinary polynomial in noncommuting matrices. For `S(s)=exp(epsilon sin(2s) K)`, `K=E13+E31`, `A=2epsilon cos(2s)K` commutes with its derivatives and the explicit expansion is

```
(D-A)^4 = D^4 - 4A D^3 + (6A^2-6A')D^2
 +(-4A^3+12AA'-4A'')D
 +(A^4-6A^2 A'+3(A')^2+4A A''-A''').
```

## Executed Fourier-collocation fixture
N=96 periodic nodes, kappa=0.0003, k=1.3, lambda=0.9; negative-parity forcing `f0=cos(s)e1`. Compare (1) fully transported `Ltilde`, forced by `S f0`, with (2) **inconsistently hybrid** `Lnaive=kappa D^4+kI+4lambda S H H^T S^-1`, which omits the variable-frame connection in the fourth derivative.

Forbidden-sector amplitude fraction `||eta+Ttilde eta||/(2||eta||)`:

| epsilon | fully transported | naive hybrid |
|--:|--:|--:|
| 0 | 1.44e-14 | 1.44e-14 |
| 0.005 | 1.44e-14 | 9.584576e-5 |
| 0.01 | 1.44e-14 | 1.916888e-4 |
| 0.02 | 1.44e-14 | 3.833562e-4 |
| 0.04 | 1.44e-14 | 7.665411e-4 |
| 0.08 | 1.44e-14 | 1.531716e-3 |
| 0.12 | 1.44e-14 | 2.294182e-3 |

At epsilon=0.12, omitted-connection relative residual is 0.0041631623. Ratio of epsilon=0.01 and 0.005 naive leakage is 1.999972. Independent N=64 and N=128 tests reproduce the reported leakage to ~4e-15 absolute; the correct forced residual stays below 3e-13. This is **false positive parity leakage from incomplete coordinate transport**, not evidence of a new physical material law.

## Boundary
A genuinely physically deformed carrier with fixed Euclidean constitutive law is a *different* model and requires an independent constitutive tensor. This calculation does not derive the electron-to-planet bridge, finite-core dynamics, a physical SAT constant, or GR↔QM equivalence.

Local executable `meridian_029_variable_strain_covariance.py` SHA256 `bbeab910a3fd6334d04470375052f187d29cab271e81bfc81e409f309fdc14e4`; JSON `52550423f2131bef48053ff451029a233ad3ec7141ca5a76c25b68a6e0d286c3`; Class P figure `9d60125f945c228a1a4eaf99a7fa5d29c384c6e4441a26c0221b5b05adcb18d4`. Exact mathematics `CLAIMED VERIFIED` for this conditional fixture, physical interpretation `OPEN`.

Next: independently specify material law, check derivative connection and Galerkin convergence; no parameter fitting.
