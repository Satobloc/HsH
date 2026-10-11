# Tern independent technical review — MK171 / Issue #18
**Date:** 2026-10-11. **Reviewer:** Comptroller Tern Rook. **Status:** SUBSTANTIVE MANUSCRIPT REVIEW DELIVERED; PUBLISHED-COMPARATOR DEEP READ BLOCKED; SANDBOXED. **Do not claim full independent comparator review.**

## Requested verdict, carefully scoped
**For whether MK171 presently constitutes a stronger physical paper than the Susskind comparator: NO is supportable as a demand for demonstrated physical content, but a full paper-to-paper ranking remains INCOMPARABLE/UNVERIFIED until the Susskind original is read.** The MK171 physical bridge is missing, independent of the comparator's particulars. The authors' self-review already says this.

- **Mathematical correctness:** PASS for the ideal Aharonov–Bohm ring and separately *assumed* momentum-dephasing formulas; does not verify finite-core/HsH derivation.
- **Source fidelity:** PASS on MK171's explicit disclaimer that the ring model is standard QM and noise generator is postulated. Susskind's exact claims/equations/page references have **NOT** been inspected, so no source fidelity verdict for that paper.
- **Derivation:** Ring spectral arithmetic is self-contained; deriving the ring's U(1) holonomy from a 4D time-normal/worldtube is ABSENT.
- **Novelty:** NOT ESTABLISHED; rational spectral commensurability is a textbook ideal model, and arithmetic compactness alone is not novel physics.
- **Falsifiability:** The predicted factor-two revival ratio is testable *for the already specified ideal ring*, but not distinct from ordinary AB physics; no derived SAT/HsH prediction or geometric correction.
- **Clarity:** Good bounded benchmark and honest caveats; paper framing must not imply the result explains or models time-orientation reversal.

## Exactly checked mathematics
Let `E_n = ℏ²(n+α)²/(2mR²)`, n ∈ Z, α=p/q reduced. Universal return up to one global phase requires
`[ℏ T/(4πmR²)](n²+2αn) ∈ Z` for all n. Define `k=ℏ T/(2πmR²)`. The consecutive-difference criterion yields `k ∈ Z` and `k(q+2p)/(2q) ∈ Z`, giving
`T=(2πmR²/ℏ)×2q/gcd(q+2p,2q)`.
For α=0, k=2; for α=1/2, k=1. Python independent exact-fraction check scanned coprime p/q with q≤30, −2q≤p≤2q and n from −60 to 60, with no counterexamples or smaller positive integer k. Using m_e=9.1093837139e−31 kg, ℏ=1.054571817e−34 J·s, R=100 nm, T(0)=1.085482183 ns and T(1/2)=0.542741092 ns. The minimal period for generic irrational α does not exist in this all-n exact-revival sense.

For `dotρ=−(i/ℏ)[H,ρ]−D[N,[N,ρ]]`, with dimensionless N|n〉=n|n〉 and D≥0 [time⁻¹], the coherence ρ_nm acquires `e^(−D(n−m)²T)`; for the normalized |0〉+|1〉 superposition, clean-time fidelity is `(1+e^(−DT))/2`. This is the behavior of a *posited Markovian channel*; no gravitational stochasticity is derived.

## Strongest independent counterexample / typing defect
The ring's `e^{i2πα}` is U(1) electromagnetic/gauge phase holonomy on a charged complex line. A clock/time-orientation reversal requires a distinct transported object and, for a discrete orientation sign, a Z₂ principal bundle/local system and nontrivial sign holonomy. There is no nontrivial **continuous** group homomorphism `U(1)→Z₂` (connected group to discrete group), so identifying the special AB phase `−1` at α=1/2 with a time-arrow reversal by notation alone has no derived physical content. Time reversal in quantum mechanics also has antiunitary structure, not generic U(1) multiplication.

Internal precedent **MK152** proves the relevant choice of time-normal typing cannot be skipped. A global oriented unit field `u:M→S³` gives a trivial oriented line `span(u)`; ordinary loops have no nontrivial first Stiefel–Whitney class for that line. Its unrestricted `π₁(S³)=0` permits escape from apparent planar winding. If only the Householder metric `g=I−2uuᵀ` is physical, the director `[u]∈RP³` instead has `π₁(RP³)=Z₂`; but *this quotient removes the physically oriented future-arrow information.* Nontrivial projective winding and a physical clock-transport coupling would still need a specified geometric and dynamical model. This is a constructive fork, not proof of the desired de Sitter physics.

**Required rewrite:**
1. Specify whether time-normal is oriented u or projective director [u], with physical justification and exact domain/defect admissibility.
2. Identify the physical transport bundle, connection, loop family, holonomy element (U(1), Z₂, Pin/spin or a stated product) and coupled charged/clock states; no substitution of one for another.
3. Derive α from the SAT/HsH construction instead of inserting an AB flux externally; compute a state-to-state observable beyond standard ideal-ring revival, including null/flat controls and uncertainties.
4. If invoking stochastic clock effects, derive the complete-positive dynamical generator and D from the model rather than stipulate `−D[N,[N,ρ]]`.
5. Only then compare page/equation against the full original Susskind paper, including its actual causal patch/gauge/time-reversal assumptions, not merely the paper's title or a secondhand abstract. Do not claim Susskind makes a nonorientable-spacetime claim unless primary text establishes it.

## Source ledger / limits
- **Read complete:** `WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/MK171_PROPOSAL_R0.md`, SHA `4959f749a3d97bc7729fff2b04702386c902222e`; `MK171_2026-10-08_CHECKPOINT.md` SHA `b072001730a2e9a50ab133a9a078b7efe90289b9`; `MK171_SELF_HOSTILE_R0_TO_R1.md` SHA `e6098e27116608ec18353e842f74aad5e6316447`; `MK152_2026-10-08_TIME_NORMAL_ESCAPE_Z2.md` SHA `56bdddbbbc1e5b11c46facb979f8ff0a44c8ee02`; `MK159_2026-10-08_DUAL_CONNECTION_HOLONOMY.md` SHA `e40379007cda9a0e3823d801b9e25e901f388cda`; `MK160_2026-10-08_TIMELIKE_TRANSPORT_TRIPLE_SHORT.md` SHA `c37abb47a064353323123eee785fb4a7676c16c4`.
- **Targeted primary SAT reads, not FULL:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt` 80–190; HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt` 900–1060. These contain substantial AI-generated prose; no blanket Nathan authorship/authority assigned.
- **Published comparator located but not read:** Susskind arXiv:2603.12434, `HSH_RESOURCES/PRIOR_ART/2603.12434v1.pdf` SHA `af8170f1a684f509e013d93a2c765575d95965f9`, same-content duplicate `LENNY 2603.12434v1 (1).pdf`. The GitHub connector yielded no decoded binary/text and HSH_RESOURCES extracted-text manifest lacks this item. The newer 2026-10-09 PRIOR_ART per-item access rule permits non-forbidden items conditionally after internal search, but does not convert file presence into a paper read. Hypothesis H proper and directly Schreiber-authored sources remain off limits.
- **Search coverage:** Mersearch's three-repo bridge is occupied by Orson's `2026-10-11-orson-morrow-inspiral-package-001`; not overwritten. Known-path source reading and repo-native listings were used. No claim of three-repo exhaustive semantic search.

**Status summary:** useful independent adversarial MK171 review, **not** completion of the publication-comparator portion of issue #18. Await accessible full primary text for equation/page-anchored comparative closure; do not claim issue closed. No novel HsH prediction or independent published superiority established.
