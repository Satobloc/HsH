# Ravel addendum | exact-head coupling audit CI, Mersearch reconciliation, and scheduler snapshot

Date: 2026-10-31T22:15Z  
Nominal slot: `REVROT3-19-20261011:501:s1`  
Selected: Ravel (ring index 17); next: Orson Vay (index 18)  
Scheduler run ID: `44b2d59d-1ab0-8322-af94-7516667b3e7f`

**Purpose:** add evidence that arrived after the 21:42Z source-stratigraphy report. This is an amendment to the existing h501 Ravel work, not a second worker activation or replacement receipt.

## 1. Rotation and scheduler evidence

The nominal hour is determined from `scheduled_for=2026-10-31T21:12:00Z`, not the delayed execution start:

- (h=501)
- (5h+1=2506)
- (2506\bmod19=17), selecting Ravel; next index 18 is Orson Vay.

The existing 21:42Z report records this same run ID with `started_at=2026-10-31T21:42:31Z`. A later live scheduler readback records the **same run ID** and same scheduled time but `started_at=2026-10-31T22:12:17.759535Z`. The run remains `in_progress`, `completed_at=null`, `chat_ref=null`; its `latest_result` is still the prior Tern run `d6e9b6fb-7a60-832b-b800-02472d615ed3`.

Classify: `SAME_RUN_ID / START_TIME_SNAPSHOT_CONFLICT / ATTEMPT_ID_UNAVAILABLE`. Preserve both start-time observations. Do not infer a separate retry, duplicate attempt, worker liveness, or root cause. The scheduler exposes no attempt identifier.

The existing task remains:
- ID: `6aa61b3b2e4081918927a35b61007acc`
- Enabled: true
- Schedule: original hourly `:12`, `America/New_York`
- Prompt, identity, phase and recurrence: unchanged.

No task, schedule, prompt, recurrence, or scheduler state was edited. The current Ravel report and canonical receipt already exist, so no duplicate main receipt was created.

The next worker is Orson, whose h501 :24 occurrence already has a completed receipt. No late physics handoff or task was sent to him; his cognition remit and November 9 P1 remain protected.

## 2. Mersearch status reconciled from actual request-scoped outputs

No Mersearch execution function was exposed in this runtime. I reused and independently read existing Mersearch 1.0 manifests and compact receipts; ordinary GitHub retrieval was not represented as a new Mersearch run.

### Lane 1 — completed outputs present

Request: `nadir-so4-original-source-geometry-genealogy-20261031-1944`  
Manifest: `indexes/mersearch_requests/nadir-so4-original-source-geometry-genealogy-20261031-1944/RUN_MANIFEST.json`  
Receipt: `.../SEARCH_RECEIPT.md`  
Mersearch stable commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`  
Source commits: SAT archive `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`; HsH `1a9032b4fc3fb30171e66135e988a7ad0461b848`; HSH_RESOURCES `0e30ff7c4204eff61722cbadbcc1d0ed60621853`.

Receipt reports 16,074 files, 20,853,230 records, 40,815 hits, and 183 distinct paths across the three repositories. Raw results remain withheld.

### Lane 3 — completed outputs present

Request: `aldus-geometry-fidelity-wwrd-strand-20261031-1929`  
Manifest blob: `73f70814adda8e40e27ade4dd307eaabfb14f1ea`  
Receipt Markdown blob: `712de0f3c1ad03b183955347f3db2594a6722b29`  
Mersearch stable commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`  
Source commits: SAT archive `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`; HsH `9180c8eabbebc07a252358636651b9c72ff47a3f`; HSH_RESOURCES `0e30ff7c4204eff61722cbadbcc1d0ed60621853`.

Receipt reports 16,071 files, 20,852,969 records, 910 hits, and 181 distinct paths. Raw results remain withheld. The request JSON still says `status=requested`; the request-state field is trigger metadata, while the request-scoped manifest and receipt are the execution evidence. Do not overwrite or retrigger this lane.

### Lanes 2 and 4 — no completion outputs found

- Lane 2 optics request `archive-harvest-20261025-optics-01`: request remains present; no request-scoped manifest/receipt directory was found.
- Lane 4 SIM4 genealogy request `nadir-sim4-closure-original-source-genealogy-20261031-1950`: request remains present; no request-scoped manifest/receipt directory was found.

Thus lanes 1 and 3 have completed public-safe receipts; lanes 2 and 4 remain unreconciled/pending. No lane was overwritten, retriggered, or reassigned.

## 3. Exact-head Lean result for the existing Ravel PR #1133

PR #1133 remains **OPEN / DRAFT / UNMERGED**, stacked on the open Lean infrastructure base `infra/lean4-verification-20261023` at `61cc8b65ffed70296e0121dbae067892a79c81d4`.

Current PR head:
- Commit: `c606afa2d8405319f86a4a4d6bbb6e98e9e8e946`
- Target module blob: `2c99c7f425312efa093bfcbb534afd56ba8e1e3c`
- Root aggregator blob: `6dac0ef306bd968450c31968e1d00e28710574dd`

### Preserved failure and correction

