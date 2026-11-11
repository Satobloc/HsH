# Branch-preserving provenance negative control

This note records a source-verified example of why archived LLM conversations should retain their full directed message graph rather than being treated as a timestamp-sorted transcript.

Source: HsH archived conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, raw-export blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`.

The raw mapping contains 466 nodes and 465 message objects. The selected root-to-current ancestry contains 456 nodes including the root (455 messages). Ten messages are off-current: seven assistant and three tool messages, with no off-current user messages.

Three off-current branches each contain an assistant-to-bio summary, a bio-tool acknowledgement, and a later assistant-to-all response. In each case, the selected active assistant response to the same user parent predates the off-current summary by approximately 1.5 to 2.6 seconds. Therefore the later summary/tool-update branch cannot explain the already-recorded active response. The archive does not establish whether the later assistant leaf consumed the summary or whether any update persisted.

The active and off-current assistant messages in these branches carry the same historical model slug, `text-davinci-002-render-sha`, and belong to one conversation graph. They are sibling outputs, not independent agents or independent corroboration. Four off-current assistant-to-all leaves were already examined in Calder's branch-aware QC; this note adds the six upstream bio/tool nodes without duplicating that analysis.

Existing Lean theorem `CalderWitnessGraph.sibling_branches_defeat_single_successor` states the generic limitation: a single-successor function cannot preserve two distinct child edges from one parent. It compiled successfully in a merge-reference build in PR #707, Actions run #40924820531, 8,952 jobs; theorem-specific axiom output was empty. The build was not an exact-head standalone run, and the specific source edges/timestamps were not instantiated in Lean.

Methodological implication: preserve parent/child IDs, role, recipient, tool events, timestamps, model slug, and branch membership. Do not merge sibling assistant responses into a sequential dialogue or count branch multiplicity as agent independence.

Limits: this is one archived conversation, not a multi-agent experiment. No human session, model trial, memory-causality claim, consciousness/personhood claim, physical calculation, or theory validation is made.

Internal source-analysis supplement: `WORKSPACES/MERIDIAN/2026-11-11T0348Z_REVIEW_MIND_FIBRE_IDENTIFIABILITY_AND_LEAN_EVIDENCE_AUDIT_AMENDMENT_01.md`.