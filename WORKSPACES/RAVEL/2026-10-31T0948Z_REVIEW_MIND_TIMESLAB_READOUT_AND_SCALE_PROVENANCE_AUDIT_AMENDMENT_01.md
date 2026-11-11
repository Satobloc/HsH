# Amendment 01 — September 7 source-graph correction

**Applies to:** `2026-10-31T0948Z_REVIEW_MIND_TIMESLAB_READOUT_AND_SCALE_PROVENANCE_AUDIT.md`  
**Authority:** fresh parse of the role-bearing HsH raw snapshot; additive correction only.  
**Status:** VERIFIED AGAINST THE HsH RAW BLOB.

## Correction

Section 2.2 of the original report incorrectly identifies the assistant elaboration as `9e36cf0e-9d9d-43a4-95d9-8e6f05d5f8b1` and calls it the response “immediately following” Nathan's user message. That UUID is absent from the HsH raw snapshot.

The correct assistant-content node is:

- Message: `9e36cf0e-6d48-4eca-93df-e6e99600b516`
- Role: `assistant`
- Timestamp: `2026-09-07T10:06:45.368Z`
- Parent: `9661a842-1406-4cba-93c5-660996496830`

The exact HsH raw source was fetched and parsed from:

- Conversation: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- Git blob SHA-1: `c49367b0faa424491e7b3520a034b9e44fe6897f`
- Mapping nodes: 1,157
- Raw characters: 5,820,410

The complete parent chain is:

```text
496a15ea-0263-459d-b815-908f52155b90 (user)
  → 0e96c494-22a1-45e3-997a-ca2c71eb8abb (assistant node)
  → 28b86186-7a9a-41e8-b077-711681d2e418 (assistant node)
  → 9661a842-1406-4cba-93c5-660996496830 (assistant node)
  → 9e36cf0e-6d48-4eca-93df-e6e99600b516 (assistant content)
```

Therefore the assistant content is a **same-branch descendant, not a direct child**. The 32.526-second timestamp gap establishes chronology, not immediate reply ancestry.

The assistant descendant introduces `Σ_τ`, `ΔΣ_τ`, and the proposed `P(τ)=W∩Σ_τ) / `P(τ)=W∩ΔΣ_τ) readouts. These remain assistant reconstructions, not Nathan Direct equations.

## Snapshot boundary

The separate Library snapshot, previously identified by SHA-256 `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877`, is not byte-identical to the HsH Git blob and has a different conversation-graph snapshot. Do not merge its parent graph with the HsH snapshot or use it to overwrite this chain.

## Effect on prior conclusions

This amendment supersedes only the incorrect assistant UUID and the “immediately following” ancestry description. It does **not** alter the original report's dimensionality analysis, missing-map conclusion, physical status, or any SAT-O/Blockwave equation. No theory promotion is made.
