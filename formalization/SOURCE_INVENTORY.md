# Equation-Dump and Formalization Ancestors

Structural traversal covered all 3,937 paths in archive tree
`81509f68ab1ca613aa079ed3946b63928aa6f099` without API truncation.

## Read fully in the initial pipeline-design pass

- `PYTHON Math Locking (SAT.O)/..folder_summary.txt`
- `PYTHON Math Locking (SAT.O)/MASTER_CONTROL.py`
- `LEAN CHECK_drafts/FULL_THEORY_LEANCHECK_draft.txt`
- `SAT Mark V/SAT_Symbolic_Kernel.txt`
- `SAT O Derivations/SAT_DERIVATIONS_INDEX.txt`
- `SAT 4D Theory Work/SAT4D_DERIVATIONS_MASTER.tex`
- `SAT 4D Theory Work/SAT_CORE_CODE.tex`
- `lean_test.py`

The SAT.O structure-lock architecture is worth retaining:

`module source -> fixed symbolic objects -> derivations -> checks -> synthesis`.

Its old implementation is not a sufficient checker. `MASTER_CONTROL.py` hashes
an existing Lean file and writes `Status: VERIFIED` without invoking Lean; its
dependency resolver is a stub. The Lean draft is mostly placeholder declarations
and includes displaced lattice, `Z3`, and direct `Q -> mass` assumptions. The
SAT4D structure locks freeze definitions in SymPy but do not establish their
domains, provenance, or applicability to current H(s)H.

## Located structurally; not yet read completely

- `2026/SAT MATH — BACKBONE.txt` (234,527 bytes)
- `SAT O Derivations/CODE-LOCKED DERIVS.txt` (17,810 bytes)
- `2026/SAT FULL_THEORY.pdf`
- `2026/SAT FULL_THEORY_Line.pdf`
- `SAT O Core Modules/*.pdf` and text modules
- `SAT 4D Theory Work/SAT4D_Covariant_Field_Equations.tex`
- `leanchecks/leancheck_draft_modules/*`
- other `CORE`, `KERNEL`, `BACKBONE`, and `FULL` artifacts listed by the archive
  structural index

These are ingestion candidates, not accepted equation sources. They must be
read sequentially and reconciled by chronology before equations are imported.

