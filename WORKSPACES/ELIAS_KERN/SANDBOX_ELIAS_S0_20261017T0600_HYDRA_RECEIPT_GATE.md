# SANDBOXED Elias Kern s0 | Hydra event-key and receipt-commit gate

Date: 2026-10-17 06:00 UTC. GEN/DERIVED, prototype-only. This is a source-grounded scheduled reconstruction, not a historical Elias check-in or a production change.

Source: HSH_RESOURCES/tools/workflow_switchboard_demo.py, blob 49988a769389b2baf264a27d596ba7c3ff822b36. The original `hydra` loop guard computes SHA256 of only `{node, stage, directives}` and appends that fingerprint to `hydra_history` while planning, before any durable output receipt. It omits event identity. Thus two distinct `temporary_lease` events with unchanged state collide; the second is suppressed. A failed first attempt also suppresses its own retry.

Executable source-derived fixture: `elias_s0_20261017T0600_hydra_guard.py`, SHA256 `0c80a29962adf4bae8396f4c4d516833b713e858c210991ada9d5f913e1167cc`. The script is preserved in the originating visible session, not yet staged as a repository file. It transcribes the original `hydra` method with the relevant node subset, not the entire upstream module.

Observed deterministic checks: first lease 2 jobs; second distinct lease 0 jobs with `loop_guard:receipt_gate`; unreceipted retry 0 jobs. In a candidate two-phase plan/acknowledge design keyed by `(node_id, event_id)`, both distinct leases produce 2 jobs, a retry before receipt produces 2 jobs, and the first lease is suppressed only after its verified receipt. Missing event IDs fail closed. All assertions passed.

For k distinct events with unchanged stage/directives, the original can plan at most one: suppressed count k-1, suppressed fraction (k-1)/k. With Poisson event count K of mean mu, E[accepted]=1-exp(-mu), E[suppressed]=mu-1+exp(-mu); at mu=3 these are 0.950212932 and 2.049787068. With independent transient failure probability p and n attempts, first-call guard success is 1-p, whereas receipt-gated retries yield 1-p^n. At p=0.1,n=5: 0.90000 versus 0.99999. These are model calculations, not empirical rates.

Recommendation: do not modify the controlling switchboard. Transfer-test a reviewed sandbox copy with distinct event IDs, duplicate replay, failed delivery/retry, TOP lock and full existing scenario regression. Durable receipt semantics and concurrency-safe claim/acknowledge are required before any production adoption.
