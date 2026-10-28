# Historical SATx scalar potential / Z3 mass-map fidelity gate

**Status:** historical assistant-source mathematical audit; no physical validation, no BEDROCK promotion.

Original SAT archive: `SAT X/SATx CANONICAL.txt` blob `afbf610347a6a39c74cf52cbe3818ef22ab3ebcf`, `FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt` blob `9d5db44f16f1f2d853332efd8d91995a37e8d394`; HsH historical synthesis `SAT Full Revamp.txt` blob `2094f6d51c9f407a575a18057ec8330c4ae2ca72`. Nathan Direct BEDROCK BR-005 defines θ₄=0 aligned with the time normal; the scalar potential and quotient law are historical assistant reconstruction, not Nathan Direct.

The printed scalar action contains `Lpot=-μ² cos(3θ)`. Under `L=K−V`, it implies `V=+μ² cos(3θ)`, contrary to a later source's `V=-μ² cos(3θ)`. The standard Euler–Lagrange scalar potential contribution is `−3μ² sin(3θ)` for this action, whereas SATx Module 2 prints `+μ² sin(3θ)`. The earlier EQI-0002 audit already established the sign inconsistency in another historical variant; this is a cross-source variant comparison, not a duplicate discovery.

**Newer structural discrepancy:** The synthesis explicitly identifies θ with θ+2π/3, but its mass readout `m∝sin²θ` does not respect that identification: `sin²0=0` versus `sin²(2π/3)=3/4`. The threefold potential is periodic under that shift. Either the sectors are distinct, the identification is only a potential symmetry, or the mass observable requires a new map. No repair is assumed.

Source-based exact SymPy symbolic verification executed and passed. Draft Lean PR #831 formalizes four conditional potential comparisons; actual CI must be checked before calling them compiled. Quotient obstruction is not yet Lean formalized. No empirical measurements or CODATA scoring were performed. No real physical prediction, known-physics equivalence or independent validation follows.

**Next:** recover original role-tagged source generation and later corrections, independently review the quotient-vs-sector distinction, and formalize the quotient counterexample in existing Lean infrastructure.
