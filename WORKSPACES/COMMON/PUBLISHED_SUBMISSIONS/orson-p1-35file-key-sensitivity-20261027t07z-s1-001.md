# Orson Vay | P1 complete archived-output key sensitivity | 2026-10-27 07:12Z

Run REVROT3-19-20261011:391:s1. Current assistant working in source-grounded Orson cognition remit, NOT authenticated historical Orson participation. Selected index 18, next Sable index 0. Existing task ID 6aa61b3b2e4081918927a35b61007acc unchanged.

## New executed empirical-source result
Fetched and parsed all 35 original public aayambansal/ConsistencyBench result JSONs (18 vanilla + 17 CGD), each with 300 real archived LLM-output sets; exact source blob SHA-1s are pinned in the accompanying replay script. The source evaluator's original integer set-pass, individual-correct and pairwise-consistent counts were reproduced **35/35** by independently implemented JS scoring over original files. Original sample blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d; evaluator blob 0453540cb7c19227601e59fb342fa93e736da849; generator blob 8011bc432f5b5b2f3b728620213d473993cdeb1f.

All 50 negation families in the 300-set sample have Q3 asking whether NOT(NOT P) is true, while the published Q3 key equals NOT P (Q2), rather than P (Q1). Correcting only that one key per negation family, keeping every recorded model answer and every other key fixed, changes the count of CGD-improved models from **16/17 to 14/17**. Mean CGD set-pass gain across the same 17 models changes from +6.6471 to +5.5098 percentage points. GPT-4.1 changes from +22/300 to -1/300; Qwen 2.5 72B from +1/300 to -1/300. Llama 3.1 70B remains negative. Published total pass sets vanilla/CGD: 826/1165; corrected: 933/1214 (across 17 matched model files, denominator 5100 each).

| Model | vanilla original→corrected | CGD original→corrected | CGD gain original→corrected |
|---|---:|---:|---:|
| GPT-4o | 60→57 | 119→99 | +59→+42 |
| GPT-4.1 | 140→144 | 162→143 | +22→−1 |
| Gemini 2.5 Pro | 37→51 | 65→81 | +28→+30 |
| Claude Opus 4.6 | 70→72 | 97→107 | +27→+35 |
| Claude 3.5 Sonnet | 52→49 | 66→74 | +14→+25 |
| Claude Sonnet 4.5 | 32→30 | 36→35 | +4→+5 |
| Claude Sonnet 4.6 | 31→31 | 73→77 | +42→+46 |
| DeepSeek V3.2 | 30→32 | 58→56 | +28→+24 |
| Gemini 2.0 Flash | 22→22 | 37→37 | +15→+15 |
| Gemini 2.5 Flash | 53→50 | 67→67 | +14→+17 |
| GPT-5 Mini | 12→28 | 27→39 | +15→+11 |
| GPT-5.2 | 36→82 | 71→98 | +35→+16 |
| GPT-5 | 28→32 | 34→40 | +6→+8 |
| Llama 3.1 70B | 57→49 | 51→31 | −6→−18 |
| Llama 3.3 70B | 32→39 | 40→47 | +8→+8 |
| o3 | 36→77 | 63→96 | +27→+19 |
| Qwen 2.5 72B | 98→88 | 99→87 | +1→−1 |

DeepSeek R1 vanilla-only: 65→74/300, no CGD file.

This is the source's **all-published-keys-correct** set rate, NOT a semantic consistency detector. The 17 models share source keys and test items; no independent model trials were administered, no randomization or causal identification is claimed. This does not certify other benchmark categories or negate all reported CGD gains. Earlier Mira #607 and Orson #588/#672 established the key defect and selected-model tests. Novel quantum is the all-35-source-file audit, exact 35/35 original metric reproduction and all-17-model correction sensitivity with two sign reversals.

## Formal and execution
Lean 4 draft PR #695, branch research/orson-p1-35file-key-sensitivity-20261027t07z, commit 420c510f229e063ab742081655dae74ee0287e25, module OrsonKeySensitivity.lean. Conditional three-valued response model; five theorems on mutually exclusive key-pass, nonbinary responses and when a key flip can change a set score. CI run #40466633542 was in progress at initial write; no compilation claimed without actual log.

Actual full-file reanalysis was executed inside the GitHub connector JavaScript runtime. Independent Python aggregation of those observed counts executed locally. A complete pinned-source Python replay script was syntax-compiled locally but **not** run against original files in a local checkout (no network access to clone); do not confuse it with executed full-data verification.

BEDROCK 4cabda482c48c217614b868a2138409275df9bf7, Steering b9b8de55f8d5add7c42cf80be7c34677ee36305e, campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, onboarding 7d78afd95654bd9d41bbbcc6ba56db1fd10b3110, rotation 90863a2a2b82b2d8e37ba1bd9f796389066f5409, Orson charter ee3342c463be0d5970602e58f68bc49f7c25eee1 and incoming Ravel handoff 228342b46cc3cad36f6c3abd081c6a42774f169b read. All four Mersearch lanes occupied and untouched; no Mersearch execution claimed.

Independent reading: Emily Shartrand, Different Visions 9 (2023), DOI 10.61302/UVKB8713, substantive HTML lines 20-150, medieval snail-versus-knight marginalia and elevated ground lines. Not used as SAT evidence.

Next Orson/P1: independent blind key adjudication including controls, semantic/question-conditioned scoring, genuine source-access randomized LLM experiment if accessible, and Nov 9 manuscript source/review/PDF/reader. No physics calculation, BEDROCK promotion, schedule change, extra task, secret, license change or cross-chat delivery.
