# BF cup-product source variants | archival type/provenance audit

**Status:** INTERNAL SOURCE-CUSTODY ADDENDUM / NOT PUBLIC / NOT BEDROCK / NO THEORY PROMOTION  
**Postcheck:** 2026-11-07T23:54Z, same logical ring selection `REVROT3-19-20261011:671:s2` (Morrow label, next Kestrel). This is not an authenticated Morrow thread.  
**Purpose:** clarify historical `B\cup\delta A` degree assignments without selecting a canonical equation or repairing any source.

## 1. Read boundary and live snapshots

- HsH `main` at source read: `4bb4a3cb42d922eec4ed9c581315b61ebf1e948b`.
- SAT archive `main` at source read: `521952bbe6ad078f9462b83cf7d7387a1630d993`.
- HSH_RESOURCES `main` at source read: `f2e0792d1f024c2fe0fe8ea3a1eb60a742157a32`; only its onboarding/front-door material was consulted, not used as a source for this note.
- No source under `QUARANTINE` or `PRIOR_ART` was read.

## 2. Mark IV.2 kernel: exact source remains under-typed

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SAT_Symbolic_Kernel.txt`, Git blob `446c3000aaa102a11cee17225c35c3925044e524`, 2,090 characters. No author or composition date is stated in the file.

The displayed MARK IV.2 terms are preserved verbatim:

```text
  + (3/2π) ∫ B ∪ δA
  + ζ ∫ A ∪ dθ₄
```

The same file says `τ sector lives in H¹(M, ℤ₃)`, `δA = 0`, and `Q_τ(γ) = ∫_γ A` for loops. This supports reading `A` as degree 1, but the file does not declare the degree of `B`, the chain/manifold over which either displayed integral is paired, or a complementary factor for `A∪dθ₄`.

No corrected equation is proposed. The source text is not silently replaced by a later assistant variant.

## 3. Historical B-degree variants recovered

### A. Explicit 1+1D assistant variant: B is degree 0

Raw conversation: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_2/25.05.20•25.05.20•SAT Math Engine Tasks — raw.json`, blob `b276dadd48f3dc27588c5bcaf428f0d1e6245074`, conversation `682d35a6-f2f4-8003-90b3-f3139d954123`.

- Exact message: `565a6b77-ec4c-4319-a20e-0c5355d6027d`.
- Outer role: **assistant**.
- Timestamp: **2025-05-21T02:14:05.559Z**.
- The assistant explicitly frames the construction as a **1+1D** minimal context and states `A` is a ℤ₃ 1-cochain and `B` is a ℤ₃ 0-cochain.

Verbatim displayed action from that assistant message:

```text
S_τ = (3 / 2π) ∫ B ∪ δA
A: ℤ₃ 1-cochain
B: ℤ₃ 0-cochain
```

The matching transcript `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Mathematical Core.txt` has blob `f72c508e43a0fc02fef4d7dc3a021b1f3735997c`. This is assistant-authored historical work, not a Nathan Direct equation.

### B. 4D-oriented assistant transcript variant: B is degree 2

`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STATE OF SAT.txt`, blob `b6200e6d033cd9a55c3b8a7dd3e411e639c6fbbd`, contains a transcript section that introduces `B` as ℤ₃-valued dual variables on faces / a 2-cochain. The transcript has explicit `You said:` and `ChatGPT said:` markers; the B assignment occurs in assistant text. No exact raw message UUID or original composition timestamp was recovered from this text file.

Related derivative:
- `SATx CANONICAL.txt`, blob `afbf610347a6a39c74cf52cbe3818ef22ab3ebcf`, states `A∈C¹(M,ℤ₃)` and describes `B` as a 2-cochain in its BF-style continuum summary.
- `SATx STATE OF SAT.txt`, blob `512836a86f036df49338ea774477f241e4f05580`, is a separate transcript copy.
- `Thread2todate.txt`, blob `ad9a20cc5ed99a0a4a63957eb777534cae2f3413`, and `text 27.txt` contain the assistant-authored “SUBTHREAD 2B” response with `B∈C²(M,ℤ₃)`. Their exact raw JSON message ancestry was not recovered.

These are assistant/transcript or synthesis witnesses, not direct Nathan-authored field assignments and not independent corroborations.

### C. Blockwave OUTFILL variant: B is degree 0, domain unspecified

Source: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, Git blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, 908 lines / 38,517 characters. The file's internal title is “BLOCKWAVE OUTFILL”; it has no authenticated author or composition date. Repository ingestion was 2026-10-08T02:42:49Z, which is not a composition date.

Verbatim local statement:

```text
S_BF = (3/2π) ∫ B ∪ δA
A: ℤ₃ 1-cochain (τ gauge field)
B: ℤ₃ 0-cochain (Lagrange multiplier)
```

