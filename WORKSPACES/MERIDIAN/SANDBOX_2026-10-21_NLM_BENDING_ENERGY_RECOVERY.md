# Meridian | NLM bending-energy recovery for second-order Cruller winding | 2026-10-21

**Status:** historical recovery and bounded mathematical audit; not current SAT/H(s)H adoption. User correctly notes that the NLM conversations contain repeated bending-energy calculations. Mersearch-first check: shared request `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` currently owned by Orson, so it was NOT overwritten or executed. This was bounded GitHub search followed by exact source file reads, not exhaustive historical excavation.

## Primary NLM sources inspected

1. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt` (blob `33785afb8d46804122d79056b952169f99b325e2`), lines 14-23: `L_SAT=(kappa/2)|H''|²+(lambda_s/2)(|H|²-R²)²+(k/2)|H-G|²`; explicitly interprets `|H''|²` as bending-energy density and `kappa` as filament stiffness. Lines ~75-84 diagnose and attempt to repair dimensions in its cross-sector hinge identity; numerical/physical status uncertain. Its use of `L` does not fix whether `lambda` is arclength, physical time or some other parameter, nor whether the quantity integrated is energy or action.
2. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt` (blob `02312fbb23167e8ce1c996451199ee0e498437b1`), lines 70-85 and 104-116: includes BOTH line-tension term and `(kappa/2)|X''|²` in a sum-over-filaments action, uses historical `T≈1.2×10^44 N`. Gives 4th-order EL equation and a claimed helical dispersion `omega⁴=2|lambda_s|r_h²/kappa`.
3. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt` (blob `99a137e4891cd4a3ecaee86cf76a2d06c5af300b`), lines 61-75: repeats action, provides `kappa` dimension `M L T^-2 = N` while explicitly interpreting it as bending stiffness; that is NOT the usual `E*L=J*m` of arclength-integrated curvature squared, so the parameter convention must be recovered before reusing any numerical value. Also says the claimed real-frequency stationary solution requires `lambda_s<0`.
4. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/nlmGR-QM.txt` was fetched; content SHA is identical to `GRQM.txt` (blob `33785afb8d46804122d79056b952169f99b325e2`). Count as **duplicate**, not independent confirmation.

These are actual equation-bearing historical records. They do **not** establish the user-remembered specific numerical **maximum** bending energy; no located result is currently certified as the maximizer or as an experimentally measured cap.

## Direct algebraic test of the old 4th-order ansatz

For `V(H)=(lambda_s/2)(|H|²-R²)²`, positive `lambda_s` is required for this unconstrained quartic potential to be bounded below. In the old stationary equation `kappa H''''+2lambda_s(|H|²-R²)H=0`, a two-plane harmonic `H=(A cos(w1 lambda), A sin(w1 lambda), B cos(w2 lambda), B sin(w2 lambda))` at constant `|H|²=A²+B²` satisfies BOTH independent component equations:
```
[kappa*w1^4+2lambda_s*(A²+B²-R²)]*A=0
[kappa*w2^4+2lambda_s*(A²+B²-R²)]*B=0.
```
For A,B nonzero, kappa positive, and fixed lambda_s and radius, `w1^4=w2^4` (equal absolute frequencies); distinct frequencies cannot both satisfy the historical uncoupled ansatz. Moreover if `A²+B²>R²`, solving the claimed dispersion forces `lambda_s<0`, which makes the quartic potential unbounded below as |H|→∞. If `A²+B²<R²`, `lambda_s>0` can allow a positive frequency term for this specific finite-amplitude algebraic stationary equation; whether it is dynamically stable is a separate second-variation question. Thus the summary's claim that a superhelix is *proved stable* by `omega⁴=2|lambda_s|r_h²/kappa` does not follow.

The two-plane equal-frequency obstruction does not disprove current H(s)H. It identifies a historical Lagrangian's conditions and is one reason not to insert it unaltered into current Cruller calculations. Its scalar radial constraint is also not a demonstrated force law for the current Klein Fabric.

## Current-use implication

Bending energy IS extensively represented in the NLM historical program; former statement that there was no useful prior bending work was incorrect. Next step for current Cruller must be to recover the actual old maximum-energy derivation and test the assumptions/parameter/units. Meanwhile current native geometric constraints (curvature/reach) are valid independent of this old action. Planck convention c=hbar=G=1; treat tension [E/L], bending rigidity [E*L], and total bending energy [E] as distinct types. No historical `kappa` value or `lambda_s` sign is adopted from these extracts.

Meridian; SANDBOX.
