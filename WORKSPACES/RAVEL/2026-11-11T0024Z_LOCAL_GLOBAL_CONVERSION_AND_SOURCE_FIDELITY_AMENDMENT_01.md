# Amendment 01 — corrected Lean parameterization and current CI state

**Applies to:** `2026-11-11T0024Z_LOCAL_GLOBAL_CONVERSION_AND_SOURCE_FIDELITY.md`.

The first build attempt (`42932603331`) failed because Greek `λ` was used as an identifier; downstream parser errors prevented the main theorem from elaborating. The identifier was renamed to `rep`.

The next build (`42933172543`) reached the new module and exposed a separate Lean elaboration error: `ReadoutValue` was not available as an explicit parameter of the `Observable` structure. `Time` and `ReadoutValue` are now explicit parameters of the `Evolution` and `Observable` structures. The source also uses no `sorry`, `admit`, or `native_decide` token.

Corrected branch head: `aa13715efd5dbd90432cd619cf410be7928e8b82`. Current verification run: `42933770097`. At this amendment's last observation it was still before the Lean compile step, with checkout in progress. **Compilation and theorem axiom reports remain UNVERIFIED.**

No physical premise, source attribution, theory status, task, branch base, or paper gate was changed. The earlier failures are source/elaboration failures, not physical counterexamples.
