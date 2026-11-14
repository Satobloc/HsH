# Kestrel h835:s0 receipt amendment 02 | Existing Lean run log verified

**Run key:** REVROT3-19-20261011:835:s0  
**Scope:** verify the existing Kestrel fiber-factorization theorem's recorded actual build; no new theorem or CI dispatch.

- Existing PR: [#873](https://github.com/Satobloc/HsH/pull/873), OPEN / DRAFT / UNMERGED.
- Actions run: #43202552666.
- Job: #131129411360, verify, completed/success.
- Source commit: 7ca33453a6fc74f8e165821abac942414ef9546b.
- Lean: 4.34.0; Lake: 5.0.0.
- Lake build: SUCCESS, 8,957 jobs.
- Actual job steps include install Elan, checkout, generate Lake dependency manifest, and compile formal library.
- Tests and lint were skipped. Nanoda, leanchecker, reservoir eligibility, and global axiom audit were disabled/skipped. This is not a global axiom-free audit.
- The exact theorem hallway_factorization_iff_fiber_compatibility reports dependency on Classical.choice; hallway_factorization_unique reports Quot.sound. Other declarations in the same module have their own reported dependencies, including propext and Classical.choice.
- The build is a PR-associated merge-reference build on an older base, not current-main integration and not a fresh exact-head build.

The theorem remains conditional: it checks existence of a downstream factorization exactly when the downstream map is constant on upstream fibers. It does not establish any H(s)H physical map, source translation, or physical premise. No new Lean module, PR, build, or theory promotion was performed.
