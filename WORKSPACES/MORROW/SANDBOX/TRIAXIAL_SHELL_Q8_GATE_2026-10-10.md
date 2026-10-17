# Morrow / Kestrel | Triaxial shell quaternion-holonomy gate | 2026-10-10
**Status:** SANDBOXED independent calculation, not SAT bedrock, Kerr derivation, Pauli proof or novelty claim.

## Sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`, lines 1–430, closer reread of lines 1–300: Nathan's straight-vacuum collapse, timesheet flexibility, sheath, chirality and black-hole/particle analogies. Assistant-generated formula/particle claims in composite text not adopted.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT WEIRD IDEAS — Solenoidbit.txt`, lines 1–420 (~18,336 returned characters): Nathan's nested electron-history solenoid and field-envelope conjecture; assistant overextensions excluded.
- `Satobloc/HsH/WORKSPACES/MORROW/SANDBOX/FRAME_TRANSPORT_NOTE_2026-10-10.md`, complete: prior SO(3)/SU(2) issue; current result adds *physical frame observability* test.
- Current `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, 9 Oct scope, current workflow/symbol/citation controls, Common Reference Desk and HSH_RESOURCES War Room/Tool Chest/index/toolkit/preference routing read. No banned sources accessed. Mersearch corpus-wide novelty search **not completed**.

## New LOCAL:Q8-SHELL test
Assume a **hypothetical physical** positive-definite rest-normal shell quadrupole `S(w)=R(w) diag(λ1,λ2,λ3) R(w)^T` on a straight SAT worldtube, with three *distinct* eigenvalues. This is not Kerr-derived. Its orientation space is `SO(3)/D2`, since half-turns about any principal axis leave the triaxial shape unchanged. Hence `π1(SO(3)/D2)=Q8={±1,±i,±j,±k}`, the quaternion group. Half-turn shell paths around x and y lift to `i` and `j`: `ij=k`, `ji=-k`, commutator `-1`. The physical shell returns to the same tensor at each half-turn's end. **This is conditional non-Abelian shell holonomy without core coiling or external carrier.**

For an **invented** gradient energy `E=(K/2)∫||S'||_F²dw` over length `L`, x and y half-turn costs are `E_x=Kπ²(λ2-λ3)²/L`, `E_y=Kπ²(λ1-λ3)²/L`. The closest repeated-eigenvalue tensor is exactly `d_deg=min(λ1-λ2,λ2-λ3)/√2` away in Frobenius norm. Under a *separate pointwise harmonic* penalty `(k/2)||S-S0||²`, degeneracy cost is `k[min gap]²/4`; **not** a complete field-defect barrier.

Synthetic test `λ=(1.44,1,0.64),L=4,K=k=1`: analytic `E_x=0.319775182595`, numeric `0.319775116850`; analytic `E_y=1.579136704174`, numeric `1.579136379508`; quaternion commutator exactly `-1`, shell endpoint closure residuals <`1.4e-16`; nearest degeneracy distance `0.254558441227`, harmonic local cost `0.0324`. Calculated using Python/NumPy/SciPy and precision Matplotlib plots in the task-thread package.

## Attack and failure gates
A round shell has no observable physical frame: assigning an arbitrary SO(3) rotation and obtaining an SU(2) minus sign is **gauge bookkeeping**, not spin. Axisymmetric shell orientation is `RP²` (if its axis is unoriented), `π1=Z2`, **not Q8**. Degeneracy permits the Q8 loop to escape; free endpoints also remove loop protection. Kerr-like stationary axial symmetry warns against assuming triaxiality. A shell Q8 sector would still not derive fermionic exchange antisymmetry or Pauli exclusion.

**Next:** derive rest-normal shell quadrupole from inherited SAT/timesheet or proposed ER/Kerr boundary; test whether eigenvalue gaps stay nonzero under a causal wavefront-local response. If noncommutative memory survives exact isotropy, it must have another carrier.

**Provenance:** primary SAT internal first; mathematical topology is a new sandbox deduction from a declared geometry, not external ontology import. No Schreiber/Hypothesis H material used.
