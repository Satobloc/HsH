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
- `2026/SAT FULL_THEORY.pdf`
- `2026/SAT FULL_THEORY_Line.pdf`
- `SAT O Core Modules/*.pdf` and text modules
- `SAT 4D Theory Work/SAT4D_Covariant_Field_Equations.tex`
- `leanchecks/leancheck_draft_modules/*`
- other `CORE`, `KERNEL`, `BACKBONE`, and `FULL` artifacts listed by the archive
  structural index

These are ingestion candidates, not accepted equation sources. They must be
read sequentially and reconciled by chronology before equations are imported.

## Subsequently read completely

- `SAT O Derivations/CODE-LOCKED DERIVS.txt`, blob
  `783b05d39d59bf854b92090e15d205e6823b51c8`, lines 1–448.

Despite its title, the file is a mixed summary/derivation draft rather than an
executable lock record. Its classical uniform-tension dispersion is retained as
`EQ-0003` after repairing the overloaded inertial coefficient to a linear mass
density and separating arclength from time. Its quantum normalization is
inconsistent as written. Later sections contain unsupported or false bridges,
including pairwise linking for Borromean rings, nontrivial `pi_1(S3)` and
`pi_2(S3)`, Lorentzian signature by inversion of a positive covariance, and a
dimensionally invalid gauge-coupling density. Those claims are not imported.
