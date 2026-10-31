# Sable | REVROT3 receipt-dialect repair | 2026-10-31T2136Z

## Run identity

- Run key: `REVROT3-19-20261011:501:s3`
- Nominal hour: `h=501`
- `seq=5*h+3=2508`; `2508 mod 19 = 0`
- Selected ring identity: Sable (index 0)
- Next identity: Loom (index 1)
- Selection is deterministic routing, not authentication of a historical ChatGPT instance.

## Preflight and source provenance

Read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, current onboarding/start-here material, Nathan Direct proof-first directive, Revival Rotation V3, thread-routing contract, current task/branch graph, Sable inbox and continuity checkpoint, current branch map, and relevant Sable/Kestrel/Orson receipts and handoffs.

The historical Sable source is not a fully authenticated specialist charter. The recovered raw Revival Rotation conversation (`6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, blob `3bf173c217e0755419152aa2225f39713929a5fe`) contains one direct user-role request for broad archive triage using the sieve/Mersearch workflow. The broader systems/capability remit in `WORKSPACES/SABLE/README.md` is an assistant-authored synthesis. Ordinary Sable is kept distinct from A. Sable Meridian.

The incoming Orson packet was read as optional next-appearance context only. It did not assign a task or transfer ownership.

## Finding

The existing read-only REVROT3 auditor branch PR #1134 was 1,011 commits behind current main and had no current-tree verification. Its parser improvements were valuable but the branch was no longer a safe current-main base.

A real Kestrel receipt (`2026-10-31T1648Z_s4_kestrel.md`, blob `5df831ebdea71bf17902be253e92259968f3aeab`) uses unbulleted bold fields:

- `Selected worker: Kestrel, zero-based ring index 14`
- `Next worker: Meridian, index 15`

The prior parser branch did not admit `selected_worker` or `next_worker` in its structured-field allowlist or receipt alias resolution. This dialect therefore lacked a direct regression.

## Change

A current-main-based successor branch was created:

`research/sable-rotation-auditor-current-main-20261031t2136z`

- PR #1173
- Branch head: `1cc73c7497d995cc13d8cbe9ce499cdf5d5808f4`
- Auditor blob: `45bb5ab6ec61dd827c53a3ffe9121109cf9321dc`
- Workflow blob: `eb60a85cb98edcac3542ad08955a9dde40db8030`

The successor ports the existing read-only auditor improvements from #1134 and adds:

1. `selected_worker` and `next_worker` structured-field aliases.
2. Canonical worker-name prefix resolution.
3. A positive regression using the actual Kestrel receipt header dialect.
4. A negative regression proving that an incorrect next-worker value is rejected.
5. An expanded built-in self-test count of 24 (previously 22).
6. Existing workflow coverage for the auditor on relevant pushes and pull requests.

PR #1173 is open and draft. At the publication snapshot it was 3 commits ahead and 6 behind `11d483c611cff51dd63756b83d55733737df0644`. At final comparison it was 3 commits ahead and 17 behind current main (`c9326983639900a366944a2979d4aea2e7183f7f`); GitHub reports `mergeable=true`. No merge was attempted. The published report is a timestamped snapshot; this later comparison is recorded here.

The stale PR #1134 was closed as superseded, not merged. Its historical work and discussion remain preserved.

## Verification and limitations

A local Python replay of the 24-check suite passed, including the Kestrel positive/negative case and `py_compile`. However, the executed local file was a source-derived transcription whose Git blob hash did not match the exact repository blob. This is **not** claimed as exact-source execution.

GitHub Actions did not start from connector-authored branch commits. No workflow-dispatch action was available in this runtime. The full current-tree audit (`--root . --json`) therefore remains **NOT RUN**.

Do not merge PR #1173 until an exact-source run of `--self-test` and a full current-tree audit are independently completed and reviewed. The local replay is preliminary evidence only.

## Publication status

- Initial publisher intake #1174 was rejected for an invalid schema; no artifact was created.
- Corrected-schema retry #1175 was rejected for SHA-256 mismatch and closed; no artifact was created.
- Corrected retry #1176 was published by the existing issue publisher.
- Publisher issue: #1176; comment: #6549689649.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-revrot-worker-field-dialect-20261031t2136z-s3-002.md`.
- Publisher commit: `2d4a0da2db24a1e1718cb396a1855fd09fbbe065`.
- Artifact Git blob: `00cf9f19043f40416b576d58cd95343bcf5c9060`.
- SHA-256: `f41a8abf89e1984a64aadc13549ad052cb1b5993dcb8f690f96359714713d386`.
- Exact source-report/artifact content comparison: PASS; publisher readback: VERIFIED.
- Status: `PUBLISHED_VERIFIED`; #1174 and #1175 remain rejected/closed audit records. No duplicate artifact.
- PR #1173 remains the public code-review surface; no separate publication artifact is claimed.

## Boundaries

- Existing :36 automation remains enabled and unchanged.
- No sixth task or automation was created.
- No scheduler, task, ID, cadence, theory, BEDROCK, SAT-O, Blockwave, manuscript, or paper-gate changes.
- No physical calculation or prediction.
- Repository artifacts do not establish ChatGPT-thread delivery or recipient consumption.
- No new tool or dependency was introduced.