The larger document describes a 4D Lorentzian `(u^μ, θ)` core, but the BF term itself does not state its integration domain. The associated 2025-10-19 “Blockwave UV Completeness” raw export (conversation `68f4de5b-27c4-832d-b7bc-6075744c81c6`, blob `c66c7f57defafcbc2d65b8be3f858ff91e0b8abf`) exposes the file through a `file_search` tool `tether_quote` node `bbf4e276-e400-44cb-963a-c24fa9b8c573`; that tool result is retrieval, not the file's authoring event. The April 2 Chronostructure NotebookLM export repeats the OUTFILL content and is not an independent witness.

## 4. Conditional degree ledger (not a Lean proof)

For a cochain `A∈C¹`, its coboundary has degree 2. If `B∈Cᵖ`, then the cup product `B∪δA` has degree `p+2`.

- On a 2D integration domain, `p=0` gives a top-degree 2-cochain. The May 2025 1+1D assistant variant is therefore dimensionally compatible with its stated context.
- On a 4D integration domain, `p=2` gives a top-degree 4-cochain. The transcript's 2-cochain variant is dimensionally compatible with a 4D BF pairing, conditional on that domain and the usual chain/cochain conventions.
- The OUTFILL's 4D surrounding document plus degree-0 `B` is **under-specified**, not conclusively invalid, because the BF integration domain is not declared.
- The Mark IV.2 kernel itself leaves `B` untyped, so neither later assignment may be imported as canonical.
- If `A` is degree 1 and `dθ₄` degree 1, `A∪dθ₄` has degree 2. A 4D top-degree integral would need a specified complementary degree-2 factor/pairing or a lower-dimensional integration domain. Neither is supplied in the Mark IV.2 file.

This is conditional source-level type bookkeeping. It is not an independent physical calculation, a Lean-verified theorem, or a corrected SAT/Blockwave equation.

## 5. Existing formalization checked; no new Lean work

Existing PR #1098, SableCurrentSupportDegreeGate:
- exact head `d2839a9454f16a2ad7661544d9d0c12b664e55c5`;
- Lean workflow run #41328086467, job #124912162960;
- 2026-11-01, workflow and “Install Lean and compile formal library” step concluded SUCCESS.

That existing module covers conditional support/Poincaré-dual degree bookkeeping. It does **not** formalize the cup-product typing above, identify `B`, or establish the source-to-formalization translation. No new Lean file, build, branch or PR was created. Morrow's direct 2026-09-13 theory stop remains controlling; the trial permits source comparison and mathematical/equation checking but does not lift theory integration, physical-prediction or paper restrictions. The general proof-first rule is recorded as a gap to route to an authorized formalization lane, not used to bypass Morrow's boundary.

Math Hopper remains extraction-only; its documentation explicitly separates captured/syntactically screened expressions from Lean-accepted theorems. No new tool was built.

## 6. Mersearch, publication and epistemic status

The completed request `aldus-o9-blockwave-equation-genealogy-20261031-1124` was reused only as prior navigation:
- workflow #41198219023; manifest blob `a21496b7ffc5852b3595c87193c942882609eb57`;
- compact receipt blob `527105797e13425c0ac9b45c64b7386735da9894`;
- source snapshots: SAT archive `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`, HsH `e327487a8b20a56fae5f4c93a6a94b3bbfc8dedb`, HSH_RESOURCES `87289c92068c134e84a70e6a2f18807247b4a36c`;
- 15,945 files / 20,843,011 records / 37,290 hits / 294 paths. The query was path/name dominated; QUARANTINE and PRIOR_ART were excluded; raw results were withheld. It is not an author-only source set or proof of first origin.

All four current Mersearch lanes were re-read and remain occupied/requested. No new request or overwrite occurred. The direct GitHub file/message retrieval above is a bounded fallback, not a new Mersearch result or exhaustive three-repository census.

The already-published public crosswalk remains issue #1465 / artifact `morrow-sat-o6-blockwave-variant-crosswalk-20261107t2327z-s2-001`. This new variant note is internal only: no new public issue was opened because the B-degree variants remain source/role-qualified and no canonical assignment is established.

## 7. Disposition

- Preserve the Mark IV.2 source terms verbatim and keep the 1+1D, 4D-transcript and OUTFILL variants separate.
- Do not call the B assignments a Nathan Direct contradiction; the recovered variants are assistant/transcript or unattributed material in different dimensional contexts.
- Do not select a canonical `B` degree, repair either action, promote the Mark IV.2 kernel, or alter BEDROCK.
- No measured system, dataset, units, uncertainty budget, CODATA comparison, physical calculation, fit, prediction, P2 advancement or paper work occurred.
- Next source operation, when a shared Mersearch lane is genuinely released: recover the original raw message ancestry behind the 4D transcript and OUTFILL file, preserving speaker role and integration domain. Until then, the type assignment remains unadjudicated.

The unrelated reading break continued in `SAT Mark V/TheTANGLE.txt`, lines 2021–2060; next cursor 2061. FIE full rereview is due 2026-11-10, not yet due.
