# Quarry 077 — Three-coil full twist as a topological link budget

Status: SANDBOX / not canonical.

## Provenance actually read
- Old SAT: `SAT_THEORY_ARCHIVE_2023-25/[[[SAT_2025_DERIV]]].txt`, blob `2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1`, lines 1–900 requested/read. Retained: the explicit topology diagnostic `Q = L_wind + L_link + W_writhe`, examples including Hopf/Borromean/trefoil, and the demand to derive phase binding/monodromy rather than merely assign it. Historical calibrated particle targets were excluded.
- Current H(s)H: `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT-Y 4D.txt`, blob `9806853dd09ca6b36bcfc530d8333bed53d956c5`, lines 1–1000 requested/read. Retained: the explicit three-filament, 120-degree phase-offset helical composite construction and its use as a 4D structural mapper. Quark/flavor/color assignments and mass-angle estimates were not used as targets.

## Independent construction
Close three equal phase-offset helices by the simplest periodic toroidal closure. The resulting three-component link is the full-twist torus link T(3,3). A direct numerical Gauss-linking integral gives |Lk_ij|=1 for every unordered pair, with the sign fixed only by orientation convention. Thus the three-strand full twist has total absolute pairwise linking budget 3.

For n strands under one rigid full twist, every unordered pair links once:
```
L_pair(n) = C(n,2) = n(n-1)/2.
```
For k full twists, `|Lk_ij|=|k|` and `L_pair=|k| n(n-1)/2`.

## H(s)H translation / conjecture
A multi-filament "bundle winding" is not just a visual coil count. After legitimate closure it induces a deterministic pairwise linking matrix. Therefore the old SAT quantity `L_wind + L_link` risks double-counting if the winding term is the same rigid bundle twist that generates the linking term.

Candidate repair: decompose topological bookkeeping into independent invariants only after specifying closure and framing. Treat rigid bundle twist as a generator whose induced pairwise link matrix is calculated, not added again as an independent charge.

## Failure condition
If the physically appropriate H(s)H closure is not isotopic to the toroidal full-twist closure, or if the strands are open histories for which no closure is physically/gauge canonically selected, the integer link budget is closure-dependent and cannot be promoted.

## Tight next test
Take current finite-core three-coil embeddings, close them by each admissible resolver/history closure, compute the full Gauss linking matrix and self-linking/framing data, and test whether `L_wind`, `L_link`, and `W_writhe` are independent or algebraically coupled. A robust SAT/H(s)H charge must be invariant under all admissible closure choices or explicitly include the closure as physical data.
