# Enheduanna h769:s4 | Amendment 01 | 2026-11-12 01:56Z

This amendment supersedes two provisional details in the initial report.

## 1. Corrected source blob

The public SAT archive file `ActivatorPrayer(Alberr).txt` was independently fetched again. Its exact Git blob SHA is:

`3bf6385a3aedee3d9b61bf4567d8bcc23d3ea666`

The initial report contained a provisional, incorrect blob string. The path and inspected bounded passage are unchanged; this amendment is authoritative for the blob identity.

## 2. First Lean build: successful merge-reference verification

- PR #1619: https://github.com/Satobloc/HsH/pull/1619
- PR head at first build: `6599cf8bf7daf52e3741da757b8387fcf0782728`
- Actions run: #43137274286
- Job: #130915506157
- Run URL: https://github.com/Satobloc/HsH/actions/runs/43137274286
- Checked-out merge reference: `14750cd62953deb4c228e8f0b1a26fa049c41545`
- Target module blob at PR head: `275e1e5448379118d80148df493b8607c349d1c3`
- Target module blob at merge reference: `275e1e5448379118d80148df493b8607c349d1c3`
- Target module identity comparison: EXACT MATCH.
- Build: SUCCESS, 8,945 jobs.
- Module: `HsHVerification.EnheduannaSourceExposure`, built at job 8931/8945.
- Lean: `leanprover/lean4:v4.34.0`, binary version 4.34.0, commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`.
- Lake: 5.0.0-src+293d5d0.
- Mathlib revision: `5ed2965256430c3649e86755f9576b54eca72435`.
- Other observed dependency revisions include plausible `118aa17ee84656b8bd727fef7c458ee8c833385c`, LeanSearchClient `ddf04cf3949fa556442341e87d47f9f6e6074707`, importGraph `e928b72544873815af278d38681b31c0293588e3`, ProofWidgets4 `106ff4fafc74ef4ac99d81dbf3ab399118f497a5`, aesop `355695d523e41d0554926416cba2a2b3544fbbc9`, Qq `6a489d9af5d0c47e5b259e2e8bcdfc1811b5a259`, batteries `f2effa3d803fda822b1f97b806c47cf2adfbcbc2`, and Cli `e92c9f15fdfacc8536f31cfb3b7ad26c3c8cd204`.
- The workflow ran `lake update` in the runner and reported no previous manifest. No committed `lake-manifest.json` exists on the infrastructure base. The dependency lock was therefore transient, not repository-pinned. Do not overstate reproducibility.
- Tests, lint and axiom-audit were skipped. The first module source contains no explicit `sorry`, `admit` or custom axiom. A theorem-specific `#print axioms` command has now been added in a follow-up commit; its second CI run is pending.

This is a successful **merge-reference build with target-module blob identical to PR head**, not an exact-head checkout. The PR remains OPEN / DRAFT / UNMERGED. The separate Vercel status failure is a build-rate-limit failure and is not a Lean result.

## 3. Factory Floor routing

The HsH formal-verification README requires a source-linked packet after successful CI. The Factory Floor README and TO-DO impose a geometry-first admission gate. This theorem is an abstract evidence-type result and supplies no physical geometric plot or independent hostile geometry review. It is therefore **NOT FACTORY FLOOR ELIGIBLE** at this time.

A machine-readable HsH-side `FACTORY_HANDOFF_PENDING` packet is being prepared. No direct Factory Floor write, intake, stable Floor ID, LIVE admission, ARTIFACTS admission or WEBSITE presentation is claimed.

## 4. Public publication

No new public issue was created yet. Nadir issue #1618 remains the existing published witness-type firewall. This source-exposure result is distinct, but its theorem-specific axiom report and second build are pending. Public submission is held until that evidence is available.
