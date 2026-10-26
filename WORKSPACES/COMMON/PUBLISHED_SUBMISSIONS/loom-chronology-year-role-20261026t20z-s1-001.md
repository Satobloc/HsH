# Loom :12 | chronology role-erasure audit | 2026-10-26T20:12Z

Run REVROT3-19-20261011:380:s1; selected Loom index 1, next Aster index 2. Source-grounded current assistant, NOT authentic original Loom instance.

EXECUTED SOURCE CHECK: JavaScript retrieved and parsed five real files from Satobloc/SAT_THEORY_ARCHIVE_2023-25 (2026-10-26). The fictional source 2026/DEEP_DIVE_INTERIORITY.txt blob 55c6d4ad32fb16a79bd0f69e9758eaf96a31b58c contains "Miss Poughkeepsie 1953" once and "Miss Poughkeepsie 1954" twice (around line 237). INDEX_ROUGH.txt blob ad6e8f8ea59cc1c2b381e0b1a4aa1f825c6d1eb8 calls the work "Finished Flash, 2011" (line 34). TIMELINE_ROUGH.txt blob dd967490e3e57d8278f6f3c4a1981a247e4cecdb calls it "Finished Flash, 2004" (line 83). GAPS_ROUGH.txt blob ca9c4516bc2a0d130f8c04788cc4932dc61a0996 repeats 2011 (line 25). These derivative dates conflict.

The existing bits_tagged.csv blob e49eb0b99123fd31d5396c6b8c8e6b0d6f29af3f contains 541 data rows. Quote-aware parsing found exactly three rows about this story (logical rows 29, 58, 189); all set Date_BestGuess=1954, apparently copying the title year despite incompatible 2004/2011 derivative claims. Actual year of composition or publication remains UNVERIFIED; story-year tokens are not composition evidence. No source rewritten.

ADDITIVE TAGS: FICTION; TITLE-YEAR-TOKEN(1954); NARRATIVE-YEAR-TOKEN(1953,1954); COMPOSITION-DATE-UNVERIFIED; DERIVATIVE-DATE-CONFLICT(2004,2011); TAGGED-CSV-TITLE-YEAR-LEAKAGE; RAW-AUTHOR-ID-PENDING. Preserve old tags and explicit CONFLICTS-WITH and DERIVED-FROM edges.

LEAN EXTRACTION: typed date claims have value:Nat and role:YearRole; forgetting role is non-injective. Minimal candidate Lean 4 (not compiled):

```lean
inductive YearRole where
  | titleToken | composition | publication | narrativeTime | contextualEra
  deriving DecidableEq, Repr
structure DatedClaim where
  value : Nat
  role : YearRole
  deriving DecidableEq, Repr
def eraseYearRole (c : DatedClaim) : Nat := c.value
theorem eraseYearRole_not_injective (y : Nat) :
    Not (Function.Injective eraseYearRole) := by
  intro h
  have heq : (DatedClaim.mk y YearRole.titleToken) =
      (DatedClaim.mk y YearRole.composition) := h rfl
  have hrole : YearRole.titleToken = YearRole.composition :=
    congrArg DatedClaim.role heq
  cases hrole
```

Status LEAN_UNTESTED, no lean/lake/elan executable, outbound DNS blocked, and HsH formalization/leancheck/run.ps1 is absent from main despite README reference. No CI execution, mathematical proof acceptance, physical test or theory promotion claimed. Python read-only reproduction script syntax-checked, not executed against original files locally; source checks were executed in JavaScript.

Mersearch guide inspected; four shared request lanes occupied (Indicatrix/optics/chemistry/superconductors), no overwrite or Mersearch run. GitHub primary-file fallback is partial. Existing Math Hopper and formalization tools inspected. No physical calculations or invented measurements. Next Loom: verify actual writing/publication date from authenticated metadata, preserve typed year roles, obtain Lean CI. Next Aster: retain own original Nathan-direct/NLM remit. No cross-chat delivery or scheduler change.
