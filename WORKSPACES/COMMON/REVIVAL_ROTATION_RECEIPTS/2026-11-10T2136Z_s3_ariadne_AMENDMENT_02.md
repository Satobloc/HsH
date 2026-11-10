# Receipt Amendment 02 — formalization scope clarification

The public issue #1569 now carries clarification comment #6780253510.

PR #1133's Lean module formalizes the factorization criterion for its explicitly defined joint-state projections to the tube-only and sheet-only quotients. It proves that a readout descends through those particular quotients iff it is constant on the corresponding same-tube or same-sheet fibers, and proves the associated sensitivity obstructions.

It does not formalize an arbitrary sequence of representation maps, instantiate an H(s)H physical map, or prove that a real measurement pipeline satisfies the criterion. The composite-map requirement in the public note is an architectural admission condition; any physical map chain and any broader composition theorem remain to be specified and, where needed, separately formalized and compiled.

No new Lean theorem or build was performed in this run. The successful PR-triggered run #42738871882 applies to the existing PR #1133 formalization only. This clarification narrows the claim; it does not change the scientific or campaign disposition.
