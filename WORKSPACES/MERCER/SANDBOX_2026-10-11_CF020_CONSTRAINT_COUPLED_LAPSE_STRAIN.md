# CF-020 | Constraint-coupled lapse–strain gravity
**Mercer Calder | 2026-10-11 | SANDBOXED | LOCAL:CF020 | no theory promotion**

## Provenance / coverage
- SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt`, SHA `86cf006ca5ebf58263552c7515a9c9d575caae37`, opening ~15,000/37,220 characters substantially read (Nathan's July 3, 2026 exposition); and complete `RMS Spacetime Filaments.txt`, SHA `0323682e7a49278b5a76d0c6a5a7787a13eb17d6` (10,663 characters). Historical proposals are not established equations.
- HsH September 30: complete `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, SHA `81ae23a106939cba7e3d134ed5c90a7d7a979a25` (9,258 characters), esp. 3rd–6th, Proposition B/E; complete `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D COVARIANCE+SATO.txt`, SHA `f5e20279410987e72d44f2f5c5fdad238bbaa8a8` (4,521 characters, assistant-written integration guidance).
- Read current Common front door, Cross-Formalism Index, symbol/citation controls, Reference Desk and HSH_RESOURCES routing packet including War Room declaration. No restricted external materials imported; no exhaustive corpus novelty search.

## Exact mathematical gate
Using the **imported GR** static spherical benchmark `ds²=-N²dt²+(1+S)dr²+r²dΩ²`, let `m=rS/[2(1+S)]`. The static vacuum Einstein–Hilbert radial action (boundary terms understood) is `I=∫N m' sqrt(1+S)dr`. Its equations are `m'=0`, `N'/N=S/(2r)`.

Put `N=1+εn`, `S=εs` (LOCAL:CF020 dimensionless perturbations). Symbolic expansion yields `L1=(rs)'/2` and, **modulo the exact boundary derivative** `[rns/2-3rs²/8]'`,
```
L2_bulk = s²/8 - (r/2)n's.
δ_s: s=2rn' ; δ_n: (rs)'=0.
Eliminate s: L2_eff= -r²(n')²/2 ; (r²n')'=0.
```
This constrained mixed term, not two independent positive strain energies, yields the Newtonian exterior `n=-GM/(c²r)`, `s=2GM/(c²r)`. Negative static reduced field energy is not a dynamical ghost diagnosis; lapse is nondynamical in this calculation. **No SAT-derived action yet.**

With an **independently imposed** weak-field Newtonian matter source `-Jn`, `J=4πGρr²/c²`, the equation becomes `(r²n')'=J`. For uniform density and `q=2GM/(c²R*)`, `x=r/R*`: `n_in=-q(3-x²)/4`, `s_in=q x²`, `n_out=-q/(2x)`, `s_out=q/x`. Exact SymPy assertions passed for expansion, E-L, source and matching.

| q | GR center lapse | O(q) lapse | GR surface strain | O(q) strain |
|---|---:|---:|---:|---:|
| .02 | .98492424 | .98500000 | .02040816 | .02000000 |
| .40 | .66189500 | .70000000 | .66666667 | .40000000 |
| .80 | .17082039 | .40000000 | 4.00000000 | .80000000 |

## Exact independent-field stress gates
For any static spherical N,S, `8πr²ρ=[rS'+S(1+S)]/(1+S)²`, `8πr²p_r=[2rN'/N-S]/(1+S)` in geometrized units. Schwarzschild S alone with N=1 gives `8πr²p_r=-r_s/r` (unwanted tension). Schwarzschild N alone with S=0 gives `8πr²p_r=r_s/(r-r_s)` (unwanted pressure). Coupling is essential.

## Next / failure
Derive the mixed constraint from finite-core four-dimensional worldtube/timesheet mechanics **without inserting Einstein–Hilbert**; check propagating Hessian, degrees of freedom, stability and causal cone. Failure if only GR rewritten, or if time-dependent completion introduces unphysical extra scalar/ghost/superluminal modes.

Executable SymPy/numerical script, JSON and three Class P plots are in the corresponding conversation artifact bundle, not committed in this Markdown checkpoint. All q are benchmark choices, not historical constant targets.