Earlier merge-ref run #41246472518 compiled commit `828606bb779661cd45482d9eb133f1a9d1bf30da` and failed in the Lean library compilation step. Its target module blob `a6e46529760b57b8de2174d7a58564245bd7a76a` differs from the current PR-head module by one line: the old source used `div_eq_iff hT`; the corrected source uses `eq_div_iff hT` in the rearrangement of `ellF^3 = 2*A/T). The intervening commit `c606afa...` is explicitly titled “Correct right-hand division lemma in amplitude closure proof.”

A separate push-event run #41246991010 on the corrected head concluded failure but exposed **zero jobs**; no diagnostic was available. Preserve this failure without guessing its cause.

### Exact-head PR workflow success

PR-event run #41246994835:
- Event: `pull_request`
- Head SHA: exactly `c606afa2d8405319f86a4a4d6bbb6e98e9e8e946`
- Job: #124672375521
- Job conclusion: SUCCESS
- `Install Lean and compile formal library`: SUCCESS, completed 2026-10-31T22:14:28Z.

This is an actual exact-PR-head Lean library compilation, not the earlier merge-ref result. The full stdout/log and theorem-specific `#print axioms` output were not retrievable in this audit. Source inspection finds five theorem declarations, five `#print axioms` commands, and no `sorry`, `admit`, or declared `axiom` in the target module. A complete transitive assumption audit is **not** claimed.

Classification: `COMPILED_WITH_ASSUMPTIONS`. Do not upgrade to an unrestricted `LEAN_PROVED` label until the theorem-specific outputs/assumption audit are read. The PR remains draft and stacked; no merge or PR edit was made.

### What the five theorems actually say

Under the module's declared SI exponent assignments:
1. ((G/c^4)T_{\mu\nu}) has curvature units.
2. (ell_f^2 T_{\mu\nu}) has force units.
3. Under that same SI convention, (ell_f^2 T_{\mu\nu}) is not curvature-valued.
4. If the paper's (8\pi/T) and (8\pi\ell_f^2) are stipulated to be the same scalar, and (T\ne0), then (T\ell_f^2=1).
5. Adding (ell_f^3=2A/T) yields (A=\ell_f/2), under the same conditional identification.

These are dimensional-exponent and algebraic consequences of explicit assumptions. They do **not** establish that the source uses one (kappa) consistently, that a geometrized/rescaled stress tensor is absent, or that any coupling is physically correct. No physical prediction or empirical calculation follows.

## 4. Source-stratigraphy status carried forward

The controlling source report remains `WORKSPACES/RAVEL/2026-10-31T2142Z_BIG_PAPER_SOURCE_STRATIGRAPHY_AND_COUPLING_SCALE_AUDIT.md` (blob `e4744f1c598d85733f2c19c27c3eafff66643b46`).

The June 2025 Big Paper binary is located at `SAT_THEORY_ARCHIVE_2023-25/✅SAT BIG PAPER.pdf`, Git blob `caf5771a9d01b8505c23c07ac7cccca04fff49f5`. Its existing PyMuPDF extraction is 171 pages / 200,279 characters, extracted-text blob `69b0085c86f6c4876aacc0556243dd2fccdc0aef`. The recorded binary SHA-256 `77eb9e652c45650e29cd08be1a86198f05572573b452d170ce274e53bfde9f93` comes from the existing extraction header, **not** a fresh binary hash in this pass.

The source uses (kappa) in multiple roles: (8\pi/T) (p.19), (pi T\ell_f) (p.20), dimensionless (kappa\approx0.243(5)) in (sigma=\kappa T) (p.26), standard (8\pi G/c^4) (p.36), and revised (8\pi\ell_f^2) (p.134). The conditional same-scalar theorem is therefore an audit of a possible identification, not proof that the source intended it. The standard-SI dimensional mismatch remains until an explicit source-defined stress-energy normalization/map is recovered.

The J2 Blockwave action remains assistant-authored in its recovered conversation; the September 18 three-form *direction* is Nathan Direct, while the detailed J3 equation and asserted J2/J3 duality are assistant-generated. No source-defined support map or current conversion was recovered. No Hodge-duality equivalence is claimed.

## 5. Scope, paper gates, and next cursor

- No new physical calculation, fit, data-free numerical fixture, Lean theorem, PR, branch, or software was created.
- No BEDROCK or STATE_OF_THE_THEORY change; no theory promotion.
- Code Grurple remains ACTIVE.
- Orson cognition / November 9 P1 remains protected; no physics task or late handoff.
- P2 November 30 and P3 December 14 remain unchanged.
- FIE last full review October 27; 14-day rereview is not due.
- Ravel's last unrelated-reading cursor was `lx.txt`, lines 141–180; next cursor 181. This pass did not repeat that reading.

Next Ravel research cursor remains: recover a Nathan-direct or explicitly authorized geometry-to-current / physical response map, then freeze one real measured channel with provenance, units, calibration, uncertainty and covariance before any numerical comparison. No data-free calculation is authorized by this addendum.

**Publication:** `NOT_SUBMITTED_INTERNAL_ONLY`. No public issue submission, PR update, or paper-gate advancement.