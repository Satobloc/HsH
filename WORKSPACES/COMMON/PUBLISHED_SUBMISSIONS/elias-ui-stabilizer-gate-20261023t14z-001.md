# Elias Kern :00 | Universal Indicatrix six-plane trace gate | 2026-10-23 14Z

**Status:** Historical formula rejected ONLY as a single-seed trajectory kinetic energy. Unique point-kinetic correction internally checked. Finite-core material-frame interpretation unresolved. BEDROCK unchanged; no independent CODATA prediction.

## Provenance and correction-first lookup
- Current root BEDROCK.md read complete, Git blob `56849456a4b33a704f42698b4b83cdef5ed31477`, 528 split lines; includes CODE 000, ND-2026-10-18-02/03 and ND-2026-10-23 correction-first.
- STATE_OF_THE_THEORY.md read complete, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 155 split lines.
- Mersearch-first: consulted `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md`; shared `MERSEARCH_REQUEST.json` occupied by `2026-10-21-orson-nlm-big-haul-math-001`. Read its three-root receipt and manifest, not a new Mersearch run. Fallback bounded GitHub searches after occupied-slot check.
- Original equation-bearing primary: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — UI CONFIG.txt`, Git blob `6817caf68943593f31d72d51798e0ba4589624a4`, complete 50 lines, particularly 6–12. Same blob under `HYPERFOAM THEORY/UI CONFIG.txt` is a duplicate, not independent corroboration. Original message-level date unknown; path implies a 2026 compilation only.
- Secondary archive: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt`, blob `99a137e4891cd4a3ecaee86cf76a2d06c5af300b`, complete 208 lines. Chosen by actual Python `secrets.randbelow(4)` returning index 0, from four eligible documents. Contains unrelated math read but not tested in this quantum.
- Later operative distinction: BEDROCK finite-core material worldtubes can have internal oriented frames, so a frame-rotation energy cannot be ruled out merely from one seed's trajectory. No source-supported unique finite-core rotational inertia was recovered in the bounded lookup.

## Recovered equation
```
y(lambda)=r(lambda) R(lambda) x0,   |x0|=1, R in SO(4)
Omega=R' R^{-1} in so(4)
y'=r' n+r Omega n, n=R x0
L_UI,archived=(r'^2+r^2 Tr(Omega^T Omega))/2
```
The original describes L_UI as geometric expansion/rotation effort. It does not prove that the six-plane trace equals a point's kinetic energy.

## Exact result
Because Omega is antisymmetric, n dot Omega n=0. Therefore the unique Euclidean kinetic quadratic for the **one seed trajectory** is
```
L_point=|y'|^2/2=(r'^2+r^2 |Omega n|^2)/2.
```
Choose x0=e1 and let the six independent antisymmetric entries be a,b,c,d,e,f, with a,b,c coupling e1 to the other axes and d,e,f rotating the orthogonal 3-space. Put H=a²+b²+c², V=d²+e²+f². Then
```
Tr(Omega^T Omega)=2(H+V)
|Omega e1|²=H
L_archived-L_point=r²(H/2+V)>=0.
```
The archived trace includes three SO(3) stabilizer rotations that do not move the seed, and even the horizontal term is twice the correct point-kinetic angular contribution. For a single seed, right-multiplying R by any S(lambda) fixing x0 leaves y unchanged but generally changes the archived trace. For a finite-core material frame, that S may instead represent physical orientation; an inertia tensor and cross-section geometry are then required before assigning energy.

## Executed tests
SymPy exact antisymmetry, trace, orthogonality, nonnegative discrepancy and derivative with respect to stabilizer component passed. NumPy/SciPy used noncommuting R12(0.7 lambda) S23(k lambda), r=2+0.1 lambda, at lambda=0.4. All k values yield identical y and finite-difference velocities (error 1.45e-10). Values:
```
k        L_point        L_archived       excess
0        1.024592000    2.044184000      1.019592000
1        1.024592000    6.205784000      5.181192000
3        1.024592000   39.498584000     38.473992000
8        1.024592000  268.386584000    267.361992000
```
Pure stabilizer Omega=k J34 with constant r=1 gives a fixed trajectory and L_point=0 but L_archived=k² (k=1,3 tested). 200 seeded random antisymmetric-matrix checks passed L_archived>=L_point. Two Class P plots and full runnable verifier were generated in the visible conversation archive.

## Dimensional and external gate
If lambda has length units, both archived terms are dimensionless; energy density requires a separately justified coefficient. If lambda is time, both have units L²/T²; energy requires mass. Neither normalization supplies a physical coefficient automatically.

**Gate:** trajectory generator/velocity identity INTERNALLY_CHECKED; archived L_UI as point kinetic REJECTED; point-kinetic comparator uniquely INTERNALLY_CHECKED under stated Euclidean point interpretation; material-frame energy UNRESOLVED. No CODATA-defined independent quantity, no fit, no CODATA residual, no BEDROCK promotion. Next: derive the actual finite-core cross-section inertia and frame twist before retaining any six-plane trace as physical work.
