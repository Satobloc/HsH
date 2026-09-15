# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Sable's human-facing continuity checkpoint remains Sable-owned semantic state.

## Current run finding

Cross-repo source-inventory state currently visible on `Satobloc/HSH_RESOURCES` `main` does **not** match the newer inventory state recorded in Sable's continuity checkpoint.

Direct read of `SOURCE_INVENTORY/SABLE/source_inventory_run/summary.json` currently reports:
- tool `sable-source-inventory/0.2.1`;
- 8,682 permitted files;
- sample count 706;
- GLASS 4,496 / HSH 1,328 / RESOURCES 2,858;
- 1 PRIOR_ART root pruned before descent;
- source commits GLASS `c84ce6d78561d0ef07d029d66b13a38dcb3b484b`, HSH `f7636969bb508c846eff920de89a0b3dccd24d84`, RESOURCES `4f6b728bfeebf371040f121840c9970a2242641e`;
- inventory SHA-256 `64cb92192efe6f6bcf66bda69e989411b4744d285b3daa421afb442640e1fa6e`.

Sable's current `CONTINUITY_CHECKPOINT.md` instead records a confirmed state of tool `0.3.0`, 8,672 files, 704 sample files, GLASS 4,617 / HSH 1,743 / RESOURCES 2,312, and inventory SHA-256 `11db80b06e1cc26fa720b0dcf53f511f85373a6ef521f39e3c7fd10869f28433`.

Additionally, `SOURCE_INVENTORY/SABLE/source_inventory_run/input_refs.json`, which Sable's checkpoint says is part of the preferred current substrate, returns 404 on HSH_RESOURCES `main` at this run.

## Interpretation / QA disposition

This is a **generated-state / continuity mismatch**, not evidence of corruption. Do not overwrite either state speculatively. Possible explanations include a later generated run not present on current `main`, rollback/reversion, branch/ref mismatch, or continuity having recorded a transient/unpublished state.

The earlier conversation-upload regression is separately recorded by Sable as repaired and end-to-end converged; current autotag, Nathan Direct, and Stage-2 manifests agree on 73,200 input records / 22,758 user records / 15,133 packaged unique user messages. Do not reopen that regression merely because the cross-repo inventory is mismatched.

## Next high-information operation

1. Inspect HSH_RESOURCES commit history for `SOURCE_INVENTORY/SABLE/source_inventory_run/summary.json` and the source-inventory workflow to determine whether the 0.3.0 state was ever committed and later replaced/reverted, or was never published.
2. Inspect workflow/run provenance and current workflow version before changing generated state.
3. Reconcile Sable's continuity only after repository provenance is established.
4. Keep this automation's findings in this automation-owned checkpoint/handoff; do not race Sable's semantic checkpoint.

## Boundaries

No PRIOR_ART content was opened, listed, hashed, sampled, or exposed. No theory-bearing work was promoted. No Nathan decision is currently required.
