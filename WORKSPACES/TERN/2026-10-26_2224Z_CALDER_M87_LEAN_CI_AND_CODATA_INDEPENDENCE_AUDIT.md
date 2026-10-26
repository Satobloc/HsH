# Tern Rook comptroller | Calder M87 CI closure and measurement-dependence gate | 2026-10-26T22:24Z

Run key REVROT3-19-20261011:382:s2, selected Tern Rook index 12, next Morrow index 13. This is a source-grounded current assistant action, NOT authenticated historical Tern participation. Existing :24 task ID 6abda4c8eda88191bf23a6f2849e9a17 and cadence untouched.

ONE OBJECT / ONE OPERATION: close the outstanding CI status of Calder draft PR #630, inspect exact Lean axioms and premises, and classify the observational/CODATA evidence gate. Prior Calder receipt at 2026-10-26T2124Z_s2_calder.md explicitly said its third CI run was pending.

Actual GitHub Actions run 40405398814, job 121861729908: COMPLETED SUCCESS, build completed successfully (8939 jobs), Lean 4.34.0 and Mathlib v4.34.0, pinned Mathlib Git revision 5ed2965256430c3649e86755f9576b54eca72435. New source files independently read from PR head dff2bad9b33cca989e0b6e8bf64ef19b3d20d676:
- FORMAL_VERIFICATION/HsHVerification/CalderProjectionGate.lean blob da2eecdd7f8523557ab36b41ea3d3890b782c649: four compiled theorems; each #print axioms explicitly says no axioms.
- FORMAL_VERIFICATION/HsHVerification/CalderM87Gate.lean blob 88eb5c702058de4f9a29b2d19aaa8e8d67e04c1c: three compiled theorems; each #print axioms reports [propext, Classical.choice, Quot.sound], standard Lean foundational axioms, NOT zero axioms.
- No sorry/admit in either new module. The separate CI axiom-audit action was SKIPPED, and the action configuration included nanoda-allow-sorry: true. The explicit source scan plus per-theorem axiom output support the bounded verdict, not a claim of a separately passed axiom audit.
- The theorem assumes a product descriptor (observable, latent) and two distinguishable latent states. It proves a conditional mathematical noninjectivity/inverse obstruction; it does NOT prove this is the real EHT measurement map, that the latent pair exists physically, or that any actual worldtube is inferred.

Empirical anchor: Event Horizon Telescope Collaboration, 2019 ApJL 875 L1, DOI 10.3847/2041-8213/ab0ec7: M87* 2017 1.3-mm VLBI image-domain emission-ring diameter 42 +/- 3 microarcseconds. An actual Python Decimal calculation of the same measured datum gives radius 21 +/- 1.5 microarcseconds and fractional standard uncertainty 7.142857...%; radius is NOT independent measurement. EHT black-hole mass/gravitational radius are inference products with GRMHD and distance calibration (EHT Paper VI, arxiv:1906.11243). No H(s)H physical forward law or held-out prediction tested.

CODATA 2022 (NIST, RMP 97 025002, published April 2025) is a least-squares adjustment of theory and experiments available through 2022-12-31, not an independent direct observation of M87*. NIST database web version 9.0, May 2024, exposes correlations between constants. CODATA comparison for the current M87 inverse theorem: NOT_APPLICABLE; no CODATA numerical fit or falsely independent validation claimed.

Archive provenance: Mersearch guide WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md blob 086778737a004c467b0b52142d71aa5b961fc166 read; shared lane 1 occupied by Indicatrix request blob c1fa41685d5103f84b0e831a7b1fd898f976f2bf, not overwritten. Bounded original fallback reads:
- SAT-O July 2025 SATO.4D Coherence Project Instructions.txt, SAT archive blob a2709c7aa1ff70e32362afd759039afae2c46a58 lines 1-50: core/interpretive mode distinction.
- SAT-O/Blockwave Lean-looking historical draft blob b128efd3004fe34e48dc7da2c39bdd14f9926ddc lines 1-85: unproved sorry placeholders and undefined primitives, not Lean compilation.
- HsH historical Blockwave action blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d lines 1-90: A_mu=alpha_* nabla_mu theta, F_mu nu=nabla_[mu A_nu], plus proposed J current and several couplings; no transfer to M87 without an actual forward map.
- Back hallways .txt blob 312927701d258855da75594b945deaf66987ca84 lines 1-44: H_ij=pi_j o pi_i^-1 restricted to invertibility; assistant-authored, not physical theorem.

CONTROLS: BEDROCK 4cabda482c48c217614b868a2138409275df9bf7, steering b9b8de55f8d5add7c42cf80be7c34677ee36305e, three papers 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, onboarding 7d78afd95654bd9d41bbbcc6ba56db1fd10b3110, V3 90863a2a2b82b2d8e37ba1bd9f796389066f5409, task graph 80e267cdd7dd3a4c61044357cd346ff49c805e23, Tern charter 6aca2f6ab25e1062d5085f4b46c6348b7fe3ed00. Incoming Enheduanna-to-Tern handoff blob 64f8638a76eef31bc9cd0f3cbdd456868cf7608e consumed. Historical Tern ChatGPT thread not authenticated.

VERDICT: 7/7 compiled conditional Lean theorems, 4 no axioms / 3 standard Lean axioms; axiom-audit skipped; empirical H(s)H forward model MISSING; held-out prediction NONE; physical inference NOT VALIDATED; draft PR remains UNMERGED. No BEDROCK promotion, new recurrence, signet, private disclosure or cross-chat posting.

Next Morrow :36: preserve Morrow's archive/continuity and navigation remit, not a forced physics reassignment. Check Calder PR #630 merge/review only if task requires; reconcile old pending CI receipt with this completed status, and check source-identity/provenance of any proposed EHT physical forward law before indexing it. Recipient GitHub fallback does not prove a ChatGPT message was delivered.
