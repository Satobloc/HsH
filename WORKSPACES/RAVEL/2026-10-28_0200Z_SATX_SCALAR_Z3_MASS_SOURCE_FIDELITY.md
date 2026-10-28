# Ravel | SATx scalar potential and Z3 mass-map fidelity | 2026-10-28 02:00Z

**Status:** SOURCE-AUDITED / SYMPY-EXECUTED / SIX LEAN THEOREMS COMPILED / NO PHYSICAL VALIDATION / NOT BEDROCK.
**Actor:** current source-grounded assistant, not authenticated historical Ravel.
**Scope:** Nathan Direct descriptive geometry versus historical assistant scalar mathematics. No CODATA scoring.

## Original source identity
- Nathan Direct current BEDROCK BR-005, HsH blob `4cabda482c48c217614b868a2138409275df9bf7`: theta4 is measured from time normal, theta4=0 aligned vacuum.
- Nathan-attributed `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`: filament/time-wavefront incidence contributes to mass; no specific Z3 scalar potential derived.
- Historical assistant `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT X/SATx CANONICAL.txt`, blob `afbf610347a6a39c74cf52cbe3818ef22ab3ebcf`, Module 2: `L_theta=1/2(partial theta)^2 - mu² cos(3theta)`, printed `Box theta + mu² sin(3theta)=0`, mass `sin²theta`.
- Historical assistant `Satobloc/SAT_THEORY_ARCHIVE_2023-25/FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt`, blob `9d5db44f16f1f2d853332efd8d91995a37e8d394`, printed variant `Box theta +3mu² sin(3theta)-beta div A=0`. Prior EQI-0002 audit **already** identified this variant's action/E-L sign error and beta constraint issue.
- Assistant synthesis `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Full Revamp.txt`, blob `2094f6d51c9f407a575a18057ec8330c4ae2ca72`, opening scalar section: theta identified modulo 2pi/3, mass sin²theta, same L but `V=-mu² cos(3theta)`.

## Geometric map (typed; arrows are not assumed equivalences)
```mermaid
flowchart LR
 A[Filament tangent T and sheet normal n / Nathan Direct] --> B[Incidence angle theta4, aligned 0]
 B -. unproved constitutive map .-> C[Historical assistant scalar field theta4(x)]
 C --> D[Threefold potential cos 3theta]
 C --> E[Mass readout sin²theta]
 C --> F[Claimed identification theta ~ theta + 2pi/3]
 D --> G[Action-to-potential sign check]
 E --> H[Quotient-invariance obstruction]
 F --> H
```

## Glossary
`T`: filament tangent, `n`: time normal; `theta4`: incidence angle (Nathan Direct); `theta4(x)`: assistant-proposed scalar field, not yet a derived map; `V`: potential under the stated `L=K-V` convention; `Z3 quotient`: physical identification only if explicitly imposed, not merely periodic potential; `m(theta)`: assistant-proposed mass readout, not an empirical prediction.

## New cross-source mathematical result
Exact SymPy source-based symbolic check executed (local script, no physical fixtures/data). Under standard `L=K-V`:
- Printed `Lpot=-mu² cos(3theta)` implies `V=+mu² cos(3theta)`, contrary to the later synthesis's `V=-mu² cos(3theta)`.
- Scalar potential contribution to E-L is `-3mu² sin(3theta)`, not SATx Module 2's `+mu² sin(3theta)`. Prior EQI-0002 already found the sign issue in the *other* 3mu² historical variant.
- For mu>0, `V(0)=+mu²`, `V(pi/3)=-mu²`, and `V''(0)=-9mu²`. Thus the printed scalar action does not make the aligned theta=0 state a stable scalar-potential minimum.
- **Distinct quotient obstruction:** `cos(3(theta+2pi/3))=cos(3theta)` but `sin²0=0` while `sin²(2pi/3)=3/4`. If theta and theta+2pi/3 are physically identified, the printed mass law is not single-valued on that quotient. If they are distinct sectors, stop claiming quotient identification; a periodic potential alone is not a quotient.

## Discrepancy ledger
| ID | Type | Status |
| --- | --- | --- |
| RV-S01 | Nathan incidence vs assistant scalar field | TRANSLATION MAP MISSING |
| RV-S02 | L vs stated V sign | SOURCE CONTRADICTION |
| RV-S03 | SATx Module 2 missing 3 and reversed sign | VARIANT DISCREPANCY; earlier separate sign audit acknowledged |
| RV-S04 | mass sin² vs Z3 quotient | NEW STRUCTURAL OBSTRUCTION |
| RV-S05 | theta=0 vacuum vs inferred potential maximum | CONDITIONAL TENSION, NOT PHYSICAL REFUTATION |
| RV-S06 | beta constraint issue | PRIOR EQI-0002, NOT NEW |
| RV-S07 | experimental map, units, uncertainty | NOT ESTABLISHED; NO CODATA |

**Proof status:** draft PR #831 at https://github.com/Satobloc/HsH/pull/831, six conditional theorems including Z3 potential periodicity and sin² nonperiodicity. Actual Lean 4.34.0/Mathlib CI #40618416449 SUCCESS, 8,944 build jobs, compiled RavelSATxScalarPotentialGate; separate automated axiom audit SKIPPED. **No automatic source/physical fidelity from compilation.**

**Next deeper cursor:** recover raw role-tagged generation and corrections for Module 2 and Full Revamp; determine whether Z3 means quotient, distinct sectors or potential periodicity; then formally test quotient invariance and seek independent review. P1 Nov 9 Orson cognition; P2 Nov 30 real measured system; P3 Dec 14 source-typed full-theory paper remain separate.
