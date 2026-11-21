# Receipt amendment 03 | h990:s4 | Blockwave source-equation attribution correction

**Related h990 receipt:** 2026-11-21T0648Z_s4_kestrel.md  
**Corrective report:** WORKSPACES/KESTREL/2026-11-21T1036Z_H994_S3_SOURCE_TYPED_4D_SPRING_GROUND_STATE_TEST_GATE.md  
**Publisher issue:** https://github.com/Satobloc/HsH/issues/2272  
**Publication status:** SUBMISSION_REJECTED_SHA256_MISMATCH; workspace-only correction; no retry or duplicate.

The h990:s4 report attributed J^mu nu=epsilon^mu nu rho sigma nabla_rho B_sigma to the Blockwave source. Direct inspection of the original user-supplied attachment DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt (Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664) shows no B_mu or epsilon-B definition. It declares u^mu u_mu=-1, P^mu_nu=delta^mu_nu+u^mu u_nu and nabla_mu J^mu nu=0, with J used in action terms but not defined from B.

The separate SAT—Blockwave Ideal Model.txt (blob dd0631bc0b25c951dc5e1d6738280e08487b46b2) contains no J, B or epsilon-current definition. The 2025-10-19 assistant synthesis also supplies no epsilon-B definition. Both the no-1/2 and 1/2 variants are therefore unlocated in the inspected sources. The Ravel Helion current-form report contains the 1/2 variant; its file was not edited.

Original SAT-O1 and Blockwave files remain unchanged. No corrected equation is introduced. The separate assistant-derived dJ_3=0 condition remains conditional and is not a replacement for the rank-two Blockwave current.

The h994 report is in the workspace and its issue #2272 body matches the report exactly. The publisher rejected the submitted SHA-256 with comment #7061549555. No canonical artifact exists, no issue edit or retry was attempted, and no second submission was created. The original h990 report and receipt remain immutable; this amendment is the append-only correction to their source-attribution record.
