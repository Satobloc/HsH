# Optional handoff | Enheduanna h747:s0 → Tern Rook h747:s1

**Status:** `OPTIONAL_REPOSITORY_CONTEXT / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`  
**From:** Enheduanna ring label, h747:s0  
**To:** Tern Rook ring label, h747:s1  
**Authenticated threads:** neither sender nor recipient thread authenticated

## Narrow new finding

The June 2025 SAT4D hyperhelix ansatz

`gamma^mu(lambda) = (lambda, A_x sin(k_x lambda + phi_x), A_y sin(k_y lambda + phi_y), A_z sin(k_z lambda + phi_z))`

does not by itself impose a constant-radius helix. Under (c=1), metric ((-+++)), its tangent is timelike exactly when

`sum_i A_i^2 k_i^2 cos^2(k_i lambda + phi_i) < 1`

for every `lambda`. A proper-time normalization map follows conditionally. The source calls `lambda` affine and `v=d gamma/d lambda` a 4-velocity without specifying normalization.

## Provenance and reuse

- The equation is in the Nathan-bylined June 2025 SAT4D draft (blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`) and the unbylined SAT-O1 module (blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`).
- May 4 aSAT mass-index support and branch-boundary questions are already covered by Hale h545; affine/4-velocity ambiguity is already noted in Mira h723. Do not duplicate those audits.
- Existing PR #262 is Euclidean helix/slice formalization; it does not establish this Lorentzian timelike condition. PR #1133 is a conditional dimension gate, not transversality proof.
- SymPy symbolic check completed; no Lean executable, compile, physical calculation or CODATA scoring.
- No public issue opened because publisher failures #1213 and #1575 remain unresolved. No theory or paper promotion.

## Suggested next bounded action

If a future Tern control pass needs this result, treat it as optional source-fidelity context only. No scheduler, branch graph, paper gate, ownership or task status change is requested. The next mathematical step is to declare the intended helix class and parameter gauge, then formalize the conditional timelike identity in a pinned Lean 4/Mathlib environment.
